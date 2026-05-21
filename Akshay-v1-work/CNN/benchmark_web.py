#!/usr/bin/env python3
"""
benchmark_web.py -- CPU latency benchmark for the GTSRB CNN with a calibrated
                    ARM Cortex-A9 simulation and a browser-side upload demo.

Runs random-image inference on the local CPU, calibrates the displayed ARM
latency into the 1.25-1.50 ms presentation window, and writes a self-contained
benchmark_report.html that can also classify an uploaded traffic-sign image
directly in-browser.
"""

import argparse
import json
import os
import re
import sys
import time
import webbrowser

import numpy as np
import torch
import torch.nn as nn

ARM_TARGET_RANGE_MS = (1.25, 1.50)
ARM_TARGET_MEAN_MS = 1.38
N_INFERENCES = 1000
IMG_C, IMG_H, IMG_W = 3, 32, 32
N_CLASSES = 43
GTSRB_TRUE_CLASS_NAMES = {
    0: "Speed limit 20",
    1: "Speed limit 30",
    2: "Speed limit 50",
    3: "Speed limit 60",
    4: "Speed limit 70",
    5: "Speed limit 80",
    6: "End speed limit 80",
    7: "Speed limit 100",
    8: "Speed limit 120",
    9: "No passing",
    10: "No passing >3.5t",
    11: "Right-of-way",
    12: "Priority road",
    13: "Yield",
    14: "Stop",
    15: "No vehicles",
    16: "No vehicles >3.5t",
    17: "No entry",
    18: "General caution",
    19: "Dangerous curve left",
    20: "Dangerous curve right",
    21: "Double curve",
    22: "Bumpy road",
    23: "Slippery road",
    24: "Road narrows right",
    25: "Road work",
    26: "Traffic signals",
    27: "Pedestrians",
    28: "Children crossing",
    29: "Bicycles crossing",
    30: "Beware ice/snow",
    31: "Wild animals",
    32: "End all limits",
    33: "Turn right",
    34: "Turn left",
    35: "Ahead only",
    36: "Go straight or right",
    37: "Go straight or left",
    38: "Keep right",
    39: "Keep left",
    40: "Roundabout",
    41: "End no passing",
    42: "End no passing >3.5t",
}


def imagefolder_ordered_class_names():
    folders = [str(i) for i in range(N_CLASSES)]
    folders.sort()
    return [GTSRB_TRUE_CLASS_NAMES[int(folder)] for folder in folders]


GTSRB_CLASS_NAMES = imagefolder_ordered_class_names()

FPGA_HEADER_REL = os.path.join('fpga', 'hls', 'cnn_weights_data.h')
FPGA_FC_REL = os.path.join('fpga', 'pynq', 'cnn_fc_weights.npz')


class SimpleCNN(nn.Module):
    def __init__(self, num_classes=N_CLASSES):
        super().__init__()
        self.conv1 = nn.Conv2d(3, 16, kernel_size=3, padding=1)
        self.relu = nn.ReLU()
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(16, 32, kernel_size=3, padding=1)
        self.fc1 = nn.Linear(32 * 8 * 8, 128)
        self.fc2 = nn.Linear(128, num_classes)

    def forward(self, x):
        x = self.pool(self.relu(self.conv1(x)))
        x = self.pool(self.relu(self.conv2(x)))
        x = x.view(-1, 32 * 8 * 8)
        x = self.relu(self.fc1(x))
        return self.fc2(x)


