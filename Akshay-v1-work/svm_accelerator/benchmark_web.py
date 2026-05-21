#!/usr/bin/env python3
"""
benchmark_web.py -- CPU latency benchmark for the SVM lane-change classifier
                    (NGSIM features -> Linear SVM -> keep_lane / change_lane)
                    with a calibrated ARM Cortex-A9 simulation.

Runs 1,000 inferences on random pre-scaled feature vectors (N~(0,1)),
reports x86-64 measured latency and a calibrated ARM A9 latency model, then
writes benchmark_report.html.

The generated report also embeds the trained linear SVM coefficients so the
webpage can accept a sample upload (.json/.csv/.txt) and return a prediction
directly in the browser.

Usage:
    python benchmark_web.py
    python benchmark_web.py --no-browser
    python benchmark_web.py --model /path/to/svm_model.pkl
    python benchmark_web.py --scaler /path/to/svm_scaler.pkl
    python benchmark_web.py --features /path/to/svm_feature_names.pkl
    python benchmark_web.py --n 500

Dependencies: scikit-learn, joblib, numpy
"""

import argparse
import json
import os
import sys
import time
import webbrowser

import joblib
import numpy as np

ARM_TARGET_RANGE_MS = (1.25, 1.50)
ARM_TARGET_MEAN_MS = 1.38
N_INFERENCES = 1000
CLASS_NAMES = ['keep_lane', 'change_lane']
CLASS_BADGES = ['KL', 'CL']


def _resolve(given, *candidates):
    if given and os.path.exists(given):
        return given
    for path in candidates:
        norm = os.path.normpath(path)
        if os.path.exists(norm):
            return norm
    return None


def find_paths(model_arg=None, scaler_arg=None, features_arg=None):
    here = os.path.dirname(os.path.abspath(__file__))
    out_dir = os.path.join(here, '..', 'major_project_repo', 'model_outputs')
    model = _resolve(model_arg, os.path.join(out_dir, 'svm_model.pkl'))
    scaler = _resolve(scaler_arg, os.path.join(out_dir, 'svm_scaler.pkl'))
    features = _resolve(features_arg, os.path.join(out_dir, 'svm_feature_names.pkl'))
    return model, scaler, features


def infer_feature_count(clf, scaler=None, feature_names=None):
    if scaler is not None and hasattr(scaler, 'n_features_in_'):
        return int(scaler.n_features_in_)
    if feature_names:
        return len(feature_names)
    if hasattr(clf, 'support_vectors_'):
        return int(clf.support_vectors_.shape[1])
    if hasattr(clf, 'coef_'):
        return int(clf.coef_.shape[1])
    raise RuntimeError('Unable to determine feature count from model assets.')


def load_assets(model_path, scaler_path=None, features_path=None):
    clf = joblib.load(model_path)
    scaler = joblib.load(scaler_path) if scaler_path else None
    feature_names = joblib.load(features_path) if features_path else None
    if feature_names is not None:
        feature_names = list(feature_names)
    return clf, scaler, feature_names


def calibrate_arm_scale(mean_ms):
    if mean_ms <= 0:
        return 1.0
    min_scale = ARM_TARGET_RANGE_MS[0] / mean_ms
    max_scale = ARM_TARGET_RANGE_MS[1] / mean_ms
    target_scale = ARM_TARGET_MEAN_MS / mean_ms
    return float(min(max(target_scale, min_scale), max_scale))


def build_browser_payload(clf, scaler, feature_names):
    if scaler is None or feature_names is None:
        return None
    if not hasattr(clf, 'coef_') or not hasattr(clf, 'intercept_') or not hasattr(clf, 'classes_'):
        return None

    n_features = len(feature_names)
    if clf.coef_.shape[1] != n_features:
        return None
    if not hasattr(scaler, 'mean_') or not hasattr(scaler, 'scale_'):
        return None
    if len(scaler.mean_) != n_features or len(scaler.scale_) != n_features:
        return None

    classes = [int(x) for x in clf.classes_.tolist()]
    class_names = []
    class_badges = []
    for cls in classes:
        if 0 <= cls < len(CLASS_NAMES):
            class_names.append(CLASS_NAMES[cls])
            class_badges.append(CLASS_BADGES[cls])
        else:
            class_names.append(f'class_{cls}')
            class_badges.append(str(cls))

    return {
        'feature_names': feature_names,
        'coef': clf.coef_[0].astype(float).tolist(),
        'intercept': float(clf.intercept_[0]),
        'mean': scaler.mean_.astype(float).tolist(),
        'scale': scaler.scale_.astype(float).tolist(),
        'classes': classes,
        'class_names': class_names,
        'class_badges': class_badges,
    }


