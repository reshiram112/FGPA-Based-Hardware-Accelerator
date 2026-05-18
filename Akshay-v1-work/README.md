# FPGA Model and Accelerator Overview

This README describes the four accelerator folders in terms of the **models themselves**, their **network architecture**, and how each model is mapped into FPGA hardware on the PYNQ-Z2. The focus here is the accelerator design, numeric representation, datapath, and host-to-FPGA interface, not the repo layout.

The four modeled accelerators are:

- `bnn_accelerator/`
- `cnn_accelerator/`
- `svm_accelerator/`
- `siren_mlp/`

All four target the same basic deployment pattern:

- Zynq-7000 / PYNQ-Z2 platform
- ARM Cortex-A9 Processing System (PS)
- custom accelerator in Programmable Logic (PL)
- AXI DMA for data movement
- AXI-Stream for feature/input and result transport

## Summary Table

| Folder | Task | Model architecture | FPGA implementation style | Numeric format |
|---|---|---|---|---|
| `bnn_accelerator/` | CAN vehicle classification | `169 -> 16 -> 3` Bayesian/BNN-style MLP | Hand-written Verilog RTL | `Q8.8` |
| `cnn_accelerator/` | GTSRB traffic-sign recognition | `Conv(3->16) -> Pool -> Conv(16->32) -> Pool -> FC(2048->128) -> FC(128->43)` | Vitis HLS C++ + PS/PL co-design | `ap_fixed<16,6>` / `Q6.10` |
| `svm_accelerator/` | Highway lane-change prediction | Linear SVM on 10 engineered features | Hand-written Verilog RTL | `Q8.8` |
| `siren_mlp/` | Ambulance vs firetruck siren classification | `41 -> 4 -> 2` MLP | Vitis HLS C++ + Vivado | `Q4.12` |

---

## 1. BNN Accelerator

### Folder

`bnn_accelerator/`

### Model purpose

This accelerator is intended for **CAN-based vehicle classification**. The hardware classifier consumes an engineered CAN feature vector and predicts one of three vehicle classes.

### Model architecture

The implemented model is a compact MLP:

```text
Input(169)
 -> Linear(169 -> 16)
 -> ReLU
 -> Linear(16 -> 3)
 -> argmax
```

Classes encoded in the hardware:

- `0 = OpelAstra`
- `1 = Prototype`
- `2 = RenaultClio`

The 169-element input vector is built from CAN-oriented engineered features such as ID histograms, payload statistics, nibble-level counts, and summary statistics. The exact preprocessing happens before the FPGA sees the data.

### FPGA implementation

This accelerator is implemented as **direct Verilog RTL**, not HLS.

Key design choices:

- Weights are compiled into the bitstream through `bnn_can_weights.vh`
- The model uses **Q8.8 fixed-point** encoding
- Inputs are sent as `169` 32-bit AXI-stream words, each carrying one quantized feature
- Output is a single 32-bit word containing the predicted class index
- The design uses on-chip memories for parameters, so there is no runtime DDR weight fetch

The compute structure is a straightforward two-layer dense network datapath:

1. receive and buffer all 169 features
2. compute 16 hidden activations with MAC operations
3. apply bias and ReLU
4. compute the 3 output logits
5. perform argmax
6. stream the class result back

### Hardware integration details

- Platform: `PYNQ-Z2` / `xc7z020clg400-1`
- Transfer size in: `169 x uint32 = 676 B`
- Transfer size out: `1 x uint32 = 4 B`
- Vivado integration uses a wrapper pattern: `bnn_wrapper.v` as the Verilog module-reference top, with the actual SystemVerilog implementation merged into `bnn_merged.v`

That wrapper exists to avoid Vivado’s module-reference restriction around SystemVerilog tops.

### Important note

This folder still has one ambiguity: the local `benchmark_web.py` benchmarks a software BNN pothole detector, while the FPGA RTL path in the Vivado flow is the CAN vehicle classifier described above. For accelerator documentation, the hardware implementation should be understood as the **169 -> 16 -> 3 CAN classifier**.

---

