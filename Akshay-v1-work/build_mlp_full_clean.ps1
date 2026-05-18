$env:PATH = "C:\Xilinx\2025.1\Vivado\bin;C:\Xilinx\2025.1\Vitis\bin;" + $env:PATH

Write-Host "Running MLP HLS Synthesis Clean..."
cd MLP\fpga\hls
Remove-Item -Recurse -Force mlp_top -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force ..\hls_ip -ErrorAction SilentlyContinue
Remove-Item -Force ..\hls_ip.zip -ErrorAction SilentlyContinue
vitis-run.bat --mode hls --tcl run_hls.tcl > hls_run.log 2>&1
cd ..\..\..
# Unzip the IP
Expand-Archive -Path MLP\fpga\hls_ip.zip -DestinationPath MLP\fpga\hls_ip -Force

Write-Host "Building MLP Vivado Block Design..."
Remove-Item -Recurse -Force MLP\fpga\vivado\proj_mnist_mlp -ErrorAction SilentlyContinue
vivado.bat -mode batch -source MLP\fpga\vivado\create_project.tcl -nojournal -nolog > mlp_build.log 2>&1

Write-Host "Embedding Bitstreams into Notebooks..."
python embed_bitstreams.py

Write-Host "Committing and Pushing..."
git add CNN/fpga/pynq/mnist_cnn_inference.ipynb
git add MLP/fpga/pynq/mnist_inference.ipynb
git commit -m "Final notebooks embedded with bitstreams - True Clean Build"
git push origin main
Write-Host "Done!"
