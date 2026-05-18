"""
Generate COE file for Vivado BRAM Initialization
================================================
This script reads the extracted weights and creates a .coe file.
"""

import numpy as np

bin_path = r"c:\Users\Chappidi Sai Sudheer\Downloads\major_project_repo 3\major_project_repo\pynq\cnn_weights.bin"
coe_path = r"c:\Users\Chappidi Sai Sudheer\Downloads\major_project_repo 3\major_project_repo\pynq\cnn_weights.coe"

print(f"Reading {bin_path}...")
weights = np.fromfile(bin_path, dtype=np.uint16)

print(f"Writing {coe_path}...")
with open(coe_path, "w") as f:
    f.write("memory_initialization_radix=16;\n")
    f.write("memory_initialization_vector=\n")
    for i, val in enumerate(weights):
        if i == len(weights) - 1:
            f.write(f"{val:04X};\n")
        else:
            f.write(f"{val:04X},\n")

print("Done!")
