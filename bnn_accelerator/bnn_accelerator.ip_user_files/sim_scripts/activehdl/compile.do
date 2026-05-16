transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xilinx_vip  -sv2k12 "+incdir+C:/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../../Downloads/major_project_repo 3/major_project_repo/weight_extraction/verilog_headers" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/ec67/hdl" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/86fe/hdl" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/0127/hdl/verilog" "+incdir+C:/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib \
"C:/Vivado/2024.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Vivado/2024.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
"C:/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  \
"C:/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../../Downloads/major_project_repo 3/major_project_repo/weight_extraction/verilog_headers" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/ec67/hdl" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/86fe/hdl" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/0127/hdl/verilog" "+incdir+C:/Vivado/2024.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l xil_defaultlib \
"../../../../../Downloads/major_project_repo 3/major_project_repo/verilog_modules/bnn_accelerator.v" \

vlog -work xil_defaultlib \
"glbl.v"

