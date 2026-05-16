"""
CNN FPGA/CPU Co-Design Inference Script
=============================================
Run this as a Jupyter Notebook on your PYNQ-Z2 board.

Traffic Sign Classifier (43 Classes)
Hardware: Conv1, Pool1, Conv2, Pool2
Software: FC1, FC2
"""

import numpy as np
import time
from pynq import Overlay, allocate
import ipywidgets as widgets
from IPython.display import display
import io
from PIL import Image
import matplotlib.pyplot as plt
from collections import Counter

# ============================================================
# CELL 1: Load Bitstream & Functions
# ============================================================
print("Loading CNN bitstream onto FPGA...")
overlay = Overlay("cnn_accelerator.bit")
dma = overlay.axi_dma_0
print("✅ Bitstream loaded successfully!")

print("Loading FC Weights for CPU...")
fc_data = np.load("fc_weights.npz")
fc1_w, fc1_b = fc_data['fc1_w'], fc_data['fc1_b']
fc2_w, fc2_b = fc_data['fc2_w'], fc_data['fc2_b']
print("✅ FC weights loaded!")

# Mapping all 43 GTSRB class IDs to names
CLASS_NAMES = {
    0: "Speed limit (20km/h)", 1: "Speed limit (30km/h)", 2: "Speed limit (50km/h)", 
    3: "Speed limit (60km/h)", 4: "Speed limit (70km/h)", 5: "Speed limit (80km/h)", 
    6: "End of speed limit (80km/h)", 7: "Speed limit (100km/h)", 8: "Speed limit (120km/h)", 
    9: "No passing", 10: "No passing for heavy vehicles", 11: "Right-of-way at intersection", 
    12: "Priority road", 13: "Yield", 14: "Stop", 15: "No vehicles", 
    16: "Vehicles over 3.5 tons prohibited", 17: "No entry", 18: "General caution", 
    19: "Dangerous curve to the left", 20: "Dangerous curve to the right", 21: "Double curve", 
    22: "Bumpy road", 23: "Slippery road", 24: "Road narrows on the right", 
    25: "Road work", 26: "Traffic signals", 27: "Pedestrians", 28: "Children crossing", 
    29: "Bicycles crossing", 30: "Beware of ice/snow", 31: "Wild animals crossing", 
    32: "End of all speed and passing limits", 33: "Turn right ahead", 34: "Turn left ahead", 
    35: "Ahead only", 36: "Go straight or right", 37: "Go straight or left", 
    38: "Keep right", 39: "Keep left", 40: "Roundabout mandatory", 
    41: "End of no passing", 42: "End of no passing by vehicles over 3.5 metric tons"
}

_folders = [str(i) for i in range(43)]
_folders.sort()

# Map PyTorch output index -> True Class Name
GTSRB_CLASSES = [CLASS_NAMES[int(f)] for f in _folders]

def get_class_name(class_id):
    if class_id < len(GTSRB_CLASSES):
        return GTSRB_CLASSES[class_id]
    return f"Class {class_id}"

def cnn_predict(image_data_q8, dma):
    # Hardware buffers
    in_buf = allocate(shape=(3072,), dtype=np.uint32)
    out_buf = allocate(shape=(2048,), dtype=np.uint32) # Pool2 outputs 2048 values
    
    np.copyto(in_buf, image_data_q8)
    in_buf.flush() # CRITICAL: Push CPU cache to DDR RAM
    
    # 1. Hardware Execution (Convolutions)
    t0_hw = time.perf_counter()
    dma.sendchannel.transfer(in_buf)
    dma.recvchannel.transfer(out_buf)
    dma.sendchannel.wait()
    dma.recvchannel.wait()
    t1_hw = time.perf_counter()
    
    out_buf.invalidate() # CRITICAL: Pull DDR RAM to CPU cache
    
    # Convert Q8.8 back to float
    hw_features = np.array(out_buf, dtype=np.int16).astype(np.float32) / 256.0
    
    # 2. Software Execution (Fully Connected)
    t0_sw = time.perf_counter()
    fc1_out = np.maximum(0, np.dot(hw_features, fc1_w.T) + fc1_b) # ReLU
    fc2_out = np.dot(fc1_out, fc2_w.T) + fc2_b
    prediction = int(np.argmax(fc2_out))
    t1_sw = time.perf_counter()
    
    in_buf.freebuffer()
    out_buf.freebuffer()
    
    hw_latency = (t1_hw - t0_hw) * 1000
    sw_latency = (t1_sw - t0_sw) * 1000
    total_latency = hw_latency + sw_latency
    
    return prediction, hw_latency, total_latency

print("Functions ready. Run next cell for UI.")

# ============================================================
# CELL 2: Interactive Upload UI
# ============================================================
print("=" * 60)
print("  🚦 CNN Co-Design Classifier — Upload Traffic Sign")
print("=" * 60)

