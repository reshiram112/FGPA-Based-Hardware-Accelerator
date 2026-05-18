# Siren Classifier FPGA Accelerator — Technical Handoff

This document captures everything needed to understand, rebuild, and extend
the siren audio classifier FPGA accelerator on PYNQ-Z2.

---

## Project Summary

| Item | Detail |
|---|---|
| Task | Binary audio classification: ambulance (0) vs firetruck (1) |
| Model | 41 -> 4 -> 2 MLP, ReLU hidden activation |
| Parameters | 178 total |
| Input | 41-dim standardised float feature vector from WAV audio |
| Output | 1 uint32 argmax (0 or 1) |
| FPGA | Zynq XC7Z020CLG400-1 (PYNQ-Z2) |
| IP | Vitis HLS kernel + AXI-DMA, no AXI-Lite control port |
| Precision | Q4.12 (ap_fixed<16,4>, SCALE=4096) |

---

## Checkpoint: `best_model.pt`

Location: `C:\Users\TA17084\Downloads\archive\sounds\ambulance\artifacts\best_model.pt`

Contents:
```python
{
  'model_state_dict': { ... },  # network.0.weight (4x41), network.0.bias (4),
                                 # network.2.weight (2x4),  network.2.bias (2)
  'class_names': ['ambulance', 'firetruck'],
  'feature_mean': [...],   # 41 floats - subtract before inference
  'feature_std':  [...],   # 41 floats - divide before inference
  'config': { 'hidden_layers': [4], 'dropout': 0.0, 'learning_rate': 0.01,
              'weight_decay': 0.0001, 'batch_size': 32, 'max_epochs': 80, 'patience': 12 },
  'params': 178
}
```

Load with `weights_only=False` because it contains non-tensor metadata.

---

## Feature Extraction (must match training exactly)

```python
from scipy.io import wavfile
from scipy.signal import resample, spectrogram, hann

sr, data = wavfile.read(wav_path)
# convert to float32
data = data.astype(np.float32) / (32768. if data.dtype==np.int16 else ...)
if data.ndim == 2: data = data.mean(axis=1)        # stereo -> mono
data /= max(np.max(np.abs(data)), 1e-9)            # peak normalise
if sr != 16000: data = resample(data, int(len(data)*16000/sr))  # 16 kHz

freqs, _, Sxx = spectrogram(data, fs=16000, window=hann(512),
    nperseg=512, noverlap=256, scaling='spectrum', mode='magnitude')
Sxx = np.log1p(Sxx)

# 32 spectral features: 8 bands x (mean, std, p25, p75)
SPEC_BANDS = [(0,500),(500,1000),(1000,2000),(2000,4000),
              (4000,6000),(6000,8000),(8000,10000),(10000,16000)]
for flo,fhi in SPEC_BANDS:
    b = Sxx[(freqs>=flo)&(freqs<fhi), :].flatten()
    feats += [mean, std, p25, p75]

# 5 waveform stats
feats += [mean(data), std(data), mean(abs), max(abs), p90(abs)]

# 4 band-energy means
ENERGY_BANDS = [(0,300),(300,1000),(1000,3000),(3000,8000)]
for flo,fhi in ENERGY_BANDS:
    feats += [mean of that freq band across time]

# Standardise
x_norm = (feats - feature_mean) / (feature_std + 1e-8)
```

Total: **41 features**.

---

## Q4.12 Encoding for FPGA

```python
SCALE = 4096
def encode(x):
    q = int(round(float(x) * SCALE))
    q = max(-32768, min(32767, q))
    return struct.unpack('<I', struct.pack('<h', q) + b'\x00\x00')[0]
```

- 41 uint32 values sent to FPGA via DMA (164 bytes)
- Q4.12 range: [-8, 8) -- standardised features fit easily
- Weight range: W1 ~[-2.4k, 2.1k] Q4.12 quanta = [-0.59, 0.52] float

---

## HLS Kernel (`mlp_top.cpp`)

```
apAXI<32> s_axis_input  (41 words, Q4.12 in bits[15:0])
apAXI<32> m_axis_output (1 word, argmax, TLAST=1)
ap_ctrl_none  (free-running, NO AXI-Lite control port)

Layer 1: 41->4, ReLU
  for o in range(4):
    acc = b1[o]
    for i in range(41): acc += W1[o][i] * x[i]
    h1[o] = max(0, acc)

Layer 2: 4->2, argmax
  for o in range(2):
    logits[o] = b2[o] + sum(W2[o][i]*h1[i] for i in range(4))
  output = 1 if logits[1] > logits[0] else 0
```

