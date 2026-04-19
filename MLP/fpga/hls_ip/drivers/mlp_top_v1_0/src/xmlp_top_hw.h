// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// ctrl
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of w1
//        bit 31~0 - w1[31:0] (Read/Write)
// 0x14 : Data signal of w1
//        bit 31~0 - w1[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of b1
//        bit 31~0 - b1[31:0] (Read/Write)
// 0x20 : Data signal of b1
//        bit 31~0 - b1[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of w2
//        bit 31~0 - w2[31:0] (Read/Write)
// 0x2c : Data signal of w2
//        bit 31~0 - w2[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of b2
//        bit 31~0 - b2[31:0] (Read/Write)
// 0x38 : Data signal of b2
//        bit 31~0 - b2[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of w3
//        bit 31~0 - w3[31:0] (Read/Write)
// 0x44 : Data signal of w3
//        bit 31~0 - w3[63:32] (Read/Write)
// 0x48 : reserved
// 0x4c : Data signal of b3
//        bit 31~0 - b3[31:0] (Read/Write)
// 0x50 : Data signal of b3
//        bit 31~0 - b3[63:32] (Read/Write)
// 0x54 : reserved
// 0x58 : Data signal of w4
//        bit 31~0 - w4[31:0] (Read/Write)
// 0x5c : Data signal of w4
//        bit 31~0 - w4[63:32] (Read/Write)
// 0x60 : reserved
// 0x64 : Data signal of b4
//        bit 31~0 - b4[31:0] (Read/Write)
// 0x68 : Data signal of b4
//        bit 31~0 - b4[63:32] (Read/Write)
// 0x6c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XMLP_TOP_CTRL_ADDR_AP_CTRL 0x00
#define XMLP_TOP_CTRL_ADDR_GIE     0x04
#define XMLP_TOP_CTRL_ADDR_IER     0x08
#define XMLP_TOP_CTRL_ADDR_ISR     0x0c
#define XMLP_TOP_CTRL_ADDR_W1_DATA 0x10
#define XMLP_TOP_CTRL_BITS_W1_DATA 64
#define XMLP_TOP_CTRL_ADDR_B1_DATA 0x1c
#define XMLP_TOP_CTRL_BITS_B1_DATA 64
#define XMLP_TOP_CTRL_ADDR_W2_DATA 0x28
#define XMLP_TOP_CTRL_BITS_W2_DATA 64
#define XMLP_TOP_CTRL_ADDR_B2_DATA 0x34
#define XMLP_TOP_CTRL_BITS_B2_DATA 64
#define XMLP_TOP_CTRL_ADDR_W3_DATA 0x40
#define XMLP_TOP_CTRL_BITS_W3_DATA 64
#define XMLP_TOP_CTRL_ADDR_B3_DATA 0x4c
#define XMLP_TOP_CTRL_BITS_B3_DATA 64
#define XMLP_TOP_CTRL_ADDR_W4_DATA 0x58
#define XMLP_TOP_CTRL_BITS_W4_DATA 64
#define XMLP_TOP_CTRL_ADDR_B4_DATA 0x64
#define XMLP_TOP_CTRL_BITS_B4_DATA 64

