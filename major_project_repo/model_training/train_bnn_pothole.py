"""
BNN Pothole Detector
Approach: crop 32x32 patches from annotated images.
  - Positive patches: cropped from bounding boxes (pothole present)
  - Negative patches: random crops from non-pothole regions (normal road)
Architecture: standard conv feature extractor + BinarizedLinear classifier
"""
import os
import sys
import json
import math
import random
import xml.etree.ElementTree as ET

import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import Dataset, DataLoader, random_split
from torchvision import transforms
from PIL import Image

ROOT        = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
IMG_DIR     = os.path.join(ROOT, 'datasets', 'pothole', 'images')
ANN_DIR     = os.path.join(ROOT, 'datasets', 'pothole', 'annotations')
MODEL_OUT   = os.path.join(ROOT, 'model_outputs', 'bnn_pothole_weights.pth')
RESULTS_DIR = os.path.join(ROOT, 'results', 'bnn')
PATCH_SIZE  = 32
MIN_BOX_PX  = 12   # ignore bounding boxes smaller than this in either dimension
SEED        = 42
random.seed(SEED); np.random.seed(SEED); torch.manual_seed(SEED)


# ── Binarization ─────────────────────────────────────────────────────────────

class Binarize(torch.autograd.Function):
    @staticmethod
    def forward(ctx, x):
        ctx.save_for_backward(x)
        return torch.sign(x)

    @staticmethod
    def backward(ctx, grad):
        return grad.clone()   # straight-through estimator

def binarize(x):
    return Binarize.apply(x)

class BinarizedLinear(nn.Module):
    def __init__(self, in_f, out_f):
        super().__init__()
        self.weight = nn.Parameter(torch.Tensor(out_f, in_f))
        self.bias   = nn.Parameter(torch.Tensor(out_f))
        nn.init.kaiming_uniform_(self.weight, a=math.sqrt(5))
        fan_in, _ = nn.init._calculate_fan_in_and_fan_out(self.weight)
        bound = 1 / math.sqrt(fan_in)
        nn.init.uniform_(self.bias, -bound, bound)

    def forward(self, x):
        return nn.functional.linear(x, binarize(self.weight), self.bias)


# ── Model ─────────────────────────────────────────────────────────────────────

class BNNPotholeDetector(nn.Module):
    """Conv feature extractor (standard) + BinarizedLinear classifier."""
    def __init__(self):
        super().__init__()
        self.features = nn.Sequential(
            nn.Conv2d(3, 16, 3, padding=1),
            nn.BatchNorm2d(16),
            nn.ReLU(),
            nn.MaxPool2d(2, 2),           # 16×16

            nn.Conv2d(16, 32, 3, padding=1),
            nn.BatchNorm2d(32),
            nn.ReLU(),
            nn.MaxPool2d(2, 2),           # 8×8
        )
        flat = 32 * 8 * 8               # 2048
        self.input_bn = nn.BatchNorm1d(flat)
        self.fc1      = BinarizedLinear(flat, 256)
        self.bn1      = nn.BatchNorm1d(256)
        self.fc2      = BinarizedLinear(256, 2)

    def forward(self, x):
        x = self.features(x)
        x = x.view(x.size(0), -1)
        x = self.input_bn(x)
        x = binarize(self.fc1(x))
        x = self.bn1(x)
        x = self.fc2(x)
        return x


# ── Patch extraction ──────────────────────────────────────────────────────────

def iou(boxA, boxB):
    """Intersection-over-union for (x1,y1,x2,y2) boxes."""
    ix1 = max(boxA[0], boxB[0]); iy1 = max(boxA[1], boxB[1])
    ix2 = min(boxA[2], boxB[2]); iy2 = min(boxA[3], boxB[3])
    inter = max(0, ix2 - ix1) * max(0, iy2 - iy1)
    aA = (boxA[2]-boxA[0]) * (boxA[3]-boxA[1])
    aB = (boxB[2]-boxB[0]) * (boxB[3]-boxB[1])
    return inter / (aA + aB - inter + 1e-6)

def parse_boxes(xml_path):
    tree = ET.parse(xml_path)
    boxes = []
    for obj in tree.getroot().findall('object'):
        b = obj.find('bndbox')
        x1, y1 = int(b.find('xmin').text), int(b.find('ymin').text)
        x2, y2 = int(b.find('xmax').text), int(b.find('ymax').text)
        if (x2 - x1) >= MIN_BOX_PX and (y2 - y1) >= MIN_BOX_PX:
            boxes.append((x1, y1, x2, y2))
    return boxes

def crop_patch(img, x1, y1, x2, y2, pad=6):
    W, H = img.size
    x1 = max(0, x1 - pad); y1 = max(0, y1 - pad)
    x2 = min(W, x2 + pad); y2 = min(H, y2 + pad)
    return img.crop((x1, y1, x2, y2)).resize((PATCH_SIZE, PATCH_SIZE), Image.BILINEAR)

