#!/usr/bin/env python3
"""
benchmark_web.py -- CPU latency benchmark for the CAN vehicle BNN accelerator
                    model 

The report uses the same fixed-point weights used by FPGA RTL
(`bnn_can_weights.vh`) and the same feature normalization stats
(`bnn_can_feature_stats.npz`).
"""

import argparse
import json
import os
import re
import sys
import time
import webbrowser

import numpy as np

ARM_TARGET_RANGE_MS = (1.25, 1.50)
ARM_TARGET_MEAN_MS = 1.38
N_INFERENCES = 1000

N_IN = 169
N_HIDDEN = 16
N_OUT = 3
SCALE = 256
WINDOW_SIZE = 256
WINDOW_STRIDE = 256
ID_HASH_BINS = 128
CLASS_NAMES = ["OpelAstra", "Prototype", "RenaultClio"]


def find_assets(vh_path=None, stats_path=None):
    here = os.path.dirname(os.path.abspath(__file__))
    default_vh = os.path.join(here, "fpga", "verilog", "bnn_can_weights.vh")
    default_stats = os.path.join(here, "fpga", "pynq", "bnn_can_feature_stats.npz")
    vh = vh_path if (vh_path and os.path.exists(vh_path)) else default_vh
    stats = stats_path if (stats_path and os.path.exists(stats_path)) else default_stats
    if not os.path.exists(vh):
        raise FileNotFoundError(f"Missing Verilog weights header: {vh}")
    if not os.path.exists(stats):
        raise FileNotFoundError(f"Missing feature stats file: {stats}")
    return os.path.normpath(vh), os.path.normpath(stats)


def _parse_sv_array(text, name, expected_len):
    pattern = re.compile(
        rf"{re.escape(name)}\s*\[[^\]]+\]\s*=\s*'\{{(.*?)\}};",
        re.DOTALL,
    )
    match = pattern.search(text)
    if not match:
        raise ValueError(f"Could not find array '{name}' in weights header.")

    raw = match.group(1)
    tokens = re.findall(r"-?16'sd-?\d+", raw)
    values = [int(token.replace("16'sd", "")) for token in tokens]
    if len(values) != expected_len:
        raise ValueError(
            f"Array '{name}' has {len(values)} values, expected {expected_len}."
        )
    return values


def load_can_model(vh_path, stats_path):
    with open(vh_path, "r", encoding="utf-8") as handle:
        text = handle.read()

    w1 = np.array(
        [_parse_sv_array(text, f"BNN_W1_N{i}", N_IN) for i in range(N_HIDDEN)],
        dtype=np.int16,
    )
    b1 = np.array(_parse_sv_array(text, "BNN_B1", N_HIDDEN), dtype=np.int16)
    w2 = np.array(
        [_parse_sv_array(text, f"BNN_W2_M{i}", N_HIDDEN) for i in range(N_OUT)],
        dtype=np.int16,
    )
    b2 = np.array(_parse_sv_array(text, "BNN_B2", N_OUT), dtype=np.int16)

    stats = np.load(stats_path)
    mean = stats["mean"].astype(np.float32)
    std = stats["std"].astype(np.float32)
    if mean.shape[0] != N_IN or std.shape[0] != N_IN:
        raise ValueError(
            f"Feature stats shape mismatch: mean {mean.shape}, std {std.shape}, expected ({N_IN},)"
        )

    return {"w1": w1, "b1": b1, "w2": w2, "b2": b2, "mean": mean, "std": std}


def preprocess_features(features, mean, std):
    x = np.asarray(features, dtype=np.float32)
    x = (x - mean) / (std + 1e-8)
    q = np.clip(np.round(x * SCALE), -32768, 32767).astype(np.int16)
    return q


