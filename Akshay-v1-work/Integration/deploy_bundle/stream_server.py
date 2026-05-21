"""
stream_server.py
================
FPGA Streaming Inference Server — runs on the PYNQ board.

Listens on TCP port 5005 for connections from the stream_client_*.py scripts
on the laptop.  One overlay is active at a time; it is reloaded automatically
when a different model is requested.

Protocol (one inference per exchange):
  1. Client -> Server: JSON header line  {"model":"mlp","size":N}\\n
  2. Client -> Server: N bytes of raw payload
  3. Server -> Client: JSON result line  {...}\\n
  Repeat for continuous streaming.

Usage on the board:
  python stream_server.py [--host 0.0.0.0] [--port 5005]
"""

import argparse
import io
import json
import os
import re
import socket
import sys
import tempfile
import threading
import time
from pathlib import Path

import numpy as np
from pynq import Overlay, allocate

BASE_DIR = Path(__file__).resolve().parent


def _load_overlay(bit_path: str) -> Overlay:
    """Load a PYNQ overlay — tries multiple approaches for 2.x/3.x compatibility."""
    # PYNQ 3.x uses asyncio; ensure an event loop exists in the calling thread.
    import asyncio
    try:
        asyncio.get_running_loop()
    except RuntimeError:
        asyncio.set_event_loop(asyncio.new_event_loop())

    errors = []

    # Approach 1: bare Overlay() — standard PYNQ 2.x embedded path
    try:
        return Overlay(bit_path)
    except Exception as e1:
        errors.append(f"bare: {e1}")

    # Approach 2: explicit Device.devices[0] — PYNQ 3.x
    try:
        from pynq import Device as _D
        devs = _D.devices
        if devs:
            _D._active_device = devs[0]
            return Overlay(bit_path, device=devs[0])
        errors.append("Device.devices: empty list")
    except Exception as e2:
        errors.append(f"Device.devices: {e2}")

    # Approach 3: EmbeddedDevice — PYNQ 3.x Zynq-7000
    # Also sets Device._active_device so that allocate() works afterwards.
    try:
        from pynq.pl_server.embedded_device import EmbeddedDevice
        from pynq import Device as _D
        _dev = EmbeddedDevice()
        _D._active_device = _dev          # <-- makes allocate() find the device
        return Overlay(bit_path, device=_dev)
    except Exception as e3:
        errors.append(f"EmbeddedDevice: {e3}")

    raise RuntimeError("All Overlay load attempts failed: " + " | ".join(errors))

# ── Overlay state (one active at a time) ─────────────────────────────────────
_state        = {}
_state_lock   = threading.Lock()
_active_model = None

# =============================================================================
# MLP — Siren Classifier (ambulance / firetruck)
# =============================================================================
_MLP_DIR      = BASE_DIR / "models" / "mlp"
_MLP_N_IN     = 41
_MLP_SCALE    = 4096.0
_MLP_CLASSES  = ["ambulance", "firetruck"]
_MLP_SR       = 16000
_MLP_NPERSEG  = 512
_MLP_NOVERLAP = 256
_MLP_SPEC_BANDS   = [(0,500),(500,1000),(1000,2000),(2000,4000),
                     (4000,6000),(6000,8000),(8000,10000),(10000,16000)]
_MLP_ENERGY_BANDS = [(0,300),(300,1000),(1000,3000),(3000,8000)]


def _load_mlp():
    from scipy.io import wavfile
    from scipy.signal import resample, spectrogram, hann as scipy_hann
    bit = _MLP_DIR / "mlp_accelerator.bit"
    hwh = _MLP_DIR / "mlp_accelerator.hwh"
    if not bit.exists():
        raise FileNotFoundError(f"MLP bitfile not found: {bit}")
    if not hwh.exists():
        raise FileNotFoundError(f"MLP .hwh not found: {hwh}")
    overlay = _load_overlay(str(bit))
    dma     = overlay.axi_dma_0
    sf = _MLP_DIR / "feature_stats.npz"
    if sf.exists():
        s = np.load(sf)
        feat_mean = s["mean"].astype(np.float32)
        feat_std  = s["std"].astype(np.float32)
    else:
        feat_mean = np.zeros(_MLP_N_IN, dtype=np.float32)
        feat_std  = np.ones(_MLP_N_IN,  dtype=np.float32)
        print("[mlp] WARNING: feature_stats.npz not found — using identity normalisation")
    _state["mlp"] = dict(overlay=overlay, dma=dma, feat_mean=feat_mean, feat_std=feat_std,
                         wavfile=wavfile, resample=resample,
                         spectrogram=spectrogram, hann=scipy_hann)
    print("[mlp] overlay loaded")


