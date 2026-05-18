import os
import sys
import json
import joblib
import numpy as np
import pandas as pd
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix

sys.path.insert(0, os.path.dirname(__file__))
from train_svm import engineer_features
from metrics_utils import (compute_binary_metrics, save_roc_curve, save_pr_curve,
                            save_extended_bar_chart, save_scalar_metrics_table,
                            print_summary_table)

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MODEL_PATH   = os.path.join(ROOT, 'model_outputs', 'svm_model.pkl')
SCALER_PATH  = os.path.join(ROOT, 'model_outputs', 'svm_scaler.pkl')
DATA_PATH    = os.path.join(ROOT, 'datasets', 'lane_data', 'processed_lane_data.csv')
RESULTS_DIR  = os.path.join(ROOT, 'results', 'svm')
CLASS_NAMES  = ['Keep Lane', 'Lane Change']


def load_testset():
    df = pd.read_csv(DATA_PATH)
    X  = engineer_features(df)
    y  = df['label'].values
    _, X_test, _, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    return X_test, y_test


def save_confusion_matrix(labels, preds, out_path):
    cm = confusion_matrix(labels, preds)
    fig, axes = plt.subplots(1, 2, figsize=(12, 5))
    for ax, data, title in zip(axes,
                                [cm, cm.astype(float)/cm.sum(axis=1, keepdims=True)],
                                ['Counts', 'Normalised']):
        im = ax.imshow(data, interpolation='nearest', cmap='Blues')
        plt.colorbar(im, ax=ax)
        ax.set_title(f'SVM – Confusion Matrix ({title})\nNGSIM Lane Change')
        ax.set_xlabel('Predicted'); ax.set_ylabel('True')
        n = len(CLASS_NAMES)
        ax.set_xticks(range(n)); ax.set_xticklabels(CLASS_NAMES)
        ax.set_yticks(range(n)); ax.set_yticklabels(CLASS_NAMES)
        for i in range(n):
            for j in range(n):
                val = data[i, j]
                label = f'{val:.2f}' if isinstance(val, float) else str(val)
                ax.text(j, i, label, ha='center', va='center', fontsize=13,
                        color='white' if val > data.max()/2 else 'black')
    plt.tight_layout()
    plt.savefig(out_path, dpi=150)
    plt.close()
    print(f"Saved confusion matrix → {out_path}")


def main():
    print("=== Evaluating SVM (Extended) ===")
    os.makedirs(RESULTS_DIR, exist_ok=True)

    clf    = joblib.load(MODEL_PATH)
    scaler = joblib.load(SCALER_PATH)

    X_test, y_test  = load_testset()
    X_test_sc       = scaler.transform(X_test)
    preds           = clf.predict(X_test_sc)
    scores          = clf.decision_function(X_test_sc)

    # Normalise decision function to [0,1] for ROC/PR (sigmoid)
    scores_prob = 1 / (1 + np.exp(-scores))

    metrics = compute_binary_metrics(y_test, preds, scores_prob)
    print_summary_table(metrics, "SVM Lane Change")

    save_confusion_matrix(y_test, preds,
                          os.path.join(RESULTS_DIR, 'svm_confusion_matrix.png'))
    save_roc_curve(y_test, scores_prob, 'SVM – Lane Change Detection',
                   os.path.join(RESULTS_DIR, 'svm_roc.png'))
    save_pr_curve(y_test, scores_prob, 'SVM – Lane Change Detection',
                  os.path.join(RESULTS_DIR, 'svm_pr_curve.png'))
    save_extended_bar_chart(metrics, 'SVM – All Metrics',
                            os.path.join(RESULTS_DIR, 'svm_metrics.png'))
    save_scalar_metrics_table(metrics, 'SVM – Scalar Metrics',
                              os.path.join(RESULTS_DIR, 'svm_scalar_metrics.png'))

    summary = {"model": "SVM", "dataset": "NGSIM", **metrics}
    with open(os.path.join(RESULTS_DIR, 'svm_evaluation.json'), 'w') as f:
        json.dump(summary, f, indent=4)
    print(f"Saved summary JSON → {RESULTS_DIR}/svm_evaluation.json")


if __name__ == '__main__':
    main()
