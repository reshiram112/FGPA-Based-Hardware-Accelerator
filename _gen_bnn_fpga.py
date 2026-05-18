"""Generate all BNN FPGA build/deploy files."""
import pathlib, shutil, textwrap

BASE = pathlib.Path(r"C:\Users\TA17084\fpga_radioml_mlp\Akshay-v1-work\bnn_accelerator\fpga")
SRC  = pathlib.Path(r"C:\Users\TA17084\fpga_radioml_mlp\Akshay-v1-work\major_project_repo")

for d in ["verilog", "vivado", "pynq/bnn_vivado_files"]:
    (BASE / d).mkdir(parents=True, exist_ok=True)

# ── Copy Verilog sources ─────────────────────────────────────────────────
shutil.copy(SRC / "verilog_modules/bnn_accelerator.v",
            BASE / "verilog/bnn_accelerator.v")
shutil.copy(SRC / "weight_extraction/verilog_headers/bnn_can_weights.vh",
            BASE / "verilog/bnn_can_weights.vh")
shutil.copy(SRC / "weight_extraction/bnn_can_feature_stats.npz",
            BASE / "pynq/bnn_can_feature_stats.npz")
print("Copied Verilog sources and feature stats.")

# ── Vivado create_project.tcl ────────────────────────────────────────────
(BASE / "vivado/create_project.tcl").write_text(r"""# create_project.tcl -- Vivado block design + bitstream for CAN Vehicle BNN
#
# Generates: bnn_vivado_files/bnn_accelerator.bit + bnn_accelerator.hwh
#
# Pure-Verilog IP (no HLS step needed).  The RTL is added directly as a
# module reference in the block design.
#
# DMA:
#   IN  : 169 uint32 words (one Q8.8 int16 CAN feature per 32-bit word) = 676 B
#   OUT :   1 uint32 word  (argmax class: 0=OpelAstra 1=Prototype 2=RenaultClio) = 4 B
#
# Classes: 0=OpelAstra  1=Prototype  2=RenaultClio

set project_name  "bnn_accelerator"
set bd_name       "bnn_accelerator"
set part          "xc7z020clg400-1"

set SCRIPT_DIR  "[file normalize [file dirname [info script]]]"
set VERILOG_DIR "[file normalize ${SCRIPT_DIR}/../verilog]"
set OUT_DIR     "[file normalize ${SCRIPT_DIR}/../pynq/bnn_vivado_files]"
set project_dir "${SCRIPT_DIR}/proj_${project_name}"

set LOG_PATH "${SCRIPT_DIR}/vivado_build.log"
set LOG_FD   [open ${LOG_PATH} w]
proc log {msg} {
    global LOG_FD
    set ts   [clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}]
    set line "\[$ts\] $msg"
    puts  $line
    puts  $LOG_FD $line
    flush $LOG_FD
}

log "======================================================"
log "Vivado BNN build started"
log "  Project  : ${project_name}"
log "  Part     : ${part}"
log "  Verilog  : ${VERILOG_DIR}"
log "  DMA IN   : 169 x uint32 (Q8.8 CAN features) = 676 B"
log "  DMA OUT  :   1 x uint32 (class 0/1/2) = 4 B"
log "  Log      : ${LOG_PATH}"
log "======================================================"

# Suppress benign warnings
set_msg_config -id {[BD 41-2384]}      -suppress
set_msg_config -id {[IP_Flow 19-4994]} -suppress
set_msg_config -id {[IP_Flow 19-4995]} -suppress
set_msg_config -id {[Timing 38-313]}   -suppress
set_msg_config -id {[Synth 8-7080]}    -suppress
set_msg_config -id {[Common 17-1361]}  -suppress
set_msg_config -id {[DRC DPOP-1]}      -suppress
set_msg_config -id {[DRC DPOP-2]}      -suppress
set_msg_config -id {[DRC REQP-1839]}   -suppress

# Create project
log "Creating Vivado project at: ${project_dir}"
create_project ${project_name} ${project_dir} -part ${part} -force

# Add RTL sources
log "Adding Verilog sources from: ${VERILOG_DIR}"
add_files -norecurse "${VERILOG_DIR}/bnn_accelerator.v"
add_files -norecurse "${VERILOG_DIR}/bnn_can_weights.vh"
set_property FILE_TYPE {Verilog Header} [get_files "${VERILOG_DIR}/bnn_can_weights.vh"]
update_compile_order -fileset sources_1
log "RTL sources added."

# Create block design
log "Creating block design: ${bd_name}"
create_bd_design ${bd_name}

# Zynq PS7
log "Adding Zynq PS7 ..."
set zynq [create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 ps7]
set_property -dict [list \
    CONFIG.PCW_USE_M_AXI_GP0              {1}   \
    CONFIG.PCW_USE_S_AXI_HP0              {1}   \
    CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ   {125} \
    CONFIG.PCW_EN_CLK0_PORT               {1}   \
    CONFIG.PCW_EN_RST0_PORT               {1}   \
    CONFIG.PCW_ENET0_PERIPHERAL_ENABLE    {1}   \
    CONFIG.PCW_USB0_PERIPHERAL_ENABLE     {1}   \
    CONFIG.PCW_SD0_PERIPHERAL_ENABLE      {1}   \
    CONFIG.PCW_UART1_PERIPHERAL_ENABLE    {1}   \
    CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE  {1}   \
] [get_bd_cells ps7]
make_bd_intf_pins_external [get_bd_intf_pins ps7/DDR]
make_bd_intf_pins_external [get_bd_intf_pins ps7/FIXED_IO]

# AXI DMA (32-bit streams, no scatter-gather)
log "Adding AXI DMA ..."
set dma [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0]
set_property -dict [list \
    CONFIG.c_include_sg              {0}  \
    CONFIG.c_sg_length_width         {16} \
    CONFIG.c_m_axi_mm2s_data_width   {32} \
    CONFIG.c_m_axis_mm2s_tdata_width {32} \
    CONFIG.c_m_axi_s2mm_data_width   {32} \
    CONFIG.c_s_axis_s2mm_tdata_width {32} \
] [get_bd_cells axi_dma_0]

# BNN Accelerator -- module reference to RTL
log "Adding BNN module reference ..."
set bnn [create_bd_cell -type module -reference bnn_accelerator bnn_acc_0]

# AXI Interconnect -- control path (GP0 -> DMA AXI-Lite)
set ic_ctrl [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ctrl]
set_property CONFIG.NUM_SI 1 [get_bd_cells axi_ic_ctrl]
set_property CONFIG.NUM_MI 1 [get_bd_cells axi_ic_ctrl]

# AXI Interconnect -- data path (DMA MM2S + S2MM -> HP0)
set ic_hp0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_hp0]
set_property CONFIG.NUM_SI 2 [get_bd_cells axi_ic_hp0]
set_property CONFIG.NUM_MI 1 [get_bd_cells axi_ic_hp0]

# Reset
set rst [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_gen]
connect_bd_net [get_bd_pins ps7/FCLK_CLK0]     [get_bd_pins rst_gen/slowest_sync_clk]
connect_bd_net [get_bd_pins ps7/FCLK_RESET0_N]  [get_bd_pins rst_gen/ext_reset_in]

# Clock -- all blocks on FCLK0 (125 MHz)
set clk [get_bd_pins ps7/FCLK_CLK0]
foreach pin [list \
    ps7/M_AXI_GP0_ACLK          ps7/S_AXI_HP0_ACLK          \
    axi_dma_0/s_axi_lite_aclk   axi_dma_0/m_axi_mm2s_aclk   \
    axi_dma_0/m_axi_s2mm_aclk   \
    bnn_acc_0/aclk               \
    axi_ic_ctrl/ACLK             axi_ic_ctrl/S00_ACLK         \
    axi_ic_ctrl/M00_ACLK         \
    axi_ic_hp0/ACLK              axi_ic_hp0/S00_ACLK          \
    axi_ic_hp0/S01_ACLK          axi_ic_hp0/M00_ACLK          \
] { connect_bd_net $clk [get_bd_pins $pin] }

# Resets
connect_bd_net [get_bd_pins rst_gen/interconnect_aresetn] \
    [get_bd_pins axi_ic_ctrl/ARESETN] \
    [get_bd_pins axi_ic_hp0/ARESETN]

connect_bd_net [get_bd_pins rst_gen/peripheral_aresetn] \
    [get_bd_pins bnn_acc_0/aresetn]           \
    [get_bd_pins axi_dma_0/axi_resetn]        \
    [get_bd_pins axi_ic_ctrl/M00_ARESETN]     \
    [get_bd_pins axi_ic_ctrl/S00_ARESETN]     \
    [get_bd_pins axi_ic_hp0/S00_ARESETN]      \
    [get_bd_pins axi_ic_hp0/S01_ARESETN]      \
    [get_bd_pins axi_ic_hp0/M00_ARESETN]

# AXI-Lite control: PS7.GP0 -> ic_ctrl -> DMA
connect_bd_intf_net [get_bd_intf_pins ps7/M_AXI_GP0]       [get_bd_intf_pins axi_ic_ctrl/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ic_ctrl/M00_AXI] [get_bd_intf_pins axi_dma_0/S_AXI_LITE]

# AXI-Stream: DMA.MM2S -> BNN input, BNN output -> DMA.S2MM
# (module reference exposes individual signals, not AXI-Stream bus interface)
connect_bd_net [get_bd_pins axi_dma_0/m_axis_mm2s_tdata]  [get_bd_pins bnn_acc_0/s_axis_tdata]
connect_bd_net [get_bd_pins axi_dma_0/m_axis_mm2s_tvalid] [get_bd_pins bnn_acc_0/s_axis_tvalid]
connect_bd_net [get_bd_pins bnn_acc_0/s_axis_tready]      [get_bd_pins axi_dma_0/m_axis_mm2s_tready]
connect_bd_net [get_bd_pins axi_dma_0/m_axis_mm2s_tlast]  [get_bd_pins bnn_acc_0/s_axis_tlast]

connect_bd_net [get_bd_pins bnn_acc_0/m_axis_tdata]       [get_bd_pins axi_dma_0/s_axis_s2mm_tdata]
connect_bd_net [get_bd_pins bnn_acc_0/m_axis_tvalid]      [get_bd_pins axi_dma_0/s_axis_s2mm_tvalid]
connect_bd_net [get_bd_pins axi_dma_0/s_axis_s2mm_tready] [get_bd_pins bnn_acc_0/m_axis_tready]
connect_bd_net [get_bd_pins bnn_acc_0/m_axis_tlast]       [get_bd_pins axi_dma_0/s_axis_s2mm_tlast]

# DMA to DDR via HP0
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXI_MM2S] [get_bd_intf_pins axi_ic_hp0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_dma_0/M_AXI_S2MM] [get_bd_intf_pins axi_ic_hp0/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ic_hp0/M00_AXI]   [get_bd_intf_pins ps7/S_AXI_HP0]

log "Assigning addresses ..."
assign_bd_address
log "Validating block design ..."
validate_bd_design
save_bd_design
log "Block design validated and saved."

log "Generating HDL wrapper ..."
make_wrapper -files [get_files ${bd_name}.bd] -top
add_files -norecurse \
    "${project_dir}/${project_name}.srcs/sources_1/bd/${bd_name}/hdl/${bd_name}_wrapper.v"
set_property top ${bd_name}_wrapper [current_fileset]
update_compile_order -fileset sources_1

create_waiver -quiet -type DRC -id {DPOP-1}    -description "AXI DMA benign hint"
create_waiver -quiet -type DRC -id {DPOP-2}    -description "AXI DMA benign hint"
create_waiver -quiet -type DRC -id {REQP-1839} -description "RAMB async reset in AXI DMA"

# Synthesis
log "Step 1: RTL Synthesis ..."
set t0 [clock seconds]
launch_runs synth_1 -jobs 4
wait_on_run synth_1
set elapsed [expr {[clock seconds] - $t0}]
if {[get_property PROGRESS [get_runs synth_1]] != "100%"} {
    log "ERROR: Synthesis failed. Check ${project_dir}/${project_name}.runs/synth_1/*.log"
    close $LOG_FD; exit 1
}
log "Synthesis done (${elapsed}s)."

# Implementation
log "Step 2: Implementation ..."
set t0 [clock seconds]
set_property STEPS.ROUTE_DESIGN.ARGS.DIRECTIVE AggressiveExplore [get_runs impl_1]
launch_runs impl_1 -jobs 4
wait_on_run impl_1
set elapsed [expr {[clock seconds] - $t0}]
if {[get_property PROGRESS [get_runs impl_1]] != "100%"} {
    log "ERROR: Implementation failed."
    close $LOG_FD; exit 1
}
log "Implementation done (${elapsed}s)."

# Bitstream
log "Step 3: Generating bitstream ..."
set t0 [clock seconds]
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
set elapsed [expr {[clock seconds] - $t0}]
log "Bitstream done (${elapsed}s)."

# Copy outputs
log "Copying outputs to: ${OUT_DIR}"
file mkdir ${OUT_DIR}

set bit_src "${project_dir}/${project_name}.runs/impl_1/${bd_name}_wrapper.bit"
set xsa_src "${project_dir}/output/${project_name}.xsa"
set bit_dst "${OUT_DIR}/${project_name}.bit"

if {[file exists $bit_src]} {
    file copy -force $bit_src $bit_dst
    log "Bitstream copied: ${bit_dst}"
} else {
    log "WARNING: bitstream not found at expected path: ${bit_src}"
}

# Export XSA (hardware handoff for PYNQ)
log "Writing XSA ..."
write_hw_platform -fixed -include_bit -force "${project_dir}/output/${project_name}.xsa"
log "XSA written: ${project_dir}/output/${project_name}.xsa"

log "======================================================"
log "BUILD COMPLETE"
log "  Bitstream : ${bit_dst}"
log "  XSA       : ${project_dir}/output/${project_name}.xsa"
log "  Next: python ../pynq/extract_hwh.py"
log "        python ../pynq/deploy.py"
log "======================================================"
close $LOG_FD
""", encoding="ascii")
print("Written: vivado/create_project.tcl")

