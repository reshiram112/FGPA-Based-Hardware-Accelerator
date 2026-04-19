import numpy as np
from pynq import Overlay, allocate
import time
import pandas as pd
import ipywidgets as widgets
from IPython.display import display
import io

# SVM Scaling constants (min and max for 30 features)
MINS = np.array([6.981, 9.71, 43.79, 143.5, 0.05263, 0.01938, 0.0, 0.0, 0.106, 0.04996, 
                 0.1115, 0.3602, 0.757, 6.802, 0.001713, 0.002252, 0.0, 0.0, 0.007882, 0.0008948, 
                 7.93, 12.02, 50.41, 185.2, 0.07117, 0.02729, 0.0, 0.0, 0.1565, 0.05504])
MAXS = np.array([28.11, 39.28, 188.5, 2501.0, 0.1634, 0.3454, 0.4268, 0.2012, 0.304, 0.09744, 
                 2.873, 4.885, 21.98, 542.2, 0.03113, 0.1354, 0.396, 0.05279, 0.07895, 0.02984, 
                 36.04, 49.54, 251.2, 4254.0, 0.2226, 1.058, 1.252, 0.291, 0.6638, 0.2075])
RANGES = MAXS - MINS

print("Loading SVM Hardware Accelerator...")
# NOTE: Make sure to upload the newly generated 'svm_final.bit' and '.hwh' 
# after fixing the AXI Lite bug in Vivado!
overlay = Overlay("svm_final.bit")
svm = overlay.svm_top_0
dma = overlay.axi_dma_0
print("Hardware Loaded! Please upload a patient CSV file below to run the Benchmark:")

upload_button = widgets.FileUpload(accept='.csv', multiple=False)
out = widgets.Output()

def on_upload_change(change):
    with out:
        out.clear_output()
        if not upload_button.value:
            return
            
        uploaded_file = list(upload_button.value.values())[0]
        df = pd.read_csv(io.BytesIO(bytes(uploaded_file['content'])))
        
        true_label = df['True_Diagnosis'].iloc[0] if 'True_Diagnosis' in df.columns else 'Unknown'
        raw = df.drop(columns=['True_Diagnosis']).values[0] if 'True_Diagnosis' in df.columns else df.values[0]
        
        # Scale to 0-255 uint32 to match hardware AXI stream width
        X_fpga = np.round(((raw - MINS) / RANGES) * 255).clip(0, 255).astype(np.uint32)
        
        in_buffer = allocate(shape=(30,), dtype=np.uint32)
        np.copyto(in_buffer, X_fpga)
        in_buffer.flush() # Ensure data is flushed from cache to DDR
        
        print("Running Hardware Warmup...")
        for _ in range(10):
            svm.write(0x00, 2)   # Reset first
            svm.write(0x00, 1)   # Start (TREADY goes high)
            dma.sendchannel.transfer(in_buffer)
            dma.sendchannel.wait()
            # Wait for DONE bit (bit 0 of reg 0x04)
            while (svm.read(0x04) & 1) == 0: 
                pass
            svm.write(0x00, 0)   # Clear start signal
            
        print("Running 1,000 Inferences for Benchmarking...")
        system_times = []
        
        for _ in range(1000):
            t0 = time.perf_counter()
            svm.write(0x00, 2)   # Reset
            svm.write(0x00, 1)   # Start
            dma.sendchannel.transfer(in_buffer)
            dma.sendchannel.wait()
            while (svm.read(0x04) & 1) == 0: 
                pass
            predicted_class = svm.read(0x08)
            svm.write(0x00, 0)
            system_times.append((time.perf_counter() - t0) * 1000)
            
        cycles = svm.read(0x0C)
        hw_latency_us = (cycles * 10) / 1000.0  # Assumes 100MHz clock (10ns period)
        mean_system_latency_ms = np.mean(system_times)
        throughput = 1000.0 / mean_system_latency_ms
        
        print("\n" + "="*50)
        print("  HARDWARE ACCELERATOR BENCHMARK RESULTS")
        print("="*50)
        print(f"Predicted Diagnosis   : {'MALIGNANT' if predicted_class == 1 else 'BENIGN'}")
        print(f"Actual Truth          : {true_label}")
        print("-" * 50)
        print(f"Hardware Clock Cycles : {cycles} cycles")
        print(f"Pure Hardware Latency : {hw_latency_us:.3f} us")
        print(f"Total System Latency  : {mean_system_latency_ms:.3f} ms (Includes DMA)")
        print(f"System Throughput     : {throughput:.1f} inferences/sec")
        print(f"FPGA Power Estimate   : ~2.0 Watts")
        print("="*50)
        
        in_buffer.freebuffer()
        upload_button.value.clear()

upload_button.observe(on_upload_change, names='value')
display(upload_button, out)