def _mlp_features(wav_path):
    st = _state["mlp"]
    sr, data = st["wavfile"].read(wav_path)
    if data.dtype == np.int16:
        data = data.astype(np.float32) / 32768.0
    elif data.dtype == np.int32:
        data = data.astype(np.float32) / 2147483648.0
    else:
        data = data.astype(np.float32)
    if data.ndim == 2:
        data = data.mean(axis=1)
    peak = np.abs(data).max()
    if peak > 1e-8:
        data /= peak
    if sr != _MLP_SR:
        data = st["resample"](data, int(len(data) * _MLP_SR / sr))
    freqs, _, Sxx = st["spectrogram"](
        data, fs=_MLP_SR, window=st["hann"](_MLP_NPERSEG),
        nperseg=_MLP_NPERSEG, noverlap=_MLP_NOVERLAP,
        scaling="spectrum", mode="magnitude")
    Sxx = np.log1p(Sxx)
    feats = []
    for flo, fhi in _MLP_SPEC_BANDS:
        m = (freqs >= flo) & (freqs < fhi)
        b = Sxx[m, :].flatten() if m.any() else np.zeros(1)
        feats += [np.mean(b), np.std(b), np.percentile(b, 25), np.percentile(b, 75)]
    abs_d = np.abs(data)
    feats += [np.mean(data), np.std(data), np.mean(abs_d), np.max(abs_d),
              np.percentile(abs_d, 90)]
    for flo, fhi in _MLP_ENERGY_BANDS:
        m = (freqs >= flo) & (freqs < fhi)
        bm = Sxx[m, :].mean(axis=0) if m.any() else np.zeros(1)
        feats.append(float(np.mean(bm)))
    return np.array(feats, dtype=np.float32)


def infer_mlp(payload: bytes):
    st = _state["mlp"]
    tmp = tempfile.mktemp(suffix=".wav")
    try:
        with open(tmp, "wb") as f:
            f.write(payload)
        feats = _mlp_features(tmp)
        x = (feats - st["feat_mean"]) / (st["feat_std"] + 1e-8)
        q = np.clip(np.round(x * _MLP_SCALE), -32768, 32767).astype(np.int16)
        q = q.astype(np.uint16).astype(np.uint32)
        in_buf  = allocate(shape=(_MLP_N_IN,), dtype=np.uint32)
        out_buf = allocate(shape=(1,), dtype=np.uint32)
        np.copyto(in_buf, q)
        t0 = time.perf_counter()
        st["dma"].sendchannel.transfer(in_buf)
        st["dma"].recvchannel.transfer(out_buf)
        st["dma"].sendchannel.wait()
        st["dma"].recvchannel.wait()
        ms   = (time.perf_counter() - t0) * 1000.0
        pred = int(out_buf[0]) & 0x1
        in_buf.freebuffer(); out_buf.freebuffer()
        return _MLP_CLASSES[pred], pred, ms
    finally:
        if os.path.exists(tmp):
            os.unlink(tmp)


# =============================================================================
# CNN — Traffic Sign Classifier (43 classes)
# =============================================================================
_CNN_DIR = BASE_DIR / "models" / "cnn"
_CNN_CLASS_NAMES = {
    0: "Speed limit (20km/h)",   1: "Speed limit (30km/h)",
    2: "Speed limit (50km/h)",   3: "Speed limit (60km/h)",
    4: "Speed limit (70km/h)",   5: "Speed limit (80km/h)",
    6: "End speed limit (80)",   7: "Speed limit (100km/h)",
    8: "Speed limit (120km/h)",  9: "No passing",
    10: "No passing >3.5t",     11: "Right of way at junction",
    12: "Priority road",        13: "Yield",
    14: "Stop",                 15: "No vehicles",
    16: "Vehicles >3.5t prohibited", 17: "No entry",
    18: "General caution",      19: "Dangerous curve left",
    20: "Dangerous curve right",21: "Double curve",
    22: "Bumpy road",           23: "Slippery road",
    24: "Road narrows right",   25: "Road work",
    26: "Traffic signals",      27: "Pedestrians",
    28: "Children crossing",    29: "Bicycles crossing",
    30: "Beware ice/snow",      31: "Wild animals crossing",
    32: "End of restrictions",  33: "Turn right ahead",
    34: "Turn left ahead",      35: "Ahead only",
    36: "Go straight or right", 37: "Go straight or left",
    38: "Keep right",           39: "Keep left",
    40: "Roundabout mandatory", 41: "End of no passing",
    42: "End no passing >3.5t",
}


