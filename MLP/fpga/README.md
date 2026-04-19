# FPGA Port — MNIST MLP on PYNQ-Z2

Complete flow to deploy the trained MLP (98.44% accuracy) onto the PYNQ-Z2 FPGA board using Vivado/Vitis HLS 2025.1.

---

## Directory Structure

```
fpga/
├── 01_export_weights_colab.py   Phase 1 — run on Colab
├── hls/
│   ├── mlp_top.h                HLS types & interface declarations
│   ├── mlp_top.cpp              HLS implementation (4-layer MLP)
│   ├── mlp_tb.cpp               C-sim testbench
│   └── run_hls.tcl              Vitis HLS automation script
├── hls_ip/                      (auto-generated) IP catalog output
├── vivado/
│   └── create_project.tcl       Vivado block design + bitstream
└── pynq/
    └── mnist_inference.ipynb    On-board inference notebook
```

---

## Architecture Overview

```
PS (ARM @ 650 MHz)                        PL (XC7Z020 @ 100 MHz)
┌──────────────────────┐                 ┌──────────────────────────┐
│  PYNQ Python         │                 │  mlp_top HLS IP          │
│  - Load weights→DDR  │──AXI4-HP0──────▶│  Reads W1..W4 from DDR   │
│  - Send image        │──AXI-Stream────▶│  784→512→256→128→10      │
│  - Get logits        │◀─AXI-Stream────│  Fixed-point ap_fixed<16,6>│
└──────────────────────┘                 └──────────────────────────┘
```

**Why weights in DDR?**  
The MLP has 567K parameters × 2 bytes = 1.1 MB. The XC7Z020 only has 630 KB of BRAM total. Storing weights in PS DDR3 (512 MB) is the industry-standard solution (same approach as Vitis AI). The PL reads them via the AXI4-HP0 high-performance port.

---

## Step-by-Step Instructions

### Phase 1 — Export Weights (Google Colab)

1. After training completes, upload `fpga/01_export_weights_colab.py` to Colab
2. Run it in Colab — it will:
   - Load `mnist_mlp_best.pth`
   - Fold BatchNorm into Linear layers (fused weights)
   - Quantise to `ap_fixed<16,6>` (int16, scale = 1024)
   - Verify quantised accuracy ≥ 96%
   - Save `fpga_weights.zip` (w1.npy … b4.npy + mlp_weights.h)
3. Download `fpga_weights.zip`
4. Copy `mlp_weights.h` to `fpga/hls/`
5. Keep `w1.npy … b4.npy` for the PYNQ board

---

### Phase 2 — HLS Synthesis (Vitis HLS 2025.1)

**Option A — GUI:**
1. Open Vitis HLS 2025.1
2. File → New Project → `mlp_top` → Part: `xc7z020clg400-1`
3. Add sources: `mlp_top.h`, `mlp_top.cpp`
4. Add testbench: `mlp_tb.cpp`, `mlp_weights.h`
5. Set top function: `mlp_top`
6. Clock: 10 ns (100 MHz)
7. Run C Simulation → verify PASS
8. Run Synthesis
9. Export RTL → IP Catalog → output to `fpga/hls_ip/`

**Option B — Command Line:**
```bash
cd fpga/hls
vitis_hls -f run_hls.tcl
```

**Expected synthesis results (XC7Z020):**
| Resource | Used | Available | % |
|----------|------|-----------|---|
| LUT | ~25,000 | 53,200 | ~47% |
| FF | ~12,000 | 106,400 | ~11% |
| DSP | ~180 | 220 | ~82% |
| BRAM | ~20 | 140 | ~14% |

> [!TIP]
> If DSPs exceed 220, reduce the unroll factor in `run_hls.tcl` from 8 to 4.

---

### Phase 3 — Vivado Block Design + Bitstream

1. Open Vivado 2025.1
2. Open the Tcl Console (Tools → Tcl Console)
3. Run:
   ```tcl
   cd C:/Users/Akshay/OneDrive/Desktop/FGPA-Based-Hardware-Accelerator/fpga/vivado
   source create_project.tcl
   ```
4. Wait for implementation (~15–30 min)
5. Bitstream appears in `fpga/vivado/proj_mnist_mlp/output/mlp.bit`

**Also needed — generate `.hwh` file:**
In Vivado, after bitstream generation:
```tcl
write_hw_platform -fixed -force -include_bit ./output/mlp.xsa
```
Extract `mlp.hwh` from `mlp.xsa` (rename .xsa → .zip → extract).

---

### Phase 4 — Deploy on PYNQ-Z2

1. Connect PYNQ-Z2 via USB/Ethernet (default IP: `192.168.2.99`)
2. Open browser → `http://192.168.2.99` → Jupyter
3. Upload to PYNQ:
   - `mlp.bit`
   - `mlp.hwh`
   - `fpga/pynq/mnist_inference.ipynb`
   - `fpga_weights/` folder (w1.npy … b4.npy)
4. Open `mnist_inference.ipynb` and run all cells

**Expected output:**
```
=== FPGA Benchmark (1000 images) ===
Accuracy    : 97.8%
Throughput  : ~150 images/sec
Latency/img : ~6.5 ms
```

---

## Register Map (AXI4-Lite — mlp_top control)

| Offset | Register | Description |
|--------|----------|-------------|
| 0x00 | AP_CTRL | Bit 0 = start, Bit 1 = done |
| 0x10 | w1 | Physical address of W1 in DDR |
| 0x18 | b1 | Physical address of B1 in DDR |
| 0x20 | w2 | Physical address of W2 in DDR |
| 0x28 | b2 | Physical address of B2 in DDR |
| 0x30 | w3 | Physical address of W3 in DDR |
| 0x38 | b3 | Physical address of B3 in DDR |
| 0x40 | w4 | Physical address of W4 in DDR |
| 0x48 | b4 | Physical address of B4 in DDR |

> [!NOTE]
> Exact register offsets are in the generated HLS IP driver:
> `mlp_top/solution/impl/ip/drivers/mlp_top_v1_0/src/xmlp_top_hw.h`

---

## Precision: `ap_fixed<16,6>`

| Property | Value |
|----------|-------|
| Total bits | 16 |
| Integer bits | 6 |
| Fractional bits | 10 |
| Scale factor | 1024 (= 2^10) |
| Range | [-32, +31.999] |
| Resolution | ~0.001 |
| Memory per weight | 2 bytes |

Quantised accuracy: **≥ 97%** (vs 98.44% float32 baseline).

---

## Troubleshooting

| Issue | Fix |
|-------|-----|
| HLS timing not met | Reduce unroll factor (8→4) in `run_hls.tcl` |
| DSP overflow | Same — reduce unroll |
| PYNQ overlay load fails | Ensure `.hwh` matches `.bit` (same build) |
| Wrong predictions | Check register addresses against `xmlp_top_hw.h` |
| DMA timeout | Verify AXI-Stream TLAST is asserted at pixel 784 / logit 10 |
