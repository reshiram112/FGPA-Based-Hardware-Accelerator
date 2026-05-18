# run_hls.tcl -- Vitis HLS synthesis + IP export for siren mlp_top
#
# Synthesises the Siren MLP AXI-Stream kernel (41->4->2) and exports
# it as an IP Catalog .zip for use in Vivado.
# Weights are stored in on-chip LUTRAM via mlp_weights_data.h -- this
# file MUST exist before running this script.  Generate it first with:
#   python generate_weights.py
#
# DMA interface (ap_ctrl_none, no AXI-Lite control port):
#   IN  : 41 uint32 words  (one Q4.12 int16 feature in bits[15:0]) = 164 B
#   OUT :  1 uint32 word   (argmax: 0=ambulance, 1=firetruck, TLAST=1)
#   Host: dma.sendchannel / dma.recvchannel.transfer()
#
# Output : ../hls_ip.zip   (unzip -> ../hls_ip/ before running Vivado)
# Log    : hls_build.log   (written alongside this script)
#
# Usage (from the fpga/hls/ directory):
#   vitis_hls -f run_hls.tcl

set project_name  "mlp_top"
set part          "xc7z020clg400-1"
set clock_period  "10"       ;# 10 ns -> 100 MHz target

# -- Log file -----------------------------------------------------------------
set LOG_PATH "[file normalize [file dirname [info script]]]/hls_build.log"
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
log "Vitis HLS build started"
log "  Project     : ${project_name}"
log "  Part        : ${part}"
log "  Clock       : ${clock_period} ns  (100 MHz target)"
log "  Model       : Siren 41->4->2  (ambulance vs firetruck)"
log "  DMA IN      : 41 uint32 words (Q4.12 features) = 164 B"
log "  DMA OUT     : 1  uint32 word  (argmax class idx) = 4 B"
log "  Log file    : ${LOG_PATH}"
log "======================================================"

# -- Guard: mlp_weights_data.h must exist ------------------------------------
set weights_h "[file normalize [file dirname [info script]]]/mlp_weights_data.h"
if {![file exists $weights_h]} {
    log "ERROR: mlp_weights_data.h not found at: $weights_h"
    log "  Generate it first:"
    log "    cd MLP/fpga/hls"
    log "    python generate_weights.py"
    close $LOG_FD
    exit 1
}
log "Found: $weights_h  ([expr {[file size $weights_h] / 1024}] KB)"

# -- Create / re-open project ------------------------------------------------
log "Opening HLS project ..."
open_project  ${project_name}
set_top       mlp_top
open_solution "solution" -flow_target vivado
set_part      ${part}
create_clock  -period ${clock_period} -name default
log "Project opened, solution configured."

# -- Source files ------------------------------------------------------------
log "Adding source files ..."
add_files "mlp_top.cpp"        -cflags "-I."
add_files "mlp_top.h"          -cflags "-I."
add_files "mlp_weights_data.h" -cflags "-I."
log "  mlp_top.cpp  mlp_top.h  mlp_weights_data.h  added."

# -- C/RTL Synthesis ---------------------------------------------------------
log "Running C synthesis (csynth_design) ..."
set t_start [clock seconds]
csynth_design
set t_elapsed [expr {[clock seconds] - $t_start}]
log "csynth_design finished in ${t_elapsed}s"

# -- Parse synthesis report --------------------------------------------------
set rpt "${project_name}/solution/syn/report/mlp_top_csynth.rpt"
if {[file exists $rpt]} {
    log "Parsing synthesis report: [file normalize $rpt]"
    set fd [open $rpt r]
    set in_section 0
    set captured  0
    while {[gets $fd line] >= 0} {
        if {[string match "*== Performance Estimates*" $line] ||
            [string match "*== Utilization Estimates*" $line] ||
            [string match "*== Latency*"               $line] ||
            [string match "*+ Timing*"                 $line] ||
            [string match "*+ Detail*"                 $line]} {
            set in_section 1
            set captured  0
        }
        if {$in_section} {
            log "  RPT | $line"
            incr captured
            if {$captured > 80} { set in_section 0 }
        }
    }
    close $fd
} else {
    log "WARNING: Synthesis report not found at: $rpt"
}

# -- Export IP Catalog -------------------------------------------------------
log "Exporting IP catalog zip -> ../hls_ip.zip ..."
export_design \
    -format    ip_catalog \
    -vendor    "xilinx.com" \
    -library   "hls" \
    -ipname    "mlp_top" \
    -version   "1.0" \
    -output    "../hls_ip.zip"

set zip_abs [file normalize "../hls_ip.zip"]
if {[file exists $zip_abs]} {
    log "IP zip created: $zip_abs  ([expr {[file size $zip_abs] / 1024}] KB)"
} else {
    log "ERROR: IP zip was NOT created at: $zip_abs"
    close $LOG_FD
    exit 1
}

close_project
log "Project closed."

log "======================================================"
log "HLS build COMPLETE"
log "  Log    : ${LOG_PATH}"
log "  IP zip : $zip_abs"
log ""
log "  Next steps:"
log "  PowerShell: Expand-Archive ../hls_ip.zip -DestinationPath ../hls_ip"
log "  Then run  : vivado -mode batch -source ../vivado/create_project.tcl"
log "======================================================"

close $LOG_FD
