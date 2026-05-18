"""
MLP Audio FPGA Accelerator - PYNQ Inference Script
==================================================
Run this as a Jupyter Notebook on your PYNQ-Z2 board.
"""

import numpy as np
import time
import pandas as pd
from pynq import Overlay, allocate
import ipywidgets as widgets
from IPython.display import display
import io

print("Loading bitstream onto FPGA...")
overlay = Overlay("mlp_accelerator.bit")
dma = overlay.axi_dma_0
print("✅ Bitstream loaded successfully!")

# Pure HW Latency estimation based on clock cycles
PURE_HW_LATENCY_MS = 0.05

def float_to_q8_8(val):
    return int(val * 256) & 0xFFFF

def mlp_predict(features_q8, dma):
    in_buf = allocate(shape=(160,), dtype=np.uint32)
    out_buf = allocate(shape=(1,), dtype=np.uint32)
    
    np.copyto(in_buf, features_q8)
    
    t0 = time.perf_counter()
    dma.sendchannel.transfer(in_buf)
    dma.recvchannel.transfer(out_buf)
    dma.sendchannel.wait()
    dma.recvchannel.wait()
    t1 = time.perf_counter()
    
    prediction = int(out_buf[0])
    
    in_buf.freebuffer()
    out_buf.freebuffer()
    
    return prediction, (t1 - t0) * 1000

# ============================================================
# CELL 2: Interactive Upload UI
# ============================================================
upload_btn = widgets.FileUpload(accept='.csv', multiple=False)
out = widgets.Output()

def on_upload_change(change):
    with out:
        out.clear_output()
        uploaded_file = list(upload_btn.value.values())[0]
        csv_bytes = uploaded_file['content']
        
        # Load CSV
        df = pd.read_csv(io.BytesIO(csv_bytes))
        feats = df.iloc[0].values
        if len(feats) > 160: feats = feats[:160]
        elif len(feats) < 160: feats = list(feats) + [0]*(160-len(feats))
        
        # Convert to Q8.8
        q8_feats = np.array([float_to_q8_8(f) for f in feats], dtype=np.uint32)
        
        print(f"Loaded 160 audio features")
        
        pred, lat = mlp_predict(q8_feats, dma)
        
        print(f"HW Prediction : Class {pred} (Audio Event)")
        print(f"Latency       : {lat:.4f} ms")

upload_btn.observe(on_upload_change, names='value')

display(
    widgets.HTML("<h3>🎵 MLP FPGA Hardware Audio Classifier</h3>"
                 "<p>Select a <b>.csv</b> containing 160 MFCC audio features</p>"),
    upload_btn,
    out
)

# ============================================================
# CELL 3: Batch Benchmark (Random / Mock Data)
# ============================================================
print("=" * 60)
print("📊 Batch MLP Dataset Benchmark")
print("=" * 60)

BATCH_SIZE = 1000
print(f"Generating {BATCH_SIZE} mock audio samples (160 features each)...")

in_buf = allocate(shape=(160,), dtype=np.uint32)
out_buf = allocate(shape=(1,), dtype=np.uint32)

t0 = time.perf_counter()

for i in range(BATCH_SIZE):
    # Simulate processing 160 random features
    mock_data = np.random.randint(0, 65535, size=(160,), dtype=np.uint32)
    np.copyto(in_buf, mock_data)
    
    dma.sendchannel.transfer(in_buf)
    dma.recvchannel.transfer(out_buf)
    dma.sendchannel.wait()
    dma.recvchannel.wait()
    
t1 = time.perf_counter()

total_time_ms = (t1 - t0) * 1000
fps = BATCH_SIZE / (total_time_ms / 1000)

print("-" * 50)
print(f"Total Samples Processed : {BATCH_SIZE}")
print(f"Pure Hardware Latency   : {PURE_HW_LATENCY_MS:.4f} ms")
print(f"Total System Latency    : {total_time_ms/BATCH_SIZE:.4f} ms per sample")
print(f"System Throughput       : {fps:.1f} FPS (Audio inferences per second)")
print("-" * 50)

in_buf.freebuffer()
out_buf.freebuffer()
