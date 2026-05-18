#!/usr/bin/env python3
"""
deploy.py - SCP deployment artefacts to the PYNQ-Z2 board.

Copies mlp_accelerator.bit, mlp_accelerator.hwh, and mlp_inference_pynq.py
to /home/xilinx/jupyter_notebooks/radioml_mlp/ on the board.
Weights are baked into the FPGA bitstream (BRAM) - no weights file needed.

Board defaults (PYNQ-Z2 USB-Ethernet link-local):
  IP   : 192.168.2.99
  User : xilinx
  Pass : xilinx  (not used by this script; assumes SSH key or sshpass)

Prerequisites (run these first):
  1. python fpga/hls/generate_weights.py
  2. cd fpga/hls  &&  vitis_hls -f run_hls.tcl
  3. Expand-Archive fpga/hls_ip.zip -DestinationPath fpga/hls_ip
  4. vivado -mode batch -source fpga/vivado/create_project.tcl
       -> outputs fpga/pynq/mlp_vivado_files/mlp_accelerator.bit
  5. python fpga/pynq/extract_hwh.py
       -> outputs fpga/pynq/mlp_vivado_files/mlp_accelerator.hwh
  6. python fpga/pynq/deploy.py       (this script)

Usage:
    python deploy.py
    python deploy.py --host 192.168.2.50
    python deploy.py --bit /path/to/mlp_accelerator.bit --hwh /path/to/mlp_accelerator.hwh
"""

import argparse
import pathlib
import subprocess
import sys

BOARD_IP     = '192.168.2.99'
BOARD_USER   = 'xilinx'
REMOTE_DIR   = '/home/xilinx/jupyter_notebooks/siren_mlp'

# Default local paths (relative to this script's directory)
_HERE = pathlib.Path(__file__).resolve().parent
DEFAULT_FILES = {
    'bit':      _HERE / 'mlp_vivado_files' / 'mlp_accelerator.bit',
    'hwh':      _HERE / 'mlp_vivado_files' / 'mlp_accelerator.hwh',
    'notebook': _HERE / 'mlp_inference_pynq.ipynb',
    'script':   _HERE / 'mlp_inference_pynq.py',
    'stats':    _HERE / 'feature_stats.npz',
}


def _run(cmd: list, check: bool = True) -> int:
    print('  $', ' '.join(str(c) for c in cmd))
    result = subprocess.run(cmd)
    if check and result.returncode != 0:
        sys.exit(f'Command failed (exit {result.returncode})')
    return result.returncode


def ssh_cmd(command: str, user: str, host: str) -> None:
    _run(['ssh', '-o', 'StrictHostKeyChecking=no',
          f'{user}@{host}', command])


def scp_file(src: pathlib.Path, dst_dir: str, user: str, host: str) -> None:
    if not src.exists():
        print(f'  WARNING: file not found, skipping: {src}')
        return
    _run(['scp', '-o', 'StrictHostKeyChecking=no',
          str(src), f'{user}@{host}:{dst_dir}/'])


def scp_notebook(src: pathlib.Path, dst_dir: str, user: str, host: str) -> None:
    """SCP a .ipynb file, stripping UTF-8 BOM first (VS Code sometimes adds one)."""
    if not src.exists():
        print(f'  WARNING: file not found, skipping: {src}')
        return
    import tempfile, os
    raw = src.read_bytes()
    if raw.startswith(b'\xef\xbb\xbf'):
        print('  (stripping UTF-8 BOM from notebook)')
        raw = raw[3:]
    tmp = pathlib.Path(tempfile.mktemp(suffix='.ipynb'))
    tmp.write_bytes(raw)
    try:
        _run(['scp', '-o', 'StrictHostKeyChecking=no',
              str(tmp), f'{user}@{host}:{dst_dir}/{src.name}'])
    finally:
        tmp.unlink(missing_ok=True)


def deploy(args) -> None:
    user, host = args.user, args.host

    print(f'\nDeploying to {user}@{host}:{REMOTE_DIR}')
    print('-' * 56)

    # Create remote deployment directory
    print('\n[1/5] Creating remote directory ...')
    ssh_cmd(f'mkdir -p {REMOTE_DIR}', user, host)

    # Transfer files
    print('\n[2/5] Copying Bitstream (.bit) ...')
    scp_file(pathlib.Path(args.bit), REMOTE_DIR, user, host)

    print('\n[3/5] Copying Hardware (.hwh) ...')
    scp_file(pathlib.Path(args.hwh), REMOTE_DIR, user, host)

    print('\n[4/5] Copying Notebook (.ipynb) ...')
    scp_notebook(pathlib.Path(args.notebook), REMOTE_DIR, user, host)

    print('\n[5/5] Copying Script + Feature stats ...')
    scp_file(pathlib.Path(args.script), REMOTE_DIR, user, host)
    scp_file(pathlib.Path(args.stats),  REMOTE_DIR, user, host)

    print('\n' + '-' * 56)
    print('Deployment complete.')
    print(f'  JupyterLab : http://{host}:9090  (password: xilinx)')
    print(f'  Open       : siren_mlp/mlp_inference_pynq.ipynb')
    print(f'  Run        : Kernel -> Restart & Run All')


if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument('--host',     default=BOARD_IP,
                   help=f'Board IP address (default: {BOARD_IP})')
    p.add_argument('--user',     default=BOARD_USER,
                   help=f'SSH user (default: {BOARD_USER})')
    p.add_argument('--bit',      default=str(DEFAULT_FILES['bit']),
                   help='Path to mlp_accelerator.bit')
    p.add_argument('--hwh',      default=str(DEFAULT_FILES['hwh']),
                   help='Path to mlp_accelerator.hwh')
    p.add_argument('--notebook', default=str(DEFAULT_FILES['notebook']),
                   help='Path to mlp_inference_pynq.ipynb')
    p.add_argument('--script',   default=str(DEFAULT_FILES['script']),
                   help='Path to mlp_inference_pynq.py')
    p.add_argument('--stats',    default=str(DEFAULT_FILES['stats']),
                   help='Path to feature_stats.npz')
    args = p.parse_args()
    deploy(args)
