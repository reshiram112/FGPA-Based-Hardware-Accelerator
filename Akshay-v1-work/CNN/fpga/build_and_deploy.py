#!/usr/bin/env python3
"""
build_and_deploy.py - Complete CNN FPGA accelerator build + deploy pipeline.

Runs all build steps in sequence:
  0  Generate C++ weight header   (generate_weights.py)
  1  Vitis HLS synthesis          (run_hls_here.bat)
  2  Unzip HLS IP                 (Python zipfile)
  3  Vivado block design + bit    (run_vivado_here.bat)
  4  Extract .hwh from .xsa       (extract_hwh.py)
  5  Deploy to PYNQ-Z2            (ssh + scp)

Run from workspace root  C:\\Users\\TA17084\\fpga_cnn_accelerator\\ :

  "C:\\Program Files\\Python313\\python.exe" CNN\\fpga\\build_and_deploy.py

Options:
  --from N          Start from step N  (0-5, default: 0)
  --only N          Run only step N
  --skip-deploy     Steps 0-4 only, skip SCP to board
  --host IP         Board IP address   (default: 192.168.2.99)
  --yes             Skip all overwrite prompts (non-interactive / CI mode)
"""

import argparse
import pathlib
import shutil
import subprocess
import sys
import time
import zipfile

# ?????? Paths ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
HERE   = pathlib.Path(__file__).resolve().parent   # CNN/fpga/
HLS    = HERE / 'hls'
VIVADO = HERE / 'vivado'
PYNQ   = HERE / 'pynq'
VF     = PYNQ / 'cnn_vivado_files'

BOARD_IP   = '192.168.2.99'
BOARD_USER = 'xilinx'
REMOTE_DIR = '/home/xilinx/jupyter_notebooks/cnn_accelerator'
PYTHON     = sys.executable        # same interpreter running this script


# ?????? Utilities ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
def banner(msg):
    w = 62
    print(f'\n{"=" * w}\n  {msg}\n{"=" * w}')


def run(cmd, cwd=None):
    """Run a subprocess; print it; exit immediately on failure."""
    print('  $', ' '.join(str(c) for c in cmd))
    t0 = time.time()
    r  = subprocess.run(cmd, cwd=cwd)
    elapsed = time.time() - t0
    if r.returncode != 0:
        sys.exit(f'\n  FAILED (exit {r.returncode}) after {elapsed:.0f}s'
                 '\n  See output above for details.')
    print(f'  OK  ({elapsed:.0f}s)')


def confirm_overwrite(label, auto_yes):
    """Return True if the user agrees to overwrite (or --yes was passed)."""
    if auto_yes:
        return True
    ans = input(f'  {label} already exists.  Re-run? [y/N] ').strip().lower()
    return ans == 'y'


def ssh(command, host):
    run(['ssh', '-o', 'StrictHostKeyChecking=no',
         f'{BOARD_USER}@{host}', command])


def scp(src, host):
    src = pathlib.Path(src)
    if not src.exists():
        print(f'  WARNING: skipping missing file: {src}')
        return
    run(['scp', '-o', 'StrictHostKeyChecking=no',
         str(src), f'{BOARD_USER}@{host}:{REMOTE_DIR}/'])


def scp_notebook(src, host):
    """SCP a .ipynb, stripping UTF-8 BOM first (VS Code sometimes adds one)."""
    import tempfile
    src = pathlib.Path(src)
    if not src.exists():
        print(f'  WARNING: skipping missing file: {src}')
        return
    raw = src.read_bytes()
    if raw.startswith(b'\xef\xbb\xbf'):
        print('  (stripping UTF-8 BOM from notebook before deploy)')
        raw = raw[3:]
    tmp = pathlib.Path(tempfile.mktemp(suffix='.ipynb'))
    tmp.write_bytes(raw)
    try:
        run(['scp', '-o', 'StrictHostKeyChecking=no',
             str(tmp), f'{BOARD_USER}@{host}:{REMOTE_DIR}/{src.name}'])
    finally:
        tmp.unlink(missing_ok=True)


# ?????? Step implementations ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
def step0(auto_yes):
    banner('Step 0 - Generate C++ weight header')
    out = HLS / 'cnn_weights_data.h'
    if out.exists():
        print(f'  Found: cnn_weights_data.h  ({out.stat().st_size // 1024} KB)')
        if not confirm_overwrite('cnn_weights_data.h', auto_yes):
            print('  Using existing file - skipping.')
            return
    run([PYTHON, str(HLS / 'generate_weights.py')])


def step1(auto_yes):
    banner('Step 1 - Vitis HLS synthesis  (~5-15 min)')
    out = HERE / 'hls_ip.zip'
    if out.exists():
        print(f'  Found: hls_ip.zip  ({out.stat().st_size // 1024} KB)')
        if not confirm_overwrite('hls_ip.zip', auto_yes):
            print('  Using existing zip - skipping.')
            return
    bat = HLS / 'run_hls_here.bat'
    if not bat.exists():
        sys.exit(f'  ERROR: {bat} not found.')
    run(['cmd', '/c', str(bat)])


