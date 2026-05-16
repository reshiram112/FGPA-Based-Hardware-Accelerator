"""
SVM FPGA Accelerator - PYNQ Inference Script
=============================================
Run this as a Jupyter Notebook on your PYNQ-Z2 board.

Prerequisites:
  - svm_accelerator.bit  } Both files must be in the SAME folder
  - svm_accelerator.hwh  } as this script, with SAME base name

Steps to use:
  1. Upload svm_accelerator.bit + svm_accelerator.hwh to /home/xilinx/svm_accelerator/ on the PYNQ board
  2. Upload this file to the same folder
  3. Open Jupyter Notebook and run each cell

Fixed-point format: Q8.8 (16-bit signed, 8 integer bits, 8 fractional bits)
  - To convert float to Q8.8:  int(value * 256) & 0xFFFF
  - To convert Q8.8 to float:  value / 256.0
"""

# ============================================================
# CELL 1: Import libraries and load the bitstream onto the FPGA
# ============================================================
import numpy as np
import time
from pynq import Overlay, allocate

print("Loading bitstream onto FPGA...")
# This line flashes your .bit file onto the FPGA fabric.
# The .hwh file is automatically picked up from the same folder.
overlay = Overlay("svm_accelerator.bit")
print("Bitstream loaded successfully!")

# Access the DMA block from the overlay.
# The name 'axi_dma_0' comes from Vivado's Block Design — it's the default name.
# If you renamed your DMA in Vivado, change this accordingly.
dma = overlay.axi_dma_0
print("DMA found:", dma)


# ============================================================
# CELL 2: Helper functions for Q8.8 fixed-point conversion
# ============================================================
def float_to_q8_8(value):
    """
    Convert a floating-point number to Q8.8 fixed-point (16-bit).
    
    Q8.8 means: 8 bits for integer part, 8 bits for fractional part.
    Example: 3.5 -> 3.5 * 256 = 896 = 0x0380
    
    We send this as a 32-bit word (upper 16 bits = 0, lower 16 bits = Q8.8 value).
    """
    q = int(round(value * 256))         # Multiply by 2^8 = 256
    q = max(-32768, min(32767, q))      # Clamp to 16-bit signed range
    q = q & 0xFFFF                      # Get 16-bit representation (handles negatives)
    return np.uint32(q)                 # Return as 32-bit uint (upper bits = 0)

def features_to_q8_8_array(features):
    """
    Convert a list/array of float features to a numpy array of Q8.8 uint32 values.
    The SVM accelerator expects exactly 10 features.
    """
    assert len(features) == 10, f"SVM expects 10 features, got {len(features)}"
    return np.array([float_to_q8_8(f) for f in features], dtype=np.uint32)

print("Helper functions defined.")
print("Example: float 3.5 -> Q8.8 =", hex(float_to_q8_8(3.5)))


# ============================================================
# CELL 3: Core SVM Inference Function
# ============================================================
def svm_predict(features, dma):
    """
    Send 10 features to the SVM FPGA accelerator and get the prediction back.
    
    How this works:
    1. Allocate two DMA buffers in the PYNQ board's RAM
    2. Copy the features into the input buffer
    3. Tell the DMA to stream input buffer -> FPGA accelerator (send)
    4. Tell the DMA to stream FPGA accelerator output -> output buffer (receive)
    5. Wait for both to complete
    6. Read the result from the output buffer
    
    Args:
        features: list or numpy array of 10 floats (your SVM feature values)
        dma:      the PYNQ DMA object from the overlay
    
    Returns:
        prediction: 0 or 1 (the SVM's classification result)
        latency_ms: time taken for the inference in milliseconds
    """
    # Step 1: Allocate DMA-accessible buffers in shared RAM
    # 'allocate' creates special memory that both the CPU and the DMA can access
    input_buffer  = allocate(shape=(10,), dtype=np.uint32)  # 10 features in
    output_buffer = allocate(shape=(1,),  dtype=np.uint32)  # 1 result out

    # Step 2: Convert features to Q8.8 fixed-point and load into input buffer
    q_features = features_to_q8_8_array(features)
    np.copyto(input_buffer, q_features)
    
    # Step 3 & 4: Start DMA transfers (send and receive happen simultaneously)
    t_start = time.perf_counter()
    
    dma.sendchannel.transfer(input_buffer)    # DMA reads from RAM -> streams to FPGA
    dma.recvchannel.transfer(output_buffer)   # DMA receives from FPGA -> writes to RAM
    
    # Step 5: Wait for both channels to finish
    dma.sendchannel.wait()   # Wait until all 10 features have been sent
    dma.recvchannel.wait()   # Wait until the result has come back
    
    t_end = time.perf_counter()
    latency_ms = (t_end - t_start) * 1000
    
    # Step 6: Read the result
    prediction = int(output_buffer[0])
    
    # Free the allocated memory
    input_buffer.freebuffer()
    output_buffer.freebuffer()
    
    return prediction, latency_ms


