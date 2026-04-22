import json

def strip_weights(nb_path):
    with open(nb_path, 'r', encoding='utf-8') as f:
        nb = json.load(f)
    
    new_cells = []
    for cell in nb['cells']:
        src = "".join(cell.get('source', []))
        if "b64_dict = {" in src or "allocate(shape=" in src and "np.copyto" in src and "['w_conv1']" in src:
            continue
        new_cells.append(cell)
        
    nb['cells'] = new_cells
    
    with open(nb_path, 'w', encoding='utf-8') as f:
        json.dump(nb, f, indent=1)
    
    print(f"Stripped weights from {nb_path}")

strip_weights("CNN/fpga/pynq/mnist_cnn_inference.ipynb")
strip_weights("MLP/fpga/pynq/mnist_inference.ipynb")
