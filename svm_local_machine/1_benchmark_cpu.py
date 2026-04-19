import sys
import os
import time
import psutil
import pandas as pd
import numpy as np
import joblib
import tkinter as tk
from tkinter import filedialog

def select_patient():
    root = tk.Tk()
    root.withdraw()
    print("Opening file dialog... Please select a patient CSV record.")
    current_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = filedialog.askopenfilename(
        initialdir=current_dir,
        title="Select a Patient CSV for Diagnosis",
        filetypes=[("CSV files", "*.csv"), ("All files", "*.*")]
    )
    return file_path

def benchmark_cpu(csv_path):
    print("=" * 50)
    print("  🚀 CPU SOFTWARE BENCHMARK (SVM) 🚀")
    print("=" * 50)

    if not os.path.exists(csv_path):
        print(f"[ERROR] Patient record '{csv_path}' not found.")
        sys.exit(1)

    # 1. Load Model and Scaler
    current_dir = os.path.dirname(os.path.abspath(__file__))
    model_path = os.path.join(current_dir, "svm_model.pkl")
    scaler_path = os.path.join(current_dir, "scaler.pkl")
    
    if not os.path.exists(model_path) or not os.path.exists(scaler_path):
        print("[ERROR] Model weights not found. Run training script first.")
        sys.exit(1)

    print("Loading Linear SVM model...")
    svm = joblib.load(model_path)
    scaler = joblib.load(scaler_path)

    # 2. Prepare Data
    print(f"Loading patient data from '{os.path.basename(csv_path)}'...")
    df = pd.read_csv(csv_path)
    
    true_label = df['True_Diagnosis'].iloc[0] if 'True_Diagnosis' in df.columns else "Unknown"
    
    # Drop true diagnosis column to get just the features
    if 'True_Diagnosis' in df.columns:
        features = df.drop(columns=['True_Diagnosis']).values
    else:
        features = df.values

    # Scale the features
    X_scaled = scaler.transform(features)

    # 3. Warmup
    print("Running Warmup...")
    for _ in range(10):
        _ = svm.predict(X_scaled)
            
    # 4. Measure Latency
    print("Running 1,000 Inferences for Benchmarking...")
    system_times = []
    
    psutil.cpu_percent(interval=None)
    
    for _ in range(1000):
        t0 = time.perf_counter()
        output = svm.predict(X_scaled)
        system_times.append((time.perf_counter() - t0) * 1000) # ms

    cpu_percent = psutil.cpu_percent(interval=None)
    ram_usage_mb = psutil.Process(os.getpid()).memory_info().rss / (1024 * 1024)

    prediction = output[0]
    diagnosis = "Malignant (Danger)" if prediction == 1 else "Benign (Safe)"

    mean_system_latency_ms = np.mean(system_times)
    throughput_fps = 1000.0 / mean_system_latency_ms
    
    estimated_power = "15.0 - 45.0 Watts (Typical Laptop CPU)"

    print("\n" + "="*50)
    print("  🚀 CPU BENCHMARK RESULTS 🚀")
    print("="*50)
    print(f"Predicted Diagnosis   : {diagnosis}")
    print(f"Actual Truth          : {true_label}")
    print("-" * 50)
    print(f"Hardware Clock Cycles : N/A (CPU lacks direct gate-level counter)")
    print(f"Pure Hardware Latency : N/A")
    print(f"Total System Latency  : {mean_system_latency_ms:.5f} ms (Pure CPU Execution)")
    print(f"System Throughput     : {throughput_fps:.1f} inferences/second")
    print("-" * 50)
    print(f"CPU Utilization       : {cpu_percent:.1f}%")
    print(f"RAM Usage             : {ram_usage_mb:.1f} MB")
    print(f"Estimated Power Draw  : ~{estimated_power}")
    print("="*50)

if __name__ == "__main__":
    csv_to_test = None
    if len(sys.argv) > 1:
        csv_to_test = sys.argv[1]
    else:
        csv_to_test = select_patient()
        
    if not csv_to_test:
        print("No file selected. Exiting.")
        sys.exit(0)
        
    benchmark_cpu(csv_to_test)
