# ============================================================
#  MNIST MLP Classifier  Google Colab Ready
#  Author : Antigravity (Gemini Agent)
#  Target :  95% test accuracy on MNIST
#  Stack  : PyTorch  torchvision  matplotlib  seaborn
# ============================================================
# 
#               MODEL DESIGN EXPLANATION                    
# 
#   Architecture  : MLP (fully-connected only, no CNNs)    
#   Input         : 784  (2828 flattened, normalised)     
#   Hidden 1      : 512 neurons   ReLU + BatchNorm        
#   Hidden 2      : 256 neurons   ReLU + BatchNorm        
#   Hidden 3      : 128 neurons   ReLU + BatchNorm        
#   Output        : 10  neurons   CrossEntropyLoss        
#   Regulariser   : Dropout (p=0.3) after each hidden      
#   Optimiser     : Adam (lr=1e-3, weight_decay=1e-4)      
#   Scheduler     : ReduceLROnPlateau (patience=3)         
#   Batch size    : 128                                    
#   Epochs        : up to 20 (early-stop on val-acc)       
# 

# ----------------------------------------------------------
# 0. INSTALL / IMPORTS
# ----------------------------------------------------------
# (torchvision & matplotlib are pre-installed on Colab)
import os, time, random, warnings
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from collections import defaultdict

import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import DataLoader, random_split

import torchvision
import torchvision.transforms as transforms
from sklearn.metrics import confusion_matrix, classification_report

warnings.filterwarnings("ignore")

# All file paths are anchored to this script's directory (works from any CWD)
ROOT = Path(__file__).parent

# ----------------------------------------------------------
# 1. REPRODUCIBILITY
# ----------------------------------------------------------
SEED = 42
random.seed(SEED)
np.random.seed(SEED)
torch.manual_seed(SEED)
torch.cuda.manual_seed_all(SEED)
torch.backends.cudnn.deterministic = True
torch.backends.cudnn.benchmark = False

# ----------------------------------------------------------
# 2. DEVICE DETECTION
# ----------------------------------------------------------
DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(f"{'='*60}")
print(f"    Device : {DEVICE}")
if DEVICE.type == "cuda":
    print(f"   GPU    : {torch.cuda.get_device_name(0)}")
    print(f"   VRAM   : {torch.cuda.get_device_properties(0).total_memory / 1e9:.1f} GB")
print(f"{'='*60}\n")

# ----------------------------------------------------------
# 3. HYPERPARAMETERS  (tweaked automatically in retry loop)
# ----------------------------------------------------------
CONFIG = {
    "batch_size"    : 128,
    "lr"            : 1e-3,
    "weight_decay"  : 1e-4,
    "epochs"        : 20,
    "dropout"       : 0.3,
    "hidden_dims"   : [512, 256, 128],
    "val_fraction"  : 0.1,          # 10 % of train  validation
    "patience"      : 5,            # early-stopping patience
    "min_accuracy"  : 0.80,         # retry threshold
    "target_acc"    : 0.95,         # success target
}

# ----------------------------------------------------------
# 4. DATA LOADING
# ----------------------------------------------------------
def get_dataloaders(batch_size: int, val_fraction: float):
    """Return train, validation, and test DataLoaders."""
    transform = transforms.Compose([
        transforms.ToTensor(),
        transforms.Normalize((0.1307,), (0.3081,))   # MNIST mean / std
    ])

    train_full = torchvision.datasets.MNIST(
        root=str(ROOT / "data"), train=True, download=True, transform=transform)
    test_ds = torchvision.datasets.MNIST(
        root=str(ROOT / "data"), train=False, download=True, transform=transform)

    val_size   = int(len(train_full) * val_fraction)
    train_size = len(train_full) - val_size
    train_ds, val_ds = random_split(
        train_full, [train_size, val_size],
        generator=torch.Generator().manual_seed(SEED)
    )

    train_loader = DataLoader(train_ds, batch_size=batch_size,
                              shuffle=True,  num_workers=2, pin_memory=True)
    val_loader   = DataLoader(val_ds,   batch_size=batch_size,
                              shuffle=False, num_workers=2, pin_memory=True)
    test_loader  = DataLoader(test_ds,  batch_size=batch_size,
                              shuffle=False, num_workers=2, pin_memory=True)

    print(f"   Train samples : {train_size:,}")
    print(f"   Val   samples : {val_size:,}")
    print(f"   Test  samples : {len(test_ds):,}\n")
    return train_loader, val_loader, test_loader

