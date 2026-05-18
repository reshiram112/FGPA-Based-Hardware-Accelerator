import os
import sys
import json
import torch
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from sklearn.metrics import confusion_matrix
import torch.nn.functional as F

sys.path.insert(0, os.path.dirname(__file__))
from train_bnn_pothole import BNNPotholeDetector, build_patch_dataset, PatchDataset, SEED
from metrics_utils import (compute_binary_metrics, save_roc_curve, save_pr_curve,
                            save_extended_bar_chart, save_scalar_metrics_table,
                            print_summary_table)
from torch.utils.data import DataLoader
import random

ROOT        = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MODEL_PATH  = os.path.join(ROOT, 'model_outputs', 'bnn_pothole_weights.pth')
RESULTS_DIR = os.path.join(ROOT, 'results', 'bnn')
CLASS_NAMES = ['Normal Road', 'Pothole']


def get_testset():
    random.seed(SEED); np.random.seed(SEED); torch.manual_seed(SEED)
    positives, negatives = build_patch_dataset()
    all_patches = positives + negatives
    all_labels  = [1] * len(positives) + [0] * len(negatives)
    idx = list(range(len(all_patches)))
    random.seed(SEED); random.shuffle(idx)
    all_patches = [all_patches[i] for i in idx]
    all_labels  = [all_labels[i]  for i in idx]
    n_train = int(0.8 * len(all_patches))
    return PatchDataset(all_patches[n_train:], all_labels[n_train:], augment=False)


def run_inference(model, dataset):
    loader = DataLoader(dataset, batch_size=64, shuffle=False)
    all_preds, all_labels, all_scores = [], [], []
    model.eval()
    with torch.no_grad():
        for X, y in loader:
            logits = model(X)
            probs  = F.softmax(logits, dim=1)
            _, pred = torch.max(logits, 1)
            all_preds.extend(pred.cpu().numpy())
            all_labels.extend(y.numpy() if hasattr(y, 'numpy') else y)
            all_scores.extend(probs[:, 1].cpu().numpy())
    return np.array(all_labels), np.array(all_preds), np.array(all_scores)


def save_confusion_matrix(labels, preds, out_path):
    cm = confusion_matrix(labels, preds)
    fig, axes = plt.subplots(1, 2, figsize=(12, 5))
    for ax, data, title in zip(axes,
                                [cm, cm.astype(float)/cm.sum(axis=1, keepdims=True)],
                                ['Counts', 'Normalised']):
        im = ax.imshow(data, interpolation='nearest', cmap='Blues')
        plt.colorbar(im, ax=ax)
        ax.set_title(f'BNN Pothole – Confusion Matrix ({title})')
        ax.set_xlabel('Predicted'); ax.set_ylabel('True')
        ax.set_xticks(range(2)); ax.set_xticklabels(CLASS_NAMES)
        ax.set_yticks(range(2)); ax.set_yticklabels(CLASS_NAMES)
        for i in range(2):
            for j in range(2):
                val = data[i, j]
                label = f'{val:.2f}' if isinstance(val, float) else str(val)
                ax.text(j, i, label, ha='center', va='center', fontsize=13,
                        color='white' if val > data.max()/2 else 'black')
    plt.tight_layout()
    plt.savefig(out_path, dpi=150)
    plt.close()
    print(f"Saved confusion matrix → {out_path}")


def main():
    print("=== Evaluating BNN Pothole Detector (Extended) ===")
    os.makedirs(RESULTS_DIR, exist_ok=True)

    model = BNNPotholeDetector()
    model.load_state_dict(torch.load(MODEL_PATH, weights_only=True))

    print("Rebuilding test split...")
    testset = get_testset()
    labels, preds, scores = run_inference(model, testset)

    metrics = compute_binary_metrics(labels, preds, scores)
    print_summary_table(metrics, "BNN Pothole Detector")

    save_confusion_matrix(labels, preds,
                          os.path.join(RESULTS_DIR, 'bnn_pothole_confusion_matrix.png'))
    save_roc_curve(labels, scores, 'BNN Pothole Detector',
                   os.path.join(RESULTS_DIR, 'bnn_pothole_roc.png'))
    save_pr_curve(labels, scores, 'BNN Pothole Detector',
                  os.path.join(RESULTS_DIR, 'bnn_pothole_pr_curve.png'))
    save_extended_bar_chart(metrics, 'BNN Pothole Detector – All Metrics',
                            os.path.join(RESULTS_DIR, 'bnn_pothole_metrics.png'))
    save_scalar_metrics_table(metrics, 'BNN Pothole – Scalar Metrics',
                              os.path.join(RESULTS_DIR, 'bnn_pothole_scalar_metrics.png'))

    summary = {"model": "BNN_Pothole", "dataset": "Pothole Image Patches",
               "classes": CLASS_NAMES, **metrics}
    with open(os.path.join(RESULTS_DIR, 'bnn_evaluation.json'), 'w') as f:
        json.dump(summary, f, indent=4)
    print(f"Saved summary JSON → {RESULTS_DIR}/bnn_evaluation.json")


if __name__ == '__main__':
    main()
