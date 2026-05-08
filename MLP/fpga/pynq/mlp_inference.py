import numpy as np
from pynq import Overlay, allocate
import time

# Constants for the MLP model (matching HLS implementation)
L0 = 784
L1 = 512
L2 = 256
L3 = 128
L4 = 10
SCALE = 1024.0 # Q6.10 format

def run_mlp_inference():
    # 1. Load the Overlay
    print("Loading MLP Overlay...")
    ol = Overlay("mlp_system.bit")
    dma = ol.axi_dma_0
    mlp = ol.mlp_top_0

    # 2. Load Weights
    print("Loading Weights...")
    with open("mlp_weights.bin", "rb") as f:
        weights = np.frombuffer(f.read(), dtype=np.int16)
    
    # 3. Prepare Buffers
    # Total transfer size: Input (784) + Weights (567946)
    # Weights size calc: (512*784 + 512) + (256*512 + 256) + (128*256 + 128) + (10*128 + 10) = 567946
    transfer_size = L0 + len(weights)
    in_buf = allocate(shape=(transfer_size,), dtype=np.int16)
    out_buf = allocate(shape=(L4,), dtype=np.int16)

    # Pre-load weights into the buffer (offset by input size)
    in_buf[L0:] = weights

    # 4. Create dummy input (example)
    # In a real scenario, you would put your normalized 784-pixel image here
    dummy_input = np.random.uniform(-1, 1, L0)
    in_buf[:L0] = np.clip(np.round(dummy_input * SCALE), -32768, 32767).astype(np.int16)

    # 5. Run Inference
    print("Starting Inference...")
    start_time = time.time()
    
    # Start HLS IP
    mlp.write(0x00, 1) # Start bit
    
    # Send Input + Weights
    dma.sendchannel.transfer(in_buf)
    # Receive Logits
    dma.recvchannel.transfer(out_buf)
    
    # Wait for completion
    dma.sendchannel.wait()
    dma.recvchannel.wait()
    
    end_time = time.time()
    
    # 6. Process Output
    logits = out_buf[:].astype(np.float32) / SCALE
    prediction = np.argmax(logits)
    
    print(f"Inference complete in {end_time - start_time:.6f} seconds")
    print(f"Logits: {logits}")
    print(f"Prediction: {prediction}")

if __name__ == "__main__":
    run_mlp_inference()
