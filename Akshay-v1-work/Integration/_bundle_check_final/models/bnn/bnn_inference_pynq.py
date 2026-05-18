#!/usr/bin/env python3
# bnn_inference_pynq.py -- CAN Vehicle BNN inference on PYNQ-Z2

# ============================================================
# CELL 1: Imports & Constants
# ============================================================
import numpy as np
import time
import re
import os
from pynq import Overlay, allocate
import ipywidgets as widgets
from IPython.display import display

# Model constants (must match bnn_accelerator.v and extract_bnn_weights.py)
N_IN     = 169        # input feature dimension
N_OUT    = 3          # output classes
SCALE    = 256        # Q8.8: float -> int16(round(float * 256))
CLASSES  = ['OpelAstra', 'Prototype', 'RenaultClio']
BIT_FILE = 'bnn_accelerator.bit'

# CAN window parameters (must match training)
WINDOW_SIZE   = 256   # messages per window
WINDOW_STRIDE = 256   # non-overlapping windows
ID_HASH_BINS  = 128   # CAN-ID histogram bins (ID % 128)

# CAN log line regex
CAN_RE = re.compile(
    r'^\(([^)]+)\)\s+\S+\s+([0-9A-Fa-f]+)#([0-9A-Fa-f]*)$'
)

print('Constants defined.')
print(f'  N_IN={N_IN}  N_OUT={N_OUT}  SCALE={SCALE}')
print(f'  Classes: {CLASSES}')
print(f'  Bitstream: {BIT_FILE}')

# ============================================================
# CELL 2: Load Feature Stats + Bitstream onto FPGA
# ============================================================
STATS_FILE = 'bnn_can_feature_stats.npz'
if os.path.exists(STATS_FILE):
    s = np.load(STATS_FILE)
    feat_mean = s['mean'].astype(np.float32)
    feat_std  = s['std'].astype(np.float32)
    print(f'Loaded {STATS_FILE}  (mean[:4]={feat_mean[:4]})')
else:
    feat_mean = np.zeros(N_IN, dtype=np.float32)
    feat_std  = np.ones(N_IN,  dtype=np.float32)
    print(f'WARNING: {STATS_FILE} not found -- using zero-mean/unit-std')

if not os.path.exists(BIT_FILE):
    raise FileNotFoundError(
        f'Required file not found: {BIT_FILE}\n'
        'Build with: bnn_accelerator/fpga/build_and_deploy.bat'
    )

print(f'Loading bitstream: {BIT_FILE} ...')
overlay = Overlay(BIT_FILE)
print('Bitstream loaded!')
print('Available IP blocks:', list(overlay.ip_dict.keys()))

# ============================================================
# CELL 3: Acquire DMA Handle
# ============================================================
dma = overlay.axi_dma_0

print('DMA handle:', dma)
print('Kernel is free-running -- no ap_start write needed.')

# ============================================================
# CELL 4: CAN Feature Extraction & Inference Functions
# ============================================================

def parse_can_log(log_text):
    """Parse candump-format log text. Returns list of (timestamp, can_id, payload_bytes)."""
    messages = []
    for line in log_text.splitlines():
        m = CAN_RE.match(line.strip())
        if m:
            ts      = float(m.group(1))
            can_id  = int(m.group(2), 16)
            payload = bytes.fromhex(m.group(3)) if m.group(3) else b''
            messages.append((ts, can_id, payload))
    return messages