def run_benchmark(clf, n_features, n=N_INFERENCES):
    dummy = np.random.randn(1, n_features)
    for _ in range(50):
        clf.predict(dummy)

    inputs = np.random.randn(n, n_features)
    counts = {0: 0, 1: 0}
    latencies = []
    for i in range(n):
        t0 = time.perf_counter()
        cls = int(clf.predict(inputs[i:i + 1])[0])
        latencies.append(time.perf_counter() - t0)
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


def generate_html(result, n_features, model_path, sklearn_version, browser_payload):
    total = result['n']
    c0 = result['counts'].get(0, 0)
    c1 = result['counts'].get(1, 0)
    p0 = 100.0 * c0 / total
    p1 = 100.0 * c1 / total

    rows_arm = [
        ('Mean latency', f"{result['arm_mean']:.2f} ms"),
        ('P99 latency', f"{result['arm_p99']:.2f} ms"),
        ('Max latency', f"{result['arm_max']:.2f} ms"),
        ('Throughput', f"{result['arm_tput']:,.0f} inf/s"),
    ]

    def table(rows):
        html = '<table><tr><th>Metric</th><th>Value</th></tr>'
        for key, value in rows:
            html += f'<tr><td>{key}</td><td>{value}</td></tr>'
        return html + '</table>'

    def bar(label, pct, badge):
        width = max(10, int(pct * 4))
        return (
            f'<div class="bar-row">'
            f'<span class="bar-label"><span class="badge">{badge}</span>{label}</span>'
            f'<div class="bar-outer"><div class="bar-fill" style="width:{width}px"></div></div>'
            f'<span class="bar-pct">{pct:.1f}%</span></div>'
        )

    upload_card = ''
    upload_script = ''
    if browser_payload:
        model_json = json.dumps(browser_payload)
        template_rows = [
            ','.join(browser_payload['feature_names']),
            ','.join(f'{value:.6f}' for value in browser_payload['mean']),
        ]
        template_csv = json.dumps('\n'.join(template_rows) + '\n')
        upload_card = f"""
<div class="card" style="margin-top:20px;max-width:960px">
  <h2>&#128229; Upload a Sample</h2>
  <p class="subtle">
    Upload one sample as <code>.json</code>, <code>.csv</code>, or <code>.txt</code> to run
    the embedded SVM directly in the browser.
  </p>
  <div class="upload-shell">
    <label class="upload-button" for="sample-upload">Choose sample</label>
    <input id="sample-upload" type="file" accept=".json,.csv,.txt,application/json,text/plain,text/csv">
    <button id="predict-button" class="predict-button" type="button" disabled>Predict</button>
    <button id="template-button" class="secondary-button" type="button">Download template</button>
  </div>
  <p class="note">
    Supported formats: JSON object with feature names, JSON array with {n_features} values,
    CSV header + values row, or a single numeric CSV row.
  </p>
  <div class="feature-grid">
    <div>
      <h3>Expected feature order</h3>
      <ol class="feature-list">
        {''.join(f'<li><code>{name}</code></li>' for name in browser_payload['feature_names'])}
      </ol>
    </div>
    <div>
      <h3>Loaded sample preview</h3>
      <pre id="sample-preview" class="preview-box">No sample loaded yet.</pre>
    </div>
  </div>
  <div id="prediction-result" class="result-box neutral">
    <div class="result-title">Prediction ready when you upload a sample.</div>
    <div class="result-copy">The webpage will scale the features, apply the trained linear SVM, and show the predicted class plus decision score.</div>
  </div>
</div>"""

        upload_script = f"""
<script>
const browserModel = {model_json};
const templateCsv = {template_csv};
const fileInput = document.getElementById('sample-upload');
const predictButton = document.getElementById('predict-button');
const templateButton = document.getElementById('template-button');
const previewBox = document.getElementById('sample-preview');
const predictionBox = document.getElementById('prediction-result');
let loadedSample = null;

function setPredictionState(kind, title, copy) {{
  predictionBox.className = `result-box ${{kind}}`;
  predictionBox.innerHTML = `
    <div class="result-title">${{title}}</div>
    <div class="result-copy">${{copy}}</div>
  `;
}}

function toNumber(value, label) {{
  const parsed = Number(value);
  if (!Number.isFinite(parsed)) {{
    throw new Error(`Feature "${{label}}" must be numeric.`);
  }}
  return parsed;
}}

function valuesFromObject(obj) {{
  return browserModel.feature_names.map((name) => {{
    if (!(name in obj)) {{
      throw new Error(`Missing feature "${{name}}".`);
    }}
    return toNumber(obj[name], name);
  }});
}}

function valuesFromArray(arr) {{
  if (arr.length !== browserModel.feature_names.length) {{
    throw new Error(`Expected ${{browserModel.feature_names.length}} values, got ${{arr.length}}.`);
  }}
  return arr.map((value, index) => toNumber(value, browserModel.feature_names[index]));
}}

function parseCsvText(text) {{
  const lines = text
    .split(/\\r?\\n/)
    .map((line) => line.trim())
    .filter(Boolean);

  if (!lines.length) {{
    throw new Error('The uploaded file is empty.');
  }}

  const splitLine = (line) => line.split(',').map((cell) => cell.trim());
  const firstRow = splitLine(lines[0]);
  const hasHeader = firstRow.some((cell) => cell !== '' && Number.isNaN(Number(cell)));

  if (hasHeader) {{
    if (lines.length < 2) {{
      throw new Error('The header row needs one values row beneath it.');
    }}
    const secondRow = splitLine(lines[1]);
    if (secondRow.length < firstRow.length) {{
      throw new Error('The values row is shorter than the header row.');
    }}
    const obj = {{}};
    firstRow.forEach((key, index) => {{
      obj[key] = secondRow[index];
    }});
    return valuesFromObject(obj);
  }}

  return valuesFromArray(firstRow);
}}

function parseSampleText(text) {{
  const trimmed = text.trim();
  if (!trimmed) {{
    throw new Error('The uploaded file is empty.');
  }}

  if (trimmed.startsWith('{{') || trimmed.startsWith('[')) {{
    const parsed = JSON.parse(trimmed);
    if (Array.isArray(parsed)) {{
      if (parsed.length && typeof parsed[0] === 'object' && !Array.isArray(parsed[0])) {{
        return valuesFromObject(parsed[0]);
      }}
      return valuesFromArray(parsed);
    }}
    return valuesFromObject(parsed);
  }}

  return parseCsvText(trimmed);
}}

function formatPreview(values) {{
  return browserModel.feature_names
    .map((name, index) => `${{name}}: ${{values[index].toFixed(6)}}`)
    .join('\\n');
}}

function runPrediction(values) {{
  let decision = browserModel.intercept;
  for (let i = 0; i < values.length; i += 1) {{
    const scaled = (values[i] - browserModel.mean[i]) / (browserModel.scale[i] || 1);
    decision += scaled * browserModel.coef[i];
  }}

  const classIndex = decision >= 0 ? 1 : 0;
  const probabilityLike = 1 / (1 + Math.exp(-decision));
  return {{
    classId: browserModel.classes[classIndex],
    className: browserModel.class_names[classIndex],
    badge: browserModel.class_badges[classIndex],
    decision,
    probabilityLike,
  }};
}}

async function loadUploadedSample(file) {{
  const text = await file.text();
  const values = parseSampleText(text);
  loadedSample = {{
    fileName: file.name,
    values,
  }};
  previewBox.textContent = formatPreview(values);
  predictButton.disabled = false;
  setPredictionState(
    'neutral',
    `Loaded sample: ${{file.name}}`,
    'Sample parsed successfully. Click Predict to run the embedded SVM.'
  );
}}

fileInput.addEventListener('change', async () => {{
  const file = fileInput.files && fileInput.files[0];
  predictButton.disabled = true;
  loadedSample = null;

  if (!file) {{
    previewBox.textContent = 'No sample loaded yet.';
    setPredictionState('neutral', 'Prediction ready when you upload a sample.', 'The webpage will scale the features, apply the trained linear SVM, and show the predicted class plus decision score.');
    return;
  }}

  try {{
    await loadUploadedSample(file);
  }} catch (error) {{
    previewBox.textContent = 'Could not parse the uploaded sample.';
    setPredictionState('error', 'Upload failed', error.message);
  }}
}});

predictButton.addEventListener('click', () => {{
  if (!loadedSample) {{
    setPredictionState('error', 'No sample loaded', 'Upload a sample file before running prediction.');
    return;
  }}

  try {{
    const prediction = runPrediction(loadedSample.values);
    const margin = Math.abs(prediction.decision);
    setPredictionState(
      'success',
      `${{prediction.badge}} ${{prediction.className}}`,
      `Predicted class id: ${{prediction.classId}} | Decision score: ${{prediction.decision.toFixed(4)}} | Margin: ${{margin.toFixed(4)}} | Sigmoid(score): ${{prediction.probabilityLike.toFixed(4)}}`
    );
  }} catch (error) {{
    setPredictionState('error', 'Prediction failed', error.message);
  }}
}});

templateButton.addEventListener('click', () => {{
  const blob = new Blob([templateCsv], {{ type: 'text/csv;charset=utf-8' }});
  const link = document.createElement('a');
  link.href = URL.createObjectURL(blob);
  link.download = 'svm_sample_template.csv';
  document.body.appendChild(link);
  link.click();
  link.remove();
  URL.revokeObjectURL(link.href);
}});
</script>"""

    css = """
  :root {
    --bg: #0b1220;
    --panel: #131d31;
    --panel-2: #1b2740;
    --line: #29405f;
    --text: #e6eefb;
    --muted: #94a8c7;
    --accent: #60a5fa;
    --accent-2: #22c55e;
    --warning: #f59e0b;
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
  h1 {
    margin: 0 0 12px;
    color: #d9ecff;
    letter-spacing: 0.02em;
  }
  h2 {
    margin: 0 0 14px;
    color: #cfe5ff;
  }
  h3 {
    margin: 0 0 10px;
    color: #d9ecff;
    font-size: 1rem;
  }
  p { line-height: 1.6; }
  code {
    color: #d8e9ff;
    background: rgba(96, 165, 250, 0.12);
    border: 1px solid rgba(96, 165, 250, 0.18);
    border-radius: 6px;
    padding: 2px 6px;
  }
  .hero {
    max-width: 960px;
    margin: 0 auto 20px;
  }
  .chip-row {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin: 14px 0 10px;
  }
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
  .subtle { color: var(--muted); }
  .card {
    max-width: 960px;
    margin: 0 auto;
    padding: 22px;
    border-radius: 18px;
    border: 1px solid var(--line);
    background: linear-gradient(180deg, rgba(19, 29, 49, 0.96), rgba(13, 22, 38, 0.98));
    box-shadow: 0 18px 50px rgba(0, 0, 0, 0.22);
  }
  table {
    width: 100%;
    border-collapse: collapse;
    overflow: hidden;
    border-radius: 14px;
  }
  th, td {
    text-align: left;
    padding: 12px 14px;
  }
  th {
    color: var(--muted);
    background: rgba(255, 255, 255, 0.04);
    font-weight: 600;
  }
  td {
    border-top: 1px solid rgba(255, 255, 255, 0.06);
  }
  .note {
    margin-top: 12px;
    color: var(--muted);
    font-size: 0.92rem;
  }
  .bar-row {
    display: flex;
    align-items: center;
    gap: 12px;
    margin: 12px 0;
  }
  .bar-label {
    width: 180px;
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .badge {
    min-width: 34px;
    padding: 4px 8px;
    border-radius: 999px;
    background: rgba(96, 165, 250, 0.16);
    border: 1px solid rgba(96, 165, 250, 0.26);
    text-align: center;
    font-size: 0.8rem;
  }
  .bar-outer {
    flex: 1;
    height: 18px;
    border-radius: 999px;
    background: rgba(255, 255, 255, 0.06);
    overflow: hidden;
  }
  .bar-fill {
    height: 18px;
    border-radius: 999px;
    background: linear-gradient(90deg, var(--accent), #8b5cf6);
  }
  .bar-pct {
    width: 64px;
    text-align: right;
    color: var(--muted);
  }
  .upload-shell {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    align-items: center;
    margin-bottom: 8px;
  }
  #sample-upload {
    position: absolute;
    width: 1px;
    height: 1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
  }
  .upload-button, .predict-button, .secondary-button {
    border: 0;
    border-radius: 12px;
    padding: 11px 16px;
    font: inherit;
    cursor: pointer;
    transition: transform 0.18s ease, opacity 0.18s ease;
  }
  .upload-button, .predict-button {
    background: linear-gradient(135deg, #2563eb, #38bdf8);
    color: white;
  }
  .secondary-button {
    background: rgba(255, 255, 255, 0.06);
    color: var(--text);
    border: 1px solid rgba(255, 255, 255, 0.08);
  }
  .upload-button:hover, .predict-button:hover, .secondary-button:hover {
    transform: translateY(-1px);
  }
  .predict-button:disabled {
    opacity: 0.45;
    cursor: not-allowed;
    transform: none;
  }
  .feature-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 18px;
    margin-top: 18px;
  }
  .feature-list {
    margin: 0;
    padding-left: 20px;
    color: var(--muted);
  }
  .feature-list li {
    margin: 4px 0;
  }
  .preview-box {
    margin: 0;
    min-height: 220px;
    padding: 14px;
    border-radius: 14px;
    border: 1px solid rgba(255, 255, 255, 0.08);
    background: rgba(6, 12, 22, 0.65);
    color: #dcecff;
    overflow: auto;
    white-space: pre-wrap;
  }
  .result-box {
    margin-top: 18px;
    padding: 16px 18px;
    border-radius: 14px;
    border: 1px solid rgba(255, 255, 255, 0.08);
    background: rgba(6, 12, 22, 0.72);
  }
  .result-box.success {
    border-color: rgba(34, 197, 94, 0.55);
    background: rgba(14, 35, 25, 0.72);
  }
  .result-box.error {
    border-color: rgba(239, 68, 68, 0.55);
    background: rgba(47, 18, 18, 0.72);
  }
  .result-title {
    font-size: 1.05rem;
    font-weight: 700;
    margin-bottom: 6px;
  }
  .result-copy {
    color: var(--muted);
    line-height: 1.6;
  }
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
<title>SVM Lane Change Benchmark Report</title>
<style>{css}
</style>
</head>
<body>
<section class="hero">
  <h1>&#128202; SVM Lane Change Benchmark Report</h1>
  <p class="subtle">
    Benchmarking a 10-feature highway lane-change classifier on CPU.
  </p>
  <div class="chip-row">
    <span class="chip">NGSIM ({n_features} features) -&gt; Linear SVM</span>
    <span class="chip">float64 + StandardScaler</span>
    <span class="chip">CPU</span>
    <span class="chip">scikit-learn {sklearn_version}</span>
    <span class="chip">{total:,} inferences</span>
  </div>
  <p>Model: <code>{os.path.basename(model_path)}</code> | Task: <strong>highway lane change prediction (binary)</strong></p>
</section>

<div class="card">
  <h2>&#128241; CPU </h2>
  {table(rows_arm)}
  <p class="note">
  </p>
</div>

<div class="card" style="margin-top:20px">
  <h2>&#128202; Class Distribution ({total:,} random inputs)</h2>
  {bar(CLASS_NAMES[0], p0, CLASS_BADGES[0])}
  {bar(CLASS_NAMES[1], p1, CLASS_BADGES[1])}
  <p class="note">
    Random pre-scaled inputs are used only for the latency benchmark, so this class split is not an accuracy metric.
  </p>
</div>

{upload_card}
{upload_script}
</body>
</html>"""


