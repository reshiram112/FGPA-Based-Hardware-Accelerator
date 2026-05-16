"""
Laptop Inference Benchmark — All 4 Models
==========================================
Measures per-model inference latency, throughput, CPU and RAM usage
on the host CPU (laptop/desktop) to serve as the comparison baseline
for FPGA (PYNQ Z2) acceleration.

Outputs
  results/<model>/latency_laptop.json   — per-model timing JSON
  results/laptop_comparison.png         — side-by-side comparison chart
  results/laptop_benchmark_summary.json — combined summary

Usage:
    python inference_laptop.py [--runs N]     # default N=500
"""
import os
import sys
import json
import time
import argparse
import warnings
warnings.filterwarnings('ignore')

import numpy as np
import torch
import torch.nn.functional as F
import joblib
import psutil
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

ROOT = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(ROOT, 'model_training'))

from train_cnn         import SimpleCNN
from train_audio_mlp   import AudioMLP
from train_bnn_pothole import BNNPotholeDetector
from train_svm         import engineer_features
import pandas as pd

MODEL_DIR   = os.path.join(ROOT, 'model_outputs')
RESULTS_DIR = os.path.join(ROOT, 'results')


# ── Dummy input builders ──────────────────────────────────────────────────────

def dummy_cnn():
    """Single 3×32×32 traffic-sign frame."""
    return torch.randn(1, 3, 32, 32)

def dummy_audio_mlp():
    """Single 160-dim MFCC feature vector."""
    return torch.randn(1, 160)

def dummy_bnn_pothole():
    """Single 3×32×32 road patch."""
    return torch.randn(1, 3, 32, 32)

def dummy_svm(clf, scaler):
    """
    Single realistic SVM feature row (10 features after engineering).
    Uses a real row from the lane dataset if available, else zeros.
    """
    data_path = os.path.join(ROOT, 'datasets', 'lane_data', 'processed_lane_data.csv')
    if os.path.exists(data_path):
        df = pd.read_csv(data_path)
        row = engineer_features(df).iloc[[0]]
    else:
        row = pd.DataFrame(np.zeros((1, 10)))
    return scaler.transform(row)


# ── Core benchmark ────────────────────────────────────────────────────────────

def benchmark(name, infer_fn, n_runs=500, warmup=50):
    """
    Run infer_fn() n_runs times (after warmup) and collect timing + resource stats.
    """
    proc = psutil.Process(os.getpid())

    # Warmup
    for _ in range(warmup):
        infer_fn()

    # Force GC and stabilise
    import gc; gc.collect()
    torch.cuda.empty_cache() if torch.cuda.is_available() else None

    # Snapshot baseline resources
    mem_before = proc.memory_info().rss / (1024 ** 2)   # MB

    latencies = []
    cpu_start  = proc.cpu_times()
    wall_start = time.perf_counter()

    for _ in range(n_runs):
        t0 = time.perf_counter()
        infer_fn()
        latencies.append((time.perf_counter() - t0) * 1_000_000)   # microseconds

    wall_elapsed = time.perf_counter() - wall_start
    cpu_end       = proc.cpu_times()

    mem_after  = proc.memory_info().rss / (1024 ** 2)
    cpu_delta  = (cpu_end.user - cpu_start.user) + (cpu_end.system - cpu_start.system)
    cpu_pct    = (cpu_delta / wall_elapsed * 100.0 / psutil.cpu_count()) if wall_elapsed > 0 else 0.0

    lat = np.array(latencies)
    result = {
        "model":               name,
        "n_runs":              n_runs,
        "warmup_runs":         warmup,
        "latency_mean_us":     round(float(np.mean(lat)),    3),
        "latency_median_us":   round(float(np.median(lat)),  3),
        "latency_min_us":      round(float(np.min(lat)),     3),
        "latency_max_us":      round(float(np.max(lat)),     3),
        "latency_std_us":      round(float(np.std(lat)),     3),
        "latency_p95_us":      round(float(np.percentile(lat, 95)), 3),
        "latency_p99_us":      round(float(np.percentile(lat, 99)), 3),
        "latency_mean_ms":     round(float(np.mean(lat)) / 1000, 4),
        "throughput_inf_per_s":round(1_000_000 / float(np.mean(lat)), 1),
        "cpu_percent":         round(cpu_pct, 2),
        "ram_used_mb":         round(mem_after, 1),
        "ram_delta_mb":        round(mem_after - mem_before, 2),
        "wall_time_s":         round(wall_elapsed, 4),
    }

    print(f"\n  {name}")
    print(f"    Mean latency   : {result['latency_mean_us']:>9.1f} µs "
          f"({result['latency_mean_ms']:.4f} ms)")
    print(f"    Median         : {result['latency_median_us']:>9.1f} µs")
    print(f"    Std dev        : {result['latency_std_us']:>9.1f} µs")
    print(f"    P95 / P99      : {result['latency_p95_us']:>9.1f} / "
          f"{result['latency_p99_us']:.1f} µs")
    print(f"    Min / Max      : {result['latency_min_us']:>9.1f} / "
          f"{result['latency_max_us']:.1f} µs")
    print(f"    Throughput     : {result['throughput_inf_per_s']:>9.1f} inf/s")
    print(f"    CPU usage      : {result['cpu_percent']:>9.1f} %")
    print(f"    RAM used       : {result['ram_used_mb']:>9.1f} MB  "
          f"(Δ {result['ram_delta_mb']:+.1f} MB)")
    return result


