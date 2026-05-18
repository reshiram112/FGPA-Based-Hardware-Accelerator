@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "VENV_PY=%SCRIPT_DIR%..\..\.venv\Scripts\python.exe"

if exist "%VENV_PY%" (
    "%VENV_PY%" "%SCRIPT_DIR%upload_integration_bundle.py" %*
) else (
    python "%SCRIPT_DIR%upload_integration_bundle.py" %*
)

endlocal