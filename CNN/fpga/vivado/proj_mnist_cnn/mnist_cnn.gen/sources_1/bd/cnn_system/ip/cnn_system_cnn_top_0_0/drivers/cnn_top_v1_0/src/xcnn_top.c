// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xcnn_top.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XCnn_top_CfgInitialize(XCnn_top *InstancePtr, XCnn_top_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->Ctrl_BaseAddress = ConfigPtr->Ctrl_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XCnn_top_Start(XCnn_top *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_AP_CTRL) & 0x80;
    XCnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XCnn_top_IsDone(XCnn_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XCnn_top_IsIdle(XCnn_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XCnn_top_IsReady(XCnn_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XCnn_top_EnableAutoRestart(XCnn_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_AP_CTRL, 0x80);
}

void XCnn_top_DisableAutoRestart(XCnn_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_AP_CTRL, 0);
}

void XCnn_top_Set_m_axi_w_conv1(XCnn_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCnn_top_WriteReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_W_CONV1_DATA, (u32)(Data));
    XCnn_top_WriteReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_W_CONV1_DATA + 4, (u32)(Data >> 32));
}

u64 XCnn_top_Get_m_axi_w_conv1(XCnn_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCnn_top_ReadReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_W_CONV1_DATA);
    Data += (u64)XCnn_top_ReadReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_W_CONV1_DATA + 4) << 32;
    return Data;
}

void XCnn_top_Set_m_axi_b_conv1(XCnn_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCnn_top_WriteReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_B_CONV1_DATA, (u32)(Data));
    XCnn_top_WriteReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_B_CONV1_DATA + 4, (u32)(Data >> 32));
}

u64 XCnn_top_Get_m_axi_b_conv1(XCnn_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCnn_top_ReadReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_B_CONV1_DATA);
    Data += (u64)XCnn_top_ReadReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_B_CONV1_DATA + 4) << 32;
    return Data;
}

void XCnn_top_Set_m_axi_w_conv2(XCnn_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCnn_top_WriteReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_W_CONV2_DATA, (u32)(Data));
    XCnn_top_WriteReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_W_CONV2_DATA + 4, (u32)(Data >> 32));
}

u64 XCnn_top_Get_m_axi_w_conv2(XCnn_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCnn_top_ReadReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_W_CONV2_DATA);
    Data += (u64)XCnn_top_ReadReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_W_CONV2_DATA + 4) << 32;
    return Data;
}

void XCnn_top_Set_m_axi_b_conv2(XCnn_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCnn_top_WriteReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_B_CONV2_DATA, (u32)(Data));
    XCnn_top_WriteReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_B_CONV2_DATA + 4, (u32)(Data >> 32));
}

u64 XCnn_top_Get_m_axi_b_conv2(XCnn_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCnn_top_ReadReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_B_CONV2_DATA);
    Data += (u64)XCnn_top_ReadReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_B_CONV2_DATA + 4) << 32;
    return Data;
}

void XCnn_top_Set_m_axi_w_fc(XCnn_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCnn_top_WriteReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_W_FC_DATA, (u32)(Data));
    XCnn_top_WriteReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_W_FC_DATA + 4, (u32)(Data >> 32));
}

u64 XCnn_top_Get_m_axi_w_fc(XCnn_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCnn_top_ReadReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_W_FC_DATA);
    Data += (u64)XCnn_top_ReadReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_W_FC_DATA + 4) << 32;
    return Data;
}

void XCnn_top_Set_m_axi_b_fc(XCnn_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCnn_top_WriteReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_B_FC_DATA, (u32)(Data));
    XCnn_top_WriteReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_B_FC_DATA + 4, (u32)(Data >> 32));
}

u64 XCnn_top_Get_m_axi_b_fc(XCnn_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCnn_top_ReadReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_B_FC_DATA);
    Data += (u64)XCnn_top_ReadReg(InstancePtr->Control_BaseAddress, XCNN_TOP_CONTROL_ADDR_M_AXI_B_FC_DATA + 4) << 32;
    return Data;
}

void XCnn_top_InterruptGlobalEnable(XCnn_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_GIE, 1);
}

void XCnn_top_InterruptGlobalDisable(XCnn_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_GIE, 0);
}

void XCnn_top_InterruptEnable(XCnn_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_IER);
    XCnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_IER, Register | Mask);
}

void XCnn_top_InterruptDisable(XCnn_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_IER);
    XCnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_IER, Register & (~Mask));
}

void XCnn_top_InterruptClear(XCnn_top *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_ISR, Mask);
}

u32 XCnn_top_InterruptGetEnabled(XCnn_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_IER);
}

u32 XCnn_top_InterruptGetStatus(XCnn_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XCNN_TOP_CTRL_ADDR_ISR);
}

