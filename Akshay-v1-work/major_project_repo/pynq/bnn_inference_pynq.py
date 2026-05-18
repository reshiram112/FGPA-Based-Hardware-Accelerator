"""
BNN FPGA Accelerator - PYNQ Inference Script
=============================================
Run this as a Jupyter Notebook on your PYNQ-Z2 board.

Prerequisites:
  - bnn_accelerator.bit  } Both files must be in the SAME folder
  - bnn_accelerator.hwh  } as this script, with SAME base name
"""

# ============================================================
# CELL 1: Setup & Functions
# ============================================================
import numpy as np
import time
import cv2
import io
import ipywidgets as widgets
from IPython.display import display
from PIL import Image
from pynq import Overlay, allocate

print("Loading BNN bitstream onto FPGA...")
overlay = Overlay("bnn_accelerator.bit")
dma = overlay.axi_dma_0
print("✅ Bitstream loaded successfully!")


def pack_image_to_words(img_bin):
    """
    Packs a 64x32 binary image (0 or 255) into 64 uint32 words.
    Each row of 32 pixels becomes one 32-bit integer.
    """
    packed_words = []
    for row in range(64):
        word = 0
        for col in range(32):
            if img_bin[row, col] > 128:
                word |= (1 << col)
        packed_words.append(word)
    return np.array(packed_words, dtype=np.uint32)


def bnn_predict(packed_features, dma):
    """
    Sends the 64 words to the FPGA and receives the 1-word prediction.
    """
    in_buffer = allocate(shape=(64,), dtype=np.uint32)
    out_buffer = allocate(shape=(1,), dtype=np.uint32)
    
    np.copyto(in_buffer, packed_features)
    
    t_start = time.perf_counter()
    
    # Start DMA transfers
    dma.sendchannel.transfer(in_buffer)
    dma.recvchannel.transfer(out_buffer)
    
    # Wait for completion
    dma.sendchannel.wait()
    dma.recvchannel.wait()
    
    t_end = time.perf_counter()
    
    prediction = int(out_buffer[0])
    latency_ms = (t_end - t_start) * 1000
    
    in_buffer.freebuffer()
    out_buffer.freebuffer()
    
    return prediction, latency_ms

print("Functions defined! Run the next cell for the UI.")


# ============================================================
# CELL 2: Interactive Pothole Detection UI
# ============================================================
print("=" * 60)
print("  🕳️ BNN Hardware Classifier — Upload Pothole Image")
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
            # Load and preprocess the image
            image = Image.open(io.BytesIO(image_bytes)).convert('L')
            img = np.array(image)
            
            # Resize to exactly 32 (width) x 64 (height) pixels
            img_resized = cv2.resize(img, (32, 64))
            
            # Binarize the image (Threshold at 127)
            _, img_bin = cv2.threshold(img_resized, 127, 255, cv2.THRESH_BINARY)
            
            # Pack pixels into 64 words (32-bits each)
            packed_features = pack_image_to_words(img_bin)
            
            print("⏳ Running Hardware Inference...")
            
            # Run on FPGA!
            pred, lat_ms = bnn_predict(packed_features, dma)
            
            pred_text = "⚠️ POTHOLE DETECTED!" if pred == 1 else "✅ CLEAR ROAD"
            
            print("-" * 50)
            print(f"FPGA Prediction : {pred_text}")
            print(f"Hardware Latency: {lat_ms:.3f} ms")
            print("-" * 50)
            
            # Display the binarized image that the FPGA "saw"
            import matplotlib.pyplot as plt
            plt.figure(figsize=(2, 4))
            plt.imshow(img_bin, cmap='gray')
            plt.title("Binarized Input")
            plt.axis('off')
            plt.show()
            
        except Exception as e:
            print(f"❌ Error processing image: {e}")
            
        upload_btn.value.clear()

upload_btn.observe(on_upload_change, names='value')

display(
    widgets.HTML("<h3>🕳️ BNN FPGA Pothole Detector</h3>"
                 "<p>Upload an image. The FPGA will convert it to 32x64 binarized pixels and classify it.</p>"),
    upload_btn,
    out
)


# ============================================================
# CELL 3: High-Throughput Loop Benchmark
# ============================================================
print("=" * 60)
print("🚀 High-Throughput Benchmark (1000 inferences)")
print("=" * 60)

BATCH_SIZE = 1000

in_buffer_batch = allocate(shape=(64,), dtype=np.uint32)
out_buffer_batch = allocate(shape=(1,), dtype=np.uint32)

print(f"Running {BATCH_SIZE} back-to-back hardware inferences...")

t0 = time.perf_counter()

# We must loop because the FPGA sends a TLAST (End of Packet) signal 
# after EVERY image. If we send all 1000 at once, the DMA gets confused!
for _ in range(BATCH_SIZE):
    dma.sendchannel.transfer(in_buffer_batch)
    dma.recvchannel.transfer(out_buffer_batch)
    dma.sendchannel.wait()
    dma.recvchannel.wait()

t1 = time.perf_counter()

total_time_ms = (t1 - t0) * 1000
time_per_image_ms = total_time_ms / BATCH_SIZE
fps = BATCH_SIZE / (total_time_ms / 1000)

print("-" * 50)
print(f"Total time for {BATCH_SIZE} images : {total_time_ms:.2f} ms")
print(f"Effective Latency per image: {time_per_image_ms:.4f} ms")
print(f"System Throughput          : {fps:.1f} FPS (Frames Per Second)")
print("-" * 50)

in_buffer_batch.freebuffer()
out_buffer_batch.freebuffer()


# ============================================================
# CELL 4: Real Dataset Benchmark (1000 Images)
# ============================================================
print("=" * 60)
print("📸 Real Dataset Benchmarking (1000 Images)")
print("=" * 60)

npy_path = "bnn_benchmark_data.npy"
print(f"Loading packed images from {npy_path}...")

try:
    dataset = np.load(npy_path)
    num_images = len(dataset) // 64
    print(f"✅ Successfully loaded {num_images} images!")
    
    in_buf = allocate(shape=(64,), dtype=np.uint32)
    out_buf = allocate(shape=(1,), dtype=np.uint32)
    
    print(f"🚀 Processing {num_images} images sequentially through hardware...")
    
    t0 = time.perf_counter()
    potholes_found = 0
    
    for i in range(num_images):
        # Copy 1 image (64 words) into the DMA buffer
        np.copyto(in_buf, dataset[i*64 : (i+1)*64])
        
        dma.sendchannel.transfer(in_buf)
        dma.recvchannel.transfer(out_buf)
        dma.sendchannel.wait()
        dma.recvchannel.wait()
        
        potholes_found += int(out_buf[0])
    
    t1 = time.perf_counter()
    
    total_time_ms = (t1 - t0) * 1000
    fps = num_images / (total_time_ms / 1000)
    
    print("-" * 50)
    print(f"Classification Results     : {potholes_found} Potholes Detected")
    print(f"Total time for {num_images} images: {total_time_ms:.2f} ms")
    print(f"System Throughput          : {fps:.1f} FPS (Frames Per Second)")
    print("-" * 50)
    
    in_buf.freebuffer()
    out_buf.freebuffer()
    
except FileNotFoundError:
    print(f"❌ Error: {npy_path} not found.")
    print("Please upload 'bnn_benchmark_data.npy' to this folder and try again.")
