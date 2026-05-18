"""
Phase 1 — Weight Export for FPGA
Run this on Google Colab AFTER the MLP training completes.
It quantises the trained weights to ap_fixed<16,6> (int16, scale=1024)
and saves them as .npy files + a C header for HLS simulation.
"""

import numpy as np
import torch
import torch.nn as nn
from collections import defaultdict

# ── 1. Re-define the model class (same as training) ──────────────────────────
class MLP(nn.Module):
    def __init__(self, input_dim, hidden_dims, output_dim, dropout):
        super().__init__()
        layers, prev = [], input_dim
        for h in hidden_dims:
            layers += [nn.Linear(prev, h), nn.BatchNorm1d(h),
                       nn.ReLU(inplace=True), nn.Dropout(p=dropout)]
            prev = h
        layers.append(nn.Linear(prev, output_dim))
        self.net = nn.Sequential(*layers)
    def forward(self, x):
        return self.net(x.view(x.size(0), -1))

# ── 2. Load checkpoint ────────────────────────────────────────────────────────
CKPT = "mnist_mlp_best.pth"
ckpt  = torch.load(CKPT, map_location="cpu")
cfg   = ckpt["config"]

model = MLP(784, cfg["hidden_dims"], 10, cfg["dropout"])
model.load_state_dict(ckpt["model_state_dict"])
model.eval()
print(f"Loaded checkpoint — saved test acc: {ckpt['test_accuracy']*100:.2f}%")

# ── 3. Extract Linear layer weights & biases ──────────────────────────────────
# net indices for Linear layers (after BN/ReLU/Dropout interleaving):
# hidden_dims = [512, 256, 128]  → 4 Linear layers at indices 0,4,8,12
linear_indices = [i for i, m in enumerate(model.net) if isinstance(m, nn.Linear)]
print(f"Linear layer indices in net: {linear_indices}")

layers_w, layers_b = [], []
for idx in linear_indices:
    w = model.net[idx].weight.detach().numpy()   # shape (out, in)
    b = model.net[idx].bias.detach().numpy()     # shape (out,)
    layers_w.append(w)
    layers_b.append(b)
    print(f"  Layer {len(layers_w)}: W{w.shape}  b{b.shape}  "
          f"wRange=[{w.min():.3f},{w.max():.3f}]")

# ── 4. Also fold BatchNorm into preceding Linear ──────────────────────────────
# BN: y = gamma*(x-mu)/sqrt(var+eps) + beta
# Folded: W_eff = gamma/sqrt(var+eps) * W,  b_eff = gamma*(b-mu)/sqrt(var+eps)+beta
bn_indices = [i for i, m in enumerate(model.net) if isinstance(m, nn.BatchNorm1d)]
print(f"\nFolding BatchNorm at net indices: {bn_indices}")

for k, (bn_idx, lin_idx) in enumerate(zip(bn_indices, linear_indices)):
    bn    = model.net[bn_idx]
    gamma = bn.weight.detach().numpy()
    beta  = bn.bias.detach().numpy()
    mu    = bn.running_mean.detach().numpy()
    var   = bn.running_var.detach().numpy()
    eps   = bn.eps
    scale = gamma / np.sqrt(var + eps)           # (out,)
    layers_w[k] = scale[:, None] * layers_w[k]  # broadcast over input dim
    layers_b[k] = scale * (layers_b[k] - mu) + beta
    print(f"  BN-folded layer {k+1}")

# ── 5. Quantise to ap_fixed<16,6>: scale = 2^10 = 1024 ──────────────────────
SCALE    = 1024          # 2^10 — maps float range [-32,32) to int16
INT_BITS = 6             # integer bits in ap_fixed<16,6>
FRAC_BITS= 10            # fractional bits
INT16_MAX= 32767
INT16_MIN= -32768

def quantise(arr):
    scaled  = np.round(arr * SCALE).astype(np.int32)
    clipped = np.clip(scaled, INT16_MIN, INT16_MAX).astype(np.int16)
    return clipped