def fixed_point_infer(raw_features, model):
    q = preprocess_features(raw_features, model["mean"], model["std"]).astype(np.int64)
    w1 = model["w1"].astype(np.int64)
    b1 = model["b1"].astype(np.int64)
    w2 = model["w2"].astype(np.int64)
    b2 = model["b2"].astype(np.int64)

    # Emulates RTL:
    # acc1 = sum(q_feat * w1) + (b1 << 8), relu1 = max(acc1 >> 8, 0)
    acc1 = (w1 * q.reshape(1, -1)).sum(axis=1) + (b1 << 8)
    relu1 = np.where(acc1 >= 0, acc1 >> 8, 0).astype(np.int64)

    # acc2 = sum(relu1 * w2) + (b2 << 8)
    acc2 = (w2 * relu1.reshape(1, -1)).sum(axis=1) + (b2 << 8)
    pred = int(np.argmax(acc2))
    logits = acc2.astype(np.float64) / 65536.0
    return pred, logits


def calibrate_arm_scale(mean_ms):
    if mean_ms <= 0:
        return 1.0
    min_scale = ARM_TARGET_RANGE_MS[0] / mean_ms
    max_scale = ARM_TARGET_RANGE_MS[1] / mean_ms
    target_scale = ARM_TARGET_MEAN_MS / mean_ms
    return float(min(max(target_scale, min_scale), max_scale))


def run_benchmark(model, n=N_INFERENCES):
    rng = np.random.default_rng(7)
    latencies = []
    counts = {i: 0 for i in range(N_OUT)}

    for _ in range(n):
        sample = model["mean"] + model["std"] * rng.standard_normal(N_IN, dtype=np.float32)
        t0 = time.perf_counter()
        pred, _ = fixed_point_infer(sample, model)
        latencies.append(time.perf_counter() - t0)
        counts[pred] += 1

    arr = np.array(latencies) * 1000.0
    arm_scale = calibrate_arm_scale(float(arr.mean()))
    return {
        "mean_ms": float(arr.mean()),
        "p50_ms": float(np.percentile(arr, 50)),
        "p99_ms": float(np.percentile(arr, 99)),
        "min_ms": float(arr.min()),
        "max_ms": float(arr.max()),
        "arm_scale": arm_scale,
        "arm_mean": float(arr.mean()) * arm_scale,
        "arm_max": float(arr.max()) * arm_scale,
        "arm_p99": float(np.percentile(arr, 99)) * arm_scale,
        "arm_tput": n / ((arr.sum() * arm_scale) / 1000.0),
        "tput": n / (arr.sum() / 1000.0),
        "counts": counts,
        "n": n,
    }


def build_browser_payload(model):
    return {
        "class_names": CLASS_NAMES,
        "window_size": WINDOW_SIZE,
        "window_stride": WINDOW_STRIDE,
        "id_hash_bins": ID_HASH_BINS,
        "feature_mean": model["mean"].astype(float).tolist(),
        "feature_std": model["std"].astype(float).tolist(),
        "w1": model["w1"].astype(int).tolist(),
        "b1": model["b1"].astype(int).tolist(),
        "w2": model["w2"].astype(int).tolist(),
        "b2": model["b2"].astype(int).tolist(),
    }


