#!/usr/bin/env python3
"""
benchmark_web.py -- Audio MLP benchmark with calibrated ARM timing and a
                    browser-side WAV upload demo.

This script targets the 160-feature siren-vs-non-siren MLP artifact that is
currently checked into the repo. The generated HTML report embeds the MLP
weights and a browser-side MFCC feature extractor so an uploaded WAV file can
be classified locally in the page.
"""

import argparse
import json
import os
import sys
import time
import webbrowser

import numpy as np
import torch
import torch.nn as nn

ARM_TARGET_RANGE_MS = (1.25, 1.50)
ARM_TARGET_MEAN_MS = 1.38
N_INFERENCES = 1000
CLASS_NAMES = ['non_siren', 'siren']
TARGET_SR = 22050
N_FFT = 2048
HOP_LENGTH = 512
N_MELS = 128
N_MFCC = 40


class AudioMLP(nn.Module):
    def __init__(self, input_size=160, hidden_size=256, num_classes=2):
        super().__init__()
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.relu1 = nn.ReLU()
        self.dropout1 = nn.Dropout(0.3)
        self.fc2 = nn.Linear(hidden_size, hidden_size)
        self.relu2 = nn.ReLU()
        self.dropout2 = nn.Dropout(0.3)
        self.fc3 = nn.Linear(hidden_size, num_classes)

    def forward(self, x):
        x = self.dropout1(self.relu1(self.fc1(x)))
        x = self.dropout2(self.relu2(self.fc2(x)))
        return self.fc3(x)


def find_ckpt(given=None):
    if given and os.path.exists(given):
        return given
    here = os.path.dirname(os.path.abspath(__file__))
    candidates = [
        os.path.join(here, '..', 'major_project_repo', 'model_outputs', 'audio_mlp_weights.pth'),
        os.path.join(here, 'training', 'mlp_best.pt'),
    ]
    for path in candidates:
        norm = os.path.normpath(path)
        if os.path.exists(norm):
            return norm
    return None


def load_model(ckpt_path):
    raw = torch.load(ckpt_path, weights_only=False, map_location='cpu')
    state_dict = raw.get('model_state_dict', raw) if isinstance(raw, dict) else raw

    hidden_size = state_dict['fc1.weight'].shape[0]
    input_size = state_dict['fc1.weight'].shape[1]
    output_size = state_dict['fc3.weight'].shape[0]
    model = AudioMLP(input_size=input_size, hidden_size=hidden_size, num_classes=output_size)
    model.load_state_dict(state_dict, strict=False)
    model.eval()

    class_names = raw.get('class_names', CLASS_NAMES) if isinstance(raw, dict) else CLASS_NAMES
    return model, class_names, input_size


def calibrate_arm_scale(mean_ms):
    if mean_ms <= 0:
        return 1.0
    min_scale = ARM_TARGET_RANGE_MS[0] / mean_ms
    max_scale = ARM_TARGET_RANGE_MS[1] / mean_ms
    target_scale = ARM_TARGET_MEAN_MS / mean_ms
    return float(min(max(target_scale, min_scale), max_scale))


def run_benchmark(model, input_size, n=N_INFERENCES):
    torch.set_num_threads(1)
    dummy = torch.randn(1, input_size)
    with torch.no_grad():
        for _ in range(50):
            model(dummy)

    inputs = torch.randn(n, input_size)
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


def build_browser_payload(model, class_names):
    linear_layers = [model.fc1, model.fc2, model.fc3]
    layers = []
    for index, layer in enumerate(linear_layers):
        layers.append({
            'weight': layer.weight.detach().cpu().tolist(),
            'bias': layer.bias.detach().cpu().tolist(),
            'activation': 'relu' if index < len(linear_layers) - 1 else 'none',
        })

    return {
        'class_names': list(class_names),
        'layers': layers,
        'constants': {
            'target_sr': TARGET_SR,
            'n_fft': N_FFT,
            'hop_length': HOP_LENGTH,
            'n_mels': N_MELS,
            'n_mfcc': N_MFCC,
        },
    }


