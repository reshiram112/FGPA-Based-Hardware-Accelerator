#!/usr/bin/env python3
"""
deploy.py -- SCP BNN accelerator artefacts to the PYNQ-Z2 board.

Copies bnn_accelerator.bit, bnn_accelerator.hwh, notebook, and feature stats
to /home/xilinx/jupyter_notebooks/can_vehicle_bnn/ on the board.

Usage:
    python deploy.py
    python deploy.py --host 192.168.2.99
"""
import argparse, os, pathlib, subprocess, sys, tempfile

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
    if raw.startswith(b"\xef\xbb\xbf"):
        print("  (stripping UTF-8 BOM from notebook)")
        raw = raw[3:]
    fd, tmp_path = tempfile.mkstemp(suffix=".ipynb")
    tmp = pathlib.Path(tmp_path)
    try:
        os.write(fd, raw)
        os.close(fd)
        _run(["scp", "-o", "StrictHostKeyChecking=no",
              str(tmp), f"{user}@{host}:{dst_dir}/{src.name}"])
    finally:
        tmp.unlink(missing_ok=True)


def deploy(args):
    user, host = args.user, args.host
    print(f"\nDeploying to {user}@{host}:{REMOTE_DIR}")
    print("-" * 56)

    print("\n[1/5] Creating remote directory ...")
    ssh_cmd(f"mkdir -p {REMOTE_DIR}", user, host)

    print("\n[2/5] Copying bitstream ...")
    scp_file(DEFAULT_FILES["bit"], REMOTE_DIR, user, host)

    print("\n[3/5] Copying hardware handoff (.hwh) ...")
    scp_file(DEFAULT_FILES["hwh"], REMOTE_DIR, user, host)

    print("\n[4/5] Copying feature stats ...")
    scp_file(DEFAULT_FILES["stats"], REMOTE_DIR, user, host)

    print("\n[5/5] Copying inference notebook + script ...")
    scp_notebook(DEFAULT_FILES["notebook"], REMOTE_DIR, user, host)
    scp_file(DEFAULT_FILES["script"],   REMOTE_DIR, user, host)

    print("\n" + "=" * 56)
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
