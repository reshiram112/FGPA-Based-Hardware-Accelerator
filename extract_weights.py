import re
import numpy as np

def extract(header_path, bin_path):
    with open(header_path, 'r') as f:
        content = f.read()
    
    # find all arrays: static const int16_t name[size] = { ... };
    arrays = re.findall(r'static const int16_t (\w+)\[\d+\] = \{([^}]+)\};', content)
    
    with open(bin_path, 'wb') as f:
        for name, data in arrays:
            nums = [int(x.strip()) for x in data.split(',') if x.strip()]
            arr = np.array(nums, dtype=np.int16)
            f.write(arr.tobytes())
            print(f"Extracted {name} with size {len(nums)}")

extract('MLP/fpga/hls/mlp_weights.h', 'MLP/fpga/pynq/mlp_weights.bin')
extract('CNN/fpga/hls/cnn_weights.h', 'CNN/fpga/pynq/cnn_weights.bin')
print("Done")
