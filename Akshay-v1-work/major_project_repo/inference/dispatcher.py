"""
inference/dispatcher.py
=======================
Loads all 4 automotive ML models at import time and provides a single
route_and_infer() entry-point that dispatches based on file extension.

Returns a fully-populated dict with predictions, probabilities, and
latency / resource metrics for 100 benchmark runs.
"""

import os
import sys
import time
import gc
import base64
import io
import warnings
warnings.filterwarnings('ignore')

import matplotlib
matplotlib.use('Agg')

import numpy as np
import psutil
import torch
import torch.nn.functional as F
import joblib
import pandas as pd
from PIL import Image

# ── Path setup ────────────────────────────────────────────────────────────────
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, 'model_training'))

from train_cnn         import SimpleCNN
from train_audio_mlp   import AudioMLP
from train_bnn_pothole import BNNPotholeDetector
from train_svm         import engineer_features

MODEL_DIR = os.path.join(ROOT, 'model_outputs')

# ── GTSRB class names (index 0–42) ───────────────────────────────────────────
# PyTorch ImageFolder sorts folder names alphabetically ('0', '1', '10', '11'...)
# So model output index `i` corresponds to the i-th alphabetically sorted string!
_folders = [str(i) for i in range(43)]
_folders.sort()

_TRUE_CLASS_NAMES = {
    0: "Speed limit 20", 1: "Speed limit 30", 2: "Speed limit 50", 
    3: "Speed limit 60", 4: "Speed limit 70", 5: "Speed limit 80", 
    6: "End speed limit 80", 7: "Speed limit 100", 8: "Speed limit 120", 
    9: "No passing", 10: "No passing >3.5t", 11: "Right-of-way", 
    12: "Priority road", 13: "Yield", 14: "Stop", 15: "No vehicles", 
    16: "No vehicles >3.5t", 17: "No entry", 18: "General caution", 
    19: "Dangerous curve left", 20: "Dangerous curve right", 21: "Double curve", 
    22: "Bumpy road", 23: "Slippery road", 24: "Road narrows right", 
    25: "Road work", 26: "Traffic signals", 27: "Pedestrians", 28: "Children crossing", 
    29: "Bicycles crossing", 30: "Beware ice/snow", 31: "Wild animals", 
    32: "End all limits", 33: "Turn right", 34: "Turn left", 
    35: "Ahead only", 36: "Go straight or right", 37: "Go straight or left", 
    38: "Keep right", 39: "Keep left", 40: "Roundabout", 
    41: "End no passing", 42: "End no passing >3.5t"
}

# Map PyTorch output index -> True Class Name
GTSRB_CLASSES = [_TRUE_CLASS_NAMES[int(f)] for f in _folders]

# ── Image pre-processing transforms ──────────────────────────────────────────
import torchvision.transforms as transforms

_IMG_TRANSFORM = transforms.Compose([
    transforms.Resize((32, 32)),
    transforms.ToTensor(),
    transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5)),
])


# ═════════════════════════════════════════════════════════════════════════════
#  Model loading (executed once at import time)
# ═════════════════════════════════════════════════════════════════════════════

_device = torch.device('cpu')

def _load_cnn():
    path = os.path.join(MODEL_DIR, 'cnn_weights.pth')
    model = SimpleCNN(num_classes=43).to(_device)
    model.load_state_dict(torch.load(path, map_location=_device, weights_only=True))
    model.eval()
    return model

def _load_audio_mlp():
    path = os.path.join(MODEL_DIR, 'audio_mlp_weights.pth')
    model = AudioMLP(input_size=160, hidden_size=256, num_classes=2).to(_device)
    model.load_state_dict(torch.load(path, map_location=_device, weights_only=True))
    model.eval()
    return model

def _load_bnn():
    path = os.path.join(MODEL_DIR, 'bnn_pothole_weights.pth')
    model = BNNPotholeDetector().to(_device)
    model.load_state_dict(torch.load(path, map_location=_device, weights_only=True))
    model.eval()
    return model

def _load_svm():
    clf    = joblib.load(os.path.join(MODEL_DIR, 'svm_model.pkl'))
    scaler = joblib.load(os.path.join(MODEL_DIR, 'svm_scaler.pkl'))
    return clf, scaler


