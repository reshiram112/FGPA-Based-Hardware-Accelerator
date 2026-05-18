@echo off
setlocal
REM ============================================================
REM run_vivado_here.bat  --  MLP Vivado batch build wrapper
REM
REM Prerequisites:
REM   1. HLS must be done:  run_hls_here.bat  (in fpga\hls\)
REM   2. IP unzipped:
REM      Expand-Archive "..\hls_ip.zip" -DestinationPath "..\hls_ip" -Force
REM
REM Run from PowerShell:
REM   cmd /c "C:\Users\TA17084\fpga_radioml_mlp\MLP\fpga\vivado\run_vivado_here.bat"
REM
REM Outputs:
REM   fpga\pynq\mlp_vivado_files\mlp_accelerator.bit
REM   fpga\vivado\proj_mlp_accelerator\output\mlp_accelerator.xsa
REM   fpga\vivado\vivado_build.log
REM
REM After this bat finishes:
REM   python ..\pynq\extract_hwh.py
REM      -> fpga\pynq\mlp_vivado_files\mlp_accelerator.hwh
REM ============================================================

echo.
echo === Running Vivado batch build in: %~dp0
echo === TCL script: create_project.tcl
echo.

REM Call settings64.bat to set up the Vivado environment,
REM then run Vivado directly.  setlocal above keeps the env
REM changes contained to this bat file.
call "C:\Xilinx\2025.1\Vivado\settings64.bat"
vivado -mode batch -source "%~dp0create_project.tcl" -log "%~dp0vivado_run.log"

exit /b %errorlevel%
