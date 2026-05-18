# ============================================================
#  run_hls.tcl — Vitis HLS 2025.1 Automation Script (CNN)
#  Creates the HLS project, adds sources, runs synthesis, 
#  and exports the IP for Vivado.
# ============================================================

set project_name  "cnn_top"
set solution_name "solution"
set part          "xc7z020clg400-1"   ;# PYNQ-Z2
set clock_period  "8"                    ;# 8 ns = 125 MHz

# Absolute path to the HLS sources directory
set hls_src_dir  "[file normalize [file dirname [info script]]]"
puts "HLS source directory: ${hls_src_dir}"

# ── 1. Create HLS project ─────────────────────────────────────
open_project  ${project_name}
set_top       cnn_top
open_solution ${solution_name} -flow_target vivado

# Target FPGA part
set_part ${part}

# Clock constraint (100 MHz target)
create_clock -period ${clock_period} -name default

# ── 2. Add source files ───────────────────────────────────────
add_files "${hls_src_dir}/cnn_top.cpp" -cflags "-I${hls_src_dir}"
add_files "${hls_src_dir}/cnn_top.h"   -cflags "-I${hls_src_dir}"

# ── 3. Run HLS synthesis ──────────────────────────────────────
puts "Running HLS synthesis (C → RTL)..."
csynth_design

# ── 4. Export IP for Vivado ───────────────────────────────────
set hls_ip_out "[file normalize ${hls_src_dir}/../hls_ip]"
puts "Exporting IP to: ${hls_ip_out}"
# export_design will generate an export.zip inside solution/impl/ip, we'll extract it in the powershell script
export_design -format ip_catalog -description "MNIST CNN Accelerator" \
    -vendor "xilinx.com" -library "hls" -version "1.0" \
    -output "${hls_ip_out}.zip"

puts "\n=== HLS DONE ==="
puts "IP exported to: [file normalize ../hls_ip.zip]"
puts "Next: run fpga/vivado/create_project.tcl in Vivado"

close_project
