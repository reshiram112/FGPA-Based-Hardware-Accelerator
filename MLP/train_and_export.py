"""
Minimal local training script — Windows compatible (num_workers=0).
Trains the MLP, saves mnist_mlp_best.pth, then exports quantised weights.
"""
import os, time, random, warnings
import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import DataLoader, random_split
import torchvision
import torchvision.transforms as transforms
from collections import defaultdict

warnings.filterwarnings("ignore")

# ── Reproducibility ───────────────────────────────────────────
SEED = 42
random.seed(SEED); np.random.seed(SEED)
torch.manual_seed(SEED); torch.cuda.manual_seed_all(SEED)

DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(f"Device: {DEVICE}")
if DEVICE.type == "cuda":
    print(f"GPU: {torch.cuda.get_device_name(0)}")

# ── Model ─────────────────────────────────────────────────────
class MLP(nn.Module):
    def __init__(self):
        super().__init__()
        self.net = nn.Sequential(
            nn.Linear(784, 512), nn.BatchNorm1d(512), nn.ReLU(), nn.Dropout(0.3),
            nn.Linear(512, 256), nn.BatchNorm1d(256), nn.ReLU(), nn.Dropout(0.3),
            nn.Linear(256, 128), nn.BatchNorm1d(128), nn.ReLU(), nn.Dropout(0.3),
            nn.Linear(128, 10),
        )
        for m in self.modules():
            if isinstance(m, nn.Linear):
                nn.init.kaiming_normal_(m.weight, nonlinearity="relu")
                nn.init.zeros_(m.bias)

    def forward(self, x):
        return self.net(x.view(x.size(0), -1))

# ── Data ──────────────────────────────────────────────────────
transform = transforms.Compose([
    transforms.ToTensor(),
    transforms.Normalize((0.1307,), (0.3081,))
])
train_full = torchvision.datasets.MNIST("./data", train=True,  download=True, transform=transform)
test_ds    = torchvision.datasets.MNIST("./data", train=False, download=True, transform=transform)

val_size   = 6000
train_size = len(train_full) - val_size
train_ds, val_ds = random_split(train_full, [train_size, val_size],
                                 generator=torch.Generator().manual_seed(SEED))

# num_workers=0 avoids Windows multiprocessing spawn issues
train_loader = DataLoader(train_ds, batch_size=128, shuffle=True,  num_workers=0)
val_loader   = DataLoader(val_ds,   batch_size=256, shuffle=False, num_workers=0)
test_loader  = DataLoader(test_ds,  batch_size=256, shuffle=False, num_workers=0)
print(f"Train: {train_size}  Val: {val_size}  Test: {len(test_ds)}")

# ── Training ──────────────────────────────────────────────────
def run_epoch(model, loader, criterion, optimizer=None):
    model.train() if optimizer else model.eval()
    loss_sum = correct = total = 0
    with torch.set_grad_enabled(optimizer is not None):
        for imgs, labels in loader:
            imgs, labels = imgs.to(DEVICE), labels.to(DEVICE)
            out  = model(imgs)
            loss = criterion(out, labels)
            if optimizer:
                optimizer.zero_grad(); loss.backward(); optimizer.step()
            loss_sum += loss.item() * labels.size(0)
            correct  += out.argmax(1).eq(labels).sum().item()
            total    += labels.size(0)
    return loss_sum / total, correct / total

model     = MLP().to(DEVICE)
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=1e-3, weight_decay=1e-4)
scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, mode="max", factor=0.5, patience=3)

best_val, best_state, no_improve = 0.0, None, 0
print(f"\n{'Epoch':>5} {'TrLoss':>8} {'TrAcc':>7} {'VaLoss':>8} {'VaAcc':>7}")
print("-" * 45)

t0 = time.time()
for epoch in range(1, 21):
    tl, ta = run_epoch(model, train_loader, criterion, optimizer)
    vl, va = run_epoch(model, val_loader,   criterion)
    scheduler.step(va)
    print(f"{epoch:>5} {tl:>8.4f} {ta*100:>6.2f}% {vl:>8.4f} {va*100:>6.2f}%")
    if va > best_val:
        best_val   = va
        best_state = {k: v.clone() for k, v in model.state_dict().items()}
        no_improve = 0
    else:
        no_improve += 1
        if no_improve >= 5:
            print(f"Early stop at epoch {epoch}"); break

model.load_state_dict(best_state)
print(f"\nTraining done in {time.time()-t0:.1f}s | Best val: {best_val*100:.2f}%")

# ── Test accuracy ─────────────────────────────────────────────
model.eval()
correct = total = 0
with torch.no_grad():
    for imgs, labels in test_loader:
        imgs, labels = imgs.to(DEVICE), labels.to(DEVICE)
        correct += model(imgs).argmax(1).eq(labels).sum().item()
        total   += labels.size(0)
test_acc = correct / total
print(f"TEST ACCURACY: {test_acc*100:.2f}%")
if test_acc >= 0.95:
    print("SUCCESS - target >= 95% achieved!")
elif test_acc >= 0.80:
    print("SUCCESS - minimum >= 80% achieved.")
else:
    print("WARNING: accuracy below 80%")

# ── Save checkpoint ───────────────────────────────────────────
torch.save({
    "model_state_dict": model.state_dict(),
    "test_accuracy"   : test_acc,
    "config"          : {"hidden_dims": [512, 256, 128], "dropout": 0.3},
}, "mnist_mlp_best.pth")
print("Saved: mnist_mlp_best.pth")

# ── Export quantised weights for FPGA ─────────────────────────
print("\nExporting quantised weights for FPGA...")

# BN folding + weight extraction
linear_layers = [m for m in model.net if isinstance(m, nn.Linear)]
bn_layers     = [m for m in model.net if isinstance(m, nn.BatchNorm1d)]

layers_w, layers_b = [], []
for lin in linear_layers:
    layers_w.append(lin.weight.detach().cpu().numpy())
    layers_b.append(lin.bias.detach().cpu().numpy())

for k, bn in enumerate(bn_layers):
    g   = bn.weight.detach().cpu().numpy()
    b   = bn.bias.detach().cpu().numpy()
    mu  = bn.running_mean.detach().cpu().numpy()
    var = bn.running_var.detach().cpu().numpy()
    sc  = g / np.sqrt(var + bn.eps)
    layers_w[k] = sc[:, None] * layers_w[k]
    layers_b[k] = sc * (layers_b[k] - mu) + b

SCALE = 1024
def quantise(arr):
    return np.clip(np.round(arr * SCALE), -32768, 32767).astype(np.int16)

qw = [quantise(w) for w in layers_w]
qb = [quantise(b) for b in layers_b]

os.makedirs("fpga/fpga_weights", exist_ok=True)
for k in range(4):
    np.save(f"fpga/fpga_weights/w{k+1}.npy", qw[k])
    np.save(f"fpga/fpga_weights/b{k+1}.npy", qb[k])
    print(f"  Layer {k+1}: W{qw[k].shape} B{qb[k].shape}")

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
    lines.append(f"static const short W{k+1}[{len(flat_w)}] = {{")
    lines.append(",".join(map(str, flat_w)))
    lines.append("};")
    lines.append(f"static const short B{k+1}[{len(flat_b)}] = {{")
    lines.append(",".join(map(str, flat_b)))
    lines.append("};")
    lines.append("")
lines.append("#endif")

with open("fpga/hls/mlp_weights.h", "w") as f:
    f.write("\n".join(lines))
print("Saved: fpga/hls/mlp_weights.h")
print("\nAll done. Ready for Vitis HLS.")