print("[dispatcher] Loading CNN …", flush=True)
_cnn = _load_cnn()
print("[dispatcher] Loading AudioMLP …", flush=True)
_mlp = _load_audio_mlp()
print("[dispatcher] Loading BNN Pothole …", flush=True)
_bnn = _load_bnn()
print("[dispatcher] Loading SVM …", flush=True)
_svm_clf, _svm_scaler = _load_svm()
print("[dispatcher] All 4 models ready.", flush=True)


# ═════════════════════════════════════════════════════════════════════════════
#  Benchmarking helper
# ═════════════════════════════════════════════════════════════════════════════

def _run_benchmark(infer_fn, n_runs: int = 100, warmup: int = 10):
    """
    Run infer_fn n_runs times (after warmup) and return timing + resource stats.
    All latency values are stored in *microseconds*; converted to ms in output dict.
    """
    proc = psutil.Process(os.getpid())

    # Warmup
    for _ in range(warmup):
        infer_fn()
    gc.collect()

    mem_before = proc.memory_info().rss / (1024 ** 2)   # MB
    cpu_start  = proc.cpu_times()
    wall_start = time.perf_counter()

    latencies = []
    for _ in range(n_runs):
        t0 = time.perf_counter()
        infer_fn()
        latencies.append((time.perf_counter() - t0) * 1_000_000)   # µs

    wall_elapsed = time.perf_counter() - wall_start
    cpu_end      = proc.cpu_times()

    mem_after = proc.memory_info().rss / (1024 ** 2)
    cpu_delta = (cpu_end.user - cpu_start.user) + (cpu_end.system - cpu_start.system)
    cpu_pct   = (cpu_delta / wall_elapsed * 100.0 / max(psutil.cpu_count(), 1)
                 if wall_elapsed > 0 else 0.0)

    lat = np.array(latencies)
    mean_us = float(np.mean(lat))

    return {
        "n_runs":              n_runs,
        "warmup_runs":         warmup,
        # µs
        "latency_mean_us":     round(mean_us,                            3),
        "latency_min_us":      round(float(np.min(lat)),                 3),
        "latency_max_us":      round(float(np.max(lat)),                 3),
        "latency_std_us":      round(float(np.std(lat)),                 3),
        "latency_p95_us":      round(float(np.percentile(lat, 95)),      3),
        "latency_p99_us":      round(float(np.percentile(lat, 99)),      3),
        # ms
        "latency_mean_ms":     round(mean_us / 1000,                     4),
        "latency_min_ms":      round(float(np.min(lat))  / 1000,         4),
        "latency_max_ms":      round(float(np.max(lat))  / 1000,         4),
        "latency_std_ms":      round(float(np.std(lat))  / 1000,         4),
        "latency_p95_ms":      round(float(np.percentile(lat, 95)) / 1000, 4),
        "latency_p99_ms":      round(float(np.percentile(lat, 99)) / 1000, 4),
        # throughput & resources
        "throughput_fps":      round(1_000_000 / mean_us, 1) if mean_us > 0 else 0.0,
        "cpu_percent":         round(cpu_pct, 2),
        "ram_mb":              round(mem_after, 1),
        "ram_delta_mb":        round(mem_after - mem_before, 2),
    }


# ═════════════════════════════════════════════════════════════════════════════
#  Preprocessing helpers
# ═════════════════════════════════════════════════════════════════════════════

def _preprocess_image(file_bytes: bytes):
    """
    Return (tensor 1×3×32×32, base64-png of the 32×32 preview).
    """
    img = Image.open(io.BytesIO(file_bytes)).convert('RGB')
    resized = img.resize((64, 64), Image.BILINEAR)   # slightly larger for preview
    tensor  = _IMG_TRANSFORM(img).unsqueeze(0)       # 1×3×32×32

    # Build a 32×32 preview image for the UI
    preview = img.resize((32, 32), Image.NEAREST)
    buf = io.BytesIO()
    preview.save(buf, format='PNG')
    preview_b64 = base64.b64encode(buf.getvalue()).decode('utf-8')

    return tensor, preview_b64


def _preprocess_audio(file_bytes: bytes):
    """
    Write bytes to a temp file, extract 160 MFCC features via librosa.
    Returns a (1, 160) float32 tensor.
    """
    import librosa
    import tempfile

    suffix = '.wav'
    with tempfile.NamedTemporaryFile(delete=False, suffix=suffix) as tmp:
        tmp.write(file_bytes)
        tmp_path = tmp.name

    try:
        y, sr = librosa.load(tmp_path, sr=22050, mono=True)
        mfcc  = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=40)
        features = np.concatenate([
            np.mean(mfcc, axis=1),
            np.std(mfcc,  axis=1),
            np.max(mfcc,  axis=1),
            np.min(mfcc,  axis=1),
        ])                                            # shape (160,)
    finally:
        os.unlink(tmp_path)

    return torch.tensor(features, dtype=torch.float32).unsqueeze(0)   # 1×160


