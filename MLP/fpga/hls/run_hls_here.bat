@echo off
setlocal
REM ============================================================
REM run_hls_here.bat  --  MLP Vitis HLS wrapper for 2025.1
REM
REM STEP 0 (run ONCE before this bat, if mlp_weights_data.h
REM         does not already exist):
REM   "C:\Program Files\Python313\python.exe" generate_weights.py
REM
REM STEP 1 (this bat):
REM   double-click, OR from PowerShell:
REM   cmd /c "C:\Users\TA17084\fpga_radioml_mlp\MLP\fpga\hls\run_hls_here.bat"
REM
REM STEP 2 (after this bat finishes, from PowerShell):
REM   Expand-Archive "..\hls_ip.zip" -DestinationPath "..\hls_ip" -Force
REM
REM DO NOT call Vivado\settings64.bat before running this bat --
REM it corrupts TCL_LIBRARY and causes "init.tcl not found" errors.
REM ============================================================

set _RDI_CWD=%cd%
pushd "C:\Xilinx\2025.1\Vitis\bin"
set _RDI_BINROOT=%cd%
cd /d "%_RDI_CWD%"

set RDI_PROG=vitis_hls
call "%_RDI_BINROOT%\setupEnv.bat"
set RDI_DATADIR=C:\Xilinx\2025.1\Vitis\data
set XILINX_HLS=C:\Xilinx\2025.1\Vitis
set XILINX_VIVADO=C:\Xilinx\2025.1\Vivado
set PATH=C:\Xilinx\2025.1\Vivado\bin;C:\Xilinx\2025.1\Vitis\bin;%PATH%

cd /d "%~dp0"
echo.
echo === Running vitis_hls in: %cd%
echo === TCL script: run_hls.tcl
echo.
call "%_RDI_BINROOT%\loader.bat" -exec vitis_hls -f run_hls.tcl

popd
exit /b %errorlevel%
