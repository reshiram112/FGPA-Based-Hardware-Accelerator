# run_hls.tcl -- Vitis HLS synthesis + IP export for cnn_top
#
# Synthesises the CNN AXI-Stream kernel (5-layer GTSRB backbone) and exports
# it as an IP Catalog .zip for use in Vivado.
#
# DMA interface (AXI-Stream + AXI-Lite control):
#   IN  : weights (streamed at start) then image pixels (3x32x32 int16 words)
#   OUT : 2048 feature values (128x4x4 int16 words) for FC head on PS
#
# Output : ../hls_ip.zip   (unzip -> ../hls_ip/ before running Vivado)
# Log    : hls_build.log   (written alongside this script)
#
# Usage (from the fpga/hls/ directory):
#   vitis_hls -f run_hls.tcl

set project_name  "cnn_top"
set part          "xc7z020clg400-1"
set clock_period  "8"       ;# 8 ns -> 125 MHz target

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
log "  Clock       : ${clock_period} ns  (125 MHz target)"
log "  Model       : GTSRB CNN 5-layer backbone"
log "  DMA IN      : weights then 3x32x32 image (int16)"
log "  DMA OUT     : 128x4x4 = 2048 feature values (int16)"
log "  Log file    : ${LOG_PATH}"
log "======================================================"

# -- Create / re-open project ------------------------------------------------
log "Opening HLS project ..."
open_project  ${project_name}
set_top       cnn_top
open_solution "solution" -flow_target vivado
set_part      ${part}
create_clock  -period ${clock_period} -name default
log "Project opened, solution configured."

# -- Source files ------------------------------------------------------------
log "Adding source files ..."
add_files "cnn_top.cpp" -cflags "-I."
add_files "cnn_top.h"   -cflags "-I."
log "  cnn_top.cpp  cnn_top.h  added."

# -- C/RTL Synthesis ---------------------------------------------------------
log "Running C synthesis (csynth_design) ..."
set t_start [clock seconds]
csynth_design
set t_elapsed [expr {[clock seconds] - $t_start}]
log "csynth_design finished in ${t_elapsed}s"

# -- Parse synthesis report --------------------------------------------------
set rpt "${project_name}/solution/syn/report/cnn_top_csynth.rpt"
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
    -ipname    "cnn_top" \
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
exit