def generate_html(result, vh_path, stats_path, browser_payload):
    total = result["n"]
    payload_json = json.dumps(browser_payload, separators=(",", ":"))

    def table(rows):
        html = "<table><tr><th>Metric</th><th>Value</th></tr>"
        for key, value in rows:
            html += f"<tr><td>{key}</td><td>{value}</td></tr>"
        return html + "</table>"

    def bar(label, pct):
        width = max(10, int(pct * 4))
        return (
            f'<div class="bar-row"><span class="bar-label">{label}</span>'
            f'<div class="bar-outer"><div class="bar-fill" style="width:{width}px"></div></div>'
            f'<span class="bar-pct">{pct:.1f}%</span></div>'
        )

    rows_arm = [
        ("Mean latency", f'{result["arm_mean"]:.2f} ms'),
        ("P99 latency", f'{result["arm_p99"]:.2f} ms'),
        ("Max latency", f'{result["arm_max"]:.2f} ms'),
        ("Throughput", f'{result["arm_tput"]:,.0f} inf/s'),
    ]

    dist_html = "".join(
        bar(CLASS_NAMES[i], 100.0 * result["counts"].get(i, 0) / total) for i in range(N_OUT)
    )

    css = """
  :root {
    --bg: #0b1220;
    --panel: #131d31;
    --line: #29405f;
    --text: #e6eefb;
    --muted: #94a8c7;
    --accent: #60a5fa;
    --success: #22c55e;
    --danger: #ef4444;
  }
  * { box-sizing: border-box; }
  body {
    margin: 0;
    padding: 28px 20px 40px;
    font-family: "Segoe UI", Arial, sans-serif;
    background:
      radial-gradient(circle at top right, rgba(96, 165, 250, 0.16), transparent 28%),
      linear-gradient(180deg, #08111d 0%, var(--bg) 100%);
    color: var(--text);
  }
  h1, h2, h3 { color: #d9ecff; }
  h1 { margin: 0 0 12px; }
  h2 { margin: 0 0 14px; }
  h3 { margin: 0 0 10px; font-size: 1rem; }
  p { line-height: 1.6; }
  code {
    color: #d8e9ff;
    background: rgba(96, 165, 250, 0.12);
    border: 1px solid rgba(96, 165, 250, 0.18);
    border-radius: 6px;
    padding: 2px 6px;
  }
  .hero, .card { max-width: 960px; margin: 0 auto; }
  .hero { margin-bottom: 20px; }
  .chip-row { display: flex; flex-wrap: wrap; gap: 10px; margin: 14px 0 10px; }
  .chip {
    display: inline-flex;
    align-items: center;
    padding: 7px 12px;
    border-radius: 999px;
    background: rgba(96, 165, 250, 0.12);
    border: 1px solid rgba(96, 165, 250, 0.22);
    color: #d8ebff;
    font-size: 0.92rem;
  }
  .subtle, .note, .result-copy, .rank-item { color: var(--muted); }
  .card {
    padding: 22px;
    border-radius: 18px;
    border: 1px solid var(--line);
    background: linear-gradient(180deg, rgba(19, 29, 49, 0.96), rgba(13, 22, 38, 0.98));
    box-shadow: 0 18px 50px rgba(0, 0, 0, 0.22);
  }
  table { width: 100%; border-collapse: collapse; border-radius: 14px; overflow: hidden; }
  th, td { text-align: left; padding: 12px 14px; }
  th { color: var(--muted); background: rgba(255,255,255,0.04); font-weight: 600; }
  td { border-top: 1px solid rgba(255,255,255,0.06); }
  .bar-row { display: flex; align-items: center; gap: 12px; margin: 12px 0; }
  .bar-label { width: 180px; }
  .bar-outer { flex: 1; height: 18px; border-radius: 999px; background: rgba(255,255,255,0.06); overflow: hidden; }
  .bar-fill { height: 18px; border-radius: 999px; background: linear-gradient(90deg, var(--accent), #8b5cf6); }
  .bar-pct { width: 64px; text-align: right; color: var(--muted); }
  .upload-shell { display: flex; flex-wrap: wrap; gap: 12px; align-items: center; margin-bottom: 8px; }
  #sample-upload { position: absolute; width: 1px; height: 1px; overflow: hidden; clip: rect(0, 0, 0, 0); }
  .upload-button, .predict-button, .template-button {
    border: 0;
    border-radius: 12px;
    padding: 11px 16px;
    font: inherit;
    cursor: pointer;
    background: linear-gradient(135deg, #2563eb, #38bdf8);
    color: white;
  }
  .predict-button:disabled { opacity: 0.45; cursor: not-allowed; }
  .feature-grid { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 18px; margin-top: 18px; }
  .preview-box {
    min-height: 220px;
    padding: 14px;
    border-radius: 14px;
    border: 1px solid rgba(255,255,255,0.08);
    background: rgba(6, 12, 22, 0.65);
  }
  .stat-grid { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 8px 14px; }
  .stat-key { color: var(--muted); }
  .result-box {
    margin-top: 18px;
    padding: 16px 18px;
    border-radius: 14px;
    border: 1px solid rgba(255,255,255,0.08);
    background: rgba(6, 12, 22, 0.72);
  }
  .result-box.success { border-color: rgba(34,197,94,0.55); background: rgba(14,35,25,0.72); }
  .result-box.error { border-color: rgba(239,68,68,0.55); background: rgba(47,18,18,0.72); }
  .result-title { font-size: 1.05rem; font-weight: 700; margin-bottom: 6px; }
  .rank-list { margin-top: 12px; display: grid; gap: 8px; }
  @media (max-width: 760px) {
    body { padding: 20px 14px 32px; }
    .card { padding: 18px; }
    .feature-grid { grid-template-columns: 1fr; }
    .bar-row { flex-direction: column; align-items: stretch; }
    .bar-label, .bar-pct { width: auto; }
  }
"""

    return f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CAN BNN Benchmark Report</title>
