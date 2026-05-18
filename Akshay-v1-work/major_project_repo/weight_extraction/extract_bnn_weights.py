"""
extract_bnn_weights.py
Generate bnn_can_weights.vh for the BNN CAN Vehicle Classifier FPGA accelerator.

Model  : Bayesian MLP  169 -> 16 (ReLU) -> 3
Classes: 0=OpelAstra, 1=Prototype, 2=RenaultClio
Source : best_bnn_model.pt  (mean weights only; rho/uncertainty discarded)
Format : Q8.8 signed int16 (SCALE=256)

Output files:
  ../verilog_headers/bnn_can_weights.vh  -- Verilog header with all weights
  bnn_can_feature_stats.npz              -- feature_mean / feature_std for PYNQ

Usage:
  cd major_project_repo/weight_extraction
  python extract_bnn_weights.py
"""

import torch
import numpy as np
import os
import pathlib

# ---------------------------------------------------------------------------
MODEL_PATH = r"C:\Users\TA17084\Downloads\archive\sounds\ambulance\artifacts_bnn\best_bnn_model.pt"
SCALE      = 256          # Q8.8: float -> int16(round(float * 256))

SCRIPT_DIR = pathlib.Path(__file__).parent
OUT_VH     = SCRIPT_DIR / "verilog_headers" / "bnn_can_weights.vh"
OUT_NPZ    = SCRIPT_DIR / "bnn_can_feature_stats.npz"
# ---------------------------------------------------------------------------

def quantize(arr: np.ndarray, scale: int = SCALE) -> np.ndarray:
    """Quantize float array to int16 Q8.8."""
    return np.clip(np.round(arr * scale), -32768, 32767).astype(np.int16)

def fmt_1d_localparam(name: str, arr: np.ndarray) -> str:
    """SystemVerilog 1D localparam array."""
    n = len(arr)
    vals = ", ".join(f"16'sd{int(v)}" for v in arr)
    return (
        f"localparam logic signed [15:0] {name} [0:{n-1}] = '{{\n"
        f"  {vals}\n"
        f"}};\n"
    )

def fmt_row_localparam(name: str, arr: np.ndarray) -> str:
    """SystemVerilog 1D localparam array for one row."""
    n = len(arr)
    vals = ", ".join(f"16'sd{int(v)}" for v in arr)
    return (
        f"localparam logic signed [15:0] {name} [0:{n-1}] = '{{\n"
        f"  {vals}\n"
        f"}};\n"
    )

# ---------------------------------------------------------------------------
print(f"Loading: {MODEL_PATH}")
ck = torch.load(MODEL_PATH, map_location="cpu", weights_only=False)
sd = ck["model_state_dict"]

W1 = sd["hidden_layers.0.weight_mu"].numpy().astype(np.float32)   # (16, 169)
b1 = sd["hidden_layers.0.bias_mu"].numpy().astype(np.float32)     # (16,)
W2 = sd["output_layer.weight_mu"].numpy().astype(np.float32)      # (3, 16)
b2 = sd["output_layer.bias_mu"].numpy().astype(np.float32)        # (3,)

W1_q = quantize(W1)   # (16, 169) int16
b1_q = quantize(b1)   # (16,)     int16
W2_q = quantize(W2)   # (3, 16)   int16
b2_q = quantize(b2)   # (3,)      int16

print(f"W1 shape={W1_q.shape}  range=[{W1_q.min()}, {W1_q.max()}]")
print(f"b1 shape={b1_q.shape}  range=[{b1_q.min()}, {b1_q.max()}]")
print(f"W2 shape={W2_q.shape}  range=[{W2_q.min()}, {W2_q.max()}]")
print(f"b2 shape={b2_q.shape}  range=[{b2_q.min()}, {b2_q.max()}]")

# ---------------------------------------------------------------------------
# Build Verilog header
# ---------------------------------------------------------------------------
lines = []
lines.append("// ============================================================")
lines.append("// bnn_can_weights.vh  --  AUTO-GENERATED, DO NOT EDIT")
lines.append("// BNN CAN Vehicle Classifier: 169 -> 16 (ReLU) -> 3")
lines.append("// Model: Bayesian MLP, mean weights (weight_mu) only")
lines.append("// Classes: 0=OpelAstra  1=Prototype  2=RenaultClio")
lines.append("// Fixed-point: Q8.8  (SCALE=256, int16)")
lines.append("// ============================================================")
lines.append("")
lines.append(f"localparam integer BNN_N_IN    = 169;")
lines.append(f"localparam integer BNN_L1_SIZE = 16;")
lines.append(f"localparam integer BNN_N_OUT   = 3;")
lines.append(f"localparam integer BNN_SCALE   = {SCALE};")
lines.append("")

# Layer 1 weights: one localparam array per output neuron
lines.append("// ---- Layer 1 weights: BNN_W1_Nn[0:168]  (n = output neuron) ----")
for n in range(16):
    lines.append(fmt_row_localparam(f"BNN_W1_N{n}", W1_q[n]))

# Layer 1 bias
lines.append("// ---- Layer 1 bias: BNN_B1[0:15] ----")
lines.append(fmt_1d_localparam("BNN_B1", b1_q))

# Layer 2 weights: one localparam array per output neuron
lines.append("// ---- Layer 2 weights: BNN_W2_Mm[0:15]  (m = output neuron) ----")
for m in range(3):
    lines.append(fmt_row_localparam(f"BNN_W2_M{m}", W2_q[m]))

# Layer 2 bias
lines.append("// ---- Layer 2 bias: BNN_B2[0:2] ----")
lines.append(fmt_1d_localparam("BNN_B2", b2_q))

OUT_VH.parent.mkdir(parents=True, exist_ok=True)
OUT_VH.write_text("\n".join(lines), encoding="ascii")
print(f"Written: {OUT_VH}  ({OUT_VH.stat().st_size} bytes)")

# ---------------------------------------------------------------------------
# Feature normalisation stats for PYNQ
# ---------------------------------------------------------------------------
feat_mean = ck["feature_mean"]
feat_std  = ck["feature_std"]
if isinstance(feat_mean, torch.Tensor):
    feat_mean = feat_mean.numpy()
    feat_std  = feat_std.numpy()
feat_mean = np.asarray(feat_mean, dtype=np.float32)
feat_std  = np.asarray(feat_std,  dtype=np.float32)

np.savez(str(OUT_NPZ), mean=feat_mean, std=feat_std)
print(f"Written: {OUT_NPZ}")
print(f"  feature_mean shape={feat_mean.shape}  range=[{feat_mean.min():.4f}, {feat_mean.max():.4f}]")
print(f"  feature_std  shape={feat_std.shape}   range=[{feat_std.min():.4f}, {feat_std.max():.4f}]")
print("Done.")
