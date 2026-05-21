@echo off
setlocal
REM ============================================================
REM run_vivado_here.bat  --  CNN Vivado batch build wrapper
REM ============================================================

echo.
echo === Running Vivado batch build in: %~dp0
echo === TCL script: create_project.tcl
echo.

call "C:\Xilinx\2025.1\Vivado\settings64.bat"
vivado -mode batch -source "%~dp0create_project.tcl" -log "%~dp0vivado_run.log"

exit /b %errorlevel%