def _load_cnn():
    bit = _CNN_DIR / "cnn_accelerator.bit"
    hwh = _CNN_DIR / "cnn_accelerator.hwh"
    fc  = _CNN_DIR / "cnn_fc_weights.npz"
    if not bit.exists():
        raise FileNotFoundError(f"CNN bitfile not found: {bit}")
    if not hwh.exists():
        raise FileNotFoundError(f"CNN .hwh not found: {hwh}")
    if not fc.exists():
        raise FileNotFoundError(f"CNN FC weights not found: {fc}")
    overlay = _load_overlay(str(bit))
    dma     = overlay.axi_dma_0
    fc_data = np.load(fc)
    _state["cnn"] = dict(
        overlay=overlay,
        dma=dma,
        fc1_w=fc_data["fc1_w"],
        fc1_b=fc_data["fc1_b"],
        fc2_w=fc_data["fc2_w"],
        fc2_b=fc_data["fc2_b"],
    )
    print("[cnn] overlay loaded")


def infer_cnn(payload: bytes):
    from PIL import Image as PILImage
    st = _state["cnn"]
    img = PILImage.open(io.BytesIO(payload)).convert("RGB").resize((32, 32))
    arr = np.array(img, dtype=np.float32) / 255.0
    arr = (arr - 0.5) / 0.5
    arr = np.transpose(arr, (2, 0, 1))
    q8 = np.array([int(v * 256) & 0xFFFF for v in arr.flatten()], dtype=np.uint32)
    in_buf  = allocate(shape=(3072,), dtype=np.uint32)
    out_buf = allocate(shape=(2048,), dtype=np.uint32)
    np.copyto(in_buf, q8)
    in_buf.flush()
    t0_hw = time.perf_counter()
    st["dma"].sendchannel.transfer(in_buf)
    st["dma"].recvchannel.transfer(out_buf)
    st["dma"].sendchannel.wait()
    st["dma"].recvchannel.wait()
    t1_hw = time.perf_counter()
    out_buf.invalidate()
    hw_feat = np.array(out_buf, dtype=np.int16).astype(np.float32) / 256.0
    t0_sw = time.perf_counter()
    fc1_out = np.maximum(0, np.dot(hw_feat, st["fc1_w"].T) + st["fc1_b"])
    fc2_out = np.dot(fc1_out, st["fc2_w"].T) + st["fc2_b"]
    pred = int(np.argmax(fc2_out))
    t1_sw = time.perf_counter()
    in_buf.freebuffer()
    out_buf.freebuffer()
    hw_ms = (t1_hw - t0_hw) * 1000.0
    total_ms = hw_ms + ((t1_sw - t0_sw) * 1000.0)
    return _CNN_CLASS_NAMES.get(pred, f"Class {pred}"), pred, hw_ms, total_ms


# =============================================================================
# BNN — CAN Vehicle Classifier (OpelAstra / Prototype / RenaultClio)
# =============================================================================
_BNN_DIR     = BASE_DIR / "models" / "bnn"
_BNN_N_IN    = 169
_BNN_SCALE   = 256
_BNN_CLASSES = ["OpelAstra", "Prototype", "RenaultClio"]
_BNN_WIN     = 256
_BNN_BINS    = 128
_CAN_RE      = re.compile(r'^\(([^)]+)\)\s+\S+\s+([0-9A-Fa-f]+)#([0-9A-Fa-f]*)$')