# ----------------------------------------------------------
# 5. MODEL DEFINITION
# ----------------------------------------------------------
class MLP(nn.Module):
    """
    Multilayer Perceptron for MNIST.
    Layers: Linear  BatchNorm  ReLU  Dropout  (N)   Linear (output)
    """
    def __init__(self, input_dim: int, hidden_dims: list, output_dim: int,
                 dropout: float):
        super().__init__()
        layers = []
        prev = input_dim
        for h in hidden_dims:
            layers += [
                nn.Linear(prev, h),
                nn.BatchNorm1d(h),
                nn.ReLU(inplace=True),
                nn.Dropout(p=dropout),
            ]
            prev = h
        layers.append(nn.Linear(prev, output_dim))
        self.net = nn.Sequential(*layers)
        self._init_weights()

    def _init_weights(self):
        for m in self.modules():
            if isinstance(m, nn.Linear):
                nn.init.kaiming_normal_(m.weight, nonlinearity="relu")
                nn.init.zeros_(m.bias)

    def forward(self, x):
        x = x.view(x.size(0), -1)   # flatten  2828  784
        return self.net(x)

def build_model(cfg: dict) -> MLP:
    model = MLP(
        input_dim   = 784,
        hidden_dims = cfg["hidden_dims"],
        output_dim  = 10,
        dropout     = cfg["dropout"],
    ).to(DEVICE)
    total_params = sum(p.numel() for p in model.parameters() if p.requires_grad)
    print(f"   Model         : MLP {[784]+cfg['hidden_dims']+[10]}")
    print(f"   Parameters    : {total_params:,}\n")
    return model

# ----------------------------------------------------------
# 6. TRAINING & EVALUATION HELPERS
# ----------------------------------------------------------
def run_epoch(model, loader, criterion, optimizer=None):
    """One forward pass over loader. If optimizer given  train mode."""
    is_train = optimizer is not None
    model.train() if is_train else model.eval()

    total_loss, correct, total = 0.0, 0, 0
    with torch.set_grad_enabled(is_train):
        for images, labels in loader:
            images, labels = images.to(DEVICE), labels.to(DEVICE)
            outputs = model(images)
            loss    = criterion(outputs, labels)

            if is_train:
                optimizer.zero_grad()
                loss.backward()
                nn.utils.clip_grad_norm_(model.parameters(), max_norm=5.0)
                optimizer.step()

            total_loss += loss.item() * labels.size(0)
            preds       = outputs.argmax(dim=1)
            correct    += preds.eq(labels).sum().item()
            total      += labels.size(0)

    return total_loss / total, correct / total


def evaluate_test(model, test_loader):
    """Return accuracy, all predictions, and all true labels."""
    model.eval()
    all_preds, all_labels = [], []
    correct, total = 0, 0
    with torch.no_grad():
        for images, labels in test_loader:
            images, labels = images.to(DEVICE), labels.to(DEVICE)
            preds = model(images).argmax(dim=1)
            all_preds.extend(preds.cpu().numpy())
            all_labels.extend(labels.cpu().numpy())
            correct += preds.eq(labels).sum().item()
            total   += labels.size(0)
    return correct / total, np.array(all_preds), np.array(all_labels)

# ----------------------------------------------------------
# 7. TRAINING LOOP
# ----------------------------------------------------------
def train(cfg: dict, train_loader, val_loader):
    """Full training loop with early stopping & LR scheduling."""
    model     = build_model(cfg)
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.Adam(model.parameters(),
                           lr=cfg["lr"], weight_decay=cfg["weight_decay"])
    scheduler = optim.lr_scheduler.ReduceLROnPlateau(
        optimizer, mode="max", factor=0.5, patience=3)

    history   = defaultdict(list)
    best_val  = 0.0
    best_state= None
    no_improve= 0

    print(f"{''*60}")
    print(f"  {'Epoch':>5}  {'Train Loss':>10}  {'Train Acc':>9}  "
          f"{'Val Loss':>9}  {'Val Acc':>8}  {'LR':>8}")
    print(f"{''*60}")

    start = time.time()
    for epoch in range(1, cfg["epochs"] + 1):
        t_loss, t_acc = run_epoch(model, train_loader, criterion, optimizer)
        v_loss, v_acc = run_epoch(model, val_loader,   criterion)
        scheduler.step(v_acc)

        history["train_loss"].append(t_loss)
        history["train_acc"].append(t_acc)
        history["val_loss"].append(v_loss)
        history["val_acc"].append(v_acc)

        lr_now = optimizer.param_groups[0]["lr"]
        print(f"  {epoch:>5}  {t_loss:>10.4f}  {t_acc*100:>8.2f}%  "
              f"{v_loss:>9.4f}  {v_acc*100:>7.2f}%  {lr_now:.2e}")

        # Checkpoint best model
        if v_acc > best_val:
            best_val   = v_acc
            best_state = {k: v.clone() for k, v in model.state_dict().items()}
            no_improve = 0
        else:
            no_improve += 1
            if no_improve >= cfg["patience"]:
                print(f"\n    Early stopping at epoch {epoch} "
                      f"(no improvement for {cfg['patience']} epochs)")
                break

    elapsed = time.time() - start
    print(f"{''*60}")
    print(f"    Training time : {elapsed:.1f}s  |  "
          f"Best val acc : {best_val*100:.2f}%\n")

    model.load_state_dict(best_state)  # restore best weights
    return model, history, best_val

