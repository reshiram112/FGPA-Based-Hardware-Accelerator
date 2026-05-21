# create_project.tcl -- Vivado block design + bitstream for CNN
#
# Generates: cnn_vivado_files/cnn_accelerator.bit + cnn_accelerator.hwh
# Log file : vivado_run.log  (written alongside this script)
#
# Prerequisites:
#   1. Run Vitis HLS first:   cd fpga/hls && vitis_hls -f run_hls.tcl
#   2. Unzip the exported IP: cd fpga    && Expand-Archive hls_ip.zip -DestinationPath hls_ip
#   3. Then run this script:  vivado -mode batch -source fpga/vivado/create_project.tcl
#
# DMA interface (ap_ctrl_none -- NO AXI-Lite control port on HLS IP):
#   IN  : 3x32x32 = 3072 int16 words = 6144 B
#   OUT : 128x4x4 = 2048 int16 words = 4096 B
#   Weights are baked into BRAM -- not sent over DMA.

set project_name  "cnn"
set project_dir   "[file normalize [file dirname [info script]]]/proj_${project_name}"
set bd_name       "cnn"                     ;# -> cnn_accelerator.bit / .hwh
set part          "xc7z020clg400-1"
set hls_ip_vlnv   "xilinx.com:hls:cnn_top:1.0"

# ---------------- Log file: writes to stdout AND vivado_run.log simultaneously ------------------------------------------------------------------------------------------------
set LOG_PATH "[file normalize [file dirname [info script]]]/vivado_run.log"
set LOG_FD   [open ${LOG_PATH} w]
proc log {msg} {
    global LOG_FD
    set ts   [clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}]
    set line "\[$ts\] $msg"
    puts  $line
    puts  $LOG_FD $line
    flush $LOG_FD
}

log "======================================================"
log "Vivado build started"
log "  Project : ${project_name}"
log "  BD name : ${bd_name}   (-> ${bd_name}.bit / .hwh)"
log "  Part    : ${part}"
log "  HLS IP  : ${hls_ip_vlnv}"
log "  DMA IN  : 3072 int16 words = 6144 B"
log "  DMA OUT : 2048 int16 words = 4096 B"
log "  Log     : ${LOG_PATH}"
log "======================================================"

# ---------------- Suppress benign IP / DRC warnings --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
log "Suppressing benign IP/DRC warnings ..."
set_msg_config -id {[BD 41-2384]}      -suppress
set_msg_config -id {[IP_Flow 19-4994]} -suppress
set_msg_config -id {[IP_Flow 19-4995]} -suppress
set_msg_config -id {[Timing 38-313]}   -suppress
set_msg_config -id {[Synth 8-7080]}    -suppress
set_msg_config -id {[Common 17-1361]}  -suppress
set_msg_config -id {[DRC DPOP-1]}      -suppress
set_msg_config -id {[DRC DPOP-2]}      -suppress
set_msg_config -id {[DRC REQP-1839]}   -suppress

# ---------------- Create project ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
log "Creating Vivado project at: ${project_dir}"
create_project ${project_name} ${project_dir} -part ${part} -force
log "Project created."

# ---------------- Add HLS IP repository ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Expected layout after unzipping hls_ip.zip:
#   fpga/hls_ip/xilinx.com_hls_cnn_top_1.0/
set ip_dir "[file normalize [file dirname [info script]]]/../hls_ip"
log "Setting HLS IP repo path: ${ip_dir}"
if {![file isdirectory $ip_dir]} {
    log "ERROR: HLS IP directory not found: $ip_dir"
    log "  Run: Expand-Archive fpga/hls_ip.zip -DestinationPath fpga/hls_ip"
    close $LOG_FD
    exit 1
}
set_property ip_repo_paths ${ip_dir} [current_project]
update_ip_catalog -quiet
log "IP catalog updated."

# ---------------- Create block design --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
log "Creating block design: ${bd_name}"
create_bd_design ${bd_name}

