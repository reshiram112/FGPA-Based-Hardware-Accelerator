#!/usr/bin/env python3
"""
train_radioml.py (re-purposed as train_siren.py)
-------------------------------------------------
Train a 2-layer MLP (41->4->2) for binary siren classification:
  - Class 0: ambulance
  - Class 1: firetruck

Feature extraction:
  - 32 spectral band stats (8 bands x 4 stats)
  -  5 waveform stats
  -  4 band-energy means
  = 41 features total

Expects data directory structure:
    <data_root>/
        ambulance/   *.wav
        firetruck/   *.wav

Saves:
    best_model.pt  -- checkpoint with weights, class_names, feature_mean, feature_std, config, params

Usage:
    python train_radioml.py --data-root /path/to/data
    python train_radioml.py --data-root /path/to/data --epochs 100 --hidden 8 16
"""

import argparse
import json
import os
import sys
import time

import numpy as np
import torch
import torch.nn as nn
from torch.utils.data import DataLoader, TensorDataset, random_split


TARGET_SR    = 16000
NPERSEG      = 512
NOVERLAP     = 256
SPEC_BANDS   = [(0,500),(500,1000),(1000,2000),(2000,4000),
                (4000,6000),(6000,8000),(8000,10000),(10000,16000)]
ENERGY_BANDS = [(0,300),(300,1000),(1000,3000),(3000,8000)]
CLASS_NAMES  = ['ambulance', 'firetruck']


# --------------------------------------------------------------------------
# Feature extraction
# --------------------------------------------------------------------------

def extract_features(wav_path):
    from scipy.io import wavfile
    from scipy.signal import resample, spectrogram, hann

    sr, data = wavfile.read(wav_path)
    if data.dtype == np.int16:
        data = data.astype(np.float32) / 32768.0
    elif data.dtype == np.int32:
        data = data.astype(np.float32) / 2147483648.0
    else:
        data = data.astype(np.float32)
    if data.ndim == 2:
        data = data.mean(axis=1)
    peak = np.max(np.abs(data))
    if peak > 0:
        data /= peak
    if sr != TARGET_SR:
        data = resample(data, int(len(data) * TARGET_SR / sr))
    freqs, _, Sxx = spectrogram(
        data, fs=TARGET_SR, window=hann(NPERSEG),
        nperseg=NPERSEG, noverlap=NOVERLAP, scaling='spectrum', mode='magnitude')
    Sxx = np.log1p(Sxx)
    feats = []
    for flo, fhi in SPEC_BANDS:
        m = (freqs >= flo) & (freqs < fhi)
        b = Sxx[m, :].flatten() if m.any() else np.zeros(1)
        feats += [np.mean(b), np.std(b), np.percentile(b,25), np.percentile(b,75)]
    abs_d = np.abs(data)
    feats += [np.mean(data), np.std(data), np.mean(abs_d), np.max(abs_d), np.percentile(abs_d,90)]
    for flo, fhi in ENERGY_BANDS:
        m = (freqs >= flo) & (freqs < fhi)
        bm = Sxx[m, :].mean(axis=0) if m.any() else np.zeros(1)
        feats.append(float(np.mean(bm)))
    return np.array(feats, dtype=np.float32)


def load_dataset(data_root):
    X, y = [], []
    for cls_idx, cls_name in enumerate(CLASS_NAMES):
        cls_dir = os.path.join(data_root, cls_name)
        if not os.path.isdir(cls_dir):
            print(f'  WARNING: {cls_dir} not found, skipping.')
            continue
        wavs = [f for f in os.listdir(cls_dir) if f.lower().endswith('.wav')]
        print(f'  {cls_name:12s}: {len(wavs)} WAV files')
        for w in wavs:
            try:
                feats = extract_features(os.path.join(cls_dir, w))
                X.append(feats)
                y.append(cls_idx)
            except Exception as e:
                print(f'    ERROR: {w}: {e}')
    return np.array(X, dtype=np.float32), np.array(y, dtype=np.int64)


# --------------------------------------------------------------------------
# Model
# --------------------------------------------------------------------------

def build_model(n_in, hidden_layers, n_out, dropout=0.0):
    layers = []
    in_sz  = n_in
    for h in hidden_layers:
        layers.append(nn.Linear(in_sz, h))
        layers.append(nn.ReLU())
        if dropout > 0:
            layers.append(nn.Dropout(dropout))
        in_sz = h
    layers.append(nn.Linear(in_sz, n_out))
    return nn.Sequential(*layers)


