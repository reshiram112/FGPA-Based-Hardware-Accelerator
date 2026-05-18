"""
inference/app.py
================
Flask application for the Automotive ML Inference Dashboard.

Routes
------
GET  /               → render index.html
POST /infer          → multipart file upload → dispatcher → JSON response
GET  /sample/<path>  → serve files from ../sample_inputs/
"""

import os
import sys

from flask import Flask, request, jsonify, render_template, send_from_directory

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SAMPLE_DIR = os.path.join(ROOT, 'sample_inputs')

app = Flask(
    __name__,
    template_folder=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'templates'),
    static_folder=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'static'),
)

# Import dispatcher (models are loaded here once at module-import time)
from dispatcher import route_and_infer


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/infer', methods=['POST'])
def infer():
    if 'file' not in request.files:
        return jsonify({'error': 'No file uploaded. Send a multipart/form-data request with key "file".'}), 400

    uploaded = request.files['file']
    if uploaded.filename == '':
        return jsonify({'error': 'Empty filename.'}), 400

    filename   = uploaded.filename
    file_bytes = uploaded.read()

    try:
        n_runs = int(request.form.get('n_runs', 100))
        result = route_and_infer(file_bytes, filename, n_runs=n_runs)
        return jsonify(result)
    except ValueError as exc:
        return jsonify({'error': str(exc)}), 400
    except Exception as exc:
        import traceback
        traceback.print_exc()
        return jsonify({'error': str(exc)}), 500


@app.route('/sample/<path:filepath>')
def sample(filepath):
    """Serve sample input files for the demo buttons in the UI."""
    directory = os.path.join(SAMPLE_DIR, os.path.dirname(filepath))
    filename  = os.path.basename(filepath)
    return send_from_directory(directory, filename)


# ── Launch ────────────────────────────────────────────────────────────────────

def _launch():
    port = int(os.environ.get('PORT', 5050))
    url  = f'http://127.0.0.1:{port}'

    try:
        import webview                      # pywebview optional dependency
        import threading

        def _run_flask():
            app.run(host='127.0.0.1', port=port, debug=False, use_reloader=False)

        t = threading.Thread(target=_run_flask, daemon=True)
        t.start()

        # Give Flask a moment to bind
        import time
        time.sleep(1.5)

        webview.create_window(
            'Automotive ML Inference — Laptop CPU Demo',
            url,
            width=1400,
            height=900,
            resizable=True,
        )
        webview.start()
    except ImportError:
        import webbrowser, threading

        def _open_browser():
            import time; time.sleep(1.2)
            webbrowser.open(url)

        threading.Thread(target=_open_browser, daemon=True).start()
        print(f'[app] pywebview not installed — opening browser at {url}')
        app.run(host='127.0.0.1', port=port, debug=False)


if __name__ == '__main__':
    _launch()
