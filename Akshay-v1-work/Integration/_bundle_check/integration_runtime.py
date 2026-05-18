from __future__ import annotations

import io
import json
import os
import re
import shutil
import struct
import subprocess
import sys
import time
from pathlib import Path
from typing import Any

import numpy as np
import pandas as pd
from PIL import Image

BASE_DIR = Path(__file__).resolve().parent
REPO_ROOT = BASE_DIR.parent
CACHE_DIR = BASE_DIR / ".overlay_cache"
UPLOADS_DIR = BASE_DIR / "uploads"
EXECUTED_DIR = BASE_DIR / "executed_notebooks"
MODEL_NOTEBOOK_DIR = BASE_DIR / "model_notebooks"

IMAGE_EXTENSIONS = {".png", ".jpg", ".jpeg", ".bmp", ".gif", ".webp"}

MODEL_CONFIG = {
    "bnn": {
        "label": "BNN CAN Vehicle Classifier",
        "extensions": {".log"},
        "bundle_dir": BASE_DIR / "models" / "bnn",
        "source_dirs": [REPO_ROOT / "bnn_accelerator" / "fpga" / "pynq"],
        "asset_sources": {
            "bit": REPO_ROOT / "major_project_repo" / "bnn_vivado_files" / "bnn_accelerator.bit",
            "hwh": REPO_ROOT / "major_project_repo" / "bnn_vivado_files" / "bnn_accelerator.hwh",
            "stats": REPO_ROOT / "bnn_accelerator" / "fpga" / "pynq" / "bnn_can_feature_stats.npz",
        },
        "notebook": MODEL_NOTEBOOK_DIR / "bnn_can_inference.ipynb",
    },
    "cnn": {
        "label": "CNN Traffic Sign Classifier",
        "extensions": IMAGE_EXTENSIONS,
        "bundle_dir": BASE_DIR / "models" / "cnn",
        "source_dirs": [REPO_ROOT / "major_project_repo" / "pynq"],
        "asset_sources": {
            "bit": REPO_ROOT / "major_project_repo" / "cnn_vivado_files" / "cnn_accelerator.bit",
            "hwh": REPO_ROOT / "major_project_repo" / "cnn_vivado_files" / "cnn_accelerator.hwh",
            "fc": REPO_ROOT / "major_project_repo" / "pynq" / "fc_weights.npz",
            "cnn_benchmark": REPO_ROOT / "major_project_repo" / "pynq" / "cnn_benchmark_data.npy",
            "cnn_weights_bin": REPO_ROOT / "major_project_repo" / "pynq" / "cnn_weights.bin",
        },
        "notebook": MODEL_NOTEBOOK_DIR / "cnn_traffic_sign_inference.ipynb",
    },
    "svm": {
        "label": "SVM Lane Classifier",
        "extensions": {".csv"},
        "bundle_dir": BASE_DIR / "models" / "svm",
        "source_dirs": [REPO_ROOT / "major_project_repo" / "pynq"],
        "asset_sources": {
            "bit": REPO_ROOT / "major_project_repo" / "svm_vivado_files" / "svm_accelerator.bit",
            "hwh": REPO_ROOT / "major_project_repo" / "svm_vivado_files" / "svm_accelerator.hwh",
        },
        "notebook": MODEL_NOTEBOOK_DIR / "svm_lane_inference.ipynb",
    },
    "mlp": {
        "label": "MLP Siren Classifier",
        "extensions": {".wav"},
        "bundle_dir": BASE_DIR / "models" / "mlp",
        "source_dirs": [REPO_ROOT / "siren_mlp" / "fpga" / "pynq"],
        "asset_sources": {
            "bit": REPO_ROOT / "siren_mlp" / "fpga" / "pynq" / "mlp_vivado_files" / "mlp_accelerator.bit",
            "hwh": REPO_ROOT / "siren_mlp" / "fpga" / "pynq" / "mlp_vivado_files" / "mlp_accelerator.hwh",
            "stats": REPO_ROOT / "siren_mlp" / "fpga" / "pynq" / "feature_stats.npz",
            "weights_bin": REPO_ROOT / "siren_mlp" / "fpga" / "pynq" / "radioml_deployment" / "mlp_weights.bin",
        },
        "notebook": MODEL_NOTEBOOK_DIR / "mlp_siren_inference.ipynb",
    },
}