print("SVM inference function defined.")


# ============================================================
# CELL 4: Test with a single sample
# ============================================================

# Example: Replace these 10 values with your actual test features
# These are the 10 features your SVM model was trained on (already scaled/preprocessed)
test_features = [0.5, -0.2, 0.0, 0.0, 1.0, -0.5, 0.0, 0.0, 1.0, 0.1]

print("="*50)
print("SVM FPGA Accelerator - Single Inference Test")
print("="*50)
print(f"Input features: {test_features}")
print(f"Q8.8 encoded:   {[hex(float_to_q8_8(f)) for f in test_features]}")
print()

prediction, latency = svm_predict(test_features, dma)

print(f"Prediction:  {'Class 1 (Positive)' if prediction == 1 else 'Class 0 (Negative)'}")
print(f"Raw output:  {prediction}")
print(f"Latency:     {latency:.4f} ms")


# ============================================================
# CELL 5: Benchmark — run 100 inferences and measure performance
# ============================================================

print("="*50)
print("Benchmark: 100 Inferences")
print("="*50)

N = 100
latencies = []

# Generate 100 random test samples for benchmarking
test_samples = np.random.uniform(-1.0, 1.0, size=(N, 10))

for i in range(N):
    features = test_samples[i].tolist()
    pred, lat = svm_predict(features, dma)
    latencies.append(lat)

latencies = np.array(latencies)

print(f"Total samples:       {N}")
print(f"Average latency:     {latencies.mean():.4f} ms")
print(f"Min latency:         {latencies.min():.4f} ms")
print(f"Max latency:         {latencies.max():.4f} ms")
print(f"Throughput:          {1000 / latencies.mean():.1f} inferences/second")


# ============================================================
# CELL 6: Classify data from a CSV file
# ============================================================
import pandas as pd
import io

# We will read the lane_samples.csv directly
csv_path = "lane_samples.csv"
print(f"Reading data from {csv_path}...")

try:
    df = pd.read_csv(csv_path)
    print(f"Successfully loaded {len(df)} samples.")
    
    # The CSV has 5 features: v_Vel, v_Acc, Space_Headway, Time_Headway, Local_Y
    # But our SVM hardware was compiled to expect exactly 10 features!
    # So we will extract the 5 features, and pad the remaining 5 with zeros.
    
    # Assume the last column is 'label' and everything before is features
    feature_cols = [c for c in df.columns if c.lower() != 'label']
    X_raw = df[feature_cols].values
    
    if 'label' in df.columns:
        y_true = df['label'].values
    else:
        y_true = None
        
    correct = 0
    total = len(X_raw)
    
    print("-" * 60)
    print(f"{'Sample':<8} | {'Hardware Prediction':<20} | {'Actual Label':<15}")
    print("-" * 60)
    
    for i in range(total):
        # Extract features for this row
        features = X_raw[i].tolist()
        
        # Pad to 10 features with zeros if necessary
        if len(features) < 10:
            features = features + [0.0] * (10 - len(features))
        elif len(features) > 10:
            features = features[:10] # Truncate if too long
            
        # Run Hardware Inference!
        pred, lat = svm_predict(features, dma)
        
        # Map prediction to text
        pred_text = "Class 1 (Lane Change)" if pred == 1 else "Class 0 (Keep Lane)"
        
        # Print row result
        if y_true is not None:
            actual = y_true[i]
            actual_text = "Class 1" if actual == 1 else "Class 0"
            match = "✅" if pred == actual else "❌"
            print(f"Row {i:<4} | {pred_text:<20} | {actual_text:<10} {match}")
            if pred == actual:
                correct += 1
        else:
            print(f"Row {i:<4} | {pred_text:<20} | Unknown")

    print("-" * 60)
    if y_true is not None:
        accuracy = (correct / total) * 100
        print(f"Total Hardware Accuracy: {accuracy:.2f}% ({correct}/{total})")
        
