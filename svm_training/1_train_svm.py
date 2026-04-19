import os
import sys
import numpy as np
import pandas as pd
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler
from sklearn.svm import LinearSVC
from sklearn.metrics import (accuracy_score, confusion_matrix, 
                             classification_report, precision_score,
                             recall_score, f1_score)
import joblib
import matplotlib
matplotlib.use('Agg')  # Non-interactive backend (no GUI needed)
import matplotlib.pyplot as plt
import seaborn as sns

# Paths
current_dir = os.path.dirname(os.path.abspath(__file__))
fpga_dir = os.path.join(current_dir, "..", "svm_fpga")
local_dir = os.path.join(current_dir, "..", "svm_local_machine")
results_dir = os.path.join(current_dir, "results")

for d in [fpga_dir, local_dir, results_dir]:
    if not os.path.exists(d):
        os.makedirs(d)

print("="*60)
print("  Breast Cancer SVM Training & FPGA Quantization")
print("="*60)

# ================================================================
# 1. Load Dataset
# ================================================================
print("\n[Step 1/6] Loading Breast Cancer dataset from scikit-learn...")
data = load_breast_cancer()
X = data.data
y = data.target  # sklearn: 0=Malignant, 1=Benign
feature_names = data.feature_names

# Flip labels: 1=Malignant (Danger), 0=Benign (Safe) for FPGA clarity
y = 1 - y

print(f"  Total samples   : {len(y)}")
print(f"  Features/sample  : {X.shape[1]}")
print(f"  Malignant (1)    : {np.sum(y == 1)}")
print(f"  Benign    (0)    : {np.sum(y == 0)}")

# ================================================================
# 2. Scale features to [0.0, 1.0] for stable training
# ================================================================
print("\n[Step 2/6] Scaling features to [0.0, 1.0]...")
scaler = MinMaxScaler(feature_range=(0.0, 1.0))
X_scaled = scaler.fit_transform(X)

# Split data
X_train, X_test, y_train, y_test = train_test_split(
    X_scaled, y, test_size=0.2, random_state=42
)
print(f"  Training set     : {len(y_train)} samples")
print(f"  Test set         : {len(y_test)} samples")

# ================================================================
# 3. Train SVM
# ================================================================
print("\n[Step 3/6] Training Linear SVM...")
svm = LinearSVC(random_state=42, max_iter=10000, dual=False)
svm.fit(X_train, y_train)

# ================================================================
# 4. Full Evaluation Metrics
# ================================================================
print("\n[Step 4/6] Evaluating Model Performance...")
y_pred = svm.predict(X_test)

acc        = accuracy_score(y_test, y_pred)
precision  = precision_score(y_test, y_pred)
recall     = recall_score(y_test, y_pred)
f1         = f1_score(y_test, y_pred)
cm         = confusion_matrix(y_test, y_pred)

print("\n" + "="*60)
print("  MODEL EVALUATION METRICS (Software - Float32)")
print("="*60)
print(f"  Accuracy      : {acc * 100:.2f}%")
print(f"  Precision     : {precision * 100:.2f}%")
print(f"  Recall        : {recall * 100:.2f}%")
print(f"  F1-Score      : {f1 * 100:.2f}%")
print("-"*60)
print("  Confusion Matrix:")
print(f"                    Predicted Benign   Predicted Malignant")
print(f"  Actual Benign   :       {cm[0][0]}                {cm[0][1]}")
print(f"  Actual Malignant:       {cm[1][0]}                {cm[1][1]}")
print("-"*60)
print("\n  Full Classification Report:")
print(classification_report(y_test, y_pred, target_names=["Benign (0)", "Malignant (1)"]))

# Save confusion matrix as an image
fig, ax = plt.subplots(figsize=(6, 5))
sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
            xticklabels=["Benign (0)", "Malignant (1)"],
            yticklabels=["Benign (0)", "Malignant (1)"],
            ax=ax, annot_kws={"size": 16})
ax.set_xlabel("Predicted Label", fontsize=12)
ax.set_ylabel("True Label", fontsize=12)
ax.set_title("SVM Confusion Matrix (Breast Cancer)", fontsize=14)
plt.tight_layout()
cm_path = os.path.join(results_dir, "confusion_matrix.png")
plt.savefig(cm_path, dpi=150)
print(f"  Confusion matrix image saved to: {cm_path}")