_BNN_STATE: dict[str, Any] | None = None
_CNN_STATE: dict[str, Any] | None = None
_SVM_STATE: dict[str, Any] | None = None
_MLP_STATE: dict[str, Any] | None = None


class AssetMissingError(FileNotFoundError):
    pass


def infer_model_from_filename(filename: str) -> str:
    suffix = Path(filename).suffix.lower()
    for model_key, config in MODEL_CONFIG.items():
        if suffix in config["extensions"]:
            return model_key
    raise ValueError(f"Unsupported file type: {suffix or '<no extension>'}")


def _existing_path(*paths: Path) -> Path | None:
    for path in paths:
        if path.exists():
            return path
    return None


def _model_bundle_dir(model_key: str) -> Path:
    return MODEL_CONFIG[model_key]["bundle_dir"]


def _ensure_overlay_dir(model_key: str) -> Path:
    cache_dir = CACHE_DIR / model_key
    cache_dir.mkdir(parents=True, exist_ok=True)
    return cache_dir


def _resolve_asset(model_key: str, asset_name: str, required: bool = True) -> Path | None:
    config = MODEL_CONFIG[model_key]
    bundle_candidate = config["bundle_dir"] / Path(config["asset_sources"].get(asset_name, f"{asset_name}")).name
    source_candidate = config["asset_sources"].get(asset_name)
    source_dirs = config.get("source_dirs", [])

    candidates: list[Path] = []
    if isinstance(bundle_candidate, Path):
        candidates.append(bundle_candidate)
    if isinstance(source_candidate, Path):
        candidates.append(source_candidate)
    for source_dir in source_dirs:
        if isinstance(source_candidate, Path):
            candidates.append(source_dir / source_candidate.name)

    resolved = _existing_path(*candidates)
    if resolved is None and required:
        names = ", ".join(str(path) for path in candidates)
        raise AssetMissingError(f"Missing asset for {model_key}: {asset_name}. Checked: {names}")
    return resolved


def _prepare_overlay_bitfile(model_key: str) -> Path:
    bit_path = _resolve_asset(model_key, "bit", required=True)
    hwh_path = _resolve_asset(model_key, "hwh", required=True)
    if bit_path is None or hwh_path is None:
        raise AssetMissingError(f"{model_key} bitstream assets are incomplete")

    if bit_path.parent == hwh_path.parent and bit_path.stem == hwh_path.stem:
        return bit_path

    cache_dir = _ensure_overlay_dir(model_key)
    cache_bit = cache_dir / bit_path.name
    cache_hwh = cache_dir / hwh_path.name
    if not cache_bit.exists() or cache_bit.stat().st_mtime < bit_path.stat().st_mtime:
        shutil.copy2(bit_path, cache_bit)
    if not cache_hwh.exists() or cache_hwh.stat().st_mtime < hwh_path.stat().st_mtime:
        shutil.copy2(hwh_path, cache_hwh)
    return cache_bit


def _require_pynq() -> tuple[Any, Any]:
    from pynq import Overlay, allocate

    return Overlay, allocate


def ensure_upload_dir() -> Path:
    UPLOADS_DIR.mkdir(parents=True, exist_ok=True)
    return UPLOADS_DIR


def save_uploaded_file(filename: str, content: bytes | bytearray | memoryview) -> Path:
    upload_dir = ensure_upload_dir()
    target = upload_dir / Path(filename).name
    with open(target, "wb") as handle:
        handle.write(bytes(content))
    return target


# ---------------------------------------------------------------------------
# BNN runtime
# ---------------------------------------------------------------------------
N_IN = 169
N_OUT = 3
SCALE_Q88 = 256
CLASSES_BNN = ["OpelAstra", "Prototype", "RenaultClio"]
WINDOW_SIZE = 256
WINDOW_STRIDE = 256
ID_HASH_BINS = 128
CAN_RE = re.compile(r"^\(([^)]+)\)\s+\S+\s+([0-9A-Fa-f]+)#([0-9A-Fa-f]*)$")