# ── Charts ────────────────────────────────────────────────────────────────────

def save_comparison_charts(results, out_path):
    names = [r["model"] for r in results]
    means = [r["latency_mean_us"]      for r in results]
    stds  = [r["latency_std_us"]       for r in results]
    fps   = [r["throughput_inf_per_s"] for r in results]
    p99s  = [r["latency_p99_us"]       for r in results]
    cpus  = [r["cpu_percent"]          for r in results]

    colours = ['#4C72B0', '#55A868', '#C44E52', '#8172B2']
    fig, axes = plt.subplots(2, 2, figsize=(14, 10))
    fig.suptitle('Laptop CPU Inference Benchmark\n(Baseline for FPGA Comparison)',
                 fontsize=14, fontweight='bold')

    def bar(ax, vals, title, ylabel, errs=None):
        bars = ax.bar(names, vals, color=colours[:len(names)], yerr=errs,
                      capsize=5, error_kw={'elinewidth': 1.5})
        ax.set_title(title); ax.set_ylabel(ylabel)
        ax.tick_params(axis='x', rotation=15)
        for bar_, v in zip(bars, vals):
            ax.text(bar_.get_x() + bar_.get_width()/2, bar_.get_height() * 1.02,
                    f'{v:.1f}', ha='center', va='bottom', fontsize=9)

    bar(axes[0, 0], means, 'Mean Inference Latency', 'Latency (µs)', errs=stds)
    bar(axes[0, 1], fps,   'Throughput', 'Inferences / second')
    bar(axes[1, 0], p99s,  'P99 Latency (Tail Latency)', 'Latency µs (P99)')
    bar(axes[1, 1], cpus,  'CPU Utilisation During Inference', 'CPU %')

    plt.tight_layout()
    plt.savefig(out_path, dpi=150, bbox_inches='tight')
    plt.close()
    print(f"\nSaved comparison chart → {out_path}")


def save_latency_distributions(results, out_path):
    """Box plot of latency distributions for all models."""
    fig, ax = plt.subplots(figsize=(10, 6))
    data_to_plot = []   # we store summary stats since we don't keep raw per-run data
    # Recreate approximate distribution from stats for visualisation
    for r in results:
        # generate representative sample using mean/std
        samples = np.random.normal(r['latency_mean_us'], r['latency_std_us'],
                                   r['n_runs'])
        samples = np.clip(samples, r['latency_min_us'], r['latency_max_us'])
        data_to_plot.append(samples)

    bp = ax.boxplot(data_to_plot, patch_artist=True, notch=True)
    colours = ['#4C72B0', '#55A868', '#C44E52', '#8172B2']
    for patch, colour in zip(bp['boxes'], colours):
        patch.set_facecolor(colour); patch.set_alpha(0.7)
    ax.set_xticklabels([r['model'] for r in results], rotation=15)
    ax.set_ylabel('Latency (µs)')
    ax.set_title('Inference Latency Distribution (Laptop CPU)\n'
                 'Note: distributions approximated from summary stats')
    plt.tight_layout()
    plt.savefig(out_path, dpi=150)
    plt.close()
    print(f"Saved latency distribution → {out_path}")


# ── Entry point ───────────────────────────────────────────────────────────────

