// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat May  9 00:10:09 2026
// Host        : LAPTOP-VNMTQE0B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/Chappidi Sai
//               Sudheer/Desktop/bnn_accelerator/bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ip/bnn_accelerator_design_bnn_accelerator_0_0/bnn_accelerator_design_bnn_accelerator_0_0_sim_netlist.v}
// Design      : bnn_accelerator_design_bnn_accelerator_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bnn_accelerator_design_bnn_accelerator_0_0,bnn_accelerator,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "bnn_accelerator,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module bnn_accelerator_design_bnn_accelerator_0_0
   (aclk,
    aresetn,
    s_axis_tdata,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tlast,
    m_axis_tdata,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tlast);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis:s_axis, ASSOCIATED_RESET aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bnn_accelerator_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN bnn_accelerator_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [31:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *) input s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN bnn_accelerator_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [31:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *) output m_axis_tlast;

  wire \<const0> ;
  wire \<const1> ;
  wire aclk;
  wire aresetn;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_axis_tready;
  wire s_axis_tvalid;

  assign m_axis_tdata[31] = \<const0> ;
  assign m_axis_tdata[30] = \<const0> ;
  assign m_axis_tdata[29] = \<const0> ;
  assign m_axis_tdata[28] = \<const0> ;
  assign m_axis_tdata[27] = \<const0> ;
  assign m_axis_tdata[26] = \<const0> ;
  assign m_axis_tdata[25] = \<const0> ;
  assign m_axis_tdata[24] = \<const0> ;
  assign m_axis_tdata[23] = \<const0> ;
  assign m_axis_tdata[22] = \<const0> ;
  assign m_axis_tdata[21] = \<const0> ;
  assign m_axis_tdata[20] = \<const0> ;
  assign m_axis_tdata[19] = \<const0> ;
  assign m_axis_tdata[18] = \<const0> ;
  assign m_axis_tdata[17] = \<const0> ;
  assign m_axis_tdata[16] = \<const0> ;
  assign m_axis_tdata[15] = \<const0> ;
  assign m_axis_tdata[14] = \<const0> ;
  assign m_axis_tdata[13] = \<const0> ;
  assign m_axis_tdata[12] = \<const0> ;
  assign m_axis_tdata[11] = \<const0> ;
  assign m_axis_tdata[10] = \<const0> ;
  assign m_axis_tdata[9] = \<const0> ;
  assign m_axis_tdata[8] = \<const0> ;
  assign m_axis_tdata[7] = \<const0> ;
  assign m_axis_tdata[6] = \<const0> ;
  assign m_axis_tdata[5] = \<const0> ;
  assign m_axis_tdata[4] = \<const0> ;
  assign m_axis_tdata[3] = \<const0> ;
  assign m_axis_tdata[2] = \<const0> ;
  assign m_axis_tdata[1] = \<const0> ;
  assign m_axis_tdata[0] = \<const1> ;
  assign m_axis_tlast = m_axis_tvalid;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  bnn_accelerator_design_bnn_accelerator_0_0_bnn_accelerator inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "bnn_accelerator" *) 
