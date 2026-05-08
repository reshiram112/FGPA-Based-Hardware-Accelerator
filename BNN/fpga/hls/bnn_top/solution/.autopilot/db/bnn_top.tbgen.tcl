set moduleName bnn_top
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
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
set C_modelName {bnn_top}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ s_axis_input_V_data_V int 32 regular {axi_s 0 volatile  { s_axis_input Data } }  }
	{ s_axis_input_V_keep_V int 4 regular {axi_s 0 volatile  { s_axis_input Keep } }  }
	{ s_axis_input_V_strb_V int 4 regular {axi_s 0 volatile  { s_axis_input Strb } }  }
	{ s_axis_input_V_user_V int 1 regular {axi_s 0 volatile  { s_axis_input User } }  }
	{ s_axis_input_V_last_V int 1 regular {axi_s 0 volatile  { s_axis_input Last } }  }
	{ s_axis_input_V_id_V int 1 regular {axi_s 0 volatile  { s_axis_input ID } }  }
	{ s_axis_input_V_dest_V int 1 regular {axi_s 0 volatile  { s_axis_input Dest } }  }
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
	{ "Name" : "s_axis_input_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_input_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_input_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_input_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_input_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_input_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_input_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_output_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_output_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_output_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_output_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_output_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_output_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_output_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axis_input_TDATA sc_in sc_lv 32 signal 0 } 
	{ s_axis_input_TVALID sc_in sc_logic 1 invld 6 } 
	{ s_axis_input_TREADY sc_out sc_logic 1 inacc 6 } 
	{ s_axis_input_TKEEP sc_in sc_lv 4 signal 1 } 
	{ s_axis_input_TSTRB sc_in sc_lv 4 signal 2 } 
	{ s_axis_input_TUSER sc_in sc_lv 1 signal 3 } 
	{ s_axis_input_TLAST sc_in sc_lv 1 signal 4 } 
	{ s_axis_input_TID sc_in sc_lv 1 signal 5 } 
	{ s_axis_input_TDEST sc_in sc_lv 1 signal 6 } 
	{ m_axis_output_TDATA sc_out sc_lv 32 signal 7 } 
	{ m_axis_output_TVALID sc_out sc_logic 1 outvld 13 } 
	{ m_axis_output_TREADY sc_in sc_logic 1 outacc 13 } 
	{ m_axis_output_TKEEP sc_out sc_lv 4 signal 8 } 
	{ m_axis_output_TSTRB sc_out sc_lv 4 signal 9 } 
	{ m_axis_output_TUSER sc_out sc_lv 1 signal 10 } 
	{ m_axis_output_TLAST sc_out sc_lv 1 signal 11 } 
	{ m_axis_output_TID sc_out sc_lv 1 signal 12 } 
	{ m_axis_output_TDEST sc_out sc_lv 1 signal 13 } 
	{ s_axi_ctrl_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_ctrl_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_ctrl_AWADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_ctrl_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_ctrl_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_ctrl_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_ctrl_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_ctrl_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_ctrl_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_ctrl_ARADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_ctrl_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_ctrl_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_ctrl_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_ctrl_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_ctrl_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_ctrl_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_ctrl_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_ctrl_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "ctrl", "role": "AWADDR" },"address":[{"name":"bnn_top","role":"start","value":"0","valid_bit":"0"},{"name":"bnn_top","role":"continue","value":"0","valid_bit":"4"},{"name":"bnn_top","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_ctrl_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ctrl", "role": "AWVALID" } },
	{ "name": "s_axi_ctrl_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ctrl", "role": "AWREADY" } },
	{ "name": "s_axi_ctrl_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ctrl", "role": "WVALID" } },
	{ "name": "s_axi_ctrl_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ctrl", "role": "WREADY" } },
	{ "name": "s_axi_ctrl_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ctrl", "role": "WDATA" } },
	{ "name": "s_axi_ctrl_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "ctrl", "role": "WSTRB" } },
	{ "name": "s_axi_ctrl_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "ctrl", "role": "ARADDR" },"address":[{"name":"bnn_top","role":"start","value":"0","valid_bit":"0"},{"name":"bnn_top","role":"done","value":"0","valid_bit":"1"},{"name":"bnn_top","role":"idle","value":"0","valid_bit":"2"},{"name":"bnn_top","role":"ready","value":"0","valid_bit":"3"},{"name":"bnn_top","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_ctrl_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ctrl", "role": "ARVALID" } },
	{ "name": "s_axi_ctrl_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ctrl", "role": "ARREADY" } },
	{ "name": "s_axi_ctrl_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ctrl", "role": "RVALID" } },
	{ "name": "s_axi_ctrl_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ctrl", "role": "RREADY" } },
	{ "name": "s_axi_ctrl_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ctrl", "role": "RDATA" } },
	{ "name": "s_axi_ctrl_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ctrl", "role": "RRESP" } },
	{ "name": "s_axi_ctrl_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ctrl", "role": "BVALID" } },
	{ "name": "s_axi_ctrl_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ctrl", "role": "BREADY" } },
	{ "name": "s_axi_ctrl_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ctrl", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ctrl", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_axis_input_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_axis_input_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_input_V_dest_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_input_V_dest_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "s_axis_input_V_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "s_axis_input_V_strb_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_input_V_user_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_input_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_input_V_id_V", "role": "default" }} , 
 	{ "name": "s_axis_input_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_input_V_dest_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_axis_output_V_data_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_output_V_dest_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_output_V_dest_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_axis_output_V_keep_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_axis_output_V_strb_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_output_V_user_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_output_V_last_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_output_V_id_V", "role": "default" }} , 
 	{ "name": "m_axis_output_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_output_V_dest_V", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	bnn_top {
		s_axis_input_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_dest_V {Type I LastRead 1 FirstWrite -1}
		m_axis_output_V_data_V {Type O LastRead -1 FirstWrite 1}
		m_axis_output_V_keep_V {Type O LastRead -1 FirstWrite 1}
		m_axis_output_V_strb_V {Type O LastRead -1 FirstWrite 1}
		m_axis_output_V_user_V {Type O LastRead -1 FirstWrite 1}
		m_axis_output_V_last_V {Type O LastRead -1 FirstWrite 1}
		m_axis_output_V_id_V {Type O LastRead -1 FirstWrite 1}
		m_axis_output_V_dest_V {Type O LastRead -1 FirstWrite 1}}
	bnn_top_Pipeline_RD_IN {
		s_axis_input_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_dest_V {Type I LastRead 1 FirstWrite -1}
		input_r {Type O LastRead -1 FirstWrite 1}}
	bnn_top_Pipeline_L1_W_L1_IN {
		s_axis_input_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_dest_V {Type I LastRead 1 FirstWrite -1}
		input_r {Type I LastRead 0 FirstWrite -1}
		act1 {Type O LastRead -1 FirstWrite 4}}
	bnn_top_Pipeline_L1_B {
		s_axis_input_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_dest_V {Type I LastRead 1 FirstWrite -1}
		act1 {Type IO LastRead 0 FirstWrite 2}}
	bnn_top_Pipeline_L2_W_L2_IN {
		s_axis_input_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_dest_V {Type I LastRead 1 FirstWrite -1}
		act1 {Type I LastRead 0 FirstWrite -1}
		act2 {Type O LastRead -1 FirstWrite 4}}
	bnn_top_Pipeline_L2_B {
		s_axis_input_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_dest_V {Type I LastRead 1 FirstWrite -1}
		act2 {Type IO LastRead 0 FirstWrite 2}}
	bnn_top_Pipeline_L3_W_L3_IN {
		s_axis_input_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_dest_V {Type I LastRead 1 FirstWrite -1}
		act2 {Type I LastRead 0 FirstWrite -1}
		act3 {Type O LastRead -1 FirstWrite 4}}
	bnn_top_Pipeline_L3_B {
		s_axis_input_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_dest_V {Type I LastRead 1 FirstWrite -1}
		act3 {Type IO LastRead 0 FirstWrite 2}}
	bnn_top_Pipeline_L4_W_L4_IN {
		act4 {Type O LastRead -1 FirstWrite 3}
		s_axis_input_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_dest_V {Type I LastRead 1 FirstWrite -1}
		act3 {Type I LastRead 0 FirstWrite -1}
		act4_1 {Type O LastRead -1 FirstWrite 3}}
	bnn_top_Pipeline_L4_B {
		act4 {Type IO LastRead 1 FirstWrite 2}
		act4_1 {Type IO LastRead 1 FirstWrite 2}
		s_axis_input_V_data_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_keep_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_strb_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_user_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_last_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_id_V {Type I LastRead 1 FirstWrite -1}
		s_axis_input_V_dest_V {Type I LastRead 1 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "148860", "Max" : "148860"}
	, {"Name" : "Interval", "Min" : "148861", "Max" : "148861"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_input_V_data_V { axis {  { s_axis_input_TDATA in_data 0 32 } } }
	s_axis_input_V_keep_V { axis {  { s_axis_input_TKEEP in_data 0 4 } } }
	s_axis_input_V_strb_V { axis {  { s_axis_input_TSTRB in_data 0 4 } } }
	s_axis_input_V_user_V { axis {  { s_axis_input_TUSER in_data 0 1 } } }
	s_axis_input_V_last_V { axis {  { s_axis_input_TLAST in_data 0 1 } } }
	s_axis_input_V_id_V { axis {  { s_axis_input_TID in_data 0 1 } } }
	s_axis_input_V_dest_V { axis {  { s_axis_input_TVALID in_vld 0 1 }  { s_axis_input_TREADY in_acc 1 1 }  { s_axis_input_TDEST in_data 0 1 } } }
	m_axis_output_V_data_V { axis {  { m_axis_output_TDATA out_data 1 32 } } }
	m_axis_output_V_keep_V { axis {  { m_axis_output_TKEEP out_data 1 4 } } }
	m_axis_output_V_strb_V { axis {  { m_axis_output_TSTRB out_data 1 4 } } }
	m_axis_output_V_user_V { axis {  { m_axis_output_TUSER out_data 1 1 } } }
	m_axis_output_V_last_V { axis {  { m_axis_output_TLAST out_data 1 1 } } }
	m_axis_output_V_id_V { axis {  { m_axis_output_TID out_data 1 1 } } }
	m_axis_output_V_dest_V { axis {  { m_axis_output_TVALID out_vld 1 1 }  { m_axis_output_TREADY out_acc 0 1 }  { m_axis_output_TDEST out_data 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