# --------------------------------------------------------------------------
# Training loop
# --------------------------------------------------------------------------

def train(args):
    print(f'\nLoading dataset from: {args.data_root}')
    X_raw, y = load_dataset(args.data_root)
    if len(X_raw) == 0:
        sys.exit('ERROR: No samples loaded. Check --data-root path.')
    print(f'  Total samples: {len(X_raw)}  |  class balance: {dict(zip(*np.unique(y, return_counts=True)))}')

    # Normalise
    feat_mean = X_raw.mean(axis=0)
    feat_std  = X_raw.std(axis=0) + 1e-8
    X = (X_raw - feat_mean) / feat_std

    # Train/val split
    X_t = torch.tensor(X, dtype=torch.float32)
    y_t = torch.tensor(y, dtype=torch.long)
    ds  = TensorDataset(X_t, y_t)
    val_size  = max(1, int(len(ds) * 0.2))
    train_size = len(ds) - val_size
    train_ds, val_ds = random_split(ds, [train_size, val_size],
                                    generator=torch.Generator().manual_seed(42))
    train_dl = DataLoader(train_ds, batch_size=args.batch_size, shuffle=True)
    val_dl   = DataLoader(val_ds,   batch_size=64)
    print(f'  Train: {train_size}  |  Val: {val_size}')

    # Model
    model = build_model(41, args.hidden, 2, dropout=args.dropout)
    params = sum(p.numel() for p in model.parameters())
    print(f'  Architecture: 41->{"-".join(str(h) for h in args.hidden)}->2  |  {params} params')

    opt       = torch.optim.Adam(model.parameters(), lr=args.lr, weight_decay=args.wd)
    criterion = nn.CrossEntropyLoss()

    best_val_acc  = 0.0
    patience_left = args.patience
    best_epoch    = 0
    log = []

    print(f'\nTraining for up to {args.epochs} epochs ...')
    for epoch in range(1, args.epochs + 1):
        model.train()
        for xb, yb in train_dl:
            opt.zero_grad()
            loss = criterion(model(xb), yb)
            loss.backward()
            opt.step()

        model.eval()
        with torch.no_grad():
            val_correct = sum(
                (model(xb).argmax(1) == yb).sum().item()
                for xb, yb in val_dl
            )
        val_acc = val_correct / val_size

        log.append({'epoch': epoch, 'val_acc': val_acc})
        if epoch % 10 == 0 or epoch <= 5:
            print(f'  Epoch {epoch:3d}  val_acc={val_acc:.4f}')

        if val_acc > best_val_acc:
            best_val_acc  = val_acc
            best_epoch    = epoch
            patience_left = args.patience
            torch.save({
                'model_state_dict': model.state_dict(),
                'class_names':      CLASS_NAMES,
                'feature_mean':     feat_mean.tolist(),
                'feature_std':      feat_std.tolist(),
                'config': {
                    'hidden_layers': args.hidden,
                    'dropout':       args.dropout,
                    'learning_rate': args.lr,
                    'weight_decay':  args.wd,
                    'batch_size':    args.batch_size,
                    'max_epochs':    args.epochs,
                    'patience':      args.patience,
                },
                'params': params,
            }, args.out)
        else:
            patience_left -= 1
            if patience_left == 0:
                print(f'  Early stop at epoch {epoch}')
                break

    print(f'\nBest val accuracy: {best_val_acc:.4f} at epoch {best_epoch}')
    print(f'Checkpoint saved : {args.out}')

    log_path = os.path.splitext(args.out)[0] + '_log.json'
    with open(log_path, 'w') as f:
        json.dump(log, f, indent=2)
    print(f'Training log     : {log_path}')


# --------------------------------------------------------------------------
# CLI
# --------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(description='Train Siren MLP classifier (41->4->2)')
    ap.add_argument('--data-root', required=True,
                    help='Root dir with ambulance/ and firetruck/ subdirs containing WAV files')
    ap.add_argument('--out',       default='best_model.pt')
    ap.add_argument('--hidden',    type=int, nargs='+', default=[4])
    ap.add_argument('--dropout',   type=float, default=0.0)
    ap.add_argument('--lr',        type=float, default=0.01)
    ap.add_argument('--wd',        type=float, default=1e-4)
    ap.add_argument('--batch-size',type=int,   default=32)
    ap.add_argument('--epochs',    type=int,   default=80)
    ap.add_argument('--patience',  type=int,   default=12)
    args = ap.parse_args()
    train(args)


if __name__ == '__main__':
    main()