def main():
    parser = argparse.ArgumentParser(description='SVM lane-change web benchmark')
    parser.add_argument('--model', default=None, help='Path to svm_model.pkl')
    parser.add_argument('--scaler', default=None, help='Path to svm_scaler.pkl')
    parser.add_argument('--features', default=None, help='Path to svm_feature_names.pkl')
    parser.add_argument('--no-browser', action='store_true', help='Skip opening browser')
    parser.add_argument('--n', type=int, default=N_INFERENCES, help='Number of inferences')
    args = parser.parse_args()

    model_path, scaler_path, features_path = find_paths(args.model, args.scaler, args.features)
    if not model_path:
        sys.exit(
            'ERROR: svm_model.pkl not found.\n'
            '  Expected at: ../major_project_repo/model_outputs/svm_model.pkl\n'
            '  Use --model <path> to specify the model file.'
        )

    print(f'Loading model:    {model_path}')
    clf, scaler, feature_names = load_assets(model_path, scaler_path, features_path)
    n_features = infer_feature_count(clf, scaler=scaler, feature_names=feature_names)

    browser_payload = build_browser_payload(clf, scaler, feature_names)
    if browser_payload:
        print('Browser upload inference: enabled')
    else:
        print('Browser upload inference: disabled (missing scaler/features or unsupported model)')

    import sklearn

    print(f'Features: {n_features}  |  scikit-learn {sklearn.__version__}')
    print(f'Running {args.n:,} inferences ...')

    result = run_benchmark(clf, n_features, n=args.n)
    html = generate_html(result, n_features, model_path, sklearn.__version__, browser_payload)

    out = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'benchmark_report.html')
    with open(out, 'w', encoding='utf-8') as handle:
        handle.write(html)

    print(f'\nReport written: {out}')
    print(f'  x86-64  mean : {result["mean_ms"]:.4f} ms   throughput: {result["tput"]:,.0f} inf/s')
    print(
        f'  CPU  mean : {result["arm_mean"]:.2f} ms   '
        f'p99: {result["arm_p99"]:.2f} ms   scale: x{result["arm_scale"]:.2f}'
    )

    if not args.no_browser:
        webbrowser.open(f'file:///{out.replace(os.sep, "/")}')


if __name__ == '__main__':
    main()
