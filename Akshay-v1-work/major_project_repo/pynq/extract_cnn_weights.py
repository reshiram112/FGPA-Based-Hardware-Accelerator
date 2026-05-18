"""
Extract CNN Weights from Verilog Header to Binary File
======================================================
This script parses cnn_weights.vh and converts the 16-bit hex values
into a compact binary file for streaming.
"""

import re
import numpy as np

vh_path = r"c:\Users\Chappidi Sai Sudheer\Downloads\major_project_repo 3\major_project_repo\weight_extraction\verilog_headers\cnn_weights.vh"
bin_path = r"c:\Users\Chappidi Sai Sudheer\Downloads\major_project_repo 3\major_project_repo\pynq\cnn_weights.bin"

print(f"Reading {vh_path}...")

weights = []
regex = re.compile(r"16'h([0-9A-Fa-f]+)")

with open(vh_path, "r") as f:
    for line in f:
        if "localparam" in line and "16'h" in line:
            match = regex.search(line)
            if match:
                hex_val = match.group(1)
                val = int(hex_val, 16)
                weights.append(val)

print(f"Found {len(weights)} weights.")

# Convert to uint16 numpy array
weights_np = np.array(weights, dtype=np.uint16)

# Save to binary file
weights_np.tofile(bin_path)
print(f"Saved binary weights to {bin_path} ({len(weights)*2 / 1024:.2f} KB)")
