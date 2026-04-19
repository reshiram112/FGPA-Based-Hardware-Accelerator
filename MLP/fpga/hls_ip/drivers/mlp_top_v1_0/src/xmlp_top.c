// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xmlp_top.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMlp_top_CfgInitialize(XMlp_top *InstancePtr, XMlp_top_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ctrl_BaseAddress = ConfigPtr->Ctrl_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMlp_top_Start(XMlp_top *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_AP_CTRL) & 0x80;
    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMlp_top_IsDone(XMlp_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMlp_top_IsIdle(XMlp_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMlp_top_IsReady(XMlp_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMlp_top_EnableAutoRestart(XMlp_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_AP_CTRL, 0x80);
}

void XMlp_top_DisableAutoRestart(XMlp_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_AP_CTRL, 0);
}

void XMlp_top_Set_w1(XMlp_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W1_DATA, (u32)(Data));
    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W1_DATA + 4, (u32)(Data >> 32));
}

u64 XMlp_top_Get_w1(XMlp_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W1_DATA);
    Data += (u64)XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W1_DATA + 4) << 32;
    return Data;
}

void XMlp_top_Set_b1(XMlp_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B1_DATA, (u32)(Data));
    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B1_DATA + 4, (u32)(Data >> 32));
}

u64 XMlp_top_Get_b1(XMlp_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B1_DATA);
    Data += (u64)XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B1_DATA + 4) << 32;
    return Data;
}

void XMlp_top_Set_w2(XMlp_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W2_DATA, (u32)(Data));
    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W2_DATA + 4, (u32)(Data >> 32));
}

u64 XMlp_top_Get_w2(XMlp_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W2_DATA);
    Data += (u64)XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W2_DATA + 4) << 32;
    return Data;
}

void XMlp_top_Set_b2(XMlp_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B2_DATA, (u32)(Data));
    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B2_DATA + 4, (u32)(Data >> 32));
}

u64 XMlp_top_Get_b2(XMlp_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B2_DATA);
    Data += (u64)XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B2_DATA + 4) << 32;
    return Data;
}

void XMlp_top_Set_w3(XMlp_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W3_DATA, (u32)(Data));
    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W3_DATA + 4, (u32)(Data >> 32));
}

u64 XMlp_top_Get_w3(XMlp_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W3_DATA);
    Data += (u64)XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W3_DATA + 4) << 32;
    return Data;
}

void XMlp_top_Set_b3(XMlp_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B3_DATA, (u32)(Data));
    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B3_DATA + 4, (u32)(Data >> 32));
}

u64 XMlp_top_Get_b3(XMlp_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B3_DATA);
    Data += (u64)XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B3_DATA + 4) << 32;
    return Data;
}

void XMlp_top_Set_w4(XMlp_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W4_DATA, (u32)(Data));
    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W4_DATA + 4, (u32)(Data >> 32));
}

u64 XMlp_top_Get_w4(XMlp_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W4_DATA);
    Data += (u64)XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_W4_DATA + 4) << 32;
    return Data;
}

void XMlp_top_Set_b4(XMlp_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B4_DATA, (u32)(Data));
    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B4_DATA + 4, (u32)(Data >> 32));
}

u64 XMlp_top_Get_b4(XMlp_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B4_DATA);
    Data += (u64)XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_B4_DATA + 4) << 32;
    return Data;
}

void XMlp_top_InterruptGlobalEnable(XMlp_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_GIE, 1);
}

void XMlp_top_InterruptGlobalDisable(XMlp_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_GIE, 0);
}

void XMlp_top_InterruptEnable(XMlp_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_IER);
    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_IER, Register | Mask);
}

void XMlp_top_InterruptDisable(XMlp_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_IER);
    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_IER, Register & (~Mask));
}

void XMlp_top_InterruptClear(XMlp_top *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMlp_top_WriteReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_ISR, Mask);
}

u32 XMlp_top_InterruptGetEnabled(XMlp_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_IER);
}

u32 XMlp_top_InterruptGetStatus(XMlp_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMlp_top_ReadReg(InstancePtr->Ctrl_BaseAddress, XMLP_TOP_CTRL_ADDR_ISR);
}