def _load_bnn_state() -> dict[str, Any]:
    global _BNN_STATE
    if _BNN_STATE is not None:
        return _BNN_STATE

    Overlay, _ = _require_pynq()
    bitfile = _prepare_overlay_bitfile("bnn")
    overlay = Overlay(str(bitfile))
    dma = overlay.axi_dma_0

    stats_path = _resolve_asset("bnn", "stats", required=False)
    if stats_path is not None and stats_path.exists():
        stats = np.load(stats_path)
        feat_mean = stats["mean"].astype(np.float32)
        feat_std = stats["std"].astype(np.float32)
    else:
        feat_mean = np.zeros(N_IN, dtype=np.float32)
        feat_std = np.ones(N_IN, dtype=np.float32)

    _BNN_STATE = {
        "overlay": overlay,
        "dma": dma,
        "feat_mean": feat_mean,
        "feat_std": feat_std,
        "bitfile": str(bitfile),
    }
    return _BNN_STATE


def parse_can_log(log_text: str) -> list[tuple[float, int, bytes]]:
    messages: list[tuple[float, int, bytes]] = []
    for line in log_text.splitlines():
        match = CAN_RE.match(line.strip())
        if match:
            ts = float(match.group(1))
            can_id = int(match.group(2), 16)
            payload = bytes.fromhex(match.group(3)) if match.group(3) else b""
            messages.append((ts, can_id, payload))
    return messages


def extract_can_features(messages: list[tuple[float, int, bytes]]) -> np.ndarray:
    timestamps = np.array([item[0] for item in messages], dtype=np.float64)
    ids = np.array([item[1] for item in messages], dtype=np.float32)
    payloads = [item[2] for item in messages]

    id_hist = np.zeros(ID_HASH_BINS, dtype=np.float32)
    for can_id in ids:
        id_hist[int(can_id) % ID_HASH_BINS] += 1
    if id_hist.sum() > 0:
        id_hist /= id_hist.sum()

    len_hist = np.zeros(9, dtype=np.float32)
    for payload in payloads:
        len_hist[min(len(payload), 8)] += 1

    nibble_hist = np.zeros(16, dtype=np.float32)
    all_bytes: list[int] = []
    for payload in payloads:
        all_bytes.extend(payload)
    if all_bytes:
        arr = np.array(all_bytes, dtype=np.uint8)
        high = (arr >> 4) & 0xF
        low = arr & 0xF
        high_bins = np.zeros(8, dtype=np.float32)
        low_bins = np.zeros(8, dtype=np.float32)
        for value in high:
            high_bins[int(value % 8)] += 1
        for value in low:
            low_bins[int(value % 8)] += 1
        nibble_hist = np.concatenate([high_bins, low_bins])
        if nibble_hist.sum() > 0:
            nibble_hist /= nibble_hist.sum()

    n_msgs = len(messages)
    unique_ids = len(set(int(i) for i in ids))
    uid_ratio = unique_ids / n_msgs if n_msgs else 0.0
    id_mean = float(np.mean(ids)) if len(ids) else 0.0
    id_std = float(np.std(ids)) if len(ids) else 0.0

    id_counts: dict[int, int] = {}
    for can_id in ids:
        key = int(can_id)
        id_counts[key] = id_counts.get(key, 0) + 1
    sorted_counts = sorted(id_counts.values(), reverse=True)
    top1_ratio = sorted_counts[0] / n_msgs if sorted_counts and n_msgs else 0.0
    top3_ratio = sum(sorted_counts[:3]) / n_msgs if sorted_counts and n_msgs else 0.0

    if len(timestamps) > 1:
        deltas = np.diff(timestamps)
        delta_mean = float(np.mean(deltas))
        delta_std = float(np.std(deltas))
        delta_p75 = float(np.percentile(deltas, 75))
        delta_max = float(np.max(deltas))
    else:
        delta_mean = delta_std = delta_p75 = delta_max = 0.0

    plen = np.array([len(payload) for payload in payloads], dtype=np.float32)
    plen_mean = float(np.mean(plen)) if len(plen) else 0.0
    plen_std = float(np.std(plen)) if len(plen) else 0.0

    if all_bytes:
        bytes_arr = np.array(all_bytes, dtype=np.float32)
        byte_mean = float(np.mean(bytes_arr))
        byte_std = float(np.std(bytes_arr))
        byte_p75 = float(np.percentile(bytes_arr, 75))
        frac_zero = float(np.mean(bytes_arr == 0))
        frac_ff = float(np.mean(bytes_arr == 255))
    else:
        byte_mean = byte_std = byte_p75 = frac_zero = frac_ff = 0.0

    stat_feats = np.array([
        uid_ratio,
        id_mean,
        id_std,
        top1_ratio,
        top3_ratio,
        delta_mean,
        delta_std,
        delta_p75,
        delta_max,
        plen_mean,
        plen_std,
        byte_mean,
        byte_std,
        byte_p75,
        frac_zero,
        frac_ff,
    ], dtype=np.float32)

    return np.concatenate([id_hist, len_hist, nibble_hist, stat_feats])


