"""
stream_client_cnn.py
====================
Laptop-side client for the CNN Traffic Sign Classifier.

Modes:
  FILE         Send a single image file (JPEG / PNG).
  --loop FILE  Repeatedly send the same file.
  --cam        Live webcam mode (captures a frame every ~0.5 s, shows cv2 window).

Requirements (laptop):
  pip install opencv-python Pillow numpy

Usage:
  python stream_client_cnn.py --host 192.168.2.99 sign.jpg
  python stream_client_cnn.py --host 192.168.2.99 sign.jpg --loop
  python stream_client_cnn.py --host 192.168.2.99 --cam
"""

import argparse
import io
import json
import socket
import sys
import time


PORT = 5005


def _send(sock: socket.socket, data: bytes) -> dict:
    hdr = json.dumps({"model": "cnn", "size": len(data)}).encode() + b"\n"
    sock.sendall(hdr + data)
    buf = b""
    while b"\n" not in buf:
        buf += sock.recv(4096)
    return json.loads(buf.split(b"\n")[0].decode())


def _encode_jpeg(frame_bgr) -> bytes:
    """Encode an OpenCV BGR frame to JPEG bytes."""
    import cv2
    ok, enc = cv2.imencode(".jpg", frame_bgr, [cv2.IMWRITE_JPEG_QUALITY, 90])
    if not ok:
        raise RuntimeError("JPEG encode failed")
    return enc.tobytes()


def run_file(host, path, loop=False):
    with open(path, "rb") as f:
        img_bytes = f.read()
    print(f"[cnn] Connecting to {host}:{PORT} ...")
    with socket.create_connection((host, PORT), timeout=10) as sock:
        print(f"[cnn] Connected. Sending {path} ({len(img_bytes)} bytes).")
        i = 0
        while True:
            i += 1
            t0   = time.perf_counter()
            resp = _send(sock, img_bytes)
            rtt  = (time.perf_counter() - t0) * 1000
            if "error" in resp:
                print(f"  [{i}]  ERROR: {resp['error']}")
            else:
                total_ms = resp.get("total_latency_ms", resp.get("latency_ms", "?"))
                hw_ms = resp.get("hw_latency_ms")
                lat_text = f"total {total_ms} ms"
                if hw_ms is not None:
                    lat_text += f", hw {hw_ms} ms"
                print(f"  [{i}]  -> {resp.get('prediction','?'):<35}  "
                      f"({lat_text}, RTT {rtt:.0f} ms)")
            if not loop:
                break
            time.sleep(0.5)


def run_cam(host, interval=0.5):
    import cv2
    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        print("[cnn] ERROR: cannot open webcam (index 0)")
        sys.exit(1)
    print(f"[cnn] Connecting to {host}:{PORT} ...")
    with socket.create_connection((host, PORT), timeout=10) as sock:
        print("[cnn] Connected. Press 'q' in the preview window to quit.")
        frame_n = 0
        last_pred = ""
        last_t = 0.0
        while True:
            ok, frame = cap.read()
            if not ok:
                print("[cnn] Failed to grab frame — stopping.")
                break
            now = time.perf_counter()
            if now - last_t >= interval:
                last_t = now
                frame_n += 1
                img_bytes = _encode_jpeg(frame)
                t0   = time.perf_counter()
                resp = _send(sock, img_bytes)
                rtt  = (time.perf_counter() - t0) * 1000
                if "error" in resp:
                    last_pred = f"ERROR: {resp['error']}"
                else:
                    total_ms = resp.get("total_latency_ms", resp.get("latency_ms", "?"))
                    hw_ms = resp.get("hw_latency_ms")
                    lat_text = f"total {total_ms} ms"
                    if hw_ms is not None:
                        lat_text += f", hw {hw_ms} ms"
                    last_pred = (f"{resp.get('prediction','?')}  "
                                 f"({lat_text}, {rtt:.0f} ms RTT)")
                print(f"  Frame {frame_n:5d}  -> {last_pred}")
            # Overlay label on preview window
            disp = frame.copy()
            import cv2 as _cv2
            _cv2.putText(disp, last_pred, (10, 30), _cv2.FONT_HERSHEY_SIMPLEX,
                         0.5, (0, 255, 0), 1, _cv2.LINE_AA)
            _cv2.imshow("CNN Traffic Sign — live", disp)
            if cv2.waitKey(1) & 0xFF == ord("q"):
                break
        cap.release()
        cv2.destroyAllWindows()


def main():
    p = argparse.ArgumentParser(description="CNN traffic-sign streaming client")
    p.add_argument("file",   nargs="?",              help="Image file to send")
    p.add_argument("--host", default="192.168.2.99", help="Board IP")
    p.add_argument("--cam",  action="store_true",    help="Live webcam mode")
    p.add_argument("--loop", action="store_true",    help="Loop file replay")
    p.add_argument("--interval", type=float, default=0.5,
                   help="Seconds between webcam inferences (default 0.5)")
    args = p.parse_args()
    if args.cam:
        run_cam(args.host, args.interval)
    elif args.file:
        run_file(args.host, args.file, loop=args.loop)
    else:
        p.error("provide an image file or --cam")


if __name__ == "__main__":
    main()
