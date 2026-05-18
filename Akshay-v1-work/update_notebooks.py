import json
import os
import shutil

def update_cnn_notebook(nb_path):
    # Ensure fresh copy from source if needed (optional)
    with open(nb_path, "r", encoding="utf-8") as f:
        nb = json.load(f)
    
    for cell in nb["cells"]:
        if cell["cell_type"] == "code" and "ol = Overlay(" in "".join(cell.get("source", [])):
            src = "".join(cell["source"])
            if "weights = np.fromfile" in src:
                continue
            
            addition = """
# Load external weights
print('Loading external weights for CNN...')
weights = np.fromfile('cnn_weights.bin', dtype=np.int16)

# CNN expects: Weights (9098) followed by Image (784)
# We allocate one large buffer to use in the loop
combined_buf = allocate(shape=(len(weights) + 784,), dtype=np.int16)
combined_buf[:len(weights)] = weights
"""
            cell["source"] = [line + "\n" for line in src.split("\n")] + [addition]
            
        if cell["cell_type"] == "code" and "dma.sendchannel.transfer" in "".join(cell.get("source", [])):
            src = "".join(cell["source"])
            if "combined_buf[len(weights):]" in src:
                continue
                
            new_src = src.replace("dma.sendchannel.transfer(in_buffer)", """
        # Pack image into the end of the combined buffer
        combined_buf[len(weights):] = image.flatten()
        
        # Start HLS IP
        cnn.write(0x00, 1)
        
        dma.sendchannel.transfer(combined_buf)
""")
            cell["source"] = [line + "\n" for line in new_src.split("\n")]
    
    with open(nb_path, "w", encoding="utf-8") as f:
        json.dump(nb, f, indent=1)

def update_mlp_notebook(nb_path):
    with open(nb_path, "r", encoding="utf-8") as f:
        nb = json.load(f)
    
    for cell in nb["cells"]:
        if cell["cell_type"] == "code" and "ol = Overlay(" in "".join(cell.get("source", [])):
            src = "".join(cell["source"])
            if "weights = np.fromfile" in src:
                continue
            
            addition = """
# Load external weights
print('Loading external weights for MLP...')
weights = np.fromfile('mlp_weights.bin', dtype=np.int16)

# MLP expects: Image (784) followed by Weights (567946)
# We allocate one large buffer to use in the loop
combined_buf = allocate(shape=(784 + len(weights),), dtype=np.int16)
combined_buf[784:] = weights
"""
            cell["source"] = [line + "\n" for line in src.split("\n")] + [addition]

        if cell["cell_type"] == "code" and "dma.sendchannel.transfer" in "".join(cell.get("source", [])):
            src = "".join(cell["source"])
            if "combined_buf[:784]" in src:
                continue
                
            new_src = src.replace("dma.sendchannel.transfer(in_buffer)", """
        # Pack image into the start of the combined buffer
        combined_buf[:784] = image.flatten()
        
        # Start HLS IP
        mlp.write(0x00, 1)
        
        dma.sendchannel.transfer(combined_buf)
""")
            cell["source"] = [line + "\n" for line in new_src.split("\n")]

    with open(nb_path, "w", encoding="utf-8") as f:
        json.dump(nb, f, indent=1)

# Just run it
try:
    update_cnn_notebook("CNN/fpga/pynq/mnist_cnn_inference.ipynb")
    update_mlp_notebook("MLP/fpga/pynq/mnist_inference.ipynb")
    print("Notebooks updated.")
except Exception as e:
    print(f"Error updating notebooks: {e}")