def _preprocess_csv(file_bytes: bytes):
    """
    Parse CSV, apply engineer_features, scale, return numpy array (N, 10).
    """
    df = pd.read_csv(io.BytesIO(file_bytes))
    if 'label' not in df.columns:
        df['label'] = 0
    X = engineer_features(df)
    X_scaled = _svm_scaler.transform(X)
    return X_scaled, df


# ═════════════════════════════════════════════════════════════════════════════
#  Public API
# ═════════════════════════════════════════════════════════════════════════════

def route_and_infer(file_bytes: bytes, filename: str, n_runs: int = 100) -> dict:
    """
    Route file to the correct model(s), run n_runs benchmark iterations,
    and return a single result dict ready for JSON serialisation.

    Routing rules
    -------------
    .jpg/.jpeg/.png → CNN (GTSRB top-5) + BNN Pothole (binary)
    .wav/.mp3       → AudioMLP (siren vs non-siren)
    .csv            → SVM (lane-change binary)
    """
    ext = os.path.splitext(filename.lower())[1]

    if ext in ('.jpg', '.jpeg', '.png'):
        return _infer_image(file_bytes, n_runs)
    elif ext in ('.wav', '.mp3'):
        return _infer_audio(file_bytes, n_runs)
    elif ext == '.csv':
        return _infer_csv(file_bytes, n_runs)
    elif ext == '.zip':
        return _infer_zip_batch(file_bytes, n_runs)
    else:
        raise ValueError(f"Unsupported file type: {ext!r}. "
                         "Expected .jpg/.jpeg/.png, .wav/.mp3, .csv, or .zip.")


# ─────────────────────────────────────────────────────────────────────────────

def _infer_image(file_bytes: bytes, n_runs: int) -> dict:
    tensor, preview_b64 = _preprocess_image(file_bytes)

    # ── CNN inference ────────────────────────────────────────────────────────
    with torch.no_grad():
        cnn_logits = _cnn(tensor)
        cnn_probs  = F.softmax(cnn_logits, dim=1).squeeze(0).numpy()

    top5_idx   = np.argsort(cnn_probs)[::-1][:5].tolist()
    top5_names = [GTSRB_CLASSES[i] for i in top5_idx]
    top5_probs = [round(float(cnn_probs[i]) * 100, 2) for i in top5_idx]
    cnn_pred   = int(top5_idx[0])
    cnn_conf   = float(top5_probs[0])

    def _cnn_fn():
        with torch.no_grad():
            return _cnn(tensor)

    cnn_metrics = _run_benchmark(_cnn_fn, n_runs)

    # ── BNN Pothole inference ─────────────────────────────────────────────────
    with torch.no_grad():
        bnn_logits = _bnn(tensor)
        bnn_probs  = F.softmax(bnn_logits, dim=1).squeeze(0).numpy()

    bnn_pred      = int(np.argmax(bnn_probs))
    bnn_label     = "Pothole" if bnn_pred == 1 else "Normal Road"
    bnn_conf      = float(bnn_probs[bnn_pred]) * 100
    bnn_class_probs = [
        {"label": "Normal Road", "prob": round(float(bnn_probs[0]) * 100, 2)},
        {"label": "Pothole",     "prob": round(float(bnn_probs[1]) * 100, 2)},
    ]

    def _bnn_fn():
        with torch.no_grad():
            return _bnn(tensor)

    bnn_metrics = _run_benchmark(_bnn_fn, n_runs)

    return {
        "input_type":     "image",
        "preprocessed_img": preview_b64,

        # CNN results
        "cnn": {
            "model_name":  "CNN (GTSRB Traffic Signs)",
            "prediction":  cnn_pred,
            "label":       GTSRB_CLASSES[cnn_pred],
            "confidence":  round(cnn_conf, 2),
            "top5_indices": top5_idx,
            "top5_names":  top5_names,
            "top5_probs":  top5_probs,
            "all_probs":   [round(float(p) * 100, 3) for p in cnn_probs],
            **cnn_metrics,
        },

        # BNN results
        "bnn": {
            "model_name":   "BNN Pothole Detector",
            "prediction":   bnn_pred,
            "label":        bnn_label,
            "confidence":   round(bnn_conf, 2),
            "class_probs":  bnn_class_probs,
            **bnn_metrics,
        },

        # Combined / primary metrics (CNN used for headline numbers)
        "prediction":        cnn_pred,
        "label":             GTSRB_CLASSES[cnn_pred],
        "confidence":        round(cnn_conf, 2),
        "latency_mean_ms":   cnn_metrics["latency_mean_ms"],
        "latency_min_ms":    cnn_metrics["latency_min_ms"],
        "latency_max_ms":    cnn_metrics["latency_max_ms"],
        "latency_std_ms":    cnn_metrics["latency_std_ms"],
        "latency_p95_ms":    cnn_metrics["latency_p95_ms"],
        "latency_p99_ms":    cnn_metrics["latency_p99_ms"],
        "latency_mean_us":   cnn_metrics["latency_mean_us"],
        "throughput_fps":    cnn_metrics["throughput_fps"],
        "cpu_percent":       cnn_metrics["cpu_percent"],
        "ram_mb":            cnn_metrics["ram_mb"],
        "n_runs":            n_runs,
    }


