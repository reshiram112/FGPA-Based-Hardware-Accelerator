"""
Run all 4 model evaluations in sequence and print a final summary table.
Usage: python evaluate_all.py
"""
import os
import json
import importlib
import sys

sys.path.insert(0, os.path.dirname(__file__))

EVAL_MODULES = [
    ('evaluate_cnn',       'results/cnn/cnn_evaluation.json'),
    ('evaluate_audio_mlp', 'results/audio_mlp/audio_mlp_evaluation.json'),
    ('evaluate_bnn',       'results/bnn/bnn_evaluation.json'),
    ('evaluate_svm',       'results/svm/svm_evaluation.json'),
]

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def print_summary():
    print("\n" + "=" * 65)
    print(f"{'Model':<16} {'Accuracy':>10} {'Precision':>10} {'Recall':>10} {'F1':>10}")
    print("-" * 65)
    for _, json_rel in EVAL_MODULES:
        path = os.path.join(ROOT, json_rel)
        if not os.path.exists(path):
            continue
        with open(path) as f:
            r = json.load(f)
        print(f"{r['model']:<16} {r['Accuracy']:>9.2f}% {r['Precision']:>9.2f}% "
              f"{r['Recall']:>9.2f}% {r['F1']:>9.2f}%")
    print("=" * 65)


if __name__ == '__main__':
    for module_name, _ in EVAL_MODULES:
        print(f"\n{'#' * 60}")
        mod = importlib.import_module(module_name)
        mod.main()

    print_summary()
