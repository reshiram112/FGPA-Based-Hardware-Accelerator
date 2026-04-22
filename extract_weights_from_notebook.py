import json
import base64
import numpy as np
import io
import re

def generate_h_from_notebook(nb_path, out_h_file, prefix):
    with open(nb_path, 'r', encoding='utf-8') as f:
        nb = json.load(f)
    
    b64_src = ""
    for cell in nb['cells']:
        src_lines = cell.get('source', [])
        src_str = "".join(src_lines)
        if "b64_dict = {" in src_str:
            b64_src = src_str
            break
            
    if not b64_src:
        print(f"No weights found in {nb_path}")
        return
        
    b64_dict = {}
    matches = re.findall(r"'(.*?)':\s*'(.*?)'", b64_src)
    for k, v in matches:
        if k.startswith('w_') or k.startswith('b_') or k.startswith('w') or k.startswith('b'):
            b64_dict[k] = v
                
    with open(out_h_file, "w") as f:
        f.write(f"#ifndef {prefix.upper()}_WEIGHTS_H\n")
        f.write(f"#define {prefix.upper()}_WEIGHTS_H\n\n")
        f.write("#include <stdint.h>\n\n")
        
        for name, b64_val in b64_dict.items():
            data_bytes = base64.b64decode(b64_val)
            arr = np.load(io.BytesIO(data_bytes))
            flat_arr = arr.flatten()
            
            f.write(f"static const int16_t {name}[{len(flat_arr)}] = {{\n")
            for i in range(0, len(flat_arr), 20):
                chunk = flat_arr[i:i+20]
                f.write("    " + ", ".join([str(x) for x in chunk]) + ",\n")
            f.write("};\n\n")
            
        f.write(f"#endif // {prefix.upper()}_WEIGHTS_H\n")
        
    print(f"Exported {len(b64_dict)} weight tensors from {nb_path} to {out_h_file}")

generate_h_from_notebook("CNN/fpga/pynq/mnist_cnn_inference.ipynb", "CNN/fpga/hls/cnn_weights.h", "cnn")
generate_h_from_notebook("MLP/fpga/pynq/mnist_inference.ipynb", "MLP/fpga/hls/mlp_weights.h", "mlp")
