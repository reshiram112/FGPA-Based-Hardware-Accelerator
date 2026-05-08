// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xbnn_top.h"

extern XBnn_top_Config XBnn_top_ConfigTable[];

#ifdef SDT
XBnn_top_Config *XBnn_top_LookupConfig(UINTPTR BaseAddress) {
	XBnn_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XBnn_top_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XBnn_top_ConfigTable[Index].Ctrl_BaseAddress == BaseAddress) {
			ConfigPtr = &XBnn_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XBnn_top_Initialize(XBnn_top *InstancePtr, UINTPTR BaseAddress) {
	XBnn_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XBnn_top_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XBnn_top_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XBnn_top_Config *XBnn_top_LookupConfig(u16 DeviceId) {
	XBnn_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XBNN_TOP_NUM_INSTANCES; Index++) {
		if (XBnn_top_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XBnn_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XBnn_top_Initialize(XBnn_top *InstancePtr, u16 DeviceId) {
	XBnn_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XBnn_top_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XBnn_top_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