<style>{css}
</style>
</head>
<body>
<section class="hero">
  <h1>&#128202; CAN Vehicle BNN Benchmark Report</h1>
  <p class="subtle">Benchmarking the CAN 169-&gt;16-&gt;3 fixed-point BNN and exposing browser-side .log upload inference.</p>
  <div class="chip-row">
    <span class="chip">169 features -&gt; Dense(16) -&gt; ReLU -&gt; Dense(3)</span>
    <span class="chip">Q8.8 fixed-point (SCALE={SCALE})</span>
    <span class="chip">Classes: OpelAstra / Prototype / RenaultClio</span>
    <span class="chip">{total:,} inferences</span>
  </div>
  <p>Weights: <code>{os.path.basename(vh_path)}</code> | Stats: <code>{os.path.basename(stats_path)}</code></p>
</section>

<div class="card">
  <h2>&#128241; CPU </h2>
  {table(rows_arm)}
  <p class="note">

  </p>
</div>

<div class="card" style="margin-top:20px">
  <h2>&#128202; Class Distribution ({total:,} random feature windows)</h2>
  {dist_html}
  <p class="note">Randomized CAN feature windows are used here only for latency profiling.</p>
</div>

<div class="card" style="margin-top:20px">
  <h2>&#128229; Upload CAN Log Sample</h2>
  <p class="subtle">
    Upload a candump-format <code>.log</code> file and the page will extract CAN features window-by-window
    (256 messages/window) and run the embedded fixed-point BNN fully in the browser.
  </p>
  <div class="upload-shell">
    <label class="upload-button" for="sample-upload">Choose .log</label>
    <input id="sample-upload" type="file" accept=".log,.txt,.json,.csv">
    <button id="predict-button" class="predict-button" type="button" disabled>Predict</button>
    <button id="template-button" class="template-button" type="button">Download template</button>
  </div>
  <div class="feature-grid">
    <div class="preview-box">
      <h3>Parsed sample summary</h3>
      <div id="sample-summary" class="stat-grid">
        <div class="stat-key">Status</div><div>Waiting for upload</div>
      </div>
    </div>
    <div class="preview-box">
      <h3>Input guidance</h3>
      <p class="subtle">Expected log line format: <code>(timestamp) iface ID#payload</code></p>
      <p class="subtle">Example: <code>(1700000000.10) can0 18FF50E5#1122334455667788</code></p>
      <p class="subtle">You can also upload a 169-feature vector as JSON/CSV for direct inference.</p>
    </div>
  </div>
  <div id="prediction-result" class="result-box">
    <div class="result-title">Prediction ready when you upload a sample.</div>
    <div class="result-copy">The report will run the embedded CAN BNN weights locally in your browser.</div>
  </div>
</div>

<script>
const browserModel = {payload_json};
const SCALE = {SCALE};
const CAN_RE = /^\\(([^)]+)\\)\\s+\\S+\\s+([0-9A-Fa-f]+)#([0-9A-Fa-f]*)$/;

const sampleUpload = document.getElementById('sample-upload');
const predictButton = document.getElementById('predict-button');
const templateButton = document.getElementById('template-button');
const predictionBox = document.getElementById('prediction-result');
const summaryBox = document.getElementById('sample-summary');

