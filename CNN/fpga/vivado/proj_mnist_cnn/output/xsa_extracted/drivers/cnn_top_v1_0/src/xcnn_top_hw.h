// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of m_axi_w_conv1
//        bit 31~0 - m_axi_w_conv1[31:0] (Read/Write)
// 0x14 : Data signal of m_axi_w_conv1
//        bit 31~0 - m_axi_w_conv1[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of m_axi_b_conv1
//        bit 31~0 - m_axi_b_conv1[31:0] (Read/Write)
// 0x20 : Data signal of m_axi_b_conv1
//        bit 31~0 - m_axi_b_conv1[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of m_axi_w_conv2
//        bit 31~0 - m_axi_w_conv2[31:0] (Read/Write)
// 0x2c : Data signal of m_axi_w_conv2
//        bit 31~0 - m_axi_w_conv2[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of m_axi_b_conv2
//        bit 31~0 - m_axi_b_conv2[31:0] (Read/Write)
// 0x38 : Data signal of m_axi_b_conv2
//        bit 31~0 - m_axi_b_conv2[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of m_axi_w_fc
//        bit 31~0 - m_axi_w_fc[31:0] (Read/Write)
// 0x44 : Data signal of m_axi_w_fc
//        bit 31~0 - m_axi_w_fc[63:32] (Read/Write)
// 0x48 : reserved
// 0x4c : Data signal of m_axi_b_fc
//        bit 31~0 - m_axi_b_fc[31:0] (Read/Write)
// 0x50 : Data signal of m_axi_b_fc
//        bit 31~0 - m_axi_b_fc[63:32] (Read/Write)
// 0x54 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XCNN_TOP_CONTROL_ADDR_M_AXI_W_CONV1_DATA 0x10
#define XCNN_TOP_CONTROL_BITS_M_AXI_W_CONV1_DATA 64
#define XCNN_TOP_CONTROL_ADDR_M_AXI_B_CONV1_DATA 0x1c
#define XCNN_TOP_CONTROL_BITS_M_AXI_B_CONV1_DATA 64
#define XCNN_TOP_CONTROL_ADDR_M_AXI_W_CONV2_DATA 0x28
#define XCNN_TOP_CONTROL_BITS_M_AXI_W_CONV2_DATA 64
#define XCNN_TOP_CONTROL_ADDR_M_AXI_B_CONV2_DATA 0x34
#define XCNN_TOP_CONTROL_BITS_M_AXI_B_CONV2_DATA 64
#define XCNN_TOP_CONTROL_ADDR_M_AXI_W_FC_DATA    0x40
#define XCNN_TOP_CONTROL_BITS_M_AXI_W_FC_DATA    64
#define XCNN_TOP_CONTROL_ADDR_M_AXI_B_FC_DATA    0x4c
#define XCNN_TOP_CONTROL_BITS_M_AXI_B_FC_DATA    64

// ctrl
// 0x0 : Control signals
//       bit 0  - ap_start (Read/Write/COH)
//       bit 1  - ap_done (Read/COR)
//       bit 2  - ap_idle (Read)
//       bit 3  - ap_ready (Read/COR)
//       bit 7  - auto_restart (Read/Write)
//       bit 9  - interrupt (Read)
//       others - reserved
// 0x4 : Global Interrupt Enable Register
//       bit 0  - Global Interrupt Enable (Read/Write)
//       others - reserved
// 0x8 : IP Interrupt Enable Register (Read/Write)
//       bit 0 - enable ap_done interrupt (Read/Write)
//       bit 1 - enable ap_ready interrupt (Read/Write)
//       others - reserved
// 0xc : IP Interrupt Status Register (Read/TOW)
//       bit 0 - ap_done (Read/TOW)
//       bit 1 - ap_ready (Read/TOW)
//       others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XCNN_TOP_CTRL_ADDR_AP_CTRL 0x0
#define XCNN_TOP_CTRL_ADDR_GIE     0x4
#define XCNN_TOP_CTRL_ADDR_IER     0x8
#define XCNN_TOP_CTRL_ADDR_ISR     0xc

