vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_19 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_21 -L xilinx_vip "+incdir+C:/Vivado/2024.2/data/xilinx_vip/include" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Vivado/2024.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L axi_vip_v1_1_19 -L smartconnect_v1_0 -L processing_system7_vip_v1_0_21 -L xilinx_vip "+incdir+../../../../../Downloads/major_project_repo 3/major_project_repo/weight_extraction/verilog_headers" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/ec67/hdl" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/86fe/hdl" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/0127/hdl/verilog" "+incdir+C:/Vivado/2024.2/data/xilinx_vip/include" \
"C:/Vivado/2024.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Vivado/2024.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
"C:/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../../Downloads/major_project_repo 3/major_project_repo/weight_extraction/verilog_headers" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/ec67/hdl" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/86fe/hdl" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/f0b6/hdl/verilog" "+incdir+../../../bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ipshared/0127/hdl/verilog" "+incdir+C:/Vivado/2024.2/data/xilinx_vip/include" \
"../../../../../Downloads/major_project_repo 3/major_project_repo/verilog_modules/bnn_accelerator.v" \

vlog -work xil_defaultlib \
"glbl.v"