def _preprocess_bnn_features(features: np.ndarray, feat_mean: np.ndarray, feat_std: np.ndarray) -> np.ndarray:
    x = (np.asarray(features, dtype=np.float32) - feat_mean) / (feat_std + 1e-8)
    q = np.clip(np.round(x * SCALE_Q88), -32768, 32767).astype(np.int16)
    return q.astype(np.uint16).astype(np.uint32)


def _bnn_predict_window(features: np.ndarray) -> tuple[int, float]:
    state = _load_bnn_state()
    _, allocate = _require_pynq()
    in_buf = allocate(shape=(N_IN,), dtype=np.uint32)
    out_buf = allocate(shape=(1,), dtype=np.uint32)
    np.copyto(in_buf, _preprocess_bnn_features(features, state["feat_mean"], state["feat_std"]))
    t0 = time.perf_counter()
    state["dma"].sendchannel.transfer(in_buf)
    state["dma"].recvchannel.transfer(out_buf)
    state["dma"].sendchannel.wait()
    state["dma"].recvchannel.wait()
    t1 = time.perf_counter()
    pred = int(out_buf[0]) & 0x3
    in_buf.freebuffer()
    out_buf.freebuffer()
    return pred, (t1 - t0) * 1000.0


def run_bnn_from_log(log_path: str | Path) -> dict[str, Any]:
    path = Path(log_path)
    log_text = path.read_text(encoding="utf-8", errors="ignore")
    messages = parse_can_log(log_text)
    n_windows = len(messages) // WINDOW_STRIDE
    if n_windows == 0:
        raise ValueError(f"Not enough CAN messages in {path.name}; need at least {WINDOW_SIZE} lines")

    votes = np.zeros(N_OUT, dtype=np.float64)
    window_results: list[dict[str, Any]] = []
    latencies: list[float] = []
    for idx in range(n_windows):
        start = idx * WINDOW_STRIDE
        window = messages[start : start + WINDOW_SIZE]
        features = extract_can_features(window)
        pred, latency_ms = _bnn_predict_window(features)
        votes[pred] += 1.0
        latencies.append(latency_ms)
        window_results.append({
            "window": idx,
            "class_index": pred,
            "class_name": CLASSES_BNN[pred],
            "latency_ms": round(latency_ms, 4),
        })

    votes /= max(n_windows, 1)
    final_idx = int(np.argmax(votes))
    return {
        "model": "bnn",
        "input_path": str(path),
        "bitfile": _load_bnn_state()["bitfile"],
        "windows": n_windows,
        "class_index": final_idx,
        "class_name": CLASSES_BNN[final_idx],
        "confidence": float(votes[final_idx]),
        "mean_latency_ms": float(np.mean(latencies)) if latencies else 0.0,
        "window_results": window_results,
        "votes": {label: float(prob) for label, prob in zip(CLASSES_BNN, votes)},
    }


