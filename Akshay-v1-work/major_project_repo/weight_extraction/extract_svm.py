import os
import joblib
import numpy as np

def float_to_q8_8(val):
    v = int(round(val * 256.0))
    if v < -32768: v = -32768
    if v > 32767:  v = 32767
    return f"{(v & 0xFFFF):04X}"

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MODEL_DIR = os.path.join(ROOT, 'model_outputs')
HEADERS_DIR = os.path.join(ROOT, 'weight_extraction', 'verilog_headers')

def export_svm_weights(clf, scaler, filepath):
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    w = clf.coef_[0]
    b = float(clf.intercept_[0])
    raw_w = w / scaler.scale_
    raw_b = b - np.sum((w * scaler.mean_) / scaler.scale_)
    n_feat = len(raw_w)
    with open(filepath, 'w') as f:
        f.write("// Auto-generated Linear SVM weights (scaler folded in, Q8.8)\n")
        f.write(f"// {n_feat} features\n")
        f.write(f"localparam SVM_N_FEAT  = {n_feat};\n")
        f.write(f"localparam SVM_BIAS    = 16'h{float_to_q8_8(raw_b)};\n\n")
        for i, weight in enumerate(raw_w):
            f.write(f"localparam SVM_W_{i} = 16'h{float_to_q8_8(weight)};\n")
    print(f"Exported {n_feat} linear weights + bias to {filepath}")

if __name__ == '__main__':
    svm_path = os.path.join(MODEL_DIR, 'svm_model.pkl')
    scl_path = os.path.join(MODEL_DIR, 'svm_scaler.pkl')
    export_svm_weights(joblib.load(svm_path), joblib.load(scl_path), os.path.join(HEADERS_DIR, 'svm_weights.vh'))
