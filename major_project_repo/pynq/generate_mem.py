"""
Generate MEM file for Verilog $readmemh
"""

import re

vh_path = r"c:\Users\Chappidi Sai Sudheer\Downloads\major_project_repo 3\major_project_repo\weight_extraction\verilog_headers\cnn_weights.vh"
mem_path = r"c:\Users\Chappidi Sai Sudheer\Downloads\major_project_repo 3\major_project_repo\verilog_modules\conv_weights.mem"

regex = re.compile(r"localparam CNN_conv[12]_(weight|bias)_[0-9]+ = 16'h([0-9A-Fa-f]+);")
weights = []

with open(vh_path, "r") as f:
    for line in f:
        match = regex.search(line)
        if match:
            weights.append(match.group(2))

with open(mem_path, "w") as f:
    for w in weights:
        f.write(f"{w}\n")

print(f"Generated {mem_path} with {len(weights)} values.")