# ---------------------------------------------------------------------------
# CNN runtime
# ---------------------------------------------------------------------------
CLASS_NAMES_CNN = {
    0: "Speed limit (20km/h)",
    1: "Speed limit (30km/h)",
    2: "Speed limit (50km/h)",
    3: "Speed limit (60km/h)",
    4: "Speed limit (70km/h)",
    5: "Speed limit (80km/h)",
    6: "End of speed limit (80km/h)",
    7: "Speed limit (100km/h)",
    8: "Speed limit (120km/h)",
    9: "No passing",
    10: "No passing for heavy vehicles",
    11: "Right-of-way at intersection",
    12: "Priority road",
    13: "Yield",
    14: "Stop",
    15: "No vehicles",
    16: "Vehicles over 3.5 tons prohibited",
    17: "No entry",
    18: "General caution",
    19: "Dangerous curve to the left",
    20: "Dangerous curve to the right",
    21: "Double curve",
    22: "Bumpy road",
    23: "Slippery road",
    24: "Road narrows on the right",
    25: "Road work",
    26: "Traffic signals",
    27: "Pedestrians",
    28: "Children crossing",
    29: "Bicycles crossing",
    30: "Beware of ice/snow",
    31: "Wild animals crossing",
    32: "End of all speed and passing limits",
    33: "Turn right ahead",
    34: "Turn left ahead",
    35: "Ahead only",
    36: "Go straight or right",
    37: "Go straight or left",
    38: "Keep right",
    39: "Keep left",
    40: "Roundabout mandatory",
    41: "End of no passing",
    42: "End of no passing by vehicles over 3.5 metric tons",
}


def _load_cnn_state() -> dict[str, Any]:
    global _CNN_STATE
    if _CNN_STATE is not None:
        return _CNN_STATE

    Overlay, _ = _require_pynq()
    bitfile = _prepare_overlay_bitfile("cnn")
    overlay = Overlay(str(bitfile))
    dma = overlay.axi_dma_0

    fc_path = _resolve_asset("cnn", "fc", required=True)
    if fc_path is None:
        raise AssetMissingError("CNN FC weights not found")
    fc_data = np.load(fc_path)

    _CNN_STATE = {
        "overlay": overlay,
        "dma": dma,
        "bitfile": str(bitfile),
        "fc1_w": fc_data["fc1_w"],
        "fc1_b": fc_data["fc1_b"],
        "fc2_w": fc_data["fc2_w"],
        "fc2_b": fc_data["fc2_b"],
    }
    return _CNN_STATE


def _cnn_class_name(class_id: int) -> str:
    return CLASS_NAMES_CNN.get(class_id, f"Class {class_id}")


def run_cnn_from_image(image_path: str | Path) -> dict[str, Any]:
    path = Path(image_path)
    state = _load_cnn_state()
    _, allocate = _require_pynq()

    image = Image.open(path).convert("RGB")
    img_resized = image.resize((32, 32))
    img_arr = np.array(img_resized, dtype=np.float32) / 255.0
    img_norm = (img_arr - 0.5) / 0.5
    img_chw = np.transpose(img_norm, (2, 0, 1))
    q8_img = np.array([int(value * 256) & 0xFFFF for value in img_chw.flatten()], dtype=np.uint32)

    in_buf = allocate(shape=(3072,), dtype=np.uint32)
    out_buf = allocate(shape=(2048,), dtype=np.uint32)
    np.copyto(in_buf, q8_img)
    in_buf.flush()

    t0_hw = time.perf_counter()
    state["dma"].sendchannel.transfer(in_buf)
    state["dma"].recvchannel.transfer(out_buf)
    state["dma"].sendchannel.wait()
    state["dma"].recvchannel.wait()
    t1_hw = time.perf_counter()
    out_buf.invalidate()

    hw_features = np.array(out_buf, dtype=np.int16).astype(np.float32) / 256.0
    t0_sw = time.perf_counter()
    fc1_out = np.maximum(0, np.dot(hw_features, state["fc1_w"].T) + state["fc1_b"])
    fc2_out = np.dot(fc1_out, state["fc2_w"].T) + state["fc2_b"]
    prediction = int(np.argmax(fc2_out))
    t1_sw = time.perf_counter()

    in_buf.freebuffer()
    out_buf.freebuffer()

    hw_latency = (t1_hw - t0_hw) * 1000.0
    sw_latency = (t1_sw - t0_sw) * 1000.0
    return {
        "model": "cnn",
        "input_path": str(path),
        "bitfile": state["bitfile"],
        "class_index": prediction,
        "class_name": _cnn_class_name(prediction),
        "fpga_latency_ms": hw_latency,
        "software_head_latency_ms": sw_latency,
        "total_latency_ms": hw_latency + sw_latency,
    }


