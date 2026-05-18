#!/usr/bin/env python3
"""
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
"""
import argparse, pathlib, subprocess, sys, time

HERE   = pathlib.Path(__file__).resolve().parent
VIVADO = HERE / "vivado"
PYNQ   = HERE / "pynq"
PYTHON = sys.executable


def banner(msg):
    w = 62
    print(f"\n{'=' * w}\n  {msg}\n{'=' * w}")


def run(cmd, cwd=None):
    print("  $", " ".join(str(c) for c in cmd))
    t0 = time.time()
    r  = subprocess.run(cmd, cwd=cwd)
    elapsed = time.time() - t0
    if r.returncode != 0:
        sys.exit(f"\n  FAILED (exit {r.returncode}) after {elapsed:.0f}s")
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
            print("\n  (skipping Step 3 -- deploy)")
            continue
        steps[n]()

    print("\n  All steps complete.")


if __name__ == "__main__":
    main()
