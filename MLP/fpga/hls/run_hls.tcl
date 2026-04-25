# ============================================================
#  run_hls.tcl — Vitis HLS 2025.1 Automation Script
#  Creates the HLS project, adds sources, runs C-sim,
#  synthesis, co-sim, and exports the IP for Vivado.
#
#  Usage (Vitis HLS Tcl console or vitis_hls -f run_hls.tcl):
#    cd <repo>/fpga/hls
#    vitis_hls -f run_hls.tcl
# ============================================================

set project_name  "mlp_top"
set solution_name "solution"
set part          "xc7z020clg400-1"   ;# PYNQ-Z2
set clock_period  "8"                    ;# 8 ns = 125 MHz

# Absolute path to the HLS sources directory
set hls_src_dir  "[file normalize [file dirname [info script]]]"
puts "HLS source directory: ${hls_src_dir}"

# ── 1. Create HLS project ─────────────────────────────────────
open_project  ${project_name}
set_top       mlp_top
open_solution ${solution_name} -flow_target vivado

# Target FPGA part
set_part ${part}

# Clock constraint (100 MHz target)
create_clock -period ${clock_period} -name default

# ── 2. Add source files ───────────────────────────────────────
add_files "${hls_src_dir}/mlp_top.cpp" -cflags "-I${hls_src_dir}"
add_files "${hls_src_dir}/mlp_top.h"   -cflags "-I${hls_src_dir}"

# Testbench removed

# ── 3. HLS Directives (can also be #pragma in source) ─────────
# These set II and unroll targets for key loops.
# Adjust UNROLL factor if DSP count exceeds device budget.
set_directive_pipeline "mlp_top/READ_INPUT"
set_directive_pipeline "mlp_top/WRITE_OUTPUT"
set_directive_pipeline "mlp_top/LOAD_W"

# C-sim skipped

# ── 5. Run HLS synthesis ──────────────────────────────────────
puts "Running HLS synthesis (C → RTL)..."
csynth_design

# ── 7. Export IP for Vivado ───────────────────────────────────
set hls_ip_out "[file normalize ${hls_src_dir}/../hls_ip]"
puts "Exporting IP to: ${hls_ip_out}.zip"
export_design -format ip_catalog -description "MNIST MLP Accelerator" \
    -vendor "xilinx.com" -library "hls" -version "1.0" \
    -output "${hls_ip_out}.zip"

puts "\n=== HLS DONE ==="
puts "IP exported to: [file normalize ../hls_ip.zip]"
puts "Next: run fpga/vivado/create_project.tcl in Vivado"

close_project