# ---------------------------------------------------------------------------
# SVM runtime
# ---------------------------------------------------------------------------

def _load_svm_state() -> dict[str, Any]:
    global _SVM_STATE
    if _SVM_STATE is not None:
        return _SVM_STATE

    Overlay, _ = _require_pynq()
    bitfile = _prepare_overlay_bitfile("svm")
    overlay = Overlay(str(bitfile))
    dma = overlay.axi_dma_0
    _SVM_STATE = {"overlay": overlay, "dma": dma, "bitfile": str(bitfile)}
    return _SVM_STATE


def _float_to_q88(value: float) -> np.uint32:
    q = int(round(float(value) * 256.0))
    q = max(-32768, min(32767, q))
    return np.uint32(q & 0xFFFF)


def _svm_predict(features: list[float]) -> tuple[int, float]:
    state = _load_svm_state()
    _, allocate = _require_pynq()
    input_buffer = allocate(shape=(10,), dtype=np.uint32)
    output_buffer = allocate(shape=(1,), dtype=np.uint32)
    q_features = np.array([_float_to_q88(value) for value in features], dtype=np.uint32)
    np.copyto(input_buffer, q_features)
    t0 = time.perf_counter()
    state["dma"].sendchannel.transfer(input_buffer)
    state["dma"].recvchannel.transfer(output_buffer)
    state["dma"].sendchannel.wait()
    state["dma"].recvchannel.wait()
    t1 = time.perf_counter()
    prediction = int(output_buffer[0])
    input_buffer.freebuffer()
    output_buffer.freebuffer()
    return prediction, (t1 - t0) * 1000.0


def run_svm_from_csv(csv_path: str | Path) -> dict[str, Any]:
    path = Path(csv_path)
    df = pd.read_csv(path)
    feature_cols = [column for column in df.columns if column.lower() != "label"]
    labels = df["label"].tolist() if "label" in df.columns else None
    rows: list[dict[str, Any]] = []
    latencies: list[float] = []
    correct = 0

    for index, (_, row) in enumerate(df.iterrows()):
        features = row[feature_cols].tolist()
        if len(features) < 10:
            features = features + [0.0] * (10 - len(features))
        elif len(features) > 10:
            features = features[:10]
        prediction, latency_ms = _svm_predict([float(value) for value in features])
        latencies.append(latency_ms)
        actual = int(labels[index]) if labels is not None else None
        if actual is not None and actual == prediction:
            correct += 1
        rows.append({
            "row": index,
            "prediction": prediction,
            "prediction_label": "Lane Change" if prediction == 1 else "Keep Lane",
            "latency_ms": round(latency_ms, 4),
            "actual": actual,
        })

    accuracy = (correct / len(rows)) if rows and labels is not None else None
    return {
        "model": "svm",
        "input_path": str(path),
        "bitfile": _load_svm_state()["bitfile"],
        "rows": rows,
        "row_count": len(rows),
        "mean_latency_ms": float(np.mean(latencies)) if latencies else 0.0,
        "accuracy": accuracy,
    }


# ---------------------------------------------------------------------------
# MLP runtime
# ---------------------------------------------------------------------------
TARGET_SR = 16000
NPERSEG = 512
NOVERLAP = 256
SPEC_BANDS = [
    (0, 500),
    (500, 1000),
    (1000, 2000),
    (2000, 4000),
    (4000, 6000),
    (6000, 8000),
    (8000, 10000),
    (10000, 16000),
]
ENERGY_BANDS = [(0, 300), (300, 1000), (1000, 3000), (3000, 8000)]
SCALE_Q412 = 4096
CLASS_NAMES_MLP = ["ambulance", "firetruck"]