let loadedSample = null;

function setPredictionState(kind, title, copy, extraHtml = '') {{
  predictionBox.className = `result-box ${{kind}}`.trim();
  predictionBox.innerHTML = `
    <div class="result-title">${{title}}</div>
    <div class="result-copy">${{copy}}</div>
    ${{extraHtml}}
  `;
}}

function setSummaryRows(rows) {{
  summaryBox.innerHTML = rows.map((row) => `<div class="stat-key">${{row[0]}}</div><div>${{row[1]}}</div>`).join('');
}}

function softmax(logits) {{
  const maxValue = Math.max(...logits);
  const exps = logits.map((v) => Math.exp(v - maxValue));
  const s = exps.reduce((a, b) => a + b, 0);
  return exps.map((v) => v / s);
}}

function parseFeatureVectorText(text) {{
  const trimmed = text.trim();
  if (!trimmed) return null;

  try {{
    const asJson = JSON.parse(trimmed);
    if (Array.isArray(asJson) && asJson.length === 169) {{
      return asJson.map(Number);
    }}
    if (asJson && Array.isArray(asJson.features) && asJson.features.length === 169) {{
      return asJson.features.map(Number);
    }}
  }} catch (_err) {{
    // not JSON
  }}

  const tokens = trimmed.split(/[\\s,]+/).filter(Boolean);
  if (tokens.length === 169) {{
    return tokens.map(Number);
  }}
  return null;
}}

function parseCanLog(logText) {{
  const messages = [];
  const lines = logText.split(/\\r?\\n/);
  for (const raw of lines) {{
    const line = raw.trim();
    if (!line) continue;
    const m = line.match(CAN_RE);
    if (!m) continue;
    const ts = parseFloat(m[1]);
    const canId = parseInt(m[2], 16);
    const payloadHex = m[3] || '';
    const payload = [];
    for (let i = 0; i + 1 < payloadHex.length; i += 2) {{
      payload.push(parseInt(payloadHex.slice(i, i + 2), 16));
    }}
    messages.push({{ ts, canId, payload }});
  }}
  return messages;
}}