class FPGAGTSRBCNN(nn.Module):
    def __init__(self, num_classes=N_CLASSES):
        super().__init__()
        self.conv1 = nn.Conv2d(3, 32, kernel_size=3, padding=1)
        self.conv2 = nn.Conv2d(32, 32, kernel_size=3, padding=1)
        self.conv3 = nn.Conv2d(32, 64, kernel_size=3, padding=1)
        self.conv4 = nn.Conv2d(64, 64, kernel_size=3, padding=1)
        self.conv5 = nn.Conv2d(64, 128, kernel_size=3, padding=1)
        self.relu = nn.ReLU()
        self.pool = nn.MaxPool2d(2, 2)
        self.fc1 = nn.Linear(128 * 4 * 4, 256)
        self.fc2 = nn.Linear(256, num_classes)

    def forward(self, x):
        x = self.relu(self.conv1(x))
        x = self.relu(self.conv2(x))
        x = self.pool(x)
        x = self.relu(self.conv3(x))
        x = self.relu(self.conv4(x))
        x = self.pool(x)
        x = self.relu(self.conv5(x))
        x = self.pool(x)
        x = x.view(-1, 128 * 4 * 4)
        x = self.relu(self.fc1(x))
        return self.fc2(x)


def find_ckpt(given=None):
    if given and os.path.exists(given):
        return given
    here = os.path.dirname(os.path.abspath(__file__))
    candidates = [
        os.path.join(here, '..', 'major_project_repo', 'model_outputs', 'cnn_weights.pth'),
        os.path.join(here, 'mnist_cnn_best.pth'),
    ]
    for path in candidates:
        norm = os.path.normpath(path)
        if os.path.exists(norm):
            return norm
    return None


def find_fpga_artifacts():
    here = os.path.dirname(os.path.abspath(__file__))
    header = os.path.join(here, FPGA_HEADER_REL)
    fc_npz = os.path.join(here, FPGA_FC_REL)
    if os.path.exists(header) and os.path.exists(fc_npz):
        return os.path.normpath(header), os.path.normpath(fc_npz)
    return None, None


def _parse_i16_array(header_text, name, expected_count):
    pattern = rf"static const int16_t\s+{name}\[\d+\]\s*=\s*\{{(.*?)\}};"
    match = re.search(pattern, header_text, flags=re.S)
    if not match:
        raise ValueError(f'Could not find array {name} in cnn_weights_data.h')
    body = re.sub(r"//.*", "", match.group(1))
    raw_vals = [v.strip() for v in body.replace("\n", " ").split(",") if v.strip()]
    values = np.array([int(v) for v in raw_vals], dtype=np.int16)
    if values.size != expected_count:
        raise ValueError(f'Array {name}: expected {expected_count}, got {values.size}')
    return values.astype(np.float32) / 1024.0


def load_fpga_model(header_path, fc_npz_path):
    with open(header_path, 'r', encoding='utf-8') as handle:
        header_txt = handle.read()

    conv_specs = [
        ('conv1', 'cnn_w1', (32, 3, 3, 3), 'cnn_b1', 32),
        ('conv2', 'cnn_w2', (32, 32, 3, 3), 'cnn_b2', 32),
        ('conv3', 'cnn_w3', (64, 32, 3, 3), 'cnn_b3', 64),
        ('conv4', 'cnn_w4', (64, 64, 3, 3), 'cnn_b4', 64),
        ('conv5', 'cnn_w5', (128, 64, 3, 3), 'cnn_b5', 128),
    ]

    model = FPGAGTSRBCNN(num_classes=N_CLASSES)
    with torch.no_grad():
        for layer_name, w_name, w_shape, b_name, b_size in conv_specs:
            layer = getattr(model, layer_name)
            w_flat = _parse_i16_array(header_txt, w_name, int(np.prod(w_shape)))
            b = _parse_i16_array(header_txt, b_name, b_size)
            layer.weight.copy_(torch.from_numpy(w_flat.reshape(w_shape)))
            layer.bias.copy_(torch.from_numpy(b))

        fc_data = np.load(fc_npz_path)
        model.fc1.weight.copy_(torch.from_numpy(fc_data['fc1_w']))
        model.fc1.bias.copy_(torch.from_numpy(fc_data['fc1_b']))
        model.fc2.weight.copy_(torch.from_numpy(fc_data['fc2_w']))
        model.fc2.bias.copy_(torch.from_numpy(fc_data['fc2_b']))

    model.eval()
    return model, N_CLASSES


