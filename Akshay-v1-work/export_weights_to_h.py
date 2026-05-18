import os
import numpy as np

def export_weights(model_dir, out_h_file, prefix):
    weights_dir = os.path.join(model_dir, "fpga", "pynq", "fpga_weights")
    if not os.path.exists(weights_dir):
        print(f"Directory {weights_dir} not found.")
        return

    arrays = []
    for file in os.listdir(weights_dir):
        if file.endswith(".npy"):
            name = file.replace(".npy", "")
            data = np.load(os.path.join(weights_dir, file))
            # Flatten data
            flat_data = data.flatten()
            arrays.append((name, flat_data))
    
    with open(out_h_file, "w") as f:
        f.write(f"#ifndef {prefix.upper()}_WEIGHTS_H\n")
        f.write(f"#define {prefix.upper()}_WEIGHTS_H\n\n")
        f.write("#include <stdint.h>\n\n")
        
        for name, data in arrays:
            f.write(f"static const int16_t {name}[{len(data)}] = {{\n")
            # Write in chunks of 20
            for i in range(0, len(data), 20):
                chunk = data[i:i+20]
                f.write("    " + ", ".join([str(x) for x in chunk]) + ",\n")
            f.write("};\n\n")
            
        f.write(f"#endif // {prefix.upper()}_WEIGHTS_H\n")

    print(f"Exported weights to {out_h_file}")

export_weights("CNN", "CNN/fpga/hls/cnn_weights.h", "cnn")
export_weights("MLP", "MLP/fpga/hls/mlp_weights.h", "mlp")