Weights stored as `static const int16_t` in LUTRAM (only 178 values -- tiny).

---

## Block Design

```
PS7 FCLK_CLK0 (100 MHz)
  |
  +-- ps7.M_AXI_GP0 -> axi_ic_ctrl -> axi_dma_0.S_AXI_LITE
  |
  +-- axi_dma_0.M_AXIS_MM2S -> mlp_top_0.s_axis_input
  +-- mlp_top_0.m_axis_output -> axi_dma_0.S_AXIS_S2MM
  |
  +-- axi_dma_0.M_AXI_MM2S -> axi_ic_hp0 -> ps7.S_AXI_HP0
  +-- axi_dma_0.M_AXI_S2MM -> axi_ic_hp0
```

Key DMA config:
- `c_include_sg = 0` (simple mode)
- `c_sg_length_width = 16`
- All AXI data widths = 32-bit

---

## PYNQ Host Code (Key Snippet)

```python
from pynq import Overlay, allocate
import numpy as np, struct

ol      = Overlay('mlp_accelerator.bit')
dma     = ol.axi_dma_0
SCALE   = 4096

# Encode 41 normalised features to Q4.12 uint32
in_buf  = allocate(shape=(41,), dtype=np.uint32)
out_buf = allocate(shape=(1,),  dtype=np.uint32)
for i, v in enumerate(x_norm):
    q = max(-32768, min(32767, int(round(float(v)*SCALE))))
    in_buf[i] = struct.unpack('<I', struct.pack('<h', q) + b'\x00\x00')[0]

dma.sendchannel.transfer(in_buf)
dma.recvchannel.transfer(out_buf)
dma.sendchannel.wait()
dma.recvchannel.wait()
cls = int(out_buf[0]) & 0x1   # 0=ambulance, 1=firetruck
```

**IMPORTANT**: Run in JupyterLab as root (`.ipynb`).
Direct `python script.py` from terminal fails with `RuntimeError: Could not open device with index '0'`.

---

## Build Environment

| Tool | Version / Path |
|---|---|
| Vitis HLS | 2025.1 -- `C:\Xilinx\2025.1\Vitis\bin\loader.bat` |
| Vivado | 2025.1 -- `C:\Xilinx\2025.1\Vivado\bin\vivado.bat` |
| Python (training) | 3.11 -- `C:\Users\TA17084\AppData\Local\Programs\Python\Python311\python.exe` |
| PyTorch | 2.5.1+cu121 |
| Board | PYNQ-Z2 @ `192.168.2.99`, user `xilinx`, pass `xilinx` |
| Board Python | 3.10 (pynq-venv) |
| FPGA Part | xc7z020clg400-1 |

**DO NOT** mix Vitis HLS and Vivado environment scripts in the same shell.
Use `cmd /c` isolation (already done in `.bat` wrappers).

---

## ARM Latency Estimate

- x86-64 measured: ~0.13 ms (1 thread, MKL)
- ARM A9 simulated: ~6 ms (x46 scale)
  - x86 MKL BLAS ~60 GFLOPS scalar; ARM Cortex-A9 ~1.3 GFLOPS NEON
- FPGA @ 100 MHz: sub-microsecond (pipeline latency ~100 cycles)

---

## Files Changed From RadioML Version

Every file under `MLP/` was updated:
- Architecture: 256->512->256->128->11 => 41->4->2
- Input: IQ samples (RadioML) => WAV audio features (siren)
- Weights: 297,227 => 178 parameters
- DMA: 1024 B in => 164 B in, same 4 B out
- Classes: 11 modulation types => 2 (ambulance, firetruck)
- Weight storage: BRAM => LUTRAM (tiny model)
- No BatchNorm folding needed

---

## Known Issues / Notes

1. `feature_stats.npz` must be present on the PYNQ board alongside the `.bit`/`.hwh`
   (created by saving `feature_mean`/`feature_std` from the checkpoint, see `deploy.py`)
2. `scipy` must be installed in the pynq-venv for WAV preprocessing on-board
3. The Q4.12 encoding clips weights outside [-8, 8) float range -- check
   `generate_weights.py` output to verify no large weight values are clipped
4. `ap_ctrl_none` means there is NO AXI-Lite control port on the HLS IP;
   Vivado block design connects DMA control directly to GP0, HLS IP has no S_AXI_CTRL
