#!/usr/bin/env python3
"""
preprocess_wav_samples.py (was preprocess_radioml_samples.py)
--------------------------------------------------------------
Batch-extract 41-dim siren features from a directory of WAV files
and save as .npy files for offline testing / FPGA verification.

Usage:
    python preprocess_radioml_samples.py --wav-dir /path/to/wavs --out-dir ./npy_samples
    python preprocess_radioml_samples.py --wav-dir /path/to/wavs --stats best_model.pt

The output per WAV file is a (41,) float32 array saved as <basename>.npy
alongside a (41,) uint32 array <basename>_q412.npy (Q4.12 encoded for DMA).

Requires: scipy, numpy, (optionally) torch
"""

import os
import sys
import struct
import argparse
import numpy as np


TARGET_SR    = 16000
NPERSEG      = 512
NOVERLAP     = 256
SCALE        = 4096   # Q4.12

SPEC_BANDS   = [(0,500),(500,1000),(1000,2000),(2000,4000),
                (4000,6000),(6000,8000),(8000,10000),(10000,16000)]
ENERGY_BANDS = [(0,300),(300,1000),(1000,3000),(3000,8000)]


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


def load_stats(ckpt_or_npz):
    """Load feature_mean, feature_std from checkpoint or .npz."""
    if ckpt_or_npz.endswith('.npz'):
        s = np.load(ckpt_or_npz)
        return s['mean'].astype(np.float32), s['std'].astype(np.float32)
    else:
        import torch
        ckpt = torch.load(ckpt_or_npz, weights_only=False, map_location='cpu')
        m = np.array(ckpt['feature_mean'], dtype=np.float32)
        s = np.array(ckpt['feature_std'],  dtype=np.float32)
        return m, s


def encode_q412(x):
    out = np.zeros(len(x), dtype=np.uint32)
    for i, v in enumerate(x):
        q = int(round(float(v) * SCALE))
        q = max(-32768, min(32767, q))
        out[i] = struct.unpack('<I', struct.pack('<h', q) + b'\x00\x00')[0]
    return out


def main():
    ap = argparse.ArgumentParser(description='WAV -> 41-dim feature extractor for siren FPGA')
    ap.add_argument('--wav-dir', required=True, help='Directory containing .wav files')
    ap.add_argument('--out-dir', default=None,  help='Output directory for .npy files (default: same as --wav-dir)')
    ap.add_argument('--stats',   default=None,  help='Path to best_model.pt or feature_stats.npz for normalisation')
    ap.add_argument('--no-q412', action='store_true', help='Skip writing Q4.12 encoded arrays')
    args = ap.parse_args()

    wav_dir = args.wav_dir
    out_dir = args.out_dir or wav_dir
    os.makedirs(out_dir, exist_ok=True)

    feat_mean = np.zeros(41, dtype=np.float32)
    feat_std  = np.ones(41, dtype=np.float32)
    if args.stats:
        feat_mean, feat_std = load_stats(args.stats)
        print(f'Loaded normalisation stats from {args.stats}')
    else:
        print('No --stats provided: features will NOT be normalised.')

    wavs = sorted([
        os.path.join(wav_dir, f)
        for f in os.listdir(wav_dir)
        if f.lower().endswith('.wav')
    ])
    if not wavs:
        sys.exit(f'ERROR: No .wav files found in {wav_dir}')

    print(f'Processing {len(wavs)} WAV files ...')
    for wav_path in wavs:
        basename = os.path.splitext(os.path.basename(wav_path))[0]
        try:
            feats  = extract_features(wav_path)
            x_norm = (feats - feat_mean) / (feat_std + 1e-8)

            npy_path = os.path.join(out_dir, basename + '.npy')
            np.save(npy_path, x_norm)

            if not args.no_q412:
                q412      = encode_q412(x_norm)
                q412_path = os.path.join(out_dir, basename + '_q412.npy')
                np.save(q412_path, q412)

            print(f'  {basename:40s}  41 features  -> {npy_path}')
        except Exception as e:
            print(f'  ERROR: {basename}: {e}')

    print(f'\nDone. {len(wavs)} files processed -> {out_dir}')


if __name__ == '__main__':
    main()
