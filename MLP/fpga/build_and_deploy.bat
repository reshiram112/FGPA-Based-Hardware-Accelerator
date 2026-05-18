@echo off
setlocal
REM ============================================================
REM build_and_deploy.bat -- Siren MLP FPGA full pipeline
REM
REM   Step 0 : Generate C++ weight header (skipped if already done)
REM   Step 1 : Vitis HLS synthesis  -> hls_ip.zip
REM   Step 2 : Unzip HLS IP         -> hls_ip\
REM   Step 3 : Vivado bitstream     -> mlp_vivado_files\mlp_accelerator.bit
REM   Step 4 : Extract .hwh         -> mlp_vivado_files\mlp_accelerator.hwh
REM   Step 5 : SCP deploy to board  -> 192.168.2.99
REM
REM Usage (run from ANY directory -- paths are relative to this bat):
REM   MLP\fpga\build_and_deploy.bat
REM
REM To skip deploy, comment out Step 5 at the bottom.
REM ============================================================

REM --------------------------------------------------------
REM Auto-detect Python -- override this line if needed:
REM   set "PYTHON=C:\Users\YourName\AppData\Local\Programs\Python\Python311\python.exe"
REM --------------------------------------------------------
set "PYTHON="
for /f "tokens=*" %%i in ('where python 2^>nul') do (if not defined PYTHON set "PYTHON=%%i")
if not defined PYTHON if exist "%LOCALAPPDATA%\Programs\Python\Python311\python.exe" set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python311\python.exe"
if not defined PYTHON if exist "%LOCALAPPDATA%\Programs\Python\Python312\python.exe" set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python312\python.exe"
if not defined PYTHON if exist "%LOCALAPPDATA%\Programs\Python\Python313\python.exe" set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python313\python.exe"
if not defined PYTHON if exist "C:\Program Files\Python313\python.exe" set "PYTHON=C:\Program Files\Python313\python.exe"
if not defined PYTHON if exist "C:\Program Files\Python312\python.exe" set "PYTHON=C:\Program Files\Python312\python.exe"
if not defined PYTHON if exist "C:\Program Files\Python311\python.exe" set "PYTHON=C:\Program Files\Python311\python.exe"
if not defined PYTHON (
    echo ERROR: Python not found. Please set PYTHON= at the top of this bat file.
    echo   e.g.  set "PYTHON=C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python311\python.exe"
    exit /b 1
)

set "FPGA=%~dp0"
set "HLS_DIR=%FPGA%hls"
set "VIV_DIR=%FPGA%vivado"
set "PYNQ_DIR=%FPGA%pynq"
set "WEIGHTS_H=%HLS_DIR%\mlp_weights_data.h"
set "HLS_ZIP=%FPGA%hls_ip.zip"
set "HLS_IP=%FPGA%hls_ip"

echo.
echo ============================================================
echo  Siren MLP FPGA Accelerator -- Full Build Pipeline
echo  Python: %PYTHON%
echo ============================================================

REM ---- Step 0 : Generate weight header (skip if up-to-date) ----
echo.
echo [0/5] Generating C++ weight header ...
if exist "%WEIGHTS_H%" (
    echo       mlp_weights_data.h already exists -- skipping.
    echo       Delete it to regenerate: del "%WEIGHTS_H%"
) else (
    "%PYTHON%" "%HLS_DIR%\generate_weights.py"
    if %errorlevel% neq 0 (
        echo.
        echo ERROR: generate_weights.py failed. Aborting.
        exit /b 1
    )
)

REM ---- Step 1 : Vitis HLS synthesis ----
echo.
echo [1/5] Running Vitis HLS synthesis  (this takes a few minutes) ...
echo       Log: %HLS_DIR%\hls_build.log
REM Run in a fresh cmd instance so HLS env vars do NOT bleed into Vivado step
cmd /c "%HLS_DIR%\run_hls_here.bat"
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Vitis HLS failed. Check %HLS_DIR%\hls_build.log
    exit /b 1
)
echo [1/5] HLS done. Output: %HLS_ZIP%

REM ---- Step 2 : Unzip HLS IP ----
echo.
echo [2/5] Unzipping HLS IP ...
if not exist "%HLS_ZIP%" (
    echo ERROR: %HLS_ZIP% not found -- HLS step may have failed.
    exit /b 1
)
if exist "%HLS_IP%" rmdir /s /q "%HLS_IP%"
powershell -NoProfile -Command "Expand-Archive -Path '%HLS_ZIP%' -DestinationPath '%HLS_IP%' -Force"
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Unzip failed. Aborting.
    exit /b 1
)
echo [2/5] Unzipped to: %HLS_IP%

REM ---- Step 3 : Vivado block design + bitstream ----
echo.
echo [3/5] Running Vivado block design + bitstream  (10-30 minutes) ...
echo       Log: %VIV_DIR%\vivado_run.log
REM Run in a fresh cmd instance -- Vivado env must NOT mix with HLS env
cmd /c "%VIV_DIR%\run_vivado_here.bat"
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Vivado build failed. Check %VIV_DIR%\vivado_run.log
    exit /b 1
)
echo [3/5] Vivado done. Bitstream: %PYNQ_DIR%\mlp_vivado_files\mlp_accelerator.bit

REM ---- Step 4 : Extract .hwh from .xsa ----
echo.
echo [4/5] Extracting .hwh from .xsa ...
"%PYTHON%" "%PYNQ_DIR%\extract_hwh.py"
if %errorlevel% neq 0 (
    echo.
    echo ERROR: extract_hwh.py failed. Aborting.
    exit /b 1
)
echo [4/5] Done. HWH: %PYNQ_DIR%\mlp_vivado_files\mlp_accelerator.hwh

REM ---- Step 5 : Deploy to PYNQ-Z2 ----
echo.
echo [5/5] Deploying to PYNQ-Z2 (192.168.2.99) ...
echo       (Make sure the board is connected via USB-Ethernet first)
"%PYTHON%" "%PYNQ_DIR%\deploy.py"
if %errorlevel% neq 0 (
    echo.
    echo ERROR: deploy.py failed. Is the board connected and powered on?
    exit /b 1
)

REM ---- Done ----
echo.
echo ============================================================
echo  All steps complete!
echo.
echo  Next: open your browser to
echo        http://192.168.2.99:9090  (password: xilinx)
echo  Navigate to  siren_mlp/
echo  Open         mlp_inference_pynq.ipynb
echo  Run          Kernel ^> Restart ^& Run All
echo ============================================================
endlocal