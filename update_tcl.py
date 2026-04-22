import re

def update_cnn_tcl(path):
    with open(path, "r", encoding="utf-8") as f:
        tcl = f.read()

    # Remove HP0 configuration
    tcl = re.sub(r'CONFIG\.PCW_USE_S_AXI_HP0\s+\{1\}\s+\\\n\s+', '', tcl)
    
    # Remove axi_ic_hp0 block creation
    tcl = re.sub(r'set ic_hp0 \[create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_hp0\]\nset_property CONFIG\.NUM_SI 1 \[get_bd_cells axi_ic_hp0\]\nset_property CONFIG\.NUM_MI 1 \[get_bd_cells axi_ic_hp0\]\n', '', tcl)
    
    # Remove HP0 clock/reset connections
    tcl = re.sub(r'\s+\[get_bd_pins ps7/S_AXI_HP0_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S00_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/M00_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/ARESETN\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S00_ARESETN\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/M00_ARESETN\] \\\n', '\n', tcl)
    
    # Remove HP0 AXI network
    tcl = re.sub(r'# ── 11\. AXI4-HP0: CNN weight reads ──────────────────────────\n# cnn_top outputs one master AXI port \(m_axi_weights\) combining all weight bundles\nconnect_bd_intf_net \[get_bd_intf_pins cnn_top_0/m_axi_weights\] \\\n    \[get_bd_intf_pins axi_ic_hp0/S00_AXI\]\nconnect_bd_intf_net \[get_bd_intf_pins axi_ic_hp0/M00_AXI\] \\\n    \[get_bd_intf_pins ps7/S_AXI_HP0\]\n', '', tcl)
    
    # Remove the `s_axi_control` port mapping if the new HLS IP doesn't have it (it only has `s_axi_ctrl` now). Wait, we'll let Vivado handle it, or we can remove it. Let's remove M02_AXI and set NUM_MI to 2 on ctrl.
    tcl = re.sub(r'set_property CONFIG\.NUM_MI 3 \[get_bd_cells axi_ic_ctrl\]', r'set_property CONFIG.NUM_MI 2 [get_bd_cells axi_ic_ctrl]', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_ctrl/M02_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_ctrl/M02_ARESETN\] \\\n', '\n', tcl)
    tcl = re.sub(r'connect_bd_intf_net \[get_bd_intf_pins axi_ic_ctrl/M02_AXI\] \\\n    \[get_bd_intf_pins cnn_top_0/s_axi_control\]\n', '', tcl)
    
    # Also uncomment the launch_runs
    tcl = re.sub(r'# launch_runs impl_1 -to_step write_bitstream -jobs 4\n# wait_on_run impl_1\n', 'launch_runs impl_1 -to_step write_bitstream -jobs 4\nwait_on_run impl_1\n', tcl)

    with open(path, "w", encoding="utf-8") as f:
        f.write(tcl)

def update_mlp_tcl(path):
    with open(path, "r", encoding="utf-8") as f:
        tcl = f.read()

    # Remove HP0 configuration
    tcl = re.sub(r'CONFIG\.PCW_USE_S_AXI_HP0 \{1\} \\\n\s+', '', tcl)
    
    # Remove axi_ic_hp0 block creation
    tcl = re.sub(r'# HP0 slave → MLP weight reads \(AXI4 full, 64-bit\)\nset ic_hp0 \[create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_hp0\]\nset_property CONFIG\.NUM_SI 8 \[get_bd_cells axi_ic_hp0\]\nset_property CONFIG\.NUM_MI 1 \[get_bd_cells axi_ic_hp0\]\n', '', tcl)
    
    # Remove HP0 clock/reset connections
    tcl = re.sub(r'\s+\[get_bd_pins ps7/S_AXI_HP0_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S00_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S01_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S02_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S03_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S04_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S05_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S06_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S07_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/M00_ACLK\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/ARESETN\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S00_ARESETN\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S01_ARESETN\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S02_ARESETN\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S03_ARESETN\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S04_ARESETN\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S05_ARESETN\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S06_ARESETN\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/S07_ARESETN\] \\\n', '\n', tcl)
    tcl = re.sub(r'\s+\[get_bd_pins axi_ic_hp0/M00_ARESETN\] \\\n', '\n', tcl)
    
    # Remove HP0 AXI network
    tcl = re.sub(r'# ── 11\. AXI4-HP0: MLP weight reads → PS DDR ─────────────────\nconnect_bd_intf_net \[get_bd_intf_pins mlp_top_0/m_axi_w1\] \\\n    \[get_bd_intf_pins axi_ic_hp0/S00_AXI\]\nconnect_bd_intf_net \[get_bd_intf_pins mlp_top_0/m_axi_b1\] \\\n    \[get_bd_intf_pins axi_ic_hp0/S01_AXI\]\nconnect_bd_intf_net \[get_bd_intf_pins mlp_top_0/m_axi_w2\] \\\n    \[get_bd_intf_pins axi_ic_hp0/S02_AXI\]\nconnect_bd_intf_net \[get_bd_intf_pins mlp_top_0/m_axi_b2\] \\\n    \[get_bd_intf_pins axi_ic_hp0/S03_AXI\]\nconnect_bd_intf_net \[get_bd_intf_pins mlp_top_0/m_axi_w3\] \\\n    \[get_bd_intf_pins axi_ic_hp0/S04_AXI\]\nconnect_bd_intf_net \[get_bd_intf_pins mlp_top_0/m_axi_b3\] \\\n    \[get_bd_intf_pins axi_ic_hp0/S05_AXI\]\nconnect_bd_intf_net \[get_bd_intf_pins mlp_top_0/m_axi_w4\] \\\n    \[get_bd_intf_pins axi_ic_hp0/S06_AXI\]\nconnect_bd_intf_net \[get_bd_intf_pins mlp_top_0/m_axi_b4\] \\\n    \[get_bd_intf_pins axi_ic_hp0/S07_AXI\]\nconnect_bd_intf_net \[get_bd_intf_pins axi_ic_hp0/M00_AXI\] \\\n    \[get_bd_intf_pins ps7/S_AXI_HP0\]\n', '', tcl)

    # Also uncomment the launch_runs
    tcl = re.sub(r'# launch_runs impl_1 -to_step write_bitstream -jobs 4\n# wait_on_run impl_1\n', 'launch_runs impl_1 -to_step write_bitstream -jobs 4\nwait_on_run impl_1\n', tcl)

    with open(path, "w", encoding="utf-8") as f:
        f.write(tcl)

update_cnn_tcl("CNN/fpga/vivado/create_project.tcl")
update_mlp_tcl("MLP/fpga/vivado/create_project.tcl")
