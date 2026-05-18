@echo off
setlocal
REM ============================================================
REM build_and_deploy.bat -- CAN Vehicle BNN FPGA full pipeline
REM
REM   Step 1 : Vivado bitstream     -> bnn_vivado_files\bnn_accelerator.bit
REM   Step 2 : Extract .hwh         -> bnn_vivado_files\bnn_accelerator.hwh
REM   Step 3 : SCP deploy to board  -> 192.168.2.99
REM
REM No HLS step needed -- pure Verilog design.
REM Weights are baked into the bitstream via bnn_can_weights.vh.
REM
REM Usage (run from ANY directory):
REM   bnn_accelerator\fpga\build_and_deploy.bat
REM ============================================================

set "PYTHON="
for /f "tokens=*" %%i in ('where python 2^>nul') do (if not defined PYTHON set "PYTHON=%%i")
if not defined PYTHON if exist "%LOCALAPPDATA%\Programs\Python\Python311\python.exe" set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python311\python.exe"
if not defined PYTHON if exist "%LOCALAPPDATA%\Programs\Python\Python312\python.exe" set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python312\python.exe"
if not defined PYTHON if exist "%LOCALAPPDATA%\Programs\Python\Python313\python.exe" set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python313\python.exe"
if not defined PYTHON (
    echo ERROR: Python not found.
    exit /b 1
)

set "FPGA=%~dp0"
set "VIV_DIR=%FPGA%vivado"
set "PYNQ_DIR=%FPGA%pynq"

echo.
echo ============================================================
echo  CAN Vehicle BNN FPGA Accelerator -- Build Pipeline
echo  Python: %PYTHON%
echo ============================================================

REM ---- Step 1 : Vivado bitstream ----
echo.
echo [1/3] Running Vivado build  (30-60 min) ...
echo       Log: %VIV_DIR%\vivado_build.log
cmd /c "%VIV_DIR%\run_vivado_here.bat"
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Vivado failed. Check %VIV_DIR%\vivado_build.log
    exit /b 1
)
echo [1/3] Vivado done.

REM ---- Step 2 : Extract .hwh ----
echo.
echo [2/3] Extracting hardware handoff (.hwh) ...
"%PYTHON%" "%PYNQ_DIR%\extract_hwh.py"
if %errorlevel% neq 0 (
    echo ERROR: extract_hwh.py failed.
    exit /b 1
)
echo [2/3] HWH extracted.

REM ---- Step 3 : Deploy to PYNQ ----
echo.
echo [3/3] Deploying to PYNQ-Z2 at 192.168.2.99 ...
"%PYTHON%" "%PYNQ_DIR%\deploy.py"
if %errorlevel% neq 0 (
    echo ERROR: deploy.py failed. Board reachable?
    exit /b 1
)
echo [3/3] Deploy done.

echo.
echo ============================================================
echo  BUILD AND DEPLOY COMPLETE
echo  Open: http://192.168.2.99:9090  (JupyterLab)
echo  Notebook: can_vehicle_bnn/bnn_inference_pynq.ipynb
echo ============================================================
