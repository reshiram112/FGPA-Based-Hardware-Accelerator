"""
Extract trained model weights → Verilog localparams (.vh files)
Encoding:
  - Float weights     : Q8.8 fixed-point  (16-bit hex)
  - Binarized weights : 1-bit (1 = +1, 0 = -1)  → packed into 32-bit words
  - BatchNorm params  : Q8.8 fixed-point
  - SVM weights       : Q8.8 fixed-point (scaler folded in)

Run from repo root:
    python weight_extraction/extract_weights_all.py
"""
import os
import sys
import torch
import joblib
import numpy as np

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, 'model_training'))

from train_cnn          import SimpleCNN
from train_audio_mlp    import AudioMLP
try:
    from train_bnn_router   import BNNRouter
except ImportError:
    BNNRouter = None
from train_bnn_pothole  import BNNPotholeDetector

MODEL_DIR   = os.path.join(ROOT, 'model_outputs')
HEADERS_DIR = os.path.join(ROOT, 'weight_extraction', 'verilog_headers')


# ── Encoding helpers ──────────────────────────────────────────────────────────

def float_to_q8_8(val, total_bits=16, frac_bits=8):
    """Q8.8 fixed-point. Returns 4-char hex string."""
    scaled = int(round(val * (2 ** frac_bits)))
    scaled = max(-(1 << (total_bits-1)), min((1 << (total_bits-1))-1, scaled))
    if scaled < 0:
        scaled = (1 << total_bits) + scaled
    return f"{scaled:04X}"


def pack_binary_row(row_vals):
    """
    Pack a row of ±1 weights into 32-bit hex words.
    +1 → bit 1,  -1 → bit 0.
    Returns list of 8-char hex strings.
    """
    bits = [(1 if v >= 0 else 0) for v in row_vals]
    # Pad to multiple of 32
    while len(bits) % 32 != 0:
        bits.append(0)
    words = []
    for i in range(0, len(bits), 32):
        word = 0
        for j, b in enumerate(bits[i:i+32]):
            word |= (b << j)
        words.append(f"{word:08X}")
    return words


# ── Exporters ─────────────────────────────────────────────────────────────────

def export_float_params(model, filepath, prefix):
    """Export all parameters as Q8.8 localparams (for CNN / AudioMLP)."""
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    with open(filepath, 'w') as f:
        f.write(f"// Auto-generated: {prefix}  (Q8.8 fixed-point)\n\n")
        for name, param in model.named_parameters():
            flat = param.detach().cpu().numpy().flatten()
            nc   = name.replace('.', '_')
            f.write(f"// {nc}: shape={list(param.shape)}, count={len(flat)}\n")
            for i, v in enumerate(flat):
                f.write(f"localparam {prefix}_{nc}_{i} = 16'h{float_to_q8_8(v)};\n")
            f.write("\n")
    print(f"  [{prefix}] Exported {sum(p.numel() for p in model.parameters())} "
          f"values (Q8.8) → {filepath}")


def export_batchnorm_params(model, filepath, prefix):
    """Export BatchNorm gamma/beta/mean/var as Q8.8 (needed for fused BN in Verilog)."""
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    with open(filepath, 'w') as f:
        f.write(f"// Auto-generated BatchNorm params: {prefix}  (Q8.8)\n\n")
        for name, buf in model.named_buffers():
            flat = buf.detach().cpu().numpy().flatten()
            nc   = name.replace('.', '_')
            f.write(f"// {nc}: shape={list(buf.shape)}\n")
            for i, v in enumerate(flat):
                f.write(f"localparam {prefix}_BN_{nc}_{i} = 16'h{float_to_q8_8(v)};\n")
            f.write("\n")
        for name, param in model.named_parameters():
            if 'weight' in name or 'bias' in name:
                # only BN weight/bias (gamma/beta)
                if any(bn_key in name for bn_key in ['bn', 'batch_norm', 'input_bn']):
                    flat = param.detach().cpu().numpy().flatten()
                    nc   = name.replace('.', '_')
                    f.write(f"// {nc}: shape={list(param.shape)}\n")
                    for i, v in enumerate(flat):
                        f.write(f"localparam {prefix}_BN_{nc}_{i} = 16'h{float_to_q8_8(v)};\n")
                    f.write("\n")
    print(f"  [{prefix}] BatchNorm params exported → {filepath}")


