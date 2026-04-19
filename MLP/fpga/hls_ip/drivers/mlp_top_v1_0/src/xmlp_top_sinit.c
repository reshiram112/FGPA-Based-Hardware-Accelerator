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
#include "xmlp_top.h"

extern XMlp_top_Config XMlp_top_ConfigTable[];

#ifdef SDT
XMlp_top_Config *XMlp_top_LookupConfig(UINTPTR BaseAddress) {
	XMlp_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XMlp_top_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XMlp_top_ConfigTable[Index].Ctrl_BaseAddress == BaseAddress) {
			ConfigPtr = &XMlp_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMlp_top_Initialize(XMlp_top *InstancePtr, UINTPTR BaseAddress) {
	XMlp_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMlp_top_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMlp_top_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XMlp_top_Config *XMlp_top_LookupConfig(u16 DeviceId) {
	XMlp_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMLP_TOP_NUM_INSTANCES; Index++) {
		if (XMlp_top_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMlp_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMlp_top_Initialize(XMlp_top *InstancePtr, u16 DeviceId) {
	XMlp_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMlp_top_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMlp_top_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

