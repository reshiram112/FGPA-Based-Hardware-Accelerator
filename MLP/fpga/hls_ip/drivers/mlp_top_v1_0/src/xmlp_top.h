// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XMLP_TOP_H
#define XMLP_TOP_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xmlp_top_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Ctrl_BaseAddress;
} XMlp_top_Config;
#endif

typedef struct {
    u64 Ctrl_BaseAddress;
    u32 IsReady;
} XMlp_top;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMlp_top_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMlp_top_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMlp_top_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMlp_top_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XMlp_top_Initialize(XMlp_top *InstancePtr, UINTPTR BaseAddress);
XMlp_top_Config* XMlp_top_LookupConfig(UINTPTR BaseAddress);
#else
int XMlp_top_Initialize(XMlp_top *InstancePtr, u16 DeviceId);
XMlp_top_Config* XMlp_top_LookupConfig(u16 DeviceId);
#endif
int XMlp_top_CfgInitialize(XMlp_top *InstancePtr, XMlp_top_Config *ConfigPtr);
#else
int XMlp_top_Initialize(XMlp_top *InstancePtr, const char* InstanceName);
int XMlp_top_Release(XMlp_top *InstancePtr);
#endif

void XMlp_top_Start(XMlp_top *InstancePtr);
u32 XMlp_top_IsDone(XMlp_top *InstancePtr);
u32 XMlp_top_IsIdle(XMlp_top *InstancePtr);
u32 XMlp_top_IsReady(XMlp_top *InstancePtr);
void XMlp_top_EnableAutoRestart(XMlp_top *InstancePtr);
void XMlp_top_DisableAutoRestart(XMlp_top *InstancePtr);

void XMlp_top_Set_w1(XMlp_top *InstancePtr, u64 Data);
u64 XMlp_top_Get_w1(XMlp_top *InstancePtr);
void XMlp_top_Set_b1(XMlp_top *InstancePtr, u64 Data);
u64 XMlp_top_Get_b1(XMlp_top *InstancePtr);
void XMlp_top_Set_w2(XMlp_top *InstancePtr, u64 Data);
u64 XMlp_top_Get_w2(XMlp_top *InstancePtr);
void XMlp_top_Set_b2(XMlp_top *InstancePtr, u64 Data);
u64 XMlp_top_Get_b2(XMlp_top *InstancePtr);
void XMlp_top_Set_w3(XMlp_top *InstancePtr, u64 Data);
u64 XMlp_top_Get_w3(XMlp_top *InstancePtr);
void XMlp_top_Set_b3(XMlp_top *InstancePtr, u64 Data);
u64 XMlp_top_Get_b3(XMlp_top *InstancePtr);
void XMlp_top_Set_w4(XMlp_top *InstancePtr, u64 Data);
u64 XMlp_top_Get_w4(XMlp_top *InstancePtr);
void XMlp_top_Set_b4(XMlp_top *InstancePtr, u64 Data);
u64 XMlp_top_Get_b4(XMlp_top *InstancePtr);

void XMlp_top_InterruptGlobalEnable(XMlp_top *InstancePtr);
void XMlp_top_InterruptGlobalDisable(XMlp_top *InstancePtr);
void XMlp_top_InterruptEnable(XMlp_top *InstancePtr, u32 Mask);
void XMlp_top_InterruptDisable(XMlp_top *InstancePtr, u32 Mask);
void XMlp_top_InterruptClear(XMlp_top *InstancePtr, u32 Mask);
u32 XMlp_top_InterruptGetEnabled(XMlp_top *InstancePtr);
u32 XMlp_top_InterruptGetStatus(XMlp_top *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