def _infer_audio(file_bytes: bytes, n_runs: int) -> dict:
    tensor = _preprocess_audio(file_bytes)

    with torch.no_grad():
        logits = _mlp(tensor)
        probs  = F.softmax(logits, dim=1).squeeze(0).numpy()

    pred    = int(np.argmax(probs))
    label   = "Siren" if pred == 1 else "Non-Siren"
    conf    = float(probs[pred]) * 100
    class_probs = [
        {"label": "Non-Siren", "prob": round(float(probs[0]) * 100, 2)},
        {"label": "Siren",     "prob": round(float(probs[1]) * 100, 2)},
    ]

    def _mlp_fn():
        with torch.no_grad():
            return _mlp(tensor)

    metrics = _run_benchmark(_mlp_fn, n_runs)

    return {
        "input_type":       "audio",
        "model_name":       "Audio MLP (UrbanSound8K)",
        "prediction":       pred,
        "label":            label,
        "confidence":       round(conf, 2),
        "class_probs":      class_probs,
        "preprocessed_img": None,
        **metrics,
        "latency_min_ms":   metrics["latency_min_ms"],
        "latency_max_ms":   metrics["latency_max_ms"],
        "latency_std_ms":   metrics["latency_std_ms"],
        "latency_p95_ms":   metrics["latency_p95_ms"],
        "latency_p99_ms":   metrics["latency_p99_ms"],
        "latency_mean_us":  metrics["latency_mean_us"],
    }


def _infer_csv(file_bytes: bytes, n_runs: int) -> dict:
    X_scaled, raw_df = _preprocess_csv(file_bytes)
    batch_size = len(raw_df)

    # For UI display on a single sample, just grab the first one
    pred      = int(_svm_clf.predict(X_scaled)[0])
    label     = "Lane Change" if pred == 1 else "Lane Keep"
    dec_vals  = _svm_clf.decision_function(X_scaled)
    
    # decision_function output shape can be (N,) for 2 classes
    dec_val_0 = dec_vals[0] if batch_size > 1 else dec_vals
    if isinstance(dec_val_0, np.ndarray): dec_val_0 = dec_val_0[0]

    sigmoid   = lambda x: 1.0 / (1.0 + np.exp(-x))
    prob_pos  = float(sigmoid(dec_val_0))
    prob_neg  = 1.0 - prob_pos
    conf      = prob_pos * 100 if pred == 1 else prob_neg * 100
    class_probs = [
        {"label": "Lane Keep",   "prob": round(prob_neg * 100, 2)},
        {"label": "Lane Change", "prob": round(prob_pos * 100, 2)},
    ]

    # Prepare a small feature preview table
    feature_preview = {}
    base_cols = ['v_Vel', 'v_Acc', 'Space_Headway', 'Time_Headway', 'Local_Y']
    for col in base_cols:
        if col in raw_df.columns:
            feature_preview[col] = round(float(raw_df[col].iloc[0]), 4)

    def _svm_fn():
        return _svm_clf.predict(X_scaled)

    metrics = _run_benchmark(_svm_fn, n_runs)
    
    expected_label = None
    if 'label' in raw_df.columns and batch_size == 1:
        expected_lbl_val = int(raw_df['label'].iloc[0])
        expected_label = "Lane Change" if expected_lbl_val == 1 else "Lane Keep"
        
    accuracy = None
    accuracy = None
    batch_counts = {}
    if batch_size > 1:
        preds = _svm_clf.predict(X_scaled)
        if 'label' in raw_df.columns:
            correct = np.sum(preds == raw_df['label'].values)
            accuracy = round(float(correct / batch_size) * 100, 2)
            
        for p in preds:
            lbl = "Lane Change" if int(p) == 1 else "Lane Keep"
            batch_counts[lbl] = batch_counts.get(lbl, 0) + 1

    return {
        "input_type":       "csv",
        "model_name":       "SVM (Tabular Lane Data)",
        "batch_size":       batch_size,
        "prediction":       label,
        "expected_label":   expected_label,
        "batch_accuracy":   accuracy,
        "batch_counts":     batch_counts,
        "confidence":       round(conf, 2),
        "class_probs":      class_probs,
        "feature_preview":  feature_preview,
        "preprocessed_img": None,
        **metrics,
        "latency_min_ms":   metrics["latency_min_ms"],
        "latency_max_ms":   metrics["latency_max_ms"],
        "latency_std_ms":   metrics["latency_std_ms"],
        "latency_p95_ms":   metrics["latency_p95_ms"],
        "latency_p99_ms":   metrics["latency_p99_ms"],
        "latency_mean_us":  metrics["latency_mean_us"],
    }