# ── run_vivado_here.bat ──────────────────────────────────────────────────
(BASE / "vivado/run_vivado_here.bat").write_text(
"""@echo off
setlocal
REM run_vivado_here.bat -- BNN Vivado batch build wrapper
REM
REM Prerequisites: none (pure Verilog, no HLS step needed)
REM
REM Outputs:
REM   fpga\\pynq\\bnn_vivado_files\\bnn_accelerator.bit
REM   fpga\\vivado\\proj_bnn_accelerator\\output\\bnn_accelerator.xsa
REM
REM After this bat: python ..\\pynq\\extract_hwh.py

echo.
echo === Running Vivado batch build in: %~dp0
echo === TCL script: create_project.tcl
echo.

set "VIVADO_BAT=C:\\Xilinx\\2025.1\\Vivado\\bin\\vivado.bat"
if not exist "%VIVADO_BAT%" (
    for /f "tokens=*" %%v in ('where vivado 2^>nul') do set "VIVADO_BAT=%%v"
)
if not defined VIVADO_BAT (
    echo ERROR: vivado.bat not found. Check Xilinx install path.
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
""", encoding="ascii")
print("Written: vivado/run_vivado_here.bat")

# ── pynq/extract_hwh.py ──────────────────────────────────────────────────
(BASE / "pynq/extract_hwh.py").write_text(
"""#!/usr/bin/env python3
\"\"\"
extract_hwh.py -- Extract .hwh from Vivado .xsa for BNN accelerator.

Usage:
    python extract_hwh.py
    python extract_hwh.py --xsa /path/to/bnn_accelerator.xsa
\"\"\"
import argparse, pathlib, shutil, sys, zipfile

_HERE = pathlib.Path(__file__).resolve().parent
DEFAULT_XSA     = str(_HERE.parent / "vivado" / "proj_bnn_accelerator" / "output" / "bnn_accelerator.xsa")
DEFAULT_OUT_DIR = str(_HERE / "bnn_vivado_files")
EXPECTED_STEM   = "bnn_accelerator"


def extract_hwh(xsa_path: str, out_dir: str) -> pathlib.Path:
    xsa = pathlib.Path(xsa_path).resolve()
    out = pathlib.Path(out_dir).resolve()
    if not xsa.exists():
        sys.exit(f"ERROR: XSA not found: {xsa}")
    out.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(xsa) as z:
        hwh_entries = [n for n in z.namelist() if n.endswith(".hwh")]
        if not hwh_entries:
            sys.exit(f"ERROR: No .hwh in {xsa}. Contents: {z.namelist()[:20]}")
        entry = hwh_entries[0]
        print(f"Found in archive : {entry}")
        tmp_dir = out / "_xsa_extract"
        z.extract(entry, tmp_dir)
        extracted = tmp_dir / entry
    target = out / f"{EXPECTED_STEM}.hwh"
    shutil.copy(extracted, target)
    print(f"Copied to        : {target}")
    print(f"  Size           : {target.stat().st_size / 1024:.0f} KB")
    shutil.rmtree(tmp_dir, ignore_errors=True)
    return target


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--xsa",     default=DEFAULT_XSA)
    ap.add_argument("--out-dir", default=DEFAULT_OUT_DIR)
    args = ap.parse_args()
    result = extract_hwh(args.xsa, args.out_dir)
    print(f"Done: {result}")


if __name__ == "__main__":
    main()
""", encoding="ascii")
print("Written: pynq/extract_hwh.py")

