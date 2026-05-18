import os
import sys

def patch_file(filepath):
    if not os.path.exists(filepath):
        print(f"Skipping {filepath}")
        return
    
    with open(filepath, 'r') as f:
        content = f.read()
    
    # We want to insert ALL AXI Master parameters
    params_to_add = [
        "C_M_AXI_GMEM_ID_WIDTH",
        "C_M_AXI_GMEM_ADDR_WIDTH",
        "C_M_AXI_GMEM_DATA_WIDTH",
        "C_M_AXI_GMEM_AWUSER_WIDTH",
        "C_M_AXI_GMEM_WUSER_WIDTH",
        "C_M_AXI_GMEM_BUSER_WIDTH",
        "C_M_AXI_GMEM_ARUSER_WIDTH",
        "C_M_AXI_GMEM_RUSER_WIDTH",
        "C_M_AXI_GMEM_USER_VALUE",
        "C_M_AXI_GMEM_PROT_VALUE",
        "C_M_AXI_GMEM_CACHE_VALUE",
    ]
    
    insertion = """
parameter C_M_AXI_GMEM_ID_WIDTH = 1;
parameter C_M_AXI_GMEM_ADDR_WIDTH = 64;
parameter C_M_AXI_GMEM_DATA_WIDTH = 32;
parameter C_M_AXI_GMEM_AWUSER_WIDTH = 1;
parameter C_M_AXI_GMEM_WUSER_WIDTH = 1;
parameter C_M_AXI_GMEM_BUSER_WIDTH = 1;
parameter C_M_AXI_GMEM_ARUSER_WIDTH = 1;
parameter C_M_AXI_GMEM_RUSER_WIDTH = 1;
parameter C_M_AXI_GMEM_USER_VALUE = 0;
parameter C_M_AXI_GMEM_PROT_VALUE = 0;
parameter C_M_AXI_GMEM_CACHE_VALUE = 3;
"""

    # Remove previously added parameters if any
    lines = content.split('\n')
    new_lines = []
    for line in lines:
        if not any(f"parameter {p}" in line for p in params_to_add):
            new_lines.append(line)
            
    content = '\n'.join(new_lines)
    
    idx = content.find("parameter ")
    if idx == -1:
        print(f"Could not find 'parameter' in {filepath}")
        return
    
    new_content = content[:idx] + insertion + content[idx:]
    
    with open(filepath, 'w') as f:
        f.write(new_content)
    print(f"Successfully patched {filepath}")

patch_file("CNN/fpga/hls_ip/hdl/verilog/cnn_top.v")
patch_file("MLP/fpga/hls_ip/hdl/verilog/mlp_top.v")