upload_btn = widgets.FileUpload(
    accept='image/*', 
    multiple=False,
    description='📂 Upload Image',
    layout=widgets.Layout(width='200px')
)
out = widgets.Output()

def on_upload_change(change):
    with out:
        out.clear_output()
        uploaded_file = list(upload_btn.value.values())[0]
        image_bytes = uploaded_file['content']
        
        try:
            # Load and resize image to 32x32 RGB
            img = Image.open(io.BytesIO(image_bytes)).convert('RGB')
            img_resized = img.resize((32, 32))
            img_arr = np.array(img_resized) / 255.0
            
            # 1. Normalize like PyTorch: (img - 0.5) / 0.5
            img_norm = (img_arr - 0.5) / 0.5
            
            # 2. Transpose from (H, W, C) to (C, H, W)
            img_chw = np.transpose(img_norm, (2, 0, 1))
            
            # 3. Convert to Q8.8
            q8_img = [int(v * 256) & 0xFFFF for v in img_chw.flatten()]
            q8_img = np.array(q8_img, dtype=np.uint32)
            
            print("⏳ Running Co-Design Inference...")
            
            pred, hw_lat, tot_lat = cnn_predict(q8_img, dma)
            
            print("-" * 50)
            print(f"Prediction       : {get_class_name(pred)}")
            print(f"FPGA Latency     : {hw_lat:.4f} ms")
            print(f"Total HW Latency : {tot_lat:.4f} ms")
            print("-" * 50)
            
            # Visualize what the FPGA "saw"
            plt.figure(figsize=(2, 2))
            plt.imshow(img_arr)  # Show the original 0-1 image for visualization
            plt.title("Input Image (32x32)")
            plt.axis('off')
            plt.show()
            
        except Exception as e:
            print(f"❌ Error processing image: {e}")
            
        upload_btn.value.clear()

upload_btn.observe(on_upload_change, names='value')

display(
    widgets.HTML("<h3>🚦 CNN Hardware-Software Co-Design</h3>"
                 "<p>Select a <b>Traffic Sign Image</b>. The FPGA performs Convolution, Python performs FC layers.</p>"),
    upload_btn,
    out
)

# ============================================================
# CELL 3: Batch Benchmark (Real Dataset)
# ============================================================
print("=" * 60)
print("📊 Batch CNN Dataset Benchmark")
print("=" * 60)

npy_path = "cnn_benchmark_data.npy"
print(f"Loading packed images from {npy_path}...")

try:
    dataset = np.load(npy_path)
    num_images = len(dataset) // 3072
    print(f"✅ Successfully loaded {num_images} images!")
    
    in_buf = allocate(shape=(3072,), dtype=np.uint32)
    out_buf = allocate(shape=(2048,), dtype=np.uint32)
    
    t0 = time.perf_counter()
    total_hw_time = 0
    
    predictions = []
    
    for i in range(num_images):
        np.copyto(in_buf, dataset[i*3072 : (i+1)*3072])
        in_buf.flush() # CRITICAL: Push CPU cache to DDR RAM
        
        # HW execution
        h0 = time.perf_counter()
        dma.sendchannel.transfer(in_buf)
        dma.recvchannel.transfer(out_buf)
        dma.sendchannel.wait()
        dma.recvchannel.wait()
        h1 = time.perf_counter()
        total_hw_time += (h1 - h0)
        
        out_buf.invalidate() # CRITICAL: Pull DDR RAM to CPU cache
        
        # SW execution
        hw_features = np.array(out_buf, dtype=np.int16).astype(np.float32) / 256.0
        fc1_out = np.maximum(0, np.dot(hw_features, fc1_w.T) + fc1_b)
        fc2_out = np.dot(fc1_out, fc2_w.T) + fc2_b
        predictions.append(int(np.argmax(fc2_out)))
        
    t1 = time.perf_counter()
    
    total_time_ms = (t1 - t0) * 1000
    fps = num_images / (total_time_ms / 1000)
    
    # Calculate classification stats
    counts = Counter(predictions)
    
    print("-" * 50)
    print("CLASSIFICATION RESULTS:")
    for class_id, count in counts.items():
        print(f"  - {get_class_name(class_id)} : {count} images")
    
    print("\nPERFORMANCE METRICS:")
    print(f"Total Images Processed  : {num_images}")
    print(f"Latency per image       : {total_time_ms/num_images:.4f} ms")
    print(f"Throughput              : {fps:.1f} FPS")
    print(f"Pure FPGA Batch Latency : {total_hw_time * 1000:.4f} ms")
    print("-" * 50)
    
    in_buf.freebuffer()
    out_buf.freebuffer()
    
except FileNotFoundError:
    print(f"❌ Error: {npy_path} not found.")
    print("Please make sure cnn_benchmark_data.npy is uploaded.")