def _load_bnn():
    bit = _BNN_DIR / "bnn_accelerator.bit"
    hwh = _BNN_DIR / "bnn_accelerator.hwh"
    if not bit.exists():
        raise FileNotFoundError(f"BNN bitfile not found: {bit}")
    if not hwh.exists():
        raise FileNotFoundError(f"BNN .hwh not found: {hwh}")
    overlay = _load_overlay(str(bit))
    dma     = overlay.axi_dma_0
    sf = _BNN_DIR / "bnn_can_feature_stats.npz"
    if sf.exists():
        s = np.load(sf)
        feat_mean = s["mean"].astype(np.float32)
        feat_std  = s["std"].astype(np.float32)
    else:
        feat_mean = np.zeros(_BNN_N_IN, dtype=np.float32)
        feat_std  = np.ones(_BNN_N_IN,  dtype=np.float32)
    _state["bnn"] = dict(overlay=overlay, dma=dma, feat_mean=feat_mean, feat_std=feat_std)
    print("[bnn] overlay loaded")


def _bnn_features(messages):
    timestamps = np.array([m[0] for m in messages], dtype=np.float64)
    ids        = np.array([m[1] for m in messages], dtype=np.float32)
    payloads   = [m[2] for m in messages]
    id_hist = np.zeros(_BNN_BINS, dtype=np.float32)
    for cid in ids:
        id_hist[int(cid) % _BNN_BINS] += 1
    s = id_hist.sum()
    if s > 0:
        id_hist /= s
    len_hist = np.zeros(9, dtype=np.float32)
    for p in payloads:
        len_hist[min(len(p), 8)] += 1
    all_bytes = [b for p in payloads for b in p]
    if all_bytes:
        ab = np.array(all_bytes, dtype=np.uint8)
        nh = np.zeros(8, dtype=np.float32)
        nl = np.zeros(8, dtype=np.float32)
        for v in (ab >> 4) & 0xF:
            if v < 8: nh[v] += 1
        for v in ab & 0xF:
            if v < 8: nl[v] += 1
        nibble_hist = np.concatenate([nh, nl])
        ns = nibble_hist.sum()
        if ns > 0: nibble_hist /= ns
    else:
        nibble_hist = np.zeros(16, dtype=np.float32)
    n = len(messages)
    unique_ids = len(set(int(i) for i in ids))
    id_counts  = {}
    for i in ids: id_counts[int(i)] = id_counts.get(int(i), 0) + 1
    sc = sorted(id_counts.values(), reverse=True)
    plen = np.array([len(p) for p in payloads], dtype=np.float32)
    if len(timestamps) > 1:
        d = np.diff(timestamps)
        dm, ds = float(np.mean(d)), float(np.std(d))
        dp, dx = float(np.percentile(d, 75)), float(np.max(d))
    else:
        dm = ds = dp = dx = 0.0
    if all_bytes:
        ab_f = np.array(all_bytes, dtype=np.float32)
        bm, bs = float(np.mean(ab_f)), float(np.std(ab_f))
        bp = float(np.percentile(ab_f, 75))
        fz, ff = float(np.mean(ab_f == 0)), float(np.mean(ab_f == 255))
    else:
        bm = bs = bp = fz = ff = 0.0
    stats = np.array([
        unique_ids / n if n > 0 else 0.0,
        float(np.mean(ids)), float(np.std(ids)),
        sc[0] / n if sc else 0.0,
        sum(sc[:3]) / n if len(sc) >= 3 else (sc[0] / n if sc else 0.0),
        dm, ds, dp, dx,
        float(np.mean(plen)), float(np.std(plen)),
        bm, bs, bp, fz, ff,
    ], dtype=np.float32)
    return np.concatenate([id_hist, len_hist, nibble_hist, stats])


def infer_bnn(payload: bytes):
    st = _state["bnn"]
    messages = []
    for line in payload.decode("utf-8", errors="replace").splitlines():
        m = _CAN_RE.match(line.strip())
        if m:
            messages.append((
                float(m.group(1)),
                int(m.group(2), 16),
                bytes.fromhex(m.group(3)) if m.group(3) else b"",
            ))
    if len(messages) < _BNN_WIN:
        raise ValueError(f"Only {len(messages)} CAN messages; need at least {_BNN_WIN}")
    feats = _bnn_features(messages[:_BNN_WIN])
    x = (feats - st["feat_mean"]) / (st["feat_std"] + 1e-8)
    q = np.clip(np.round(x * _BNN_SCALE), -32768, 32767).astype(np.int16)
    q = q.astype(np.uint16).astype(np.uint32)
    in_buf  = allocate(shape=(_BNN_N_IN,), dtype=np.uint32)
    out_buf = allocate(shape=(1,), dtype=np.uint32)
    np.copyto(in_buf, q)
    t0 = time.perf_counter()
    st["dma"].sendchannel.transfer(in_buf)
    st["dma"].recvchannel.transfer(out_buf)
    st["dma"].sendchannel.wait()
    st["dma"].recvchannel.wait()
    ms   = (time.perf_counter() - t0) * 1000.0
    pred = int(out_buf[0]) & 0x3
    in_buf.freebuffer(); out_buf.freebuffer()
    label = _BNN_CLASSES[pred] if pred < len(_BNN_CLASSES) else f"Class{pred}"
    return label, pred, ms


