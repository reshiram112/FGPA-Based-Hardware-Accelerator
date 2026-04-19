"""Export quantised FPGA weights from saved mnist_mlp_best.pth"""
import os
import numpy as np
import torch
import torch.nn as nn

class MLP(nn.Module):
    def __init__(self):
        super().__init__()
        self.net = nn.Sequential(
            nn.Linear(784, 512), nn.BatchNorm1d(512), nn.ReLU(), nn.Dropout(0.3),
            nn.Linear(512, 256), nn.BatchNorm1d(256), nn.ReLU(), nn.Dropout(0.3),
            nn.Linear(256, 128), nn.BatchNorm1d(128), nn.ReLU(), nn.Dropout(0.3),
            nn.Linear(128, 10),
        )
    def forward(self, x):
        return self.net(x.view(x.size(0), -1))

print("Loading mnist_mlp_best.pth ...")
ckpt  = torch.load("mnist_mlp_best.pth", map_location="cpu")
model = MLP()
model.load_state_dict(ckpt["model_state_dict"])
model.eval()
print(f"Loaded — saved test acc: {ckpt['test_accuracy']*100:.2f}%")

# Extract weights (CPU)
linear_layers = [m for m in model.net if isinstance(m, nn.Linear)]
bn_layers     = [m for m in model.net if isinstance(m, nn.BatchNorm1d)]

layers_w, layers_b = [], []
for lin in linear_layers:
    layers_w.append(lin.weight.detach().cpu().numpy())
    layers_b.append(lin.bias.detach().cpu().numpy())

# Fold BatchNorm into preceding Linear
for k, bn in enumerate(bn_layers):
    g   = bn.weight.detach().cpu().numpy()
    b   = bn.bias.detach().cpu().numpy()
    mu  = bn.running_mean.detach().cpu().numpy()
    var = bn.running_var.detach().cpu().numpy()
    sc  = g / np.sqrt(var + bn.eps)
    layers_w[k] = sc[:, None] * layers_w[k]
    layers_b[k] = sc * (layers_b[k] - mu) + b
    print(f"  BN folded into layer {k+1}")

# Quantise to ap_fixed<16,6>: scale = 2^10 = 1024
SCALE = 1024
def quantise(arr):
    return np.clip(np.round(arr * SCALE), -32768, 32767).astype(np.int16)

qw = [quantise(w) for w in layers_w]
qb = [quantise(b) for b in layers_b]

# Save .npy files
os.makedirs("fpga/fpga_weights", exist_ok=True)
for k in range(4):
    np.save(f"fpga/fpga_weights/w{k+1}.npy", qw[k])
    np.save(f"fpga/fpga_weights/b{k+1}.npy", qb[k])
    print(f"  Layer {k+1}: W{qw[k].shape}  B{qb[k].shape}")

# Generate C header for HLS
lines = [
    "/* Auto-generated — do not edit */",
    "/* ap_fixed<16,6> quantised weights, scale=1024 */",
    "#ifndef MLP_WEIGHTS_H", "#define MLP_WEIGHTS_H", "",
    "#define SCALE 1024",
    "#define L0 784", "#define L1 512", "#define L2 256",
    "#define L3 128", "#define L4 10", "",
]
for k in range(4):
    flat_w = qw[k].flatten().tolist()
    flat_b = qb[k].flatten().tolist()
    lines += [
        f"static const short W{k+1}[{len(flat_w)}] = {{",
        ",".join(map(str, flat_w)), "};",
        f"static const short B{k+1}[{len(flat_b)}] = {{",
        ",".join(map(str, flat_b)), "}; ", "",
    ]
lines.append("#endif")

with open("fpga/hls/mlp_weights.h", "w") as f:
    f.write("\n".join(lines))

print("\nSaved:")
print("  fpga/fpga_weights/w1..b4.npy")
print("  fpga/hls/mlp_weights.h")
print("Ready for Vitis HLS.")