# ---------------- Zynq PS7 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
log "Adding Zynq PS7 ..."
set zynq [create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 ps7]
set_property -dict [list \
    CONFIG.PCW_USE_M_AXI_GP0              {1}   \
    CONFIG.PCW_USE_S_AXI_HP0              {1}   \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ   {125} \
    CONFIG.PCW_EN_CLK0_PORT               {1}   \
    CONFIG.PCW_EN_RST0_PORT               {1}   \
    CONFIG.PCW_ENET0_PERIPHERAL_ENABLE    {1}   \
    CONFIG.PCW_USB0_PERIPHERAL_ENABLE     {1}   \
    CONFIG.PCW_SD0_PERIPHERAL_ENABLE      {1}   \
    CONFIG.PCW_UART1_PERIPHERAL_ENABLE    {1}   \
    CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE  {1}   \
] [get_bd_cells ps7]
make_bd_intf_pins_external [get_bd_intf_pins ps7/DDR]
make_bd_intf_pins_external [get_bd_intf_pins ps7/FIXED_IO]

# -- AXI DMA (simple / non-scatter-gather mode) --------------------------------
log "Adding AXI DMA ..."
# c_sg_length_width=16 -> max transfer = 64 KB
#   Required: 6144 B (in) + 4096 B (out)  well within 64 KB
set dma [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0]
set_property -dict [list \
    CONFIG.c_include_sg              {0}  \
    CONFIG.c_sg_length_width         {16} \
    CONFIG.c_m_axi_mm2s_data_width   {32} \
    CONFIG.c_m_axis_mm2s_tdata_width {32} \
    CONFIG.c_m_axi_s2mm_data_width   {32} \
    CONFIG.c_s_axis_s2mm_tdata_width {32} \
] [get_bd_cells axi_dma_0]

# ---------------- HLS CNN IP --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
log "Adding HLS IP: ${hls_ip_vlnv} ..."
set hls_ip [create_bd_cell -type ip -vlnv ${hls_ip_vlnv} cnn_top_0]

# -- AXI Interconnect -- control path (GP0 -> DMA only; HLS IP has no ctrl port)
# ap_ctrl_none removes the s_axi_ctrl port from the HLS IP entirely.
set ic_ctrl [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ctrl]
set_property CONFIG.NUM_SI 1 [get_bd_cells axi_ic_ctrl]
set_property CONFIG.NUM_MI 1 [get_bd_cells axi_ic_ctrl]

# ---------------- AXI Interconnect -------- data path (DMA MM2S + S2MM -------- HP0) ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
set ic_hp0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_hp0]
set_property CONFIG.NUM_SI 2 [get_bd_cells axi_ic_hp0]
set_property CONFIG.NUM_MI 1 [get_bd_cells axi_ic_hp0]

# ---------------- Reset generator ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
set rst [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_gen]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0]    [get_bd_pins rst_gen/slowest_sync_clk]
connect_bd_net [get_bd_pins ps7/FCLK_RESET0_N] [get_bd_pins rst_gen/ext_reset_in]

# ---------------- Clock (FCLK0 -------- all blocks) ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
set clk [get_bd_pins ps7/FCLK_CLK0]
foreach pin [list \
    ps7/M_AXI_GP0_ACLK          ps7/S_AXI_HP0_ACLK           \
    axi_dma_0/s_axi_lite_aclk   axi_dma_0/m_axi_mm2s_aclk    \
    axi_dma_0/m_axi_s2mm_aclk   \
    cnn_top_0/ap_clk             \
    axi_ic_ctrl/ACLK             axi_ic_ctrl/S00_ACLK          \
    axi_ic_ctrl/M00_ACLK         \
    axi_ic_hp0/ACLK              axi_ic_hp0/S00_ACLK           \
    axi_ic_hp0/S01_ACLK          axi_ic_hp0/M00_ACLK           \
] { connect_bd_net $clk [get_bd_pins $pin] }

# ---------------- Resets ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
connect_bd_net [get_bd_pins rst_gen/interconnect_aresetn] \
    [get_bd_pins axi_ic_ctrl/ARESETN] \
    [get_bd_pins axi_ic_hp0/ARESETN]