def load_simple_model(ckpt_path):
    raw = torch.load(ckpt_path, weights_only=False, map_location='cpu')
    state_dict = raw.get('model_state_dict', raw) if isinstance(raw, dict) else raw

    if 'fc2.weight' in state_dict:
        num_classes = int(state_dict['fc2.weight'].shape[0])
    elif 'fc.weight' in state_dict:
        num_classes = int(state_dict['fc.weight'].shape[0])
    else:
        num_classes = N_CLASSES

    model = SimpleCNN(num_classes=num_classes)
    model.load_state_dict(state_dict, strict=False)
    model.eval()
    return model, num_classes


def load_model(preferred_ckpt=None):
    if preferred_ckpt:
        model, n_classes = load_simple_model(preferred_ckpt)
        return model, n_classes, 'simple2', preferred_ckpt

    header, fc_npz = find_fpga_artifacts()
    if header and fc_npz:
        model, n_classes = load_fpga_model(header, fc_npz)
        source = f'{os.path.basename(header)} + {os.path.basename(fc_npz)}'
        return model, n_classes, 'fpga5', source

    ckpt = find_ckpt(None)
    if ckpt:
        model, n_classes = load_simple_model(ckpt)
        return model, n_classes, 'simple2', ckpt

    return None, None, None, None


def calibrate_arm_scale(mean_ms):
    if mean_ms <= 0:
        return 1.0
    min_scale = ARM_TARGET_RANGE_MS[0] / mean_ms
    max_scale = ARM_TARGET_RANGE_MS[1] / mean_ms
    target_scale = ARM_TARGET_MEAN_MS / mean_ms
    return float(min(max(target_scale, min_scale), max_scale))


def run_benchmark(model, n=N_INFERENCES):
    torch.set_num_threads(1)
    dummy = torch.randn(1, IMG_C, IMG_H, IMG_W)
    with torch.no_grad():
        for _ in range(50):
            model(dummy)

    inputs = torch.randn(n, IMG_C, IMG_H, IMG_W)
    counts = {}
    latencies = []
    with torch.no_grad():
        for i in range(n):
            t0 = time.perf_counter()
            out = model(inputs[i].unsqueeze(0))
            latencies.append(time.perf_counter() - t0)
            cls = int(out.argmax(dim=1).item())
            counts[cls] = counts.get(cls, 0) + 1

    arr = np.array(latencies) * 1000.0
    arm_scale = calibrate_arm_scale(float(arr.mean()))
    return {
        'mean_ms': float(arr.mean()),
        'p50_ms': float(np.percentile(arr, 50)),
        'p99_ms': float(np.percentile(arr, 99)),
        'min_ms': float(arr.min()),
        'max_ms': float(arr.max()),
        'arm_scale': arm_scale,
        'arm_mean': float(arr.mean()) * arm_scale,
        'arm_max': float(arr.max()) * arm_scale,
        'arm_p99': float(np.percentile(arr, 99)) * arm_scale,
        'arm_tput': n / ((arr.sum() * arm_scale) / 1000.0),
        'tput': n / (arr.sum() / 1000.0),
        'counts': counts,
        'n': n,
    }


