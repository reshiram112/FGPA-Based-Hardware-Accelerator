$env:PATH = "C:\Xilinx\2025.1\Vivado\bin;C:\Xilinx\2025.1\Vitis\bin;" + $env:PATH

# ── CNN HLS ─────────────────────────────────────────────────────
Write-Host "[1/4] CNN HLS Synthesis..."
Push-Location CNN\fpga\hls
Remove-Item -Recurse -Force cnn_top   -ErrorAction SilentlyContinue
Remove-Item -Force ..\hls_ip.zip      -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force ..\hls_ip -ErrorAction SilentlyContinue
vitis-run.bat --mode hls --tcl run_hls.tcl > hls_run.log 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "CNN HLS FAILED - check CNN\fpga\hls\hls_run.log"
    Pop-Location; exit 1
}
Pop-Location
Expand-Archive -Path CNN\fpga\hls_ip.zip -DestinationPath CNN\fpga\hls_ip -Force
Write-Host "CNN HLS done."

# ── MLP HLS ─────────────────────────────────────────────────────
Write-Host "[2/4] MLP HLS Synthesis..."
Push-Location MLP\fpga\hls
Remove-Item -Recurse -Force mlp_top   -ErrorAction SilentlyContinue
Remove-Item -Force ..\hls_ip.zip      -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force ..\hls_ip -ErrorAction SilentlyContinue
vitis-run.bat --mode hls --tcl run_hls.tcl > hls_run.log 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "MLP HLS FAILED - check MLP\fpga\hls\hls_run.log"
    Pop-Location; exit 1
}
Pop-Location
Expand-Archive -Path MLP\fpga\hls_ip.zip -DestinationPath MLP\fpga\hls_ip -Force
Write-Host "MLP HLS done."

# ── CNN Vivado ───────────────────────────────────────────────────
Write-Host "[3/4] CNN Vivado Build..."
Remove-Item -Recurse -Force CNN\fpga\vivado\proj_mnist_cnn -ErrorAction SilentlyContinue
vivado.bat -mode batch -source CNN\fpga\vivado\create_project.tcl -nojournal -nolog > cnn_build.log 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "CNN Vivado FAILED - check cnn_build.log"
    exit 1
}
Write-Host "CNN Vivado done."

# ── MLP Vivado ───────────────────────────────────────────────────
Write-Host "[4/4] MLP Vivado Build..."
Remove-Item -Recurse -Force MLP\fpga\vivado\proj_mnist_mlp -ErrorAction SilentlyContinue
vivado.bat -mode batch -source MLP\fpga\vivado\create_project.tcl -nojournal -nolog > mlp_build.log 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "MLP Vivado FAILED - check mlp_build.log"
    exit 1
}
Write-Host "MLP Vivado done."

Write-Host "=== ALL BUILDS COMPLETE ==="
Write-Host "CNN bit: CNN\fpga\vivado\proj_mnist_cnn\output\cnn.bit"
Write-Host "MLP bit: MLP\fpga\vivado\proj_mnist_mlp\output\mlp.bit"
