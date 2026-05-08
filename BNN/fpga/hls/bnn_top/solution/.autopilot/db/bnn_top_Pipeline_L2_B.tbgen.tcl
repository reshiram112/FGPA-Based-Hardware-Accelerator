set moduleName bnn_top_Pipeline_L2_B
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 13
set C_modelName {bnn_top_Pipeline_L2_B}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict act2 { MEM_WIDTH 16 MEM_SIZE 512 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ s_axis_input_V_data_V int 32 regular {axi_s 0 volatile  { s_axis_input Data } }  }
	{ s_axis_input_V_keep_V int 4 regular {axi_s 0 volatile  { s_axis_input Keep } }  }
	{ s_axis_input_V_strb_V int 4 regular {axi_s 0 volatile  { s_axis_input Strb } }  }
	{ s_axis_input_V_user_V int 1 regular {axi_s 0 volatile  { s_axis_input User } }  }
	{ s_axis_input_V_last_V int 1 regular {axi_s 0 volatile  { s_axis_input Last } }  }
	{ s_axis_input_V_id_V int 1 regular {axi_s 0 volatile  { s_axis_input ID } }  }
	{ s_axis_input_V_dest_V int 1 regular {axi_s 0 volatile  { s_axis_input Dest } }  }
	{ act2 int 16 regular {array 256 { 0 1 } 1 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_input_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_input_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_input_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_input_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_input_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_input_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_input_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "act2", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_input_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_input_TDATA sc_in sc_lv 32 signal 0 } 
	{ s_axis_input_TREADY sc_out sc_logic 1 inacc 6 } 
	{ s_axis_input_TKEEP sc_in sc_lv 4 signal 1 } 
	{ s_axis_input_TSTRB sc_in sc_lv 4 signal 2 } 
	{ s_axis_input_TUSER sc_in sc_lv 1 signal 3 } 
	{ s_axis_input_TLAST sc_in sc_lv 1 signal 4 } 
	{ s_axis_input_TID sc_in sc_lv 1 signal 5 } 
	{ s_axis_input_TDEST sc_in sc_lv 1 signal 6 } 
	{ act2_address0 sc_out sc_lv 8 signal 7 } 
	{ act2_ce0 sc_out sc_logic 1 signal 7 } 
	{ act2_we0 sc_out sc_logic 1 signal 7 } 
	{ act2_d0 sc_out sc_lv 16 signal 7 } 
	{ act2_address1 sc_out sc_lv 8 signal 7 } 
	{ act2_ce1 sc_out sc_logic 1 signal 7 } 
	{ act2_q1 sc_in sc_lv 16 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_input_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_input_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_axis_input_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_input_V_dest_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "s_axis_input_V_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "s_axis_input_V_strb_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_input_V_user_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_input_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_input_V_id_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_input_V_dest_V", "role": "default" }} , 
 	{ "name": "act2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "act2", "role": "address0" }} , 
 	{ "name": "act2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "act2", "role": "ce0" }} , 
 	{ "name": "act2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "act2", "role": "we0" }} , 
 	{ "name": "act2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "act2", "role": "d0" }} , 
 	{ "name": "act2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "act2", "role": "address1" }} , 
 	{ "name": "act2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "act2", "role": "ce1" }} , 
 	{ "name": "act2_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "act2", "role": "q1" }}  ]}

set ArgLastReadFirstWriteLatency {
	bnn_top_Pipeline_L2_B {
		s_axis_input_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_dest_V {Type I LastRead 1 FirstWrite -1}
		act2 {Type IO LastRead 0 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "259", "Max" : "259"}
	, {"Name" : "Interval", "Min" : "259", "Max" : "259"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_input_V_data_V { axis {  { s_axis_input_TVALID in_vld 0 1 }  { s_axis_input_TDATA in_data 0 32 } } }
	s_axis_input_V_keep_V { axis {  { s_axis_input_TKEEP in_data 0 4 } } }
	s_axis_input_V_strb_V { axis {  { s_axis_input_TSTRB in_data 0 4 } } }
	s_axis_input_V_user_V { axis {  { s_axis_input_TUSER in_data 0 1 } } }
	s_axis_input_V_last_V { axis {  { s_axis_input_TLAST in_data 0 1 } } }
	s_axis_input_V_id_V { axis {  { s_axis_input_TID in_data 0 1 } } }
	s_axis_input_V_dest_V { axis {  { s_axis_input_TREADY in_acc 1 1 }  { s_axis_input_TDEST in_data 0 1 } } }
	act2 { ap_memory {  { act2_address0 mem_address 1 8 }  { act2_ce0 mem_ce 1 1 }  { act2_we0 mem_we 1 1 }  { act2_d0 mem_din 1 16 }  { act2_address1 MemPortADDR2 1 8 }  { act2_ce1 MemPortCE2 1 1 }  { act2_q1 MemPortDOUT2 0 16 } } }
}
