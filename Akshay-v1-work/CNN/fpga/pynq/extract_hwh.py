#!/usr/bin/env python3
"""
extract_hwh.py — Extract the hardware hand-off (.hwh) file from a Vivado .xsa archive for CNN.
"""
import argparse
import pathlib
import shutil
import sys
import zipfile

_HERE = pathlib.Path(__file__).resolve().parent
DEFAULT_XSA       = str(_HERE.parent / 'vivado' / 'proj_cnn' / 'output' / 'cnn.xsa')
DEFAULT_OUT_DIR   = str(_HERE / 'cnn_vivado_files')
EXPECTED_HWH_STEM = 'cnn'

def extract_hwh(xsa_path: str, out_dir: str) -> pathlib.Path:
    xsa = pathlib.Path(xsa_path).resolve()
    out = pathlib.Path(out_dir).resolve()
    if not xsa.exists(): sys.exit(f"ERROR: XSA file not found: {xsa}")
    out.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(xsa) as z:
        hwh_entries = [n for n in z.namelist() if n.endswith('.hwh')]
        if not hwh_entries: sys.exit(f"ERROR: No .hwh file found inside {xsa}.")
        entry = hwh_entries[0]
        tmp_dir = out / '_xsa_extract'
        z.extract(entry, tmp_dir)
        extracted = tmp_dir / entry
    target = out / f'{EXPECTED_HWH_STEM}.hwh'
    shutil.copy(extracted, target)
    shutil.rmtree(tmp_dir, ignore_errors=True)
    return target

if __name__ == '__main__':
    p = argparse.ArgumentParser()
    p.add_argument('--xsa',     default=DEFAULT_XSA)
    p.add_argument('--out-dir', default=DEFAULT_OUT_DIR)
    args = p.parse_args()
    extract_hwh(args.xsa, args.out_dir)