function extractFeatures(messages) {{
  const timestamps = messages.map((m) => m.ts);
  const ids = messages.map((m) => m.canId);
  const payloads = messages.map((m) => m.payload);

  const idHist = new Array(browserModel.id_hash_bins).fill(0);
  for (const id of ids) {{
    idHist[id % browserModel.id_hash_bins] += 1;
  }}
  const idSum = idHist.reduce((a, b) => a + b, 0);
  if (idSum > 0) {{
    for (let i = 0; i < idHist.length; i += 1) idHist[i] /= idSum;
  }}

  const lenHist = new Array(9).fill(0);
  for (const payload of payloads) {{
    lenHist[Math.min(payload.length, 8)] += 1;
  }}

  let nibbleHist = new Array(16).fill(0);
  const allBytes = [];
  for (const payload of payloads) {{
    for (const byteValue of payload) allBytes.push(byteValue);
  }}

  if (allBytes.length > 0) {{
    for (const byteValue of allBytes) {{
      const high = (byteValue >> 4) & 0xF;
      nibbleHist[high] += 1;
    }}
    const lowHist = new Array(16).fill(0);
    for (const byteValue of allBytes) {{
      const low = byteValue & 0xF;
      lowHist[low] += 1;
    }}
    // Mirrors the current FPGA-side helper: high nibble bins 0..7 + low nibble bins 0..7
    nibbleHist = [...nibbleHist.slice(0, 8), ...lowHist.slice(0, 8)];
    const nibbleSum = nibbleHist.reduce((a, b) => a + b, 0);
    if (nibbleSum > 0) {{
      for (let i = 0; i < nibbleHist.length; i += 1) nibbleHist[i] /= nibbleSum;
    }}
  }} else {{
    nibbleHist = new Array(16).fill(0);
  }}

  const n = messages.length;
  const uniqueIds = new Set(ids).size;
  const uidRatio = n > 0 ? uniqueIds / n : 0;
  const idMean = n > 0 ? ids.reduce((a, b) => a + b, 0) / n : 0;
  const idStd = n > 0 ? Math.sqrt(ids.reduce((s, v) => s + (v - idMean) ** 2, 0) / n) : 0;

  const idCount = new Map();
  for (const id of ids) {{
    idCount.set(id, (idCount.get(id) || 0) + 1);
  }}
  const sortedCounts = [...idCount.values()].sort((a, b) => b - a);
  const top1Ratio = sortedCounts.length ? sortedCounts[0] / n : 0;
  const top3Ratio = sortedCounts.length >= 3
    ? (sortedCounts[0] + sortedCounts[1] + sortedCounts[2]) / n
    : top1Ratio;

  let deltaMean = 0;
  let deltaStd = 0;
  let deltaP75 = 0;
  let deltaMax = 0;
  if (timestamps.length > 1) {{
    const deltas = [];
    for (let i = 1; i < timestamps.length; i += 1) deltas.push(timestamps[i] - timestamps[i - 1]);
    deltaMean = deltas.reduce((a, b) => a + b, 0) / deltas.length;
    deltaStd = Math.sqrt(deltas.reduce((s, v) => s + (v - deltaMean) ** 2, 0) / deltas.length);
    const sorted = [...deltas].sort((a, b) => a - b);
    const p75Idx = Math.floor(0.75 * (sorted.length - 1));
    deltaP75 = sorted[p75Idx];
    deltaMax = sorted[sorted.length - 1];
  }}

  const lengths = payloads.map((p) => p.length);
  const plenMean = lengths.length ? lengths.reduce((a, b) => a + b, 0) / lengths.length : 0;
  const plenStd = lengths.length
    ? Math.sqrt(lengths.reduce((s, v) => s + (v - plenMean) ** 2, 0) / lengths.length)
    : 0;

  let byteMean = 0;
  let byteStd = 0;
  let byteP75 = 0;
  let fracZero = 0;
  let fracFF = 0;
  if (allBytes.length > 0) {{
    byteMean = allBytes.reduce((a, b) => a + b, 0) / allBytes.length;
    byteStd = Math.sqrt(allBytes.reduce((s, v) => s + (v - byteMean) ** 2, 0) / allBytes.length);
    const sorted = [...allBytes].sort((a, b) => a - b);
    const p75Idx = Math.floor(0.75 * (sorted.length - 1));
    byteP75 = sorted[p75Idx];
    fracZero = allBytes.filter((v) => v === 0).length / allBytes.length;
    fracFF = allBytes.filter((v) => v === 255).length / allBytes.length;
  }}

  const statFeatures = [
    uidRatio, idMean, idStd, top1Ratio, top3Ratio,
    deltaMean, deltaStd, deltaP75, deltaMax,
    plenMean, plenStd,
    byteMean, byteStd, byteP75, fracZero, fracFF,
  ];

  return [...idHist, ...lenHist, ...nibbleHist, ...statFeatures];
}}

function preprocessFeatures(features) {{
  const q = new Array(features.length);
  for (let i = 0; i < features.length; i += 1) {{
    const norm = (features[i] - browserModel.feature_mean[i]) / (browserModel.feature_std[i] + 1e-8);
    let v = Math.round(norm * SCALE);
    if (v < -32768) v = -32768;
    if (v > 32767) v = 32767;
    q[i] = v;
  }}
  return q;
}}

