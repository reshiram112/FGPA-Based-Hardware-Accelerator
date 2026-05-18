#!/usr/bin/env python3
"""
benchmark_web.py -- CPU latency benchmark for the SimpleCNN (3x32x32 -> 43)
                    with ARM Cortex-A9 simulation.

Runs 1,000 inferences on random 3x32x32 inputs, reports x86-64 measured
latency and simulated ARM A9 latency, then writes benchmark_report.html.

Usage:
    python benchmark_web.py
    python benchmark_web.py --no-browser
    python benchmark_web.py --ckpt /path/to/cnn_weights.pth
    python benchmark_web.py --n 500

Scale factor derivation:
    x86-64 w/ MKL (1 thread, i7)      ~  60 GFLOPS  (scalar path)
    ARM Cortex-A9 @ 650 MHz (PYNQ-Z2) ~  1.3 GFLOPS (NEON single-precision)
    Scale = 60 / 1.3 = 46
"""

import argparse
import os
import sys
import time
import webbrowser

import numpy as np
import torch
import torch.nn as nn

ARM_SCALE    = 46
N_INFERENCES = 1000
IMG_C, IMG_H, IMG_W = 1, 28, 28


# ── Model definition (matches mnist_cnn_best.pth) ────────────────────────────
# Architecture: 1x28x28 → Conv(8) → MaxPool → Conv(16) → MaxPool → FC(784→10)

class MnistCNN(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv1 = nn.Conv2d(1, 8,  kernel_size=3, padding=1)
        self.relu  = nn.ReLU()
        self.pool  = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(8, 16, kernel_size=3, padding=1)
        self.fc    = nn.Linear(16 * 7 * 7, 10)

    def forward(self, x):
        x = self.pool(self.relu(self.conv1(x)))
        x = self.pool(self.relu(self.conv2(x)))
        x = x.view(-1, 16 * 7 * 7)
        return self.fc(x)


# ── Checkpoint discovery ──────────────────────────────────────────────────────

def find_ckpt(given=None):
    if given and os.path.exists(given):
        return given
    here = os.path.dirname(os.path.abspath(__file__))
    candidates = [
        os.path.join(here, 'mnist_cnn_best.pth'),
        os.path.join(here, '..', 'major_project_repo', 'model_outputs', 'cnn_weights.pth'),
    ]
    for p in candidates:
        if os.path.exists(os.path.normpath(p)):
            return os.path.normpath(p)
    return None


def load_model(ckpt_path):
    raw = torch.load(ckpt_path, weights_only=False, map_location='cpu')
    sd  = raw.get('model_state_dict', raw) if isinstance(raw, dict) else raw
    model = MnistCNN()
    model.load_state_dict(sd)
    model.eval()
    return model, 10


# ── Benchmark ─────────────────────────────────────────────────────────────────

def run_benchmark(model, n=N_INFERENCES):
    torch.set_num_threads(1)
    dummy = torch.randn(1, IMG_C, IMG_H, IMG_W)
    with torch.no_grad():
        for _ in range(50):
            model(dummy)

    inputs    = torch.randn(n, IMG_C, IMG_H, IMG_W)
    counts    = {}
    latencies = []
    with torch.no_grad():
        for i in range(n):
            t0  = time.perf_counter()
            out = model(inputs[i].unsqueeze(0))
            latencies.append(time.perf_counter() - t0)
            cls = int(out.argmax(dim=1).item())
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

def generate_html(r, n_classes, ckpt_path):
    total  = r['n']
    task   = 'handwritten digit recognition'
    arch   = f'1\u00d728\u00d728 \u2192 Conv(8) \u2192 Conv(16) \u2192 FC(784\u219210)'

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

    # Top-10 classes by prediction count
    top10 = sorted(r['counts'].items(), key=lambda x: -x[1])[:10]
    bars  = ''
    for cls_idx, cnt in top10:
        pct = 100.0 * cnt / total
        w   = max(2, int(pct * 3))
        bars += (f'<div class="bar-row">'
                 f'<span class="bar-label">Class {cls_idx:02d}</span>'
                 f'<div class="bar-outer"><div class="bar-fill" style="width:{w}px"></div></div>'
                 f'<span class="bar-pct">{pct:.1f}%</span></div>\n  ')
    shown     = sum(cnt for _, cnt in top10)
    other_pct = 100.0 * (total - shown) / total
    other_note = (f'Remaining {n_classes - len(top10)} classes: {other_pct:.1f}% combined. '
                  if n_classes > len(top10) else '')

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
<title>CNN Benchmark Report</title>
<style>{css}
</style>
</head>
<body>
<h1>&#x1f4ca; CNN Benchmark Report</h1>
<p>
  <span class="chip">{arch}</span>
  <span class="chip">float32</span>
  <span class="chip">ARM A9 sim &times;{ARM_SCALE}</span>
  <span class="chip">PyTorch {torch.__version__}</span>
  <span class="chip">{total:,} inferences</span>
</p>
<p>Model: <code>{os.path.basename(ckpt_path)}</code> &nbsp; Task: <b>{task} ({n_classes} classes)</b></p>

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
  <h2>&#x1f4ca; Class Distribution ({total:,} random inputs) &mdash; top {len(top10)} of {n_classes}</h2>
  {bars}
  <p class="note">{other_note}Random 1&times;28&times;28 grayscale inputs &mdash; expected ~{100/n_classes:.1f}% per class.</p>
</div>

</body></html>"""


# ── Entry point ───────────────────────────────────────────────────────────────

def main():
    ap = argparse.ArgumentParser(description='CNN web benchmark')
    ap.add_argument('--ckpt',       default=None,         help='Path to checkpoint (.pth)')
    ap.add_argument('--no-browser', action='store_true',  help='Skip opening browser')
    ap.add_argument('--n',          type=int, default=N_INFERENCES, help='Number of inferences')
    args = ap.parse_args()

    ckpt = find_ckpt(args.ckpt)
    if not ckpt:
        sys.exit(
            'ERROR: No CNN checkpoint found.\n'
            '  Tried: mnist_cnn_best.pth, ../major_project_repo/model_outputs/cnn_weights.pth\n'
            '  Use --ckpt <path> to specify the model file.'
        )

    print(f'Loading checkpoint: {ckpt}')
    model, n_classes = load_model(ckpt)
    params = sum(p.numel() for p in model.parameters())
    print(f'Model: MnistCNN  |  {params:,} parameters  |  {n_classes} classes')
    print(f'Running {args.n:,} inferences ...')

    r    = run_benchmark(model, n=args.n)
    html = generate_html(r, n_classes, ckpt)

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
