# ============================================================
#  create_project.tcl — Vivado 2025.1 Block Design Automation
#  Board  : PYNQ-Z2  (Zynq XC7Z020-CLG400-1)
#  Target : MLP inference accelerator with PS+PL
#
#  Usage (Vivado Tcl Console):
#    cd <repo>/fpga/vivado
#    source create_project.tcl
# ============================================================

# ── 0. Settings ──────────────────────────────────────────────
set project_name  "mnist_mlp"
set project_dir   "[file normalize [file dirname [info script]]]/proj_${project_name}"
set bd_name       "mlp_system"
set part          "xc7z020clg400-1"

# Path to the HLS-exported IP (after running Export RTL in Vitis HLS)
# Expected: fpga/hls_ip/mlp_top/
set hls_ip_repo   "[file normalize [file dirname [info script]]]/../hls_ip"

# ── 1. Create Vivado project ─────────────────────────────────
create_project ${project_name} ${project_dir} -part ${part} -force

# Note: PYNQ-Z2 board files may not be installed.
# Using xc7z020clg400-1 directly with manual PS7 configuration.

# Add HLS IP to repository path — use the zip file directly
set ip_zip "[file normalize [file dirname [info script]]]/../../mlp_top/solution/impl/ip/xilinx_com_hls_mlp_top_1_0.zip"
if {[file exists $ip_zip]} {
    set_property ip_repo_paths "[file dirname $ip_zip]" [current_project]
    update_ip_catalog -quiet
    puts "INFO: Added HLS IP from $ip_zip"
} else {
    puts "WARNING: HLS IP zip not found at $ip_zip — check HLS synthesis ran first"
}

# ── 2. Create Block Design ───────────────────────────────────
create_bd_design ${bd_name}
update_compile_order -fileset sources_1

# ── 3. Add Zynq PS7 ──────────────────────────────────────────
set zynq [create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 ps7]

# Apply PYNQ-Z2 preset (enables the right MIO, DDR, HP ports)
set_property -dict [list \
    CONFIG.PCW_USE_S_AXI_HP0 {1} \
    CONFIG.PCW_USE_M_AXI_GP0 {1} \
    CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
    CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
    CONFIG.PCW_EN_CLK0_PORT {1} \
    CONFIG.PCW_EN_RST0_PORT {1} \
] [get_bd_cells ps7]

# Expose DDR and FIXED_IO to top level (no board preset needed)
make_bd_intf_pins_external [get_bd_intf_pins ps7/DDR]
make_bd_intf_pins_external [get_bd_intf_pins ps7/FIXED_IO]

# ── 4. Add AXI DMA (for input/output streams) ────────────────
set dma [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0]
set_property -dict [list \
    CONFIG.c_include_sg {0} \
    CONFIG.c_sg_length_width {23} \
    CONFIG.c_m_axi_mm2s_data_width {32} \
    CONFIG.c_m_axis_mm2s_tdata_width {32} \
    CONFIG.c_m_axi_s2mm_data_width {32} \
    CONFIG.c_s_axis_s2mm_tdata_width {32} \
] [get_bd_cells axi_dma_0]

# ── 5. Add MLP HLS IP ─────────────────────────────────────────
# Name 'mlp_top_0' — Vitis HLS exports the IP with the function name
set mlp [create_bd_cell -type ip -vlnv xilinx.com:hls:mlp_top:1.0 mlp_top_0]

# ── 6. Add AXI Interconnects ─────────────────────────────────
# GP0 master → DMA + MLP control (AXI4-Lite)
set ic_ctrl [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ctrl]
set_property CONFIG.NUM_SI 1 [get_bd_cells axi_ic_ctrl]
set_property CONFIG.NUM_MI 2 [get_bd_cells axi_ic_ctrl]

# HP0 slave → MLP weight reads (AXI4 full, 64-bit)
set ic_hp0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_hp0]
set_property CONFIG.NUM_SI 1 [get_bd_cells axi_ic_hp0]
set_property CONFIG.NUM_MI 1 [get_bd_cells axi_ic_hp0]

# ── 7. Enable HP1 on PS7 for DMA memory access ──────────────
set_property CONFIG.PCW_USE_S_AXI_HP1 {1} [get_bd_cells ps7]

# AXI interconnect for DMA memory (HP1)
set ic_hp1 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_hp1]
set_property CONFIG.NUM_SI 2 [get_bd_cells axi_ic_hp1]
set_property CONFIG.NUM_MI 1 [get_bd_cells axi_ic_hp1]