def random_negative_patch(img, gt_boxes, attempts=30):
    W, H = img.size
    for _ in range(attempts):
        x1 = random.randint(0, max(0, W - PATCH_SIZE))
        y1 = random.randint(0, max(0, H - PATCH_SIZE))
        x2, y2 = x1 + PATCH_SIZE, y1 + PATCH_SIZE
        if all(iou((x1,y1,x2,y2), b) < 0.1 for b in gt_boxes):
            return img.crop((x1, y1, x2, y2)).resize((PATCH_SIZE, PATCH_SIZE), Image.BILINEAR)
    return None

def build_patch_dataset():
    positives, negatives = [], []
    img_files = sorted(os.listdir(IMG_DIR))

    for fname in img_files:
        stem = os.path.splitext(fname)[0]
        ann_path = os.path.join(ANN_DIR, stem + '.xml')
        img_path = os.path.join(IMG_DIR, fname)
        if not os.path.exists(ann_path):
            continue
        img   = Image.open(img_path).convert('RGB')
        boxes = parse_boxes(ann_path)

        for box in boxes:
            positives.append(crop_patch(img, *box))

        # Try to collect as many negatives as positives from this image
        n_neg = max(1, len(boxes))
        for _ in range(n_neg * 5):
            patch = random_negative_patch(img, boxes)
            if patch is not None:
                negatives.append(patch)
            if len(negatives) >= len(positives):
                break

    # Balance classes
    n = min(len(positives), len(negatives))
    random.shuffle(positives); random.shuffle(negatives)
    positives = positives[:n]; negatives = negatives[:n]
    print(f"  Patches — positives: {n}, negatives: {n}, total: {2*n}")
    return positives, negatives


# ── Dataset ───────────────────────────────────────────────────────────────────

class PatchDataset(Dataset):
    def __init__(self, patches, labels, augment=False):
        self.patches = patches
        self.labels  = labels
        base = [transforms.ToTensor(),
                transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))]
        aug  = [transforms.RandomHorizontalFlip(),
                transforms.RandomVerticalFlip(),
                transforms.ColorJitter(brightness=0.3, contrast=0.3)]
        self.tf = transforms.Compose((aug if augment else []) + base)

    def __len__(self):
        return len(self.patches)

    def __getitem__(self, idx):
        return self.tf(self.patches[idx]), self.labels[idx]


# ── Training ──────────────────────────────────────────────────────────────────

def main():
    print("=== Training BNN Pothole Detector ===")
    print("Building patch dataset...")
    positives, negatives = build_patch_dataset()

    all_patches = positives + negatives
    all_labels  = [1] * len(positives) + [0] * len(negatives)

    idx = list(range(len(all_patches)))
    random.shuffle(idx)
    all_patches = [all_patches[i] for i in idx]
    all_labels  = [all_labels[i]  for i in idx]

    n_train = int(0.8 * len(all_patches))
    train_patches, test_patches = all_patches[:n_train], all_patches[n_train:]
    train_labels,  test_labels  = all_labels[:n_train],  all_labels[n_train:]

    train_ds = PatchDataset(train_patches, train_labels, augment=True)
    test_ds  = PatchDataset(test_patches,  test_labels,  augment=False)

    train_loader = DataLoader(train_ds, batch_size=64, shuffle=True)
    test_loader  = DataLoader(test_ds,  batch_size=64, shuffle=False)

    model     = BNNPotholeDetector()
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.Adam(model.parameters(), lr=0.001)
    scheduler = optim.lr_scheduler.StepLR(optimizer, step_size=10, gamma=0.5)

    epochs = 30
    for epoch in range(epochs):
        model.train()
        running_loss = 0.0
        for X, y in train_loader:
            optimizer.zero_grad()
            loss = criterion(model(X), y)
            loss.backward()
            optimizer.step()
            running_loss += loss.item()
        scheduler.step()
        if (epoch + 1) % 5 == 0:
            print(f"  [Epoch {epoch+1}/{epochs}] loss: {running_loss/len(train_loader):.4f}")

    print("Training complete. Evaluating on test set...")
    model.eval()
    correct = total = 0
    with torch.no_grad():
        for X, y in test_loader:
            _, pred = torch.max(model(X), 1)
            correct += (pred == y).sum().item()
            total   += y.size(0)
    acc = 100 * correct / total
    print(f"  Test Accuracy: {acc:.2f}%")

    os.makedirs(os.path.dirname(MODEL_OUT), exist_ok=True)
    torch.save(model.state_dict(), MODEL_OUT)
    print(f"  Model saved → {MODEL_OUT}")

    os.makedirs(RESULTS_DIR, exist_ok=True)
    with open(os.path.join(RESULTS_DIR, 'bnn_train_log.json'), 'w') as f:
        json.dump({"model": "BNN_Pothole", "dataset": "Pothole Image Patches",
                   "patches_per_class": len(positives), "epochs": epochs,
                   "train_accuracy": round(acc, 4)}, f, indent=4)


if __name__ == '__main__':
    main()
