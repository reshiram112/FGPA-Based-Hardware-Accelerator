#!/usr/bin/env python3
"""
benchmark_laptop.py -- CPU latency benchmark for the Siren MLP (41->4->2)
                        with ARM Cortex-A9 simulation.

Runs 1000 inferences on random 41-dim feature vectors using PyTorch
in single-thread mode (no MKL parallelism) and reports:
  - Measured x86-64 latency
  - Simulated ARM A9 latency (x46 scale factor)

Scale factor derivation:
  x86-64 w/ MKL (1 thread, i7)     ~  60 GFLOPS (scalar path)
  ARM Cortex-A9 @ 650 MHz (PYNQ-Z2) ~  1.3 GFLOPS (NEON single-precision)
  Scale = 60 / 1.3 = 46

Usage:
    python benchmark_laptop.py
    python benchmark_laptop.py --n 500 --ckpt /path/to/best_model.pt
"""

import argparse
import os
import sys
import time

import numpy as np
import torch
import torch.nn as nn

CKPT_DEFAULT = r"C:/Users/TA17084/Downloads/archive/sounds/ambulance/artifacts/best_model.pt"
ARM_SCALE    = 46       # x86-64 MKL vs ARM Cortex-A9 NEON
N_DEFAULT    = 1000
N_IN         = 41
CLASS_NAMES  = ['ambulance', 'firetruck']


def load_model(ckpt_path):
    ckpt = torch.load(ckpt_path, weights_only=False, map_location='cpu')
    cfg  = ckpt.get('config', {})
    hidden = cfg.get('hidden_layers', [4])

    layers = []
    in_size = N_IN
    for h in hidden:
        layers += [nn.Linear(in_size, h), nn.ReLU()]
        in_size = h
    layers.append(nn.Linear(in_size, 2))
    model = nn.Sequential(*layers)
    model.load_state_dict({k.replace('network.', ''): v
                           for k, v in ckpt['model_state_dict'].items()})
    model.eval()
    return model, ckpt.get('class_names', CLASS_NAMES)


def benchmark(model, n_inferences, arm_scale):
    torch.set_num_threads(1)

    # Warm-up
    dummy = torch.randn(1, N_IN)
    with torch.no_grad():
        for _ in range(50):
            model(dummy)

    # Timed run
    inputs  = torch.randn(n_inferences, N_IN)
    counts  = {c: 0 for c in range(2)}
    t_start = time.perf_counter()
    with torch.no_grad():
        for i in range(n_inferences):
            out = model(inputs[i].unsqueeze(0))
            cls = int(out.argmax(dim=1).item())
            counts[cls] += 1
    t_total = time.perf_counter() - t_start

    lat_x86_ms  = (t_total / n_inferences) * 1000.0
    lat_arm_ms  = lat_x86_ms * arm_scale
    throughput  = n_inferences / t_total

    return lat_x86_ms, lat_arm_ms, throughput, t_total, counts


def print_results(n, lat_x86, lat_arm, throughput, t_total, counts, class_names):
    col = 70
    print()
    print('=' * col)
    print('  Siren MLP Benchmark  (41->4->2  |  ambulance vs firetruck)')
    print('=' * col)
    print(f'  Inferences      : {n:,}')
    print(f'  Total time      : {t_total*1000:.1f} ms   ({t_total:.3f} s)')
    print(f'  Throughput      : {throughput:,.0f} inf/s')
    print()
    print(f'  {"Metric":<32}  {"x86-64 (measured)":>18}  {"ARM A9 (sim)":>14}')
    print(f'  {"-"*32}  {"-"*18}  {"-"*14}')
    print(f'  {"Latency per inference":<32}  {lat_x86:>15.4f} ms  {lat_arm:>11.2f} ms')
    print()
    print(f'  ARM simulation : x{ARM_SCALE} scale factor')
    print(f'    (x86 MKL ~60 GFLOPS, ARM A9 ~1.3 GFLOPS single-thread)')
    print()
    print(f'  Class distribution over {n:,} random inputs:')
    for i, cname in enumerate(class_names):
        pct = 100.0 * counts[i] / n
        bar = '#' * int(pct / 2)
        print(f'    [{i}] {cname:12s}  {counts[i]:6d}  {pct:5.1f}%  {bar}')
    print('=' * col)


def main():
    ap = argparse.ArgumentParser(description='Siren MLP latency benchmark')
    ap.add_argument('--n',    type=int, default=N_DEFAULT, help='Number of inferences')
    ap.add_argument('--ckpt', default=None, help='Path to best_model.pt')
    args = ap.parse_args()

    ckpt_path = args.ckpt
    if ckpt_path is None:
        # Try default locations
        for p in [CKPT_DEFAULT,
                  os.path.join(os.path.dirname(__file__), 'training', 'best_model.pt'),
                  os.path.join(os.path.dirname(__file__), '..', 'training', 'best_model.pt')]:
            if os.path.exists(p):
                ckpt_path = p
                break
    if ckpt_path is None or not os.path.exists(ckpt_path):
        sys.exit(
            f'ERROR: best_model.pt not found.\n'
            f'  Tried: {CKPT_DEFAULT}\n'
            f'  Provide path with --ckpt <path>'
        )

    print(f'Loading checkpoint: {ckpt_path}')
    model, class_names = load_model(ckpt_path)
    params = sum(p.numel() for p in model.parameters())
    print(f'Model: 41->4->2  |  {params} parameters  |  classes: {class_names}')
    print(f'Running {args.n:,} inferences ...')

    lat_x86, lat_arm, tput, t_total, counts = benchmark(model, args.n, ARM_SCALE)
    print_results(args.n, lat_x86, lat_arm, tput, t_total, counts, class_names)


if __name__ == '__main__':
    main()