## 2. CNN Accelerator

### Folder

`cnn_accelerator/`

### Model purpose

This accelerator targets **traffic sign recognition** using the **GTSRB 43-class dataset**.

### Model architecture

The CNN used in the broader project flow is a compact RGB image classifier:

```text
Input: 3 x 32 x 32 RGB image
 -> Conv2d(3 -> 16, kernel=3x3, padding=1)
 -> ReLU
 -> MaxPool2d(2x2)
 -> Conv2d(16 -> 32, kernel=3x3, padding=1)
 -> ReLU
 -> MaxPool2d(2x2)
 -> Flatten
 -> Linear(32*8*8 -> 128)
 -> ReLU
 -> Linear(128 -> 43)
```

Equivalent dense input to the last layer:

- flattened feature dimension after the convolution backbone = `32 * 8 * 8 = 2048`
- hidden dense layer width = `128`
- output classes = `43`

### FPGA implementation

Unlike the BNN and SVM blocks, the CNN path is implemented as a **hardware/software co-design** built around **Vitis HLS C++** and AXI DMA.

Key design choices:

- The software training path uses the `SimpleCNN` model trained on GTSRB traffic-sign images resized to `32 x 32`
- The deployed PYNQ flow offloads the spatial backbone to the PL: `Conv1 -> Pool1 -> Conv2 -> Pool2`
- The ARM side keeps the dense classifier head: `Linear(2048 -> 128) -> Linear(128 -> 43)`
- The FPGA-facing path is streamed through AXI DMA, with the image tensor sent to the accelerator and pooled features returned to software
- The HLS design is optimized with loop pipelining and loop unrolling in the convolution and pooling nests

The HLS logs show complete or aggressive unrolling in key loops, including:

- `CONV1_K_R`, `CONV1_K_C`
- `CONV2_CH_IN`, `CONV2_K_R`, `CONV2_K_C`

This indicates the design is optimized for throughput by replicating arithmetic where possible.

### Dataflow and interface

The overall FPGA design follows the standard PS/PL split:

- a normalized `3 x 32 x 32` RGB image is prepared on the ARM side and sent over DMA
- the PL executes the convolution and max-pooling backbone
- the accelerator returns a `32 x 8 x 8` pooled feature tensor, which is `2048` values after flattening
- the PS performs the dense layers and final argmax over the 43 traffic-sign classes

### Practical interpretation

Architecturally, this is the most spatially structured accelerator in the set:

- local receptive fields
- shared convolution weights
- pooling-based downsampling
- a dense classifier head that maps backbone features into 43 road-sign categories

Compared with the MLP and SVM accelerators, the CNN trades a simple control flow for much richer nested-loop datapaths and far more reuse opportunities in hardware.

---

## 3. SVM Accelerator

### Folder

`svm_accelerator/`

### Model purpose

This accelerator implements a **linear SVM for lane-change prediction** using NGSIM-style driving features.

### Model architecture

This is not a neural network. The model is a single linear decision function operating on `10` engineered features:

```text
score = w0*x0 + w1*x1 + ... + w9*x9 + b
class = 0 or 1 based on the sign / threshold of score
```

Output classes in the software path are:

- `keep_lane`
- `change_lane`

The scaler is folded into the exported FPGA weights, so the hardware consumes the already-expected 10-feature form.

### FPGA implementation

This accelerator is a **Verilog RTL MAC engine**.

Key design choices:

- Numeric format: `Q8.8`
- Parameters are generated into `svm_weights.vh`
- The folded bias and 10 coefficients are hardcoded into the hardware
- The datapath is effectively a fixed-length dot product followed by a threshold decision

Because the model is linear, the hardware is much simpler than the MLP/CNN designs:

- buffer 10 input features
- multiply by 10 constant weights
- accumulate into a wider fixed-point accumulator
- add bias
- convert sign/score to class output

### Hardware interface

- Input transfer: exactly `10` features
- Host code in the broader project allocates `10` input words and `1` output word
- Transport is AXI DMA + AXI-Stream on PYNQ-Z2

