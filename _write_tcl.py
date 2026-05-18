"""Write create_project.tcl for BNN FPGA build."""
import pathlib

TCL = pathlib.Path(r"C:\Users\TA17084\fpga_radioml_mlp\Akshay-v1-work\bnn_accelerator\fpga\vivado\create_project.tcl")

content = """\
# create_project.tcl -- Vivado block design + bitstream for CAN Vehicle BNN
#
# Generates: bnn_vivado_files/bnn_accelerator.bit + bnn_accelerator.hwh
# Log file : vivado_build.log  (written alongside this script)
#
# Prerequisites: none  (pure Verilog -- no HLS step needed)
# Weights baked into bitstream via bnn_can_weights.vh
#
# DMA interface (bnn_accelerator is free-running -- no AXI-Lite control port):
#   IN  : 169 uint32 words (one Q8.8 int16 CAN feature per 32-bit word) = 676 B
#   OUT :   1 uint32 word  (argmax class: 0=OpelAstra 1=Prototype 2=RenaultClio) = 4 B
#
# AXI-Stream interface on bnn_accelerator module reference:
#   Vivado infers S_AXIS (from s_axis_* ports) and M_AXIS (from m_axis_* ports).
#   Clock: 125 MHz (FCLK_CLK0 from PS7).

set project_name  "bnn_accelerator"
set project_dir   "[file normalize [file dirname [info script]]]/proj_${project_name}"
set bd_name       "bnn_accelerator"
set part          "xc7z020clg400-1"

set SCRIPT_DIR  "[file normalize [file dirname [info script]]]"
set VERILOG_DIR "[file normalize ${SCRIPT_DIR}/../verilog]"
set VF_DIR      "[file normalize ${SCRIPT_DIR}/../pynq/bnn_vivado_files]"
set OUT_DIR     "${project_dir}/output"

set LOG_PATH "${SCRIPT_DIR}/vivado_build.log"
set LOG_FD   [open ${LOG_PATH} w]
proc log {msg} {
    global LOG_FD
    set ts   [clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}]
    set line "\\[$ts\\] $msg"
    puts  $line
    puts  $LOG_FD $line
    flush $LOG_FD
}

log "======================================================"
log "Vivado BNN build started"
log "  Project  : ${project_name}"
log "  BD name  : ${bd_name}  (-> ${bd_name}.bit / .hwh)"
log "  Part     : ${part}"
log "  Verilog  : ${VERILOG_DIR}"
log "  DMA IN   : 169 x uint32 (Q8.8 CAN features) = 676 B"
log "  DMA OUT  :   1 x uint32 (class 0/1/2) = 4 B"
log "  Log      : ${LOG_PATH}"
log "======================================================"

# Suppress benign IP / DRC warnings
set_msg_config -id {[BD 41-2384]}      -suppress
set_msg_config -id {[IP_Flow 19-4994]} -suppress
set_msg_config -id {[IP_Flow 19-4995]} -suppress
set_msg_config -id {[Timing 38-313]}   -suppress
set_msg_config -id {[Synth 8-7080]}    -suppress
set_msg_config -id {[Common 17-1361]}  -suppress
set_msg_config -id {[DRC DPOP-1]}      -suppress
set_msg_config -id {[DRC DPOP-2]}      -suppress
set_msg_config -id {[DRC REQP-1839]}   -suppress

# Create project
log "Creating Vivado project at: ${project_dir}"
create_project ${project_name} ${project_dir} -part ${part} -force
log "Project created."

# Add RTL sources
# bnn_can_weights.vh uses SystemVerilog (localparam logic signed arrays).
# bnn_accelerator.v includes it -- set file_type SystemVerilog so the SV
# elaborator handles the array localparam syntax. Add include_dirs so
# `include "bnn_can_weights.vh" resolves correctly.
log "Adding Verilog sources from: ${VERILOG_DIR}"
add_files -norecurse "${VERILOG_DIR}/bnn_accelerator.v"
add_files -norecurse "${VERILOG_DIR}/bnn_can_weights.vh"
set_property file_type SystemVerilog  [get_files "${VERILOG_DIR}/bnn_accelerator.v"]
set_property FILE_TYPE {Verilog Header} [get_files "${VERILOG_DIR}/bnn_can_weights.vh"]
set_property include_dirs [list "${VERILOG_DIR}"] [current_fileset]
update_compile_order -fileset sources_1
log "RTL sources added (SV, include_dirs=${VERILOG_DIR})."

# Create block design
log "Creating block design: ${bd_name}"
create_bd_design ${bd_name}

# Zynq PS7
log "Adding Zynq PS7 ..."
set zynq [create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 ps7]
set_property -dict [list \\
    CONFIG.PCW_USE_M_AXI_GP0              {1}   \\
    CONFIG.PCW_USE_S_AXI_HP0              {1}   \\
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ   {125} \\
    CONFIG.PCW_EN_CLK0_PORT               {1}   \\
    CONFIG.PCW_EN_RST0_PORT               {1}   \\
    CONFIG.PCW_ENET0_PERIPHERAL_ENABLE    {1}   \\
    CONFIG.PCW_USB0_PERIPHERAL_ENABLE     {1}   \\
    CONFIG.PCW_SD0_PERIPHERAL_ENABLE      {1}   \\
    CONFIG.PCW_UART1_PERIPHERAL_ENABLE    {1}   \\
    CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE  {1}   \\
] [get_bd_cells ps7]
make_bd_intf_pins_external [get_bd_intf_pins ps7/DDR]
make_bd_intf_pins_external [get_bd_intf_pins ps7/FIXED_IO]

# AXI DMA (32-bit streams, no scatter-gather)
# c_sg_length_width=16 -> max transfer = 64 KB
#   Required: 169x4=676 B (in) + 4 B (out)  well within 64 KB
log "Adding AXI DMA ..."
set dma [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0]
set_property -dict [list \\
    CONFIG.c_include_sg              {0}  \\
    CONFIG.c_sg_length_width         {16} \\
    CONFIG.c_m_axi_mm2s_data_width   {32} \\
    CONFIG.c_m_axis_mm2s_tdata_width {32} \\
    CONFIG.c_m_axi_s2mm_data_width   {32} \\
    CONFIG.c_s_axis_s2mm_tdata_width {32} \\
] [get_bd_cells axi_dma_0]

# BNN Accelerator -- module reference to RTL
# Vivado infers AXI-Stream interfaces from port naming:
#   s_axis_tdata/tvalid/tready/tlast  -> S_AXIS (slave = receives features)
#   m_axis_tdata/tvalid/tready/tlast  -> M_AXIS (master = sends class index)
log "Adding BNN module reference ..."
set bnn [create_bd_cell -type module -reference bnn_accelerator bnn_acc_0]

# AXI Interconnect -- control path (GP0 -> DMA AXI-Lite)
# bnn_accelerator has no AXI-Lite control port (free-running design).
set ic_ctrl [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ctrl]
set_property CONFIG.NUM_SI 1 [get_bd_cells axi_ic_ctrl]
set_property CONFIG.NUM_MI 1 [get_bd_cells axi_ic_ctrl]

# AXI Interconnect -- data path (DMA MM2S + S2MM -> HP0)
set ic_hp0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_hp0]
set_property CONFIG.NUM_SI 2 [get_bd_cells axi_ic_hp0]
set_property CONFIG.NUM_MI 1 [get_bd_cells axi_ic_hp0]

# Reset
set rst [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_gen]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0]     [get_bd_pins rst_gen/slowest_sync_clk]
connect_bd_net [get_bd_pins ps7/FCLK_RESET0_N]  [get_bd_pins rst_gen/ext_reset_in]

# Clock: all blocks on FCLK0 (125 MHz)
log "Connecting clocks ..."
set clk [get_bd_pins ps7/FCLK_CLK0]
foreach pin [list \\
    ps7/M_AXI_GP0_ACLK          ps7/S_AXI_HP0_ACLK           \\
    axi_dma_0/s_axi_lite_aclk   axi_dma_0/m_axi_mm2s_aclk    \\
    axi_dma_0/m_axi_s2mm_aclk   \\
    bnn_acc_0/aclk               \\
    axi_ic_ctrl/ACLK             axi_ic_ctrl/S00_ACLK          \\
    axi_ic_ctrl/M00_ACLK         \\
    axi_ic_hp0/ACLK              axi_ic_hp0/S00_ACLK           \\
    axi_ic_hp0/S01_ACLK          axi_ic_hp0/M00_ACLK           \\
] {
    set p [get_bd_pins -quiet $pin]
    if {[llength $p] > 0} {
        connect_bd_net $clk $p
    } else {
        log "  WARNING: clock pin not found: $pin"
    }
}

# Resets
connect_bd_net [get_bd_pins rst_gen/interconnect_aresetn] \\
    [get_bd_pins axi_ic_ctrl/ARESETN] \\
    [get_bd_pins axi_ic_hp0/ARESETN]

connect_bd_net [get_bd_pins rst_gen/peripheral_aresetn] \\
    [get_bd_pins bnn_acc_0/aresetn]           \\
    [get_bd_pins axi_dma_0/axi_resetn]        \\
    [get_bd_pins axi_ic_ctrl/M00_ARESETN]     \\
    [get_bd_pins axi_ic_ctrl/S00_ARESETN]     \\
    [get_bd_pins axi_ic_hp0/S00_ARESETN]      \\
    [get_bd_pins axi_ic_hp0/S01_ARESETN]      \\
    [get_bd_pins axi_ic_hp0/M00_ARESETN]

# AXI-Lite control: PS7.GP0 -> ic_ctrl -> DMA
connect_bd_intf_net [get_bd_intf_pins ps7/M_AXI_GP0]       [get_bd_intf_pins axi_ic_ctrl/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ic_ctrl/M00_AXI] [get_bd_intf_pins axi_dma_0/S_AXI_LITE]

# AXI-Stream: DMA.M_AXIS_MM2S -> bnn_acc_0.S_AXIS  and  bnn_acc_0.M_AXIS -> DMA.S_AXIS_S2MM
#
# We use connect_bd_intf_net because the DMA exposes its stream signals only as
# bus interface pins -- not as individual signal pins accessible via get_bd_pins.
# Vivado infers S_AXIS / M_AXIS interfaces on the module reference from the
# standard s_axis_* / m_axis_* port name prefix conventions (UG994).
#
# If Vivado uses lowercase (s_axis / m_axis), the fallback branch handles it.
log "Connecting AXI-Stream interfaces ..."
set s_intf [get_bd_intf_pins -quiet bnn_acc_0/S_AXIS]
if {[llength $s_intf] == 0} { set s_intf [get_bd_intf_pins -quiet bnn_acc_0/s_axis] }
set m_intf [get_bd_intf_pins -quiet bnn_acc_0/M_AXIS]
if {[llength $m_intf] == 0} { set m_intf [get_bd_intf_pins -quiet bnn_acc_0/m_axis] }

if {[llength $s_intf] == 0 || [llength $m_intf] == 0} {
    log "ERROR: AXI-Stream interfaces not inferred on bnn_acc_0."
    log "  Available intf pins: [get_bd_intf_pins bnn_acc_0/*]"
    log "  Available signal pins: [get_bd_pins bnn_acc_0/*]"
    log "  Fix: rename s_axis_* ports to S_AXIS_* or package RTL as an IP."
    close $LOG_FD
    exit 1
}
log "  bnn_acc_0 S_AXIS intf : $s_intf"
log "  bnn_acc_0 M_AXIS intf : $m_intf"
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] $s_intf
connect_bd_intf_net $m_intf [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM]
log "AXI-Stream connected."

# DMA to DDR via HP0
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXI_MM2S] [get_bd_intf_pins axi_ic_hp0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXI_S2MM] [get_bd_intf_pins axi_ic_hp0/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ic_hp0/M00_AXI]   [get_bd_intf_pins ps7/S_AXI_HP0]

log "Assigning addresses ..."
assign_bd_address
log "Validating block design ..."
validate_bd_design
save_bd_design
log "Block design validated and saved."

# HDL wrapper
log "Generating HDL wrapper ..."
make_wrapper -files [get_files ${bd_name}.bd] -top
add_files -norecurse \\
    "${project_dir}/${project_name}.srcs/sources_1/bd/${bd_name}/hdl/${bd_name}_wrapper.v"
set_property top ${bd_name}_wrapper [current_fileset]
update_compile_order -fileset sources_1
log "Wrapper set as top: ${bd_name}_wrapper"

# DRC waivers
create_waiver -quiet -type DRC -id {DPOP-1}    -description "Benign hint from Xilinx AXI DMA IP"
create_waiver -quiet -type DRC -id {DPOP-2}    -description "Benign hint from Xilinx AXI DMA IP"
create_waiver -quiet -type DRC -id {REQP-1839} -description "RAMB async reset inside Xilinx AXI DMA IP"

# Step 1: RTL Synthesis
log "Launching RTL synthesis (synth_1) -- takes a few minutes ..."
set t_synth [clock seconds]
launch_runs synth_1 -jobs 4
wait_on_run synth_1
set t_synth_elapsed [expr {[clock seconds] - $t_synth}]

set synth_status   [get_property STATUS   [get_runs synth_1]]
set synth_progress [get_property PROGRESS [get_runs synth_1]]
log "synth_1 done in ${t_synth_elapsed}s | status: $synth_status | progress: $synth_progress"

if {![string equal $synth_progress "100%"]} {
    log "ERROR: synth_1 did not reach 100%."
    log "  Vivado log: ${project_dir}/${project_name}.runs/synth_1/runme.log"
    close $LOG_FD
    exit 1
}
log "RTL synthesis PASSED."

# Log post-synthesis utilisation
set synth_rpt "${project_dir}/${project_name}.runs/synth_1/${bd_name}_wrapper_utilization_synth.rpt"
if {[file exists $synth_rpt]} {
    log "Parsing synthesis utilisation ..."
    set fd [open $synth_rpt r]
    set in_section 0 ; set cap 0
    while {[gets $fd line] >= 0} {
        if {[string match "*Slice LUTs*"  $line] ||
            [string match "*Block RAM*"   $line] ||
            [string match "*DSPs*"        $line] ||
            [string match "*1. CLB Logic*" $line]} { set in_section 1 ; set cap 0 }
        if {$in_section} { log "  SYN | $line" ; incr cap ; if {$cap > 30} {set in_section 0} }
    }
    close $fd
}

# Step 2: Implementation + Bitstream (single launch -- avoids double-launch bug)
# launch_runs impl_1 -to_step write_bitstream runs place+route AND bitstream in one shot.
log "Launching implementation + bitstream (impl_1) -- takes 10-30 minutes ..."
set t_impl [clock seconds]
set_property STEPS.ROUTE_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs impl_1]
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
set t_impl_elapsed [expr {[clock seconds] - $t_impl}]

set impl_status   [get_property STATUS   [get_runs impl_1]]
set impl_progress [get_property PROGRESS [get_runs impl_1]]
log "impl_1 done in ${t_impl_elapsed}s | status: $impl_status | progress: $impl_progress"

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
        if {$in_section} { log "  TIM | $line" ; incr cap ; if {$cap > 20} {set in_section 0} }
    }
    close $fd
}

# Collect outputs
file mkdir ${VF_DIR}
file mkdir ${OUT_DIR}

set bit_src "${project_dir}/${project_name}.runs/impl_1/${bd_name}_wrapper.bit"
if {![file exists $bit_src]} {
    log "ERROR: Bitstream not found at: $bit_src"
    log "  impl_1 may have failed -- check runme.log above."
    close $LOG_FD
    exit 1
}
file copy -force $bit_src "${VF_DIR}/bnn_accelerator.bit"
log "Bitstream copied: ${VF_DIR}/bnn_accelerator.bit  ([expr {[file size ${VF_DIR}/bnn_accelerator.bit] / 1024 / 1024}] MB)"

write_hw_platform -fixed -force -include_bit "${OUT_DIR}/bnn_accelerator.xsa"
log "XSA written    : ${OUT_DIR}/bnn_accelerator.xsa"

log "======================================================"
log "BUILD COMPLETE"
log "  Bitstream : ${VF_DIR}/bnn_accelerator.bit"
log "  XSA       : ${OUT_DIR}/bnn_accelerator.xsa"
log "  Log       : ${LOG_PATH}"
log ""
log "Next steps:"
log "  1. python fpga/pynq/extract_hwh.py"
log "  2. python fpga/pynq/deploy.py"
log "  3. On board: open bnn_inference_pynq.ipynb"
log "======================================================"

close $LOG_FD
"""

TCL.write_text(content, encoding="ascii")
print(f"Written: {TCL}  ({TCL.stat().st_size} bytes)")