def export_bnn_binary_weights(model, filepath, prefix):
    """
    Export BinarizedLinear weights as packed 32-bit binary words.
    Also exports float params (conv, BN) as Q8.8.
    This is the key file for XNOR-based Verilog inference.
    """
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    with open(filepath, 'w') as f:
        f.write(f"// Auto-generated BNN weights: {prefix}\n")
        f.write("// BinarizedLinear: packed 32-bit words (1=+1, 0=-1, LSB-first)\n")
        f.write("// Float layers (conv/BN): Q8.8 fixed-point\n\n")

        for name, param in model.named_parameters():
            flat = param.detach().cpu().numpy()
            nc   = name.replace('.', '_')

            # Detect BinarizedLinear weight by parent module type
            is_binary = False
            parts = name.split('.')
            obj = model
            for part in parts[:-1]:
                obj = getattr(obj, part, None)
                if obj is None:
                    break
            from train_bnn_pothole  import BinarizedLinear as BL_pothole
            try:
                from train_bnn_router   import BinarizedLinear as BL_router
            except ImportError:
                class BL_router: pass
            if isinstance(obj, (BL_pothole, BL_router)) and parts[-1] == 'weight':
                is_binary = True

            if is_binary:
                f.write(f"// BINARY WEIGHTS — {nc}: shape={list(param.shape)}\n")
                f.write(f"// {flat.shape[0]} output neurons, "
                        f"{flat.shape[1]} inputs each\n")
                for row_idx, row in enumerate(flat):
                    words = pack_binary_row(row)
                    for word_idx, word in enumerate(words):
                        f.write(f"localparam {prefix}_{nc}_r{row_idx}_w{word_idx}"
                                f" = 32'h{word};\n")
                f.write("\n")
            else:
                f_flat = flat.flatten()
                f.write(f"// FLOAT — {nc}: shape={list(param.shape)}, "
                        f"Q8.8 fixed-point\n")
                for i, v in enumerate(f_flat):
                    f.write(f"localparam {prefix}_{nc}_{i} = 16'h{float_to_q8_8(v)};\n")
                f.write("\n")

        # BatchNorm buffers
        for name, buf in model.named_buffers():
            flat = buf.detach().cpu().numpy().flatten()
            nc   = name.replace('.', '_')
            f.write(f"// BN buffer — {nc}: shape={list(buf.shape)}\n")
            for i, v in enumerate(flat):
                f.write(f"localparam {prefix}_{nc}_{i} = 16'h{float_to_q8_8(v)};\n")
            f.write("\n")

    total = sum(p.numel() for p in model.parameters())
    print(f"  [{prefix}] Exported {total} values "
          f"(binary FC packed + Q8.8 conv/BN) → {filepath}")


