#!/usr/bin/env python3
"""
benchmark_web.py -- Run Siren MLP benchmark and generate a self-contained HTML report.

Usage:
    python benchmark_web.py                    # opens browser automatically
    python benchmark_web.py --no-browser       # just write the HTML file
    python benchmark_web.py --ckpt /path/to/best_model.pt

Output: benchmark_report.html  (same directory as this script)
"""

import argparse
import os
import sys
import time
import webbrowser

import numpy as np
import torch
import torch.nn as nn

CKPT_DEFAULT = r"C:/Users/TA17084/Downloads/archive/sounds/ambulance/artifacts/best_model.pt"
ARM_SCALE    = 46
N_INFERENCES = 1000
N_IN         = 41
CLASS_NAMES  = ['ambulance', 'firetruck']
CLASS_EMOJI  = ['\U0001f691', '\U0001f692']  # ambulance, firetruck


def load_model(ckpt_path):
    ckpt   = torch.load(ckpt_path, weights_only=False, map_location='cpu')
    cfg    = ckpt.get('config', {})
    hidden = cfg.get('hidden_layers', [4])
    layers = []
    in_sz  = N_IN
    for h in hidden:
        layers += [nn.Linear(in_sz, h), nn.ReLU()]
        in_sz = h
    layers.append(nn.Linear(in_sz, 2))
    model = nn.Sequential(*layers)
    model.load_state_dict({k.replace('network.', ''): v
                           for k, v in ckpt['model_state_dict'].items()})
    model.eval()
    return model, ckpt.get('class_names', CLASS_NAMES)


def run_benchmark(model, n=N_INFERENCES):
    torch.set_num_threads(1)
    dummy = torch.randn(1, N_IN)
    with torch.no_grad():
        for _ in range(50):
            model(dummy)
    inputs = torch.randn(n, N_IN)
    counts = {0: 0, 1: 0}
    latencies = []
    with torch.no_grad():
        for i in range(n):
            t0  = time.perf_counter()
            out = model(inputs[i].unsqueeze(0))
            latencies.append(time.perf_counter() - t0)
            counts[int(out.argmax(dim=1).item())] += 1
    arr = np.array(latencies) * 1000.0  # ms
    return {
        'mean_ms':  float(arr.mean()),
        'p50_ms':   float(np.percentile(arr, 50)),
        'p99_ms':   float(np.percentile(arr, 99)),
        'min_ms':   float(arr.min()),
        'max_ms':   float(arr.max()),
        'arm_mean': float(arr.mean()) * ARM_SCALE,
        'arm_p99':  float(np.percentile(arr, 99)) * ARM_SCALE,
        'tput':     n / (arr.sum() / 1000.0),
        'counts':   counts,
        'n':        n,
    }


def generate_html(r, class_names, ckpt_path):
    total = r['n']
    c0    = r['counts'].get(0, 0)
    c1    = r['counts'].get(1, 0)
    p0    = 100.0 * c0 / total
    p1    = 100.0 * c1 / total

    rows_x86 = [
        ('Mean latency',   f"{r['mean_ms']:.4f} ms"),
        ('Median (p50)',   f"{r['p50_ms']:.4f} ms"),
        ('p99 latency',    f"{r['p99_ms']:.4f} ms"),
        ('Min latency',    f"{r['min_ms']:.4f} ms"),
        ('Max latency',    f"{r['max_ms']:.4f} ms"),
        ('Throughput',     f"{r['tput']:,.0f} inf/s"),
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

    html = f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Siren MLP Benchmark Report</title>
<style>
  body  {{ font-family: 'Segoe UI', Arial, sans-serif; background:#0d1117; color:#c9d1d9; margin:0; padding:20px; }}
  h1    {{ color:#58a6ff; border-bottom:1px solid #30363d; padding-bottom:8px; }}
  h2    {{ color:#79c0ff; margin-top:28px; }}
  .grid {{ display:grid; grid-template-columns:1fr 1fr; gap:20px; max-width:860px; }}
  .card {{ background:#161b22; border:1px solid #30363d; border-radius:8px; padding:18px; }}
  table {{ width:100%; border-collapse:collapse; }}
  th    {{ background:#21262d; padding:6px 12px; text-align:left; color:#8b949e; }}
  td    {{ padding:6px 12px; border-top:1px solid #21262d; }}
  tr:hover td {{ background:#1c2128; }}
  .chip {{ display:inline-block; background:#388bfd22; border:1px solid #388bfd44;
           border-radius:4px; padding:2px 8px; font-size:.85em; color:#79c0ff; margin:3px; }}
  .bar-row {{ display:flex; align-items:center; margin:6px 0; }}
  .bar-label {{ width:130px; font-size:.9em; }}
  .bar-outer {{ flex:1; background:#21262d; border-radius:4px; height:16px; margin:0 10px; }}
  .bar-fill  {{ background:#388bfd; height:16px; border-radius:4px; transition:width .3s; }}
  .bar-pct   {{ width:50px; text-align:right; font-size:.9em; color:#8b949e; }}
  .note {{ color:#8b949e; font-size:.85em; margin-top:8px; }}
</style>
</head>
<body>
<h1>&#x1f4ca; Siren MLP Benchmark Report</h1>
<p>
  <span class="chip">41 &rarr; 4 &rarr; 2</span>
  <span class="chip">Q4.12 fixed-point</span>
  <span class="chip">ARM A9 sim &times;{ARM_SCALE}</span>
  <span class="chip">PyTorch {torch.__version__}</span>
  <span class="chip">{total:,} inferences</span>
</p>
<p>Model: <code>{os.path.basename(ckpt_path)}</code> &nbsp; Task: <b>ambulance vs firetruck</b></p>

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
  {bar(class_names[0], p0, CLASS_EMOJI[0])}
  {bar(class_names[1], p1, CLASS_EMOJI[1])}
  <p class="note">Random 41-dim inputs &mdash; expected ~50/50 split.</p>
</div>

</body></html>"""
    return html


def main():
    ap = argparse.ArgumentParser(description='Siren MLP web benchmark')
    ap.add_argument('--ckpt',       default=None, help='Path to best_model.pt')
    ap.add_argument('--no-browser', action='store_true')
    ap.add_argument('--n',          type=int, default=N_INFERENCES)
    args = ap.parse_args()

    ckpt = args.ckpt
    if ckpt is None:
        for p in [CKPT_DEFAULT,
                  os.path.join(os.path.dirname(__file__), 'training', 'best_model.pt')]:
            if os.path.exists(p):
                ckpt = p; break
    if not ckpt or not os.path.exists(ckpt):
        sys.exit(f'ERROR: best_model.pt not found. Use --ckpt <path>')

    print(f'Loading checkpoint: {ckpt}')
    model, class_names = load_model(ckpt)
    params = sum(p.numel() for p in model.parameters())
    print(f'Model: 41->4->2  |  {params} params  |  classes: {class_names}')
    print(f'Running {args.n:,} inferences ...')

    r    = run_benchmark(model, n=args.n)
    html = generate_html(r, class_names, ckpt)

    out  = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'benchmark_report.html')
    with open(out, 'w', encoding='utf-8') as f:
        f.write(html)
    print(f'Report written: {out}')

    if not args.no_browser:
        webbrowser.open(f'file:///{out.replace(chr(92), "/")}')


if __name__ == '__main__':
    main()
