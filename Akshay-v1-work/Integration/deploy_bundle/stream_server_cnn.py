"""
stream_server_cnn.py  --  CNN Live Inference Server (runs on the PYNQ board)
=============================================================================
Listens for JPEG frames sent by stream_client_cnn.py on your laptop.
For each frame: preprocess → FPGA inference → send prediction back.
The overlay is loaded ONCE at startup so every frame is fast.

Usage (on the board):
    python stream_server_cnn.py
    python stream_server_cnn.py --port 9001
    python stream_server_cnn.py --base /home/xilinx/jupyter_notebooks/Integration

Protocol (length-prefixed):
    Client → Server : 4-byte LE uint32 (JPEG length)  +  JPEG bytes
    Server → Client : 4-byte LE uint32 (JSON length)  +  UTF-8 JSON
                      e.g. {"pred": 14, "label": "Stop", "latency_ms": 2.41}
"""

import argparse
import io
import json
import os
import socket
import struct
import sys
import time
from pathlib import Path

import numpy as np
from PIL import Image
from pynq import Overlay, allocate

# ---------------------------------------------------------------------------
# GTSRB 43-class names
# ---------------------------------------------------------------------------
CLASS_NAMES = {
    0:  "Speed limit (20km/h)",
    1:  "Speed limit (30km/h)",
    2:  "Speed limit (50km/h)",
    3:  "Speed limit (60km/h)",
    4:  "Speed limit (70km/h)",
    5:  "Speed limit (80km/h)",
    6:  "End of speed limit (80km/h)",
    7:  "Speed limit (100km/h)",
    8:  "Speed limit (120km/h)",
    9:  "No passing",
    10: "No passing (vehicles >3.5t)",
    11: "Right-of-way at next intersection",
    12: "Priority road",
    13: "Yield",
    14: "Stop",
    15: "No vehicles",
    16: "Vehicles >3.5t prohibited",
    17: "No entry",
    18: "General caution",
    19: "Dangerous curve left",
    20: "Dangerous curve right",
    21: "Double curve",
    22: "Bumpy road",
    23: "Slippery road",
    24: "Road narrows on right",
    25: "Road work",
    26: "Traffic signals",
    27: "Pedestrians",
    28: "Children crossing",
    29: "Bicycles crossing",
    30: "Beware of ice/snow",
    31: "Wild animals crossing",
    32: "End of all speed and passing limits",
    33: "Turn right ahead",
    34: "Turn left ahead",
    35: "Ahead only",
    36: "Go straight or right",
    37: "Go straight or left",
    38: "Keep right",
    39: "Keep left",
    40: "Roundabout mandatory",
    41: "End of no passing",
    42: "End of no passing (vehicles >3.5t)",
}

# ---------------------------------------------------------------------------
# Args
# ---------------------------------------------------------------------------
parser = argparse.ArgumentParser(description="CNN FPGA live inference server")
parser.add_argument("--port", type=int, default=9001, help="TCP port to listen on (default: 9001)")
parser.add_argument("--base", type=str,
                    default=os.environ.get("INTEGRATION_BASE_DIR",
                                           str(Path(__file__).resolve().parent)),
                    help="Integration bundle root directory")
args = parser.parse_args()

BASE_DIR = Path(args.base)
BIT_FILE = str(BASE_DIR / "models" / "cnn" / "cnn_accelerator.bit")

# ---------------------------------------------------------------------------
# Load overlay once at startup
# ---------------------------------------------------------------------------
print(f"[CNN server] Loading bitstream: {BIT_FILE}")
if not Path(BIT_FILE).exists():
    print(f"ERROR: bitstream not found: {BIT_FILE}")
    sys.exit(1)

overlay = Overlay(BIT_FILE)
dma     = overlay.axi_dma_0
print("[CNN server] Bitstream loaded. FPGA ready.")

# ---------------------------------------------------------------------------
# Inference helpers
# ---------------------------------------------------------------------------
def preprocess(jpeg_bytes: bytes) -> np.ndarray:
    """Decode JPEG, resize to 32×32 RGB, convert to Q8.8 uint32 array."""
    img = Image.open(io.BytesIO(jpeg_bytes)).convert("RGB").resize((32, 32))
    arr = np.array(img, dtype=np.float32) / 255.0
    return np.array([int(v * 256) & 0xFFFF for v in arr.flatten()], dtype=np.uint32)


def cnn_predict(q8_img: np.ndarray):
    """Run one inference through the FPGA and return (class_id, latency_ms)."""
    in_buf  = allocate(shape=(3072,), dtype=np.uint32)
    out_buf = allocate(shape=(1,),    dtype=np.uint32)
    np.copyto(in_buf, q8_img)
    t0 = time.perf_counter()
    dma.sendchannel.transfer(in_buf)
    dma.recvchannel.transfer(out_buf)
    dma.sendchannel.wait()
    dma.recvchannel.wait()
    t1 = time.perf_counter()
    pred = int(out_buf[0])
    in_buf.freebuffer()
    out_buf.freebuffer()
    return pred, (t1 - t0) * 1000.0


# ---------------------------------------------------------------------------
# Socket helpers
# ---------------------------------------------------------------------------
def recv_exactly(sock: socket.socket, n: int) -> bytes:
    buf = b""
    while len(buf) < n:
        chunk = sock.recv(n - len(buf))
        if not chunk:
            raise ConnectionError("Client disconnected")
        buf += chunk
    return buf


# ---------------------------------------------------------------------------
# Server loop
# ---------------------------------------------------------------------------
srv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
srv.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
srv.bind(("0.0.0.0", args.port))
srv.listen(1)
print(f"[CNN server] Listening on port {args.port}  (Ctrl-C to stop)")

while True:
    conn, addr = srv.accept()
    print(f"[CNN server] Client connected: {addr}")
    frame_count = 0
    try:
        while True:
            # Receive JPEG frame
            hdr  = recv_exactly(conn, 4)
            size = struct.unpack("<I", hdr)[0]
            jpeg = recv_exactly(conn, size)

            # Preprocess + FPGA inference
            q8   = preprocess(jpeg)
            pred, lat = cnn_predict(q8)
            label = CLASS_NAMES.get(pred, f"Class {pred}")

            # Send JSON response
            resp   = json.dumps({"pred": pred, "label": label, "latency_ms": round(lat, 3)})
            resp_b = resp.encode()
            conn.sendall(struct.pack("<I", len(resp_b)) + resp_b)

            frame_count += 1
            print(f"  [{frame_count:5d}] {label:<40}  {lat:.2f} ms")

    except (ConnectionError, ConnectionResetError, BrokenPipeError):
        print(f"[CNN server] Client {addr} disconnected after {frame_count} frames.")
    except Exception as e:
        print(f"[CNN server] Error: {e}")
    finally:
        conn.close()
