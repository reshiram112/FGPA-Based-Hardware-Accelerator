@echo off
setlocal
REM run_vivado_here.bat -- BNN Vivado batch build wrapper
REM
REM Prerequisites: none (pure Verilog, no HLS step needed)
REM
REM Outputs:
REM   fpga\pynq\bnn_vivado_files\bnn_accelerator.bit
REM   fpga\vivado\proj_bnn_accelerator\output\bnn_accelerator.xsa
REM
REM After this bat: python ..\pynq\extract_hwh.py

echo.
echo === Running Vivado batch build in: %~dp0
echo === TCL script: create_project.tcl
echo.

REM Locate vivado.bat -- initialise to empty so the "if not defined" check works.
REM (Setting a variable and then checking "if not defined" that same variable in
REM  the same setlocal block never triggers -- the variable is always defined.)
set "VIVADO_BAT="
if exist "C:\Xilinx\2025.1\Vivado\bin\vivado.bat" set "VIVADO_BAT=C:\Xilinx\2025.1\Vivado\bin\vivado.bat"
if not defined VIVADO_BAT (
    for /f "tokens=*" %%v in ('where vivado 2^>nul') do set "VIVADO_BAT=%%v"
)
if not defined VIVADO_BAT (
    echo ERROR: vivado.bat not found. Add Vivado to PATH or check install path.
    exit /b 1
)

"%VIVADO_BAT%" -mode batch -source "%~dp0create_project.tcl" -nojournal -nolog
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Vivado failed. Check %~dp0vivado_build.log
    exit /b 1
)
echo.
echo === Vivado build complete.