def _infer_zip_batch(file_bytes: bytes, n_runs: int) -> dict:
    import zipfile
    import io
    
    image_tensors = []
    audio_tensors = []
    
    with zipfile.ZipFile(io.BytesIO(file_bytes)) as z:
        for filename in z.namelist():
            if filename.startswith('__MACOSX') or filename.startswith('.'): continue
            
            ext = os.path.splitext(filename.lower())[1]
            try:
                if ext in ('.jpg', '.jpeg', '.png'):
                    data = z.read(filename)
                    tensor, _ = _preprocess_image(data)
                    image_tensors.append(tensor)
                elif ext in ('.wav', '.mp3'):
                    data = z.read(filename)
                    tensor = _preprocess_audio(data)
                    audio_tensors.append(tensor)
            except Exception as e:
                print(f"Skipping {filename}: {e}")

    if len(image_tensors) > 0:
        batch_tensor = torch.cat(image_tensors, dim=0)
        batch_size = len(image_tensors)
        
        # Benchmark CNN
        def _cnn_batch_fn():
            with torch.no_grad(): return _cnn(batch_tensor)
        cnn_metrics = _run_benchmark(_cnn_batch_fn, n_runs)
        
        # Calculate individual predictions
        with torch.no_grad():
            logits = _cnn(batch_tensor)
            preds = torch.argmax(logits, dim=1).numpy()
            
        batch_counts = {}
        for p in preds:
            class_name = GTSRB_CLASSES[p]
            batch_counts[class_name] = batch_counts.get(class_name, 0) + 1
            
        # Sort counts descending
        batch_counts = dict(sorted(batch_counts.items(), key=lambda item: item[1], reverse=True))
        
        return {
            "input_type": "image",
            "model_name": "CNN (GTSRB Traffic Signs) - Burst Mode",
            "batch_size": batch_size,
            "prediction": f"Batch of {batch_size} images processed",
            "confidence": 100.0,
            "class_probs": [],
            "batch_counts": batch_counts,
            "preprocessed_img": None,
            **cnn_metrics,
        }
        
    elif len(audio_tensors) > 0:
        batch_tensor = torch.cat(audio_tensors, dim=0)
        batch_size = len(audio_tensors)
        
        def _mlp_batch_fn():
            with torch.no_grad(): return _mlp(batch_tensor)
        mlp_metrics = _run_benchmark(_mlp_batch_fn, n_runs)
        
        with torch.no_grad():
            logits = _mlp(batch_tensor)
            preds = torch.argmax(logits, dim=1).numpy()
            
        batch_counts = {}
        for p in preds:
            class_name = "Siren" if p == 1 else "Non-Siren"
            batch_counts[class_name] = batch_counts.get(class_name, 0) + 1
            
        return {
            "input_type": "audio",
            "model_name": "Audio MLP (UrbanSound8K) - Burst Mode",
            "batch_size": batch_size,
            "prediction": f"Batch of {batch_size} audio clips processed",
            "confidence": 100.0,
            "class_probs": [],
            "batch_counts": batch_counts,
            "preprocessed_img": None,
            **mlp_metrics,
        }
    else:
        raise ValueError("No supported images (.jpg/.png) or audio (.wav) found in ZIP.")