module bnn_accelerator_design_bnn_accelerator_0_0_bnn_accelerator
   (s_axis_tready,
    m_axis_tvalid,
    aresetn,
    aclk,
    s_axis_tvalid,
    m_axis_tready);
  output s_axis_tready;
  output m_axis_tvalid;
  input aresetn;
  input aclk;
  input s_axis_tvalid;
  input m_axis_tready;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state[2]_i_4_n_0 ;
  wire \FSM_sequential_state[2]_i_5_n_0 ;
  wire aclk;
  wire aresetn;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire out_valid_i_1_n_0;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [2:0]state;
  wire [6:0]word_count;
  wire \word_count[4]_i_2_n_0 ;
  wire \word_count[6]_i_1_n_0 ;
  wire \word_count[6]_i_2_n_0 ;
  wire \word_count[6]_i_4_n_0 ;
  wire \word_count_reg_n_0_[0] ;
  wire \word_count_reg_n_0_[1] ;
  wire \word_count_reg_n_0_[2] ;
  wire \word_count_reg_n_0_[3] ;
  wire \word_count_reg_n_0_[4] ;
  wire \word_count_reg_n_0_[5] ;
  wire \word_count_reg_n_0_[6] ;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h2600)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[0]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(state[2]),
        .I3(aresetn),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h262A0000)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[1]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(state[2]),
        .I3(state[0]),
        .I4(aresetn),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h62220000)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state[2]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(state[1]),
        .I3(state[0]),
        .I4(aresetn),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF0002)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(\FSM_sequential_state[2]_i_3_n_0 ),
        .I1(\word_count_reg_n_0_[0] ),
        .I2(\word_count_reg_n_0_[1] ),
        .I3(\word_count_reg_n_0_[2] ),
        .I4(\FSM_sequential_state[2]_i_4_n_0 ),
        .I5(\FSM_sequential_state[2]_i_5_n_0 ),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000001000000000)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(\word_count_reg_n_0_[3] ),
        .I1(\word_count_reg_n_0_[4] ),
        .I2(\word_count_reg_n_0_[6] ),
        .I3(\word_count_reg_n_0_[5] ),
        .I4(state[2]),
        .I5(state[0]),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \FSM_sequential_state[2]_i_4 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(m_axis_tready),
        .O(\FSM_sequential_state[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0A0E)) 
    \FSM_sequential_state[2]_i_5 
       (.I0(state[1]),
        .I1(s_axis_tvalid),
        .I2(state[2]),
        .I3(state[0]),
        .O(\FSM_sequential_state[2]_i_5_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:000,RECV_FEAT:001,COMPUTE_FC1:010,COMPUTE_FC2:011,SEND_RESULT:100," *) 
  FDRE \FSM_sequential_state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "IDLE:000,RECV_FEAT:001,COMPUTE_FC1:010,COMPUTE_FC2:011,SEND_RESULT:100," *) 
  FDRE \FSM_sequential_state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "IDLE:000,RECV_FEAT:001,COMPUTE_FC1:010,COMPUTE_FC2:011,SEND_RESULT:100," *) 
  FDRE \FSM_sequential_state_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA9ABA8A800000000)) 
    out_valid_i_1
       (.I0(m_axis_tvalid),
        .I1(state[1]),
        .I2(state[0]),
        .I3(m_axis_tready),
        .I4(state[2]),
        .I5(aresetn),
        .O(out_valid_i_1_n_0));
  FDRE out_valid_reg
       (.C(aclk),
        .CE(1'b1),
        .D(out_valid_i_1_n_0),
        .Q(m_axis_tvalid),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    s_axis_tready_INST_0
       (.I0(state[1]),
        .I1(state[2]),
        .O(s_axis_tready));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h5C)) 
    \word_count[0]_i_1 
       (.I0(\word_count_reg_n_0_[0] ),
        .I1(s_axis_tvalid),
        .I2(state[0]),
        .O(word_count[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \word_count[1]_i_1 
       (.I0(state[0]),
        .I1(\word_count_reg_n_0_[0] ),
        .I2(\word_count_reg_n_0_[1] ),
        .O(word_count[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \word_count[2]_i_1 
       (.I0(\word_count_reg_n_0_[1] ),
        .I1(\word_count_reg_n_0_[0] ),
        .I2(state[0]),
        .I3(\word_count_reg_n_0_[2] ),
        .O(word_count[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \word_count[3]_i_1 
       (.I0(\word_count_reg_n_0_[2] ),
        .I1(\word_count_reg_n_0_[0] ),
        .I2(\word_count_reg_n_0_[1] ),
        .I3(state[0]),
        .I4(\word_count_reg_n_0_[3] ),
        .O(word_count[3]));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \word_count[4]_i_1 
       (.I0(\word_count_reg_n_0_[1] ),
        .I1(\word_count_reg_n_0_[0] ),
        .I2(\word_count_reg_n_0_[2] ),
        .I3(\word_count_reg_n_0_[3] ),
        .I4(\word_count[4]_i_2_n_0 ),
        .I5(\word_count_reg_n_0_[4] ),
        .O(word_count[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \word_count[4]_i_2 
       (.I0(state[0]),
        .I1(state[2]),
        .O(\word_count[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \word_count[5]_i_1 
       (.I0(\word_count[6]_i_4_n_0 ),
        .I1(state[0]),
        .I2(\word_count_reg_n_0_[5] ),
        .O(word_count[5]));
  LUT1 #(
    .INIT(2'h1)) 
    \word_count[6]_i_1 
       (.I0(aresetn),
        .O(\word_count[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0002000F)) 
    \word_count[6]_i_2 
       (.I0(s_axis_tvalid),
        .I1(\word_count_reg_n_0_[6] ),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[0]),
        .O(\word_count[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \word_count[6]_i_3 
       (.I0(\word_count[6]_i_4_n_0 ),
        .I1(\word_count_reg_n_0_[5] ),
        .I2(state[0]),
        .I3(\word_count_reg_n_0_[6] ),
        .O(word_count[6]));
  LUT5 #(
    .INIT(32'h80000000)) 
    \word_count[6]_i_4 
       (.I0(\word_count_reg_n_0_[4] ),
        .I1(\word_count_reg_n_0_[3] ),
        .I2(\word_count_reg_n_0_[2] ),
        .I3(\word_count_reg_n_0_[0] ),
        .I4(\word_count_reg_n_0_[1] ),
        .O(\word_count[6]_i_4_n_0 ));
  FDRE \word_count_reg[0] 
       (.C(aclk),
        .CE(\word_count[6]_i_2_n_0 ),
        .D(word_count[0]),
        .Q(\word_count_reg_n_0_[0] ),
        .R(\word_count[6]_i_1_n_0 ));
  FDRE \word_count_reg[1] 
       (.C(aclk),
        .CE(\word_count[6]_i_2_n_0 ),
        .D(word_count[1]),
        .Q(\word_count_reg_n_0_[1] ),
        .R(\word_count[6]_i_1_n_0 ));
  FDRE \word_count_reg[2] 
       (.C(aclk),
        .CE(\word_count[6]_i_2_n_0 ),
        .D(word_count[2]),
        .Q(\word_count_reg_n_0_[2] ),
        .R(\word_count[6]_i_1_n_0 ));
  FDRE \word_count_reg[3] 
       (.C(aclk),
        .CE(\word_count[6]_i_2_n_0 ),
        .D(word_count[3]),
        .Q(\word_count_reg_n_0_[3] ),
        .R(\word_count[6]_i_1_n_0 ));
  FDRE \word_count_reg[4] 
       (.C(aclk),
        .CE(\word_count[6]_i_2_n_0 ),
        .D(word_count[4]),
        .Q(\word_count_reg_n_0_[4] ),
        .R(\word_count[6]_i_1_n_0 ));
  FDRE \word_count_reg[5] 
       (.C(aclk),
        .CE(\word_count[6]_i_2_n_0 ),
        .D(word_count[5]),
        .Q(\word_count_reg_n_0_[5] ),
        .R(\word_count[6]_i_1_n_0 ));
  FDRE \word_count_reg[6] 
       (.C(aclk),
        .CE(\word_count[6]_i_2_n_0 ),
        .D(word_count[6]),
        .Q(\word_count_reg_n_0_[6] ),
        .R(\word_count[6]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