connect_bd_net [get_bd_pins rst_gen/peripheral_aresetn] \
    [get_bd_pins cnn_top_0/ap_rst_n]          \
    [get_bd_pins axi_dma_0/axi_resetn]        \
    [get_bd_pins axi_ic_ctrl/M00_ARESETN]     \
    [get_bd_pins axi_ic_ctrl/S00_ARESETN]     \
    [get_bd_pins axi_ic_hp0/S00_ARESETN]      \
    [get_bd_pins axi_ic_hp0/S01_ARESETN]      \
    [get_bd_pins axi_ic_hp0/M00_ARESETN]

# -- AXI-Lite control path -----------------------------------------------------
# ap_ctrl_none: HLS IP has NO s_axi_ctrl port -- only DMA gets control access.
#   PS7.M_AXI_GP0 -> ic_ctrl -> DMA.S_AXI_LITE
connect_bd_intf_net [get_bd_intf_pins ps7/M_AXI_GP0]       [get_bd_intf_pins axi_ic_ctrl/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ic_ctrl/M00_AXI] [get_bd_intf_pins axi_dma_0/S_AXI_LITE]

# ---------------- AXI-Stream data path ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#   DMA.M_AXIS_MM2S -------- cnn_top_0.s_axis_input   (send: host -------- kernel)
#   cnn_top_0.m_axis_output -------- DMA.S_AXIS_S2MM  (recv: kernel -------- host)
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S]    [get_bd_intf_pins cnn_top_0/s_axis_input]
connect_bd_intf_net [get_bd_intf_pins cnn_top_0/m_axis_output]  [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM]

# ---------------- DMA to DDR via HP0 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXI_MM2S] [get_bd_intf_pins axi_ic_hp0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXI_S2MM] [get_bd_intf_pins axi_ic_hp0/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ic_hp0/M00_AXI]   [get_bd_intf_pins ps7/S_AXI_HP0]

# ---------------- Address assignment + validation ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
log "Assigning addresses ..."
assign_bd_address
log "Validating block design ..."
validate_bd_design
save_bd_design
log "Block design validated and saved."

# ---------------- HDL wrapper ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
log "Generating HDL wrapper ..."
make_wrapper -files [get_files ${bd_name}.bd] -top
add_files -norecurse \
    "${project_dir}/${project_name}.srcs/sources_1/bd/${bd_name}/hdl/${bd_name}_wrapper.v"
set_property top ${bd_name}_wrapper [current_fileset]
update_compile_order -fileset sources_1
log "Wrapper set as top: ${bd_name}_wrapper"

# ---------------- DRC waivers (required for Xilinx AXI DMA IP) ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
log "Creating DRC waivers ..."
create_waiver -quiet -type DRC -id {DPOP-1}    -description "Benign hint from Xilinx AXI DMA IP"
create_waiver -quiet -type DRC -id {DPOP-2}    -description "Benign hint from Xilinx AXI DMA IP"
create_waiver -quiet -type DRC -id {REQP-1839} -description "RAMB async reset inside Xilinx AXI DMA IP"

# ---------------- Step 1: RTL Synthesis ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
log "Launching RTL synthesis (synth_1) -------- this takes a few minutes ..."
set t_synth [clock seconds]
launch_runs synth_1 -jobs 4
wait_on_run synth_1
set t_synth_elapsed [expr {[clock seconds] - $t_synth}]

set synth_status   [get_property STATUS   [get_runs synth_1]]
set synth_progress [get_property PROGRESS [get_runs synth_1]]
log "synth_1 done in ${t_synth_elapsed}s  |  status: $synth_status  |  progress: $synth_progress"

# Check synth_1 actually completed
if {![string equal $synth_progress "100%"]} {
    log "ERROR: synth_1 did not reach 100%."
    log "  Vivado log: ${project_dir}/${project_name}.runs/synth_1/runme.log"
    close $LOG_FD
    exit 1
}
log "RTL synthesis PASSED."

