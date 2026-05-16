import os
import sys
import json
import torch
import torchvision
import torchvision.transforms as transforms
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from sklearn.metrics import confusion_matrix
import torch.nn.functional as F

sys.path.insert(0, os.path.dirname(__file__))
from train_cnn import SimpleCNN
from metrics_utils import (compute_multiclass_metrics, save_extended_bar_chart,
                            save_per_class_f1, save_scalar_metrics_table,
                            print_summary_table)

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MODEL_PATH   = os.path.join(ROOT, 'model_outputs', 'cnn_weights.pth')
DATASET_PATH = os.path.join(ROOT, 'datasets', 'gtsrb', 'Train')
RESULTS_DIR  = os.path.join(ROOT, 'results', 'cnn')


def load_testset():
    transform = transforms.Compose([
        transforms.Resize((32, 32)),
        transforms.ToTensor(),
        transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))
    ])
    dataset = torchvision.datasets.ImageFolder(root=DATASET_PATH, transform=transform)
    train_size = int(0.8 * len(dataset))
    torch.manual_seed(42)
    _, testset = torch.utils.data.random_split(dataset, [train_size, len(dataset)-train_size])
    return testset, dataset.classes


def run_inference(model, testset):
    loader = torch.utils.data.DataLoader(testset, batch_size=128, shuffle=False)
    all_preds, all_labels, all_probs = [], [], []
    model.eval()
    with torch.no_grad():
        for images, labels in loader:
            logits = model(images)
            probs  = F.softmax(logits, dim=1)
            _, predicted = torch.max(logits, 1)
            all_preds.extend(predicted.cpu().numpy())
            all_labels.extend(labels.cpu().numpy())
            all_probs.append(probs.cpu().numpy())
    return (np.array(all_labels), np.array(all_preds),
            np.concatenate(all_probs, axis=0))


def top_k_accuracy(labels, probs, k=5):
    top_k = np.argsort(probs, axis=1)[:, -k:]
    correct = sum(labels[i] in top_k[i] for i in range(len(labels)))
    return correct / len(labels) * 100


def save_confusion_matrix(labels, preds, class_names, out_path):
    cm      = confusion_matrix(labels, preds)
    cm_norm = cm.astype(float) / cm.sum(axis=1, keepdims=True)
    fig, ax = plt.subplots(figsize=(20, 18))
    im = ax.imshow(cm_norm, interpolation='nearest', cmap='Blues')
    plt.colorbar(im, ax=ax, fraction=0.046, pad=0.04)
    ax.set_title('CNN – Normalised Confusion Matrix\nGTSRB Traffic Signs (43 classes)', fontsize=14)
    ax.set_xlabel('Predicted Class'); ax.set_ylabel('True Class')
    tick_marks = np.arange(len(class_names))
    ax.set_xticks(tick_marks); ax.set_xticklabels(class_names, rotation=90, fontsize=6)
    ax.set_yticks(tick_marks); ax.set_yticklabels(class_names, fontsize=6)
    plt.tight_layout()
    plt.savefig(out_path, dpi=150, bbox_inches='tight')
    plt.close()
    print(f"Saved confusion matrix → {out_path}")


def main():
    print("=== Evaluating CNN (Extended) ===")
    os.makedirs(RESULTS_DIR, exist_ok=True)

    model = SimpleCNN(num_classes=43)
    model.load_state_dict(torch.load(MODEL_PATH, weights_only=True))

    testset, class_names = load_testset()
    labels, preds, probs = run_inference(model, testset)

    metrics = compute_multiclass_metrics(labels, preds, 43)
    metrics["Top5_Accuracy"] = round(top_k_accuracy(labels, probs, k=5), 4)
    print_summary_table(metrics, "CNN Traffic Sign Recognition")

    save_confusion_matrix(labels, preds, class_names,
                          os.path.join(RESULTS_DIR, 'cnn_confusion_matrix.png'))
    save_extended_bar_chart(metrics, 'CNN – All Metrics\nGTSRB Traffic Signs',
                            os.path.join(RESULTS_DIR, 'cnn_metrics.png'))
    save_per_class_f1(labels, preds, class_names,
                      'CNN – Per-Class F1\nGTSRB Traffic Signs',
                      os.path.join(RESULTS_DIR, 'cnn_per_class_f1.png'))
    save_scalar_metrics_table(metrics, 'CNN – Scalar Metrics',
                              os.path.join(RESULTS_DIR, 'cnn_scalar_metrics.png'))

    summary = {"model": "CNN", "dataset": "GTSRB", **metrics}
    with open(os.path.join(RESULTS_DIR, 'cnn_evaluation.json'), 'w') as f:
        json.dump(summary, f, indent=4)
    print(f"Saved summary JSON → {RESULTS_DIR}/cnn_evaluation.json")


if __name__ == '__main__':
    main()