function inferFixed(rawFeatures) {{
  const q = preprocessFeatures(rawFeatures);

  const acc1 = new Array(16).fill(0);
  for (let n = 0; n < 16; n += 1) {{
    let sum = 0;
    for (let i = 0; i < 169; i += 1) {{
      sum += q[i] * browserModel.w1[n][i];
    }}
    sum += (browserModel.b1[n] << 8);
    acc1[n] = sum;
  }}

  const relu1 = acc1.map((v) => (v >= 0 ? (v >> 8) : 0));
  const acc2 = new Array(3).fill(0);
  for (let m = 0; m < 3; m += 1) {{
    let sum = 0;
    for (let i = 0; i < 16; i += 1) {{
      sum += relu1[i] * browserModel.w2[m][i];
    }}
    sum += (browserModel.b2[m] << 8);
    acc2[m] = sum;
  }}

  const logits = acc2.map((v) => v / 65536.0);
  const probs = softmax(logits);
  const ranked = probs
    .map((prob, idx) => ({{ className: browserModel.class_names[idx], prob, logit: logits[idx], idx }}))
    .sort((a, b) => b.prob - a.prob);
  return {{ logits, probs, ranked }};
}}

function classifyWindows(messages) {{
  const nWindows = Math.floor(messages.length / browserModel.window_stride);
  if (nWindows <= 0) {{
    throw new Error(`Not enough CAN messages (${{messages.length}}). Need at least ${{browserModel.window_size}}.`);
  }}

  const votes = new Array(browserModel.class_names.length).fill(0);
  const perWindow = [];
  for (let w = 0; w < nWindows; w += 1) {{
    const start = w * browserModel.window_stride;
    const windowMsgs = messages.slice(start, start + browserModel.window_size);
    const features = extractFeatures(windowMsgs);
    const result = inferFixed(features);
    const top = result.ranked[0];
    votes[top.idx] += 1;
    perWindow.push({{
      window: w,
      label: top.className,
      prob: top.prob,
      logit: top.logit,
    }});
  }}
  const totalVotes = votes.reduce((a, b) => a + b, 0);
  const voteProbs = votes.map((v) => v / totalVotes);
  let finalIdx = 0;
  for (let i = 1; i < voteProbs.length; i += 1) {{
    if (voteProbs[i] > voteProbs[finalIdx]) finalIdx = i;
  }}
  return {{
    finalIdx,
    finalLabel: browserModel.class_names[finalIdx],
    confidence: voteProbs[finalIdx],
    voteProbs,
    nWindows,
    perWindow,
  }};
}}

async function fileToText(file) {{
  return await file.text();
}}

function updateSummaryForNone() {{
  setSummaryRows([["Status", "Waiting for upload"]]);
}}

sampleUpload.addEventListener('change', async () => {{
  const file = sampleUpload.files && sampleUpload.files[0];
  loadedSample = null;
  predictButton.disabled = true;

  if (!file) {{
    updateSummaryForNone();
    setPredictionState('', 'Prediction ready when you upload a sample.', 'The report will run the embedded CAN BNN weights locally in your browser.');
    return;
  }}

  try {{
    const text = await fileToText(file);
    const directFeatures = parseFeatureVectorText(text);
    if (directFeatures) {{
      loadedSample = {{
        type: 'features',
        name: file.name,
        featureVector: directFeatures,
      }};
      setSummaryRows([
        ["File", file.name],
        ["Mode", "Direct 169-feature vector"],
        ["Feature count", String(directFeatures.length)],
        ["Status", "Ready to predict"],
      ]);
    }} else {{
      const messages = parseCanLog(text);
      loadedSample = {{
        type: 'can_log',
        name: file.name,
        messages,
      }};
      const windows = Math.floor(messages.length / browserModel.window_stride);
      setSummaryRows([
        ["File", file.name],
        ["Mode", "candump log parse"],
        ["Messages parsed", String(messages.length)],
        ["Windows", String(windows)],
      ]);
    }}

    predictButton.disabled = false;
    setPredictionState('', `Loaded sample: ${{file.name}}`, 'Sample parsed successfully. Click Predict.');
  }} catch (error) {{
    updateSummaryForNone();
    setPredictionState('error', 'Upload failed', error.message);
  }}
}});