def extract_features(messages):
    """
    Extract 169-dimensional feature vector from a window of 256 CAN messages.

    Feature layout (must match training):
      [0:128]   CAN-ID histogram  (ID % 128, normalized)
      [128:137] Payload-length histogram (len 0-8, raw counts)
      [137:153] Nibble histogram (high+low nibbles, normalized)
      [153:169] Statistical features (16 values)
    """
    timestamps = np.array([m[0] for m in messages], dtype=np.float64)
    ids        = np.array([m[1] for m in messages], dtype=np.float32)
    payloads   = [m[2] for m in messages]

    # 1. CAN-ID hash histogram (128 bins)
    id_hist = np.zeros(ID_HASH_BINS, dtype=np.float32)
    for cid in ids:
        id_hist[int(cid) % ID_HASH_BINS] += 1
    s = id_hist.sum()
    if s > 0:
        id_hist /= s

    # 2. Payload-length histogram (bins for lengths 0-8)
    len_hist = np.zeros(9, dtype=np.float32)
    for p in payloads:
        ln = min(len(p), 8)
        len_hist[ln] += 1

    # 3. Nibble histogram (16 bins: high nibble 0-7, low nibble 8-15)
    nibble_hist = np.zeros(16, dtype=np.float32)
    all_bytes = []
    for p in payloads:
        all_bytes.extend(p)
    if all_bytes:
        ab = np.array(all_bytes, dtype=np.uint8)
        high = (ab >> 4) & 0xF
        low  = ab & 0xF
        for h in high:
            nibble_hist[h] += 1
        n_low = nibble_hist.copy()
        n_low[:] = 0
        for l in low:
            n_low[l] += 1
        nibble_hist = np.concatenate([nibble_hist[:8], n_low[:8]])
        ns = nibble_hist.sum()
        if ns > 0:
            nibble_hist /= ns
    else:
        nibble_hist = np.zeros(16, dtype=np.float32)

    # 4. Statistical features (16)
    n = len(messages)
    unique_ids   = len(set(int(i) for i in ids))
    uid_ratio    = unique_ids / n if n > 0 else 0.0
    id_mean      = float(np.mean(ids))
    id_std       = float(np.std(ids))

    id_counts = {}
    for i in ids:
        id_counts[int(i)] = id_counts.get(int(i), 0) + 1
    sorted_counts = sorted(id_counts.values(), reverse=True)
    top1_ratio  = sorted_counts[0] / n if sorted_counts else 0.0
    top3_ratio  = sum(sorted_counts[:3]) / n if len(sorted_counts) >= 3 else top1_ratio

    if len(timestamps) > 1:
        deltas     = np.diff(timestamps)
        delta_mean = float(np.mean(deltas))
        delta_std  = float(np.std(deltas))
        delta_p75  = float(np.percentile(deltas, 75))
        delta_max  = float(np.max(deltas))
    else:
        delta_mean = delta_std = delta_p75 = delta_max = 0.0

    plen = np.array([len(p) for p in payloads], dtype=np.float32)
    plen_mean = float(np.mean(plen))
    plen_std  = float(np.std(plen))

    if all_bytes:
        ab_f = np.array(all_bytes, dtype=np.float32)
        byte_mean = float(np.mean(ab_f))
        byte_std  = float(np.std(ab_f))
        byte_p75  = float(np.percentile(ab_f, 75))
        frac_zero = float(np.mean(ab_f == 0))
        frac_ff   = float(np.mean(ab_f == 255))
    else:
        byte_mean = byte_std = byte_p75 = frac_zero = frac_ff = 0.0

    stat_feats = np.array([
        uid_ratio, id_mean, id_std, top1_ratio, top3_ratio,
        delta_mean, delta_std, delta_p75, delta_max,
        plen_mean, plen_std,
        byte_mean, byte_std, byte_p75, frac_zero, frac_ff,
    ], dtype=np.float32)

    return np.concatenate([id_hist, len_hist, nibble_hist, stat_feats])


def preprocess(feats):
    """Normalise features and quantise to Q8.8 uint32 words."""
    x = (np.asarray(feats, dtype=np.float32) - feat_mean) / (feat_std + 1e-8)
    q = np.clip(np.round(x * SCALE), -32768, 32767).astype(np.int16)
    return q.astype(np.uint16).astype(np.uint32)


def run_inference(feats):
    """
    Run one forward pass through the FPGA BNN accelerator.

    Parameters
    ----------
    feats : array-like, shape (169,) -- raw (un-normalised) float32 features

    Returns
    -------
    pred : int   -- class index (0=OpelAstra, 1=Prototype, 2=RenaultClio)
    ms   : float -- DMA round-trip latency in ms
    """
    in_buf  = allocate(shape=(N_IN,), dtype=np.uint32)
    out_buf = allocate(shape=(1,),    dtype=np.uint32)
    np.copyto(in_buf, preprocess(feats))
    t0 = time.perf_counter()
    dma.sendchannel.transfer(in_buf)
    dma.recvchannel.transfer(out_buf)
    dma.sendchannel.wait()
    dma.recvchannel.wait()
    t1 = time.perf_counter()
    pred = int(out_buf[0]) & 0x3   # 2-bit class index
    in_buf.freebuffer()
    out_buf.freebuffer()
    return pred, (t1 - t0) * 1000.0


def classify_log(log_text):
    """
    Classify a full CAN log by aggregating window predictions.

    Returns (class_name, class_idx, window_results, mean_latency_ms).
    """
    messages = parse_can_log(log_text)
    n_windows = len(messages) // WINDOW_STRIDE
    if n_windows == 0:
        raise ValueError(
            f'Not enough CAN messages ({len(messages)}) -- '
            f'need at least {WINDOW_SIZE} for one window.'
        )
    probs = np.zeros(N_OUT, dtype=np.float64)
    results = []
    for w in range(n_windows):
        start = w * WINDOW_STRIDE
        win   = messages[start : start + WINDOW_SIZE]
        feats = extract_features(win)
        pred, ms = run_inference(feats)
        probs[pred] += 1
        results.append((w, pred, CLASSES[pred], ms))
    probs /= n_windows
    final_class = int(np.argmax(probs))
    mean_ms = float(np.mean([r[3] for r in results]))
    return CLASSES[final_class], final_class, results, mean_ms, probs


print('Feature extraction and inference functions ready.')
print(f'  Feature vector: {N_IN} dims (128 ID-hist + 9 len-hist + 16 nibble + 16 stats)')

# ============================================================
# CELL 5: Single-Window Inference Test (Random Features)
# ============================================================
print('=' * 55)
print('  Single Inference Test -- Random Feature Vector')
print('=' * 55)

