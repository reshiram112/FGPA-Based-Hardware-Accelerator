import json
import copy

def update_notebook(path, prefix):
    with open(path, "r", encoding="utf-8") as f:
        nb = json.load(f)

    # Find the indices
    import_cell_idx = -1
    preprocess_cell_idx = -1
    for i, cell in enumerate(nb["cells"]):
        src = "".join(cell.get("source", []))
        if "import numpy as np" in src and "import time" in src:
            import_cell_idx = i
        if "def preprocess(" in src:
            preprocess_cell_idx = i
            
    # Update imports
    imports = [
        "import numpy as np\n",
        "from pynq import Overlay, allocate\n",
        "import pynq.lib.dma\n",
        "import time\n",
        "import cv2\n",
        "import matplotlib.pyplot as plt\n",
        "import ipywidgets as widgets\n",
        "from IPython.display import display\n",
        "import io\n",
        "from PIL import Image\n"
    ]
    nb["cells"][import_cell_idx]["source"] = imports

    # Create the new UI cell
    ui_source = f"""
print("✅ Hardware Loaded! Please upload an image of a digit below to run the Benchmark:")

upload_button = widgets.FileUpload(accept='image/*', multiple=False)
out = widgets.Output()

def on_upload_change(change):
    with out:
        out.clear_output()
        # Parse image
        uploaded_file = list(upload_button.value.values())[0]
        image_bytes = uploaded_file['content']
        
        image = Image.open(io.BytesIO(image_bytes)).convert('L')
        img = np.array(image)
        if img[0,0] > 128: img = cv2.bitwise_not(img)
        img = cv2.resize(img, (28, 28))
        
        # Preprocess and copy to DMA buffer
        in_buf[:] = preprocess(img.flatten())

        print("Running Hardware Warmup...")
        for _ in range(10):
            {prefix}.write(0x00, 1)
            dma.sendchannel.transfer(in_buf)
            dma.recvchannel.transfer(out_buf)
            dma.sendchannel.wait()
            dma.recvchannel.wait()
            
        print("Running 1,000 Inferences for Benchmarking...")
        system_times = []
        
        for _ in range(1000):
            t0 = time.perf_counter()
            
            {prefix}.write(0x00, 1)
            dma.sendchannel.transfer(in_buf)
            dma.recvchannel.transfer(out_buf)
            dma.sendchannel.wait()
            dma.recvchannel.wait()
            
            system_times.append((time.perf_counter() - t0) * 1000) # in ms
            
        # Get final prediction from the last run
        logits = out_buf[:].astype(np.float32) / SCALE
        predicted_class = np.argmax(logits)
        
        # We don't have a hardware cycle counter, so we approximate pure HW latency based on PYNQ 50MHz clock
        # For CNN, it takes ~150k cycles. For MLP, ~50k cycles. 
        # But we will simply display the measured system latency as the primary metric.
        mean_system_latency_ms = np.mean(system_times)
        throughput_fps = 1000.0 / mean_system_latency_ms

        print("\\n" + "="*50)
        print("  🚀 HARDWARE ACCELERATOR BENCHMARK RESULTS 🚀")
        print("="*50)
        print(f"Predicted Digit       : {{predicted_class}}")
        print("-" * 50)
        print(f"Total System Latency  : {{mean_system_latency_ms:.3f}} ms (Includes DMA)")
        print(f"System Throughput     : {{throughput_fps:.1f}} FPS")
        print(f"FPGA Power Estimate   : ~1.5 Watts")
        print("="*50)

        plt.imshow(img, cmap='gray')
        plt.axis('off')
        plt.show()
        
        # Clear upload for next test
        upload_button.value.clear()

upload_button.observe(on_upload_change, names='value')
display(upload_button, out)
"""
    
    new_ui_cell = {
        "cell_type": "code",
        "execution_count": None,
        "id": "cell-interactive-ui",
        "metadata": {},
        "outputs": [],
        "source": [line + "\n" for line in ui_source.split("\n")]
    }

    # Slice the notebook to keep up to preprocess cell, then append UI cell
    nb["cells"] = nb["cells"][:preprocess_cell_idx+1]
    nb["cells"].append(new_ui_cell)

    with open(path, "w", encoding="utf-8") as f:
        json.dump(nb, f, indent=1)
    
    print(f"Updated UI for {path}")

update_notebook("CNN/fpga/pynq/mnist_cnn_inference.ipynb", "cnn")
update_notebook("MLP/fpga/pynq/mnist_inference.ipynb", "mlp")
