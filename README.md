# FPGA-Based Hardware Accelerator for MNIST

This repository contains an end-to-end pipeline for designing, training, and deploying custom neural network hardware accelerators onto Xilinx Zynq-7000 series FPGAs (specifically the **PYNQ-Z2**). 

This project explores hardware acceleration of deep learning algorithms by offloading computationally expensive operations to the FPGA's Programmable Logic (PL) while the ARM Cortex-A9 Processing System (PS) manages data flow via Direct Memory Access (DMA).

## Architectures Implemented

We have implemented two completely different neural network architectures from scratch using Vitis HLS (C++ to RTL synthesis). Both models are trained in PyTorch and deployed completely in hardware.

### 1. Multilayer Perceptron (MLP)
- **Architecture**: 784 (Flattened 28x28 Image) $\rightarrow$ 512 (Dense) $\rightarrow$ ReLU $\rightarrow$ 128 (Dense) $\rightarrow$ ReLU $\rightarrow$ 10 (Output).
- **Quantization**: 16-bit fixed point (`int16`).
- **Characteristics**: Extremely high memory bandwidth requirement. The hardware utilizes large matrix multiplications and heavily unrolled loops.
- **Accuracy**: ~98.05% on MNIST test set.
- **Location**: [`MLP/`](MLP/) directory.

### 2. Convolutional Neural Network (CNN)
- **Architecture**: 
  - Conv2D (1 $\rightarrow$ 8 channels, 3x3 kernel) $\rightarrow$ ReLU $\rightarrow$ MaxPool2D (2x2)
  - Conv2D (8 $\rightarrow$ 16 channels, 3x3 kernel) $\rightarrow$ ReLU $\rightarrow$ MaxPool2D (2x2)
  - Flatten $\rightarrow$ Dense (10 Output)
- **Quantization**: 16-bit fixed point (`int16`).
- **Characteristics**: Highly parameter-efficient. The hardware leverages nested sliding-window computations (spatial loops) to share weights, allowing the entire model to be loaded dynamically into FPGA Block RAM (BRAM).
- **Accuracy**: ~98.24% on MNIST test set.
- **Location**: [`CNN/`](CNN/) directory.

## System Design (PS + PL Architecture)

The Vivado block design handles the integration of the Zynq Processing System (ARM) and the custom HLS Neural Network IP:
* **AXI4-Stream & DMA**: Images are streamed from DDR Memory to the Neural Network IP via an AXI DMA block. Predictions are streamed back out.
* **AXI4-Lite**: Used by the ARM processor to configure the hardware (AP_START signals) to begin the pipeline.
* **Hardcoded Weights (BRAM)**: Unlike dynamic architectures, the neural network weights are fundamentally baked directly into the C++ source code as `static const` arrays. During HLS synthesis, these are physically mapped directly into the FPGA's internal Block RAM (BRAM) logic cells, mimicking BNN-style zero-overhead weight access. This eliminates the need for external DDR High-Performance (HP) master ports and memory bottlenecks.

---

## Requirements

**Software:**
- Xilinx Vivado 2025.1
- Xilinx Vitis HLS 2025.1
- Python 3.8+ (PyTorch, NumPy)

**Hardware:**
- PYNQ-Z2 Development Board (xc7z020clg400-1)

---

## How to Run (End-to-End Pipeline)

Each network (MLP and CNN) has a nearly identical workflow. The steps below apply to both. Navigate to either the `MLP/` or `CNN/` folder.

### Step 1: Train Model & Export Weights
Train the PyTorch model, quantize the weights to 16-bit integers, and export them as `.npy` arrays.
```bash
python train_and_export.py
```
*This will generate `.npy` weight arrays in the `fpga/fpga_weights/` directory.*

### Step 2: High-Level Synthesis (C++ $\rightarrow$ RTL)
Convert the highly-optimized C++ hardware implementation into a Verilog IP block using Vitis HLS.
```bash
# From the MLP/ or CNN/ directory
vitis-run.bat --mode hls --tcl fpga/hls/run_hls.tcl
```
*This will automatically synthesize the `cnn_top` or `mlp_top` C++ code, analyze loop pipelining, and extract the IP to `fpga/hls_ip`.*

### Step 3: Vivado Block Design & Bitstream Generation
Use the automation script to instantly build the full Zynq PS + AXI DMA + Custom IP block design and compile the final hardware bitstream.
```bash
# Ensure Vivado is in your PATH
vivado -mode batch -source fpga/vivado/create_project.tcl
```
*This creates the Vivado project, connects all interfaces, and runs placement and routing to generate the `.bit` and `.xsa` hardware handoff files in `fpga/vivado/proj_.../output/`. This process takes 15-25 minutes.*

*(Optional) You can open the generated project in the Vivado GUI (`.xpr` file) to visually inspect the Zynq PS+PL architecture.*

### Step 4: Hardware Deployment (Interactive PYNQ Dashboard)
We have optimized deployment into a **Single-File Zero-Configuration** workflow. The hardware bitstream (`.bit`) and IP register maps (`.hwh`) are securely embedded directly inside the Jupyter Notebook as Base64 strings. Because the weights are hardcoded into the hardware itself, there is no weight loading required at runtime!

1. Boot your PYNQ-Z2 board and open its Jupyter Notebook server.
2. Upload **only** the single `fpga/pynq/mnist_inference.ipynb` (or `mnist_cnn_inference.ipynb`) script.
3. Run the Jupyter Notebook. It will automatically extract and flash the hardware bitstream.
4. An **interactive `ipywidgets` dashboard** will appear directly in the notebook output! 
5. Click the **Upload** button to supply any test image. The hardware will perform a warmup and execute a 1,000-inference benchmarking loop, giving you real-time metrics on System Latency, FPS Throughput, and FPGA Power Estimation.