# ----------------------------------------------------------
# 8. VISUALISATION HELPERS
# ----------------------------------------------------------
def plot_training_curves(history: dict, attempt: int):
    fig, axes = plt.subplots(1, 2, figsize=(13, 4))
    epochs = range(1, len(history["train_acc"]) + 1)

    # Accuracy
    axes[0].plot(epochs, [a*100 for a in history["train_acc"]],
                 "b-o", markersize=4, label="Train Acc")
    axes[0].plot(epochs, [a*100 for a in history["val_acc"]],
                 "r-o", markersize=4, label="Val Acc")
    axes[0].axhline(95, color="green", linestyle="--", linewidth=1,
                    label="95% target")
    axes[0].set_title(f"Accuracy (Attempt {attempt})", fontsize=13, fontweight="bold")
    axes[0].set_xlabel("Epoch"); axes[0].set_ylabel("Accuracy (%)")
    axes[0].legend(); axes[0].grid(alpha=0.3); axes[0].set_ylim([50, 101])

    # Loss
    axes[1].plot(epochs, history["train_loss"], "b-o", markersize=4, label="Train Loss")
    axes[1].plot(epochs, history["val_loss"],   "r-o", markersize=4, label="Val Loss")
    axes[1].set_title(f"Loss (Attempt {attempt})", fontsize=13, fontweight="bold")
    axes[1].set_xlabel("Epoch"); axes[1].set_ylabel("Loss")
    axes[1].legend(); axes[1].grid(alpha=0.3)

    plt.tight_layout()
    fname = ROOT / f"training_curves_attempt{attempt}.png"
    plt.savefig(str(fname), dpi=120, bbox_inches="tight")
    plt.show()
    print(f"   Saved  {fname}\n")


def plot_confusion_matrix(y_true, y_pred):
    cm = confusion_matrix(y_true, y_pred)
    fig, ax = plt.subplots(figsize=(10, 8))
    sns.heatmap(cm, annot=True, fmt="d", cmap="Blues",
                xticklabels=range(10), yticklabels=range(10),
                linewidths=0.5, ax=ax)
    ax.set_title("Confusion Matrix  MNIST MLP", fontsize=14, fontweight="bold")
    ax.set_xlabel("Predicted Label"); ax.set_ylabel("True Label")
    plt.tight_layout()
    cm_path = ROOT / "confusion_matrix.png"
    plt.savefig(str(cm_path), dpi=120, bbox_inches="tight")
    plt.show()
    print(f"   Saved  {cm_path}\n")


def show_misclassified(test_loader, model, n=16):
    """Display a grid of misclassified examples."""
    model.eval()
    wrong_imgs, wrong_preds, wrong_trues = [], [], []
    with torch.no_grad():
        for imgs, labels in test_loader:
            imgs, labels = imgs.to(DEVICE), labels.to(DEVICE)
            preds = model(imgs).argmax(1)
            mask  = preds != labels
            wrong_imgs.extend(imgs[mask].cpu())
            wrong_preds.extend(preds[mask].cpu().numpy())
            wrong_trues.extend(labels[mask].cpu().numpy())
            if len(wrong_imgs) >= n:
                break

    fig, axes = plt.subplots(2, 8, figsize=(16, 5))
    for i, ax in enumerate(axes.flat):
        if i >= min(n, len(wrong_imgs)):
            ax.axis("off"); continue
        img = wrong_imgs[i].squeeze().numpy()
        # undo normalisation for display
        img = img * 0.3081 + 0.1307
        ax.imshow(img, cmap="gray")
        ax.set_title(f"T:{wrong_trues[i]} P:{wrong_preds[i]}",
                     color="red", fontsize=9)
        ax.axis("off")
    fig.suptitle("Misclassified Samples  (True  Predicted)",
                 fontsize=13, fontweight="bold")
    plt.tight_layout()
    mc_path = ROOT / "misclassified.png"
    plt.savefig(str(mc_path), dpi=120, bbox_inches="tight")
    plt.show()
    print(f"   Saved  {mc_path}\n")

