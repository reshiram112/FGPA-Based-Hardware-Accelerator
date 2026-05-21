@echo off
setlocal
REM ============================================================
REM run_hls_here.bat  --  CNN Vitis HLS wrapper for 2025.1
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