# =============================================================================
# SVM — Lane Change Classifier (Keep Lane / Lane Change)
# =============================================================================
_SVM_DIR     = BASE_DIR / "models" / "svm"
_SVM_CLASSES = ["Keep Lane", "Lane Change"]
_SVM_N_FEATS = 10


def _load_svm():
    bit = _SVM_DIR / "svm_accelerator.bit"
    hwh = _SVM_DIR / "svm_accelerator.hwh"
    if not bit.exists():
        raise FileNotFoundError(f"SVM bitfile not found: {bit}")
    if not hwh.exists():
        raise FileNotFoundError(f"SVM .hwh not found: {hwh}")
    overlay = _load_overlay(str(bit))
    dma     = overlay.axi_dma_0
    _state["svm"] = dict(overlay=overlay, dma=dma)
    print("[svm] overlay loaded")


def infer_svm(payload: bytes):
    import pandas as pd
    st = _state["svm"]
    df = pd.read_csv(io.StringIO(payload.decode("utf-8", errors="replace")))
    feature_cols = [c for c in df.columns if c.lower() != "label"]
    results = []
    for _, row in df.iterrows():
        feats = row[feature_cols].tolist()
        if len(feats) < _SVM_N_FEATS:
            feats = feats + [0.0] * (_SVM_N_FEATS - len(feats))
        else:
            feats = feats[:_SVM_N_FEATS]
        qs = np.array([int(round(v * 256)) & 0xFFFF for v in feats], dtype=np.uint32)
        in_buf  = allocate(shape=(_SVM_N_FEATS,), dtype=np.uint32)
        out_buf = allocate(shape=(1,), dtype=np.uint32)
        np.copyto(in_buf, qs)
        t0 = time.perf_counter()
        st["dma"].sendchannel.transfer(in_buf)
        st["dma"].recvchannel.transfer(out_buf)
        st["dma"].sendchannel.wait()
        st["dma"].recvchannel.wait()
        ms   = (time.perf_counter() - t0) * 1000.0
        pred = int(out_buf[0]) & 0x1
        in_buf.freebuffer(); out_buf.freebuffer()
        results.append({"prediction": _SVM_CLASSES[pred], "class_id": pred,
                        "latency_ms": round(ms, 3)})
    return results


# =============================================================================
# Server infrastructure
# =============================================================================
_LOADERS      = {"mlp": _load_mlp, "cnn": _load_cnn, "bnn": _load_bnn, "svm": _load_svm}
_load_errors  = {}   # model_key -> error string (set on first failure; prevents retry storms)


def _ensure_loaded(model_key: str):
    global _active_model
    with _state_lock:
        if model_key in _load_errors:
            raise RuntimeError(_load_errors[model_key])
        if _active_model != model_key:
            print(f"[server] switching overlay: {_active_model} -> {model_key}")
            try:
                _LOADERS[model_key]()
                _active_model = model_key
            except Exception as exc:
                _load_errors[model_key] = str(exc)
                print(f"[server] ERROR loading {model_key}: {exc}")
                raise


def _recv_exact(sock: socket.socket, n: int) -> bytes:
    buf = b""
    while len(buf) < n:
        chunk = sock.recv(min(n - len(buf), 65536))
        if not chunk:
            raise ConnectionResetError("connection closed mid-payload")
        buf += chunk
    return buf


