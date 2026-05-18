#!/usr/bin/env python3
"""
extract_hwh.py — Extract the hardware hand-off (.hwh) file from a Vivado .xsa archive.

The .xsa file is a ZIP archive. PYNQ requires a .hwh file whose stem name
exactly matches the .bit file stem (mlp_accelerator.hwh <-> mlp_accelerator.bit).

Usage:
    python extract_hwh.py                              # uses defaults below
    python extract_hwh.py --xsa /path/to/mlp_accelerator.xsa --out-dir ./mlp_vivado_files
"""

import argparse
import pathlib
import shutil
import sys
import zipfile


# Defaults (adjust if your Vivado output path differs)
_HERE = pathlib.Path(__file__).resolve().parent
DEFAULT_XSA       = str(_HERE.parent / 'vivado' / 'proj_mlp_accelerator' / 'output' / 'mlp_accelerator.xsa')
DEFAULT_OUT_DIR   = str(_HERE / 'mlp_vivado_files')
EXPECTED_HWH_STEM = 'mlp_accelerator'   # must match mlp_accelerator.bit stem exactly


def extract_hwh(xsa_path: str, out_dir: str) -> pathlib.Path:
    xsa = pathlib.Path(xsa_path).resolve()
    out = pathlib.Path(out_dir).resolve()

    if not xsa.exists():
        sys.exit(f"ERROR: XSA file not found: {xsa}")

    out.mkdir(parents=True, exist_ok=True)

    with zipfile.ZipFile(xsa) as z:
        hwh_entries = [n for n in z.namelist() if n.endswith('.hwh')]
        if not hwh_entries:
            sys.exit(f"ERROR: No .hwh file found inside {xsa}.\n"
                     f"  Archive contents: {z.namelist()[:20]}")

        # Pick the first .hwh (usually only one)
        entry = hwh_entries[0]
        print(f"Found in archive : {entry}")

        tmp_dir = out / '_xsa_extract'
        z.extract(entry, tmp_dir)
        extracted = tmp_dir / entry

    # Copy with the correct stem so PYNQ can match it to the .bit file
    target = out / f'{EXPECTED_HWH_STEM}.hwh'
    shutil.copy(extracted, target)
    print(f"Copied to        : {target}")
    print(f"  Size           : {target.stat().st_size / 1024:.0f} KB")

    # Clean up temporary extraction directory
    shutil.rmtree(tmp_dir, ignore_errors=True)

    return target


if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__,
                                formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument('--xsa',     default=DEFAULT_XSA,
                   help=f'Input .xsa file (default: {DEFAULT_XSA})')
    p.add_argument('--out-dir', default=DEFAULT_OUT_DIR,
                   help=f'Output directory (default: {DEFAULT_OUT_DIR})')
    args = p.parse_args()
    extract_hwh(args.xsa, args.out_dir)