def export_svm_weights(clf, scaler, filepath):
    """
    Export Linear SVM for FPGA inference.
    Scaler is folded into the coefficients:
    raw_w = w / scaler.scale_
    raw_b = b - sum(w * scaler.mean_ / scaler.scale_)
    Decision: sum(raw_w_i * x_raw_i) + raw_b > 0
    """
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    
    # Original weights
    w = clf.coef_[0]
    b = float(clf.intercept_[0])
    
    # Fold the StandardScaler into the weights
    raw_w = w / scaler.scale_
    raw_b = b - np.sum((w * scaler.mean_) / scaler.scale_)
    
    n_feat = len(raw_w)

    with open(filepath, 'w') as f:
        f.write("// Auto-generated Linear SVM weights (scaler folded in, Q8.8)\n")
        f.write(f"// {n_feat} features\n")
        f.write("// Decision: sum(w_i * x_i) + bias > 0\n\n")
        f.write(f"localparam SVM_N_FEAT  = {n_feat};\n")
        f.write(f"localparam SVM_BIAS    = 16'h{float_to_q8_8(raw_b)};\n\n")
        f.write("// Weights\n")
        for i, weight in enumerate(raw_w):
            f.write(f"localparam SVM_W_{i} = 16'h{float_to_q8_8(weight)};\n")
            
    print(f"  [SVM] Exported {n_feat} linear weights + bias → {filepath}")


# ── Main ──────────────────────────────────────────────────────────────────────

def main():
    os.makedirs(HEADERS_DIR, exist_ok=True)
    print(f"Output: {HEADERS_DIR}\n")

    # 1. CNN
    path = os.path.join(MODEL_DIR, 'cnn_weights.pth')
    if os.path.exists(path):
        print("Extracting CNN...")
        m = SimpleCNN(num_classes=43)
        m.load_state_dict(torch.load(path, weights_only=True))
        export_float_params(m, os.path.join(HEADERS_DIR, 'cnn_weights.vh'), 'CNN')
    else:
        print(f"SKIP CNN – {path}")

    # 2. Audio MLP
    path = os.path.join(MODEL_DIR, 'audio_mlp_weights.pth')
    if os.path.exists(path):
        print("Extracting Audio MLP...")
        m = AudioMLP(input_size=160, hidden_size=256, num_classes=2)
        m.load_state_dict(torch.load(path, weights_only=True))
        export_float_params(m, os.path.join(HEADERS_DIR, 'audio_mlp_weights.vh'), 'AUDIO_MLP')
    else:
        print(f"SKIP Audio MLP – {path}")

    # 3. BNN Router (legacy synthetic)
    path = os.path.join(MODEL_DIR, 'bnn_router_weights.pth')
    if os.path.exists(path) and BNNRouter is not None:
        print("Extracting BNN Router (legacy)...")
        m = BNNRouter(input_size=5, hidden_size=32, num_classes=3)
        m.load_state_dict(torch.load(path, weights_only=True))
        export_bnn_binary_weights(m,
            os.path.join(HEADERS_DIR, 'bnn_router_weights.vh'), 'BNN_ROUTER')
    else:
        print(f"SKIP BNN Router – {path} (or missing module)")

    # 4. BNN Pothole (real dataset)
    path = os.path.join(MODEL_DIR, 'bnn_pothole_weights.pth')
    if os.path.exists(path):
        print("Extracting BNN Pothole...")
        m = BNNPotholeDetector()
        m.load_state_dict(torch.load(path, weights_only=True))
        export_bnn_binary_weights(m,
            os.path.join(HEADERS_DIR, 'bnn_pothole_weights.vh'), 'BNN_POTHOLE')
        export_batchnorm_params(m,
            os.path.join(HEADERS_DIR, 'bnn_pothole_bn_params.vh'), 'BNN_POTHOLE')
    else:
        print(f"SKIP BNN Pothole – {path}")

    # 5. SVM
    svm_path = os.path.join(MODEL_DIR, 'svm_model.pkl')
    scl_path = os.path.join(MODEL_DIR, 'svm_scaler.pkl')
    if os.path.exists(svm_path) and os.path.exists(scl_path):
        print("Extracting SVM...")
        export_svm_weights(joblib.load(svm_path), joblib.load(scl_path),
                           os.path.join(HEADERS_DIR, 'svm_weights.vh'))
    else:
        print(f"SKIP SVM – {svm_path}")

    print("\nWeight extraction complete.")
    print(f"Generated .vh files in: {HEADERS_DIR}")


if __name__ == '__main__':
    main()
