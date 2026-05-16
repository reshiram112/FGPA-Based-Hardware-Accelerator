transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+bnn_accelerator  -L xil_defaultlib -L xilinx_vip -L xpm -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.bnn_accelerator xil_defaultlib.glbl

do {bnn_accelerator.udo}

run 1000ns

endsim

quit -force