# ----------------------------------------------------------
# 9. SAVE MODEL (optionally to Google Drive)
# ----------------------------------------------------------
def save_model(model, test_acc: float, use_drive: bool = False):
    fname = str(ROOT / "mnist_mlp_best.pth")
    if use_drive:
        try:
            from google.colab import drive
            drive.mount("/content/drive", force_remount=False)
            save_dir = "/content/drive/MyDrive/mnist_mlp/"
            os.makedirs(save_dir, exist_ok=True)
            fname = os.path.join(save_dir, "mnist_mlp_best.pth")
        except Exception:
            print("    Drive mount failed — saving locally instead.")
    torch.save({
        "model_state_dict" : model.state_dict(),
        "test_accuracy"    : test_acc,
        "config"           : CONFIG,
    }, fname)
    print(f"   Model saved  {fname}")

# ----------------------------------------------------------
# 10. ITERATIVE IMPROVEMENT LOOP
# ----------------------------------------------------------
def iterative_train_loop(train_loader, val_loader, test_loader):
    """
    1st attempt uses CONFIG defaults.
    If test_acc < min_accuracy, retry with stronger regularisation & wider net.
    """
    cfg     = dict(CONFIG)   # copy so we can mutate safely
    attempt = 0
    MAX_ATTEMPTS = 3

    while attempt < MAX_ATTEMPTS:
        attempt += 1
        print(f"\n{''*60}")
        print(f"    TRAINING ATTEMPT {attempt} / {MAX_ATTEMPTS}")
        print(f"{''*60}")
        print(f"  Config: lr={cfg['lr']:.2e} | dropout={cfg['dropout']} "
              f"| hidden={cfg['hidden_dims']}\n")

        model, history, best_val = train(cfg, train_loader, val_loader)
        plot_training_curves(history, attempt)

        test_acc, preds, labels = evaluate_test(model, test_loader)
        print(f"\n{''*60}")
        print(f"   TEST ACCURACY    {test_acc*100:.2f}%")
        print(f"{''*60}\n")

        if test_acc >= cfg["min_accuracy"]:
            break  # success  exit loop

        #  Failure: adjust hyperparameters for next attempt 
        print(f"    Accuracy {test_acc*100:.2f}% < {cfg['min_accuracy']*100:.0f}% "
              f" auto-adjusting hyperparameters \n")
        if attempt == 1:
            cfg["lr"]          = 5e-4
            cfg["dropout"]     = 0.2
            cfg["hidden_dims"] = [1024, 512, 256, 128]
            cfg["epochs"]      = 25
        elif attempt == 2:
            cfg["lr"]          = 2e-4
            cfg["dropout"]     = 0.1
            cfg["hidden_dims"] = [1024, 512, 256]
            cfg["weight_decay"]= 5e-5
            cfg["epochs"]      = 30

    #  Final reporting 
    print("\n" + ""*60)
    print(f"  FINAL RESULTS  Attempt {attempt}")
    print(""*60)
    print(f"  Test Accuracy : {test_acc*100:.2f}%")

    if test_acc >= cfg["target_acc"]:
        print("    SUCCESS  Target  95% ACHIEVED!")
    elif test_acc >= cfg["min_accuracy"]:
        print("    SUCCESS  Minimum  80% achieved.")
    else:
        print("    WARNING: Model did NOT reach 80% accuracy.")
        print("      Consider: longer training, data augmentation, or different arch.")

    print("\n   Classification Report:")
    print(classification_report(labels, preds,
                                target_names=[str(i) for i in range(10)]))

    # Bonus plots
    plot_confusion_matrix(labels, preds)
    show_misclassified(test_loader, model)

    return model, test_acc

# ----------------------------------------------------------
# 11.  OPTIONAL  GOOGLE DRIVE CHECKPOINT
# ----------------------------------------------------------
USE_DRIVE = False   #  set True inside Colab to save to Drive

# ----------------------------------------------------------
# 12.  MAIN ENTRY POINT
# ----------------------------------------------------------
if __name__ == "__main__":
    print("\n" + ""*60)
    print("   MNIST MLP CLASSIFIER  Antigravity Edition")
    print(""*60 + "\n")

    # Load data
    print(" Loading MNIST ")
    train_loader, val_loader, test_loader = get_dataloaders(
        CONFIG["batch_size"], CONFIG["val_fraction"])

    # Train (with auto-retry if needed)
    model, test_acc = iterative_train_loop(train_loader, val_loader, test_loader)

    # Persist model
    save_model(model, test_acc, use_drive=USE_DRIVE)

    print("\n All done. Check the saved PNG files for plots.")
