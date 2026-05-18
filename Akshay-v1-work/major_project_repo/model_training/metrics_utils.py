"""
Shared evaluation utilities used by all evaluate_*.py scripts.
Provides extended metrics, ROC/PR curves, and classification reports.
"""
import os
import json
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from sklearn.metrics import (
    accuracy_score, precision_score, recall_score, f1_score,
    matthews_corrcoef, cohen_kappa_score, log_loss, brier_score_loss,
    roc_curve, auc, precision_recall_curve, average_precision_score,
    balanced_accuracy_score, classification_report,
)


# ── Binary metrics ────────────────────────────────────────────────────────────

def compute_binary_metrics(labels, preds, scores=None):
    """
    Returns a dict of all meaningful binary classification metrics.
    scores: predicted probability for the positive class (optional, needed for AUC/Brier).
    """
    tn = int(((labels == 0) & (preds == 0)).sum())
    fp = int(((labels == 0) & (preds == 1)).sum())
    fn = int(((labels == 1) & (preds == 0)).sum())
    tp = int(((labels == 1) & (preds == 1)).sum())

    specificity = tn / (tn + fp) if (tn + fp) > 0 else 0.0
    fpr_val     = fp / (fp + tn) if (fp + tn) > 0 else 0.0
    fnr_val     = fn / (fn + tp) if (fn + tp) > 0 else 0.0

    m = {
        "Accuracy":          round(accuracy_score(labels, preds)                              * 100, 4),
        "Balanced_Accuracy": round(balanced_accuracy_score(labels, preds)                     * 100, 4),
        "Precision":         round(precision_score(labels, preds, zero_division=0)            * 100, 4),
        "Recall":            round(recall_score(labels, preds, zero_division=0)               * 100, 4),
        "Specificity":       round(specificity                                                * 100, 4),
        "F1":                round(f1_score(labels, preds, zero_division=0)                   * 100, 4),
        "MCC":               round(float(matthews_corrcoef(labels, preds))                         , 4),
        "Cohen_Kappa":       round(float(cohen_kappa_score(labels, preds))                        , 4),
        "FPR":               round(fpr_val                                                    * 100, 4),
        "FNR":               round(fnr_val                                                    * 100, 4),
        "TP": tp, "TN": tn, "FP": fp, "FN": fn,
    }
    if scores is not None:
        m["ROC_AUC"]  = round(float(auc(*roc_curve(labels, scores)[:2]))          , 4)
        m["Avg_Prec"] = round(float(average_precision_score(labels, scores))      , 4)
        m["Log_Loss"] = round(float(log_loss(labels, scores))                     , 4)
        m["Brier"]    = round(float(brier_score_loss(labels, scores))             , 4)
    return m


def compute_multiclass_metrics(labels, preds, num_classes):
    m = {
        "Accuracy":          round(accuracy_score(labels, preds)                                      * 100, 4),
        "Balanced_Accuracy": round(balanced_accuracy_score(labels, preds)                             * 100, 4),
        "Macro_Precision":   round(precision_score(labels, preds, average='macro',    zero_division=0)* 100, 4),
        "Macro_Recall":      round(recall_score(labels, preds,    average='macro',    zero_division=0)* 100, 4),
        "Macro_F1":          round(f1_score(labels, preds,        average='macro',    zero_division=0)* 100, 4),
        "Weighted_Precision":round(precision_score(labels, preds, average='weighted', zero_division=0)* 100, 4),
        "Weighted_Recall":   round(recall_score(labels, preds,    average='weighted', zero_division=0)* 100, 4),
        "Weighted_F1":       round(f1_score(labels, preds,        average='weighted', zero_division=0)* 100, 4),
        "MCC":               round(float(matthews_corrcoef(labels, preds))                                , 4),
        "Cohen_Kappa":       round(float(cohen_kappa_score(labels, preds))                               , 4),
    }
    return m


# ── Plot helpers ──────────────────────────────────────────────────────────────

def save_roc_curve(labels, scores, title, out_path):
    fpr, tpr, _ = roc_curve(labels, scores)
    roc_auc = auc(fpr, tpr)
    fig, ax = plt.subplots(figsize=(6, 5))
    ax.plot(fpr, tpr, lw=2, color='#4C72B0', label=f'AUC = {roc_auc:.4f}')
    ax.plot([0, 1], [0, 1], 'k--', lw=1)
    ax.set_xlim([0, 1]); ax.set_ylim([0, 1.02])
    ax.set_xlabel('False Positive Rate'); ax.set_ylabel('True Positive Rate')
    ax.set_title(f'{title}\nROC Curve')
    ax.legend(loc='lower right')
    plt.tight_layout()
    plt.savefig(out_path, dpi=150)
    plt.close()
    print(f"Saved ROC curve → {out_path}")