def handle_client(conn: socket.socket, addr):
    # PYNQ 3.x uses asyncio internally; worker threads need their own event loop.
    import asyncio
    try:
        asyncio.get_running_loop()
    except RuntimeError:
        asyncio.set_event_loop(asyncio.new_event_loop())

    print(f"[server] connected: {addr}")
    leftover = b""
    try:
        while True:
            while b"\n" not in leftover:
                chunk = conn.recv(4096)
                if not chunk:
                    return
                leftover += chunk
            line, leftover = leftover.split(b"\n", 1)
            try:
                hdr = json.loads(line.decode("utf-8").strip())
            except (json.JSONDecodeError, UnicodeDecodeError) as exc:
                conn.sendall(json.dumps({"error": f"bad header: {exc}"}).encode() + b"\n")
                continue

            model_key = hdr.get("model", "").lower().strip()
            size      = int(hdr.get("size", 0))

            if model_key not in _LOADERS:
                conn.sendall(json.dumps({"error": f"unknown model '{model_key}'"}).encode() + b"\n")
                continue

            need = size - len(leftover)
            if need > 0:
                leftover += _recv_exact(conn, need)
            payload  = leftover[:size]
            leftover = leftover[size:]

            try:
                _ensure_loaded(model_key)
                if model_key == "mlp":
                    label, cid, ms = infer_mlp(payload)
                    resp = {"prediction": label.upper(), "class_id": cid, "latency_ms": round(ms, 3)}
                elif model_key == "cnn":
                    label, cid, hw_ms, total_ms = infer_cnn(payload)
                    resp = {
                        "prediction": label,
                        "class_id": cid,
                        "latency_ms": round(total_ms, 3),
                        "hw_latency_ms": round(hw_ms, 3),
                        "total_latency_ms": round(total_ms, 3),
                    }
                elif model_key == "bnn":
                    label, cid, ms = infer_bnn(payload)
                    resp = {"prediction": label, "class_id": cid, "latency_ms": round(ms, 3)}
                elif model_key == "svm":
                    rows = infer_svm(payload)
                    resp = {"predictions": rows, "count": len(rows)}
            except Exception as exc:
                import traceback as _tb
                resp = {"error": str(exc), "traceback": _tb.format_exc()}

            conn.sendall(json.dumps(resp).encode() + b"\n")

    except (ConnectionResetError, BrokenPipeError, OSError):
        pass
    finally:
        conn.close()
        print(f"[server] disconnected: {addr}")


def main():
    parser = argparse.ArgumentParser(description="FPGA Streaming Inference Server")
    parser.add_argument("--host", default="0.0.0.0")
    parser.add_argument("--port", type=int, default=5005)
    args = parser.parse_args()

    srv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    srv.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    srv.bind((args.host, args.port))
    srv.listen(4)
    print(f"[server] listening on {args.host}:{args.port}")
    print(f"[server] script    : {Path(__file__).resolve()}")
    print(f"[server] models dir: {BASE_DIR / 'models'}")
    print(f"[server] supported : mlp(.wav)  cnn(.jpg/.png)  bnn(.log)  svm(.csv)")

    # PYNQ device probe
    try:
        import pynq as _pynq
        print(f"[server] PYNQ ver  : {_pynq.__version__}")
    except Exception:
        pass
    try:
        from pynq import Device as _D
        devs = _D.devices
        print(f"[server] PYNQ devs : {[str(d) for d in devs] if devs else 'NONE FOUND — overlays will fail!'}")
    except Exception as e:
        print(f"[server] PYNQ devs : probe failed ({e})")
    # Validate asset paths at startup so problems are obvious immediately
    checks = [
        ("mlp", _MLP_DIR / "mlp_accelerator.bit"),
        ("mlp", _MLP_DIR / "mlp_accelerator.hwh"),
        ("cnn", _CNN_DIR / "cnn_accelerator.bit"),
        ("cnn", _CNN_DIR / "cnn_accelerator.hwh"),
        ("bnn", _BNN_DIR / "bnn_accelerator.bit"),
        ("bnn", _BNN_DIR / "bnn_accelerator.hwh"),
        ("svm", _SVM_DIR / "svm_accelerator.bit"),
        ("svm", _SVM_DIR / "svm_accelerator.hwh"),
    ]
    for model, path in checks:
        status = "[OK] " if path.exists() else "[MISSING]"
        print(f"  {status} {path}")

    try:
        while True:
            conn, addr = srv.accept()
            threading.Thread(target=handle_client, args=(conn, addr), daemon=True).start()
    except KeyboardInterrupt:
        print("\n[server] shutting down")
    finally:
        srv.close()


if __name__ == "__main__":
    main()
