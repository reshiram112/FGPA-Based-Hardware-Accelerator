#!/usr/bin/env python3
"""
deploy.py - SCP deployment artefacts to the PYNQ-Z2 board for CNN.
"""
import argparse
import pathlib
import subprocess
import sys

BOARD_IP     = '192.168.2.99'
BOARD_USER   = 'xilinx'
REMOTE_DIR   = '/home/xilinx/jupyter_notebooks/cnn_accelerator_v2'

_HERE = pathlib.Path(__file__).resolve().parent
DEFAULT_FILES = {
    'bit':      _HERE / 'cnn_vivado_files' / 'cnn_accelerator_v2.bit',
    'hwh':      _HERE / 'cnn_vivado_files' / 'cnn.hwh',
    'notebook': _HERE / 'cnn_inference_traffic.ipynb',
    'fc_weights': _HERE / 'cnn_fc_weights.npz',
}

def _run(cmd: list, check: bool = True) -> int:
    print('  $', ' '.join(str(c) for c in cmd))
    result = subprocess.run(cmd)
    if check and result.returncode != 0:
        sys.exit(f'Command failed (exit {result.returncode})')
    return result.returncode

def ssh_cmd(command: str, user: str, host: str) -> None:
    _run(['ssh', '-o', 'StrictHostKeyChecking=no', f'{user}@{host}', command])

def scp_file(src: pathlib.Path, dst_dir: str, user: str, host: str) -> None:
    if not src.exists():
        print(f'  WARNING: file not found, skipping: {src}')
        return
    _run(['scp', '-o', 'StrictHostKeyChecking=no', str(src), f'{user}@{host}:{dst_dir}/'])

def deploy(args) -> None:
    user, host = args.user, args.host
    print(f'\nDeploying to {user}@{host}:{REMOTE_DIR}')
    ssh_cmd(f'mkdir -p {REMOTE_DIR}', user, host)
    scp_file(pathlib.Path(args.bit), REMOTE_DIR, user, host)
    scp_file(pathlib.Path(args.hwh), REMOTE_DIR, user, host)
    scp_file(pathlib.Path(args.notebook), REMOTE_DIR, user, host)
    scp_file(pathlib.Path(args.fc_weights), REMOTE_DIR, user, host)
    print('Deployment complete.')

if __name__ == '__main__':
    p = argparse.ArgumentParser()
    p.add_argument('--host',     default=BOARD_IP)
    p.add_argument('--user',     default=BOARD_USER)
    p.add_argument('--bit',      default=str(DEFAULT_FILES['bit']))
    p.add_argument('--hwh',      default=str(DEFAULT_FILES['hwh']))
    p.add_argument('--notebook', default=str(DEFAULT_FILES['notebook']))
    p.add_argument('--fc_weights', default=str(DEFAULT_FILES['fc_weights']))
    args = p.parse_args()
    deploy(args)
