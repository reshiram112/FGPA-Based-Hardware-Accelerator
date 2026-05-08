set moduleName bnn_top_Pipeline_WR_OUT
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
set C_modelName {bnn_top_Pipeline_WR_OUT}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ act4_1_load int 16 regular  }
	{ act4_load int 16 regular  }
	{ m_axis_output_V_data_V int 32 regular {axi_s 1 volatile  { m_axis_output Data } }  }
	{ m_axis_output_V_keep_V int 4 regular {axi_s 1 volatile  { m_axis_output Keep } }  }
	{ m_axis_output_V_strb_V int 4 regular {axi_s 1 volatile  { m_axis_output Strb } }  }
	{ m_axis_output_V_user_V int 1 regular {axi_s 1 volatile  { m_axis_output User } }  }
	{ m_axis_output_V_last_V int 1 regular {axi_s 1 volatile  { m_axis_output Last } }  }
	{ m_axis_output_V_id_V int 1 regular {axi_s 1 volatile  { m_axis_output ID } }  }
	{ m_axis_output_V_dest_V int 1 regular {axi_s 1 volatile  { m_axis_output Dest } }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "act4_1_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "act4_load", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_output_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_output_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_output_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_output_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_output_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_output_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_output_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axis_output_TREADY sc_in sc_logic 1 outacc 2 } 
	{ act4_1_load sc_in sc_lv 16 signal 0 } 
	{ act4_load sc_in sc_lv 16 signal 1 } 
	{ m_axis_output_TDATA sc_out sc_lv 32 signal 2 } 
	{ m_axis_output_TVALID sc_out sc_logic 1 outvld 8 } 
	{ m_axis_output_TKEEP sc_out sc_lv 4 signal 3 } 
	{ m_axis_output_TSTRB sc_out sc_lv 4 signal 4 } 
	{ m_axis_output_TUSER sc_out sc_lv 1 signal 5 } 
	{ m_axis_output_TLAST sc_out sc_lv 1 signal 6 } 
	{ m_axis_output_TID sc_out sc_lv 1 signal 7 } 
	{ m_axis_output_TDEST sc_out sc_lv 1 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axis_output_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_output_V_data_V", "role": "default" }} , 
 	{ "name": "act4_1_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "act4_1_load", "role": "default" }} , 
 	{ "name": "act4_load", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "act4_load", "role": "default" }} , 
 	{ "name": "m_axis_output_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_axis_output_V_data_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_output_V_dest_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_axis_output_V_keep_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_axis_output_V_strb_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_output_V_user_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_output_V_last_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_output_V_id_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_output_V_dest_V", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	bnn_top_Pipeline_WR_OUT {
		act4_1_load {Type I LastRead 0 FirstWrite -1}
		act4_load {Type I LastRead 0 FirstWrite -1}
		m_axis_output_V_data_V {Type O LastRead -1 FirstWrite 1}
		m_axis_output_V_keep_V {Type O LastRead -1 FirstWrite 1}
		m_axis_output_V_strb_V {Type O LastRead -1 FirstWrite 1}
		m_axis_output_V_user_V {Type O LastRead -1 FirstWrite 1}
		m_axis_output_V_last_V {Type O LastRead -1 FirstWrite 1}
		m_axis_output_V_id_V {Type O LastRead -1 FirstWrite 1}
		m_axis_output_V_dest_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "4"}
	, {"Name" : "Interval", "Min" : "4", "Max" : "4"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	act4_1_load { ap_none {  { act4_1_load in_data 0 16 } } }
	act4_load { ap_none {  { act4_load in_data 0 16 } } }
	m_axis_output_V_data_V { axis {  { m_axis_output_TREADY out_acc 0 1 }  { m_axis_output_TDATA out_data 1 32 } } }
	m_axis_output_V_keep_V { axis {  { m_axis_output_TKEEP out_data 1 4 } } }
	m_axis_output_V_strb_V { axis {  { m_axis_output_TSTRB out_data 1 4 } } }
	m_axis_output_V_user_V { axis {  { m_axis_output_TUSER out_data 1 1 } } }
	m_axis_output_V_last_V { axis {  { m_axis_output_TLAST out_data 1 1 } } }
	m_axis_output_V_id_V { axis {  { m_axis_output_TID out_data 1 1 } } }
	m_axis_output_V_dest_V { axis {  { m_axis_output_TVALID out_vld 1 1 }  { m_axis_output_TDEST out_data 1 1 } } }
}