def save_pr_curve(labels, scores, title, out_path):
    prec, rec, _ = precision_recall_curve(labels, scores)
    ap = average_precision_score(labels, scores)
    fig, ax = plt.subplots(figsize=(6, 5))
    ax.plot(rec, prec, lw=2, color='#55A868', label=f'AP = {ap:.4f}')
    ax.set_xlim([0, 1]); ax.set_ylim([0, 1.02])
    ax.set_xlabel('Recall'); ax.set_ylabel('Precision')
    ax.set_title(f'{title}\nPrecision-Recall Curve')
    ax.legend(loc='upper right')
    plt.tight_layout()
    plt.savefig(out_path, dpi=150)
    plt.close()
    print(f"Saved PR curve → {out_path}")


def save_extended_bar_chart(metrics_dict, title, out_path):
    """Bar chart for all percentage-based metrics."""
    pct_keys = [k for k, v in metrics_dict.items()
                if isinstance(v, float) and 0 <= v <= 100
                and k not in ('MCC', 'Cohen_Kappa', 'ROC_AUC', 'Avg_Prec',
                               'Log_Loss', 'Brier')]
    values = [metrics_dict[k] for k in pct_keys]
    colours = plt.cm.Blues(np.linspace(0.4, 0.9, len(pct_keys)))

    fig, ax = plt.subplots(figsize=(max(8, len(pct_keys) * 0.9), 5))
    bars = ax.bar(pct_keys, values, color=colours)
    ax.set_ylim(0, 115); ax.set_ylabel('Score (%)')
    ax.set_title(title)
    ax.tick_params(axis='x', rotation=30)
    for bar, val in zip(bars, values):
        ax.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 0.8,
                f'{val:.2f}%', ha='center', va='bottom', fontsize=9)
    plt.tight_layout()
    plt.savefig(out_path, dpi=150, bbox_inches='tight')
    plt.close()
    print(f"Saved metrics bar chart → {out_path}")


def save_scalar_metrics_table(metrics_dict, title, out_path):
    """Save MCC, Kappa, AUC etc. as a small table image."""
    scalar_keys = ['MCC', 'Cohen_Kappa', 'ROC_AUC', 'Avg_Prec', 'Log_Loss', 'Brier']
    rows = [(k, metrics_dict[k]) for k in scalar_keys if k in metrics_dict]
    if not rows:
        return

    fig, ax = plt.subplots(figsize=(5, 0.5 * len(rows) + 1.2))
    ax.axis('off')
    tbl = ax.table(
        cellText=[[k, f'{v:.4f}'] for k, v in rows],
        colLabels=['Metric', 'Value'],
        cellLoc='center', loc='center',
        bbox=[0, 0, 1, 1]
    )
    tbl.auto_set_font_size(False); tbl.set_fontsize(11)
    ax.set_title(title, pad=10, fontsize=12)
    plt.tight_layout()
    plt.savefig(out_path, dpi=150, bbox_inches='tight')
    plt.close()
    print(f"Saved scalar metrics table → {out_path}")


def save_per_class_f1(labels, preds, class_names, title, out_path, top_n=30):
    """Bar chart of per-class F1 scores (useful for multi-class like CNN)."""
    f1_per = f1_score(labels, preds, average=None, zero_division=0)
    if len(class_names) > top_n:
        idx = np.argsort(f1_per)[:top_n]  # show worst top_n classes
        f1_per = f1_per[idx]
        class_names = [class_names[i] for i in idx]
        subtitle = f'(Bottom {top_n} classes by F1)'
    else:
        subtitle = ''

    colours = plt.cm.RdYlGn(f1_per)
    fig, ax = plt.subplots(figsize=(max(10, len(class_names) * 0.5), 5))
    ax.bar(class_names, f1_per * 100, color=colours)
    ax.set_ylim(0, 110); ax.set_ylabel('F1 Score (%)')
    ax.set_title(f'{title}\nPer-Class F1 {subtitle}')
    ax.tick_params(axis='x', rotation=90)
    plt.tight_layout()
    plt.savefig(out_path, dpi=150, bbox_inches='tight')
    plt.close()
    print(f"Saved per-class F1 chart → {out_path}")


def print_summary_table(metrics_dict, model_name):
    """Print a clean summary to stdout."""
    print(f"\n{'─'*50}")
    print(f"  {model_name} — Extended Metrics")
    print(f"{'─'*50}")
    for k, v in metrics_dict.items():
        if k in ('TP', 'TN', 'FP', 'FN'):
            print(f"  {k:<22}: {v}")
        elif isinstance(v, float):
            unit = '' if k in ('MCC', 'Cohen_Kappa', 'ROC_AUC', 'Avg_Prec',
                                'Log_Loss', 'Brier') else '%'
            print(f"  {k:<22}: {v:.4f}{unit}")
    print(f"{'─'*50}\n")
