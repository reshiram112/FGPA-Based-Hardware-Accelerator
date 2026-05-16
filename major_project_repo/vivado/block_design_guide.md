# Vivado Block Design Guide

To deploy the autonomous multi-model system on the PYNQ-Z2 board, you need to create a block design in Vivado that connects the Processing System (ARM Cortex-A9) to your custom hardware accelerators (MLP Router, CNN, BNN, SVM) via AXI-Stream and DMA.

## Steps

1. **Create a New Project**:
   - Open Vivado.
   - Create a new RTL project.
   - Select the **PYNQ-Z2** board from the Boards tab.

2. **Add Custom IP**:
   - Go to `Tools > Create and Package New IP`.
   - Package the `cnn_accelerator.v`, `bnn_accelerator.v`, `svm_accelerator.v`, and `mlp_router.v` from the `../verilog` folder as AXI4-Stream IP blocks.

3. **Create Block Design**:
   - Click **Create Block Design**.
   - Add the **ZYNQ7 Processing System** IP. Run Block Automation.
   - Double-click the ZYNQ IP and enable **HP0, HP1, HP2, HP3** AXI Slave ports (High Performance) for high-speed memory access if needed, or stick to standard GP ports if bandwidth is low.
   - Add 4 **AXI Direct Memory Access (DMA)** IPs (one for each accelerator).
   - Disable Scatter Gather for all DMAs (keep it simple).

4. **Connect the System**:
   - Add your 4 custom IPs (MLP, CNN, BNN, SVM) to the design.
   - Connect the `M_AXIS_MM2S` (Memory Map to Stream) from each DMA to the `s_axis` (Slave Stream) of your corresponding custom IP.
   - Connect the `m_axis` (Master Stream) of your custom IP to the `S_AXIS_S2MM` (Stream to Memory Map) of the DMA.
   - Run **Connection Automation** to automatically connect all AXI-Lite control interfaces of the DMAs to the ZYNQ PS, and all clock/reset lines.

5. **Generate Bitstream**:
   - Validate the design (F6).
   - Create HDL Wrapper (Right-click block design in sources).
   - Run Synthesis, Implementation, and **Generate Bitstream**.

6. **Export**:
   - Go to `File > Export > Export Block Design` to get the `.tcl` or just grab the generated `.bit` and `.hwh` files from the implementation folder.
   - Rename them to `autonomous_system.bit` and `autonomous_system.hwh` and move them to the PYNQ board.