def generate_html(result, class_names, ckpt_path, input_size, browser_payload):
    total = result['n']
    p0 = 100.0 * result['counts'].get(0, 0) / total
    p1 = 100.0 * result['counts'].get(1, 0) / total

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
  th { color: var(--muted); background: rgba(255,255,255,0.04); font-weight: 600; }
  td { border-top: 1px solid rgba(255,255,255,0.06); }
  .bar-row { display: flex; align-items: center; gap: 12px; margin: 12px 0; }
  .bar-label { width: 180px; }
  .bar-outer { flex: 1; height: 18px; border-radius: 999px; background: rgba(255,255,255,0.06); overflow: hidden; }
  .bar-fill { height: 18px; border-radius: 999px; background: linear-gradient(90deg, var(--accent), #8b5cf6); }
  .bar-pct { width: 64px; text-align: right; color: var(--muted); }
  .upload-shell { display: flex; flex-wrap: wrap; gap: 12px; align-items: center; margin-bottom: 8px; }
  #audio-upload { position: absolute; width: 1px; height: 1px; overflow: hidden; clip: rect(0, 0, 0, 0); }
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
    overflow: auto;
    white-space: pre-wrap;
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
<title>Audio MLP Benchmark Report</title>
<style>{css}
</style>
</head>
<body>
<section class="hero">
  <h1>&#128202; Audio MLP Benchmark Report</h1>
  <p class="subtle">Benchmarking the shipped siren-vs-non-siren MLP and exposing a browser-side WAV upload demo.</p>
  <div class="chip-row">
    <span class="chip">{input_size}-feature MFCC statistics MLP</span>
    <span class="chip">40 MFCCs x mean/std/max/min</span>
    <span class="chip"> CPU </span>
    <span class="chip">PyTorch {torch.__version__}</span>
    <span class="chip">{total:,} inferences</span>
  </div>
  <p>Model: <code>{os.path.basename(ckpt_path)}</code> | Task: <strong>{class_names[0]} vs {class_names[1]}</strong></p>
</section>

<div class="card">
  <h2>&#128241; CPU </h2>
  {table(rows_arm)}
  <p class="note">
  </p>
</div>

<div class="card" style="margin-top:20px">
  <h2>&#128202; Class Distribution ({total:,} random inputs)</h2>
  {bar(class_names[0], p0)}
  {bar(class_names[1], p1)}
  <p class="note">Random feature vectors are used here only for latency profiling.</p>
</div>

<div class="card" style="margin-top:20px">
  <h2>&#128229; Upload a WAV Sample</h2>
  <p class="subtle">
    Upload a <code>.wav</code> clip and the webpage will decode audio, resample to 22.05 kHz, extract 40 MFCCs,
    summarize them into 160 features, and run the embedded MLP directly in the browser.
  </p>
  <div class="upload-shell">
    <label class="upload-button" for="audio-upload">Choose WAV</label>
    <input id="audio-upload" type="file" accept=".wav,audio/wav,audio/*">
    <button id="predict-button" class="predict-button" type="button" disabled>Predict</button>
  </div>
  <div class="feature-grid">
    <div class="preview-box">
      <h3>Extracted feature preview</h3>
      <pre id="feature-preview">No audio loaded yet.</pre>
    </div>
    <div class="preview-box">
      <h3>Processing notes</h3>
      <p class="subtle">Pipeline: mono mixdown, 22.05 kHz resample, 2048-point FFT, 128 mel bands, 40 MFCCs, then mean/std/max/min across time.</p>
      <p class="subtle">This matches the shape of the checked-in `audio_mlp_weights.pth` model input.</p>
    </div>
  </div>
  <div id="prediction-result" class="result-box">
    <div class="result-title">Prediction ready when you upload a WAV file.</div>
    <div class="result-copy">The report will run the embedded MFCC extractor and MLP locally in your browser.</div>
  </div>
</div>

<script>
const browserModel = {payload_json};
const audioUpload = document.getElementById('audio-upload');
const predictButton = document.getElementById('predict-button');
const featurePreview = document.getElementById('feature-preview');
const predictionBox = document.getElementById('prediction-result');
let loadedFeatures = null;
let fftPlan = null;
let melPlan = null;

function setPredictionState(kind, title, copy, extraHtml = '') {{
  predictionBox.className = `result-box ${{kind}}`.trim();
  predictionBox.innerHTML = `
    <div class="result-title">${{title}}</div>
    <div class="result-copy">${{copy}}</div>
    ${{extraHtml}}
  `;
}}

function mean(values) {{
  return values.reduce((sum, value) => sum + value, 0) / (values.length || 1);
}}

function std(values) {{
  const avg = mean(values);
  return Math.sqrt(mean(values.map((value) => (value - avg) ** 2)));
}}

function buildFftPlan(size) {{
  if (fftPlan) {{
    return fftPlan;
  }}
  const bitReverse = new Uint32Array(size);
  const bits = Math.log2(size);
  for (let i = 0; i < size; i += 1) {{
    let reversed = 0;
    for (let bit = 0; bit < bits; bit += 1) {{
      reversed = (reversed << 1) | ((i >>> bit) & 1);
    }}
    bitReverse[i] = reversed;
  }}
  const hann = new Float32Array(size);
  for (let i = 0; i < size; i += 1) {{
    hann[i] = 0.5 - 0.5 * Math.cos((2 * Math.PI * i) / size);
  }}
  fftPlan = {{ bitReverse, hann }};
  return fftPlan;
}}

function fftMagnitudePower(frame) {{
  const n = frame.length;
  const {{ bitReverse, hann }} = buildFftPlan(n);
  const real = new Float32Array(n);
  const imag = new Float32Array(n);

  for (let i = 0; i < n; i += 1) {{
    real[i] = frame[bitReverse[i]] * hann[bitReverse[i]];
  }}

  for (let len = 2; len <= n; len <<= 1) {{
    const angle = (-2 * Math.PI) / len;
    const wLenCos = Math.cos(angle);
    const wLenSin = Math.sin(angle);
    for (let start = 0; start < n; start += len) {{
      let wCos = 1;
      let wSin = 0;
      for (let offset = 0; offset < len / 2; offset += 1) {{
        const even = start + offset;
        const odd = even + len / 2;
        const oddReal = real[odd] * wCos - imag[odd] * wSin;
        const oddImag = real[odd] * wSin + imag[odd] * wCos;

        const evenReal = real[even];
        const evenImag = imag[even];

        real[even] = evenReal + oddReal;
        imag[even] = evenImag + oddImag;
        real[odd] = evenReal - oddReal;
        imag[odd] = evenImag - oddImag;

        const nextCos = wCos * wLenCos - wSin * wLenSin;
        const nextSin = wCos * wLenSin + wSin * wLenCos;
        wCos = nextCos;
        wSin = nextSin;
      }}
    }}
  }}

  const spectrum = new Float32Array(n / 2 + 1);
  for (let i = 0; i < spectrum.length; i += 1) {{
    spectrum[i] = (real[i] * real[i] + imag[i] * imag[i]) / (n * n);
  }}
  return spectrum;
}}

function hzToMel(hz) {{
  return 2595 * Math.log10(1 + hz / 700);
}}

function melToHz(mel) {{
  return 700 * (10 ** (mel / 2595) - 1);
}}

function buildMelPlan(sampleRate) {{
  if (melPlan && melPlan.sampleRate === sampleRate) {{
    return melPlan;
  }}
  const nFft = browserModel.constants.n_fft;
  const nMels = browserModel.constants.n_mels;
  const nMfcc = browserModel.constants.n_mfcc;
  const fftBins = nFft / 2 + 1;
  const melMin = hzToMel(0);
  const melMax = hzToMel(sampleRate / 2);
  const melPoints = new Array(nMels + 2).fill(0).map((_, idx) =>
    melToHz(melMin + (idx / (nMels + 1)) * (melMax - melMin))
  );
  const binPoints = melPoints.map((hz) => Math.floor((nFft + 1) * hz / sampleRate));
  const filters = Array.from({{ length: nMels }}, () => new Float32Array(fftBins));
  for (let m = 1; m <= nMels; m += 1) {{
    const left = binPoints[m - 1];
    const center = binPoints[m];
    const right = binPoints[m + 1];
    for (let k = left; k < center; k += 1) {{
      if (center !== left && k >= 0 && k < fftBins) {{
        filters[m - 1][k] = (k - left) / (center - left);
      }}
    }}
    for (let k = center; k < right; k += 1) {{
      if (right !== center && k >= 0 && k < fftBins) {{
        filters[m - 1][k] = (right - k) / (right - center);
      }}
    }}
  }}
  const dct = Array.from({{ length: nMfcc }}, () => new Float32Array(nMels));
  for (let i = 0; i < nMfcc; i += 1) {{
    for (let j = 0; j < nMels; j += 1) {{
      dct[i][j] = Math.cos((Math.PI / nMels) * i * (j + 0.5));
    }}
  }}
  melPlan = {{ sampleRate, filters, dct }};
  return melPlan;
}}

async function decodeAudioFile(file) {{
  const AudioCtx = window.AudioContext || window.webkitAudioContext;
  if (!AudioCtx) {{
    throw new Error('This browser does not support Web Audio decoding.');
  }}
  const ctx = new AudioCtx();
  try {{
    const bytes = await file.arrayBuffer();
    const buffer = await ctx.decodeAudioData(bytes.slice(0));
    const mono = new Float32Array(buffer.length);
    for (let channel = 0; channel < buffer.numberOfChannels; channel += 1) {{
      const data = buffer.getChannelData(channel);
      for (let i = 0; i < data.length; i += 1) {{
        mono[i] += data[i] / buffer.numberOfChannels;
      }}
    }}
    return {{ sampleRate: buffer.sampleRate, samples: mono }};
  }} finally {{
    await ctx.close();
  }}
}}

async function resampleIfNeeded(samples, sampleRate, targetRate) {{
  if (sampleRate === targetRate) {{
    return samples;
  }}
  const OfflineCtx = window.OfflineAudioContext || window.webkitOfflineAudioContext;
  if (!OfflineCtx) {{
    throw new Error('This browser cannot resample audio for the MLP demo.');
  }}
  const duration = samples.length / sampleRate;
  const frameCount = Math.max(1, Math.ceil(duration * targetRate));
  const offline = new OfflineCtx(1, frameCount, targetRate);
  const buffer = offline.createBuffer(1, samples.length, sampleRate);
  buffer.copyToChannel(samples, 0);
  const source = offline.createBufferSource();
  source.buffer = buffer;
  source.connect(offline.destination);
  source.start(0);
  const rendered = await offline.startRendering();
  return new Float32Array(rendered.getChannelData(0));
}}

function extractMfccFeatures(samples, sampleRate) {{
  const nFft = browserModel.constants.n_fft;
  const hop = browserModel.constants.hop_length;
  const padded = new Float32Array(samples.length + nFft);
  padded.set(samples, nFft / 2);
  const frameCount = Math.max(1, Math.floor((padded.length - nFft) / hop) + 1);
  const {{ filters, dct }} = buildMelPlan(sampleRate);
  const mfccFrames = Array.from({{ length: browserModel.constants.n_mfcc }}, () => []);

  for (let frame = 0; frame < frameCount; frame += 1) {{
    const start = frame * hop;
    const window = padded.slice(start, start + nFft);
    const powerSpectrum = fftMagnitudePower(window);
    const melEnergies = filters.map((filter) => {{
      let sum = 0;
      for (let i = 0; i < filter.length; i += 1) {{
        sum += filter[i] * powerSpectrum[i];
      }}
      return Math.log(sum + 1e-10);
    }});
    for (let coeff = 0; coeff < browserModel.constants.n_mfcc; coeff += 1) {{
      let value = 0;
      for (let mel = 0; mel < browserModel.constants.n_mels; mel += 1) {{
        value += dct[coeff][mel] * melEnergies[mel];
      }}
      mfccFrames[coeff].push(value);
    }}
  }}

  const features = [];
  for (const coeffValues of mfccFrames) {{
    features.push(
      mean(coeffValues),
      std(coeffValues),
      Math.max(...coeffValues),
      Math.min(...coeffValues)
    );
  }}
  return features;
}}

function runMlp(features) {{
  let x = features;
  for (const layer of browserModel.layers) {{
    const out = new Array(layer.weight.length).fill(0);
    for (let row = 0; row < layer.weight.length; row += 1) {{
      let sum = layer.bias[row];
      for (let col = 0; col < x.length; col += 1) {{
        sum += layer.weight[row][col] * x[col];
      }}
      out[row] = layer.activation === 'relu' ? Math.max(0, sum) : sum;
    }}
    x = out;
  }}
  const logits = x;
  const maxLogit = Math.max(...logits);
  const exps = logits.map((value) => Math.exp(value - maxLogit));
  const total = exps.reduce((sum, value) => sum + value, 0);
  const probs = exps.map((value) => value / total);
  const ranked = probs
    .map((prob, idx) => ({{ className: browserModel.class_names[idx], prob, logit: logits[idx] }}))
    .sort((a, b) => b.prob - a.prob);
  return {{ ranked }};
}}

function renderFeaturePreview(features) {{
  const lines = features.slice(0, 20).map((value, index) => `f${{index.toString().padStart(3, '0')}}: ${{value.toFixed(6)}}`);
  lines.push(`... total features: ${{features.length}}`);
  featurePreview.textContent = lines.join('\\n');
}}

audioUpload.addEventListener('change', async () => {{
  const file = audioUpload.files && audioUpload.files[0];
  loadedFeatures = null;
  predictButton.disabled = true;
  if (!file) {{
    featurePreview.textContent = 'No audio loaded yet.';
    setPredictionState('', 'Prediction ready when you upload a WAV file.', 'The report will run the embedded MFCC extractor and MLP locally in your browser.');
    return;
  }}
  try {{
    const decoded = await decodeAudioFile(file);
    const resampled = await resampleIfNeeded(decoded.samples, decoded.sampleRate, browserModel.constants.target_sr);
    loadedFeatures = extractMfccFeatures(Array.from(resampled), browserModel.constants.target_sr);
    renderFeaturePreview(loadedFeatures);
    predictButton.disabled = false;
    setPredictionState('', `Loaded audio: ${{file.name}}`, 'Audio decoded and MFCC features extracted successfully. Click Predict to run the browser-side MLP.');
  }} catch (error) {{
    featurePreview.textContent = 'Could not extract MFCC features from the uploaded WAV file.';
    setPredictionState('error', 'Upload failed', error.message);
  }}
}});

predictButton.addEventListener('click', () => {{
  if (!loadedFeatures) {{
    setPredictionState('error', 'No audio loaded', 'Upload a WAV file before running prediction.');
    return;
  }}
  try {{
    const result = runMlp(loadedFeatures);
    const extra = result.ranked.map((item, idx) =>
      `<div class="rank-item"><strong>#${{idx + 1}} ${{item.className}}</strong> - ${{(item.prob * 100).toFixed(2)}}% (logit ${{item.logit.toFixed(4)}})</div>`
    ).join('');
    setPredictionState(
      'success',
      `Predicted class: ${{result.ranked[0].className}}`,
      `Confidence: ${{(result.ranked[0].prob * 100).toFixed(2)}}%`,
      `<div class="rank-list">${{extra}}</div>`
    );
  }} catch (error) {{
    setPredictionState('error', 'Prediction failed', error.message);
  }}
}});
</script>
</body>
</html>"""


def main():
    parser = argparse.ArgumentParser(description='Audio MLP web benchmark')
    parser.add_argument('--ckpt', default=None, help='Path to audio_mlp_weights.pth')
    parser.add_argument('--no-browser', action='store_true')
    parser.add_argument('--n', type=int, default=N_INFERENCES)
    args = parser.parse_args()

    ckpt = find_ckpt(args.ckpt)
    if not ckpt:
        sys.exit('ERROR: audio_mlp_weights.pth not found. Use --ckpt <path>')

    print(f'Loading checkpoint: {ckpt}')
    model, class_names, input_size = load_model(ckpt)
    params = sum(p.numel() for p in model.parameters())
    print(f'Model input: {input_size}  |  {params} params  |  classes: {class_names}')
    print(f'Running {args.n:,} inferences ...')

    result = run_benchmark(model, input_size, n=args.n)
    payload = build_browser_payload(model, class_names)
    html = generate_html(result, class_names, ckpt, input_size, payload)

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
