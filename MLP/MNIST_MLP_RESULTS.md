# MNIST MLP — Training Run Results
**Date:** 2026-04-19  
**Runtime:** Google Colab T4 GPU  
**Branch:** MLP

---

## Final Result

```
★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
  TEST ACCURACY : 98.44%
★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★

  SUCCESS — 98.44%  >= 95% TARGET!
```

---

## Training Summary

| Metric | Value |
|--------|-------|
| Test Accuracy | **98.44%** |
| Best Val Accuracy | **98.42%** |
| Training Time | **308.4 seconds (~5 min)** |
| Attempts Needed | **1** (no retry required) |
| GPU | T4 (Google Colab) |
| Epochs Run | 20 |

---

## Per-Class Classification Report

| Digit | Precision | Recall | F1-Score | Support |
|-------|-----------|--------|----------|---------|
| 0 | 0.98 | 0.99 | 0.99 | 980 |
| 1 | 0.99 | 0.99 | 0.99 | 1135 |
| 2 | 0.98 | 0.98 | 0.98 | 1032 |
| 3 | 0.99 | 0.99 | 0.99 | 1010 |
| 4 | 0.98 | 0.98 | 0.98 | 982 |
| 5 | 0.99 | 0.98 | 0.98 | 892 |
| 6 | 0.99 | 0.99 | 0.99 | 958 |
| 7 | 0.98 | 0.98 | 0.98 | 1028 |
| 8 | 0.99 | 0.98 | 0.98 | 974 |
| 9 | 0.99 | 0.97 | 0.98 | 1009 |
| **macro avg** | **0.98** | **0.98** | **0.98** | **10000** |
| **weighted avg** | **0.98** | **0.98** | **0.98** | **10000** |

---

## Model Configuration (Attempt 1 — no retry needed)

```python
CONFIG = {
    "batch_size"   : 128,
    "lr"           : 1e-3,
    "weight_decay" : 1e-4,
    "epochs"       : 20,
    "dropout"      : 0.3,
    "hidden_dims"  : [512, 256, 128],
    "val_fraction" : 0.1,
    "patience"     : 5,
}
```

## Architecture

```
Input(784) → Linear(512)+BN+ReLU+Drop(0.3)
           → Linear(256)+BN+ReLU+Drop(0.3)
           → Linear(128)+BN+ReLU+Drop(0.3)
           → Output(10)

Total parameters: 569,226
```

---

## Success Criteria — ALL MET

- [x] Model trains successfully
- [x] Test accuracy >= 80% (achieved 98.44%)
- [x] Test accuracy >= 95% target (achieved 98.44%)
- [x] Runs end-to-end in Colab without errors
- [x] GPU detected and used (T4)
- [x] Training logs per epoch (loss + accuracy)
- [x] Confusion matrix generated
- [x] Misclassified samples visualised
- [x] Code pushed to MLP branch on GitHub
