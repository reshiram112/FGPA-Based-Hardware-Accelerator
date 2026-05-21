"""
deploy.py  --  Deploy the Integration bundle to the PYNQ board.

Usage
-----
  python deploy.py --remote xilinx@192.168.2.99

What it does
------------
1. Stages all files into  deploy_bundle/  (copies the integration notebook,
   integration_runtime.py, streaming servers, and all four model notebooks
   into the bundle).
2. SCPs the entire  deploy_bundle/  folder to the board.

On the board the bundle lands at:
  /home/xilinx/jupyter_notebooks/Integration/

Requirements (Windows)
----------------------
  - OpenSSH client installed (comes with Windows 10/11 or via Git Bash)
  - Board reachable at the IP you pass to --remote

Run on the board after deploy
-----------------------------
  Single-file inference (Jupyter):
    1. Open Jupyter at  http://<board-ip>/
    2. Navigate to  Integration/final_integration_inference.ipynb
    3. Run Cell 1, then type your file path and click Run.

  Live streaming (TCP server):
    1. SSH into the board:   ssh xilinx@<board-ip>
    2. Start server:         python .../Integration/stream_server.py
    3. On your laptop run one of:
         python stream_client_mlp.py --host <board-ip> sound.wav
         python stream_client_cnn.py --host <board-ip> sign.jpg
         python stream_client_bnn.py --host <board-ip> can_data.log
         python stream_client_svm.py --host <board-ip> lane_data.csv
"""

import argparse
import shutil
import subprocess
import sys
from pathlib import Path

HERE   = Path(__file__).resolve().parent
BUNDLE = HERE / "deploy_bundle"
BOARD_DEST_DEFAULT = "/home/xilinx/jupyter_notebooks/Integration"

STAGE_MAP = [
    # Integration dispatcher
    ("final_integration_inference.ipynb",            "final_integration_inference.ipynb"),
    ("integration_runtime.py",                       "integration_runtime.py"),
    # Model notebooks
    ("model_notebooks/bnn_inference_pynq.ipynb",     "model_notebooks/bnn_inference_pynq.ipynb"),
    ("model_notebooks/cnn_accelerator_script.ipynb", "model_notebooks/cnn_accelerator_script.ipynb"),
    ("model_notebooks/svm_accelerator_script.ipynb", "model_notebooks/svm_accelerator_script.ipynb"),
    ("model_notebooks/mlp_inference_pynq.ipynb",     "model_notebooks/mlp_inference_pynq.ipynb"),
    # Streaming servers (board-side)
    ("stream_server.py",                             "stream_server.py"),
    ("stream_server_cnn.py",                         "stream_server_cnn.py"),
]


def stage_bundle() -> None:
    print("Staging files into deploy_bundle/ ...")
    for rel_src, rel_dst in STAGE_MAP:
        src = HERE / rel_src
        dst = BUNDLE / rel_dst
        dst.parent.mkdir(parents=True, exist_ok=True)
        if not src.exists():
            print(f"  [WARN] source not found, skipping: {src}")
            continue
        shutil.copy2(src, dst)
        print(f"  staged  {rel_src}")
    print("Staging complete.\n")


def check_assets() -> None:
    required = {
        "bnn": ["bnn_accelerator.bit", "bnn_accelerator.hwh", "bnn_can_feature_stats.npz"],
        "cnn": ["cnn_accelerator.bit", "cnn_accelerator.hwh"],
        "svm": ["svm_accelerator.bit", "svm_accelerator.hwh"],
        "mlp": ["mlp_accelerator.bit", "mlp_accelerator.hwh", "feature_stats.npz"],
    }
    all_ok = True
    print("Checking hardware assets in deploy_bundle/models/ ...")
    for model, files in required.items():
        for f in files:
            p = BUNDLE / "models" / model / f
            if p.exists():
                print(f"  [OK]   models/{model}/{f}")
            else:
                print(f"  [MISS] models/{model}/{f}  <-- MISSING")
                all_ok = False
    if not all_ok:
        print("\nWARNING: some assets are missing.")
    print()


def scp_to_board(remote: str) -> None:
    if ":" not in remote:
        remote = remote + ":" + BOARD_DEST_DEFAULT

    host, dest = remote.split(":", 1)

    print("Creating destination directory on board ...")
    subprocess.run(["ssh", host, f"mkdir -p {dest}"])

    scp_cmd = ["scp", "-r", str(BUNDLE) + "/.", f"{host}:{dest}/"]
    print(f"\nCopying bundle to board ...")
    print(f"  $ {' '.join(scp_cmd)}")
    ret = subprocess.run(scp_cmd)
    if ret.returncode == 0:
        print(f"\nDeploy successful!")
        print(f"Open Jupyter at http://{host.split('@')[-1]}/")
        print(f"Navigate to: Integration/final_integration_inference.ipynb")
    else:
        print(f"\nERROR: scp failed (code {ret.returncode}).")
        sys.exit(1)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Stage and deploy the Integration bundle to the PYNQ board."
    )
    parser.add_argument(
        "--remote", "-r",
        metavar="USER@HOST[:DEST]",
        help="Board SSH target, e.g.  xilinx@192.168.2.99",
        default=None,
    )
    parser.add_argument(
        "--stage-only",
        action="store_true",
        help="Only stage files into deploy_bundle/ without copying to the board.",
    )
    args = parser.parse_args()

    stage_bundle()
    check_assets()

    if args.stage_only or args.remote is None:
        print("deploy_bundle/ is ready.")
        print("To deploy:  python deploy.py --remote xilinx@<board-ip>")
        print()
        print("Streaming clients (run on laptop after deploying):")
        print("  python stream_client_mlp.py --host <board-ip> sound.wav")
        print("  python stream_client_cnn.py --host <board-ip> sign.jpg")
        print("  python stream_client_bnn.py --host <board-ip> can_data.log")
        print("  python stream_client_svm.py --host <board-ip> lane_data.csv")
        return

    scp_to_board(args.remote)


if __name__ == "__main__":
    main()
