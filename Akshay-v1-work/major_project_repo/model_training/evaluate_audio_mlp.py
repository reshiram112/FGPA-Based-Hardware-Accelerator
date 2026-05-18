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
from train_audio_mlp import AudioMLP, UrbanSoundDataset
from metrics_utils import (compute_binary_metrics, save_roc_curve, save_pr_curve,
                            save_extended_bar_chart, save_scalar_metrics_table,
                            print_summary_table)

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MODEL_PATH   = os.path.join(ROOT, 'model_outputs', 'audio_mlp_weights.pth')
URBAN_CSV    = os.path.join(ROOT, 'datasets', 'urbansound', 'UrbanSound8K.csv')
URBAN_DIR    = os.path.join(ROOT, 'datasets', 'urbansound')
RESULTS_DIR  = os.path.join(ROOT, 'results', 'audio_mlp')
CLASS_NAMES  = ['Non-Siren', 'Siren']


def run_inference(model, testset):
    loader = torch.utils.data.DataLoader(testset, batch_size=128, shuffle=False)
    all_preds, all_labels, all_scores = [], [], []
    model.eval()
    with torch.no_grad():
        for inputs, labels in loader:
            logits = model(inputs)
            probs  = F.softmax(logits, dim=1)
            _, predicted = torch.max(logits, 1)
            all_preds.extend(predicted.cpu().numpy())
            all_labels.extend(labels.cpu().numpy())
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
        ax.set_title(f'Audio MLP – Confusion Matrix ({title})\nUrbanSound8K')
        ax.set_xlabel('Predicted'); ax.set_ylabel('True')
        ax.set_xticks([0,1]); ax.set_xticklabels(CLASS_NAMES)
        ax.set_yticks([0,1]); ax.set_yticklabels(CLASS_NAMES)
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
    print("=== Evaluating Audio MLP (Extended) ===")
    os.makedirs(RESULTS_DIR, exist_ok=True)

    model = AudioMLP(input_size=160, hidden_size=256, num_classes=2)
    model.load_state_dict(torch.load(MODEL_PATH, weights_only=True))

    testset = UrbanSoundDataset(URBAN_CSV, URBAN_DIR, folds=[9])
    labels, preds, scores = run_inference(model, testset)

    metrics = compute_binary_metrics(labels, preds, scores)
    print_summary_table(metrics, "Audio MLP")

    save_confusion_matrix(labels, preds,
                          os.path.join(RESULTS_DIR, 'audio_mlp_confusion_matrix.png'))
    save_roc_curve(labels, scores, 'Audio MLP – Siren Detection',
                   os.path.join(RESULTS_DIR, 'audio_mlp_roc.png'))
    save_pr_curve(labels, scores, 'Audio MLP – Siren Detection',
                  os.path.join(RESULTS_DIR, 'audio_mlp_pr_curve.png'))
    save_extended_bar_chart(metrics, 'Audio MLP – All Metrics',
                            os.path.join(RESULTS_DIR, 'audio_mlp_metrics.png'))
    save_scalar_metrics_table(metrics, 'Audio MLP – Scalar Metrics',
                              os.path.join(RESULTS_DIR, 'audio_mlp_scalar_metrics.png'))

    summary = {"model": "Audio_MLP", "dataset": "UrbanSound8K", **metrics}
    with open(os.path.join(RESULTS_DIR, 'audio_mlp_evaluation.json'), 'w') as f:
        json.dump(summary, f, indent=4)
    print(f"Saved summary JSON → {RESULTS_DIR}/audio_mlp_evaluation.json")


if __name__ == '__main__':
    main()