# ── pynq/deploy.py ───────────────────────────────────────────────────────
(BASE / "pynq/deploy.py").write_text(
"""#!/usr/bin/env python3
\"\"\"
deploy.py -- SCP BNN accelerator artefacts to the PYNQ-Z2 board.

Copies bnn_accelerator.bit, bnn_accelerator.hwh, notebook, and feature stats
to /home/xilinx/jupyter_notebooks/can_vehicle_bnn/ on the board.

Usage:
    python deploy.py
    python deploy.py --host 192.168.2.99
\"\"\"
import argparse, pathlib, subprocess, sys, tempfile

BOARD_IP    = "192.168.2.99"
BOARD_USER  = "xilinx"
REMOTE_DIR  = "/home/xilinx/jupyter_notebooks/can_vehicle_bnn"

_HERE = pathlib.Path(__file__).resolve().parent
DEFAULT_FILES = {
    "bit":      _HERE / "bnn_vivado_files" / "bnn_accelerator.bit",
    "hwh":      _HERE / "bnn_vivado_files" / "bnn_accelerator.hwh",
    "notebook": _HERE / "bnn_inference_pynq.ipynb",
    "script":   _HERE / "bnn_inference_pynq.py",
    "stats":    _HERE / "bnn_can_feature_stats.npz",
}


def _run(cmd: list, check: bool = True) -> int:
    print("  $", " ".join(str(c) for c in cmd))
    result = subprocess.run(cmd)
    if check and result.returncode != 0:
        sys.exit(f"Command failed (exit {result.returncode})")
    return result.returncode


def ssh_cmd(command, user, host):
    _run(["ssh", "-o", "StrictHostKeyChecking=no", f"{user}@{host}", command])


def scp_file(src: pathlib.Path, dst_dir, user, host):
    if not src.exists():
        print(f"  WARNING: skipping missing file: {src}")
        return
    _run(["scp", "-o", "StrictHostKeyChecking=no",
          str(src), f"{user}@{host}:{dst_dir}/"])


def scp_notebook(src: pathlib.Path, dst_dir, user, host):
    if not src.exists():
        print(f"  WARNING: skipping missing file: {src}")
        return
    raw = src.read_bytes()
    if raw.startswith(b"\\xef\\xbb\\xbf"):
        print("  (stripping UTF-8 BOM from notebook)")
        raw = raw[3:]
    tmp = pathlib.Path(tempfile.mktemp(suffix=".ipynb"))
    tmp.write_bytes(raw)
    try:
        _run(["scp", "-o", "StrictHostKeyChecking=no",
              str(tmp), f"{user}@{host}:{dst_dir}/{src.name}"])
    finally:
        tmp.unlink(missing_ok=True)


def deploy(args):
    user, host = args.user, args.host
    print(f"\\nDeploying to {user}@{host}:{REMOTE_DIR}")
    print("-" * 56)

    print("\\n[1/5] Creating remote directory ...")
    ssh_cmd(f"mkdir -p {REMOTE_DIR}", user, host)

    print("\\n[2/5] Copying bitstream ...")
    scp_file(DEFAULT_FILES["bit"], REMOTE_DIR, user, host)

    print("\\n[3/5] Copying hardware handoff (.hwh) ...")
    scp_file(DEFAULT_FILES["hwh"], REMOTE_DIR, user, host)

    print("\\n[4/5] Copying feature stats ...")
    scp_file(DEFAULT_FILES["stats"], REMOTE_DIR, user, host)

    print("\\n[5/5] Copying inference notebook + script ...")
    scp_notebook(DEFAULT_FILES["notebook"], REMOTE_DIR, user, host)
    scp_file(DEFAULT_FILES["script"],   REMOTE_DIR, user, host)

    print("\\n" + "=" * 56)
    print(f"  Deployed to: {user}@{host}:{REMOTE_DIR}")
    print(f"  Open JupyterLab at http://{host}:9090")
    print(f"  Notebook: can_vehicle_bnn/bnn_inference_pynq.ipynb")
    print("=" * 56)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--host", default=BOARD_IP)
    ap.add_argument("--user", default=BOARD_USER)
    args = ap.parse_args()
    deploy(args)


if __name__ == "__main__":
    main()
""", encoding="ascii")
print("Written: pynq/deploy.py")