except FileNotFoundError:
    print(f"Error: {csv_path} not found.")
    print("Please upload 'lane_samples.csv' to the same Jupyter folder and run this cell again.")


# ============================================================
# CELL 7: Interactive UI — Auto-triggers on file upload
# ============================================================
import ipywidgets as widgets
from IPython.display import display
import io
import pandas as pd

print("=" * 60)
print("  🚗 SVM Hardware Classifier — Upload your CSV below")
print("=" * 60)

upload_btn = widgets.FileUpload(
    accept='.csv',
    multiple=False,
    description='📂 Upload CSV',
    layout=widgets.Layout(width='200px')
)

out = widgets.Output()

def on_upload_change(change):
    """This fires automatically the moment a file is selected."""
    with out:
        out.clear_output()

        # --- Read the uploaded file ---
        uploaded_file = list(upload_btn.value.values())[0]
        content = uploaded_file['content']

        try:
            df = pd.read_csv(io.BytesIO(content))
        except Exception as e:
            print(f"❌ Could not read CSV: {e}")
            return

        print(f"✅ Loaded {len(df)} samples from uploaded file.")
        print(f"   Columns detected: {list(df.columns)}\n")

        # Separate features from label
        feature_cols = [c for c in df.columns if c.lower() != 'label']
        X_raw = df[feature_cols].values
        y_true = df['label'].values if 'label' in df.columns else None

        correct = 0
        total = len(X_raw)

        print("-" * 55)
        print(f"{'#':<4} | {'HW Prediction':<22} | {'Actual':<12} | {'Latency'}")
        print("-" * 55)

        for i in range(total):
            features = X_raw[i].tolist()

            # Pad or trim to exactly 10 features for the SVM hardware
            if len(features) < 10:
                features = features + [0.0] * (10 - len(features))
            else:
                features = features[:10]

            # *** Run on FPGA Hardware ***
            pred, lat_ms = svm_predict(features, dma)

            pred_text = "🚗 Lane Change" if pred == 1 else "➡️  Keep Lane"

            if y_true is not None:
                actual_text = "Lane Change" if y_true[i] == 1 else "Keep Lane"
                match = "✅" if pred == int(y_true[i]) else "❌"
                print(f"{i:<4} | {pred_text:<22} | {actual_text:<12} | {lat_ms:.3f} ms {match}")
                if pred == int(y_true[i]):
                    correct += 1
            else:
                print(f"{i:<4} | {pred_text:<22} | {'N/A':<12} | {lat_ms:.3f} ms")

        print("-" * 55)

        if y_true is not None:
            accuracy = (correct / total) * 100
            print(f"\n🎯 Hardware Accuracy: {accuracy:.1f}%  ({correct}/{total} correct)")

        # Reset upload widget so user can upload again
        upload_btn.value.clear()

# Trigger automatically when file is selected — no extra button needed!
upload_btn.observe(on_upload_change, names='value')

display(
    widgets.HTML("<h3>🚗 SVM FPGA Hardware Classifier</h3>"
                 "<p>Select a <b>.csv</b> file with columns: "
                 "<code>v_Vel, v_Acc, Space_Headway, Time_Headway, Local_Y, label</code></p>"),
    upload_btn,
    out
)


# ============================================================
# CELL 8: High-Throughput Loop Benchmark (Random Data)
# ============================================================
print("=" * 60)
print("🚀 High-Throughput SVM Benchmark (1000 inferences)")
print("=" * 60)

BATCH_SIZE = 1000

in_buf_batch = allocate(shape=(10,), dtype=np.uint32)
out_buf_batch = allocate(shape=(1,), dtype=np.uint32)

