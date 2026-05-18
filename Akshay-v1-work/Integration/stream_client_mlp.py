"""
stream_client_mlp.py
====================
Laptop-side client for the MLP Siren Classifier.

Modes:
  FILE.wav   Replay a WAV file (single inference, or --loop to repeat).
  --mic      Record live audio from the microphone in rolling windows.

Requirements (laptop):
  pip install sounddevice soundfile numpy

Usage:
  python stream_client_mlp.py --host 192.168.2.99 sound_8.wav
  python stream_client_mlp.py --host 192.168.2.99 sound_8.wav --loop
  python stream_client_mlp.py --host 192.168.2.99 --mic
"""

import argparse
import io
import json
import socket
import time

import numpy as np

PORT        = 5005
SAMPLE_RATE = 16000
WINDOW_SEC  = 2


def _send(sock: socket.socket, model: str, data: bytes) -> dict:
    hdr = json.dumps({"model": model, "size": len(data)}).encode() + b"\n"
    sock.sendall(hdr + data)
    buf = b""
    while b"\n" not in buf:
        buf += sock.recv(4096)
    return json.loads(buf.split(b"\n")[0].decode())


def _numpy_to_wav(audio: np.ndarray, sr: int) -> bytes:
    import soundfile as sf
    buf = io.BytesIO()
    sf.write(buf, np.clip(audio, -1.0, 1.0), sr, format="WAV", subtype="PCM_16")
    return buf.getvalue()


def run_file(host, path, loop=False):
    with open(path, "rb") as f:
        wav_bytes = f.read()
    print(f"[mlp] Connecting to {host}:{PORT} ...")
    with socket.create_connection((host, PORT), timeout=10) as sock:
        print(f"[mlp] Connected. Sending {path} ({len(wav_bytes)} bytes).")
        i = 0
        while True:
            i += 1
            t0   = time.perf_counter()
            resp = _send(sock, "mlp", wav_bytes)
            rtt  = (time.perf_counter() - t0) * 1000
            if "error" in resp:
                print(f"  [{i}]  ERROR: {resp['error']}")
            else:
                print(f"  [{i}]  -> {resp.get('prediction','?'):<12}  "
                      f"(FPGA {resp.get('latency_ms','?')} ms, RTT {rtt:.0f} ms)")
            if not loop:
                break
            time.sleep(0.5)


def run_mic(host, window_sec=WINDOW_SEC):
    import sounddevice as sd
    print(f"[mlp] Connecting to {host}:{PORT} ...")
    with socket.create_connection((host, PORT), timeout=10) as sock:
        print(f"[mlp] Connected. Recording {window_sec}s windows from mic. Ctrl+C to stop.")
        w = 0
        while True:
            audio = sd.rec(int(window_sec * SAMPLE_RATE), samplerate=SAMPLE_RATE,
                           channels=1, dtype="float32")
            sd.wait()
            wav_bytes = _numpy_to_wav(audio.flatten(), SAMPLE_RATE)
            t0   = time.perf_counter()
            resp = _send(sock, "mlp", wav_bytes)
            rtt  = (time.perf_counter() - t0) * 1000
            w += 1
            if "error" in resp:
                print(f"  Window {w:4d}  ERROR: {resp['error']}")
            else:
                print(f"  Window {w:4d}  -> {resp.get('prediction','?'):<12}  "
                      f"(FPGA {resp.get('latency_ms','?')} ms, RTT {rtt:.0f} ms)")


def main():
    p = argparse.ArgumentParser(description="MLP siren streaming client")
    p.add_argument("file",   nargs="?",              help="WAV file to replay")
    p.add_argument("--host", default="192.168.2.99", help="Board IP")
    p.add_argument("--mic",  action="store_true",    help="Live microphone mode")
    p.add_argument("--loop", action="store_true",    help="Loop file replay")
    p.add_argument("--window", type=float, default=WINDOW_SEC,
                   help=f"Mic window length in seconds (default {WINDOW_SEC})")
    args = p.parse_args()
    if args.mic:
        run_mic(args.host, args.window)
    elif args.file:
        run_file(args.host, args.file, loop=args.loop)
    else:
        p.error("provide a WAV file or --mic")


if __name__ == "__main__":
    main()
