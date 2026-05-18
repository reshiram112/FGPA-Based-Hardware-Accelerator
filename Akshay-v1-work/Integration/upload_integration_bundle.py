from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent

REMOTE_RE = re.compile(r"^(?P<host>[^:]+):(?P<path>.+)$")

MODEL_NOTEBOOKS = {
    "bnn": BASE_DIR / "model_notebooks" / "bnn_can_inference.ipynb",
    "cnn": BASE_DIR / "model_notebooks" / "cnn_traffic_sign_inference.ipynb",
    "svm": BASE_DIR / "model_notebooks" / "svm_lane_inference.ipynb",
    "mlp": BASE_DIR / "model_notebooks" / "mlp_siren_inference.ipynb",
}

MODEL_ASSETS = {
    "bnn": {
        "bit": BASE_DIR.parent / "major_project_repo" / "bnn_vivado_files" / "bnn_accelerator.bit",
        "hwh": BASE_DIR.parent / "major_project_repo" / "bnn_vivado_files" / "bnn_accelerator.hwh",
        "stats": BASE_DIR.parent / "bnn_accelerator" / "fpga" / "pynq" / "bnn_can_feature_stats.npz",
    },
    "cnn": {
        "bit": BASE_DIR.parent / "major_project_repo" / "cnn_vivado_files" / "cnn_accelerator.bit",
        "hwh": BASE_DIR.parent / "major_project_repo" / "cnn_vivado_files" / "cnn_accelerator.hwh",
        "fc": BASE_DIR.parent / "major_project_repo" / "pynq" / "fc_weights.npz",
        "cnn_benchmark": BASE_DIR.parent / "major_project_repo" / "pynq" / "cnn_benchmark_data.npy",
        "cnn_weights_bin": BASE_DIR.parent / "major_project_repo" / "pynq" / "cnn_weights.bin",
    },
    "svm": {
        "bit": BASE_DIR.parent / "major_project_repo" / "svm_vivado_files" / "svm_accelerator.bit",
        "hwh": BASE_DIR.parent / "major_project_repo" / "svm_vivado_files" / "svm_accelerator.hwh",
    },
    "mlp": {
        "bit": BASE_DIR.parent / "siren_mlp" / "fpga" / "pynq" / "mlp_vivado_files" / "mlp_accelerator.bit",
        "hwh": BASE_DIR.parent / "siren_mlp" / "fpga" / "pynq" / "mlp_vivado_files" / "mlp_accelerator.hwh",
        "stats": BASE_DIR.parent / "siren_mlp" / "fpga" / "pynq" / "feature_stats.npz",
        "weights_bin": BASE_DIR.parent / "siren_mlp" / "fpga" / "pynq" / "radioml_deployment" / "mlp_weights.bin",
    },
}


def copy_file(source: Path, destination: Path, staged: list[str], missing: list[str], label: str) -> None:
    if not source.exists():
        missing.append(f"{label}: {source}")
        return
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source, destination)
    staged.append(str(destination))


def stage_bundle(output_dir: Path) -> dict[str, list[str]]:
    output_dir.mkdir(parents=True, exist_ok=True)
    staged: list[str] = []
    missing: list[str] = []

    copy_file(BASE_DIR / "final_integration_inference.ipynb", output_dir / "final_integration_inference.ipynb", staged, missing, "integration notebook")
    copy_file(BASE_DIR / "integration_runtime.py", output_dir / "integration_runtime.py", staged, missing, "integration runtime")

    for model_key, notebook_path in MODEL_NOTEBOOKS.items():
        copy_file(notebook_path, output_dir / "model_notebooks" / notebook_path.name, staged, missing, f"{model_key} notebook")

    for model_key, assets in MODEL_ASSETS.items():
        model_dir = output_dir / "models" / model_key
        for asset_name, asset_path in assets.items():
            copy_file(asset_path, model_dir / asset_path.name, staged, missing, f"{model_key}:{asset_name}")

    manifest = {
        "bundle_dir": str(output_dir.resolve()),
        "staged_files": staged,
        "missing_files": missing,
    }
    manifest_path = output_dir / "bundle_manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2), encoding="utf-8")
    staged.append(str(manifest_path))
    return manifest


def upload_bundle(output_dir: Path, remote: str) -> None:
    match = REMOTE_RE.match(remote)
    if not match:
        raise ValueError("Remote destination must look like user@host:/absolute/remote/path")

    host = match.group("host")
    remote_path = match.group("path")

    mkdir_cmd = ["ssh", host, f"mkdir -p '{remote_path}'"]
    mkdir_result = subprocess.run(mkdir_cmd, capture_output=True, text=True, check=False)
    if mkdir_result.returncode != 0:
        raise RuntimeError(
            "Failed to create remote directory.\n"
            f"stdout:\n{mkdir_result.stdout}\n"
            f"stderr:\n{mkdir_result.stderr}"
        )

    scp_cmd = ["scp", "-r", str(output_dir) + "/.", f"{host}:{remote_path}"]
    scp_result = subprocess.run(scp_cmd, capture_output=True, text=True, check=False)
    if scp_result.returncode != 0:
        raise RuntimeError(
            "Failed to upload bundle with scp.\n"
            f"stdout:\n{scp_result.stdout}\n"
            f"stderr:\n{scp_result.stderr}"
        )


def main() -> int:
    parser = argparse.ArgumentParser(description="Stage or upload the Integration notebook bundle.")
    parser.add_argument(
        "--output-dir",
        default=str(BASE_DIR / "deploy_bundle"),
        help="Local bundle directory to populate before upload.",
    )
    parser.add_argument(
        "--remote",
        help="Optional scp destination like xilinx@192.168.2.99:/home/xilinx/jupyter_notebooks/Integration",
    )
    args = parser.parse_args()

    output_dir = Path(args.output_dir).resolve()
    manifest = stage_bundle(output_dir)

    print(f"Bundle staged in: {output_dir}")
    print(f"Files staged: {len(manifest['staged_files'])}")
    if manifest["missing_files"]:
        print("Missing files:")
        for item in manifest["missing_files"]:
            print(f"  - {item}")
    else:
        print("No missing files detected.")

    if args.remote:
        upload_bundle(output_dir, args.remote)
        print(f"Bundle uploaded to: {args.remote}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
