"""
stream_client_svm.py
====================
Laptop-side client for the SVM Lane Change Classifier.

Modes:
  FILE.csv     Stream rows of a CSV file to the board.
  --stdin      Read CSV rows from stdin (pipe-friendly).

Options:
  --chunk-size N   Number of rows to send per inference request (default 1).
  --loop           Repeat file until Ctrl+C.

Requirements (laptop):
  pip install pandas

Output format per chunk:
  For a single-row chunk:  prediction string + latency
  For multi-row chunks:    one prediction per row + summary

Usage:
  python stream_client_svm.py --host 192.168.2.99 lane_data.csv
  python stream_client_svm.py --host 192.168.2.99 lane_data.csv --chunk-size 5 --loop
  cat lane_data.csv | python stream_client_svm.py --host 192.168.2.99 --stdin
"""

import argparse
import io
import json
import socket
import sys
import time

PORT = 5005


def _send_chunk(sock: socket.socket, csv_text: str) -> dict:
    data = csv_text.encode("utf-8")
    hdr  = json.dumps({"model": "svm", "size": len(data)}).encode() + b"\n"
    sock.sendall(hdr + data)
    buf = b""
    while b"\n" not in buf:
        buf += sock.recv(4096)
    return json.loads(buf.split(b"\n")[0].decode())


def _chunks(df, size):
    """Yield successive sub-DataFrames of `size` rows."""
    import pandas as pd
    for i in range(0, len(df), size):
        yield df.iloc[i : i + size]


def _print_resp(chunk_n, resp, rtt):
    if "error" in resp:
        print(f"  Chunk {chunk_n:4d}  ERROR: {resp['error']}")
    else:
        preds = resp.get("predictions", [])
        if len(preds) == 1:
            r = preds[0]
            print(f"  Chunk {chunk_n:4d}  -> {r.get('prediction','?'):<12}  "
                  f"(FPGA {r.get('latency_ms','?')} ms, RTT {rtt:.0f} ms)")
        else:
            print(f"  Chunk {chunk_n:4d}  ({len(preds)} rows, RTT {rtt:.0f} ms):")
            for i, r in enumerate(preds):
                print(f"    row {i:3d}  -> {r.get('prediction','?'):<12}  "
                      f"({r.get('latency_ms','?')} ms)")


def run_file(host, path, chunk_size=1, loop=False):
    import pandas as pd
    print(f"[svm] Connecting to {host}:{PORT} ...")
    with socket.create_connection((host, PORT), timeout=10) as sock:
        print(f"[svm] Connected. Streaming {path} in chunks of {chunk_size} row(s).")
        chunk_n = 0
        while True:
            df = pd.read_csv(path)
            for sub in _chunks(df, chunk_size):
                csv_text = sub.to_csv(index=False)
                chunk_n += 1
                t0   = time.perf_counter()
                resp = _send_chunk(sock, csv_text)
                rtt  = (time.perf_counter() - t0) * 1000
                _print_resp(chunk_n, resp, rtt)
                time.sleep(0.02)
            if not loop:
                break


def run_stdin(host, chunk_size=1):
    import pandas as pd
    raw = sys.stdin.read()
    df  = pd.read_csv(io.StringIO(raw))
    print(f"[svm] Connecting to {host}:{PORT} ...")
    with socket.create_connection((host, PORT), timeout=10) as sock:
        print(f"[svm] Connected. Sending {len(df)} rows from stdin in chunks of {chunk_size}.")
        chunk_n = 0
        for sub in _chunks(df, chunk_size):
            csv_text = sub.to_csv(index=False)
            chunk_n += 1
            t0   = time.perf_counter()
            resp = _send_chunk(sock, csv_text)
            rtt  = (time.perf_counter() - t0) * 1000
            _print_resp(chunk_n, resp, rtt)


def main():
    p = argparse.ArgumentParser(description="SVM lane-change streaming client")
    p.add_argument("file",         nargs="?",              help="CSV file to stream")
    p.add_argument("--host",       default="192.168.2.99", help="Board IP")
    p.add_argument("--stdin",      action="store_true",    help="Read CSV from stdin")
    p.add_argument("--chunk-size", type=int, default=1,
                   dest="chunk_size",                      help="Rows per request (default 1)")
    p.add_argument("--loop",       action="store_true",    help="Loop file replay")
    args = p.parse_args()

    if args.stdin:
        run_stdin(args.host, args.chunk_size)
    elif args.file:
        run_file(args.host, args.file, chunk_size=args.chunk_size, loop=args.loop)
    else:
        p.error("provide a CSV file or --stdin")


if __name__ == "__main__":
    main()
