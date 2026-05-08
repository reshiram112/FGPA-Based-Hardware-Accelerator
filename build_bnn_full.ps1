$env:PATH = "C:\Xilinx\2025.1\Vivado\bin;C:\Xilinx\2025.1\Vitis\bin;" + $env:PATH

Write-Host "Running BNN HLS Synthesis..."
cd BNN\fpga\hls
Remove-Item -Recurse -Force bnn_top -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force ..\hls_ip -ErrorAction SilentlyContinue
Remove-Item -Force ..\hls_ip.zip -ErrorAction SilentlyContinue
vitis-run.bat --mode hls --tcl run_hls.tcl > hls_run.log 2>&1
cd ..\..\..

# Unzip the IP
Expand-Archive -Path BNN\fpga\hls_ip.zip -DestinationPath BNN\fpga\hls_ip -Force

Write-Host "Building BNN Vivado Block Design..."
Remove-Item -Recurse -Force BNN\fpga\vivado\proj_mnist_bnn -ErrorAction SilentlyContinue
vivado.bat -mode batch -source BNN\fpga\vivado\create_project.tcl -nojournal -nolog > bnn_build.log 2>&1

Write-Host "BNN Build Complete. Output bitstream and xsa should be in BNN\fpga\vivado\proj_mnist_bnn\output"