This makes the SVM the lowest-complexity classifier in the project from a hardware perspective: no activation functions, no hidden state beyond the MAC accumulator, and no multi-stage network pipeline.

### Practical interpretation

If the siren MLP is the cleanest end-to-end HLS example, the SVM is the cleanest example of a **minimal RTL classifier accelerator**.

---

## 4. Siren MLP Accelerator

### Folder

`siren_mlp/`

### Model purpose

This accelerator classifies siren audio into two categories:

- `ambulance`
- `firetruck`

It is the smallest and most self-contained neural accelerator in the project.

### Model architecture

The network is a small two-layer MLP:

```text
Input(41)
 -> Linear(41 -> 4)
 -> ReLU
 -> Linear(4 -> 2)
 -> argmax
```

Total parameter count:

- `178`

The 41 input features come from a hand-engineered audio front-end:

- `32` spectral statistics from 8 frequency bands
- `5` waveform statistics
- `4` band-energy features

Before inference, the feature vector is standardized with the mean/std values stored in the training checkpoint.

### FPGA implementation

This design is implemented in **Vitis HLS C++**.

Key design choices:

- Numeric type: `ap_fixed<16,4>` which is `Q4.12`
- Weights are generated from `best_model.pt` into `mlp_weights_data.h`
- Because the model is tiny, all parameters fit comfortably in LUTRAM/on-chip memory
- Interface protocol is streaming only: `ap_ctrl_none`

The datapath is a textbook dense-network pipeline:

1. read 41 quantized features from AXI-Stream
2. compute 4 hidden activations
3. apply ReLU
4. compute 2 logits
5. emit the argmax class

### DMA and transport behavior

- Input transfer: `41 x uint32 = 164 B`
- Output transfer: `1 x uint32 = 4 B`
- The quantized value is packed into the low 16 bits of each 32-bit stream word
- Output is a single class index with TLAST asserted

### Why this design is important

This accelerator is the clearest example in the repo of how a trained PyTorch model is turned into a deployable FPGA classifier:

- checkpoint-driven weight export
- HLS C++ kernel
- Vivado block design
- DMA-based PYNQ inference path

Architecturally, it is also the easiest neural model to reason about because the entire compute graph is just two dense layers and one ReLU stage.

---

## Implementation Comparison

### Neural MLP-style accelerators

- `bnn_accelerator/`: `169 -> 16 -> 3`, RTL, Q8.8
- `siren_mlp/`: `41 -> 4 -> 2`, HLS, Q4.12

Both are dense classifiers, but the implementation style is different:

- BNN is direct RTL with hand-managed control/state
- Siren MLP is HLS-generated RTL from a compact C++ kernel

### Spatial accelerator

- `cnn_accelerator/`: convolutional backbone for `3x32x32` RGB traffic-sign input, with a dense classifier head on the PS side

This is the only model here that uses spatial reuse and shared kernels rather than pure dense MAC layers.

### Linear classifier accelerator

- `svm_accelerator/`: one MAC chain and threshold decision on 10 features

This is the simplest datapath in the project.

---

## Hardware Design Patterns Used Across the Project

Despite the models being different, the implementations reuse a small set of FPGA design ideas:

- fixed-point quantization instead of floating-point compute
- hardcoded weights stored on chip
- AXI DMA for host-to-accelerator streaming
- AXI-Stream for inference payloads
- PYNQ-side Python/Jupyter control on the ARM processor

The main differences are in how much arithmetic and control each model needs:

- SVM: one linear decision boundary
- Siren MLP: two dense layers
- BNN CAN classifier: larger dense network in RTL
- CNN: nested convolution/pooling structure with more aggressive loop optimization

---

## Notes and Limits

- The BNN folder still mixes a hardware CAN-classification path with a separate software pothole benchmark script.
- The CNN accelerator folder is the deliverable-facing location, but the actual model and HLS source live under `CNN/`.
- The SVM hardware is clearly present, but its build flow is less centralized than the siren MLP or CNN flow.

Those issues affect workflow, but the model and hardware descriptions above reflect the implemented accelerator designs themselves.
