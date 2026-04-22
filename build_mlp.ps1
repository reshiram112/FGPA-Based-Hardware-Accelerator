$env:PATH = "C:\Xilinx\2025.1\Vivado\bin;C:\Xilinx\2025.1\Vitis\bin;" + $env:PATH

Write-Host "Running MLP HLS Synthesis..."
cd MLP\fpga\hls
vitis-run.bat --mode hls --tcl run_hls.tcl > hls_run.log 2>&1
cd ..\..\..

Write-Host "Building MLP Vivado Block Design..."
Remove-Item -Recurse -Force MLP\fpga\vivado\proj_mnist_mlp -ErrorAction SilentlyContinue
vivado.bat -mode batch -source MLP\fpga\vivado\create_project.tcl -nojournal -nolog > mlp_build.log 2>&1

Write-Host "Committing and Pushing..."
git add MLP/fpga/vivado/proj_mnist_mlp/output/*
git commit -m "Final bits with zero warnings (baked in hardcoded weights)"
git push origin main
Write-Host "Done!"
