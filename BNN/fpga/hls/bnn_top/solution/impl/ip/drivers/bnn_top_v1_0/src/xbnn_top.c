// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xbnn_top.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XBnn_top_CfgInitialize(XBnn_top *InstancePtr, XBnn_top_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ctrl_BaseAddress = ConfigPtr->Ctrl_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XBnn_top_Start(XBnn_top *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_AP_CTRL) & 0x80;
    XBnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XBnn_top_IsDone(XBnn_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XBnn_top_IsIdle(XBnn_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XBnn_top_IsReady(XBnn_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XBnn_top_EnableAutoRestart(XBnn_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_AP_CTRL, 0x80);
}

void XBnn_top_DisableAutoRestart(XBnn_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_AP_CTRL, 0);
}

void XBnn_top_InterruptGlobalEnable(XBnn_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_GIE, 1);
}

void XBnn_top_InterruptGlobalDisable(XBnn_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_GIE, 0);
}

void XBnn_top_InterruptEnable(XBnn_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_IER);
    XBnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_IER, Register | Mask);
}

void XBnn_top_InterruptDisable(XBnn_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_IER);
    XBnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_IER, Register & (~Mask));
}

void XBnn_top_InterruptClear(XBnn_top *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBnn_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_ISR, Mask);
}

u32 XBnn_top_InterruptGetEnabled(XBnn_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_IER);
}

u32 XBnn_top_InterruptGetStatus(XBnn_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBnn_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XBNN_TOP_CTRL_ADDR_ISR);
}