def _load_mlp_state() -> dict[str, Any]:
    global _MLP_STATE
    if _MLP_STATE is not None:
        return _MLP_STATE

    Overlay, _ = _require_pynq()
    bitfile = _prepare_overlay_bitfile("mlp")
    overlay = Overlay(str(bitfile))
    dma = overlay.axi_dma_0

    stats_path = _resolve_asset("mlp", "stats", required=False)
    if stats_path is not None and stats_path.exists():
        stats = np.load(stats_path)
        feat_mean = stats["mean"].astype(np.float32)
        feat_std = stats["std"].astype(np.float32)
    else:
        feat_mean = np.zeros(41, dtype=np.float32)
        feat_std = np.ones(41, dtype=np.float32)

    _MLP_STATE = {
        "overlay": overlay,
        "dma": dma,
        "feature_mean": feat_mean,
        "feature_std": feat_std,
        "bitfile": str(bitfile),
    }
    return _MLP_STATE


def extract_features_from_wav(wav_path: str | Path) -> np.ndarray:
    from scipy.io import wavfile
    from scipy.signal import resample, spectrogram, windows

    sr, data = wavfile.read(str(wav_path))
    if data.dtype == np.int16:
        data = data.astype(np.float32) / 32768.0
    elif data.dtype == np.int32:
        data = data.astype(np.float32) / 2147483648.0
    else:
        data = data.astype(np.float32)

    if data.ndim == 2:
        data = data.mean(axis=1)

    peak = np.max(np.abs(data)) if len(data) else 0.0
    if peak > 0:
        data = data / peak

    if sr != TARGET_SR and len(data):
        n_samples = int(len(data) * TARGET_SR / sr)
        data = resample(data, n_samples)
        sr = TARGET_SR

    freqs, times, spectrum = spectrogram(
        data,
        fs=sr,
        window=windows.hann(NPERSEG),
        nperseg=NPERSEG,
        noverlap=NOVERLAP,
        scaling="spectrum",
        mode="magnitude",
    )
    spectrum = np.log1p(spectrum)

    features: list[float] = []
    for low, high in SPEC_BANDS:
        mask = (freqs >= low) & (freqs < high)
        band = spectrum[mask, :].flatten() if mask.any() else np.zeros(1)
        features.extend([
            float(np.mean(band)),
            float(np.std(band)),
            float(np.percentile(band, 25)),
            float(np.percentile(band, 75)),
        ])

    abs_data = np.abs(data)
    features.extend([
        float(np.mean(data)) if len(data) else 0.0,
        float(np.std(data)) if len(data) else 0.0,
        float(np.mean(abs_data)) if len(abs_data) else 0.0,
        float(np.max(abs_data)) if len(abs_data) else 0.0,
        float(np.percentile(abs_data, 90)) if len(abs_data) else 0.0,
    ])

    for low, high in ENERGY_BANDS:
        mask = (freqs >= low) & (freqs < high)
        band_energy = spectrum[mask, :].mean(axis=0) if mask.any() else np.zeros(len(times))
        features.append(float(np.mean(band_energy)) if len(band_energy) else 0.0)

    if len(features) != 41:
        raise ValueError(f"Expected 41 features, got {len(features)}")
    return np.array(features, dtype=np.float32)


def _encode_q412(values: np.ndarray) -> list[int]:
    encoded: list[int] = []
    for value in values:
        q = int(round(float(value) * SCALE_Q412))
        q = max(-32768, min(32767, q))
        encoded.append(struct.unpack("<I", struct.pack("<h", q) + b"\x00\x00")[0])
    return encoded