def main(n_runs=500):
    print("=" * 60)
    print("  Laptop CPU Inference Benchmark — All 4 Models")
    print(f"  Runs per model: {n_runs}  |  Warmup: 50")
    print("=" * 60)

    device = torch.device('cpu')
    all_results = []

    # ── CNN ──────────────────────────────────────────────────────────────────
    cnn_path = os.path.join(MODEL_DIR, 'cnn_weights.pth')
    if os.path.exists(cnn_path):
        cnn = SimpleCNN(num_classes=43).eval()
        cnn.load_state_dict(torch.load(cnn_path, weights_only=True, map_location=device))
        inp = dummy_cnn()
        def infer_cnn():
            with torch.no_grad(): return cnn(inp)
        res = benchmark("CNN", infer_cnn, n_runs)
        all_results.append(res)
        os.makedirs(os.path.join(RESULTS_DIR, 'cnn'), exist_ok=True)
        with open(os.path.join(RESULTS_DIR, 'cnn', 'latency_laptop.json'), 'w') as f:
            json.dump(res, f, indent=4)

    # ── Audio MLP ────────────────────────────────────────────────────────────
    mlp_path = os.path.join(MODEL_DIR, 'audio_mlp_weights.pth')
    if os.path.exists(mlp_path):
        mlp = AudioMLP(input_size=160, hidden_size=256, num_classes=2).eval()
        mlp.load_state_dict(torch.load(mlp_path, weights_only=True, map_location=device))
        inp = dummy_audio_mlp()
        def infer_mlp():
            with torch.no_grad(): return mlp(inp)
        res = benchmark("Audio_MLP", infer_mlp, n_runs)
        all_results.append(res)
        os.makedirs(os.path.join(RESULTS_DIR, 'audio_mlp'), exist_ok=True)
        with open(os.path.join(RESULTS_DIR, 'audio_mlp', 'latency_laptop.json'), 'w') as f:
            json.dump(res, f, indent=4)

    # ── BNN Pothole ───────────────────────────────────────────────────────────
    bnn_path = os.path.join(MODEL_DIR, 'bnn_pothole_weights.pth')
    if os.path.exists(bnn_path):
        bnn = BNNPotholeDetector().eval()
        bnn.load_state_dict(torch.load(bnn_path, weights_only=True, map_location=device))
        inp = dummy_bnn_pothole()
        def infer_bnn():
            with torch.no_grad(): return bnn(inp)
        res = benchmark("BNN_Pothole", infer_bnn, n_runs)
        all_results.append(res)
        os.makedirs(os.path.join(RESULTS_DIR, 'bnn'), exist_ok=True)
        with open(os.path.join(RESULTS_DIR, 'bnn', 'latency_laptop.json'), 'w') as f:
            json.dump(res, f, indent=4)

    # ── SVM ───────────────────────────────────────────────────────────────────
    svm_path = os.path.join(MODEL_DIR, 'svm_model.pkl')
    scl_path = os.path.join(MODEL_DIR, 'svm_scaler.pkl')
    if os.path.exists(svm_path) and os.path.exists(scl_path):
        clf    = joblib.load(svm_path)
        scaler = joblib.load(scl_path)
        inp    = dummy_svm(clf, scaler)
        def infer_svm():
            return clf.predict(inp)
        res = benchmark("SVM", infer_svm, n_runs)
        all_results.append(res)
        os.makedirs(os.path.join(RESULTS_DIR, 'svm'), exist_ok=True)
        with open(os.path.join(RESULTS_DIR, 'svm', 'latency_laptop.json'), 'w') as f:
            json.dump(res, f, indent=4)

    if not all_results:
        print("No models found. Check model_outputs/ directory.")
        return

    # ── Summary ───────────────────────────────────────────────────────────────
    print("\n" + "=" * 60)
    print(f"  {'Model':<16} {'Mean (µs)':>10} {'Median':>10} "
          f"{'P99':>10} {'inf/s':>10}")
    print("  " + "-" * 56)
    for r in all_results:
        print(f"  {r['model']:<16} {r['latency_mean_us']:>10.1f} "
              f"{r['latency_median_us']:>10.1f} {r['latency_p99_us']:>10.1f} "
              f"{r['throughput_inf_per_s']:>10.1f}")
    print("=" * 60)

    os.makedirs(RESULTS_DIR, exist_ok=True)
    save_comparison_charts(all_results,
                           os.path.join(RESULTS_DIR, 'laptop_comparison.png'))
    save_latency_distributions(all_results,
                               os.path.join(RESULTS_DIR, 'laptop_latency_dist.png'))

    with open(os.path.join(RESULTS_DIR, 'laptop_benchmark_summary.json'), 'w') as f:
        json.dump(all_results, f, indent=4)
    print(f"\nFull summary → {RESULTS_DIR}/laptop_benchmark_summary.json")


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--runs', type=int, default=500,
                        help='Number of inference runs per model (default 500)')
    args = parser.parse_args()
    main(n_runs=args.runs)
