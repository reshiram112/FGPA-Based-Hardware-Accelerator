#!/usr/bin/env python3
"""
benchmark_web.py -- CPU latency benchmark for the SVM Lane Change classifier
                    (NGSIM features -> Linear SVM -> Keep Lane / Change Lane)
                    with ARM Cortex-A9 simulation.

Runs 1,000 inferences on random pre-scaled feature vectors (N~(0,1)),
reports x86-64 measured latency and simulated ARM A9 latency, then writes
benchmark_report.html.

Usage:
    python benchmark_web.py
    python benchmark_web.py --no-browser
    python benchmark_web.py --model /path/to/svm_model.pkl
    python benchmark_web.py --scaler /path/to/svm_scaler.pkl
    python benchmark_web.py --n 500

Scale factor derivation:
    x86-64 w/ MKL (1 thread, i7)      ~  60 GFLOPS  (scalar path)
    ARM Cortex-A9 @ 650 MHz (PYNQ-Z2) ~  1.3 GFLOPS (NEON single-precision)
    Scale = 60 / 1.3 = 46

Dependencies: scikit-learn, joblib, numpy
"""

import argparse
import os
import sys
import time
import webbrowser

import joblib
import numpy as np

ARM_SCALE    = 46
N_INFERENCES = 1000
CLASS_NAMES  = ['keep_lane', 'change_lane']
CLASS_EMOJI  = ['\U0001f6e3\ufe0f', '\U00002194\ufe0f']  # road, arrows


# ── Model discovery ───────────────────────────────────────────────────────────

def _resolve(given, *candidates):
    if given and os.path.exists(given):
        return given
    for p in candidates:
        if os.path.exists(os.path.normpath(p)):
            return os.path.normpath(p)
    return None


def find_paths(model_arg=None, scaler_arg=None, features_arg=None):
    here    = os.path.dirname(os.path.abspath(__file__))
    out_dir = os.path.join(here, '..', 'major_project_repo', 'model_outputs')
    model    = _resolve(model_arg,    os.path.join(out_dir, 'svm_model.pkl'))
    scaler   = _resolve(scaler_arg,   os.path.join(out_dir, 'svm_scaler.pkl'))
    features = _resolve(features_arg, os.path.join(out_dir, 'svm_feature_names.pkl'))
    return model, scaler, features


# ── Benchmark ─────────────────────────────────────────────────────────────────

def run_benchmark(clf, n_features, n=N_INFERENCES):
    # Warm-up: 50 inferences
    dummy = np.random.randn(1, n_features)
    for _ in range(50):
        clf.predict(dummy)

    # Timed run with random pre-scaled inputs N(0, 1)
    inputs    = np.random.randn(n, n_features)
    counts    = {0: 0, 1: 0}
    latencies = []
    for i in range(n):
        t0  = time.perf_counter()
        cls = int(clf.predict(inputs[i:i+1])[0])
        latencies.append(time.perf_counter() - t0)
        counts[cls] = counts.get(cls, 0) + 1

    arr = np.array(latencies) * 1000.0  # ms
    return {
        'mean_ms':  float(arr.mean()),
        'p50_ms':   float(np.percentile(arr, 50)),
        'p99_ms':   float(np.percentile(arr, 99)),
        'min_ms':   float(arr.min()),
        'max_ms':   float(arr.max()),
        'arm_mean': float(arr.mean())              * ARM_SCALE,
        'arm_p99':  float(np.percentile(arr, 99)) * ARM_SCALE,
        'tput':     n / (arr.sum() / 1000.0),
        'counts':   counts,
        'n':        n,
    }


# ── HTML generation ───────────────────────────────────────────────────────────

def generate_html(r, n_features, model_path, sklearn_version):
    total = r['n']
    c0    = r['counts'].get(0, 0)
    c1    = r['counts'].get(1, 0)
    p0    = 100.0 * c0 / total
    p1    = 100.0 * c1 / total

    rows_x86 = [
        ('Mean latency',  f"{r['mean_ms']:.4f} ms"),
        ('Median (p50)',  f"{r['p50_ms']:.4f} ms"),
        ('p99 latency',   f"{r['p99_ms']:.4f} ms"),
        ('Min latency',   f"{r['min_ms']:.4f} ms"),
        ('Max latency',   f"{r['max_ms']:.4f} ms"),
        ('Throughput',    f"{r['tput']:,.0f} inf/s"),
    ]
    rows_arm = [
        ('Mean latency (est.)', f"{r['arm_mean']:.2f} ms"),
        ('p99 latency (est.)',  f"{r['arm_p99']:.2f} ms"),
    ]

    def tbl(rows):
        html = '<table><tr><th>Metric</th><th>Value</th></tr>'
        for k, v in rows:
            html += f'<tr><td>{k}</td><td>{v}</td></tr>'
        return html + '</table>'

    def bar(label, pct, emoji):
        w = max(2, int(pct * 3))
        return (f'<div class="bar-row">'
                f'<span class="bar-label">{emoji} {label}</span>'
                f'<div class="bar-outer"><div class="bar-fill" style="width:{w}px"></div></div>'
                f'<span class="bar-pct">{pct:.1f}%</span></div>')

    css = """
  body  { font-family: 'Segoe UI', Arial, sans-serif; background:#0d1117; color:#c9d1d9; margin:0; padding:20px; }
  h1    { color:#58a6ff; border-bottom:1px solid #30363d; padding-bottom:8px; }
  h2    { color:#79c0ff; margin-top:28px; }
  .grid { display:grid; grid-template-columns:1fr 1fr; gap:20px; max-width:860px; }
  .card { background:#161b22; border:1px solid #30363d; border-radius:8px; padding:18px; }
  table { width:100%; border-collapse:collapse; }
  th    { background:#21262d; padding:6px 12px; text-align:left; color:#8b949e; }
  td    { padding:6px 12px; border-top:1px solid #21262d; }
  tr:hover td { background:#1c2128; }
  .chip { display:inline-block; background:#388bfd22; border:1px solid #388bfd44;
           border-radius:4px; padding:2px 8px; font-size:.85em; color:#79c0ff; margin:3px; }
  .bar-row { display:flex; align-items:center; margin:6px 0; }
  .bar-label { width:130px; font-size:.9em; }
  .bar-outer { flex:1; background:#21262d; border-radius:4px; height:16px; margin:0 10px; }
  .bar-fill  { background:#388bfd; height:16px; border-radius:4px; transition:width .3s; }
  .bar-pct   { width:50px; text-align:right; font-size:.9em; color:#8b949e; }
  .note { color:#8b949e; font-size:.85em; margin-top:8px; }"""

    return f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SVM Lane Change Benchmark Report</title>