# ================================================================
# 5. Quantize Weights for FPGA
# ================================================================
print("\n[Step 5/6] Quantizing weights for Hardware Accelerator...")
weights = svm.coef_[0]
bias = svm.intercept_[0]

# Math trick: FPGA receives features as 0-255, but we trained on 0.0-1.0
# W*(x/255) + b = 0  --->  W*x + (b*255) = 0
fpga_bias = bias * 255.0

# Scale weights to fit in 16-bit signed integers (-32768 to 32767)
max_w = max(np.max(np.abs(weights)), abs(fpga_bias)/30)
scale_factor = 16000.0 / max_w

w_int = np.round(weights * scale_factor).astype(int)
b_int = np.round(fpga_bias * scale_factor).astype(int)

# Verify Quantized Accuracy (Simulating FPGA Math in Python)
def hardware_simulation(x_original):
    x_fpga = np.round(scaler.transform(x_original) * 255.0).astype(int)
    dot_product = np.sum(x_fpga * w_int, axis=1) + b_int
    return (dot_product > 0).astype(int)

X_test_original = scaler.inverse_transform(X_test)
fpga_pred = hardware_simulation(X_test_original)
fpga_acc = accuracy_score(y_test, fpga_pred)

print(f"  Software (Float32) Accuracy  : {acc * 100:.2f}%")
print(f"  Hardware (Int16 Quantized)   : {fpga_acc * 100:.2f}%")

if fpga_acc == acc:
    print("  >> Quantization caused ZERO accuracy loss!")
else:
    print(f"  >> Quantization loss: {(acc - fpga_acc)*100:.2f}%")

# Print extracted weights
print("\n  Extracted Weights (Quantized to Int16):")
print("  " + "-"*40)
for i, (name, w_f, w_i) in enumerate(zip(feature_names, weights, w_int)):
    print(f"  W[{i:02d}] {name:30s} : {w_f:+8.4f} -> {w_i:+6d}")
print(f"  Bias                                 : {bias:+8.4f} -> {b_int:+6d}")

# ================================================================
# 6. Export All Files
# ================================================================
print("\n[Step 6/6] Exporting files...")

# Save model (.pkl) and scaler
model_path = os.path.join(local_dir, "svm_model.pkl")
scaler_path = os.path.join(local_dir, "scaler.pkl")
joblib.dump(svm, model_path)
joblib.dump(scaler, scaler_path)
print(f"  Model saved to  : {model_path}")
print(f"  Scaler saved to : {scaler_path}")

# Export 5 sample patient CSVs
print("\n  Exporting 5 sample patient records for local testing...")
patients_df = pd.DataFrame(X_test, columns=feature_names)
patients_df['True_Diagnosis'] = ["Malignant" if label == 1 else "Benign" for label in y_test]

for i in range(5):
    patient_file = os.path.join(local_dir, f"patient_record_{i+1}.csv")
    patients_df.iloc[[i]].to_csv(patient_file, index=False)
    print(f"    -> {patient_file}")

# Export weights to Verilog header file
vh_path = os.path.join(fpga_dir, "svm_weights.vh")
with open(vh_path, "w") as f:
    f.write("// ==========================================\n")
    f.write("// Auto-generated SVM Weights for FPGA\n")
    f.write(f"// Software Accuracy : {acc*100:.2f}%\n")
    f.write(f"// Hardware Accuracy : {fpga_acc*100:.2f}%\n")
    f.write(f"// Scale Factor      : {scale_factor:.4f}\n")
    f.write("// ==========================================\n\n")
    
    # 32-bit signed bias
    if b_int < 0:
        f.write(f"`define SVM_BIAS -32'sd{abs(b_int)}\n\n")
    else:
        f.write(f"`define SVM_BIAS 32'sd{b_int}\n\n")
    
    # 30 x 16-bit signed weights
    for i, w in enumerate(w_int):
        if w < 0:
            f.write(f"`define SVM_WEIGHT_{i:02d} -16'sd{abs(w)}\n")
        else:
            f.write(f"`define SVM_WEIGHT_{i:02d} 16'sd{w}\n")

print(f"  Verilog weights  : {vh_path}")

print("\n" + "="*60)
print("  TRAINING COMPLETE!")
print("="*60)
print(f"  Model format     : .pkl (Scikit-learn Pickle)")
print(f"  Weight format    : .vh  (Verilog Header)")
print(f"  Final Accuracy   : {acc*100:.2f}%")
print("="*60)