print(f"Running {BATCH_SIZE} back-to-back SVM inferences...")

# SVM has 2645 support vectors. Pure HW Latency is ~5290 clock cycles.
# At 100MHz (10ns per cycle), pure HW latency = 0.0529 ms per inference.
PURE_HW_LATENCY_MS = 0.0529 

t0 = time.perf_counter()

for _ in range(BATCH_SIZE):
    dma.sendchannel.transfer(in_buf_batch)
    dma.recvchannel.transfer(out_buf_batch)
    dma.sendchannel.wait()
    dma.recvchannel.wait()

t1 = time.perf_counter()

total_time_ms = (t1 - t0) * 1000
time_per_image_ms = total_time_ms / BATCH_SIZE
fps = BATCH_SIZE / (total_time_ms / 1000)

print("-" * 50)
print(f"Pure Hardware Latency (Theoretical): {PURE_HW_LATENCY_MS:.4f} ms")
print(f"Total System Latency (inc. DMA)    : {time_per_image_ms:.4f} ms")
print(f"System Throughput                  : {fps:.1f} Inferences/Second")
print("-" * 50)

in_buf_batch.freebuffer()
out_buf_batch.freebuffer()


# ============================================================
# CELL 9: Batch SVM Benchmark from CSV
# ============================================================
print("=" * 60)
print("📊 Batch SVM Dataset Benchmark")
print("=" * 60)

# You can change this to mixed_batch_35.csv or large_batch_1000.csv
csv_batch_path = "mixed_batch_35.csv"
print(f"Loading packed features from {csv_batch_path}...")

try:
    df_batch = pd.read_csv(csv_batch_path)
    num_samples = len(df_batch)
    print(f"✅ Successfully loaded {num_samples} samples!")
    
    # Preprocess everything into a python list of uint32 features
    feature_cols = [c for c in df_batch.columns if c.lower() != 'label']
    X_raw = df_batch[feature_cols].values
    y_true = df_batch['label'].values if 'label' in df_batch.columns else None
    
    # Convert all features to Q8.8 in advance to speed up the loop
    q8_features_list = []
    for row in X_raw:
        feats = row.tolist()
        if len(feats) < 10: feats = feats + [0.0] * (10 - len(feats))
        else: feats = feats[:10]
        q8_features = [float_to_q8_8(f) for f in feats]
        q8_features_list.append(np.array(q8_features, dtype=np.uint32))
    
    in_buf = allocate(shape=(10,), dtype=np.uint32)
    out_buf = allocate(shape=(1,), dtype=np.uint32)
    
    print(f"🚀 Processing {num_samples} mixed-class samples through hardware...")
    
    correct = 0
    class_0_count = 0
    class_1_count = 0
    
    t0 = time.perf_counter()
    
    for i in range(num_samples):
        np.copyto(in_buf, q8_features_list[i])
        
        dma.sendchannel.transfer(in_buf)
        dma.recvchannel.transfer(out_buf)
        dma.sendchannel.wait()
        dma.recvchannel.wait()
        
        pred = int(out_buf[0])
        
        if pred == 0: class_0_count += 1
        else: class_1_count += 1
        
        if y_true is not None and pred == int(y_true[i]):
            correct += 1
    
    t1 = time.perf_counter()
    
    total_time_ms = (t1 - t0) * 1000
    fps = num_samples / (total_time_ms / 1000)
    
    print("-" * 50)
    print(f"Classification Results  : {class_0_count} Keep Lane | {class_1_count} Lane Change")
    if y_true is not None:
        print(f"Hardware Accuracy       : {(correct/num_samples)*100:.1f}% ({correct}/{num_samples})")
    print(f"Pure Hardware Latency   : {PURE_HW_LATENCY_MS:.4f} ms")
    print(f"Total System Latency    : {total_time_ms/num_samples:.4f} ms per sample")
    print(f"System Throughput       : {fps:.1f} FPS")
    print("-" * 50)
    
    in_buf.freebuffer()
    out_buf.freebuffer()
    
except FileNotFoundError:
    print(f"❌ Error: {csv_batch_path} not found.")
    print("Please upload the CSV to this folder and try again.")