def run_mlp_from_wav(wav_path: str | Path) -> dict[str, Any]:
    path = Path(wav_path)
    state = _load_mlp_state()
    _, allocate = _require_pynq()

    features = extract_features_from_wav(path)
    normalized = (features - state["feature_mean"]) / (state["feature_std"] + 1e-8)
    encoded = _encode_q412(normalized)

    in_buf = allocate(shape=(41,), dtype=np.uint32)
    out_buf = allocate(shape=(1,), dtype=np.uint32)
    for idx, value in enumerate(encoded):
        in_buf[idx] = value

    t0 = time.perf_counter()
    state["dma"].sendchannel.transfer(in_buf)
    state["dma"].recvchannel.transfer(out_buf)
    state["dma"].sendchannel.wait()
    state["dma"].recvchannel.wait()
    t1 = time.perf_counter()

    class_index = int(out_buf[0]) & 0x1
    in_buf.freebuffer()
    out_buf.freebuffer()

    return {
        "model": "mlp",
        "input_path": str(path),
        "bitfile": state["bitfile"],
        "class_index": class_index,
        "class_name": CLASS_NAMES_MLP[class_index],
        "latency_ms": (t1 - t0) * 1000.0,
        "feature_count": 41,
    }


# ---------------------------------------------------------------------------
# Routing and notebook execution helpers
# ---------------------------------------------------------------------------

def format_result(result: dict[str, Any]) -> str:
    return json.dumps(result, indent=2, default=str)


def run_by_file(input_path: str | Path) -> dict[str, Any]:
    path = Path(input_path)
    model_key = infer_model_from_filename(path.name)
    if model_key == "bnn":
        return run_bnn_from_log(path)
    if model_key == "cnn":
        return run_cnn_from_image(path)
    if model_key == "svm":
        return run_svm_from_csv(path)
    if model_key == "mlp":
        return run_mlp_from_wav(path)
    raise ValueError(f"Unhandled model key: {model_key}")


def notebook_links() -> dict[str, str]:
    links: dict[str, str] = {}
    for model_key, config in MODEL_CONFIG.items():
        notebook_path = config["notebook"]
        links[model_key] = str(notebook_path)
    return links


def execute_model_notebook(model_key: str, input_path: str | Path, timeout_seconds: int = 0) -> dict[str, Any]:
    notebook_path = MODEL_CONFIG[model_key]["notebook"]
    if not notebook_path.exists():
        raise FileNotFoundError(f"Notebook not found: {notebook_path}")

    EXECUTED_DIR.mkdir(parents=True, exist_ok=True)
    output_name = f"{model_key}_{Path(input_path).stem}_executed.ipynb"
    command = [
        sys.executable,
        "-m",
        "jupyter",
        "nbconvert",
        "--to",
        "notebook",
        "--execute",
        "--output",
        output_name,
        "--ExecutePreprocessor.timeout=" + str(timeout_seconds),
        str(notebook_path),
    ]
    env = os.environ.copy()
    env["ROUTED_INPUT_PATH"] = str(Path(input_path).resolve())
    env["INTEGRATION_BASE_DIR"] = str(BASE_DIR.resolve())
    completed = subprocess.run(
        command,
        cwd=str(notebook_path.parent),
        env=env,
        capture_output=True,
        text=True,
        check=False,
    )
    result = {
        "command": command,
        "returncode": completed.returncode,
        "stdout": completed.stdout,
        "stderr": completed.stderr,
        "executed_notebook": str((EXECUTED_DIR / output_name).resolve()),
    }
    if completed.returncode != 0:
        raise RuntimeError(format_result(result))

    produced = notebook_path.parent / output_name
    target = EXECUTED_DIR / output_name
    if produced.exists() and produced.resolve() != target.resolve():
        shutil.move(str(produced), str(target))
    return result


def route_and_run(input_path: str | Path, execute_notebook: bool = True) -> dict[str, Any]:
    path = Path(input_path)
    model_key = infer_model_from_filename(path.name)
    inference_result = run_by_file(path)
    notebook_result = None
    if execute_notebook:
        try:
            notebook_result = execute_model_notebook(model_key, path)
        except Exception as exc:
            notebook_result = {"error": str(exc)}
    return {
        "model_key": model_key,
        "model_label": MODEL_CONFIG[model_key]["label"],
        "inference": inference_result,
        "notebook_execution": notebook_result,
    }
