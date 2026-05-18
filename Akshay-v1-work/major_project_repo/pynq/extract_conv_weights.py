"""
Extract Convolution Weights for FPGA BRAM
=========================================
Extracts only Conv1 and Conv2 weights and biases into a compact COE file.
"""

import re
import numpy as np

vh_path = r"c:\Users\Chappidi Sai Sudheer\Downloads\major_project_repo 3\major_project_repo\weight_extraction\verilog_headers\cnn_weights.vh"
coe_path = r"c:\Users\Chappidi Sai Sudheer\Downloads\major_project_repo 3\major_project_repo\pynq\conv_weights.coe"

print(f"Reading {vh_path}...")

weights = []
# We want conv1_weight, conv1_bias, conv2_weight, conv2_bias
regex = re.compile(r"localparam CNN_conv[12]_(weight|bias)_[0-9]+ = 16'h([0-9A-Fa-f]+);")

with open(vh_path, "r") as f:
    for line in f:
        match = regex.search(line)
        if match:
            hex_val = match.group(2)
            val = int(hex_val, 16)
            weights.append(val)

print(f"Found {len(weights)} convolution parameters.")

# Write to COE file
print(f"Writing {coe_path}...")
with open(coe_path, "w") as f:
    f.write("memory_initialization_radix=16;\n")
    f.write("memory_initialization_vector=\n")
    for i, val in enumerate(weights):
        if i == len(weights) - 1:
            f.write(f"{val:04X};\n")
        else:
            f.write(f"{val:04X},\n")

print(f"Done! ({len(weights)*2 / 1024:.2f} KB)")