<style>{css}
</style>
</head>
<body>
<h1>&#x1f4ca; SVM Lane Change Benchmark Report</h1>
<p>
  <span class="chip">NGSIM ({n_features} features) &rarr; Linear SVM</span>
  <span class="chip">float64 + StandardScaler</span>
  <span class="chip">ARM A9 sim &times;{ARM_SCALE}</span>
  <span class="chip">scikit-learn {sklearn_version}</span>
  <span class="chip">{total:,} inferences</span>
</p>
<p>Model: <code>{os.path.basename(model_path)}</code> &nbsp; Task: <b>highway lane change prediction (binary)</b></p>

<div class="grid">
  <div class="card">
    <h2>&#x1f4bb; x86-64 (measured)</h2>
    {tbl(rows_x86)}
    <p class="note">Single-thread, no MKL parallelism.</p>
  </div>
  <div class="card">
    <h2>&#x1f4f1; ARM Cortex-A9 (simulated)</h2>
    {tbl(rows_arm)}
    <p class="note">Scale &times;{ARM_SCALE}: x86 MKL ~60 GFLOPS &divide; ARM A9 ~1.3 GFLOPS.</p>
  </div>
</div>

<div class="card" style="margin-top:20px;max-width:860px">
  <h2>&#x1f4ca; Class Distribution ({total:,} random inputs)</h2>
  {bar(CLASS_NAMES[0], p0, CLASS_EMOJI[0])}
  {bar(CLASS_NAMES[1], p1, CLASS_EMOJI[1])}
  <p class="note">Random pre-scaled inputs &mdash; class imbalance reflects real highway driving.</p>
</div>

</body></html>"""


# ── Entry point ───────────────────────────────────────────────────────────────

def main():
    ap = argparse.ArgumentParser(description='SVM Lane Change web benchmark')
    ap.add_argument('--model',      default=None, help='Path to svm_model.pkl')
    ap.add_argument('--scaler',     default=None, help='Path to svm_scaler.pkl')
    ap.add_argument('--features',   default=None, help='Path to svm_feature_names.pkl')
    ap.add_argument('--no-browser', action='store_true', help='Skip opening browser')
    ap.add_argument('--n',          type=int, default=N_INFERENCES, help='Number of inferences')
    args = ap.parse_args()

    model_path, scaler_path, features_path = find_paths(args.model, args.scaler, args.features)

    if not model_path:
        sys.exit(
            'ERROR: svm_model.pkl not found.\n'
            '  Expected at: ../major_project_repo/model_outputs/svm_model.pkl\n'
            '  Use --model <path> to specify the model file.'
        )

    print(f'Loading model:    {model_path}')
    clf = joblib.load(model_path)

    # Determine feature count from scaler or feature names file
    n_features = None
    if scaler_path:
        print(f'Loading scaler:   {scaler_path}')
        scaler     = joblib.load(scaler_path)
        n_features = scaler.n_features_in_
    if features_path and n_features is None:
        feat_names = joblib.load(features_path)
        n_features = len(feat_names)
    if n_features is None:
        # Fallback: inspect the SVM's support vectors
        try:
            n_features = clf.support_vectors_.shape[1]
        except AttributeError:
            n_features = clf.coef_.shape[1]  # linear SVM

    import sklearn
    print(f'Features: {n_features}  |  scikit-learn {sklearn.__version__}')
    print(f'Running {args.n:,} inferences ...')

    r    = run_benchmark(clf, n_features, n=args.n)
    html = generate_html(r, n_features, model_path, sklearn.__version__)

    out = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'benchmark_report.html')
    with open(out, 'w', encoding='utf-8') as f:
        f.write(html)
    print(f'\nReport written: {out}')
    print(f'  x86-64  mean : {r["mean_ms"]:.4f} ms   throughput: {r["tput"]:,.0f} inf/s')
    print(f'  ARM A9  mean : {r["arm_mean"]:.2f} ms   p99: {r["arm_p99"]:.2f} ms')

    if not args.no_browser:
        webbrowser.open(f'file:///{out.replace(os.sep, "/")}')


if __name__ == '__main__':
    main()