# ── 8. Connect clocks and resets ─────────────────────────────
connect_bd_net [get_bd_pins ps7/FCLK_CLK0] \
    [get_bd_pins ps7/M_AXI_GP0_ACLK] \
    [get_bd_pins ps7/S_AXI_HP0_ACLK] \
    [get_bd_pins ps7/S_AXI_HP1_ACLK] \
    [get_bd_pins axi_dma_0/s_axi_lite_aclk] \
    [get_bd_pins axi_dma_0/m_axi_mm2s_aclk] \
    [get_bd_pins axi_dma_0/m_axi_s2mm_aclk] \
    [get_bd_pins mlp_top_0/ap_clk] \
    [get_bd_pins axi_ic_ctrl/ACLK] \
    [get_bd_pins axi_ic_ctrl/M00_ACLK] \
    [get_bd_pins axi_ic_ctrl/M01_ACLK] \
    [get_bd_pins axi_ic_ctrl/S00_ACLK] \
    [get_bd_pins axi_ic_hp0/ACLK] \
    [get_bd_pins axi_ic_hp0/S00_ACLK] \
    [get_bd_pins axi_ic_hp0/M00_ACLK] \
    [get_bd_pins axi_ic_hp1/ACLK] \
    [get_bd_pins axi_ic_hp1/S00_ACLK] \
    [get_bd_pins axi_ic_hp1/S01_ACLK] \
    [get_bd_pins axi_ic_hp1/M00_ACLK]

set rst_gen [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_gen]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0]    [get_bd_pins rst_gen/slowest_sync_clk]
connect_bd_net [get_bd_pins ps7/FCLK_RESET0_N] [get_bd_pins rst_gen/ext_reset_in]

connect_bd_net [get_bd_pins rst_gen/interconnect_aresetn] \
    [get_bd_pins axi_ic_ctrl/ARESETN] \
    [get_bd_pins axi_ic_hp0/ARESETN] \
    [get_bd_pins axi_ic_hp1/ARESETN]

connect_bd_net [get_bd_pins rst_gen/peripheral_aresetn] \
    [get_bd_pins mlp_top_0/ap_rst_n] \
    [get_bd_pins axi_dma_0/axi_resetn] \
    [get_bd_pins axi_ic_ctrl/M00_ARESETN] \
    [get_bd_pins axi_ic_ctrl/M01_ARESETN] \
    [get_bd_pins axi_ic_ctrl/S00_ARESETN] \
    [get_bd_pins axi_ic_hp0/S00_ARESETN] \
    [get_bd_pins axi_ic_hp0/M00_ARESETN] \
    [get_bd_pins axi_ic_hp1/S00_ARESETN] \
    [get_bd_pins axi_ic_hp1/S01_ARESETN] \
    [get_bd_pins axi_ic_hp1/M00_ARESETN]

# ── 9. AXI4-Lite control connections (GP0 → DMA + MLP ctrl) ─
connect_bd_intf_net [get_bd_intf_pins ps7/M_AXI_GP0] \
    [get_bd_intf_pins axi_ic_ctrl/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ic_ctrl/M00_AXI] \
    [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
connect_bd_intf_net [get_bd_intf_pins axi_ic_ctrl/M01_AXI] \
    [get_bd_intf_pins mlp_top_0/s_axi_ctrl]

# ── 10. AXI4-Stream data path: DMA → MLP → DMA ──────────────
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] \
    [get_bd_intf_pins mlp_top_0/s_axis_input]
connect_bd_intf_net [get_bd_intf_pins mlp_top_0/m_axis_output] \
    [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM]

# ── 11. AXI4-HP0: MLP weight reads → PS DDR ─────────────────
connect_bd_intf_net [get_bd_intf_pins mlp_top_0/m_axi_weights] \
    [get_bd_intf_pins axi_ic_hp0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ic_hp0/M00_AXI] \
    [get_bd_intf_pins ps7/S_AXI_HP0]

# ── 12. AXI4-HP1: DMA memory access → PS DDR ────────────────
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXI_MM2S] \
    [get_bd_intf_pins axi_ic_hp1/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXI_S2MM] \
    [get_bd_intf_pins axi_ic_hp1/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ic_hp1/M00_AXI] \
    [get_bd_intf_pins ps7/S_AXI_HP1]

# ── 11. Address mapping — auto-assign ────────────────────────
# Vivado auto-assigns non-overlapping addresses for all slaves.
# (MLP ctrl and DMA will be at their auto-assigned base addresses)
assign_bd_address
puts "INFO: Address auto-assignment complete"

# ── 12. Validate and generate ────────────────────────────────
validate_bd_design
save_bd_design

make_wrapper -files [get_files ${bd_name}.bd] -top
add_files -norecurse "${project_dir}/${project_name}.srcs/sources_1/bd/${bd_name}/hdl/${bd_name}_wrapper.v"
set_property top ${bd_name}_wrapper [current_fileset]
update_compile_order -fileset sources_1

# ── 13. Synthesise, implement, generate bitstream ────────────
# launch_runs impl_1 -to_step write_bitstream -jobs 4
# wait_on_run impl_1

# Copy bitstream + hardware handoff to output folder
set out_dir "${project_dir}/output"
file mkdir ${out_dir}
file copy -force \
    "${project_dir}/${project_name}.runs/impl_1/${bd_name}_wrapper.bit" \
    "${out_dir}/mlp.bit"
write_hw_platform -fixed -force -include_bit \
    "${out_dir}/mlp.xsa"

puts "\n=== BUILD COMPLETE ==="
puts "Bitstream  : ${out_dir}/mlp.bit"
puts "XSA file   : ${out_dir}/mlp.xsa"
puts "Copy mlp.bit + mlp.hwh to your PYNQ-Z2 /home/xilinx/"
