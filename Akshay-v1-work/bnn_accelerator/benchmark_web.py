#!/usr/bin/env python3
"""
benchmark_web.py -- CPU latency benchmark for the BNN Pothole Detector
                    (3x32x32 patch -> Conv+BinarizedLinear -> 2 classes)
                    with ARM Cortex-A9 simulation.

Runs 1,000 inferences on random 3x32x32 image patches, reports x86-64
measured latency and simulated ARM A9 latency, then writes benchmark_report.html.

Usage:
    python benchmark_web.py
    python benchmark_web.py --no-browser
    python benchmark_web.py --ckpt /path/to/bnn_pothole_weights.pth
    python benchmark_web.py --n 500

Scale factor derivation:
    x86-64 w/ MKL (1 thread, i7)      ~  60 GFLOPS  (scalar path)
    ARM Cortex-A9 @ 650 MHz (PYNQ-Z2) ~  1.3 GFLOPS (NEON single-precision)
    Scale = 60 / 1.3 = 46
"""

import argparse
import math
import os
import sys
import time
import webbrowser

import numpy as np
import torch
import torch.nn as nn

ARM_SCALE    = 46
N_INFERENCES = 1000
CLASS_NAMES  = ['normal_road', 'pothole']
CLASS_EMOJI  = ['\U0001f6e3\ufe0f', '\U000026a0\ufe0f']   # road, warning


# ── Model definition (must match train_bnn_pothole.py) ────────────────────────

class Binarize(torch.autograd.Function):
    @staticmethod
    def forward(ctx, x):
        ctx.save_for_backward(x)
        return torch.sign(x)

    @staticmethod
    def backward(ctx, grad):
        return grad.clone()


def binarize(x):
    return Binarize.apply(x)


class BinarizedLinear(nn.Module):
    def __init__(self, in_f, out_f):
        super().__init__()
        self.weight = nn.Parameter(torch.Tensor(out_f, in_f))
        self.bias   = nn.Parameter(torch.Tensor(out_f))
        nn.init.kaiming_uniform_(self.weight, a=math.sqrt(5))
        fan_in, _ = nn.init._calculate_fan_in_and_fan_out(self.weight)
        bound = 1 / math.sqrt(fan_in)
        nn.init.uniform_(self.bias, -bound, bound)

    def forward(self, x):
        return nn.functional.linear(x, binarize(self.weight), self.bias)


class BNNPotholeDetector(nn.Module):
    """Conv feature extractor (standard) + BinarizedLinear classifier."""
    def __init__(self):
        super().__init__()
        self.features = nn.Sequential(
            nn.Conv2d(3, 16, 3, padding=1),
            nn.BatchNorm2d(16),
            nn.ReLU(),
            nn.MaxPool2d(2, 2),
            nn.Conv2d(16, 32, 3, padding=1),
            nn.BatchNorm2d(32),
            nn.ReLU(),
            nn.MaxPool2d(2, 2),
        )
        flat = 32 * 8 * 8               # 2048
        self.input_bn = nn.BatchNorm1d(flat)
        self.fc1      = BinarizedLinear(flat, 256)
        self.bn1      = nn.BatchNorm1d(256)
        self.fc2      = BinarizedLinear(256, 2)

    def forward(self, x):
        x = self.features(x)
        x = x.view(x.size(0), -1)
        x = self.input_bn(x)
        x = binarize(self.fc1(x))
        x = self.bn1(x)
        return self.fc2(x)


# ── Checkpoint discovery ──────────────────────────────────────────────────────

def find_ckpt(given=None):
    if given and os.path.exists(given):
        return given
    here = os.path.dirname(os.path.abspath(__file__))
    candidates = [
        os.path.join(here, 'bnn_pothole_weights.pth'),
        os.path.join(here, '..', 'major_project_repo', 'model_outputs', 'bnn_pothole_weights.pth'),
    ]
    for p in candidates:
        if os.path.exists(os.path.normpath(p)):
            return os.path.normpath(p)
    return None


def load_model(ckpt_path):
    raw = torch.load(ckpt_path, weights_only=False, map_location='cpu')
    sd  = raw.get('model_state_dict', raw) if isinstance(raw, dict) else raw
    model = BNNPotholeDetector()
    model.load_state_dict(sd, strict=False)
    model.eval()
    return model


# ── Benchmark ─────────────────────────────────────────────────────────────────

def run_benchmark(model, n=N_INFERENCES):
    torch.set_num_threads(1)
    dummy = torch.randn(1, 3, 32, 32)
    with torch.no_grad():
        for _ in range(50):
            model(dummy)

    inputs    = torch.randn(n, 3, 32, 32)
    counts    = {0: 0, 1: 0}
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

def generate_html(r, ckpt_path):
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
<title>BNN Pothole Benchmark Report</title>
<style>{css}
</style>
</head>
<body>
<h1>&#x1f4ca; BNN Pothole Benchmark Report</h1>
<p>
  <span class="chip">3&times;32&times;32 &rarr; Conv+BN(16) &rarr; Conv+BN(32) &rarr; BinFC(256) &rarr; 2</span>
  <span class="chip">BinarizedLinear weights</span>
  <span class="chip">ARM A9 sim &times;{ARM_SCALE}</span>
  <span class="chip">PyTorch {torch.__version__}</span>
  <span class="chip">{total:,} inferences</span>
</p>
<p>Model: <code>{os.path.basename(ckpt_path)}</code> &nbsp; Task: <b>road surface pothole detection (binary)</b></p>

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
  <p class="note">Random 3&times;32&times;32 patch inputs &mdash; expected ~50/50 split.</p>
</div>

</body></html>"""


# ── Entry point ───────────────────────────────────────────────────────────────

def main():
    ap = argparse.ArgumentParser(description='BNN Pothole web benchmark')
    ap.add_argument('--ckpt',       default=None,         help='Path to bnn_pothole_weights.pth')
    ap.add_argument('--no-browser', action='store_true',  help='Skip opening browser')
    ap.add_argument('--n',          type=int, default=N_INFERENCES, help='Number of inferences')
    args = ap.parse_args()

    ckpt = find_ckpt(args.ckpt)
    if not ckpt:
        sys.exit(
            'ERROR: No BNN checkpoint found.\n'
            '  Tried: bnn_pothole_weights.pth, ../major_project_repo/model_outputs/bnn_pothole_weights.pth\n'
            '  Use --ckpt <path> to specify the model file.'
        )

    print(f'Loading checkpoint: {ckpt}')
    model  = load_model(ckpt)
    params = sum(p.numel() for p in model.parameters())
    print(f'Model: BNNPotholeDetector  |  {params:,} parameters  |  2 classes')
    print(f'Running {args.n:,} inferences ...')

    r    = run_benchmark(model, n=args.n)
    html = generate_html(r, ckpt)

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