x_test = np.random.uniform(0.0, 0.5, N_IN).astype(np.float32)
pred, ms = run_inference(x_test)
class_name = CLASSES[pred] if 0 <= pred < len(CLASSES) else f'Unknown({pred})'

print(f'Prediction  : Class {pred}  ({class_name})')
print(f'Latency     : {ms:.3f} ms  (end-to-end incl. DMA)')
print()
print('(Random input -- prediction has no ground-truth meaning here.)')

# ============================================================
# CELL 6: Interactive Upload -- CAN .log file classification
# ============================================================
print('=' * 60)
print('  CAN Vehicle BNN FPGA Classifier -- Upload .log File')
print('=' * 60)

upload_btn = widgets.FileUpload(
    accept='.log',
    multiple=False,
    description='Upload .log',
    layout=widgets.Layout(width='200px')
)
out_widget = widgets.Output()

def on_upload_change(change):
    with out_widget:
        out_widget.clear_output()
        val = upload_btn.value
        if isinstance(val, dict):
            fname   = list(val.keys())[0]
            content = val[fname]['content']
        else:
            item    = list(val)[0]
            fname   = item.get('name', 'data.log') if isinstance(item, dict) else getattr(item, 'name', 'data.log')
            content = item.get('content', None)    if isinstance(item, dict) else getattr(item, 'content', None)
            if content is None:
                content = bytes(item)
        try:
            log_text = bytes(content).decode('utf-8', errors='ignore') if not isinstance(content, str) else content
            class_name, class_idx, results, mean_ms, probs = classify_log(log_text)
            print(f'File       : {fname}')
            print(f'Windows    : {len(results)}')
            print(f'Prediction : {class_name} (class {class_idx})')
            print(f'Confidence : {probs[class_idx]*100:.1f}%')
            print(f'Mean latency: {mean_ms:.3f} ms/window')
            print()
            print('Per-window results:')
            for w, pred, name, ms in results:
                print(f'  window {w:3d}: {name:<12} ({ms:.2f} ms)')
            print()
            print('Class probabilities (window vote):')
            for i, (cls, p) in enumerate(zip(CLASSES, probs)):
                bar = '#' * int(p * 40)
                print(f'  {cls:<12}: {p*100:5.1f}%  {bar}')
        except Exception as e:
            import traceback
            print(f'Error: {e}')
            traceback.print_exc()

upload_btn.observe(on_upload_change, names='value')

display(
    widgets.HTML(
        '<h3>CAN Vehicle BNN Hardware Classifier</h3>'
        '<p>Upload a <b>.log</b> file in candump format.<br>'
        'Format: <code>(timestamp) iface ID#payload</code><br>'
        'Classifies as <b>OpelAstra</b>, <b>Prototype</b>, or <b>RenaultClio</b>.</p>'
    ),
    upload_btn,
    out_widget
)

# ============================================================
# CELL 7: Batch Throughput Benchmark -- 500 Inferences
# ============================================================
N_BENCH = 500
xs = np.random.uniform(0.0, 0.5, (N_BENCH, N_IN)).astype(np.float32)

latencies   = []
predictions = []
t_wall_start = time.perf_counter()
for i in range(N_BENCH):
    pred, ms = run_inference(xs[i])
    latencies.append(ms)
    predictions.append(pred)
t_wall_end = time.perf_counter()

latencies = np.array(latencies)
total_ms  = (t_wall_end - t_wall_start) * 1000.0

print(f'Samples Processed  : {N_BENCH}')
print(f'Avg System Latency : {latencies.mean():.3f} ms  (incl. DMA overhead)')
print(f'Std Dev            : {latencies.std():.3f} ms')
print(f'Min / Max          : {latencies.min():.3f} ms / {latencies.max():.3f} ms')
print(f'P5  / P95          : {np.percentile(latencies, 5):.3f} ms / {np.percentile(latencies, 95):.3f} ms')
print(f'Throughput         : {1000.0 * N_BENCH / total_ms:.0f} inferences/sec')
print()

from collections import Counter
counts = Counter(CLASSES[p] if 0 <= p < len(CLASSES) else f'Unknown({p})' for p in predictions)
print('Prediction distribution (random input):')
for cls in CLASSES:
    cnt = counts.get(cls, 0)
    pct = 100.0 * cnt / N_BENCH
    bar = '#' * int(pct / 2)
    print(f'  {cls:<12} : {cnt:4d} ({pct:5.1f}%)  {bar}')

# ============================================================
# CELL 8: Debug -- DMA & Overlay Inspection
# ============================================================
print('Overlay IP dict:')
for name, info in overlay.ip_dict.items():
    print(f'  {name:<30} : {info.get("type", "?")}')

print()
print('DMA object:', dma)
print()
print('DMA channel status:')
try:
    print(f'  sendchannel  : running={dma.sendchannel.running}')
    print(f'  recvchannel  : running={dma.recvchannel.running}')
except Exception as e:
    print(f'  (could not read channel status: {e})')

print()
print('If inference hangs, reload the overlay:')
print('  overlay = Overlay("bnn_accelerator.bit")')
print('  dma = overlay.axi_dma_0')
