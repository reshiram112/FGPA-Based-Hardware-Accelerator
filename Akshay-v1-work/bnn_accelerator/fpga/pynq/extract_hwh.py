#!/usr/bin/env python3
"""
extract_hwh.py -- Extract .hwh from Vivado .xsa for BNN accelerator.

Usage:
    python extract_hwh.py
    python extract_hwh.py --xsa /path/to/bnn_accelerator.xsa
"""
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