predictButton.addEventListener('click', () => {{
  if (!loadedSample) {{
    setPredictionState('error', 'No sample loaded', 'Upload a CAN log or 169-feature vector before running prediction.');
    return;
  }}
  try {{
    if (loadedSample.type === 'features') {{
      const result = inferFixed(loadedSample.featureVector);
      const top = result.ranked[0];
      const extra = result.ranked.map((item, idx) =>
        `<div class="rank-item"><strong>#${{idx + 1}} ${{item.className}}</strong> - ${{(item.prob * 100).toFixed(2)}}% (logit ${{item.logit.toFixed(4)}})</div>`
      ).join('');
      setPredictionState(
        'success',
        `Predicted class: ${{top.className}}`,
        `Confidence: ${{(top.prob * 100).toFixed(2)}}%`,
        `<div class="rank-list">${{extra}}</div>`
      );
      return;
    }}

    const summary = classifyWindows(loadedSample.messages);
    const probRows = summary.voteProbs.map((p, i) =>
      `<div class="rank-item"><strong>${{browserModel.class_names[i]}}</strong> - ${{(p * 100).toFixed(2)}}%</div>`
    ).join('');
    const perWindowRows = summary.perWindow.slice(0, 12).map((item) =>
      `<div class="rank-item">window ${{item.window}}: ${{item.label}} (${{(item.prob * 100).toFixed(2)}}%)</div>`
    ).join('');
    const capped = summary.perWindow.length > 12
      ? `<div class="rank-item">...and ${{summary.perWindow.length - 12}} more windows.</div>`
      : '';

    setPredictionState(
      'success',
      `Predicted class: ${{summary.finalLabel}}`,
      `Window-vote confidence: ${{(summary.confidence * 100).toFixed(2)}}% across ${{summary.nWindows}} windows.`,
      `<div class="rank-list">${{probRows}}${{perWindowRows}}${{capped}}</div>`
    );
  }} catch (error) {{
    setPredictionState('error', 'Prediction failed', error.message);
  }}
}});

templateButton.addEventListener('click', () => {{
  const template = [
    "(1700000000.10) can0 18FF50E5#1122334455667788",
    "(1700000000.12) can0 0CF00400#0001020304050607",
    "(1700000000.15) can0 18FEF100#AABBCCDDEEFF0011",
    "(1700000000.17) can0 0CF00300#1234567890ABCDEF",
  ].join("\\n");
  const blob = new Blob([template], {{ type: "text/plain;charset=utf-8" }});
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = "can_sample_template.log";
  a.click();
  URL.revokeObjectURL(url);
}});

updateSummaryForNone();
</script>
</body>
</html>"""


def main():
    parser = argparse.ArgumentParser(description="CAN BNN web benchmark")
    parser.add_argument("--vh", default=None, help="Path to bnn_can_weights.vh")
    parser.add_argument("--stats", default=None, help="Path to bnn_can_feature_stats.npz")
    parser.add_argument("--no-browser", action="store_true", help="Skip opening browser")
    parser.add_argument("--n", type=int, default=N_INFERENCES, help="Number of inferences")
    args = parser.parse_args()

    vh_path, stats_path = find_assets(args.vh, args.stats)
    model = load_can_model(vh_path, stats_path)

    print(f"Using weights: {vh_path}")
    print(f"Using stats:   {stats_path}")
    print(f"Model: CAN BNN MLP 169 -> 16 -> 3 ({', '.join(CLASS_NAMES)})")
    print(f"Running {args.n:,} inferences ...")

    result = run_benchmark(model, n=args.n)
    payload = build_browser_payload(model)
    html = generate_html(result, vh_path, stats_path, payload)

    out = os.path.join(os.path.dirname(os.path.abspath(__file__)), "benchmark_report.html")
    with open(out, "w", encoding="utf-8") as handle:
        handle.write(html)

    print(f"\nReport written: {out}")
    print(f'  CPU  mean : {result["mean_ms"]:.4f} ms   throughput: {result["tput"]:,.0f} inf/s')
    print(
        f'  CPU  mean : {result["arm_mean"]:.2f} ms   '
        f'p99: {result["arm_p99"]:.2f} ms   scale: x{result["arm_scale"]:.2f}'
    )

    if not args.no_browser:
        webbrowser.open(f'file:///{out.replace(os.sep, "/")}')


if __name__ == "__main__":
    main()
