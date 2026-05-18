"""
integration_runtime.py
Core dispatcher module for the FPGA Integration bundle.
BASE_DIR is the folder containing this file (the Integration/ or deploy_bundle/ root).
"""

import os
import subprocess
import sys
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent

# ---------------------------------------------------------------------------
# Model configuration
# ---------------------------------------------------------------------------
MODEL_CONFIG = {
    "bnn": {
        "label": "BNN CAN Vehicle Classifier",
        "notebook": "bnn_inference_pynq.ipynb",
        "assets": ["bnn_accelerator.bit", "bnn_accelerator.hwh", "bnn_can_feature_stats.npz"],
    },
    "cnn": {
        "label": "CNN Traffic Sign Classifier",
        "notebook": "cnn_accelerator_script.ipynb",
        "assets": ["cnn_accelerator.bit", "cnn_accelerator.hwh"],
    },
    "svm": {
        "label": "SVM Lane Classifier",
        "notebook": "svm_accelerator_script.ipynb",
        "assets": ["svm_accelerator.bit", "svm_accelerator.hwh"],
    },
    "mlp": {
        "label": "MLP Siren Classifier",
        "notebook": "mlp_inference_pynq.ipynb",
        "assets": ["mlp_accelerator.bit", "mlp_accelerator.hwh", "feature_stats.npz"],
    },
}

_EXT_MAP = {
    ".log":  "bnn",
    ".csv":  "svm",
    ".wav":  "mlp",
    ".png":  "cnn",
    ".jpg":  "cnn",
    ".jpeg": "cnn",
    ".bmp":  "cnn",
    ".tif":  "cnn",
    ".tiff": "cnn",
}

# ---------------------------------------------------------------------------
# Public helpers
# ---------------------------------------------------------------------------

def infer_model_from_filename(filename: str) -> str:
    """Return the model key ('bnn'|'cnn'|'svm'|'mlp') from a filename."""
    ext = Path(filename).suffix.strip().lower()
    if ext not in _EXT_MAP:
        raise ValueError(
            f"Cannot infer model from extension '{ext}'. "
            f"Supported extensions: {sorted(_EXT_MAP)}"
        )
    return _EXT_MAP[ext]


def execute_model_notebook(model_key: str, input_path: str) -> dict:
    """
    Execute the model notebook for *model_key* against *input_path*.

    The notebook is run via nbconvert (papermill-style: env-var injection).
    Returns a dict with keys:
        executed_notebook  – path to the executed .ipynb written to /tmp
        stdout             – captured stdout from nbconvert
        stderr             – captured stderr from nbconvert
        returncode         – process return code
    """
    if model_key not in MODEL_CONFIG:
        raise ValueError(f"Unknown model key: {model_key!r}. Choose from {list(MODEL_CONFIG)}")

    cfg = MODEL_CONFIG[model_key]
    nb_src = BASE_DIR / "model_notebooks" / cfg["notebook"]
    if not nb_src.exists():
        raise FileNotFoundError(f"Model notebook not found: {nb_src}")

    out_nb = Path("/tmp") / f"executed_{model_key}.ipynb"

    env = os.environ.copy()
    env["INTEGRATION_BASE_DIR"] = str(BASE_DIR)
    env["ROUTED_INPUT_PATH"] = str(input_path)

    cmd = [
        sys.executable, "-m", "nbconvert",
        "--to", "notebook",
        "--execute",
        "--ExecutePreprocessor.timeout=300",
        "--output", str(out_nb),
        str(nb_src),
    ]

    proc = subprocess.run(cmd, capture_output=True, text=True, env=env)

    return {
        "executed_notebook": str(out_nb),
        "stdout": proc.stdout,
        "stderr": proc.stderr,
        "returncode": proc.returncode,
    }