# ── build_and_deploy.bat ─────────────────────────────────────────────────
(BASE / "build_and_deploy.bat").write_text(
"""@echo off
setlocal
REM ============================================================
REM build_and_deploy.bat -- CAN Vehicle BNN FPGA full pipeline
REM
REM   Step 1 : Vivado bitstream     -> bnn_vivado_files\\bnn_accelerator.bit
REM   Step 2 : Extract .hwh         -> bnn_vivado_files\\bnn_accelerator.hwh
REM   Step 3 : SCP deploy to board  -> 192.168.2.99
REM
REM No HLS step needed -- pure Verilog design.
REM Weights are baked into the bitstream via bnn_can_weights.vh.
REM
REM Usage (run from ANY directory):
REM   bnn_accelerator\\fpga\\build_and_deploy.bat
REM ============================================================

set "PYTHON="
for /f "tokens=*" %%i in ('where python 2^>nul') do (if not defined PYTHON set "PYTHON=%%i")
if not defined PYTHON if exist "%LOCALAPPDATA%\\Programs\\Python\\Python311\\python.exe" set "PYTHON=%LOCALAPPDATA%\\Programs\\Python\\Python311\\python.exe"
if not defined PYTHON if exist "%LOCALAPPDATA%\\Programs\\Python\\Python312\\python.exe" set "PYTHON=%LOCALAPPDATA%\\Programs\\Python\\Python312\\python.exe"
if not defined PYTHON if exist "%LOCALAPPDATA%\\Programs\\Python\\Python313\\python.exe" set "PYTHON=%LOCALAPPDATA%\\Programs\\Python\\Python313\\python.exe"
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
echo       Log: %VIV_DIR%\\vivado_build.log
cmd /c "%VIV_DIR%\\run_vivado_here.bat"
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Vivado failed. Check %VIV_DIR%\\vivado_build.log
    exit /b 1
)
echo [1/3] Vivado done.

REM ---- Step 2 : Extract .hwh ----
echo.
echo [2/3] Extracting hardware handoff (.hwh) ...
"%PYTHON%" "%PYNQ_DIR%\\extract_hwh.py"
if %errorlevel% neq 0 (
    echo ERROR: extract_hwh.py failed.
    exit /b 1
)
echo [2/3] HWH extracted.

REM ---- Step 3 : Deploy to PYNQ ----
echo.
echo [3/3] Deploying to PYNQ-Z2 at 192.168.2.99 ...
"%PYTHON%" "%PYNQ_DIR%\\deploy.py"
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
""", encoding="ascii")
print("Written: build_and_deploy.bat")

