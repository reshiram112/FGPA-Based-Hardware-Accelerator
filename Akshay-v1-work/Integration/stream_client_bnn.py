"""
stream_client_bnn.py
====================
Laptop-side client for the BNN CAN Vehicle Classifier.

Modes:
  FILE.log         Replay a CAN log file in 256-message windows.
  --loop FILE.log  Repeat the file continuously.
  --follow FILE    Tail a growing CAN log (like tail -f), send windows of
                   256 messages as they accumulate.

Requirements (laptop):  standard library only.

CAN log line format expected (candump-style):
  (1234567890.123456) vcan0 0A1#DEADBEEF

Usage:
  python stream_client_bnn.py --host 192.168.2.99 candump.log
  python stream_client_bnn.py --host 192.168.2.99 candump.log --loop
  python stream_client_bnn.py --host 192.168.2.99 --follow /tmp/candump.log
"""

import argparse
import json
import re
import socket
import sys
import time

PORT      = 5005
WIN_LINES = 256
CAN_RE    = re.compile(r'^\(([^)]+)\)\s+\S+\s+([0-9A-Fa-f]+)#([0-9A-Fa-f]*)$')


def _send(sock: socket.socket, text_payload: str) -> dict:
    data = text_payload.encode("utf-8")
    hdr  = json.dumps({"model": "bnn", "size": len(data)}).encode() + b"\n"
    sock.sendall(hdr + data)
    buf = b""
    while b"\n" not in buf:
        buf += sock.recv(4096)
    return json.loads(buf.split(b"\n")[0].decode())


def _is_valid_line(line: str) -> bool:
    return bool(CAN_RE.match(line.strip()))


def run_file(host, path, loop=False):
    print(f"[bnn] Connecting to {host}:{PORT} ...")
    with socket.create_connection((host, PORT), timeout=10) as sock:
        print(f"[bnn] Connected. Replaying {path} in windows of {WIN_LINES} messages.")
        window_n = 0
        while True:
            with open(path, "r", errors="replace") as f:
                lines = [l for l in f if _is_valid_line(l)]
            n_wins = max(1, len(lines) // WIN_LINES)
            for w in range(n_wins):
                chunk   = lines[w * WIN_LINES : (w + 1) * WIN_LINES]
                payload = "".join(chunk)
                window_n += 1
                t0   = time.perf_counter()
                resp = _send(sock, payload)
                rtt  = (time.perf_counter() - t0) * 1000
                if "error" in resp:
                    print(f"  Window {window_n:4d}  ERROR: {resp['error']}")
                else:
                    print(f"  Window {window_n:4d}  -> {resp.get('prediction','?'):<14}  "
                          f"(FPGA {resp.get('latency_ms','?')} ms, RTT {rtt:.0f} ms)")
                time.sleep(0.05)
            if not loop:
                break


def run_follow(host, path):
    """Tail a growing file — send a window whenever 256 new messages accumulate."""
    print(f"[bnn] Connecting to {host}:{PORT} ...")
    with socket.create_connection((host, PORT), timeout=10) as sock:
        print(f"[bnn] Connected. Following {path} (Ctrl+C to stop).")
        accumulated = []
        window_n    = 0
        with open(path, "r", errors="replace") as f:
            f.seek(0, 2)          # seek to end — read only new lines
            while True:
                line = f.readline()
                if line:
                    if _is_valid_line(line):
                        accumulated.append(line)
                    if len(accumulated) >= WIN_LINES:
                        payload  = "".join(accumulated[:WIN_LINES])
                        accumulated = accumulated[WIN_LINES:]
                        window_n += 1
                        t0   = time.perf_counter()
                        resp = _send(sock, payload)
                        rtt  = (time.perf_counter() - t0) * 1000
                        if "error" in resp:
                            print(f"  Window {window_n:4d}  ERROR: {resp['error']}")
                        else:
                            print(f"  Window {window_n:4d}  -> {resp.get('prediction','?'):<14}  "
                                  f"(FPGA {resp.get('latency_ms','?')} ms, RTT {rtt:.0f} ms)")
                else:
                    time.sleep(0.05)


def main():
    p = argparse.ArgumentParser(description="BNN CAN vehicle streaming client")
    p.add_argument("file",     nargs="?",              help="CAN log file to replay")
    p.add_argument("--host",   default="192.168.2.99", help="Board IP")
    p.add_argument("--loop",   action="store_true",    help="Loop file replay")
    p.add_argument("--follow", metavar="FILE",         help="Tail growing log file")
    args = p.parse_args()

    if args.follow:
        run_follow(args.host, args.follow)
    elif args.file:
        run_file(args.host, args.file, loop=args.loop)
    else:
        p.error("provide a .log file or --follow FILE")


if __name__ == "__main__":
    main()