def step2():
    banner('Step 2 - Unzip HLS IP')
    zip_path = HERE / 'hls_ip.zip'
    ip_dir   = HERE / 'hls_ip'
    if not zip_path.exists():
        sys.exit('  ERROR: hls_ip.zip not found.  Run Step 1 (HLS) first.')
    if ip_dir.exists():
        print('  Removing stale hls_ip/ ...')
        shutil.rmtree(ip_dir)
    ip_dir.mkdir()
    print(f'  Extracting {zip_path.name} -> hls_ip/ ...')
    with zipfile.ZipFile(zip_path) as z:
        z.extractall(ip_dir)
    top = [e.name for e in ip_dir.iterdir()]
    print(f'  Done.  Top-level entries: {top}')


def step3(auto_yes):
    banner('Step 3 - Vivado block design + bitstream  (~10-30 min)')
    out = VF / 'cnn_accelerator.bit'
    if out.exists():
        mb = out.stat().st_size // (1024 * 1024)
        print(f'  Found: cnn_accelerator.bit  ({mb} MB)')
        if not confirm_overwrite('cnn_accelerator.bit', auto_yes):
            print('  Using existing bitstream - skipping.')
            return
    bat = VIVADO / 'run_vivado_here.bat'
    if not bat.exists():
        sys.exit(f'  ERROR: {bat} not found.')
    run(['cmd', '/c', str(bat)])


def step4():
    banner('Step 4 - Extract .hwh from .xsa')
    xsa = VIVADO / 'proj_cnn_accelerator' / 'output' / 'cnn_accelerator.xsa'
    if not xsa.exists():
        sys.exit(f'  ERROR: {xsa} not found.  Run Step 3 (Vivado) first.')
    run([PYTHON, str(PYNQ / 'extract_hwh.py'),
         '--xsa',     str(xsa),
         '--out-dir', str(VF)])


def step5(host):
    banner(f'Step 5 - Deploy to PYNQ-Z2  ({host})')

    # .bit and .hwh are mandatory
    required = [VF / 'cnn_accelerator.bit', VF / 'cnn_accelerator.hwh']
    missing  = [f for f in required if not f.exists()]
    if missing:
        sys.exit('  ERROR: required files not found:\n' +
                 '\n'.join(f'    {f}' for f in missing))

    deploy_files = [
        VF   / 'cnn_accelerator.bit',
        VF   / 'cnn_accelerator.hwh',
        PYNQ / 'cnn_inference_pynq.py',
        PYNQ / 'feature_stats.npz',
    ]

    n = len(deploy_files) + 2   # +1 for mkdir, +1 for notebook
    print(f'\n  [1/{n}] Creating remote directory ...')
    ssh(f'mkdir -p {REMOTE_DIR}', host)

    print(f'\n  [2/{n}] cnn_inference_pynq.ipynb (BOM-safe) ...')
    scp_notebook(PYNQ / 'cnn_inference_pynq.ipynb', host)

    for i, f in enumerate(deploy_files, start=3):
        print(f'\n  [{i}/{n}] {f.name} ...')
        scp(f, host)

    print('\n' + '-' * 56)
    print('  Deployment complete.')
    print(f'  JupyterLab : http://{host}:9090  (password: xilinx)')
    print(f'  Open       : cnn_accelerator/cnn_inference_pynq.ipynb')
    print(f'  Run        : Kernel -> Restart & Run All')


# ?????? Main ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
def main():
    p = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    p.add_argument('--from',  dest='from_step', type=int, default=0,
                   metavar='N', help='Start from step N  (0-5, default: 0)')
    p.add_argument('--only',  dest='only_step', type=int, default=None,
                   metavar='N', help='Run only step N  (0-5)')
    p.add_argument('--skip-deploy', action='store_true',
                   help='Run steps 0-4 only; skip SCP deploy to board')
    p.add_argument('--host', default=BOARD_IP, metavar='IP',
                   help=f'PYNQ-Z2 IP address  (default: {BOARD_IP})')
    p.add_argument('--yes', action='store_true',
                   help='Skip overwrite prompts (non-interactive / CI mode)')
    args = p.parse_args()

    STEPS = {
        0: (lambda: step0(args.yes),           'Generate weight header'),
        1: (lambda: step1(args.yes),           'Vitis HLS synthesis'),
        2: (step2,                             'Unzip HLS IP'),
        3: (lambda: step3(args.yes),           'Vivado bitstream'),
        4: (step4,                             'Extract .hwh'),
        5: (lambda: step5(args.host),          'Deploy to board'),
    }

    if args.only_step is not None:
        if args.only_step not in STEPS:
            sys.exit(f'ERROR: --only {args.only_step} is invalid. Choose 0-5.')
        run_nums = [args.only_step]
    else:
        run_nums = [n for n in range(args.from_step, 6)
                    if not (args.skip_deploy and n == 5)]

    t_total = time.time()
    banner(f'CNN FPGA Pipeline - steps {run_nums}')
    print(f'  Root   : {HERE}')
    print(f'  Python : {PYTHON}')
    if 5 in run_nums:
        print(f'  Board  : {args.host}')

    for n in run_nums:
        fn, _ = STEPS[n]
        fn()

    elapsed = time.time() - t_total
    banner(f'All steps complete  ({elapsed / 60:.1f} min total)')


if __name__ == '__main__':
    main()