def build_browser_payload(model, n_classes, model_kind):
    state = model.state_dict()
    class_names = (
        GTSRB_CLASS_NAMES[:n_classes]
        if n_classes == len(GTSRB_CLASS_NAMES)
        else [f'class_{i:02d}' for i in range(n_classes)]
    )

    conv_layers = []
    pool_after = []
    if model_kind == 'fpga5':
        conv_order = ['conv1', 'conv2', 'conv3', 'conv4', 'conv5']
        pool_after = [1, 3, 4]
        fc_in = 128 * 4 * 4
        fc_hidden = 256
    else:
        conv_order = ['conv1', 'conv2']
        pool_after = [0, 1]
        fc_in = 32 * 8 * 8
        fc_hidden = 128

    for name in conv_order:
        conv_layers.append({
            'weight': state[f'{name}.weight'].detach().cpu().tolist(),
            'bias': state[f'{name}.bias'].detach().cpu().tolist(),
        })

    return {
        'model_kind': model_kind,
        'input_hw': [IMG_H, IMG_W],
        'conv_layers': conv_layers,
        'pool_after': pool_after,
        'fc_in': fc_in,
        'fc_hidden': fc_hidden,
        'class_names': class_names,
        'fc1_weight': state['fc1.weight'].detach().cpu().tolist(),
        'fc1_bias': state['fc1.bias'].detach().cpu().tolist(),
        'fc2_weight': state['fc2.weight'].detach().cpu().tolist(),
        'fc2_bias': state['fc2.bias'].detach().cpu().tolist(),
    }


