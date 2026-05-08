# ============================================================
#  run_hls.tcl — Vitis HLS 2025.1 Automation Script
# ============================================================

set project_name  "bnn_top"
set solution_name "solution"
set part          "xc7z020clg400-1"   ;# PYNQ-Z2
set clock_period  "10"                 ;# 10 ns = 100 MHz

set hls_src_dir  "[file normalize [file dirname [info script]]]"
puts "HLS source directory: ${hls_src_dir}"

open_project  ${project_name}
set_top       bnn_top
open_solution ${solution_name} -flow_target vivado

set_part ${part}
create_clock -period ${clock_period} -name default

add_files "${hls_src_dir}/bnn_top.cpp" -cflags "-I${hls_src_dir}"
add_files "${hls_src_dir}/bnn_top.h"   -cflags "-I${hls_src_dir}"

puts "Running HLS synthesis (C → RTL)..."
csynth_design

set hls_ip_out "[file normalize ${hls_src_dir}/../hls_ip]"
puts "Exporting IP to: ${hls_ip_out}.zip"
export_design -format ip_catalog -description "BNN Accelerator" \
    -vendor "xilinx.com" -library "hls" -version "1.0" \
    -output "${hls_ip_out}.zip"

puts "\n=== HLS DONE ==="
puts "IP exported to: [file normalize ../hls_ip.zip]"
close_project
