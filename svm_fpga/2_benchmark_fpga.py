import time
import os
import sys
import numpy as np
import pandas as pd
from pynq import Overlay, allocate

# Zero-dependency scaler: load raw min/max from the config file
# (no joblib or scikit-learn needed on the PYNQ board!)
sys.path.insert(0, "../svm_local_machine")
from scaler_config import MINS, MAXS

MINS   = np.array(MINS)
MAXS   = np.array(MAXS)
RANGES = MAXS - MINS

def scale_features(raw_features):
    """Reproduces MinMaxScaler.transform() without scikit-learn."""
    return (raw_features - MINS) / RANGES

print("="*50)
print("  FPGA HARDWARE BENCHMARK (SVM)")
print("="*50)

# 1. Load Bitstream
print("Loading Bitstream into FPGA...")
overlay = Overlay("svm_final.bit")
dma     = overlay.axi_dma_0
svm_ip  = overlay.svm_top_0
print("  Bitstream loaded OK!")

# 2. Prepare Data
csv_path = "../svm_local_machine/patient_record_1.csv"
print(f"Loading patient data from '{csv_path}'...")

if not os.path.exists(csv_path):
    print("ERROR: Patient CSV file not found!")
    sys.exit(1)

df = pd.read_csv(csv_path)

true_label = df['True_Diagnosis'].iloc[0] if 'True_Diagnosis' in df.columns else "Unknown"
raw = df.drop(columns=['True_Diagnosis']).values if 'True_Diagnosis' in df.columns else df.values

# Scale using our zero-dependency function
X_scaled = scale_features(raw[0])

# Convert to 0-255 integers (matches what the hardware expects)
X_fpga = np.round(X_scaled * 255.0).clip(0, 255).astype(np.uint32)

print(f"  Patient features loaded  : {len(X_fpga)} features")
print(f"  True Diagnosis           : {true_label}")

# 3. Allocate DMA Buffer
in_buffer = allocate(shape=(30,), dtype=np.uint32)
np.copyto(in_buffer, X_fpga)

# 4. Run Hardware Benchmark (1000 iterations)
print("\nRunning 1000 Hardware Inferences...")
hardware_times = []

for i in range(1000):
    t0 = time.perf_counter()

    # Reset, then start the SVM IP
    svm_ip.write(0x00, 0b10)  # bit1 = reset
    svm_ip.write(0x00, 0b01)  # bit0 = start

    # Stream the 30 features via DMA
    dma.sendchannel.transfer(in_buffer)
    dma.sendchannel.wait()

    # Wait until the IP signals DONE (status bit0 = 1)
    timeout = 100000
    while (svm_ip.read(0x04) & 0x1) == 0 and timeout > 0:
        timeout -= 1

    hardware_times.append((time.perf_counter() - t0) * 1000)  # ms

# 5. Read Results
prediction   = svm_ip.read(0x08)
clock_cycles = svm_ip.read(0x0C)
svm_ip.write(0x00, 0)  # Clear start

diagnosis = "MALIGNANT" if prediction == 1 else "BENIGN"

# Stats
mean_latency_ms = np.mean(hardware_times)
min_latency_ms  = np.min(hardware_times)
throughput      = 1000.0 / mean_latency_ms  # inferences/second

# FPGA clock = 100 MHz -> 1 cycle = 10 ns
pure_hw_us = clock_cycles * 0.01  # microseconds

print("\n" + "="*50)
print("  FPGA BENCHMARK RESULTS")
print("="*50)
print(f"  Predicted Diagnosis   : {diagnosis}")
print(f"  Actual Truth          : {true_label}")
print("-"*50)
print(f"  Hardware Clock Cycles : {clock_cycles} cycles")
print(f"  Pure HW Compute Time  : {pure_hw_us:.4f} us  ({pure_hw_us*1000:.4f} ns)")
print(f"  Mean System Latency   : {mean_latency_ms:.5f} ms (incl. DMA + Python)")
print(f"  Min System Latency    : {min_latency_ms:.5f} ms")
print(f"  System Throughput     : {throughput:.1f} inferences/sec")
print("-"*50)
print(f"  Board Power Draw      : ~2.0 Watts (Extremely Efficient!)")
print("="*50)