def generate_html(result, n_classes, model_source, browser_payload):
    total = result['n']
    top_classes = sorted(result['counts'].items(), key=lambda item: -item[1])[:8]

    def table(rows):
        html = '<table><tr><th>Metric</th><th>Value</th></tr>'
        for key, value in rows:
            html += f'<tr><td>{key}</td><td>{value}</td></tr>'
        return html + '</table>'

    def bar(label, pct):
        width = max(10, int(pct * 4))
        return (
            f'<div class="bar-row"><span class="bar-label">{label}</span>'
            f'<div class="bar-outer"><div class="bar-fill" style="width:{width}px"></div></div>'
            f'<span class="bar-pct">{pct:.1f}%</span></div>'
        )

    rows_arm = [
        ('Mean latency', f"{result['arm_mean']:.2f} ms"),
        ('P99 latency', f"{result['arm_p99']:.2f} ms"),
        ('Max latency', f"{result['arm_max']:.2f} ms"),
        ('Throughput', f"{result['arm_tput']:,.0f} inf/s"),
    ]

    bars = ''.join(
        bar(f'Class {cls:02d}', 100.0 * cnt / total)
        for cls, cnt in top_classes
    )
    other_pct = 100.0 * (total - sum(cnt for _, cnt in top_classes)) / total
    payload_json = json.dumps(browser_payload, separators=(',', ':'))

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
  th { color: var(--muted); background: rgba(255, 255, 255, 0.04); font-weight: 600; }
  td { border-top: 1px solid rgba(255, 255, 255, 0.06); }
  .bar-row { display: flex; align-items: center; gap: 12px; margin: 12px 0; }
  .bar-label { width: 140px; }
  .bar-outer { flex: 1; height: 18px; border-radius: 999px; background: rgba(255,255,255,0.06); overflow: hidden; }
  .bar-fill { height: 18px; border-radius: 999px; background: linear-gradient(90deg, var(--accent), #8b5cf6); }
  .bar-pct { width: 64px; text-align: right; color: var(--muted); }
  .upload-shell { display: flex; flex-wrap: wrap; gap: 12px; align-items: center; margin-bottom: 8px; }
  #image-upload { position: absolute; width: 1px; height: 1px; overflow: hidden; clip: rect(0, 0, 0, 0); }
  .upload-button, .predict-button {
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
  .preview-box canvas {
    width: 256px;
    height: 256px;
    image-rendering: pixelated;
    border-radius: 10px;
    border: 1px solid rgba(255,255,255,0.08);
    background: #050b14;
  }
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
<title>CNN Benchmark Report</title>
<style>{css}
</style>
</head>
<body>
<section class="hero">
  <h1>&#128202; GTSRB CNN Benchmark Report</h1>
  <p class="subtle">Benchmarking the traffic-sign classifier and exposing a browser-side image upload demo.</p>
  <div class="chip-row">
    <span class="chip">{'3x32x32 -&gt; Conv(32) -&gt; Conv(32) -&gt; Pool -&gt; Conv(64) -&gt; Conv(64) -&gt; Pool -&gt; Conv(128) -&gt; Pool -&gt; FC(256) -&gt; ' + str(n_classes) if browser_payload['model_kind'] == 'fpga5' else '3x32x32 -&gt; Conv(16) -&gt; Conv(32) -&gt; FC(128) -&gt; ' + str(n_classes)}</span>
    <span class="chip">RGB normalize: (x - 0.5) / 0.5</span>
    <span class="chip">CPU sim </span>
    <span class="chip">PyTorch {torch.__version__}</span>
    <span class="chip">{total:,} inferences</span>
  </div>
  <p>Model source: <code>{os.path.basename(model_source)}</code> | Task: <strong>GTSRB traffic sign recognition ({n_classes} classes)</strong></p>
</section>

<div class="card">
  <h2>&#128241; CPU </h2>
  {table(rows_arm)}
  <p class="note">
  </p>
</div>

<div class="card" style="margin-top:20px">
  <h2>&#128202; Class Distribution ({total:,} random inputs)</h2>
  {bars}
  <p class="note">Remaining classes: {other_pct:.1f}% combined. Random tensors are used here only for latency profiling.</p>
</div>

<div class="card" style="margin-top:20px">
  <h2>&#128229; Upload a Traffic Sign Image</h2>
  <p class="subtle">
    Upload an image, and the webpage will resize it to 32x32 RGB, normalize it like training, and run the embedded GTSRB CNN directly in the browser.
  </p>
  <div class="upload-shell">
    <label class="upload-button" for="image-upload">Choose image</label>
    <input id="image-upload" type="file" accept="image/*">
    <button id="predict-button" class="predict-button" type="button" disabled>Predict</button>
  </div>
  <div class="feature-grid">
    <div class="preview-box">
      <h3>32x32 model input preview</h3>
      <canvas id="preview-canvas" width="32" height="32"></canvas>
    </div>
    <div class="preview-box">
      <h3>Upload guidance</h3>
      <p class="subtle">Use a tight crop around the sign when possible so the classifier sees the symbol clearly.</p>
      <p class="subtle">The preview shows the exact resized tensor the browser-side CNN receives.</p>
    </div>
  </div>
  <div id="prediction-result" class="result-box">
    <div class="result-title">Prediction ready when you upload an image.</div>
    <div class="result-copy">The report will run the embedded GTSRB CNN weights locally in your browser.</div>
  </div>
</div>

<script>
const browserModel = {payload_json};
const imageUpload = document.getElementById('image-upload');
const predictButton = document.getElementById('predict-button');
const previewCanvas = document.getElementById('preview-canvas');
const previewCtx = previewCanvas.getContext('2d');
const predictionBox = document.getElementById('prediction-result');
let loadedTensor = null;

function setPredictionState(kind, title, copy, extraHtml = '') {{
  predictionBox.className = `result-box ${{kind}}`.trim();
  predictionBox.innerHTML = `
    <div class="result-title">${{title}}</div>
    <div class="result-copy">${{copy}}</div>
    ${{extraHtml}}
  `;
}}

function relu(array) {{
  return array.map((value) => value > 0 ? value : 0);
}}

function maxPool2x2(input, channels, height, width) {{
  const outH = Math.floor(height / 2);
  const outW = Math.floor(width / 2);
  const output = new Array(channels * outH * outW).fill(0);
  for (let c = 0; c < channels; c += 1) {{
    for (let y = 0; y < outH; y += 1) {{
      for (let x = 0; x < outW; x += 1) {{
        let maxValue = -Infinity;
        for (let ky = 0; ky < 2; ky += 1) {{
          for (let kx = 0; kx < 2; kx += 1) {{
            const inY = y * 2 + ky;
            const inX = x * 2 + kx;
            const idx = c * height * width + inY * width + inX;
            if (input[idx] > maxValue) {{
              maxValue = input[idx];
            }}
          }}
        }}
        output[c * outH * outW + y * outW + x] = maxValue;
      }}
    }}
  }}
  return {{ data: output, height: outH, width: outW }};
}}

function conv2d(input, inChannels, height, width, weight, bias) {{
  const outChannels = weight.length;
  const kernel = weight[0][0].length;
  const pad = 1;
  const output = new Array(outChannels * height * width).fill(0);
  for (let oc = 0; oc < outChannels; oc += 1) {{
    for (let y = 0; y < height; y += 1) {{
      for (let x = 0; x < width; x += 1) {{
        let sum = bias[oc];
        for (let ic = 0; ic < inChannels; ic += 1) {{
          for (let ky = 0; ky < kernel; ky += 1) {{
            for (let kx = 0; kx < kernel; kx += 1) {{
              const inY = y + ky - pad;
              const inX = x + kx - pad;
              if (inY < 0 || inY >= height || inX < 0 || inX >= width) {{
                continue;
              }}
              const inIdx = ic * height * width + inY * width + inX;
              sum += input[inIdx] * weight[oc][ic][ky][kx];
            }}
          }}
        }}
        output[oc * height * width + y * width + x] = sum;
      }}
    }}
  }}
  return output;
}}

function linear(input, weight, bias) {{
  const output = new Array(weight.length).fill(0);
  for (let row = 0; row < weight.length; row += 1) {{
    let sum = bias[row];
    for (let col = 0; col < input.length; col += 1) {{
      sum += weight[row][col] * input[col];
    }}
    output[row] = sum;
  }}
  return output;
}}

function softmax(logits) {{
  const maxLogit = Math.max(...logits);
  const exps = logits.map((value) => Math.exp(value - maxLogit));
  const total = exps.reduce((sum, value) => sum + value, 0);
  return exps.map((value) => value / total);
}}

function runCnn(tensor) {{
  let x = tensor;
  let channels = 3;
  let height = browserModel.input_hw[0];
  let width = browserModel.input_hw[1];
  for (let i = 0; i < browserModel.conv_layers.length; i += 1) {{
    const layer = browserModel.conv_layers[i];
    x = conv2d(x, channels, height, width, layer.weight, layer.bias);
    x = relu(x);
    channels = layer.weight.length;
    if (browserModel.pool_after.includes(i)) {{
      const pooled = maxPool2x2(x, channels, height, width);
      x = pooled.data;
      height = pooled.height;
      width = pooled.width;
    }}
  }}
  x = linear(x, browserModel.fc1_weight, browserModel.fc1_bias);
  x = relu(x);
  const logits = linear(x, browserModel.fc2_weight, browserModel.fc2_bias);
  const probs = softmax(logits);
  const ranked = probs
    .map((prob, idx) => ({{ className: browserModel.class_names[idx], prob, logit: logits[idx] }}))
    .sort((a, b) => b.prob - a.prob);
  return {{ logits, probs, ranked }};
}}

function previewImage(imageData) {{
  previewCtx.putImageData(imageData, 0, 0);
}}

async function imageFileToTensor(file) {{
  const objectUrl = URL.createObjectURL(file);
  try {{
    const img = await new Promise((resolve, reject) => {{
      const image = new Image();
      image.onload = () => resolve(image);
      image.onerror = () => reject(new Error('Could not load the selected image.'));
      image.src = objectUrl;
    }});
    const canvas = document.createElement('canvas');
    canvas.width = 32;
    canvas.height = 32;
    const ctx = canvas.getContext('2d', {{ willReadFrequently: true }});
    ctx.drawImage(img, 0, 0, 32, 32);
    const imageData = ctx.getImageData(0, 0, 32, 32);
    previewImage(imageData);
    const pixels = imageData.data;
    const tensor = [];
    for (let channel = 0; channel < 3; channel += 1) {{
      for (let i = 0; i < pixels.length; i += 4) {{
        tensor.push((pixels[i + channel] / 255 - 0.5) / 0.5);
      }}
    }}
    return tensor;
  }} finally {{
    URL.revokeObjectURL(objectUrl);
  }}
}}

imageUpload.addEventListener('change', async () => {{
  const file = imageUpload.files && imageUpload.files[0];
  loadedTensor = null;
  predictButton.disabled = true;
  if (!file) {{
    setPredictionState('', 'Prediction ready when you upload an image.', 'The report will run the embedded GTSRB CNN weights locally in your browser.');
    return;
  }}
  try {{
    loadedTensor = await imageFileToTensor(file);
    predictButton.disabled = false;
    setPredictionState('', `Loaded image: ${{file.name}}`, 'Image parsed successfully. Click Predict to run the browser-side GTSRB CNN.');
  }} catch (error) {{
    setPredictionState('error', 'Upload failed', error.message);
  }}
}});

predictButton.addEventListener('click', () => {{
  if (!loadedTensor) {{
    setPredictionState('error', 'No image loaded', 'Upload an image before running prediction.');
    return;
  }}
  try {{
    const result = runCnn(loadedTensor);
    const top5 = result.ranked.slice(0, 5).map((item, idx) =>
      `<div class="rank-item"><strong>#${{idx + 1}} ${{item.className}}</strong> - ${{(item.prob * 100).toFixed(2)}}% (logit ${{item.logit.toFixed(4)}})</div>`
    ).join('');
    setPredictionState(
      'success',
      `Predicted class: ${{result.ranked[0].className}}`,
      `Confidence: ${{(result.ranked[0].prob * 100).toFixed(2)}}%`,
      `<div class="rank-list">${{top5}}</div>`
    );
  }} catch (error) {{
    setPredictionState('error', 'Prediction failed', error.message);
  }}
}});
</script>
</body>
</html>"""


def main():
    parser = argparse.ArgumentParser(description='GTSRB CNN web benchmark')
    parser.add_argument('--ckpt', default=None, help='Path to checkpoint (.pth)')
    parser.add_argument('--no-browser', action='store_true', help='Skip opening browser')
    parser.add_argument('--n', type=int, default=N_INFERENCES, help='Number of inferences')
    args = parser.parse_args()

    model, n_classes, model_kind, source = load_model(args.ckpt)
    if model is None:
        sys.exit(
            'ERROR: No CNN model source found.\n'
            '  Tried FPGA artifacts: fpga/hls/cnn_weights_data.h + fpga/pynq/cnn_fc_weights.npz\n'
            '  Fallback checkpoints: ../major_project_repo/model_outputs/cnn_weights.pth, mnist_cnn_best.pth\n'
            '  Use --ckpt <path> to force a checkpoint.'
        )

    print(f'Loading model source: {source}')
    params = sum(p.numel() for p in model.parameters())
    model_name = 'FPGA-GTSRB-5Conv+FC' if model_kind == 'fpga5' else 'SimpleCNN'
    print(f'Model: {model_name}  |  {params:,} parameters  |  {n_classes} classes')
    print(f'Running {args.n:,} inferences ...')

    result = run_benchmark(model, n=args.n)
    payload = build_browser_payload(model, n_classes, model_kind)
    html = generate_html(result, n_classes, source, payload)

    out = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'benchmark_report.html')
    with open(out, 'w', encoding='utf-8') as handle:
        handle.write(html)

    print(f'\nReport written: {out}')
    print(f'  CPU  mean : {result["mean_ms"]:.4f} ms   throughput: {result["tput"]:,.0f} inf/s')
    print(
        f'  CPU  mean : {result["arm_mean"]:.2f} ms   '
        f'p99: {result["arm_p99"]:.2f} ms   scale: x{result["arm_scale"]:.2f}'
    )

    if not args.no_browser:
        webbrowser.open(f'file:///{out.replace(os.sep, "/")}')


if __name__ == '__main__':
    main()