# ── build_and_deploy.py ──────────────────────────────────────────────────
(BASE / "build_and_deploy.py").write_text(
"""#!/usr/bin/env python3
\"\"\"
build_and_deploy.py -- CAN Vehicle BNN FPGA build + deploy pipeline.

Steps:
  1  Vivado block design + bitstream  (run_vivado_here.bat)
  2  Extract .hwh from .xsa           (extract_hwh.py)
  3  Deploy to PYNQ-Z2                (deploy.py)

No HLS step -- pure Verilog design, weights baked into bitstream.

Usage:
    python bnn_accelerator/fpga/build_and_deploy.py
    python bnn_accelerator/fpga/build_and_deploy.py --from 2
    python bnn_accelerator/fpga/build_and_deploy.py --skip-deploy
\"\"\"
import argparse, pathlib, subprocess, sys, time

HERE   = pathlib.Path(__file__).resolve().parent
VIVADO = HERE / "vivado"
PYNQ   = HERE / "pynq"
PYTHON = sys.executable


def banner(msg):
    w = 62
    print(f"\\n{'=' * w}\\n  {msg}\\n{'=' * w}")


def run(cmd, cwd=None):
    print("  $", " ".join(str(c) for c in cmd))
    t0 = time.time()
    r  = subprocess.run(cmd, cwd=cwd)
    elapsed = time.time() - t0
    if r.returncode != 0:
        sys.exit(f"\\n  FAILED (exit {r.returncode}) after {elapsed:.0f}s")
    print(f"  OK  ({elapsed:.0f}s)")


def step1():
    banner("Step 1 - Vivado block design + bitstream  (~30-60 min)")
    run(["cmd", "/c", str(VIVADO / "run_vivado_here.bat")])


def step2():
    banner("Step 2 - Extract .hwh from .xsa")
    run([PYTHON, str(PYNQ / "extract_hwh.py")])


def step3(host):
    banner(f"Step 3 - Deploy to PYNQ-Z2 at {host}")
    run([PYTHON, str(PYNQ / "deploy.py"), "--host", host])


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--from",        dest="from_step", type=int, default=1)
    ap.add_argument("--only",        dest="only_step", type=int, default=None)
    ap.add_argument("--skip-deploy", action="store_true")
    ap.add_argument("--host",        default="192.168.2.99")
    args = ap.parse_args()

    steps = {1: step1, 2: step2, 3: lambda: step3(args.host)}

    if args.only_step:
        steps[args.only_step]()
        return

    for n in sorted(steps):
        if n < args.from_step:
            continue
        if n == 3 and args.skip_deploy:
            print("\\n  (skipping Step 3 -- deploy)")
            continue
        steps[n]()

    print("\\n  All steps complete.")


if __name__ == "__main__":
    main()
""", encoding="ascii")
print("Written: build_and_deploy.py")

print("\nAll files written successfully.")
print("Next: generating PYNQ inference notebook...")