# Log post-synthesis utilisation from the Vivado report
set synth_rpt "${project_dir}/${project_name}.runs/synth_1/${bd_name}_wrapper_utilization_synth.rpt"
if {[file exists $synth_rpt]} {
    log "Parsing synthesis utilisation report ..."
    set fd [open $synth_rpt r]
    set in_section 0 ; set cap 0
    while {[gets $fd line] >= 0} {
        if {[string match "*Slice LUTs*"  $line] ||
            [string match "*Block RAM*"   $line] ||
            [string match "*DSPs*"        $line] ||
            [string match "*1. CLB Logic*" $line]} { set in_section 1 ; set cap 0 }
        if {$in_section} {
            log "  SYN | $line" ; incr cap
            if {$cap > 30} { set in_section 0 }
        }
    }
    close $fd
} else {
    log "  (synthesis utilisation report not yet available at expected path)"
}

# ---------------- Step 2: Implementation + Bitstream ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
log "Launching implementation + bitstream (impl_1) -------- this takes 10-30 minutes ..."
set_property strategy Flow_PerfOptimized_high [get_runs synth_1]
set_property strategy Performance_ExplorePostRoutePhysOpt [get_runs impl_1]

set t_impl [clock seconds]
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
set t_impl_elapsed [expr {[clock seconds] - $t_impl}]

set impl_status   [get_property STATUS   [get_runs impl_1]]
set impl_progress [get_property PROGRESS [get_runs impl_1]]
log "impl_1 done in ${t_impl_elapsed}s  |  status: $impl_status  |  progress: $impl_progress"

if {![string equal $impl_progress "100%"]} {
    log "ERROR: impl_1 did not reach 100%."
    log "  Vivado log: ${project_dir}/${project_name}.runs/impl_1/runme.log"
    close $LOG_FD
    exit 1
}
log "Implementation + bitstream PASSED."

# Log timing summary
set timing_rpt "${project_dir}/${project_name}.runs/impl_1/${bd_name}_wrapper_timing_summary_routed.rpt"
if {[file exists $timing_rpt]} {
    log "Parsing timing summary ..."
    set fd [open $timing_rpt r]
    set in_section 0 ; set cap 0
    while {[gets $fd line] >= 0} {
        if {[string match "*WNS*" $line] ||
            [string match "*Design Timing Summary*" $line] ||
            [string match "*VIOLATED*" $line]} { set in_section 1 ; set cap 0 }
        if {$in_section} {
            log "  TIM | $line" ; incr cap
            if {$cap > 20} { set in_section 0 }
        }
    }
    close $fd
} else {
    log "  (timing summary report not yet available at expected path)"
}

# ---------------- Collect outputs ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
set out_dir "${project_dir}/output"
file mkdir ${out_dir}

set bit_src "${project_dir}/${project_name}.runs/impl_1/${bd_name}_wrapper.bit"
if {![file exists $bit_src]} {
    log "ERROR: Bitstream not found at: $bit_src"
    log "  impl_1 may have failed -- check runme.log above."
    close $LOG_FD
    exit 1
}

# -- Output to cnn_vivado_files/ (mirrors mlp_vivado_files/ etc. in reference) --
set vf_dir "[file normalize [file dirname [info script]]]/../pynq/cnn_vivado_files"
file mkdir ${vf_dir}
file copy -force $bit_src "${vf_dir}/cnn_accelerator.bit"
log "Bitstream copied: ${vf_dir}/cnn_accelerator.bit  ([expr {[file size ${vf_dir}/cnn_accelerator.bit] / 1024 / 1024}] MB)"

write_hw_platform -fixed -force -include_bit "${out_dir}/cnn_accelerator.xsa"
log "XSA written    : ${out_dir}/cnn_accelerator.xsa"

log "======================================================"
log "Vivado build COMPLETE"
log "  Bitstream : ${vf_dir}/cnn_accelerator.bit"
log "  XSA       : ${out_dir}/cnn_accelerator.xsa"
log "  Log       : ${LOG_PATH}"
log ""
log "Next steps:"
log "  1. Extract .hwh from XSA:"
log "       python fpga/pynq/extract_hwh.py --xsa ${out_dir}/cnn_accelerator.xsa \\"
log "           --out-dir fpga/pynq/cnn_vivado_files"
log "  2. .bit already in cnn_vivado_files/ -- deploy to PYNQ:"
log "       python fpga/pynq/deploy.py"
log "======================================================"

close $LOG_FD
