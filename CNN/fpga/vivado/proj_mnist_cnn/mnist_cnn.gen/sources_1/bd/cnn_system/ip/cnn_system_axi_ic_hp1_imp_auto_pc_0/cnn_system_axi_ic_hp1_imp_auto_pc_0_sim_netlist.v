// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Sun Apr 19 23:17:44 2026
// Host        : DESKTOP-G7LOJLI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Akshay/OneDrive/Desktop/FGPA-Based-Hardware-Accelerator/CNN/fpga/vivado/proj_mnist_cnn/mnist_cnn.gen/sources_1/bd/cnn_system/ip/cnn_system_axi_ic_hp1_imp_auto_pc_0/cnn_system_axi_ic_hp1_imp_auto_pc_0_sim_netlist.v
// Design      : cnn_system_axi_ic_hp1_imp_auto_pc_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cnn_system_axi_ic_hp1_imp_auto_pc_0,axi_protocol_converter_v2_1_36_axi_protocol_converter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axi_protocol_converter_v2_1_36_axi_protocol_converter,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module cnn_system_axi_ic_hp1_imp_auto_pc_0
   (aclk,
    aresetn,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arregion,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, ASSOCIATED_BUSIF S_AXI:M_AXI, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN cnn_system_ps7_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_ONLY, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN cnn_system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [31:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *) input [7:0]s_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *) input [2:0]s_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *) input [1:0]s_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *) input [0:0]s_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *) input [3:0]s_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREGION" *) input [3:0]s_axi_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARQOS" *) input [3:0]s_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *) output s_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI, DATA_WIDTH 32, PROTOCOL AXI3, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN cnn_system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [31:0]m_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *) output [3:0]m_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE" *) output [2:0]m_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARBURST" *) output [1:0]m_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK" *) output [1:0]m_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE" *) output [3:0]m_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *) output [2:0]m_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARQOS" *) output [3:0]m_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *) output m_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *) input m_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *) input [31:0]m_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *) input [1:0]m_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *) input m_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *) input m_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *) output m_axi_rready;

  wire \<const0> ;
  wire aclk;
  wire aresetn;
  wire [31:0]m_axi_araddr;
  wire [1:0]m_axi_arburst;
  wire [3:0]m_axi_arcache;
  wire [3:0]m_axi_arlen;
  wire [0:0]\^m_axi_arlock ;
  wire [2:0]m_axi_arprot;
  wire [3:0]m_axi_arqos;
  wire m_axi_arready;
  wire [2:0]m_axi_arsize;
  wire m_axi_arvalid;
  wire [31:0]m_axi_rdata;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire NLW_inst_m_axi_awvalid_UNCONNECTED;
  wire NLW_inst_m_axi_bready_UNCONNECTED;
  wire NLW_inst_m_axi_wlast_UNCONNECTED;
  wire NLW_inst_m_axi_wvalid_UNCONNECTED;
  wire NLW_inst_s_axi_awready_UNCONNECTED;
  wire NLW_inst_s_axi_bvalid_UNCONNECTED;
  wire NLW_inst_s_axi_wready_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_arid_UNCONNECTED;
  wire [1:1]NLW_inst_m_axi_arlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arregion_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_inst_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awid_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awlen_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awuser_UNCONNECTED;
  wire [31:0]NLW_inst_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wid_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_inst_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_buser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_rid_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_ruser_UNCONNECTED;

  assign m_axi_arlock[1] = \<const0> ;
  assign m_axi_arlock[0] = \^m_axi_arlock [0];
  GND GND
       (.G(\<const0> ));
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "32" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_SUPPORTS_READ = "1" *) 
  (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
  (* C_AXI_SUPPORTS_WRITE = "0" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_IGNORE_ID = "1" *) 
  (* C_M_AXI_PROTOCOL = "1" *) 
  (* C_S_AXI_PROTOCOL = "0" *) 
  (* C_TRANSLATION_MODE = "2" *) 
  (* P_AXI3 = "1" *) 
  (* P_AXI4 = "0" *) 
  (* P_AXILITE = "2" *) 
  (* P_AXILITE_SIZE = "3'b010" *) 
  (* P_CONVERSION = "2" *) 
  (* P_DECERR = "2'b11" *) 
  (* P_INCR = "2'b01" *) 
  (* P_PROTECTION = "1" *) 
  (* P_SLVERR = "2'b10" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  cnn_system_axi_ic_hp1_imp_auto_pc_0_axi_protocol_converter_v2_1_36_axi_protocol_converter inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arburst(m_axi_arburst),
        .m_axi_arcache(m_axi_arcache),
        .m_axi_arid(NLW_inst_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(m_axi_arlen),
        .m_axi_arlock({NLW_inst_m_axi_arlock_UNCONNECTED[1],\^m_axi_arlock }),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_arqos(m_axi_arqos),
        .m_axi_arready(m_axi_arready),
        .m_axi_arregion(NLW_inst_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(m_axi_arsize),
        .m_axi_aruser(NLW_inst_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awaddr(NLW_inst_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_inst_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_inst_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_inst_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_inst_m_axi_awlen_UNCONNECTED[3:0]),
        .m_axi_awlock(NLW_inst_m_axi_awlock_UNCONNECTED[1:0]),
        .m_axi_awprot(NLW_inst_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_inst_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_inst_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_inst_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_inst_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_inst_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_inst_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rid(1'b0),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_wdata(NLW_inst_m_axi_wdata_UNCONNECTED[31:0]),
        .m_axi_wid(NLW_inst_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_inst_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_inst_m_axi_wstrb_UNCONNECTED[3:0]),
        .m_axi_wuser(NLW_inst_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_inst_m_axi_wvalid_UNCONNECTED),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_arid(1'b0),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arqos(s_axi_arqos),
        .s_axi_arready(s_axi_arready),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b1}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_inst_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_inst_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_inst_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_inst_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_inst_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(NLW_inst_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_ruser(NLW_inst_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b1),
        .s_axi_wready(NLW_inst_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b1,1'b1,1'b1,1'b1}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0));
endmodule

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_35_axic_fifo" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_0_axi_data_fifo_v2_1_35_axic_fifo
   (empty,
    SR,
    din,
    m_axi_rready,
    s_axi_rvalid,
    s_axi_rlast,
    S_AXI_AREADY_I_reg,
    command_ongoing_reg,
    aresetn_0,
    E,
    m_axi_arvalid,
    aclk,
    rd_en,
    s_axi_rready,
    m_axi_rvalid,
    m_axi_rlast,
    command_ongoing_reg_0,
    S_AXI_AREADY_I_reg_0,
    s_axi_arvalid,
    aresetn,
    command_ongoing,
    command_ongoing_reg_1,
    m_axi_arready,
    cmd_push_block,
    need_to_split_q,
    Q,
    split_ongoing_reg,
    access_is_incr_q);
  output empty;
  output [0:0]SR;
  output [0:0]din;
  output m_axi_rready;
  output s_axi_rvalid;
  output s_axi_rlast;
  output S_AXI_AREADY_I_reg;
  output command_ongoing_reg;
  output aresetn_0;
  output [0:0]E;
  output m_axi_arvalid;
  input aclk;
  input rd_en;
  input s_axi_rready;
  input m_axi_rvalid;
  input m_axi_rlast;
  input command_ongoing_reg_0;
  input S_AXI_AREADY_I_reg_0;
  input s_axi_arvalid;
  input aresetn;
  input command_ongoing;
  input command_ongoing_reg_1;
  input m_axi_arready;
  input cmd_push_block;
  input need_to_split_q;
  input [3:0]Q;
  input [3:0]split_ongoing_reg;
  input access_is_incr_q;

  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;
  wire S_AXI_AREADY_I_reg;
  wire S_AXI_AREADY_I_reg_0;
  wire access_is_incr_q;
  wire aclk;
  wire aresetn;
  wire aresetn_0;
  wire cmd_push_block;
  wire command_ongoing;
  wire command_ongoing_reg;
  wire command_ongoing_reg_0;
  wire command_ongoing_reg_1;
  wire [0:0]din;
  wire empty;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire need_to_split_q;
  wire rd_en;
  wire s_axi_arvalid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [3:0]split_ongoing_reg;

  cnn_system_axi_ic_hp1_imp_auto_pc_0_axi_data_fifo_v2_1_35_fifo_gen inst
       (.E(E),
        .Q(Q),
        .SR(SR),
        .S_AXI_AREADY_I_reg(S_AXI_AREADY_I_reg),
        .S_AXI_AREADY_I_reg_0(S_AXI_AREADY_I_reg_0),
        .access_is_incr_q(access_is_incr_q),
        .aclk(aclk),
        .aresetn(aresetn),
        .aresetn_0(aresetn_0),
        .cmd_push_block(cmd_push_block),
        .command_ongoing(command_ongoing),
        .command_ongoing_reg(command_ongoing_reg),
        .command_ongoing_reg_0(command_ongoing_reg_0),
        .command_ongoing_reg_1(command_ongoing_reg_1),
        .din(din),
        .empty(empty),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .need_to_split_q(need_to_split_q),
        .rd_en(rd_en),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .split_ongoing_reg(split_ongoing_reg));
endmodule

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_35_fifo_gen" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_0_axi_data_fifo_v2_1_35_fifo_gen
   (empty,
    SR,
    din,
    m_axi_rready,
    s_axi_rvalid,
    s_axi_rlast,
    S_AXI_AREADY_I_reg,
    command_ongoing_reg,
    aresetn_0,
    E,
    m_axi_arvalid,
    aclk,
    rd_en,
    s_axi_rready,
    m_axi_rvalid,
    m_axi_rlast,
    command_ongoing_reg_0,
    S_AXI_AREADY_I_reg_0,
    s_axi_arvalid,
    aresetn,
    command_ongoing,
    command_ongoing_reg_1,
    m_axi_arready,
    cmd_push_block,
    need_to_split_q,
    Q,
    split_ongoing_reg,
    access_is_incr_q);
  output empty;
  output [0:0]SR;
  output [0:0]din;
  output m_axi_rready;
  output s_axi_rvalid;
  output s_axi_rlast;
  output S_AXI_AREADY_I_reg;
  output command_ongoing_reg;
  output aresetn_0;
  output [0:0]E;
  output m_axi_arvalid;
  input aclk;
  input rd_en;
  input s_axi_rready;
  input m_axi_rvalid;
  input m_axi_rlast;
  input command_ongoing_reg_0;
  input S_AXI_AREADY_I_reg_0;
  input s_axi_arvalid;
  input aresetn;
  input command_ongoing;
  input command_ongoing_reg_1;
  input m_axi_arready;
  input cmd_push_block;
  input need_to_split_q;
  input [3:0]Q;
  input [3:0]split_ongoing_reg;
  input access_is_incr_q;

  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;
  wire S_AXI_AREADY_I_i_3_n_0;
  wire S_AXI_AREADY_I_i_5_n_0;
  wire S_AXI_AREADY_I_reg;
  wire S_AXI_AREADY_I_reg_0;
  wire \USE_READ.USE_SPLIT_R.rd_cmd_split ;
  wire access_is_incr_q;
  wire aclk;
  wire aresetn;
  wire aresetn_0;
  wire cmd_push;
  wire cmd_push_block;
  wire command_ongoing;
  wire command_ongoing_reg;
  wire command_ongoing_reg_0;
  wire command_ongoing_reg_1;
  wire [0:0]din;
  wire empty;
  wire full;
  wire last_split__1;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire need_to_split_q;
  wire rd_en;
  wire s_axi_arvalid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [3:0]split_ongoing_reg;
  wire NLW_fifo_gen_inst_almost_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_almost_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_arvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_awvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_bready_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_rready_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_wlast_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_wvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axis_tlast_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axis_tvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_rd_rst_busy_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_arready_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_awready_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_bvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_rlast_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_rvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_wready_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axis_tready_UNCONNECTED;
  wire NLW_fifo_gen_inst_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_valid_UNCONNECTED;
  wire NLW_fifo_gen_inst_wr_ack_UNCONNECTED;
  wire NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axis_wr_data_count_UNCONNECTED;
  wire [5:0]NLW_fifo_gen_inst_data_count_UNCONNECTED;
  wire [31:0]NLW_fifo_gen_inst_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_arcache_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_fifo_gen_inst_m_axi_arlen_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_fifo_gen_inst_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_fifo_gen_inst_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_fifo_gen_inst_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_awcache_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_fifo_gen_inst_m_axi_awlen_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_fifo_gen_inst_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_fifo_gen_inst_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_fifo_gen_inst_m_axi_wdata_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_fifo_gen_inst_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_m_axi_wuser_UNCONNECTED;
  wire [63:0]NLW_fifo_gen_inst_m_axis_tdata_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axis_tdest_UNCONNECTED;
  wire [7:0]NLW_fifo_gen_inst_m_axis_tid_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axis_tkeep_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axis_tuser_UNCONNECTED;
  wire [5:0]NLW_fifo_gen_inst_rd_data_count_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_fifo_gen_inst_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_s_axi_ruser_UNCONNECTED;
  wire [5:0]NLW_fifo_gen_inst_wr_data_count_UNCONNECTED;

  LUT6 #(
    .INIT(64'h5575FF7500000000)) 
    S_AXI_AREADY_I_i_1
       (.I0(command_ongoing_reg_0),
        .I1(S_AXI_AREADY_I_i_3_n_0),
        .I2(last_split__1),
        .I3(S_AXI_AREADY_I_reg_0),
        .I4(s_axi_arvalid),
        .I5(aresetn),
        .O(S_AXI_AREADY_I_reg));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h5DFF)) 
    S_AXI_AREADY_I_i_3
       (.I0(command_ongoing),
        .I1(full),
        .I2(cmd_push_block),
        .I3(m_axi_arready),
        .O(S_AXI_AREADY_I_i_3_n_0));
  LUT6 #(
    .INIT(64'h82000082FFFFFFFF)) 
    S_AXI_AREADY_I_i_4
       (.I0(S_AXI_AREADY_I_i_5_n_0),
        .I1(Q[2]),
        .I2(split_ongoing_reg[2]),
        .I3(Q[3]),
        .I4(split_ongoing_reg[3]),
        .I5(access_is_incr_q),
        .O(last_split__1));
  LUT4 #(
    .INIT(16'h9009)) 
    S_AXI_AREADY_I_i_5
       (.I0(Q[0]),
        .I1(split_ongoing_reg[0]),
        .I2(Q[1]),
        .I3(split_ongoing_reg[1]),
        .O(S_AXI_AREADY_I_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \S_AXI_ASIZE_Q[2]_i_1 
       (.I0(aresetn),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h2022A0A0)) 
    cmd_push_block_i_1
       (.I0(aresetn),
        .I1(m_axi_arready),
        .I2(cmd_push_block),
        .I3(full),
        .I4(command_ongoing),
        .O(aresetn_0));
  LUT6 #(
    .INIT(64'h8AFFAAAA00000000)) 
    command_ongoing_i_1
       (.I0(command_ongoing),
        .I1(S_AXI_AREADY_I_i_3_n_0),
        .I2(last_split__1),
        .I3(command_ongoing_reg_1),
        .I4(command_ongoing_reg_0),
        .I5(aresetn),
        .O(command_ongoing_reg));
  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "64" *) 
  (* C_AXIS_TDEST_WIDTH = "4" *) 
  (* C_AXIS_TID_WIDTH = "8" *) 
  (* C_AXIS_TKEEP_WIDTH = "4" *) 
  (* C_AXIS_TSTRB_WIDTH = "4" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "2" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "0" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "6" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "1" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "32" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "1" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "0" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "0" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "0" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "0" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "2" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "31" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "30" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "6" *) 
  (* C_RD_DEPTH = "32" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "5" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "3" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "1" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "6" *) 
  (* C_WR_DEPTH = "32" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "5" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* is_du_within_envelope = "true" *) 
  cnn_system_axi_ic_hp1_imp_auto_pc_0_fifo_generator_v13_2_13 fifo_gen_inst
       (.almost_empty(NLW_fifo_gen_inst_almost_empty_UNCONNECTED),
        .almost_full(NLW_fifo_gen_inst_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_fifo_gen_inst_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_fifo_gen_inst_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_fifo_gen_inst_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_fifo_gen_inst_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_fifo_gen_inst_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_fifo_gen_inst_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_fifo_gen_inst_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_fifo_gen_inst_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_fifo_gen_inst_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_fifo_gen_inst_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_fifo_gen_inst_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_fifo_gen_inst_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_fifo_gen_inst_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_fifo_gen_inst_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_fifo_gen_inst_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_fifo_gen_inst_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_fifo_gen_inst_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_fifo_gen_inst_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_fifo_gen_inst_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_fifo_gen_inst_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_fifo_gen_inst_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_fifo_gen_inst_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_fifo_gen_inst_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_fifo_gen_inst_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_fifo_gen_inst_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_fifo_gen_inst_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_fifo_gen_inst_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_fifo_gen_inst_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_fifo_gen_inst_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_fifo_gen_inst_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_fifo_gen_inst_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_fifo_gen_inst_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_fifo_gen_inst_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_fifo_gen_inst_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_fifo_gen_inst_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_fifo_gen_inst_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_fifo_gen_inst_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_fifo_gen_inst_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_fifo_gen_inst_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_fifo_gen_inst_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_fifo_gen_inst_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_fifo_gen_inst_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_fifo_gen_inst_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_fifo_gen_inst_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_fifo_gen_inst_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_fifo_gen_inst_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_fifo_gen_inst_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_fifo_gen_inst_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_fifo_gen_inst_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_fifo_gen_inst_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_fifo_gen_inst_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_fifo_gen_inst_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_fifo_gen_inst_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_fifo_gen_inst_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(aclk),
        .data_count(NLW_fifo_gen_inst_data_count_UNCONNECTED[5:0]),
        .dbiterr(NLW_fifo_gen_inst_dbiterr_UNCONNECTED),
        .din(din),
        .dout(\USE_READ.USE_SPLIT_R.rd_cmd_split ),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_fifo_gen_inst_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_fifo_gen_inst_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_fifo_gen_inst_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_fifo_gen_inst_m_axi_arid_UNCONNECTED[3:0]),
        .m_axi_arlen(NLW_fifo_gen_inst_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_fifo_gen_inst_m_axi_arlock_UNCONNECTED[1:0]),
        .m_axi_arprot(NLW_fifo_gen_inst_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_fifo_gen_inst_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_fifo_gen_inst_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_fifo_gen_inst_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_fifo_gen_inst_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_fifo_gen_inst_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_fifo_gen_inst_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_fifo_gen_inst_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_fifo_gen_inst_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_fifo_gen_inst_m_axi_awid_UNCONNECTED[3:0]),
        .m_axi_awlen(NLW_fifo_gen_inst_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_fifo_gen_inst_m_axi_awlock_UNCONNECTED[1:0]),
        .m_axi_awprot(NLW_fifo_gen_inst_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_fifo_gen_inst_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_fifo_gen_inst_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_fifo_gen_inst_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_fifo_gen_inst_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_fifo_gen_inst_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid({1'b0,1'b0,1'b0,1'b0}),
        .m_axi_bready(NLW_fifo_gen_inst_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid({1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_fifo_gen_inst_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_fifo_gen_inst_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_fifo_gen_inst_m_axi_wid_UNCONNECTED[3:0]),
        .m_axi_wlast(NLW_fifo_gen_inst_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_fifo_gen_inst_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_fifo_gen_inst_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_fifo_gen_inst_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_fifo_gen_inst_m_axis_tdata_UNCONNECTED[63:0]),
        .m_axis_tdest(NLW_fifo_gen_inst_m_axis_tdest_UNCONNECTED[3:0]),
        .m_axis_tid(NLW_fifo_gen_inst_m_axis_tid_UNCONNECTED[7:0]),
        .m_axis_tkeep(NLW_fifo_gen_inst_m_axis_tkeep_UNCONNECTED[3:0]),
        .m_axis_tlast(NLW_fifo_gen_inst_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_fifo_gen_inst_m_axis_tstrb_UNCONNECTED[3:0]),
        .m_axis_tuser(NLW_fifo_gen_inst_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_fifo_gen_inst_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_fifo_gen_inst_overflow_UNCONNECTED),
        .prog_empty(NLW_fifo_gen_inst_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_fifo_gen_inst_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_fifo_gen_inst_rd_data_count_UNCONNECTED[5:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_fifo_gen_inst_rd_rst_busy_UNCONNECTED),
        .rst(SR),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock({1'b0,1'b0}),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_fifo_gen_inst_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock({1'b0,1'b0}),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_fifo_gen_inst_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_fifo_gen_inst_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_fifo_gen_inst_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_fifo_gen_inst_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_fifo_gen_inst_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_fifo_gen_inst_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_fifo_gen_inst_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_fifo_gen_inst_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_fifo_gen_inst_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_fifo_gen_inst_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_fifo_gen_inst_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_fifo_gen_inst_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tkeep({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_fifo_gen_inst_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_fifo_gen_inst_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_fifo_gen_inst_underflow_UNCONNECTED),
        .valid(NLW_fifo_gen_inst_valid_UNCONNECTED),
        .wr_ack(NLW_fifo_gen_inst_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_fifo_gen_inst_wr_data_count_UNCONNECTED[5:0]),
        .wr_en(cmd_push),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED));
  LUT2 #(
    .INIT(4'h2)) 
    fifo_gen_inst_i_1
       (.I0(need_to_split_q),
        .I1(last_split__1),
        .O(din));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h02)) 
    fifo_gen_inst_i_2
       (.I0(command_ongoing),
        .I1(full),
        .I2(cmd_push_block),
        .O(cmd_push));
  LUT3 #(
    .INIT(8'hB0)) 
    m_axi_arvalid_INST_0
       (.I0(cmd_push_block),
        .I1(full),
        .I2(command_ongoing),
        .O(m_axi_arvalid));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h0B)) 
    m_axi_rready_INST_0
       (.I0(s_axi_rready),
        .I1(m_axi_rvalid),
        .I2(empty),
        .O(m_axi_rready));
  LUT2 #(
    .INIT(4'h2)) 
    s_axi_rlast_INST_0
       (.I0(m_axi_rlast),
        .I1(\USE_READ.USE_SPLIT_R.rd_cmd_split ),
        .O(s_axi_rlast));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s_axi_rvalid_INST_0
       (.I0(m_axi_rvalid),
        .I1(empty),
        .O(s_axi_rvalid));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8A00)) 
    split_ongoing_i_1
       (.I0(m_axi_arready),
        .I1(cmd_push_block),
        .I2(full),
        .I3(command_ongoing),
        .O(E));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_36_a_axi3_conv" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_0_axi_protocol_converter_v2_1_36_a_axi3_conv
   (empty,
    E,
    m_axi_rready,
    s_axi_rvalid,
    s_axi_rlast,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_araddr,
    m_axi_arvalid,
    m_axi_arlen,
    m_axi_arlock,
    aclk,
    rd_en,
    s_axi_arlock,
    s_axi_rready,
    m_axi_rvalid,
    s_axi_arsize,
    s_axi_arlen,
    m_axi_rlast,
    s_axi_arvalid,
    aresetn,
    s_axi_araddr,
    s_axi_arburst,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    m_axi_arready);
  output empty;
  output [0:0]E;
  output m_axi_rready;
  output s_axi_rvalid;
  output s_axi_rlast;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [31:0]m_axi_araddr;
  output m_axi_arvalid;
  output [3:0]m_axi_arlen;
  output [0:0]m_axi_arlock;
  input aclk;
  input rd_en;
  input [0:0]s_axi_arlock;
  input s_axi_rready;
  input m_axi_rvalid;
  input [2:0]s_axi_arsize;
  input [7:0]s_axi_arlen;
  input m_axi_rlast;
  input s_axi_arvalid;
  input aresetn;
  input [31:0]s_axi_araddr;
  input [1:0]s_axi_arburst;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input m_axi_arready;

  wire [0:0]E;
  wire M_AXI_AADDR_I1__0;
  wire [31:0]S_AXI_AADDR_Q;
  wire [3:0]S_AXI_ALEN_Q;
  wire \S_AXI_ALOCK_Q_reg_n_0_[0] ;
  wire S_AXI_AREADY_I_i_2_n_0;
  wire \USE_R_CHANNEL.cmd_queue_n_1 ;
  wire \USE_R_CHANNEL.cmd_queue_n_6 ;
  wire \USE_R_CHANNEL.cmd_queue_n_7 ;
  wire \USE_R_CHANNEL.cmd_queue_n_8 ;
  wire access_is_incr;
  wire access_is_incr_q;
  wire aclk;
  wire [11:5]addr_step;
  wire [11:5]addr_step_q;
  wire \addr_step_q[6]_i_1_n_0 ;
  wire \addr_step_q[7]_i_1_n_0 ;
  wire \addr_step_q[8]_i_1_n_0 ;
  wire \addr_step_q[9]_i_1_n_0 ;
  wire [1:0]areset_d;
  wire aresetn;
  wire cmd_push_block;
  wire cmd_split_i;
  wire command_ongoing;
  wire command_ongoing_i_2_n_0;
  wire empty;
  wire first_split__2;
  wire [11:4]first_step;
  wire [11:0]first_step_q;
  wire \first_step_q[0]_i_1_n_0 ;
  wire \first_step_q[10]_i_2_n_0 ;
  wire \first_step_q[11]_i_2_n_0 ;
  wire \first_step_q[1]_i_1_n_0 ;
  wire \first_step_q[2]_i_1_n_0 ;
  wire \first_step_q[3]_i_1_n_0 ;
  wire \first_step_q[6]_i_2_n_0 ;
  wire \first_step_q[7]_i_2_n_0 ;
  wire \first_step_q[8]_i_2_n_0 ;
  wire \first_step_q[9]_i_2_n_0 ;
  wire incr_need_to_split__0;
  wire [31:0]m_axi_araddr;
  wire [1:0]m_axi_arburst;
  wire [3:0]m_axi_arcache;
  wire [3:0]m_axi_arlen;
  wire [0:0]m_axi_arlock;
  wire [2:0]m_axi_arprot;
  wire [3:0]m_axi_arqos;
  wire m_axi_arready;
  wire [2:0]m_axi_arsize;
  wire m_axi_arvalid;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire need_to_split_q;
  wire [31:0]next_mi_addr;
  wire \next_mi_addr[11]_i_2_n_0 ;
  wire \next_mi_addr[11]_i_3_n_0 ;
  wire \next_mi_addr[11]_i_4_n_0 ;
  wire \next_mi_addr[11]_i_5_n_0 ;
  wire \next_mi_addr[15]_i_2_n_0 ;
  wire \next_mi_addr[15]_i_3_n_0 ;
  wire \next_mi_addr[15]_i_4_n_0 ;
  wire \next_mi_addr[15]_i_5_n_0 ;
  wire \next_mi_addr[15]_i_6_n_0 ;
  wire \next_mi_addr[15]_i_7_n_0 ;
  wire \next_mi_addr[15]_i_8_n_0 ;
  wire \next_mi_addr[15]_i_9_n_0 ;
  wire \next_mi_addr[19]_i_2_n_0 ;
  wire \next_mi_addr[19]_i_3_n_0 ;
  wire \next_mi_addr[19]_i_4_n_0 ;
  wire \next_mi_addr[19]_i_5_n_0 ;
  wire \next_mi_addr[23]_i_2_n_0 ;
  wire \next_mi_addr[23]_i_3_n_0 ;
  wire \next_mi_addr[23]_i_4_n_0 ;
  wire \next_mi_addr[23]_i_5_n_0 ;
  wire \next_mi_addr[27]_i_2_n_0 ;
  wire \next_mi_addr[27]_i_3_n_0 ;
  wire \next_mi_addr[27]_i_4_n_0 ;
  wire \next_mi_addr[27]_i_5_n_0 ;
  wire \next_mi_addr[31]_i_2_n_0 ;
  wire \next_mi_addr[31]_i_3_n_0 ;
  wire \next_mi_addr[31]_i_4_n_0 ;
  wire \next_mi_addr[31]_i_5_n_0 ;
  wire \next_mi_addr[3]_i_2_n_0 ;
  wire \next_mi_addr[3]_i_3_n_0 ;
  wire \next_mi_addr[3]_i_4_n_0 ;
  wire \next_mi_addr[3]_i_5_n_0 ;
  wire \next_mi_addr[7]_i_2_n_0 ;
  wire \next_mi_addr[7]_i_3_n_0 ;
  wire \next_mi_addr[7]_i_4_n_0 ;
  wire \next_mi_addr[7]_i_5_n_0 ;
  wire \next_mi_addr_reg[11]_i_1_n_0 ;
  wire \next_mi_addr_reg[11]_i_1_n_1 ;
  wire \next_mi_addr_reg[11]_i_1_n_2 ;
  wire \next_mi_addr_reg[11]_i_1_n_3 ;
  wire \next_mi_addr_reg[11]_i_1_n_4 ;
  wire \next_mi_addr_reg[11]_i_1_n_5 ;
  wire \next_mi_addr_reg[11]_i_1_n_6 ;
  wire \next_mi_addr_reg[11]_i_1_n_7 ;
  wire \next_mi_addr_reg[15]_i_1_n_0 ;
  wire \next_mi_addr_reg[15]_i_1_n_1 ;
  wire \next_mi_addr_reg[15]_i_1_n_2 ;
  wire \next_mi_addr_reg[15]_i_1_n_3 ;
  wire \next_mi_addr_reg[15]_i_1_n_4 ;
  wire \next_mi_addr_reg[15]_i_1_n_5 ;
  wire \next_mi_addr_reg[15]_i_1_n_6 ;
  wire \next_mi_addr_reg[15]_i_1_n_7 ;
  wire \next_mi_addr_reg[19]_i_1_n_0 ;
  wire \next_mi_addr_reg[19]_i_1_n_1 ;
  wire \next_mi_addr_reg[19]_i_1_n_2 ;
  wire \next_mi_addr_reg[19]_i_1_n_3 ;
  wire \next_mi_addr_reg[19]_i_1_n_4 ;
  wire \next_mi_addr_reg[19]_i_1_n_5 ;
  wire \next_mi_addr_reg[19]_i_1_n_6 ;
  wire \next_mi_addr_reg[19]_i_1_n_7 ;
  wire \next_mi_addr_reg[23]_i_1_n_0 ;
  wire \next_mi_addr_reg[23]_i_1_n_1 ;
  wire \next_mi_addr_reg[23]_i_1_n_2 ;
  wire \next_mi_addr_reg[23]_i_1_n_3 ;
  wire \next_mi_addr_reg[23]_i_1_n_4 ;
  wire \next_mi_addr_reg[23]_i_1_n_5 ;
  wire \next_mi_addr_reg[23]_i_1_n_6 ;
  wire \next_mi_addr_reg[23]_i_1_n_7 ;
  wire \next_mi_addr_reg[27]_i_1_n_0 ;
  wire \next_mi_addr_reg[27]_i_1_n_1 ;
  wire \next_mi_addr_reg[27]_i_1_n_2 ;
  wire \next_mi_addr_reg[27]_i_1_n_3 ;
  wire \next_mi_addr_reg[27]_i_1_n_4 ;
  wire \next_mi_addr_reg[27]_i_1_n_5 ;
  wire \next_mi_addr_reg[27]_i_1_n_6 ;
  wire \next_mi_addr_reg[27]_i_1_n_7 ;
  wire \next_mi_addr_reg[31]_i_1_n_1 ;
  wire \next_mi_addr_reg[31]_i_1_n_2 ;
  wire \next_mi_addr_reg[31]_i_1_n_3 ;
  wire \next_mi_addr_reg[31]_i_1_n_4 ;
  wire \next_mi_addr_reg[31]_i_1_n_5 ;
  wire \next_mi_addr_reg[31]_i_1_n_6 ;
  wire \next_mi_addr_reg[31]_i_1_n_7 ;
  wire \next_mi_addr_reg[3]_i_1_n_0 ;
  wire \next_mi_addr_reg[3]_i_1_n_1 ;
  wire \next_mi_addr_reg[3]_i_1_n_2 ;
  wire \next_mi_addr_reg[3]_i_1_n_3 ;
  wire \next_mi_addr_reg[3]_i_1_n_4 ;
  wire \next_mi_addr_reg[3]_i_1_n_5 ;
  wire \next_mi_addr_reg[3]_i_1_n_6 ;
  wire \next_mi_addr_reg[3]_i_1_n_7 ;
  wire \next_mi_addr_reg[7]_i_1_n_0 ;
  wire \next_mi_addr_reg[7]_i_1_n_1 ;
  wire \next_mi_addr_reg[7]_i_1_n_2 ;
  wire \next_mi_addr_reg[7]_i_1_n_3 ;
  wire \next_mi_addr_reg[7]_i_1_n_4 ;
  wire \next_mi_addr_reg[7]_i_1_n_5 ;
  wire \next_mi_addr_reg[7]_i_1_n_6 ;
  wire \next_mi_addr_reg[7]_i_1_n_7 ;
  wire [3:0]num_transactions_q;
  wire [3:0]p_0_in;
  wire \pushed_commands[3]_i_1_n_0 ;
  wire [3:0]pushed_commands_reg;
  wire pushed_new_cmd;
  wire rd_en;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [6:0]size_mask;
  wire [31:0]size_mask_q;
  wire split_ongoing;
  wire [3:3]\NLW_next_mi_addr_reg[31]_i_1_CO_UNCONNECTED ;

  FDRE \S_AXI_AADDR_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[0]),
        .Q(S_AXI_AADDR_Q[0]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[10]),
        .Q(S_AXI_AADDR_Q[10]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[11]),
        .Q(S_AXI_AADDR_Q[11]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[12] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[12]),
        .Q(S_AXI_AADDR_Q[12]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[13] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[13]),
        .Q(S_AXI_AADDR_Q[13]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[14] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[14]),
        .Q(S_AXI_AADDR_Q[14]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[15] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[15]),
        .Q(S_AXI_AADDR_Q[15]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[16] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[16]),
        .Q(S_AXI_AADDR_Q[16]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[17] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[17]),
        .Q(S_AXI_AADDR_Q[17]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[18] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[18]),
        .Q(S_AXI_AADDR_Q[18]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[19] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[19]),
        .Q(S_AXI_AADDR_Q[19]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[1]),
        .Q(S_AXI_AADDR_Q[1]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[20] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[20]),
        .Q(S_AXI_AADDR_Q[20]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[21] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[21]),
        .Q(S_AXI_AADDR_Q[21]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[22] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[22]),
        .Q(S_AXI_AADDR_Q[22]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[23] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[23]),
        .Q(S_AXI_AADDR_Q[23]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[24] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[24]),
        .Q(S_AXI_AADDR_Q[24]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[25] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[25]),
        .Q(S_AXI_AADDR_Q[25]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[26] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[26]),
        .Q(S_AXI_AADDR_Q[26]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[27] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[27]),
        .Q(S_AXI_AADDR_Q[27]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[28] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[28]),
        .Q(S_AXI_AADDR_Q[28]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[29] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[29]),
        .Q(S_AXI_AADDR_Q[29]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[2]),
        .Q(S_AXI_AADDR_Q[2]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[30] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[30]),
        .Q(S_AXI_AADDR_Q[30]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[31]),
        .Q(S_AXI_AADDR_Q[31]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[3]),
        .Q(S_AXI_AADDR_Q[3]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[4]),
        .Q(S_AXI_AADDR_Q[4]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[5]),
        .Q(S_AXI_AADDR_Q[5]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[6]),
        .Q(S_AXI_AADDR_Q[6]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[7]),
        .Q(S_AXI_AADDR_Q[7]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[8]),
        .Q(S_AXI_AADDR_Q[8]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AADDR_Q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[9]),
        .Q(S_AXI_AADDR_Q[9]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ABURST_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arburst[0]),
        .Q(m_axi_arburst[0]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ABURST_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arburst[1]),
        .Q(m_axi_arburst[1]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ACACHE_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arcache[0]),
        .Q(m_axi_arcache[0]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ACACHE_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arcache[1]),
        .Q(m_axi_arcache[1]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ACACHE_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arcache[2]),
        .Q(m_axi_arcache[2]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ACACHE_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arcache[3]),
        .Q(m_axi_arcache[3]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ALEN_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[0]),
        .Q(S_AXI_ALEN_Q[0]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ALEN_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[1]),
        .Q(S_AXI_ALEN_Q[1]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ALEN_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[2]),
        .Q(S_AXI_ALEN_Q[2]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ALEN_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[3]),
        .Q(S_AXI_ALEN_Q[3]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ALOCK_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlock),
        .Q(\S_AXI_ALOCK_Q_reg_n_0_[0] ),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_APROT_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arprot[0]),
        .Q(m_axi_arprot[0]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_APROT_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arprot[1]),
        .Q(m_axi_arprot[1]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_APROT_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arprot[2]),
        .Q(m_axi_arprot[2]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AQOS_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arqos[0]),
        .Q(m_axi_arqos[0]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AQOS_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arqos[1]),
        .Q(m_axi_arqos[1]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AQOS_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arqos[2]),
        .Q(m_axi_arqos[2]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_AQOS_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arqos[3]),
        .Q(m_axi_arqos[3]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  LUT2 #(
    .INIT(4'hB)) 
    S_AXI_AREADY_I_i_2
       (.I0(areset_d[0]),
        .I1(areset_d[1]),
        .O(S_AXI_AREADY_I_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    S_AXI_AREADY_I_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_R_CHANNEL.cmd_queue_n_6 ),
        .Q(E),
        .R(1'b0));
  FDRE \S_AXI_ASIZE_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arsize[0]),
        .Q(m_axi_arsize[0]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ASIZE_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arsize[1]),
        .Q(m_axi_arsize[1]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE \S_AXI_ASIZE_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arsize[2]),
        .Q(m_axi_arsize[2]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  cnn_system_axi_ic_hp1_imp_auto_pc_0_axi_data_fifo_v2_1_35_axic_fifo \USE_R_CHANNEL.cmd_queue 
       (.E(pushed_new_cmd),
        .Q(num_transactions_q),
        .SR(\USE_R_CHANNEL.cmd_queue_n_1 ),
        .S_AXI_AREADY_I_reg(\USE_R_CHANNEL.cmd_queue_n_6 ),
        .S_AXI_AREADY_I_reg_0(E),
        .access_is_incr_q(access_is_incr_q),
        .aclk(aclk),
        .aresetn(aresetn),
        .aresetn_0(\USE_R_CHANNEL.cmd_queue_n_8 ),
        .cmd_push_block(cmd_push_block),
        .command_ongoing(command_ongoing),
        .command_ongoing_reg(\USE_R_CHANNEL.cmd_queue_n_7 ),
        .command_ongoing_reg_0(S_AXI_AREADY_I_i_2_n_0),
        .command_ongoing_reg_1(command_ongoing_i_2_n_0),
        .din(cmd_split_i),
        .empty(empty),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .need_to_split_q(need_to_split_q),
        .rd_en(rd_en),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .split_ongoing_reg(pushed_commands_reg));
  LUT2 #(
    .INIT(4'h2)) 
    access_is_incr_q_i_1
       (.I0(s_axi_arburst[0]),
        .I1(s_axi_arburst[1]),
        .O(access_is_incr));
  FDRE #(
    .INIT(1'b0)) 
    access_is_incr_q_reg
       (.C(aclk),
        .CE(E),
        .D(access_is_incr),
        .Q(access_is_incr_q),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \addr_step_q[10]_i_1 
       (.I0(s_axi_arsize[0]),
        .I1(s_axi_arsize[2]),
        .I2(s_axi_arsize[1]),
        .O(addr_step[10]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \addr_step_q[11]_i_1 
       (.I0(s_axi_arsize[2]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arsize[1]),
        .O(addr_step[11]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addr_step_q[5]_i_1 
       (.I0(s_axi_arsize[0]),
        .I1(s_axi_arsize[2]),
        .I2(s_axi_arsize[1]),
        .O(addr_step[5]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addr_step_q[6]_i_1 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arsize[2]),
        .O(\addr_step_q[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \addr_step_q[7]_i_1 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arsize[2]),
        .O(\addr_step_q[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addr_step_q[8]_i_1 
       (.I0(s_axi_arsize[2]),
        .I1(s_axi_arsize[1]),
        .I2(s_axi_arsize[0]),
        .O(\addr_step_q[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \addr_step_q[9]_i_1 
       (.I0(s_axi_arsize[0]),
        .I1(s_axi_arsize[2]),
        .I2(s_axi_arsize[1]),
        .O(\addr_step_q[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(addr_step[10]),
        .Q(addr_step_q[10]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(addr_step[11]),
        .Q(addr_step_q[11]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(addr_step[5]),
        .Q(addr_step_q[5]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[6]_i_1_n_0 ),
        .Q(addr_step_q[6]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[7]_i_1_n_0 ),
        .Q(addr_step_q[7]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[8]_i_1_n_0 ),
        .Q(addr_step_q[8]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[9]_i_1_n_0 ),
        .Q(addr_step_q[9]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \areset_d_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_R_CHANNEL.cmd_queue_n_1 ),
        .Q(areset_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \areset_d_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(areset_d[0]),
        .Q(areset_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    cmd_push_block_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_R_CHANNEL.cmd_queue_n_8 ),
        .Q(cmd_push_block),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h7)) 
    command_ongoing_i_2
       (.I0(s_axi_arvalid),
        .I1(E),
        .O(command_ongoing_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    command_ongoing_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_R_CHANNEL.cmd_queue_n_7 ),
        .Q(command_ongoing),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \first_step_q[0]_i_1 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arlen[0]),
        .I3(s_axi_arsize[2]),
        .O(\first_step_q[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \first_step_q[10]_i_1 
       (.I0(s_axi_arsize[2]),
        .I1(\first_step_q[10]_i_2_n_0 ),
        .O(first_step[10]));
  LUT6 #(
    .INIT(64'h2AAA800080000000)) 
    \first_step_q[10]_i_2 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arlen[2]),
        .I2(s_axi_arlen[0]),
        .I3(s_axi_arlen[1]),
        .I4(s_axi_arlen[3]),
        .I5(s_axi_arsize[0]),
        .O(\first_step_q[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \first_step_q[11]_i_1 
       (.I0(s_axi_arsize[2]),
        .I1(\first_step_q[11]_i_2_n_0 ),
        .O(first_step[11]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \first_step_q[11]_i_2 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arlen[3]),
        .I2(s_axi_arlen[1]),
        .I3(s_axi_arlen[0]),
        .I4(s_axi_arlen[2]),
        .I5(s_axi_arsize[0]),
        .O(\first_step_q[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00000514)) 
    \first_step_q[1]_i_1 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arlen[0]),
        .I3(s_axi_arlen[1]),
        .I4(s_axi_arsize[2]),
        .O(\first_step_q[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000000F3C6A)) 
    \first_step_q[2]_i_1 
       (.I0(s_axi_arlen[2]),
        .I1(s_axi_arlen[1]),
        .I2(s_axi_arlen[0]),
        .I3(s_axi_arsize[0]),
        .I4(s_axi_arsize[1]),
        .I5(s_axi_arsize[2]),
        .O(\first_step_q[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \first_step_q[3]_i_1 
       (.I0(\first_step_q[7]_i_2_n_0 ),
        .I1(s_axi_arsize[2]),
        .O(\first_step_q[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h01FF0100)) 
    \first_step_q[4]_i_1 
       (.I0(s_axi_arlen[0]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arsize[1]),
        .I3(s_axi_arsize[2]),
        .I4(\first_step_q[8]_i_2_n_0 ),
        .O(first_step[4]));
  LUT6 #(
    .INIT(64'h0036FFFF00360000)) 
    \first_step_q[5]_i_1 
       (.I0(s_axi_arlen[1]),
        .I1(s_axi_arlen[0]),
        .I2(s_axi_arsize[0]),
        .I3(s_axi_arsize[1]),
        .I4(s_axi_arsize[2]),
        .I5(\first_step_q[9]_i_2_n_0 ),
        .O(first_step[5]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \first_step_q[6]_i_1 
       (.I0(\first_step_q[6]_i_2_n_0 ),
        .I1(s_axi_arsize[2]),
        .I2(\first_step_q[10]_i_2_n_0 ),
        .O(first_step[6]));
  LUT5 #(
    .INIT(32'h07531642)) 
    \first_step_q[6]_i_2 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arlen[0]),
        .I3(s_axi_arlen[1]),
        .I4(s_axi_arlen[2]),
        .O(\first_step_q[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \first_step_q[7]_i_1 
       (.I0(\first_step_q[7]_i_2_n_0 ),
        .I1(s_axi_arsize[2]),
        .I2(\first_step_q[11]_i_2_n_0 ),
        .O(first_step[7]));
  LUT6 #(
    .INIT(64'h07FD53B916EC42A8)) 
    \first_step_q[7]_i_2 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arlen[1]),
        .I3(s_axi_arlen[0]),
        .I4(s_axi_arlen[2]),
        .I5(s_axi_arlen[3]),
        .O(\first_step_q[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \first_step_q[8]_i_1 
       (.I0(s_axi_arsize[2]),
        .I1(\first_step_q[8]_i_2_n_0 ),
        .O(first_step[8]));
  LUT6 #(
    .INIT(64'h14EAEA6262C8C840)) 
    \first_step_q[8]_i_2 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arlen[3]),
        .I3(s_axi_arlen[1]),
        .I4(s_axi_arlen[0]),
        .I5(s_axi_arlen[2]),
        .O(\first_step_q[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \first_step_q[9]_i_1 
       (.I0(s_axi_arsize[2]),
        .I1(\first_step_q[9]_i_2_n_0 ),
        .O(first_step[9]));
  LUT6 #(
    .INIT(64'h4AA2A2A228808080)) 
    \first_step_q[9]_i_2 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arlen[2]),
        .I3(s_axi_arlen[0]),
        .I4(s_axi_arlen[1]),
        .I5(s_axi_arlen[3]),
        .O(\first_step_q[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[0]_i_1_n_0 ),
        .Q(first_step_q[0]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(first_step[10]),
        .Q(first_step_q[10]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(first_step[11]),
        .Q(first_step_q[11]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[1]_i_1_n_0 ),
        .Q(first_step_q[1]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[2]_i_1_n_0 ),
        .Q(first_step_q[2]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[3]_i_1_n_0 ),
        .Q(first_step_q[3]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(first_step[4]),
        .Q(first_step_q[4]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(first_step[5]),
        .Q(first_step_q[5]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(first_step[6]),
        .Q(first_step_q[6]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(first_step[7]),
        .Q(first_step_q[7]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(first_step[8]),
        .Q(first_step_q[8]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(first_step[9]),
        .Q(first_step_q[9]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  LUT6 #(
    .INIT(64'h4444444444444440)) 
    incr_need_to_split
       (.I0(s_axi_arburst[1]),
        .I1(s_axi_arburst[0]),
        .I2(s_axi_arlen[5]),
        .I3(s_axi_arlen[4]),
        .I4(s_axi_arlen[6]),
        .I5(s_axi_arlen[7]),
        .O(incr_need_to_split__0));
  FDRE #(
    .INIT(1'b0)) 
    incr_need_to_split_q_reg
       (.C(aclk),
        .CE(E),
        .D(incr_need_to_split__0),
        .Q(need_to_split_q),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[0]_INST_0 
       (.I0(next_mi_addr[0]),
        .I1(size_mask_q[0]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[0]),
        .O(m_axi_araddr[0]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[10]_INST_0 
       (.I0(next_mi_addr[10]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[10]),
        .O(m_axi_araddr[10]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[11]_INST_0 
       (.I0(next_mi_addr[11]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[11]),
        .O(m_axi_araddr[11]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[12]_INST_0 
       (.I0(next_mi_addr[12]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[12]),
        .O(m_axi_araddr[12]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[13]_INST_0 
       (.I0(next_mi_addr[13]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[13]),
        .O(m_axi_araddr[13]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[14]_INST_0 
       (.I0(next_mi_addr[14]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[14]),
        .O(m_axi_araddr[14]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[15]_INST_0 
       (.I0(next_mi_addr[15]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[15]),
        .O(m_axi_araddr[15]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[16]_INST_0 
       (.I0(next_mi_addr[16]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[16]),
        .O(m_axi_araddr[16]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[17]_INST_0 
       (.I0(next_mi_addr[17]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[17]),
        .O(m_axi_araddr[17]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[18]_INST_0 
       (.I0(next_mi_addr[18]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[18]),
        .O(m_axi_araddr[18]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[19]_INST_0 
       (.I0(next_mi_addr[19]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[19]),
        .O(m_axi_araddr[19]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[1]_INST_0 
       (.I0(next_mi_addr[1]),
        .I1(size_mask_q[1]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[1]),
        .O(m_axi_araddr[1]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[20]_INST_0 
       (.I0(next_mi_addr[20]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[20]),
        .O(m_axi_araddr[20]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[21]_INST_0 
       (.I0(next_mi_addr[21]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[21]),
        .O(m_axi_araddr[21]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[22]_INST_0 
       (.I0(next_mi_addr[22]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[22]),
        .O(m_axi_araddr[22]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[23]_INST_0 
       (.I0(next_mi_addr[23]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[23]),
        .O(m_axi_araddr[23]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[24]_INST_0 
       (.I0(next_mi_addr[24]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[24]),
        .O(m_axi_araddr[24]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[25]_INST_0 
       (.I0(next_mi_addr[25]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[25]),
        .O(m_axi_araddr[25]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[26]_INST_0 
       (.I0(next_mi_addr[26]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[26]),
        .O(m_axi_araddr[26]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[27]_INST_0 
       (.I0(next_mi_addr[27]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[27]),
        .O(m_axi_araddr[27]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[28]_INST_0 
       (.I0(next_mi_addr[28]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[28]),
        .O(m_axi_araddr[28]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[29]_INST_0 
       (.I0(next_mi_addr[29]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[29]),
        .O(m_axi_araddr[29]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[2]_INST_0 
       (.I0(next_mi_addr[2]),
        .I1(size_mask_q[2]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[2]),
        .O(m_axi_araddr[2]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[30]_INST_0 
       (.I0(next_mi_addr[30]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[30]),
        .O(m_axi_araddr[30]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[31]_INST_0 
       (.I0(next_mi_addr[31]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[31]),
        .O(m_axi_araddr[31]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[3]_INST_0 
       (.I0(next_mi_addr[3]),
        .I1(size_mask_q[3]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[3]),
        .O(m_axi_araddr[3]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[4]_INST_0 
       (.I0(next_mi_addr[4]),
        .I1(size_mask_q[4]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[4]),
        .O(m_axi_araddr[4]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[5]_INST_0 
       (.I0(next_mi_addr[5]),
        .I1(size_mask_q[5]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[5]),
        .O(m_axi_araddr[5]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[6]_INST_0 
       (.I0(next_mi_addr[6]),
        .I1(size_mask_q[6]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[6]),
        .O(m_axi_araddr[6]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[7]_INST_0 
       (.I0(next_mi_addr[7]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[7]),
        .O(m_axi_araddr[7]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[8]_INST_0 
       (.I0(next_mi_addr[8]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[8]),
        .O(m_axi_araddr[8]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[9]_INST_0 
       (.I0(next_mi_addr[9]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[9]),
        .O(m_axi_araddr[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    \m_axi_arlen[0]_INST_0 
       (.I0(pushed_commands_reg[1]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[3]),
        .I3(pushed_commands_reg[2]),
        .I4(need_to_split_q),
        .I5(S_AXI_ALEN_Q[0]),
        .O(m_axi_arlen[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    \m_axi_arlen[1]_INST_0 
       (.I0(pushed_commands_reg[1]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[3]),
        .I3(pushed_commands_reg[2]),
        .I4(need_to_split_q),
        .I5(S_AXI_ALEN_Q[1]),
        .O(m_axi_arlen[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    \m_axi_arlen[2]_INST_0 
       (.I0(pushed_commands_reg[1]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[3]),
        .I3(pushed_commands_reg[2]),
        .I4(need_to_split_q),
        .I5(S_AXI_ALEN_Q[2]),
        .O(m_axi_arlen[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    \m_axi_arlen[3]_INST_0 
       (.I0(pushed_commands_reg[1]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[3]),
        .I3(pushed_commands_reg[2]),
        .I4(need_to_split_q),
        .I5(S_AXI_ALEN_Q[3]),
        .O(m_axi_arlen[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \m_axi_arlock[0]_INST_0 
       (.I0(\S_AXI_ALOCK_Q_reg_n_0_[0] ),
        .I1(need_to_split_q),
        .O(m_axi_arlock));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_2 
       (.I0(m_axi_araddr[11]),
        .I1(addr_step_q[11]),
        .I2(first_split__2),
        .I3(first_step_q[11]),
        .O(\next_mi_addr[11]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_3 
       (.I0(m_axi_araddr[10]),
        .I1(addr_step_q[10]),
        .I2(first_split__2),
        .I3(first_step_q[10]),
        .O(\next_mi_addr[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_4 
       (.I0(m_axi_araddr[9]),
        .I1(addr_step_q[9]),
        .I2(first_split__2),
        .I3(first_step_q[9]),
        .O(\next_mi_addr[11]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_5 
       (.I0(m_axi_araddr[8]),
        .I1(addr_step_q[8]),
        .I2(first_split__2),
        .I3(first_step_q[8]),
        .O(\next_mi_addr[11]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \next_mi_addr[11]_i_6 
       (.I0(pushed_commands_reg[1]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[3]),
        .I3(pushed_commands_reg[2]),
        .O(first_split__2));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[15]_i_2 
       (.I0(next_mi_addr[15]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[15]),
        .O(\next_mi_addr[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[15]_i_3 
       (.I0(next_mi_addr[14]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[14]),
        .O(\next_mi_addr[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[15]_i_4 
       (.I0(next_mi_addr[13]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[13]),
        .O(\next_mi_addr[15]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[15]_i_5 
       (.I0(next_mi_addr[12]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[12]),
        .O(\next_mi_addr[15]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[15]_i_6 
       (.I0(next_mi_addr[15]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[15]),
        .O(\next_mi_addr[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[15]_i_7 
       (.I0(next_mi_addr[14]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[14]),
        .O(\next_mi_addr[15]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[15]_i_8 
       (.I0(next_mi_addr[13]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[13]),
        .O(\next_mi_addr[15]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[15]_i_9 
       (.I0(next_mi_addr[12]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[12]),
        .O(\next_mi_addr[15]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[19]_i_2 
       (.I0(next_mi_addr[19]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[19]),
        .O(\next_mi_addr[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[19]_i_3 
       (.I0(next_mi_addr[18]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[18]),
        .O(\next_mi_addr[19]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[19]_i_4 
       (.I0(next_mi_addr[17]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[17]),
        .O(\next_mi_addr[19]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[19]_i_5 
       (.I0(next_mi_addr[16]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[16]),
        .O(\next_mi_addr[19]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[23]_i_2 
       (.I0(next_mi_addr[23]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[23]),
        .O(\next_mi_addr[23]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[23]_i_3 
       (.I0(next_mi_addr[22]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[22]),
        .O(\next_mi_addr[23]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[23]_i_4 
       (.I0(next_mi_addr[21]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[21]),
        .O(\next_mi_addr[23]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[23]_i_5 
       (.I0(next_mi_addr[20]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[20]),
        .O(\next_mi_addr[23]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[27]_i_2 
       (.I0(next_mi_addr[27]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[27]),
        .O(\next_mi_addr[27]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[27]_i_3 
       (.I0(next_mi_addr[26]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[26]),
        .O(\next_mi_addr[27]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[27]_i_4 
       (.I0(next_mi_addr[25]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[25]),
        .O(\next_mi_addr[27]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[27]_i_5 
       (.I0(next_mi_addr[24]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[24]),
        .O(\next_mi_addr[27]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[31]_i_2 
       (.I0(next_mi_addr[31]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[31]),
        .O(\next_mi_addr[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[31]_i_3 
       (.I0(next_mi_addr[30]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[30]),
        .O(\next_mi_addr[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[31]_i_4 
       (.I0(next_mi_addr[29]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[29]),
        .O(\next_mi_addr[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \next_mi_addr[31]_i_5 
       (.I0(next_mi_addr[28]),
        .I1(size_mask_q[31]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[28]),
        .O(\next_mi_addr[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h1DDDE222E222E222)) 
    \next_mi_addr[3]_i_2 
       (.I0(S_AXI_AADDR_Q[3]),
        .I1(M_AXI_AADDR_I1__0),
        .I2(size_mask_q[3]),
        .I3(next_mi_addr[3]),
        .I4(first_split__2),
        .I5(first_step_q[3]),
        .O(\next_mi_addr[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1DDDE222E222E222)) 
    \next_mi_addr[3]_i_3 
       (.I0(S_AXI_AADDR_Q[2]),
        .I1(M_AXI_AADDR_I1__0),
        .I2(size_mask_q[2]),
        .I3(next_mi_addr[2]),
        .I4(first_split__2),
        .I5(first_step_q[2]),
        .O(\next_mi_addr[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h1DDDE222E222E222)) 
    \next_mi_addr[3]_i_4 
       (.I0(S_AXI_AADDR_Q[1]),
        .I1(M_AXI_AADDR_I1__0),
        .I2(size_mask_q[1]),
        .I3(next_mi_addr[1]),
        .I4(first_split__2),
        .I5(first_step_q[1]),
        .O(\next_mi_addr[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1DDDE222E222E222)) 
    \next_mi_addr[3]_i_5 
       (.I0(S_AXI_AADDR_Q[0]),
        .I1(M_AXI_AADDR_I1__0),
        .I2(size_mask_q[0]),
        .I3(next_mi_addr[0]),
        .I4(first_split__2),
        .I5(first_step_q[0]),
        .O(\next_mi_addr[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \next_mi_addr[3]_i_6 
       (.I0(split_ongoing),
        .I1(access_is_incr_q),
        .O(M_AXI_AADDR_I1__0));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_2 
       (.I0(m_axi_araddr[7]),
        .I1(addr_step_q[7]),
        .I2(first_split__2),
        .I3(first_step_q[7]),
        .O(\next_mi_addr[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_3 
       (.I0(m_axi_araddr[6]),
        .I1(addr_step_q[6]),
        .I2(first_split__2),
        .I3(first_step_q[6]),
        .O(\next_mi_addr[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_4 
       (.I0(m_axi_araddr[5]),
        .I1(addr_step_q[5]),
        .I2(first_split__2),
        .I3(first_step_q[5]),
        .O(\next_mi_addr[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_5 
       (.I0(m_axi_araddr[4]),
        .I1(size_mask_q[0]),
        .I2(first_split__2),
        .I3(first_step_q[4]),
        .O(\next_mi_addr[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[0] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[3]_i_1_n_7 ),
        .Q(next_mi_addr[0]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[10] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[11]_i_1_n_5 ),
        .Q(next_mi_addr[10]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[11] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[11]_i_1_n_4 ),
        .Q(next_mi_addr[11]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[11]_i_1 
       (.CI(\next_mi_addr_reg[7]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[11]_i_1_n_0 ,\next_mi_addr_reg[11]_i_1_n_1 ,\next_mi_addr_reg[11]_i_1_n_2 ,\next_mi_addr_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(m_axi_araddr[11:8]),
        .O({\next_mi_addr_reg[11]_i_1_n_4 ,\next_mi_addr_reg[11]_i_1_n_5 ,\next_mi_addr_reg[11]_i_1_n_6 ,\next_mi_addr_reg[11]_i_1_n_7 }),
        .S({\next_mi_addr[11]_i_2_n_0 ,\next_mi_addr[11]_i_3_n_0 ,\next_mi_addr[11]_i_4_n_0 ,\next_mi_addr[11]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[12] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[15]_i_1_n_7 ),
        .Q(next_mi_addr[12]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[13] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[15]_i_1_n_6 ),
        .Q(next_mi_addr[13]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[14] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[15]_i_1_n_5 ),
        .Q(next_mi_addr[14]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[15] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[15]_i_1_n_4 ),
        .Q(next_mi_addr[15]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[15]_i_1 
       (.CI(\next_mi_addr_reg[11]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[15]_i_1_n_0 ,\next_mi_addr_reg[15]_i_1_n_1 ,\next_mi_addr_reg[15]_i_1_n_2 ,\next_mi_addr_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\next_mi_addr[15]_i_2_n_0 ,\next_mi_addr[15]_i_3_n_0 ,\next_mi_addr[15]_i_4_n_0 ,\next_mi_addr[15]_i_5_n_0 }),
        .O({\next_mi_addr_reg[15]_i_1_n_4 ,\next_mi_addr_reg[15]_i_1_n_5 ,\next_mi_addr_reg[15]_i_1_n_6 ,\next_mi_addr_reg[15]_i_1_n_7 }),
        .S({\next_mi_addr[15]_i_6_n_0 ,\next_mi_addr[15]_i_7_n_0 ,\next_mi_addr[15]_i_8_n_0 ,\next_mi_addr[15]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[16] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[19]_i_1_n_7 ),
        .Q(next_mi_addr[16]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[17] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[19]_i_1_n_6 ),
        .Q(next_mi_addr[17]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[18] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[19]_i_1_n_5 ),
        .Q(next_mi_addr[18]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[19] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[19]_i_1_n_4 ),
        .Q(next_mi_addr[19]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[19]_i_1 
       (.CI(\next_mi_addr_reg[15]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[19]_i_1_n_0 ,\next_mi_addr_reg[19]_i_1_n_1 ,\next_mi_addr_reg[19]_i_1_n_2 ,\next_mi_addr_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\next_mi_addr_reg[19]_i_1_n_4 ,\next_mi_addr_reg[19]_i_1_n_5 ,\next_mi_addr_reg[19]_i_1_n_6 ,\next_mi_addr_reg[19]_i_1_n_7 }),
        .S({\next_mi_addr[19]_i_2_n_0 ,\next_mi_addr[19]_i_3_n_0 ,\next_mi_addr[19]_i_4_n_0 ,\next_mi_addr[19]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[1] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[3]_i_1_n_6 ),
        .Q(next_mi_addr[1]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[20] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[23]_i_1_n_7 ),
        .Q(next_mi_addr[20]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[21] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[23]_i_1_n_6 ),
        .Q(next_mi_addr[21]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[22] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[23]_i_1_n_5 ),
        .Q(next_mi_addr[22]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[23] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[23]_i_1_n_4 ),
        .Q(next_mi_addr[23]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[23]_i_1 
       (.CI(\next_mi_addr_reg[19]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[23]_i_1_n_0 ,\next_mi_addr_reg[23]_i_1_n_1 ,\next_mi_addr_reg[23]_i_1_n_2 ,\next_mi_addr_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\next_mi_addr_reg[23]_i_1_n_4 ,\next_mi_addr_reg[23]_i_1_n_5 ,\next_mi_addr_reg[23]_i_1_n_6 ,\next_mi_addr_reg[23]_i_1_n_7 }),
        .S({\next_mi_addr[23]_i_2_n_0 ,\next_mi_addr[23]_i_3_n_0 ,\next_mi_addr[23]_i_4_n_0 ,\next_mi_addr[23]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[24] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[27]_i_1_n_7 ),
        .Q(next_mi_addr[24]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[25] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[27]_i_1_n_6 ),
        .Q(next_mi_addr[25]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[26] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[27]_i_1_n_5 ),
        .Q(next_mi_addr[26]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[27] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[27]_i_1_n_4 ),
        .Q(next_mi_addr[27]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[27]_i_1 
       (.CI(\next_mi_addr_reg[23]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[27]_i_1_n_0 ,\next_mi_addr_reg[27]_i_1_n_1 ,\next_mi_addr_reg[27]_i_1_n_2 ,\next_mi_addr_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\next_mi_addr_reg[27]_i_1_n_4 ,\next_mi_addr_reg[27]_i_1_n_5 ,\next_mi_addr_reg[27]_i_1_n_6 ,\next_mi_addr_reg[27]_i_1_n_7 }),
        .S({\next_mi_addr[27]_i_2_n_0 ,\next_mi_addr[27]_i_3_n_0 ,\next_mi_addr[27]_i_4_n_0 ,\next_mi_addr[27]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[28] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[31]_i_1_n_7 ),
        .Q(next_mi_addr[28]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[29] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[31]_i_1_n_6 ),
        .Q(next_mi_addr[29]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[2] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[3]_i_1_n_5 ),
        .Q(next_mi_addr[2]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[30] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[31]_i_1_n_5 ),
        .Q(next_mi_addr[30]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[31] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[31]_i_1_n_4 ),
        .Q(next_mi_addr[31]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[31]_i_1 
       (.CI(\next_mi_addr_reg[27]_i_1_n_0 ),
        .CO({\NLW_next_mi_addr_reg[31]_i_1_CO_UNCONNECTED [3],\next_mi_addr_reg[31]_i_1_n_1 ,\next_mi_addr_reg[31]_i_1_n_2 ,\next_mi_addr_reg[31]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\next_mi_addr_reg[31]_i_1_n_4 ,\next_mi_addr_reg[31]_i_1_n_5 ,\next_mi_addr_reg[31]_i_1_n_6 ,\next_mi_addr_reg[31]_i_1_n_7 }),
        .S({\next_mi_addr[31]_i_2_n_0 ,\next_mi_addr[31]_i_3_n_0 ,\next_mi_addr[31]_i_4_n_0 ,\next_mi_addr[31]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[3] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[3]_i_1_n_4 ),
        .Q(next_mi_addr[3]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\next_mi_addr_reg[3]_i_1_n_0 ,\next_mi_addr_reg[3]_i_1_n_1 ,\next_mi_addr_reg[3]_i_1_n_2 ,\next_mi_addr_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(m_axi_araddr[3:0]),
        .O({\next_mi_addr_reg[3]_i_1_n_4 ,\next_mi_addr_reg[3]_i_1_n_5 ,\next_mi_addr_reg[3]_i_1_n_6 ,\next_mi_addr_reg[3]_i_1_n_7 }),
        .S({\next_mi_addr[3]_i_2_n_0 ,\next_mi_addr[3]_i_3_n_0 ,\next_mi_addr[3]_i_4_n_0 ,\next_mi_addr[3]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[4] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[7]_i_1_n_7 ),
        .Q(next_mi_addr[4]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[5] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[7]_i_1_n_6 ),
        .Q(next_mi_addr[5]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[6] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[7]_i_1_n_5 ),
        .Q(next_mi_addr[6]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[7] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[7]_i_1_n_4 ),
        .Q(next_mi_addr[7]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[7]_i_1 
       (.CI(\next_mi_addr_reg[3]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[7]_i_1_n_0 ,\next_mi_addr_reg[7]_i_1_n_1 ,\next_mi_addr_reg[7]_i_1_n_2 ,\next_mi_addr_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(m_axi_araddr[7:4]),
        .O({\next_mi_addr_reg[7]_i_1_n_4 ,\next_mi_addr_reg[7]_i_1_n_5 ,\next_mi_addr_reg[7]_i_1_n_6 ,\next_mi_addr_reg[7]_i_1_n_7 }),
        .S({\next_mi_addr[7]_i_2_n_0 ,\next_mi_addr[7]_i_3_n_0 ,\next_mi_addr[7]_i_4_n_0 ,\next_mi_addr[7]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[8] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[11]_i_1_n_7 ),
        .Q(next_mi_addr[8]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[9] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[11]_i_1_n_6 ),
        .Q(next_mi_addr[9]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[4]),
        .Q(num_transactions_q[0]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[5]),
        .Q(num_transactions_q[1]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[6]),
        .Q(num_transactions_q[2]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[7]),
        .Q(num_transactions_q[3]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  LUT1 #(
    .INIT(2'h1)) 
    \pushed_commands[0]_i_1 
       (.I0(pushed_commands_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \pushed_commands[1]_i_1 
       (.I0(pushed_commands_reg[0]),
        .I1(pushed_commands_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \pushed_commands[2]_i_1 
       (.I0(pushed_commands_reg[1]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[2]),
        .O(p_0_in[2]));
  LUT2 #(
    .INIT(4'hB)) 
    \pushed_commands[3]_i_1 
       (.I0(E),
        .I1(aresetn),
        .O(\pushed_commands[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \pushed_commands[3]_i_2 
       (.I0(pushed_commands_reg[2]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[1]),
        .I3(pushed_commands_reg[3]),
        .O(p_0_in[3]));
  FDRE #(
    .INIT(1'b0)) 
    \pushed_commands_reg[0] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[0]),
        .Q(pushed_commands_reg[0]),
        .R(\pushed_commands[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pushed_commands_reg[1] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[1]),
        .Q(pushed_commands_reg[1]),
        .R(\pushed_commands[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pushed_commands_reg[2] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[2]),
        .Q(pushed_commands_reg[2]),
        .R(\pushed_commands[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pushed_commands_reg[3] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[3]),
        .Q(pushed_commands_reg[3]),
        .R(\pushed_commands[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \size_mask_q[0]_i_1 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arsize[2]),
        .O(size_mask[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \size_mask_q[1]_i_1 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[2]),
        .O(size_mask[1]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h15)) 
    \size_mask_q[2]_i_1 
       (.I0(s_axi_arsize[2]),
        .I1(s_axi_arsize[1]),
        .I2(s_axi_arsize[0]),
        .O(size_mask[2]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \size_mask_q[3]_i_1 
       (.I0(s_axi_arsize[2]),
        .O(size_mask[3]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h57)) 
    \size_mask_q[4]_i_1 
       (.I0(s_axi_arsize[2]),
        .I1(s_axi_arsize[1]),
        .I2(s_axi_arsize[0]),
        .O(size_mask[4]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \size_mask_q[5]_i_1 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[2]),
        .O(size_mask[5]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \size_mask_q[6]_i_1 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arsize[2]),
        .O(size_mask[6]));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[0]),
        .Q(size_mask_q[0]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[1]),
        .Q(size_mask_q[1]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[2]),
        .Q(size_mask_q[2]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(1'b1),
        .Q(size_mask_q[31]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[3]),
        .Q(size_mask_q[3]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[4]),
        .Q(size_mask_q[4]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[5]),
        .Q(size_mask_q[5]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[6]),
        .Q(size_mask_q[6]),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
  FDRE #(
    .INIT(1'b0)) 
    split_ongoing_reg
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(cmd_split_i),
        .Q(split_ongoing),
        .R(\USE_R_CHANNEL.cmd_queue_n_1 ));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_36_axi3_conv" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_0_axi_protocol_converter_v2_1_36_axi3_conv
   (m_axi_rready,
    s_axi_rvalid,
    S_AXI_AREADY_I_reg,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_araddr,
    m_axi_arvalid,
    m_axi_arlen,
    m_axi_arlock,
    s_axi_rlast,
    s_axi_rready,
    m_axi_rvalid,
    s_axi_arsize,
    s_axi_arlen,
    aclk,
    s_axi_araddr,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arvalid,
    aresetn,
    m_axi_arready,
    m_axi_rlast);
  output m_axi_rready;
  output s_axi_rvalid;
  output S_AXI_AREADY_I_reg;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [31:0]m_axi_araddr;
  output m_axi_arvalid;
  output [3:0]m_axi_arlen;
  output [0:0]m_axi_arlock;
  output s_axi_rlast;
  input s_axi_rready;
  input m_axi_rvalid;
  input [2:0]s_axi_arsize;
  input [7:0]s_axi_arlen;
  input aclk;
  input [31:0]s_axi_araddr;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input s_axi_arvalid;
  input aresetn;
  input m_axi_arready;
  input m_axi_rlast;

  wire S_AXI_AREADY_I_reg;
  wire \USE_READ.USE_SPLIT_R.rd_cmd_ready ;
  wire \USE_R_CHANNEL.cmd_queue/inst/empty ;
  wire aclk;
  wire aresetn;
  wire [31:0]m_axi_araddr;
  wire [1:0]m_axi_arburst;
  wire [3:0]m_axi_arcache;
  wire [3:0]m_axi_arlen;
  wire [0:0]m_axi_arlock;
  wire [2:0]m_axi_arprot;
  wire [3:0]m_axi_arqos;
  wire m_axi_arready;
  wire [2:0]m_axi_arsize;
  wire m_axi_arvalid;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;

  cnn_system_axi_ic_hp1_imp_auto_pc_0_axi_protocol_converter_v2_1_36_a_axi3_conv \USE_READ.USE_SPLIT_R.read_addr_inst 
       (.E(S_AXI_AREADY_I_reg),
        .aclk(aclk),
        .aresetn(aresetn),
        .empty(\USE_R_CHANNEL.cmd_queue/inst/empty ),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arburst(m_axi_arburst),
        .m_axi_arcache(m_axi_arcache),
        .m_axi_arlen(m_axi_arlen),
        .m_axi_arlock(m_axi_arlock),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_arqos(m_axi_arqos),
        .m_axi_arready(m_axi_arready),
        .m_axi_arsize(m_axi_arsize),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .rd_en(\USE_READ.USE_SPLIT_R.rd_cmd_ready ),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arqos(s_axi_arqos),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid));
  cnn_system_axi_ic_hp1_imp_auto_pc_0_axi_protocol_converter_v2_1_36_r_axi3_conv \USE_READ.USE_SPLIT_R.read_data_inst 
       (.empty(\USE_R_CHANNEL.cmd_queue/inst/empty ),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rvalid(m_axi_rvalid),
        .rd_en(\USE_READ.USE_SPLIT_R.rd_cmd_ready ),
        .s_axi_rready(s_axi_rready));
endmodule

(* C_AXI_ADDR_WIDTH = "32" *) (* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) 
(* C_AXI_BUSER_WIDTH = "1" *) (* C_AXI_DATA_WIDTH = "32" *) (* C_AXI_ID_WIDTH = "1" *) 
(* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_SUPPORTS_READ = "1" *) (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
(* C_AXI_SUPPORTS_WRITE = "0" *) (* C_AXI_WUSER_WIDTH = "1" *) (* C_FAMILY = "zynq" *) 
(* C_IGNORE_ID = "1" *) (* C_M_AXI_PROTOCOL = "1" *) (* C_S_AXI_PROTOCOL = "0" *) 
(* C_TRANSLATION_MODE = "2" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "axi_protocol_converter_v2_1_36_axi_protocol_converter" *) 
(* P_AXI3 = "1" *) (* P_AXI4 = "0" *) (* P_AXILITE = "2" *) 
(* P_AXILITE_SIZE = "3'b010" *) (* P_CONVERSION = "2" *) (* P_DECERR = "2'b11" *) 
(* P_INCR = "2'b01" *) (* P_PROTECTION = "1" *) (* P_SLVERR = "2'b10" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_0_axi_protocol_converter_v2_1_36_axi_protocol_converter
   (aclk,
    aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awregion,
    s_axi_awqos,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arregion,
    s_axi_arqos,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awregion,
    m_axi_awqos,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arregion,
    m_axi_arqos,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awregion;
  input [3:0]s_axi_awqos;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arregion;
  input [3:0]s_axi_arqos;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awregion;
  output [3:0]m_axi_awqos;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [31:0]m_axi_wdata;
  output [3:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arregion;
  output [3:0]m_axi_arqos;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [31:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;

  wire \<const0> ;
  wire aclk;
  wire aresetn;
  wire [31:0]m_axi_araddr;
  wire [1:0]m_axi_arburst;
  wire [3:0]m_axi_arcache;
  wire [3:0]m_axi_arlen;
  wire [0:0]\^m_axi_arlock ;
  wire [2:0]m_axi_arprot;
  wire [3:0]m_axi_arqos;
  wire m_axi_arready;
  wire [2:0]m_axi_arsize;
  wire m_axi_arvalid;
  wire [31:0]m_axi_rdata;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;

  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlock[1] = \<const0> ;
  assign m_axi_arlock[0] = \^m_axi_arlock [0];
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[1] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[31:0] = m_axi_rdata;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rresp[1:0] = m_axi_rresp;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_wready = \<const0> ;
  GND GND
       (.G(\<const0> ));
  cnn_system_axi_ic_hp1_imp_auto_pc_0_axi_protocol_converter_v2_1_36_axi3_conv \gen_axi4_axi3.axi3_conv_inst 
       (.S_AXI_AREADY_I_reg(s_axi_arready),
        .aclk(aclk),
        .aresetn(aresetn),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arburst(m_axi_arburst),
        .m_axi_arcache(m_axi_arcache),
        .m_axi_arlen(m_axi_arlen),
        .m_axi_arlock(\^m_axi_arlock ),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_arqos(m_axi_arqos),
        .m_axi_arready(m_axi_arready),
        .m_axi_arsize(m_axi_arsize),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arqos(s_axi_arqos),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_36_r_axi3_conv" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_0_axi_protocol_converter_v2_1_36_r_axi3_conv
   (rd_en,
    m_axi_rlast,
    s_axi_rready,
    m_axi_rvalid,
    empty);
  output rd_en;
  input m_axi_rlast;
  input s_axi_rready;
  input m_axi_rvalid;
  input empty;

  wire empty;
  wire m_axi_rlast;
  wire m_axi_rvalid;
  wire rd_en;
  wire s_axi_rready;

  LUT4 #(
    .INIT(16'h0080)) 
    cmd_ready_i
       (.I0(m_axi_rlast),
        .I1(s_axi_rready),
        .I2(m_axi_rvalid),
        .I3(empty),
        .O(rd_en));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_0_xpm_cdc_async_rst
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
DkrAesSLBeDxhaXI0asb+puroLvZBWosIXruDqTgmPTfjI3i0ebKCZLqSBTKg5KUexTiKWVl+9Ug
OYhkMJXkn0n/j8/6GJO1z/4tReZHG89WtZnUKH7DqjJ9cbYER+xiMOLSptE29AOOLGbQ4MjVzy18
/GymLeiAgR0qzkp9N7Q=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
yr55bXOTA5/Rx+gX4TeeJXN0K2cBO3bWYWFnZFCMoAD3+p3RscsDqPrCcQoQK89bE+j5quTJPCqN
12//qWlZoWwZn76VLtgZ6uR08n49XeFz74xjL/TLVxYGXt6h6xX4vQmlg4FObv4H7DjasBX3ZKbJ
ok2aUJCoVpTf1qKo+JcowFn3wCJuym0DTf+pKogOmnP+lFMp5UqrHjukbVdejhRT74VR1/DemaE8
T5gZjbZ3QR/HcWThFnFovoQYfDe6/w6F45CxJCG+PeP9h3J9NvtHuoTROp/4Pm3PwHsb42eiSpxr
pnyaDp+17FZLap9oxsD4do1RXjk5D34ULkJVIA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
O7CLKF7GDUoxVy+wsDp+MYsQrWrtsRT6vUjYFyhzMh6Ub+aCHVi4kv7qJlcKC/lqgz7jtEMHuwnT
UOnYZwGZhoYQGiyYgQ49hiQ3ZRRKZhFERi0ZIsCQqnt9KL/lctiP1qftlXs9jExoeBOOF7u/WVi3
pyQy0g7Wba9UIUGIm6s=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GNpCV29nEkhsU3/WearppJw/bF+jpNkJZ/R95n3ICdpGLWfuUStwlUy8HF9jlXwQBHOlyBOP7M8y
5/3deJ7dP9wf0/ktca2pbkd2baod2G4UyNgD7Kw6HEUvRRpyTJZ/L3VmfGT+tIbWo6HIxzLTs/m5
5iqKTaDaI4Q3qK4JULeTAAdRL/RfQmSpb3LUmOqKahCwxslnzUfjlDrQ1yr6O4UDsXY4hdfrGK9D
/I7KoTKVvEhrueaX2jRmY3TQrBUt4jyGRe3PZ6bG503/ai2p2yjlgo+WpvN4/p05/WKtMyZOkIZl
UJBltJG+KSXZ7ZMQP6CiBt0LOX7irCbHz0Jc8g==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DywZ/kNdKOmRTL7XhjPG/GfMoClg4ctHdFzXJa3aew7oWOtgVWlq099QePdVKIIjIu5l23MJcdIO
oqynvDtsO7VQVhHYIpsQFOj2gSnqXKfBL8B5bT2FcKG3ooFRv+3lkOFeU5Nw8WL0q47fLhyAMLNd
/9HoUonhRo19wn0Me1Do9aWic/JVt3e9Nd7ru1ix5nBBPNQOlYU7SVx+2X1T2XaJWYvLixlk0Mhc
jMhvX3YFZPzZ0+CM93ob1QR9ScG+y4XfYgNogHRVVefGFoLz2+xnJN+Bu/U0KTX6CQMDDd3buBwQ
T6pBRJKKEDybcMbPkbOJLE5f5LO6qExT7Tg1VA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Xk76vYY5+Mi9SikZxGvoXU0nDA0NsPtFqoFTdNelYrbJJjzYNc3fKoKmeAPJEHAK68DYNC1hfZ+h
wET+8JT5Y0DFS6q4lseScDHDk1aw1B8bX+BjAZGKZ0aHGVLPVIBWoebVqqt6jq4ixwO9FqIZHsBM
+MvVrCQvX1DCzUaRFYo14SpAvNJqUYqu6GG3yylKDKwbG8MXyf+cxyC3SADqw9GIWVeUU6K6qVhw
xPAS+X8RLs2umC5guWQim6qB6i7UvICDc0XHSGBJTshyHB7pJ2HTmwrJM0u4VdB6VWY7d3+mSXiS
DD460Qt+vAgSG+7W6NzEmdFsY1oS7d9BmIM8TQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lnn2zznD4woSpcQ8qX9T+xHBP0X7XM2/xXLBM/d+4CrXYKZQlI5YUEvGjRGGV7RB+4F2JgUow8cF
xFJeqARfTzUNSbwmUP/DFMtqlGEpM1nl55xR/wX4ilkSqJcznCGf58hVz/IgOrc5d0OVvOQ/RNYL
rQXtkBsY4w2O8c7EGphPL24fy/JJg5k7ryF7nyHr6SJRrqNDPv/NiKuP5m/kV27HfpteXE06q4M0
JWC5QAIiv5LTpXAb+DVggJmRRAjxMvV2S84NjffxHFMCaMTvtc+jxlYh9aF+cQNAKPRiHAx85SiJ
PEFLBbwPCT5vvJDdLpasydWmMxkjZHzK2xrqeQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
DUNozA2bEHamc0iNCnZvk8LepBeINdhN5GX+6IX34qnspEKMKv7BjtLqXgwW/V/JCnWf8Y7OIbw4
f22QHEpI1y43+nOTrbDPPtprE6ltlBCtccryEPYttIQJF/Tiu49G9uWMIYmXUXgklMNLgBGIeDiK
MdigVvsFpWQ6/uEjPAFsj2WD2pLIKxqEXb3OZ0Nem9xlsoptO6Uf3qgYsXspsW/L4zVBsQNlETzy
cGcBkm40vHTRqemA2HpoPknluLKSuOwehOGvmKh55bvIJRxVFCrPdV4bF50Nq2S4uePYJ2wCeLJb
1sDpBCI5cUI6kGfJN0e+OIQ/DwN9iIoPWSdiKj6BN3I0bmh8maYAcAmtDaAzTaXC3jXkFQB+ik7h
V11sxx0a+8ZYnH66nJrJftgrmqQZU1leLEGxxaKkkPXytKyATXEpCz9MbzyjKwvliQljZcszf7lH
WWRPP6R6bKU8hpjrVAMsuRm+R8j4iHc4nTPqt7cZhlyhAViBvlB2C40D

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EHaUQmQmLufYzNZ5QppuzuiisgA7fFX3fAiRBFmfJqYPZjTG0XgsTNCRYHWXcuY3m9BX/s9Er2Gd
/L/4+bT/RXW5ZkETw2SBQHO7qe1CJqtNqDahDuB0zADrCR/cKwPDQtFItqIOeGeJoLEA9s/HUvSD
th2uPFi0+hFXeDicj+1plX4ApmUWJska8TlRwC0oi/m+lIBBbRrdYO5XY38+qhOgnKC2wPmdMbkc
EFGNFdyzlp/ZUen6C7tswoDOjsDSmlB3wOq10stSLY7Bo90k8f9xLzuwI5q+H7plQuinSdWPRTYu
x9hcgLtu9zFvPwNz/KNLHShBAtzUCp4bx3dwGw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
sOYoFu61UC8Y00qCHUNN26P31U5AWJ63SSgVOs2Gp7CWPJ+P3OCRLePUP3+bAteUgBN7AVfI4R/z
Yw2S8JiIqaRcTitNUHv2Diet7aTJZ4Pnf0fbOaK8TOtu0MU72ttMTQPYuX472KGwdJiqBAxB4FzH
KuXCK8Q+rXGxbV5Sub0rOi5KOyQYei7zMxxhQsQHIl4iRkiNGJ5OLhaX6w1YJw60TzJq3XLnqBbu
hbrtcwSQccW8il9D3IlW+Uk+JKVURvFU0ULOXoBLyfWnFH57yQp5QhIrCf8jqGqVd4po+EbPJz6B
sWESgEhaJa8ccl9THIShRCNPAVXkyfN7wTTFmA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fz3nBHklRG4aYQk8bMLrCmmQlzihvhNQmRJkDjMqAVQp3WfT3s29tMACoxDJDWmUKcN48pRpjTcS
XQtCGGmwDaUP9aAsJBVtDs3tIakQoXZ/Q+b6bJy16xRLtVX3DbYsT5harhUkmBWCTRn3H1XrmQyv
sxbL1P6awsZjt9hO4Mdv3YOqh9IsIKEnsRIHQNdH6IFLnpz/3Zi3LzPQNq06nEuGqIvBuo3484HA
Oqj7FoYVOOEHSLUEZOW8wOSmhniWeAOKTQGQRonLiMMuS8yDcXSIQh1zEg+e0cBH8+1DW5cFMzeD
wCbuSTLTBwW2672ks/1kB5Hp7UKgj/KoG2ySZA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 73744)
`pragma protect data_block
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
`pragma protect end_protected
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
