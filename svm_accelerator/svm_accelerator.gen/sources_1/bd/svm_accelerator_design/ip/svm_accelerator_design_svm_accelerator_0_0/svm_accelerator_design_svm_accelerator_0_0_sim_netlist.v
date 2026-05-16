// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat May  9 00:59:28 2026
// Host        : LAPTOP-VNMTQE0B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/Chappidi Sai
//               Sudheer/Desktop/svm_accelerator/svm_accelerator.gen/sources_1/bd/svm_accelerator_design/ip/svm_accelerator_design_svm_accelerator_0_0/svm_accelerator_design_svm_accelerator_0_0_sim_netlist.v}
// Design      : svm_accelerator_design_svm_accelerator_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "svm_accelerator_design_svm_accelerator_0_0,svm_accelerator,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "svm_accelerator,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module svm_accelerator_design_svm_accelerator_0_0
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis:s_axis, ASSOCIATED_RESET aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN svm_accelerator_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN svm_accelerator_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [31:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *) input s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN svm_accelerator_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output [31:0]m_axis_tdata;
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
  svm_accelerator_design_svm_accelerator_0_0_svm_accelerator inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "svm_accelerator" *) 
module svm_accelerator_design_svm_accelerator_0_0_svm_accelerator
   (s_axis_tready,
    m_axis_tvalid,
    aresetn,
    aclk,
    m_axis_tready,
    s_axis_tvalid);
  output s_axis_tready;
  output m_axis_tvalid;
  input aresetn;
  input aclk;
  input m_axis_tready;
  input s_axis_tvalid;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire \FSM_sequential_state[2]_i_3_n_0 ;
  wire \FSM_sequential_state[2]_i_4_n_0 ;
  wire \FSM_sequential_state[2]_i_5_n_0 ;
  wire \FSM_sequential_state[2]_i_6_n_0 ;
  wire aclk;
  wire aresetn;
  wire [3:0]feat_count;
  wire \feat_count[3]_i_1_n_0 ;
  wire \feat_count[3]_i_2_n_0 ;
  wire \feat_count[3]_i_4_n_0 ;
  wire \feat_count_reg_n_0_[0] ;
  wire \feat_count_reg_n_0_[1] ;
  wire \feat_count_reg_n_0_[2] ;
  wire \feat_count_reg_n_0_[3] ;
  wire [11:1]in8;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire out_valid_i_1_n_0;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [2:0]state;
  wire [11:0]sv_index;
  wire sv_index0_carry__0_n_0;
  wire sv_index0_carry__0_n_1;
  wire sv_index0_carry__0_n_2;
  wire sv_index0_carry__0_n_3;
  wire sv_index0_carry__1_n_2;
  wire sv_index0_carry__1_n_3;
  wire sv_index0_carry_n_0;
  wire sv_index0_carry_n_1;
  wire sv_index0_carry_n_2;
  wire sv_index0_carry_n_3;
  wire \sv_index[11]_i_1_n_0 ;
  wire \sv_index_reg_n_0_[0] ;
  wire \sv_index_reg_n_0_[10] ;
  wire \sv_index_reg_n_0_[11] ;
  wire \sv_index_reg_n_0_[1] ;
  wire \sv_index_reg_n_0_[2] ;
  wire \sv_index_reg_n_0_[3] ;
  wire \sv_index_reg_n_0_[4] ;
  wire \sv_index_reg_n_0_[5] ;
  wire \sv_index_reg_n_0_[6] ;
  wire \sv_index_reg_n_0_[7] ;
  wire \sv_index_reg_n_0_[8] ;
  wire \sv_index_reg_n_0_[9] ;
  wire [3:2]NLW_sv_index0_carry__1_CO_UNCONNECTED;
  wire [3:3]NLW_sv_index0_carry__1_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h2600)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[0]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(state[2]),
        .I3(aresetn),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2E2A222A00000000)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[1]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(state[2]),
        .I3(state[0]),
        .I4(\FSM_sequential_state[2]_i_3_n_0 ),
        .I5(aresetn),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h26220000)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state[2]),
        .I1(\FSM_sequential_state[2]_i_2_n_0 ),
        .I2(\FSM_sequential_state[2]_i_3_n_0 ),
        .I3(state[0]),
        .I4(aresetn),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAEEAAEEBAFFBAEE)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(\FSM_sequential_state[2]_i_4_n_0 ),
        .I1(state[1]),
        .I2(m_axis_tready),
        .I3(state[2]),
        .I4(s_axis_tvalid),
        .I5(state[0]),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFBFF)) 
    \FSM_sequential_state[2]_i_3 
       (.I0(\FSM_sequential_state[2]_i_5_n_0 ),
        .I1(\sv_index_reg_n_0_[4] ),
        .I2(\sv_index_reg_n_0_[3] ),
        .I3(\sv_index_reg_n_0_[6] ),
        .I4(\sv_index_reg_n_0_[5] ),
        .I5(\FSM_sequential_state[2]_i_6_n_0 ),
        .O(\FSM_sequential_state[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \FSM_sequential_state[2]_i_4 
       (.I0(\feat_count_reg_n_0_[3] ),
        .I1(\feat_count_reg_n_0_[2] ),
        .I2(\feat_count_reg_n_0_[1] ),
        .I3(\feat_count_reg_n_0_[0] ),
        .I4(state[2]),
        .I5(state[0]),
        .O(\FSM_sequential_state[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \FSM_sequential_state[2]_i_5 
       (.I0(\sv_index_reg_n_0_[8] ),
        .I1(\sv_index_reg_n_0_[7] ),
        .I2(\sv_index_reg_n_0_[9] ),
        .I3(\sv_index_reg_n_0_[10] ),
        .O(\FSM_sequential_state[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFBFFF)) 
    \FSM_sequential_state[2]_i_6 
       (.I0(\sv_index_reg_n_0_[0] ),
        .I1(\sv_index_reg_n_0_[11] ),
        .I2(state[1]),
        .I3(\sv_index_reg_n_0_[2] ),
        .I4(\sv_index_reg_n_0_[1] ),
        .O(\FSM_sequential_state[2]_i_6_n_0 ));
  (* FSM_ENCODED_STATES = "IDLE:000,RECV_FEAT:001,ACCUMULATE:011,COMPUTE_RBF:010,SEND_RESULT:100" *) 
  FDRE \FSM_sequential_state_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "IDLE:000,RECV_FEAT:001,ACCUMULATE:011,COMPUTE_RBF:010,SEND_RESULT:100" *) 
  FDRE \FSM_sequential_state_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "IDLE:000,RECV_FEAT:001,ACCUMULATE:011,COMPUTE_RBF:010,SEND_RESULT:100" *) 
  FDRE \FSM_sequential_state_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h1310)) 
    \feat_count[0]_i_1 
       (.I0(\feat_count_reg_n_0_[0] ),
        .I1(state[2]),
        .I2(state[0]),
        .I3(s_axis_tvalid),
        .O(feat_count[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0220)) 
    \feat_count[1]_i_1 
       (.I0(state[0]),
        .I1(state[2]),
        .I2(\feat_count_reg_n_0_[0] ),
        .I3(\feat_count_reg_n_0_[1] ),
        .O(feat_count[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h07000800)) 
    \feat_count[2]_i_1 
       (.I0(\feat_count_reg_n_0_[0] ),
        .I1(\feat_count_reg_n_0_[1] ),
        .I2(state[2]),
        .I3(state[0]),
        .I4(\feat_count_reg_n_0_[2] ),
        .O(feat_count[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \feat_count[3]_i_1 
       (.I0(aresetn),
        .O(\feat_count[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAAB)) 
    \feat_count[3]_i_2 
       (.I0(\feat_count[3]_i_4_n_0 ),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[1]),
        .O(\feat_count[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h007F000000800000)) 
    \feat_count[3]_i_3 
       (.I0(\feat_count_reg_n_0_[1] ),
        .I1(\feat_count_reg_n_0_[0] ),
        .I2(\feat_count_reg_n_0_[2] ),
        .I3(state[2]),
        .I4(state[0]),
        .I5(\feat_count_reg_n_0_[3] ),
        .O(feat_count[3]));
  LUT6 #(
    .INIT(64'h0004000400040404)) 
    \feat_count[3]_i_4 
       (.I0(state[2]),
        .I1(s_axis_tvalid),
        .I2(state[1]),
        .I3(\feat_count_reg_n_0_[3] ),
        .I4(\feat_count_reg_n_0_[1] ),
        .I5(\feat_count_reg_n_0_[2] ),
        .O(\feat_count[3]_i_4_n_0 ));
  FDRE \feat_count_reg[0] 
       (.C(aclk),
        .CE(\feat_count[3]_i_2_n_0 ),
        .D(feat_count[0]),
        .Q(\feat_count_reg_n_0_[0] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \feat_count_reg[1] 
       (.C(aclk),
        .CE(\feat_count[3]_i_2_n_0 ),
        .D(feat_count[1]),
        .Q(\feat_count_reg_n_0_[1] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \feat_count_reg[2] 
       (.C(aclk),
        .CE(\feat_count[3]_i_2_n_0 ),
        .D(feat_count[2]),
        .Q(\feat_count_reg_n_0_[2] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \feat_count_reg[3] 
       (.C(aclk),
        .CE(\feat_count[3]_i_2_n_0 ),
        .D(feat_count[3]),
        .Q(\feat_count_reg_n_0_[3] ),
        .R(\feat_count[3]_i_1_n_0 ));
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
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h1)) 
    s_axis_tready_INST_0
       (.I0(state[1]),
        .I1(state[2]),
        .O(s_axis_tready));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sv_index0_carry
       (.CI(1'b0),
        .CO({sv_index0_carry_n_0,sv_index0_carry_n_1,sv_index0_carry_n_2,sv_index0_carry_n_3}),
        .CYINIT(\sv_index_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in8[4:1]),
        .S({\sv_index_reg_n_0_[4] ,\sv_index_reg_n_0_[3] ,\sv_index_reg_n_0_[2] ,\sv_index_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sv_index0_carry__0
       (.CI(sv_index0_carry_n_0),
        .CO({sv_index0_carry__0_n_0,sv_index0_carry__0_n_1,sv_index0_carry__0_n_2,sv_index0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(in8[8:5]),
        .S({\sv_index_reg_n_0_[8] ,\sv_index_reg_n_0_[7] ,\sv_index_reg_n_0_[6] ,\sv_index_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 sv_index0_carry__1
       (.CI(sv_index0_carry__0_n_0),
        .CO({NLW_sv_index0_carry__1_CO_UNCONNECTED[3:2],sv_index0_carry__1_n_2,sv_index0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_sv_index0_carry__1_O_UNCONNECTED[3],in8[11:9]}),
        .S({1'b0,\sv_index_reg_n_0_[11] ,\sv_index_reg_n_0_[10] ,\sv_index_reg_n_0_[9] }));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \sv_index[0]_i_1 
       (.I0(state[1]),
        .I1(\sv_index_reg_n_0_[0] ),
        .O(sv_index[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sv_index[10]_i_1 
       (.I0(state[1]),
        .I1(in8[10]),
        .O(sv_index[10]));
  LUT3 #(
    .INIT(8'h41)) 
    \sv_index[11]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .O(\sv_index[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sv_index[11]_i_2 
       (.I0(state[1]),
        .I1(in8[11]),
        .O(sv_index[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \sv_index[1]_i_1 
       (.I0(state[1]),
        .I1(in8[1]),
        .O(sv_index[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sv_index[2]_i_1 
       (.I0(state[1]),
        .I1(in8[2]),
        .O(sv_index[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sv_index[3]_i_1 
       (.I0(state[1]),
        .I1(in8[3]),
        .O(sv_index[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sv_index[4]_i_1 
       (.I0(state[1]),
        .I1(in8[4]),
        .O(sv_index[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sv_index[5]_i_1 
       (.I0(state[1]),
        .I1(in8[5]),
        .O(sv_index[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sv_index[6]_i_1 
       (.I0(state[1]),
        .I1(in8[6]),
        .O(sv_index[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sv_index[7]_i_1 
       (.I0(state[1]),
        .I1(in8[7]),
        .O(sv_index[7]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sv_index[8]_i_1 
       (.I0(state[1]),
        .I1(in8[8]),
        .O(sv_index[8]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \sv_index[9]_i_1 
       (.I0(state[1]),
        .I1(in8[9]),
        .O(sv_index[9]));
  FDRE \sv_index_reg[0] 
       (.C(aclk),
        .CE(\sv_index[11]_i_1_n_0 ),
        .D(sv_index[0]),
        .Q(\sv_index_reg_n_0_[0] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \sv_index_reg[10] 
       (.C(aclk),
        .CE(\sv_index[11]_i_1_n_0 ),
        .D(sv_index[10]),
        .Q(\sv_index_reg_n_0_[10] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \sv_index_reg[11] 
       (.C(aclk),
        .CE(\sv_index[11]_i_1_n_0 ),
        .D(sv_index[11]),
        .Q(\sv_index_reg_n_0_[11] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \sv_index_reg[1] 
       (.C(aclk),
        .CE(\sv_index[11]_i_1_n_0 ),
        .D(sv_index[1]),
        .Q(\sv_index_reg_n_0_[1] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \sv_index_reg[2] 
       (.C(aclk),
        .CE(\sv_index[11]_i_1_n_0 ),
        .D(sv_index[2]),
        .Q(\sv_index_reg_n_0_[2] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \sv_index_reg[3] 
       (.C(aclk),
        .CE(\sv_index[11]_i_1_n_0 ),
        .D(sv_index[3]),
        .Q(\sv_index_reg_n_0_[3] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \sv_index_reg[4] 
       (.C(aclk),
        .CE(\sv_index[11]_i_1_n_0 ),
        .D(sv_index[4]),
        .Q(\sv_index_reg_n_0_[4] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \sv_index_reg[5] 
       (.C(aclk),
        .CE(\sv_index[11]_i_1_n_0 ),
        .D(sv_index[5]),
        .Q(\sv_index_reg_n_0_[5] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \sv_index_reg[6] 
       (.C(aclk),
        .CE(\sv_index[11]_i_1_n_0 ),
        .D(sv_index[6]),
        .Q(\sv_index_reg_n_0_[6] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \sv_index_reg[7] 
       (.C(aclk),
        .CE(\sv_index[11]_i_1_n_0 ),
        .D(sv_index[7]),
        .Q(\sv_index_reg_n_0_[7] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \sv_index_reg[8] 
       (.C(aclk),
        .CE(\sv_index[11]_i_1_n_0 ),
        .D(sv_index[8]),
        .Q(\sv_index_reg_n_0_[8] ),
        .R(\feat_count[3]_i_1_n_0 ));
  FDRE \sv_index_reg[9] 
       (.C(aclk),
        .CE(\sv_index[11]_i_1_n_0 ),
        .D(sv_index[9]),
        .Q(\sv_index_reg_n_0_[9] ),
        .R(\feat_count[3]_i_1_n_0 ));
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