qw, qb = [], []
for k in range(len(layers_w)):
    qw.append(quantise(layers_w[k]))
    qb.append(quantise(layers_b[k]))
    sat_w = np.sum(np.abs(layers_w[k]) > (2**INT_BITS - 1/SCALE))
    sat_b = np.sum(np.abs(layers_b[k]) > (2**INT_BITS - 1/SCALE))
    print(f"Layer {k+1}: weight saturation={sat_w}, bias saturation={sat_b}")

# ── 6. Quick software accuracy check with quantised weights ──────────────────
import torchvision, torchvision.transforms as T
from torch.utils.data import DataLoader

transform = T.Compose([T.ToTensor(), T.Normalize((0.1307,),(0.3081,))])
test_ds   = torchvision.datasets.MNIST("./data", train=False,
                                        download=True, transform=transform)
test_ldr  = DataLoader(test_ds, batch_size=512, shuffle=False)

def quant_forward(x_np):
    """Forward pass using quantised integer weights (simulates fixed-point HW)."""
    act = (x_np * SCALE).round().astype(np.int32)    # quantise input
    for k in range(len(qw)):
        act = qw[k].astype(np.int32) @ act + qb[k].astype(np.int32)
        if k < len(qw) - 1:                           # ReLU (not on final layer)
            act = np.maximum(act, 0)
    return act

correct, total = 0, 0
for imgs, labels in test_ldr:
    x = imgs.numpy().reshape(-1, 784)
    for i in range(len(x)):
        logits = quant_forward(x[i])
        correct += int(logits.argmax() == labels[i].item())
    total += len(x)

quant_acc = correct / total
print(f"\nQuantised model accuracy: {quant_acc*100:.2f}%")
if quant_acc >= 0.96:
    print("PASS — accuracy retained after quantisation")
else:
    print("WARN — accuracy dropped, consider higher precision")

# ── 7. Save .npy files ────────────────────────────────────────────────────────
import os; os.makedirs("fpga_weights", exist_ok=True)

for k in range(len(qw)):
    np.save(f"fpga_weights/w{k+1}.npy", qw[k])
    np.save(f"fpga_weights/b{k+1}.npy", qb[k])
    print(f"Saved fpga_weights/w{k+1}.npy {qw[k].shape}  "
          f"fpga_weights/b{k+1}.npy {qb[k].shape}")

# ── 8. Generate C header for HLS simulation ───────────────────────────────────
def array_to_c(name, arr, dtype="short"):
    flat = arr.flatten()
    rows = [f"    {v}," for v in flat]
    return (f"static const {dtype} {name}[{len(flat)}] = {{\n"
            + "\n".join(rows) + "\n};\n")

header_lines = [
    "/* Auto-generated weight header for HLS simulation */",
    "/* Precision: ap_fixed<16,6>, scale=1024            */",
    "#ifndef MLP_WEIGHTS_H", "#define MLP_WEIGHTS_H", "",
    f"#define SCALE {SCALE}",
    f"#define L0 784\n#define L1 512\n#define L2 256\n#define L3 128\n#define L4 10",
    "",
]
for k in range(len(qw)):
    header_lines.append(array_to_c(f"W{k+1}", qw[k]))
    header_lines.append(array_to_c(f"B{k+1}", qb[k]))

header_lines += ["#endif /* MLP_WEIGHTS_H */", ""]

with open("fpga_weights/mlp_weights.h", "w") as f:
    f.write("\n".join(header_lines))
print("Saved fpga_weights/mlp_weights.h")

# ── 9. Zip for download ───────────────────────────────────────────────────────
import shutil
shutil.make_archive("fpga_weights", "zip", "fpga_weights")
print("\nDownload fpga_weights.zip and place in fpga/hls/ of your repo.")

try:
    from google.colab import files
    files.download("fpga_weights.zip")
except Exception:
    print("Not on Colab — find fpga_weights.zip in the current directory.")
