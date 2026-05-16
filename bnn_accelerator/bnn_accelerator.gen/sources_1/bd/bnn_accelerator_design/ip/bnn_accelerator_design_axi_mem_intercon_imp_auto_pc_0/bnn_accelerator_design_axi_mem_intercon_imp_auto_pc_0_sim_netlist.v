// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat May  9 00:04:24 2026
// Host        : LAPTOP-VNMTQE0B running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/Chappidi Sai
//               Sudheer/Desktop/bnn_accelerator/bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ip/bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0/bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_sim_netlist.v}
// Design      : bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0,axi_protocol_converter_v2_1_33_axi_protocol_converter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axi_protocol_converter_v2_1_33_axi_protocol_converter,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0
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
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
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
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
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
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
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
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, ASSOCIATED_BUSIF S_AXI:M_AXI, ASSOCIATED_RESET aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bnn_accelerator_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWID" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 64, PROTOCOL AXI4, FREQ_HZ 50000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 8, PHASE 0.0, CLK_DOMAIN bnn_accelerator_design_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [0:0]s_axi_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) input [31:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *) input [7:0]s_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *) input [2:0]s_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *) input [1:0]s_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *) input [0:0]s_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *) input [3:0]s_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREGION" *) input [3:0]s_axi_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWQOS" *) input [3:0]s_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [63:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [7:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *) input s_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BID" *) output [0:0]s_axi_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARID" *) input [0:0]s_axi_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [31:0]s_axi_araddr;
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RID" *) output [0:0]s_axi_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [63:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *) output s_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWID" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI, DATA_WIDTH 64, PROTOCOL AXI3, FREQ_HZ 50000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN bnn_accelerator_design_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [0:0]m_axi_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *) output [31:0]m_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *) output [3:0]m_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE" *) output [2:0]m_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWBURST" *) output [1:0]m_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK" *) output [1:0]m_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE" *) output [3:0]m_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *) output [2:0]m_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWQOS" *) output [3:0]m_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *) output m_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *) input m_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WID" *) output [0:0]m_axi_wid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *) output [63:0]m_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *) output [7:0]m_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *) output m_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *) output m_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *) input m_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BID" *) input [0:0]m_axi_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *) input [1:0]m_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *) input m_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *) output m_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARID" *) output [0:0]m_axi_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *) output [31:0]m_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *) output [3:0]m_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE" *) output [2:0]m_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARBURST" *) output [1:0]m_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK" *) output [1:0]m_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE" *) output [3:0]m_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *) output [2:0]m_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARQOS" *) output [3:0]m_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *) output m_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *) input m_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RID" *) input [0:0]m_axi_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *) input [63:0]m_axi_rdata;
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
  wire [0:0]m_axi_arid;
  wire [3:0]m_axi_arlen;
  wire [0:0]\^m_axi_arlock ;
  wire [2:0]m_axi_arprot;
  wire [3:0]m_axi_arqos;
  wire m_axi_arready;
  wire [2:0]m_axi_arsize;
  wire m_axi_arvalid;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [0:0]m_axi_awid;
  wire [3:0]m_axi_awlen;
  wire [0:0]\^m_axi_awlock ;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire [0:0]m_axi_bid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [63:0]m_axi_rdata;
  wire [0:0]m_axi_rid;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire [63:0]m_axi_wdata;
  wire [0:0]m_axi_wid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire [7:0]m_axi_wstrb;
  wire m_axi_wvalid;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire [0:0]s_axi_bid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire [0:0]s_axi_rid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [1:1]NLW_inst_m_axi_arlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arregion_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_aruser_UNCONNECTED;
  wire [1:1]NLW_inst_m_axi_awlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awregion_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awuser_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_buser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_ruser_UNCONNECTED;

  assign m_axi_arlock[1] = \<const0> ;
  assign m_axi_arlock[0] = \^m_axi_arlock [0];
  assign m_axi_awlock[1] = \<const0> ;
  assign m_axi_awlock[0] = \^m_axi_awlock [0];
  GND GND
       (.G(\<const0> ));
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_SUPPORTS_READ = "1" *) 
  (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
  (* C_AXI_SUPPORTS_WRITE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_IGNORE_ID = "0" *) 
  (* C_M_AXI_PROTOCOL = "1" *) 
  (* C_S_AXI_PROTOCOL = "0" *) 
  (* C_TRANSLATION_MODE = "2" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* P_AXI3 = "1" *) 
  (* P_AXI4 = "0" *) 
  (* P_AXILITE = "2" *) 
  (* P_AXILITE_SIZE = "3'b011" *) 
  (* P_CONVERSION = "2" *) 
  (* P_DECERR = "2'b11" *) 
  (* P_INCR = "2'b01" *) 
  (* P_PROTECTION = "1" *) 
  (* P_SLVERR = "2'b10" *) 
  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arburst(m_axi_arburst),
        .m_axi_arcache(m_axi_arcache),
        .m_axi_arid(m_axi_arid),
        .m_axi_arlen(m_axi_arlen),
        .m_axi_arlock({NLW_inst_m_axi_arlock_UNCONNECTED[1],\^m_axi_arlock }),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_arqos(m_axi_arqos),
        .m_axi_arready(m_axi_arready),
        .m_axi_arregion(NLW_inst_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(m_axi_arsize),
        .m_axi_aruser(NLW_inst_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awid(m_axi_awid),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awlock({NLW_inst_m_axi_awlock_UNCONNECTED[1],\^m_axi_awlock }),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awregion(NLW_inst_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awuser(NLW_inst_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bid(m_axi_bid),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rid(m_axi_rid),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wid(m_axi_wid),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wuser(NLW_inst_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(m_axi_wvalid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arqos(s_axi_arqos),
        .s_axi_arready(s_axi_arready),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awready(s_axi_awready),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(s_axi_bid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_buser(NLW_inst_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(s_axi_rid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_ruser(NLW_inst_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_32_axic_fifo" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo
   (\goreg_dm.dout_i_reg[4] ,
    full,
    empty,
    din,
    rd_en,
    cmd_empty_reg,
    cmd_push_block_reg,
    split_in_progress,
    D,
    wr_en,
    \S_AXI_AID_Q_reg[0] ,
    split_in_progress_reg,
    last_split__1,
    \queue_id_reg[0] ,
    aclk,
    SR,
    Q,
    ram_full_fb_i_reg,
    \USE_WRITE.wr_cmd_ready ,
    almost_empty,
    cmd_empty,
    aresetn,
    m_axi_bvalid,
    s_axi_bready,
    last_word,
    almost_b_empty,
    cmd_b_empty,
    \cmd_depth_reg[5] ,
    cmd_push_block,
    command_ongoing,
    \queue_id_reg[0]_0 ,
    m_axi_awvalid,
    queue_id,
    \queue_id_reg[0]_1 ,
    need_to_split_q,
    multiple_id_non_split,
    split_ongoing_reg,
    access_is_incr_q);
  output [4:0]\goreg_dm.dout_i_reg[4] ;
  output full;
  output empty;
  output [0:0]din;
  output rd_en;
  output cmd_empty_reg;
  output cmd_push_block_reg;
  output split_in_progress;
  output [4:0]D;
  output wr_en;
  output \S_AXI_AID_Q_reg[0] ;
  output split_in_progress_reg;
  output last_split__1;
  output \queue_id_reg[0] ;
  input aclk;
  input [0:0]SR;
  input [3:0]Q;
  input ram_full_fb_i_reg;
  input \USE_WRITE.wr_cmd_ready ;
  input almost_empty;
  input cmd_empty;
  input aresetn;
  input m_axi_bvalid;
  input s_axi_bready;
  input last_word;
  input almost_b_empty;
  input cmd_b_empty;
  input [5:0]\cmd_depth_reg[5] ;
  input cmd_push_block;
  input command_ongoing;
  input \queue_id_reg[0]_0 ;
  input m_axi_awvalid;
  input queue_id;
  input \queue_id_reg[0]_1 ;
  input need_to_split_q;
  input multiple_id_non_split;
  input [3:0]split_ongoing_reg;
  input access_is_incr_q;

  wire [4:0]D;
  wire [3:0]Q;
  wire [0:0]SR;
  wire \S_AXI_AID_Q_reg[0] ;
  wire \USE_WRITE.wr_cmd_ready ;
  wire access_is_incr_q;
  wire aclk;
  wire almost_b_empty;
  wire almost_empty;
  wire aresetn;
  wire cmd_b_empty;
  wire [5:0]\cmd_depth_reg[5] ;
  wire cmd_empty;
  wire cmd_empty_reg;
  wire cmd_push_block;
  wire cmd_push_block_reg;
  wire command_ongoing;
  wire [0:0]din;
  wire empty;
  wire full;
  wire [4:0]\goreg_dm.dout_i_reg[4] ;
  wire last_split__1;
  wire last_word;
  wire m_axi_awvalid;
  wire m_axi_bvalid;
  wire multiple_id_non_split;
  wire need_to_split_q;
  wire queue_id;
  wire \queue_id_reg[0] ;
  wire \queue_id_reg[0]_0 ;
  wire \queue_id_reg[0]_1 ;
  wire ram_full_fb_i_reg;
  wire rd_en;
  wire s_axi_bready;
  wire split_in_progress;
  wire split_in_progress_reg;
  wire [3:0]split_ongoing_reg;
  wire wr_en;

  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen inst
       (.D(D),
        .Q(Q),
        .SR(SR),
        .\S_AXI_AID_Q_reg[0] (\S_AXI_AID_Q_reg[0] ),
        .\USE_WRITE.wr_cmd_ready (\USE_WRITE.wr_cmd_ready ),
        .access_is_incr_q(access_is_incr_q),
        .aclk(aclk),
        .almost_b_empty(almost_b_empty),
        .almost_empty(almost_empty),
        .aresetn(aresetn),
        .cmd_b_empty(cmd_b_empty),
        .\cmd_depth_reg[5] (\cmd_depth_reg[5] ),
        .cmd_empty(cmd_empty),
        .cmd_empty_reg(cmd_empty_reg),
        .cmd_push_block(cmd_push_block),
        .cmd_push_block_reg(cmd_push_block_reg),
        .command_ongoing(command_ongoing),
        .din(din),
        .empty(empty),
        .full(full),
        .\goreg_dm.dout_i_reg[4] (\goreg_dm.dout_i_reg[4] ),
        .last_split__1(last_split__1),
        .last_word(last_word),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bvalid(m_axi_bvalid),
        .multiple_id_non_split(multiple_id_non_split),
        .need_to_split_q(need_to_split_q),
        .queue_id(queue_id),
        .\queue_id_reg[0] (\queue_id_reg[0] ),
        .\queue_id_reg[0]_0 (\queue_id_reg[0]_0 ),
        .\queue_id_reg[0]_1 (\queue_id_reg[0]_1 ),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .rd_en(rd_en),
        .s_axi_bready(s_axi_bready),
        .split_in_progress(split_in_progress),
        .split_in_progress_reg(split_in_progress_reg),
        .split_ongoing_reg(split_ongoing_reg),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_32_axic_fifo" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__parameterized0
   (din,
    \USE_READ.USE_SPLIT_R.rd_cmd_ready ,
    ram_full_i_reg,
    E,
    multiple_id_non_split0,
    cmd_push_block_reg,
    D,
    m_axi_arvalid,
    split_in_progress,
    s_axi_rvalid,
    s_axi_rlast,
    m_axi_rready,
    s_axi_arvalid_0,
    \queue_id_reg[0] ,
    s_axi_arvalid_1,
    empty_fwft_i_reg,
    aclk,
    SR,
    command_ongoing,
    cmd_push_block,
    m_axi_arready,
    aresetn,
    cmd_empty,
    \queue_id_reg[0]_0 ,
    \queue_id_reg[0]_1 ,
    cmd_push_block_reg_0,
    need_to_split_q,
    Q,
    multiple_id_non_split,
    almost_empty,
    m_axi_rvalid,
    s_axi_rready,
    m_axi_rlast,
    split_ongoing_reg,
    split_ongoing_reg_0,
    access_is_incr_q,
    s_axi_arvalid,
    command_ongoing_reg,
    areset_d,
    command_ongoing_reg_0);
  output [0:0]din;
  output \USE_READ.USE_SPLIT_R.rd_cmd_ready ;
  output ram_full_i_reg;
  output [0:0]E;
  output multiple_id_non_split0;
  output cmd_push_block_reg;
  output [4:0]D;
  output m_axi_arvalid;
  output split_in_progress;
  output s_axi_rvalid;
  output s_axi_rlast;
  output m_axi_rready;
  output s_axi_arvalid_0;
  output \queue_id_reg[0] ;
  output s_axi_arvalid_1;
  output [0:0]empty_fwft_i_reg;
  input aclk;
  input [0:0]SR;
  input command_ongoing;
  input cmd_push_block;
  input m_axi_arready;
  input aresetn;
  input cmd_empty;
  input \queue_id_reg[0]_0 ;
  input \queue_id_reg[0]_1 ;
  input cmd_push_block_reg_0;
  input need_to_split_q;
  input [5:0]Q;
  input multiple_id_non_split;
  input almost_empty;
  input m_axi_rvalid;
  input s_axi_rready;
  input m_axi_rlast;
  input [3:0]split_ongoing_reg;
  input [3:0]split_ongoing_reg_0;
  input access_is_incr_q;
  input s_axi_arvalid;
  input command_ongoing_reg;
  input [1:0]areset_d;
  input command_ongoing_reg_0;

  wire [4:0]D;
  wire [0:0]E;
  wire [5:0]Q;
  wire [0:0]SR;
  wire \USE_READ.USE_SPLIT_R.rd_cmd_ready ;
  wire access_is_incr_q;
  wire aclk;
  wire almost_empty;
  wire [1:0]areset_d;
  wire aresetn;
  wire cmd_empty;
  wire cmd_push_block;
  wire cmd_push_block_reg;
  wire cmd_push_block_reg_0;
  wire command_ongoing;
  wire command_ongoing_reg;
  wire command_ongoing_reg_0;
  wire [0:0]din;
  wire [0:0]empty_fwft_i_reg;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire multiple_id_non_split;
  wire multiple_id_non_split0;
  wire need_to_split_q;
  wire \queue_id_reg[0] ;
  wire \queue_id_reg[0]_0 ;
  wire \queue_id_reg[0]_1 ;
  wire ram_full_i_reg;
  wire s_axi_arvalid;
  wire s_axi_arvalid_0;
  wire s_axi_arvalid_1;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire split_in_progress;
  wire [3:0]split_ongoing_reg;
  wire [3:0]split_ongoing_reg_0;

  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__parameterized0 inst
       (.D(D),
        .E(E),
        .Q(Q),
        .SR(SR),
        .access_is_incr_q(access_is_incr_q),
        .aclk(aclk),
        .almost_empty(almost_empty),
        .areset_d(areset_d),
        .aresetn(aresetn),
        .cmd_empty(cmd_empty),
        .cmd_push_block(cmd_push_block),
        .cmd_push_block_reg(cmd_push_block_reg),
        .cmd_push_block_reg_0(cmd_push_block_reg_0),
        .command_ongoing(command_ongoing),
        .command_ongoing_reg(command_ongoing_reg),
        .command_ongoing_reg_0(command_ongoing_reg_0),
        .din(din),
        .empty_fwft_i_reg(empty_fwft_i_reg),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .multiple_id_non_split(multiple_id_non_split),
        .multiple_id_non_split0(multiple_id_non_split0),
        .need_to_split_q(need_to_split_q),
        .\queue_id_reg[0] (\queue_id_reg[0] ),
        .\queue_id_reg[0]_0 (\queue_id_reg[0]_0 ),
        .\queue_id_reg[0]_1 (\queue_id_reg[0]_1 ),
        .ram_full_i_reg(ram_full_i_reg),
        .rd_en(\USE_READ.USE_SPLIT_R.rd_cmd_ready ),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arvalid_0(s_axi_arvalid_0),
        .s_axi_arvalid_1(s_axi_arvalid_1),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .split_in_progress(split_in_progress),
        .split_ongoing_reg(split_ongoing_reg),
        .split_ongoing_reg_0(split_ongoing_reg_0));
endmodule

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_32_axic_fifo" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__xdcDup__1
   (dout,
    full,
    empty,
    SR,
    din,
    cmd_b_push_block_reg,
    ram_full_i_reg,
    cmd_b_push_block_reg_0,
    E,
    cmd_b_push_block_reg_1,
    D,
    aresetn_0,
    m_axi_awready_0,
    \goreg_dm.dout_i_reg[1] ,
    empty_fwft_i_reg,
    m_axi_wvalid,
    \goreg_dm.dout_i_reg[2] ,
    first_mi_word_reg,
    s_axi_awvalid_0,
    s_axi_awvalid_1,
    aclk,
    \gpr1.dout_i_reg[1] ,
    wr_en,
    \USE_WRITE.wr_cmd_ready ,
    cmd_b_push_block,
    aresetn,
    cmd_b_push_block_reg_2,
    \USE_B_CHANNEL.cmd_b_depth_reg[0] ,
    m_axi_bvalid,
    s_axi_bready,
    last_word,
    almost_b_empty,
    rd_en,
    cmd_b_empty,
    Q,
    cmd_push_block,
    m_axi_awready,
    m_axi_awvalid,
    m_axi_awvalid_0,
    m_axi_awvalid_1,
    command_ongoing,
    length_counter_1_reg,
    first_mi_word,
    s_axi_wvalid,
    m_axi_wready,
    m_axi_wlast,
    \m_axi_awlen[3] ,
    need_to_split_q,
    \m_axi_awlen[3]_0 ,
    s_axi_awvalid,
    last_split__1,
    areset_d,
    command_ongoing_reg);
  output [4:0]dout;
  output full;
  output empty;
  output [0:0]SR;
  output [3:0]din;
  output cmd_b_push_block_reg;
  output ram_full_i_reg;
  output cmd_b_push_block_reg_0;
  output [0:0]E;
  output cmd_b_push_block_reg_1;
  output [4:0]D;
  output aresetn_0;
  output [0:0]m_axi_awready_0;
  output \goreg_dm.dout_i_reg[1] ;
  output empty_fwft_i_reg;
  output m_axi_wvalid;
  output \goreg_dm.dout_i_reg[2] ;
  output first_mi_word_reg;
  output s_axi_awvalid_0;
  output s_axi_awvalid_1;
  input aclk;
  input \gpr1.dout_i_reg[1] ;
  input wr_en;
  input \USE_WRITE.wr_cmd_ready ;
  input cmd_b_push_block;
  input aresetn;
  input cmd_b_push_block_reg_2;
  input \USE_B_CHANNEL.cmd_b_depth_reg[0] ;
  input m_axi_bvalid;
  input s_axi_bready;
  input last_word;
  input almost_b_empty;
  input rd_en;
  input cmd_b_empty;
  input [5:0]Q;
  input cmd_push_block;
  input m_axi_awready;
  input m_axi_awvalid;
  input m_axi_awvalid_0;
  input m_axi_awvalid_1;
  input command_ongoing;
  input [1:0]length_counter_1_reg;
  input first_mi_word;
  input s_axi_wvalid;
  input m_axi_wready;
  input m_axi_wlast;
  input [3:0]\m_axi_awlen[3] ;
  input need_to_split_q;
  input [3:0]\m_axi_awlen[3]_0 ;
  input s_axi_awvalid;
  input last_split__1;
  input [1:0]areset_d;
  input command_ongoing_reg;

  wire [4:0]D;
  wire [0:0]E;
  wire [5:0]Q;
  wire [0:0]SR;
  wire \USE_B_CHANNEL.cmd_b_depth_reg[0] ;
  wire \USE_WRITE.wr_cmd_ready ;
  wire aclk;
  wire almost_b_empty;
  wire [1:0]areset_d;
  wire aresetn;
  wire aresetn_0;
  wire cmd_b_empty;
  wire cmd_b_push_block;
  wire cmd_b_push_block_reg;
  wire cmd_b_push_block_reg_0;
  wire cmd_b_push_block_reg_1;
  wire cmd_b_push_block_reg_2;
  wire cmd_push_block;
  wire command_ongoing;
  wire command_ongoing_reg;
  wire [3:0]din;
  wire [4:0]dout;
  wire empty;
  wire empty_fwft_i_reg;
  wire first_mi_word;
  wire first_mi_word_reg;
  wire full;
  wire \goreg_dm.dout_i_reg[1] ;
  wire \goreg_dm.dout_i_reg[2] ;
  wire \gpr1.dout_i_reg[1] ;
  wire last_split__1;
  wire last_word;
  wire [1:0]length_counter_1_reg;
  wire [3:0]\m_axi_awlen[3] ;
  wire [3:0]\m_axi_awlen[3]_0 ;
  wire m_axi_awready;
  wire [0:0]m_axi_awready_0;
  wire m_axi_awvalid;
  wire m_axi_awvalid_0;
  wire m_axi_awvalid_1;
  wire m_axi_bvalid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire need_to_split_q;
  wire ram_full_i_reg;
  wire rd_en;
  wire s_axi_awvalid;
  wire s_axi_awvalid_0;
  wire s_axi_awvalid_1;
  wire s_axi_bready;
  wire s_axi_wvalid;
  wire wr_en;

  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__xdcDup__1 inst
       (.D(D),
        .E(E),
        .Q(Q),
        .SR(SR),
        .\USE_B_CHANNEL.cmd_b_depth_reg[0] (\USE_B_CHANNEL.cmd_b_depth_reg[0] ),
        .\USE_WRITE.wr_cmd_ready (\USE_WRITE.wr_cmd_ready ),
        .aclk(aclk),
        .almost_b_empty(almost_b_empty),
        .areset_d(areset_d),
        .aresetn(aresetn),
        .aresetn_0(aresetn_0),
        .cmd_b_empty(cmd_b_empty),
        .cmd_b_push_block(cmd_b_push_block),
        .cmd_b_push_block_reg(cmd_b_push_block_reg),
        .cmd_b_push_block_reg_0(cmd_b_push_block_reg_0),
        .cmd_b_push_block_reg_1(cmd_b_push_block_reg_1),
        .cmd_b_push_block_reg_2(cmd_b_push_block_reg_2),
        .cmd_push_block(cmd_push_block),
        .command_ongoing(command_ongoing),
        .command_ongoing_reg(command_ongoing_reg),
        .din(din),
        .dout(dout),
        .empty(empty),
        .empty_fwft_i_reg(empty_fwft_i_reg),
        .first_mi_word(first_mi_word),
        .first_mi_word_reg(first_mi_word_reg),
        .full(full),
        .\goreg_dm.dout_i_reg[1] (\goreg_dm.dout_i_reg[1] ),
        .\goreg_dm.dout_i_reg[2] (\goreg_dm.dout_i_reg[2] ),
        .\gpr1.dout_i_reg[1] (\gpr1.dout_i_reg[1] ),
        .last_split__1(last_split__1),
        .last_word(last_word),
        .length_counter_1_reg(length_counter_1_reg),
        .\m_axi_awlen[3] (\m_axi_awlen[3] ),
        .\m_axi_awlen[3]_0 (\m_axi_awlen[3]_0 ),
        .m_axi_awready(m_axi_awready),
        .m_axi_awready_0(m_axi_awready_0),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_awvalid_0(m_axi_awvalid_0),
        .m_axi_awvalid_1(m_axi_awvalid_1),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .need_to_split_q(need_to_split_q),
        .ram_full_i_reg(ram_full_i_reg),
        .rd_en(rd_en),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awvalid_0(s_axi_awvalid_0),
        .s_axi_awvalid_1(s_axi_awvalid_1),
        .s_axi_bready(s_axi_bready),
        .s_axi_wvalid(s_axi_wvalid),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_32_fifo_gen" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen
   (\goreg_dm.dout_i_reg[4] ,
    full,
    empty,
    din,
    rd_en,
    cmd_empty_reg,
    cmd_push_block_reg,
    split_in_progress,
    D,
    wr_en,
    \S_AXI_AID_Q_reg[0] ,
    split_in_progress_reg,
    last_split__1,
    \queue_id_reg[0] ,
    aclk,
    SR,
    Q,
    ram_full_fb_i_reg,
    \USE_WRITE.wr_cmd_ready ,
    almost_empty,
    cmd_empty,
    aresetn,
    m_axi_bvalid,
    s_axi_bready,
    last_word,
    almost_b_empty,
    cmd_b_empty,
    \cmd_depth_reg[5] ,
    cmd_push_block,
    command_ongoing,
    \queue_id_reg[0]_0 ,
    m_axi_awvalid,
    queue_id,
    \queue_id_reg[0]_1 ,
    need_to_split_q,
    multiple_id_non_split,
    split_ongoing_reg,
    access_is_incr_q);
  output [4:0]\goreg_dm.dout_i_reg[4] ;
  output full;
  output empty;
  output [0:0]din;
  output rd_en;
  output cmd_empty_reg;
  output cmd_push_block_reg;
  output split_in_progress;
  output [4:0]D;
  output wr_en;
  output \S_AXI_AID_Q_reg[0] ;
  output split_in_progress_reg;
  output last_split__1;
  output \queue_id_reg[0] ;
  input aclk;
  input [0:0]SR;
  input [3:0]Q;
  input ram_full_fb_i_reg;
  input \USE_WRITE.wr_cmd_ready ;
  input almost_empty;
  input cmd_empty;
  input aresetn;
  input m_axi_bvalid;
  input s_axi_bready;
  input last_word;
  input almost_b_empty;
  input cmd_b_empty;
  input [5:0]\cmd_depth_reg[5] ;
  input cmd_push_block;
  input command_ongoing;
  input \queue_id_reg[0]_0 ;
  input m_axi_awvalid;
  input queue_id;
  input \queue_id_reg[0]_1 ;
  input need_to_split_q;
  input multiple_id_non_split;
  input [3:0]split_ongoing_reg;
  input access_is_incr_q;

  wire [4:0]D;
  wire [3:0]Q;
  wire [0:0]SR;
  wire \S_AXI_AID_Q_reg[0] ;
  wire S_AXI_AREADY_I_i_5_n_0;
  wire \USE_WRITE.wr_cmd_ready ;
  wire access_is_incr_q;
  wire aclk;
  wire almost_b_empty;
  wire almost_empty;
  wire aresetn;
  wire cmd_b_empty;
  wire \cmd_depth[5]_i_3_n_0 ;
  wire [5:0]\cmd_depth_reg[5] ;
  wire cmd_empty;
  wire cmd_empty0;
  wire cmd_empty_reg;
  wire cmd_push_block;
  wire cmd_push_block_reg;
  wire command_ongoing;
  wire [0:0]din;
  wire empty;
  wire full;
  wire [4:0]\goreg_dm.dout_i_reg[4] ;
  wire last_split__1;
  wire last_word;
  wire m_axi_awvalid;
  wire m_axi_bvalid;
  wire multiple_id_non_split;
  wire multiple_id_non_split_i_4_n_0;
  wire need_to_split_q;
  wire queue_id;
  wire \queue_id_reg[0] ;
  wire \queue_id_reg[0]_0 ;
  wire \queue_id_reg[0]_1 ;
  wire ram_full_fb_i_reg;
  wire rd_en;
  wire s_axi_bready;
  wire split_in_progress;
  wire split_in_progress_reg;
  wire [3:0]split_ongoing_reg;
  wire wr_en;
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
    .INIT(64'h82000082FFFFFFFF)) 
    S_AXI_AREADY_I_i_3
       (.I0(S_AXI_AREADY_I_i_5_n_0),
        .I1(Q[0]),
        .I2(split_ongoing_reg[0]),
        .I3(Q[3]),
        .I4(split_ongoing_reg[3]),
        .I5(access_is_incr_q),
        .O(last_split__1));
  LUT4 #(
    .INIT(16'h9009)) 
    S_AXI_AREADY_I_i_5
       (.I0(split_ongoing_reg[2]),
        .I1(Q[2]),
        .I2(split_ongoing_reg[1]),
        .I3(Q[1]),
        .O(S_AXI_AREADY_I_i_5_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    \cmd_depth[1]_i_1 
       (.I0(cmd_empty0),
        .I1(\cmd_depth_reg[5] [1]),
        .I2(\cmd_depth_reg[5] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h6AA9)) 
    \cmd_depth[2]_i_1 
       (.I0(\cmd_depth_reg[5] [2]),
        .I1(cmd_empty0),
        .I2(\cmd_depth_reg[5] [1]),
        .I3(\cmd_depth_reg[5] [0]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT5 #(
    .INIT(32'h6AAAAAA9)) 
    \cmd_depth[3]_i_1 
       (.I0(\cmd_depth_reg[5] [3]),
        .I1(cmd_empty0),
        .I2(\cmd_depth_reg[5] [0]),
        .I3(\cmd_depth_reg[5] [1]),
        .I4(\cmd_depth_reg[5] [2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAA9)) 
    \cmd_depth[4]_i_1 
       (.I0(\cmd_depth_reg[5] [4]),
        .I1(cmd_empty0),
        .I2(\cmd_depth_reg[5] [0]),
        .I3(\cmd_depth_reg[5] [1]),
        .I4(\cmd_depth_reg[5] [2]),
        .I5(\cmd_depth_reg[5] [3]),
        .O(D[3]));
  LUT4 #(
    .INIT(16'h6AA9)) 
    \cmd_depth[5]_i_2 
       (.I0(\cmd_depth_reg[5] [5]),
        .I1(\cmd_depth[5]_i_3_n_0 ),
        .I2(\cmd_depth_reg[5] [3]),
        .I3(\cmd_depth_reg[5] [4]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'h555455545554D555)) 
    \cmd_depth[5]_i_3 
       (.I0(\cmd_depth_reg[5] [3]),
        .I1(\cmd_depth_reg[5] [2]),
        .I2(\cmd_depth_reg[5] [1]),
        .I3(\cmd_depth_reg[5] [0]),
        .I4(cmd_push_block_reg),
        .I5(\USE_WRITE.wr_cmd_ready ),
        .O(\cmd_depth[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT5 #(
    .INIT(32'h66F60090)) 
    cmd_empty_i_1
       (.I0(\USE_WRITE.wr_cmd_ready ),
        .I1(cmd_push_block_reg),
        .I2(almost_empty),
        .I3(cmd_empty0),
        .I4(cmd_empty),
        .O(cmd_empty_reg));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h1)) 
    cmd_empty_i_3
       (.I0(cmd_push_block_reg),
        .I1(\USE_WRITE.wr_cmd_ready ),
        .O(cmd_empty0));
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
  (* C_DIN_WIDTH = "5" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "32" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "5" *) 
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
  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_fifo_generator_v13_2_11 fifo_gen_inst
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
        .din({din,Q}),
        .dout(\goreg_dm.dout_i_reg[4] ),
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
        .wr_en(ram_full_fb_i_reg),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT1 #(
    .INIT(2'h1)) 
    fifo_gen_inst_i_1
       (.I0(cmd_push_block_reg),
        .O(wr_en));
  LUT2 #(
    .INIT(4'h2)) 
    fifo_gen_inst_i_1__0
       (.I0(need_to_split_q),
        .I1(last_split__1),
        .O(din));
  LUT4 #(
    .INIT(16'h4000)) 
    fifo_gen_inst_i_3
       (.I0(empty),
        .I1(m_axi_bvalid),
        .I2(s_axi_bready),
        .I3(last_word),
        .O(rd_en));
  LUT6 #(
    .INIT(64'hFFFBFFFBFFFBFFFF)) 
    fifo_gen_inst_i_3__0
       (.I0(cmd_push_block),
        .I1(command_ongoing),
        .I2(full),
        .I3(\queue_id_reg[0]_0 ),
        .I4(\S_AXI_AID_Q_reg[0] ),
        .I5(split_in_progress_reg),
        .O(cmd_push_block_reg));
  LUT6 #(
    .INIT(64'h00000000FFD5D5FF)) 
    m_axi_awvalid_INST_0_i_1
       (.I0(m_axi_awvalid),
        .I1(cmd_b_empty),
        .I2(cmd_empty),
        .I3(queue_id),
        .I4(\queue_id_reg[0]_1 ),
        .I5(need_to_split_q),
        .O(split_in_progress_reg));
  LUT5 #(
    .INIT(32'h0000F999)) 
    m_axi_awvalid_INST_0_i_2
       (.I0(\queue_id_reg[0]_1 ),
        .I1(queue_id),
        .I2(cmd_empty),
        .I3(cmd_b_empty),
        .I4(multiple_id_non_split),
        .O(\S_AXI_AID_Q_reg[0] ));
  LUT5 #(
    .INIT(32'hF5D5D5D5)) 
    multiple_id_non_split_i_3
       (.I0(aresetn),
        .I1(cmd_empty),
        .I2(multiple_id_non_split_i_4_n_0),
        .I3(almost_empty),
        .I4(\USE_WRITE.wr_cmd_ready ),
        .O(split_in_progress));
  LUT6 #(
    .INIT(64'hFFFFFFFF40000000)) 
    multiple_id_non_split_i_4
       (.I0(empty),
        .I1(m_axi_bvalid),
        .I2(s_axi_bready),
        .I3(last_word),
        .I4(almost_b_empty),
        .I5(cmd_b_empty),
        .O(multiple_id_non_split_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \queue_id[0]_i_1 
       (.I0(queue_id),
        .I1(cmd_push_block_reg),
        .I2(\queue_id_reg[0]_1 ),
        .O(\queue_id_reg[0] ));
endmodule

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_32_fifo_gen" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__parameterized0
   (din,
    rd_en,
    ram_full_i_reg,
    E,
    multiple_id_non_split0,
    cmd_push_block_reg,
    D,
    m_axi_arvalid,
    split_in_progress,
    s_axi_rvalid,
    s_axi_rlast,
    m_axi_rready,
    s_axi_arvalid_0,
    \queue_id_reg[0] ,
    s_axi_arvalid_1,
    empty_fwft_i_reg,
    aclk,
    SR,
    command_ongoing,
    cmd_push_block,
    m_axi_arready,
    aresetn,
    cmd_empty,
    \queue_id_reg[0]_0 ,
    \queue_id_reg[0]_1 ,
    cmd_push_block_reg_0,
    need_to_split_q,
    Q,
    multiple_id_non_split,
    almost_empty,
    m_axi_rvalid,
    s_axi_rready,
    m_axi_rlast,
    split_ongoing_reg,
    split_ongoing_reg_0,
    access_is_incr_q,
    s_axi_arvalid,
    command_ongoing_reg,
    areset_d,
    command_ongoing_reg_0);
  output [0:0]din;
  output rd_en;
  output ram_full_i_reg;
  output [0:0]E;
  output multiple_id_non_split0;
  output cmd_push_block_reg;
  output [4:0]D;
  output m_axi_arvalid;
  output split_in_progress;
  output s_axi_rvalid;
  output s_axi_rlast;
  output m_axi_rready;
  output s_axi_arvalid_0;
  output \queue_id_reg[0] ;
  output s_axi_arvalid_1;
  output [0:0]empty_fwft_i_reg;
  input aclk;
  input [0:0]SR;
  input command_ongoing;
  input cmd_push_block;
  input m_axi_arready;
  input aresetn;
  input cmd_empty;
  input \queue_id_reg[0]_0 ;
  input \queue_id_reg[0]_1 ;
  input cmd_push_block_reg_0;
  input need_to_split_q;
  input [5:0]Q;
  input multiple_id_non_split;
  input almost_empty;
  input m_axi_rvalid;
  input s_axi_rready;
  input m_axi_rlast;
  input [3:0]split_ongoing_reg;
  input [3:0]split_ongoing_reg_0;
  input access_is_incr_q;
  input s_axi_arvalid;
  input command_ongoing_reg;
  input [1:0]areset_d;
  input command_ongoing_reg_0;

  wire [4:0]D;
  wire [0:0]E;
  wire [5:0]Q;
  wire [0:0]SR;
  wire S_AXI_AREADY_I_i_3__0_n_0;
  wire S_AXI_AREADY_I_i_4__0_n_0;
  wire \USE_READ.USE_SPLIT_R.rd_cmd_split ;
  wire access_is_incr_q;
  wire aclk;
  wire almost_empty;
  wire [1:0]areset_d;
  wire aresetn;
  wire \cmd_depth[5]_i_3__0_n_0 ;
  wire cmd_empty;
  wire cmd_empty0;
  wire cmd_push;
  wire cmd_push_block;
  wire cmd_push_block_reg;
  wire cmd_push_block_reg_0;
  wire command_ongoing;
  wire command_ongoing_reg;
  wire command_ongoing_reg_0;
  wire [0:0]din;
  wire empty;
  wire [0:0]empty_fwft_i_reg;
  wire full;
  wire last_split__1;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire m_axi_arvalid_INST_0_i_1_n_0;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire multiple_id_non_split;
  wire multiple_id_non_split0;
  wire need_to_split_q;
  wire \queue_id_reg[0] ;
  wire \queue_id_reg[0]_0 ;
  wire \queue_id_reg[0]_1 ;
  wire ram_full_i_reg;
  wire rd_en;
  wire s_axi_arvalid;
  wire s_axi_arvalid_0;
  wire s_axi_arvalid_1;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire split_in_progress;
  wire [3:0]split_ongoing_reg;
  wire [3:0]split_ongoing_reg_0;
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
    .INIT(64'h44744474FFFF4474)) 
    S_AXI_AREADY_I_i_1__0
       (.I0(s_axi_arvalid),
        .I1(command_ongoing_reg),
        .I2(last_split__1),
        .I3(S_AXI_AREADY_I_i_3__0_n_0),
        .I4(areset_d[1]),
        .I5(areset_d[0]),
        .O(s_axi_arvalid_0));
  LUT6 #(
    .INIT(64'h82000082FFFFFFFF)) 
    S_AXI_AREADY_I_i_2
       (.I0(S_AXI_AREADY_I_i_4__0_n_0),
        .I1(split_ongoing_reg[0]),
        .I2(split_ongoing_reg_0[0]),
        .I3(split_ongoing_reg[3]),
        .I4(split_ongoing_reg_0[3]),
        .I5(access_is_incr_q),
        .O(last_split__1));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h0FDFFFFF)) 
    S_AXI_AREADY_I_i_3__0
       (.I0(m_axi_arvalid_INST_0_i_1_n_0),
        .I1(full),
        .I2(command_ongoing),
        .I3(cmd_push_block),
        .I4(m_axi_arready),
        .O(S_AXI_AREADY_I_i_3__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    S_AXI_AREADY_I_i_4__0
       (.I0(split_ongoing_reg_0[2]),
        .I1(split_ongoing_reg[2]),
        .I2(split_ongoing_reg_0[1]),
        .I3(split_ongoing_reg[1]),
        .O(S_AXI_AREADY_I_i_4__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h69)) 
    \cmd_depth[1]_i_1__0 
       (.I0(cmd_empty0),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h6AA9)) 
    \cmd_depth[2]_i_1__0 
       (.I0(Q[2]),
        .I1(cmd_empty0),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h6AAAAAA9)) 
    \cmd_depth[3]_i_1__0 
       (.I0(Q[3]),
        .I1(cmd_empty0),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAA9)) 
    \cmd_depth[4]_i_1__0 
       (.I0(Q[4]),
        .I1(cmd_empty0),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \cmd_depth[4]_i_2 
       (.I0(m_axi_arvalid_INST_0_i_1_n_0),
        .I1(full),
        .I2(command_ongoing),
        .I3(cmd_push_block),
        .I4(rd_en),
        .O(cmd_empty0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h4000BFFF)) 
    \cmd_depth[5]_i_1__0 
       (.I0(empty),
        .I1(m_axi_rvalid),
        .I2(s_axi_rready),
        .I3(m_axi_rlast),
        .I4(cmd_push_block_reg),
        .O(empty_fwft_i_reg));
  LUT4 #(
    .INIT(16'h6AA9)) 
    \cmd_depth[5]_i_2__0 
       (.I0(Q[5]),
        .I1(\cmd_depth[5]_i_3__0_n_0 ),
        .I2(Q[3]),
        .I3(Q[4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hD5555554)) 
    \cmd_depth[5]_i_3__0 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(cmd_empty0),
        .O(\cmd_depth[5]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h0F000000FF200000)) 
    cmd_push_block_i_1__0
       (.I0(m_axi_arvalid_INST_0_i_1_n_0),
        .I1(full),
        .I2(command_ongoing),
        .I3(cmd_push_block),
        .I4(aresetn),
        .I5(m_axi_arready),
        .O(ram_full_i_reg));
  LUT6 #(
    .INIT(64'hFF8FFFFF88880000)) 
    command_ongoing_i_1__0
       (.I0(s_axi_arvalid),
        .I1(command_ongoing_reg),
        .I2(last_split__1),
        .I3(S_AXI_AREADY_I_i_3__0_n_0),
        .I4(command_ongoing_reg_0),
        .I5(command_ongoing),
        .O(s_axi_arvalid_1));
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
  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_fifo_generator_v13_2_11__parameterized0 fifo_gen_inst
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
    fifo_gen_inst_i_1__1
       (.I0(need_to_split_q),
        .I1(last_split__1),
        .O(din));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT1 #(
    .INIT(2'h1)) 
    fifo_gen_inst_i_2__0
       (.I0(cmd_push_block_reg),
        .O(cmd_push));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h4000)) 
    fifo_gen_inst_i_3__1
       (.I0(empty),
        .I1(m_axi_rvalid),
        .I2(s_axi_rready),
        .I3(m_axi_rlast),
        .O(rd_en));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    fifo_gen_inst_i_4__0
       (.I0(cmd_push_block),
        .I1(command_ongoing),
        .I2(full),
        .I3(m_axi_arvalid_INST_0_i_1_n_0),
        .O(cmd_push_block_reg));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hF020)) 
    m_axi_arvalid_INST_0
       (.I0(m_axi_arvalid_INST_0_i_1_n_0),
        .I1(full),
        .I2(command_ongoing),
        .I3(cmd_push_block),
        .O(m_axi_arvalid));
  LUT6 #(
    .INIT(64'h5F5F5F5F5F11115F)) 
    m_axi_arvalid_INST_0_i_1
       (.I0(need_to_split_q),
        .I1(cmd_push_block_reg_0),
        .I2(multiple_id_non_split),
        .I3(\queue_id_reg[0]_1 ),
        .I4(\queue_id_reg[0]_0 ),
        .I5(cmd_empty),
        .O(m_axi_arvalid_INST_0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h31)) 
    m_axi_rready_INST_0
       (.I0(m_axi_rvalid),
        .I1(empty),
        .I2(s_axi_rready),
        .O(m_axi_rready));
  LUT6 #(
    .INIT(64'h000000000000283C)) 
    multiple_id_non_split_i_2__0
       (.I0(cmd_empty),
        .I1(\queue_id_reg[0]_0 ),
        .I2(\queue_id_reg[0]_1 ),
        .I3(cmd_push_block_reg_0),
        .I4(need_to_split_q),
        .I5(cmd_push_block_reg),
        .O(multiple_id_non_split0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \queue_id[0]_i_1__0 
       (.I0(\queue_id_reg[0]_1 ),
        .I1(cmd_push_block_reg),
        .I2(\queue_id_reg[0]_0 ),
        .O(\queue_id_reg[0] ));
  LUT2 #(
    .INIT(4'h2)) 
    s_axi_rlast_INST_0
       (.I0(m_axi_rlast),
        .I1(\USE_READ.USE_SPLIT_R.rd_cmd_split ),
        .O(s_axi_rlast));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    s_axi_rvalid_INST_0
       (.I0(m_axi_rvalid),
        .I1(empty),
        .O(s_axi_rvalid));
  LUT4 #(
    .INIT(16'hFDDD)) 
    split_in_progress_i_3
       (.I0(aresetn),
        .I1(cmd_empty),
        .I2(rd_en),
        .I3(almost_empty),
        .O(split_in_progress));
  LUT1 #(
    .INIT(2'h1)) 
    split_ongoing_i_1__0
       (.I0(S_AXI_AREADY_I_i_3__0_n_0),
        .O(E));
endmodule

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_32_fifo_gen" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__xdcDup__1
   (dout,
    full,
    empty,
    SR,
    din,
    cmd_b_push_block_reg,
    ram_full_i_reg,
    cmd_b_push_block_reg_0,
    E,
    cmd_b_push_block_reg_1,
    D,
    aresetn_0,
    m_axi_awready_0,
    \goreg_dm.dout_i_reg[1] ,
    empty_fwft_i_reg,
    m_axi_wvalid,
    \goreg_dm.dout_i_reg[2] ,
    first_mi_word_reg,
    s_axi_awvalid_0,
    s_axi_awvalid_1,
    aclk,
    \gpr1.dout_i_reg[1] ,
    wr_en,
    \USE_WRITE.wr_cmd_ready ,
    cmd_b_push_block,
    aresetn,
    cmd_b_push_block_reg_2,
    \USE_B_CHANNEL.cmd_b_depth_reg[0] ,
    m_axi_bvalid,
    s_axi_bready,
    last_word,
    almost_b_empty,
    rd_en,
    cmd_b_empty,
    Q,
    cmd_push_block,
    m_axi_awready,
    m_axi_awvalid,
    m_axi_awvalid_0,
    m_axi_awvalid_1,
    command_ongoing,
    length_counter_1_reg,
    first_mi_word,
    s_axi_wvalid,
    m_axi_wready,
    m_axi_wlast,
    \m_axi_awlen[3] ,
    need_to_split_q,
    \m_axi_awlen[3]_0 ,
    s_axi_awvalid,
    last_split__1,
    areset_d,
    command_ongoing_reg);
  output [4:0]dout;
  output full;
  output empty;
  output [0:0]SR;
  output [3:0]din;
  output cmd_b_push_block_reg;
  output ram_full_i_reg;
  output cmd_b_push_block_reg_0;
  output [0:0]E;
  output cmd_b_push_block_reg_1;
  output [4:0]D;
  output aresetn_0;
  output [0:0]m_axi_awready_0;
  output \goreg_dm.dout_i_reg[1] ;
  output empty_fwft_i_reg;
  output m_axi_wvalid;
  output \goreg_dm.dout_i_reg[2] ;
  output first_mi_word_reg;
  output s_axi_awvalid_0;
  output s_axi_awvalid_1;
  input aclk;
  input \gpr1.dout_i_reg[1] ;
  input wr_en;
  input \USE_WRITE.wr_cmd_ready ;
  input cmd_b_push_block;
  input aresetn;
  input cmd_b_push_block_reg_2;
  input \USE_B_CHANNEL.cmd_b_depth_reg[0] ;
  input m_axi_bvalid;
  input s_axi_bready;
  input last_word;
  input almost_b_empty;
  input rd_en;
  input cmd_b_empty;
  input [5:0]Q;
  input cmd_push_block;
  input m_axi_awready;
  input m_axi_awvalid;
  input m_axi_awvalid_0;
  input m_axi_awvalid_1;
  input command_ongoing;
  input [1:0]length_counter_1_reg;
  input first_mi_word;
  input s_axi_wvalid;
  input m_axi_wready;
  input m_axi_wlast;
  input [3:0]\m_axi_awlen[3] ;
  input need_to_split_q;
  input [3:0]\m_axi_awlen[3]_0 ;
  input s_axi_awvalid;
  input last_split__1;
  input [1:0]areset_d;
  input command_ongoing_reg;

  wire [4:0]D;
  wire [0:0]E;
  wire [5:0]Q;
  wire [0:0]SR;
  wire S_AXI_AREADY_I_i_4_n_0;
  wire \USE_B_CHANNEL.cmd_b_depth[5]_i_3_n_0 ;
  wire \USE_B_CHANNEL.cmd_b_depth_reg[0] ;
  wire \USE_WRITE.wr_cmd_ready ;
  wire aclk;
  wire almost_b_empty;
  wire [1:0]areset_d;
  wire aresetn;
  wire aresetn_0;
  wire cmd_b_empty;
  wire cmd_b_empty0;
  wire cmd_b_push_block;
  wire cmd_b_push_block_reg;
  wire cmd_b_push_block_reg_0;
  wire cmd_b_push_block_reg_1;
  wire cmd_b_push_block_reg_2;
  wire cmd_push_block;
  wire command_ongoing;
  wire command_ongoing_reg;
  wire [3:0]din;
  wire [4:0]dout;
  wire empty;
  wire empty_fwft_i_reg;
  wire first_mi_word;
  wire first_mi_word_reg;
  wire full;
  wire \goreg_dm.dout_i_reg[1] ;
  wire \goreg_dm.dout_i_reg[2] ;
  wire \gpr1.dout_i_reg[1] ;
  wire last_split__1;
  wire last_word;
  wire [1:0]length_counter_1_reg;
  wire [3:0]\m_axi_awlen[3] ;
  wire [3:0]\m_axi_awlen[3]_0 ;
  wire m_axi_awready;
  wire [0:0]m_axi_awready_0;
  wire m_axi_awvalid;
  wire m_axi_awvalid_0;
  wire m_axi_awvalid_1;
  wire m_axi_bvalid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire need_to_split_q;
  wire ram_full_i_reg;
  wire rd_en;
  wire s_axi_awvalid;
  wire s_axi_awvalid_0;
  wire s_axi_awvalid_1;
  wire s_axi_bready;
  wire s_axi_wvalid;
  wire wr_en;
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

  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT1 #(
    .INIT(2'h1)) 
    S_AXI_AREADY_I_i_1
       (.I0(aresetn),
        .O(SR));
  LUT6 #(
    .INIT(64'h44744474FFFF4474)) 
    S_AXI_AREADY_I_i_2__0
       (.I0(s_axi_awvalid),
        .I1(cmd_b_push_block_reg_2),
        .I2(last_split__1),
        .I3(S_AXI_AREADY_I_i_4_n_0),
        .I4(areset_d[1]),
        .I5(areset_d[0]),
        .O(s_axi_awvalid_0));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h7)) 
    S_AXI_AREADY_I_i_4
       (.I0(ram_full_i_reg),
        .I1(m_axi_awready),
        .O(S_AXI_AREADY_I_i_4_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    \USE_B_CHANNEL.cmd_b_depth[1]_i_1 
       (.I0(cmd_b_empty0),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h6AA9)) 
    \USE_B_CHANNEL.cmd_b_depth[2]_i_1 
       (.I0(Q[2]),
        .I1(cmd_b_empty0),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h6AAAAAA9)) 
    \USE_B_CHANNEL.cmd_b_depth[3]_i_1 
       (.I0(Q[3]),
        .I1(cmd_b_empty0),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAA9)) 
    \USE_B_CHANNEL.cmd_b_depth[4]_i_1 
       (.I0(Q[4]),
        .I1(cmd_b_empty0),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h2222222202222222)) 
    \USE_B_CHANNEL.cmd_b_depth[4]_i_2 
       (.I0(ram_full_i_reg),
        .I1(cmd_b_push_block),
        .I2(last_word),
        .I3(s_axi_bready),
        .I4(m_axi_bvalid),
        .I5(\USE_B_CHANNEL.cmd_b_depth_reg[0] ),
        .O(cmd_b_empty0));
  LUT6 #(
    .INIT(64'h4B44444444444444)) 
    \USE_B_CHANNEL.cmd_b_depth[5]_i_1 
       (.I0(cmd_b_push_block),
        .I1(ram_full_i_reg),
        .I2(\USE_B_CHANNEL.cmd_b_depth_reg[0] ),
        .I3(m_axi_bvalid),
        .I4(s_axi_bready),
        .I5(last_word),
        .O(E));
  LUT5 #(
    .INIT(32'h6AAAAAA9)) 
    \USE_B_CHANNEL.cmd_b_depth[5]_i_2 
       (.I0(Q[5]),
        .I1(\USE_B_CHANNEL.cmd_b_depth[5]_i_3_n_0 ),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'h545454545454D554)) 
    \USE_B_CHANNEL.cmd_b_depth[5]_i_3 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(ram_full_i_reg),
        .I4(cmd_b_push_block),
        .I5(rd_en),
        .O(\USE_B_CHANNEL.cmd_b_depth[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'hF4BBB000)) 
    \USE_B_CHANNEL.cmd_b_empty_i_1 
       (.I0(cmd_b_push_block),
        .I1(ram_full_i_reg),
        .I2(almost_b_empty),
        .I3(rd_en),
        .I4(cmd_b_empty),
        .O(cmd_b_push_block_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h00E0)) 
    cmd_b_push_block_i_1
       (.I0(cmd_b_push_block),
        .I1(ram_full_i_reg),
        .I2(aresetn),
        .I3(cmd_b_push_block_reg_2),
        .O(cmd_b_push_block_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h0A88)) 
    cmd_push_block_i_1
       (.I0(aresetn),
        .I1(cmd_push_block),
        .I2(m_axi_awready),
        .I3(ram_full_i_reg),
        .O(aresetn_0));
  LUT6 #(
    .INIT(64'hFF8FFFFF88880000)) 
    command_ongoing_i_1
       (.I0(s_axi_awvalid),
        .I1(cmd_b_push_block_reg_2),
        .I2(last_split__1),
        .I3(S_AXI_AREADY_I_i_4_n_0),
        .I4(command_ongoing_reg),
        .I5(command_ongoing),
        .O(s_axi_awvalid_1));
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
  (* C_DIN_WIDTH = "5" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "32" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "5" *) 
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
  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_fifo_generator_v13_2_11__xdcDup__1 fifo_gen_inst
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
        .din({\gpr1.dout_i_reg[1] ,din}),
        .dout(dout),
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
        .rd_en(\USE_WRITE.wr_cmd_ready ),
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
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h4)) 
    fifo_gen_inst_i_2__1
       (.I0(cmd_b_push_block),
        .I1(ram_full_i_reg),
        .O(cmd_b_push_block_reg));
  LUT5 #(
    .INIT(32'h00000002)) 
    fifo_gen_inst_i_6
       (.I0(first_mi_word),
        .I1(dout[0]),
        .I2(dout[1]),
        .I3(dout[3]),
        .I4(dout[2]),
        .O(first_mi_word_reg));
  LUT6 #(
    .INIT(64'hACACCC3C5C5CCC3C)) 
    \length_counter_1[1]_i_1 
       (.I0(dout[1]),
        .I1(length_counter_1_reg[1]),
        .I2(empty_fwft_i_reg),
        .I3(length_counter_1_reg[0]),
        .I4(first_mi_word),
        .I5(dout[0]),
        .O(\goreg_dm.dout_i_reg[1] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    \m_axi_awlen[0]_INST_0 
       (.I0(\m_axi_awlen[3] [1]),
        .I1(\m_axi_awlen[3] [0]),
        .I2(\m_axi_awlen[3] [3]),
        .I3(\m_axi_awlen[3] [2]),
        .I4(need_to_split_q),
        .I5(\m_axi_awlen[3]_0 [0]),
        .O(din[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    \m_axi_awlen[1]_INST_0 
       (.I0(\m_axi_awlen[3] [1]),
        .I1(\m_axi_awlen[3] [0]),
        .I2(\m_axi_awlen[3] [3]),
        .I3(\m_axi_awlen[3] [2]),
        .I4(need_to_split_q),
        .I5(\m_axi_awlen[3]_0 [1]),
        .O(din[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    \m_axi_awlen[2]_INST_0 
       (.I0(\m_axi_awlen[3] [1]),
        .I1(\m_axi_awlen[3] [0]),
        .I2(\m_axi_awlen[3] [3]),
        .I3(\m_axi_awlen[3] [2]),
        .I4(need_to_split_q),
        .I5(\m_axi_awlen[3]_0 [2]),
        .O(din[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFE0000)) 
    \m_axi_awlen[3]_INST_0 
       (.I0(\m_axi_awlen[3] [1]),
        .I1(\m_axi_awlen[3] [0]),
        .I2(\m_axi_awlen[3] [3]),
        .I3(\m_axi_awlen[3] [2]),
        .I4(need_to_split_q),
        .I5(\m_axi_awlen[3]_0 [3]),
        .O(din[3]));
  LUT6 #(
    .INIT(64'hFFFF0000000E0000)) 
    m_axi_awvalid_INST_0
       (.I0(m_axi_awvalid),
        .I1(m_axi_awvalid_0),
        .I2(full),
        .I3(m_axi_awvalid_1),
        .I4(command_ongoing),
        .I5(cmd_push_block),
        .O(ram_full_i_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFF00010000)) 
    m_axi_wlast_INST_0_i_1
       (.I0(dout[2]),
        .I1(dout[3]),
        .I2(dout[1]),
        .I3(dout[0]),
        .I4(first_mi_word),
        .I5(m_axi_wlast),
        .O(\goreg_dm.dout_i_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h2)) 
    m_axi_wvalid_INST_0
       (.I0(s_axi_wvalid),
        .I1(empty),
        .O(m_axi_wvalid));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h40)) 
    s_axi_wready_INST_0
       (.I0(empty),
        .I1(s_axi_wvalid),
        .I2(m_axi_wready),
        .O(empty_fwft_i_reg));
  LUT1 #(
    .INIT(2'h1)) 
    split_ongoing_i_1
       (.I0(S_AXI_AREADY_I_i_4_n_0),
        .O(m_axi_awready_0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_33_a_axi3_conv" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv
   (dout,
    empty,
    SR,
    din,
    \goreg_dm.dout_i_reg[4] ,
    E,
    areset_d,
    ram_full_i_reg,
    cmd_push_block_reg_0,
    m_axi_awaddr,
    \goreg_dm.dout_i_reg[1] ,
    empty_fwft_i_reg,
    m_axi_wvalid,
    \goreg_dm.dout_i_reg[2] ,
    first_mi_word_reg,
    \areset_d_reg[0]_0 ,
    m_axi_awlock,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    aclk,
    \USE_WRITE.wr_cmd_ready ,
    s_axi_awid,
    s_axi_awlock,
    s_axi_awsize,
    s_axi_awlen,
    aresetn,
    m_axi_bvalid,
    s_axi_bready,
    last_word,
    m_axi_awready,
    length_counter_1_reg,
    first_mi_word,
    s_axi_wvalid,
    m_axi_wready,
    m_axi_wlast,
    s_axi_awvalid,
    s_axi_awaddr,
    s_axi_awburst,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    \cmd_depth_reg[5]_0 );
  output [4:0]dout;
  output empty;
  output [0:0]SR;
  output [4:0]din;
  output [4:0]\goreg_dm.dout_i_reg[4] ;
  output [0:0]E;
  output [1:0]areset_d;
  output ram_full_i_reg;
  output cmd_push_block_reg_0;
  output [31:0]m_axi_awaddr;
  output \goreg_dm.dout_i_reg[1] ;
  output empty_fwft_i_reg;
  output m_axi_wvalid;
  output \goreg_dm.dout_i_reg[2] ;
  output first_mi_word_reg;
  output \areset_d_reg[0]_0 ;
  output [0:0]m_axi_awlock;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  input aclk;
  input \USE_WRITE.wr_cmd_ready ;
  input [0:0]s_axi_awid;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awsize;
  input [7:0]s_axi_awlen;
  input aresetn;
  input m_axi_bvalid;
  input s_axi_bready;
  input last_word;
  input m_axi_awready;
  input [1:0]length_counter_1_reg;
  input first_mi_word;
  input s_axi_wvalid;
  input m_axi_wready;
  input m_axi_wlast;
  input s_axi_awvalid;
  input [31:0]s_axi_awaddr;
  input [1:0]s_axi_awburst;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [0:0]\cmd_depth_reg[5]_0 ;

  wire [0:0]E;
  wire M_AXI_AADDR_I1__0;
  wire [0:0]SR;
  wire [31:0]S_AXI_AADDR_Q;
  wire [3:0]S_AXI_ALEN_Q;
  wire \S_AXI_ALOCK_Q_reg_n_0_[0] ;
  wire \USE_BURSTS.cmd_queue_n_14 ;
  wire \USE_BURSTS.cmd_queue_n_15 ;
  wire \USE_BURSTS.cmd_queue_n_16 ;
  wire \USE_BURSTS.cmd_queue_n_17 ;
  wire \USE_BURSTS.cmd_queue_n_18 ;
  wire \USE_BURSTS.cmd_queue_n_19 ;
  wire \USE_BURSTS.cmd_queue_n_20 ;
  wire \USE_BURSTS.cmd_queue_n_21 ;
  wire \USE_BURSTS.cmd_queue_n_22 ;
  wire \USE_BURSTS.cmd_queue_n_29 ;
  wire \USE_BURSTS.cmd_queue_n_30 ;
  wire \USE_B_CHANNEL.cmd_b_depth[0]_i_1_n_0 ;
  wire [5:0]\USE_B_CHANNEL.cmd_b_depth_reg ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_12 ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_13 ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_14 ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_15 ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_16 ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_18 ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_19 ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_21 ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_9 ;
  wire \USE_WRITE.wr_cmd_b_ready ;
  wire \USE_WRITE.wr_cmd_ready ;
  wire access_is_incr;
  wire access_is_incr_q;
  wire aclk;
  wire [11:5]addr_step;
  wire [11:5]addr_step_q;
  wire \addr_step_q[6]_i_1_n_0 ;
  wire \addr_step_q[7]_i_1_n_0 ;
  wire \addr_step_q[8]_i_1_n_0 ;
  wire \addr_step_q[9]_i_1_n_0 ;
  wire almost_b_empty;
  wire almost_empty;
  wire [1:0]areset_d;
  wire \areset_d_reg[0]_0 ;
  wire aresetn;
  wire cmd_b_empty;
  wire cmd_b_push;
  wire cmd_b_push_block;
  wire cmd_b_split_i;
  wire \cmd_depth[0]_i_1_n_0 ;
  wire [5:0]cmd_depth_reg;
  wire [0:0]\cmd_depth_reg[5]_0 ;
  wire cmd_empty;
  wire cmd_id_check__3;
  wire cmd_push;
  wire cmd_push_block;
  wire cmd_push_block_reg_0;
  wire command_ongoing;
  wire [4:0]din;
  wire [4:0]dout;
  wire empty;
  wire empty_fwft_i_reg;
  wire first_mi_word;
  wire first_mi_word_reg;
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
  wire \goreg_dm.dout_i_reg[1] ;
  wire \goreg_dm.dout_i_reg[2] ;
  wire [4:0]\goreg_dm.dout_i_reg[4] ;
  wire incr_need_to_split__0;
  wire \inst/empty ;
  wire \inst/full ;
  wire \inst/full_0 ;
  wire last_split__1;
  wire last_word;
  wire [1:0]length_counter_1_reg;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [0:0]m_axi_awlock;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_bvalid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire multiple_id_non_split;
  wire multiple_id_non_split_i_1_n_0;
  wire multiple_id_non_split_i_2_n_0;
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
  wire \next_mi_addr_reg[15]_i_1_n_0 ;
  wire \next_mi_addr_reg[15]_i_1_n_1 ;
  wire \next_mi_addr_reg[15]_i_1_n_2 ;
  wire \next_mi_addr_reg[15]_i_1_n_3 ;
  wire \next_mi_addr_reg[19]_i_1_n_0 ;
  wire \next_mi_addr_reg[19]_i_1_n_1 ;
  wire \next_mi_addr_reg[19]_i_1_n_2 ;
  wire \next_mi_addr_reg[19]_i_1_n_3 ;
  wire \next_mi_addr_reg[23]_i_1_n_0 ;
  wire \next_mi_addr_reg[23]_i_1_n_1 ;
  wire \next_mi_addr_reg[23]_i_1_n_2 ;
  wire \next_mi_addr_reg[23]_i_1_n_3 ;
  wire \next_mi_addr_reg[27]_i_1_n_0 ;
  wire \next_mi_addr_reg[27]_i_1_n_1 ;
  wire \next_mi_addr_reg[27]_i_1_n_2 ;
  wire \next_mi_addr_reg[27]_i_1_n_3 ;
  wire \next_mi_addr_reg[31]_i_1_n_1 ;
  wire \next_mi_addr_reg[31]_i_1_n_2 ;
  wire \next_mi_addr_reg[31]_i_1_n_3 ;
  wire \next_mi_addr_reg[3]_i_1_n_0 ;
  wire \next_mi_addr_reg[3]_i_1_n_1 ;
  wire \next_mi_addr_reg[3]_i_1_n_2 ;
  wire \next_mi_addr_reg[3]_i_1_n_3 ;
  wire \next_mi_addr_reg[7]_i_1_n_0 ;
  wire \next_mi_addr_reg[7]_i_1_n_1 ;
  wire \next_mi_addr_reg[7]_i_1_n_2 ;
  wire \next_mi_addr_reg[7]_i_1_n_3 ;
  wire [3:0]num_transactions_q;
  wire [31:0]p_0_in;
  wire [3:0]p_0_in__0;
  wire \pushed_commands[3]_i_1_n_0 ;
  wire [3:0]pushed_commands_reg;
  wire pushed_new_cmd;
  wire queue_id;
  wire ram_full_i_reg;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_wvalid;
  wire [6:0]size_mask;
  wire [31:0]size_mask_q;
  wire split_in_progress;
  wire split_in_progress_i_1_n_0;
  wire split_in_progress_reg_n_0;
  wire split_ongoing;
  wire [3:3]\NLW_next_mi_addr_reg[31]_i_1_CO_UNCONNECTED ;

  FDRE \S_AXI_AADDR_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[0]),
        .Q(S_AXI_AADDR_Q[0]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[10]),
        .Q(S_AXI_AADDR_Q[10]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[11]),
        .Q(S_AXI_AADDR_Q[11]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[12] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[12]),
        .Q(S_AXI_AADDR_Q[12]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[13] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[13]),
        .Q(S_AXI_AADDR_Q[13]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[14] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[14]),
        .Q(S_AXI_AADDR_Q[14]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[15] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[15]),
        .Q(S_AXI_AADDR_Q[15]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[16] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[16]),
        .Q(S_AXI_AADDR_Q[16]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[17] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[17]),
        .Q(S_AXI_AADDR_Q[17]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[18] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[18]),
        .Q(S_AXI_AADDR_Q[18]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[19] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[19]),
        .Q(S_AXI_AADDR_Q[19]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[1]),
        .Q(S_AXI_AADDR_Q[1]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[20] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[20]),
        .Q(S_AXI_AADDR_Q[20]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[21] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[21]),
        .Q(S_AXI_AADDR_Q[21]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[22] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[22]),
        .Q(S_AXI_AADDR_Q[22]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[23] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[23]),
        .Q(S_AXI_AADDR_Q[23]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[24] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[24]),
        .Q(S_AXI_AADDR_Q[24]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[25] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[25]),
        .Q(S_AXI_AADDR_Q[25]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[26] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[26]),
        .Q(S_AXI_AADDR_Q[26]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[27] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[27]),
        .Q(S_AXI_AADDR_Q[27]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[28] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[28]),
        .Q(S_AXI_AADDR_Q[28]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[29] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[29]),
        .Q(S_AXI_AADDR_Q[29]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[2]),
        .Q(S_AXI_AADDR_Q[2]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[30] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[30]),
        .Q(S_AXI_AADDR_Q[30]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[31]),
        .Q(S_AXI_AADDR_Q[31]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[3]),
        .Q(S_AXI_AADDR_Q[3]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[4]),
        .Q(S_AXI_AADDR_Q[4]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[5]),
        .Q(S_AXI_AADDR_Q[5]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[6]),
        .Q(S_AXI_AADDR_Q[6]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[7]),
        .Q(S_AXI_AADDR_Q[7]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[8]),
        .Q(S_AXI_AADDR_Q[8]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[9]),
        .Q(S_AXI_AADDR_Q[9]),
        .R(SR));
  FDRE \S_AXI_ABURST_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awburst[0]),
        .Q(m_axi_awburst[0]),
        .R(SR));
  FDRE \S_AXI_ABURST_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awburst[1]),
        .Q(m_axi_awburst[1]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[0]),
        .Q(m_axi_awcache[0]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[1]),
        .Q(m_axi_awcache[1]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[2]),
        .Q(m_axi_awcache[2]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[3]),
        .Q(m_axi_awcache[3]),
        .R(SR));
  FDRE \S_AXI_AID_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awid),
        .Q(din[4]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[0]),
        .Q(S_AXI_ALEN_Q[0]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[1]),
        .Q(S_AXI_ALEN_Q[1]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[2]),
        .Q(S_AXI_ALEN_Q[2]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[3]),
        .Q(S_AXI_ALEN_Q[3]),
        .R(SR));
  FDRE \S_AXI_ALOCK_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlock),
        .Q(\S_AXI_ALOCK_Q_reg_n_0_[0] ),
        .R(SR));
  FDRE \S_AXI_APROT_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awprot[0]),
        .Q(m_axi_awprot[0]),
        .R(SR));
  FDRE \S_AXI_APROT_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awprot[1]),
        .Q(m_axi_awprot[1]),
        .R(SR));
  FDRE \S_AXI_APROT_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awprot[2]),
        .Q(m_axi_awprot[2]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[0]),
        .Q(m_axi_awqos[0]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[1]),
        .Q(m_axi_awqos[1]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[2]),
        .Q(m_axi_awqos[2]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[3]),
        .Q(m_axi_awqos[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    S_AXI_AREADY_I_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_BURSTS.cmd_queue_n_29 ),
        .Q(E),
        .R(SR));
  FDRE \S_AXI_ASIZE_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awsize[0]),
        .Q(m_axi_awsize[0]),
        .R(SR));
  FDRE \S_AXI_ASIZE_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awsize[1]),
        .Q(m_axi_awsize[1]),
        .R(SR));
  FDRE \S_AXI_ASIZE_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awsize[2]),
        .Q(m_axi_awsize[2]),
        .R(SR));
  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__xdcDup__1 \USE_BURSTS.cmd_queue 
       (.D({\USE_BURSTS.cmd_queue_n_17 ,\USE_BURSTS.cmd_queue_n_18 ,\USE_BURSTS.cmd_queue_n_19 ,\USE_BURSTS.cmd_queue_n_20 ,\USE_BURSTS.cmd_queue_n_21 }),
        .E(\USE_BURSTS.cmd_queue_n_15 ),
        .Q(\USE_B_CHANNEL.cmd_b_depth_reg ),
        .SR(SR),
        .\USE_B_CHANNEL.cmd_b_depth_reg[0] (\inst/empty ),
        .\USE_WRITE.wr_cmd_ready (\USE_WRITE.wr_cmd_ready ),
        .aclk(aclk),
        .almost_b_empty(almost_b_empty),
        .areset_d(areset_d),
        .aresetn(aresetn),
        .aresetn_0(\USE_BURSTS.cmd_queue_n_22 ),
        .cmd_b_empty(cmd_b_empty),
        .cmd_b_push_block(cmd_b_push_block),
        .cmd_b_push_block_reg(cmd_b_push),
        .cmd_b_push_block_reg_0(\USE_BURSTS.cmd_queue_n_14 ),
        .cmd_b_push_block_reg_1(\USE_BURSTS.cmd_queue_n_16 ),
        .cmd_b_push_block_reg_2(E),
        .cmd_push_block(cmd_push_block),
        .command_ongoing(command_ongoing),
        .command_ongoing_reg(\areset_d_reg[0]_0 ),
        .din(din[3:0]),
        .dout(dout),
        .empty(empty),
        .empty_fwft_i_reg(empty_fwft_i_reg),
        .first_mi_word(first_mi_word),
        .first_mi_word_reg(first_mi_word_reg),
        .full(\inst/full ),
        .\goreg_dm.dout_i_reg[1] (\goreg_dm.dout_i_reg[1] ),
        .\goreg_dm.dout_i_reg[2] (\goreg_dm.dout_i_reg[2] ),
        .\gpr1.dout_i_reg[1] (din[4]),
        .last_split__1(last_split__1),
        .last_word(last_word),
        .length_counter_1_reg(length_counter_1_reg),
        .\m_axi_awlen[3] (pushed_commands_reg),
        .\m_axi_awlen[3]_0 (S_AXI_ALEN_Q),
        .m_axi_awready(m_axi_awready),
        .m_axi_awready_0(pushed_new_cmd),
        .m_axi_awvalid(\USE_B_CHANNEL.cmd_b_queue_n_19 ),
        .m_axi_awvalid_0(\USE_B_CHANNEL.cmd_b_queue_n_18 ),
        .m_axi_awvalid_1(\inst/full_0 ),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .need_to_split_q(need_to_split_q),
        .ram_full_i_reg(ram_full_i_reg),
        .rd_en(\USE_WRITE.wr_cmd_b_ready ),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awvalid_0(\USE_BURSTS.cmd_queue_n_29 ),
        .s_axi_awvalid_1(\USE_BURSTS.cmd_queue_n_30 ),
        .s_axi_bready(s_axi_bready),
        .s_axi_wvalid(s_axi_wvalid),
        .wr_en(cmd_push));
  LUT1 #(
    .INIT(2'h1)) 
    \USE_B_CHANNEL.cmd_b_depth[0]_i_1 
       (.I0(\USE_B_CHANNEL.cmd_b_depth_reg [0]),
        .O(\USE_B_CHANNEL.cmd_b_depth[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \USE_B_CHANNEL.cmd_b_depth_reg[0] 
       (.C(aclk),
        .CE(\USE_BURSTS.cmd_queue_n_15 ),
        .D(\USE_B_CHANNEL.cmd_b_depth[0]_i_1_n_0 ),
        .Q(\USE_B_CHANNEL.cmd_b_depth_reg [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_B_CHANNEL.cmd_b_depth_reg[1] 
       (.C(aclk),
        .CE(\USE_BURSTS.cmd_queue_n_15 ),
        .D(\USE_BURSTS.cmd_queue_n_21 ),
        .Q(\USE_B_CHANNEL.cmd_b_depth_reg [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_B_CHANNEL.cmd_b_depth_reg[2] 
       (.C(aclk),
        .CE(\USE_BURSTS.cmd_queue_n_15 ),
        .D(\USE_BURSTS.cmd_queue_n_20 ),
        .Q(\USE_B_CHANNEL.cmd_b_depth_reg [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_B_CHANNEL.cmd_b_depth_reg[3] 
       (.C(aclk),
        .CE(\USE_BURSTS.cmd_queue_n_15 ),
        .D(\USE_BURSTS.cmd_queue_n_19 ),
        .Q(\USE_B_CHANNEL.cmd_b_depth_reg [3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_B_CHANNEL.cmd_b_depth_reg[4] 
       (.C(aclk),
        .CE(\USE_BURSTS.cmd_queue_n_15 ),
        .D(\USE_BURSTS.cmd_queue_n_18 ),
        .Q(\USE_B_CHANNEL.cmd_b_depth_reg [4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \USE_B_CHANNEL.cmd_b_depth_reg[5] 
       (.C(aclk),
        .CE(\USE_BURSTS.cmd_queue_n_15 ),
        .D(\USE_BURSTS.cmd_queue_n_17 ),
        .Q(\USE_B_CHANNEL.cmd_b_depth_reg [5]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \USE_B_CHANNEL.cmd_b_empty_i_2 
       (.I0(\USE_B_CHANNEL.cmd_b_depth_reg [2]),
        .I1(\USE_B_CHANNEL.cmd_b_depth_reg [3]),
        .I2(\USE_B_CHANNEL.cmd_b_depth_reg [0]),
        .I3(\USE_B_CHANNEL.cmd_b_depth_reg [1]),
        .I4(\USE_B_CHANNEL.cmd_b_depth_reg [5]),
        .I5(\USE_B_CHANNEL.cmd_b_depth_reg [4]),
        .O(almost_b_empty));
  FDSE #(
    .INIT(1'b1)) 
    \USE_B_CHANNEL.cmd_b_empty_reg 
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_BURSTS.cmd_queue_n_16 ),
        .Q(cmd_b_empty),
        .S(SR));
  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo \USE_B_CHANNEL.cmd_b_queue 
       (.D({\USE_B_CHANNEL.cmd_b_queue_n_12 ,\USE_B_CHANNEL.cmd_b_queue_n_13 ,\USE_B_CHANNEL.cmd_b_queue_n_14 ,\USE_B_CHANNEL.cmd_b_queue_n_15 ,\USE_B_CHANNEL.cmd_b_queue_n_16 }),
        .Q(num_transactions_q),
        .SR(SR),
        .\S_AXI_AID_Q_reg[0] (\USE_B_CHANNEL.cmd_b_queue_n_18 ),
        .\USE_WRITE.wr_cmd_ready (\USE_WRITE.wr_cmd_ready ),
        .access_is_incr_q(access_is_incr_q),
        .aclk(aclk),
        .almost_b_empty(almost_b_empty),
        .almost_empty(almost_empty),
        .aresetn(aresetn),
        .cmd_b_empty(cmd_b_empty),
        .\cmd_depth_reg[5] (cmd_depth_reg),
        .cmd_empty(cmd_empty),
        .cmd_empty_reg(\USE_B_CHANNEL.cmd_b_queue_n_9 ),
        .cmd_push_block(cmd_push_block),
        .cmd_push_block_reg(cmd_push_block_reg_0),
        .command_ongoing(command_ongoing),
        .din(cmd_b_split_i),
        .empty(\inst/empty ),
        .full(\inst/full_0 ),
        .\goreg_dm.dout_i_reg[4] (\goreg_dm.dout_i_reg[4] ),
        .last_split__1(last_split__1),
        .last_word(last_word),
        .m_axi_awvalid(split_in_progress_reg_n_0),
        .m_axi_bvalid(m_axi_bvalid),
        .multiple_id_non_split(multiple_id_non_split),
        .need_to_split_q(need_to_split_q),
        .queue_id(queue_id),
        .\queue_id_reg[0] (\USE_B_CHANNEL.cmd_b_queue_n_21 ),
        .\queue_id_reg[0]_0 (\inst/full ),
        .\queue_id_reg[0]_1 (din[4]),
        .ram_full_fb_i_reg(cmd_b_push),
        .rd_en(\USE_WRITE.wr_cmd_b_ready ),
        .s_axi_bready(s_axi_bready),
        .split_in_progress(split_in_progress),
        .split_in_progress_reg(\USE_B_CHANNEL.cmd_b_queue_n_19 ),
        .split_ongoing_reg(pushed_commands_reg),
        .wr_en(cmd_push));
  LUT2 #(
    .INIT(4'h2)) 
    access_is_incr_q_i_1
       (.I0(s_axi_awburst[0]),
        .I1(s_axi_awburst[1]),
        .O(access_is_incr));
  FDRE #(
    .INIT(1'b0)) 
    access_is_incr_q_reg
       (.C(aclk),
        .CE(E),
        .D(access_is_incr),
        .Q(access_is_incr_q),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \addr_step_q[10]_i_1 
       (.I0(s_axi_awsize[0]),
        .I1(s_axi_awsize[2]),
        .I2(s_axi_awsize[1]),
        .O(addr_step[10]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \addr_step_q[11]_i_1 
       (.I0(s_axi_awsize[2]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awsize[1]),
        .O(addr_step[11]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addr_step_q[5]_i_1 
       (.I0(s_axi_awsize[0]),
        .I1(s_axi_awsize[2]),
        .I2(s_axi_awsize[1]),
        .O(addr_step[5]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addr_step_q[6]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awsize[2]),
        .O(\addr_step_q[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \addr_step_q[7]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awsize[2]),
        .O(\addr_step_q[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addr_step_q[8]_i_1 
       (.I0(s_axi_awsize[2]),
        .I1(s_axi_awsize[1]),
        .I2(s_axi_awsize[0]),
        .O(\addr_step_q[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \addr_step_q[9]_i_1 
       (.I0(s_axi_awsize[0]),
        .I1(s_axi_awsize[2]),
        .I2(s_axi_awsize[1]),
        .O(\addr_step_q[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(addr_step[10]),
        .Q(addr_step_q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(addr_step[11]),
        .Q(addr_step_q[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(addr_step[5]),
        .Q(addr_step_q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[6]_i_1_n_0 ),
        .Q(addr_step_q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[7]_i_1_n_0 ),
        .Q(addr_step_q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[8]_i_1_n_0 ),
        .Q(addr_step_q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[9]_i_1_n_0 ),
        .Q(addr_step_q[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \areset_d_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(SR),
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
    cmd_b_push_block_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_BURSTS.cmd_queue_n_14 ),
        .Q(cmd_b_push_block),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \cmd_depth[0]_i_1 
       (.I0(cmd_depth_reg[0]),
        .O(\cmd_depth[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cmd_depth_reg[0] 
       (.C(aclk),
        .CE(\cmd_depth_reg[5]_0 ),
        .D(\cmd_depth[0]_i_1_n_0 ),
        .Q(cmd_depth_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cmd_depth_reg[1] 
       (.C(aclk),
        .CE(\cmd_depth_reg[5]_0 ),
        .D(\USE_B_CHANNEL.cmd_b_queue_n_16 ),
        .Q(cmd_depth_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cmd_depth_reg[2] 
       (.C(aclk),
        .CE(\cmd_depth_reg[5]_0 ),
        .D(\USE_B_CHANNEL.cmd_b_queue_n_15 ),
        .Q(cmd_depth_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cmd_depth_reg[3] 
       (.C(aclk),
        .CE(\cmd_depth_reg[5]_0 ),
        .D(\USE_B_CHANNEL.cmd_b_queue_n_14 ),
        .Q(cmd_depth_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cmd_depth_reg[4] 
       (.C(aclk),
        .CE(\cmd_depth_reg[5]_0 ),
        .D(\USE_B_CHANNEL.cmd_b_queue_n_13 ),
        .Q(cmd_depth_reg[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cmd_depth_reg[5] 
       (.C(aclk),
        .CE(\cmd_depth_reg[5]_0 ),
        .D(\USE_B_CHANNEL.cmd_b_queue_n_12 ),
        .Q(cmd_depth_reg[5]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    cmd_empty_i_2
       (.I0(cmd_depth_reg[2]),
        .I1(cmd_depth_reg[3]),
        .I2(cmd_depth_reg[0]),
        .I3(cmd_depth_reg[1]),
        .I4(cmd_depth_reg[5]),
        .I5(cmd_depth_reg[4]),
        .O(almost_empty));
  FDSE #(
    .INIT(1'b1)) 
    cmd_empty_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_B_CHANNEL.cmd_b_queue_n_9 ),
        .Q(cmd_empty),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    cmd_push_block_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_BURSTS.cmd_queue_n_22 ),
        .Q(cmd_push_block),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hB)) 
    command_ongoing_i_2
       (.I0(areset_d[0]),
        .I1(areset_d[1]),
        .O(\areset_d_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    command_ongoing_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_BURSTS.cmd_queue_n_30 ),
        .Q(command_ongoing),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \first_step_q[0]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awlen[0]),
        .I3(s_axi_awsize[2]),
        .O(\first_step_q[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \first_step_q[10]_i_1 
       (.I0(s_axi_awsize[2]),
        .I1(\first_step_q[10]_i_2_n_0 ),
        .O(first_step[10]));
  LUT6 #(
    .INIT(64'h2AAA800080000000)) 
    \first_step_q[10]_i_2 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awlen[2]),
        .I2(s_axi_awlen[0]),
        .I3(s_axi_awlen[1]),
        .I4(s_axi_awlen[3]),
        .I5(s_axi_awsize[0]),
        .O(\first_step_q[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \first_step_q[11]_i_1 
       (.I0(s_axi_awsize[2]),
        .I1(\first_step_q[11]_i_2_n_0 ),
        .O(first_step[11]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \first_step_q[11]_i_2 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awlen[3]),
        .I2(s_axi_awlen[1]),
        .I3(s_axi_awlen[0]),
        .I4(s_axi_awlen[2]),
        .I5(s_axi_awsize[0]),
        .O(\first_step_q[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT5 #(
    .INIT(32'h00000514)) 
    \first_step_q[1]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awlen[0]),
        .I3(s_axi_awlen[1]),
        .I4(s_axi_awsize[2]),
        .O(\first_step_q[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000000F3C6A)) 
    \first_step_q[2]_i_1 
       (.I0(s_axi_awlen[2]),
        .I1(s_axi_awlen[1]),
        .I2(s_axi_awlen[0]),
        .I3(s_axi_awsize[0]),
        .I4(s_axi_awsize[1]),
        .I5(s_axi_awsize[2]),
        .O(\first_step_q[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \first_step_q[3]_i_1 
       (.I0(\first_step_q[7]_i_2_n_0 ),
        .I1(s_axi_awsize[2]),
        .O(\first_step_q[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'h01FF0100)) 
    \first_step_q[4]_i_1 
       (.I0(s_axi_awlen[0]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awsize[1]),
        .I3(s_axi_awsize[2]),
        .I4(\first_step_q[8]_i_2_n_0 ),
        .O(first_step[4]));
  LUT6 #(
    .INIT(64'h0036FFFF00360000)) 
    \first_step_q[5]_i_1 
       (.I0(s_axi_awlen[1]),
        .I1(s_axi_awlen[0]),
        .I2(s_axi_awsize[0]),
        .I3(s_axi_awsize[1]),
        .I4(s_axi_awsize[2]),
        .I5(\first_step_q[9]_i_2_n_0 ),
        .O(first_step[5]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \first_step_q[6]_i_1 
       (.I0(\first_step_q[6]_i_2_n_0 ),
        .I1(s_axi_awsize[2]),
        .I2(\first_step_q[10]_i_2_n_0 ),
        .O(first_step[6]));
  LUT5 #(
    .INIT(32'h07531642)) 
    \first_step_q[6]_i_2 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awlen[0]),
        .I3(s_axi_awlen[1]),
        .I4(s_axi_awlen[2]),
        .O(\first_step_q[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \first_step_q[7]_i_1 
       (.I0(\first_step_q[7]_i_2_n_0 ),
        .I1(s_axi_awsize[2]),
        .I2(\first_step_q[11]_i_2_n_0 ),
        .O(first_step[7]));
  LUT6 #(
    .INIT(64'h07FD53B916EC42A8)) 
    \first_step_q[7]_i_2 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awlen[1]),
        .I3(s_axi_awlen[0]),
        .I4(s_axi_awlen[2]),
        .I5(s_axi_awlen[3]),
        .O(\first_step_q[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \first_step_q[8]_i_1 
       (.I0(s_axi_awsize[2]),
        .I1(\first_step_q[8]_i_2_n_0 ),
        .O(first_step[8]));
  LUT6 #(
    .INIT(64'h14EAEA6262C8C840)) 
    \first_step_q[8]_i_2 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awlen[3]),
        .I3(s_axi_awlen[1]),
        .I4(s_axi_awlen[0]),
        .I5(s_axi_awlen[2]),
        .O(\first_step_q[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \first_step_q[9]_i_1 
       (.I0(s_axi_awsize[2]),
        .I1(\first_step_q[9]_i_2_n_0 ),
        .O(first_step[9]));
  LUT6 #(
    .INIT(64'h4AA2A2A228808080)) 
    \first_step_q[9]_i_2 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awlen[2]),
        .I3(s_axi_awlen[0]),
        .I4(s_axi_awlen[1]),
        .I5(s_axi_awlen[3]),
        .O(\first_step_q[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[0]_i_1_n_0 ),
        .Q(first_step_q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(first_step[10]),
        .Q(first_step_q[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(first_step[11]),
        .Q(first_step_q[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[1]_i_1_n_0 ),
        .Q(first_step_q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[2]_i_1_n_0 ),
        .Q(first_step_q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[3]_i_1_n_0 ),
        .Q(first_step_q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(first_step[4]),
        .Q(first_step_q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(first_step[5]),
        .Q(first_step_q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(first_step[6]),
        .Q(first_step_q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(first_step[7]),
        .Q(first_step_q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(first_step[8]),
        .Q(first_step_q[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(first_step[9]),
        .Q(first_step_q[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h4444444444444440)) 
    incr_need_to_split
       (.I0(s_axi_awburst[1]),
        .I1(s_axi_awburst[0]),
        .I2(s_axi_awlen[5]),
        .I3(s_axi_awlen[4]),
        .I4(s_axi_awlen[6]),
        .I5(s_axi_awlen[7]),
        .O(incr_need_to_split__0));
  FDRE #(
    .INIT(1'b0)) 
    incr_need_to_split_q_reg
       (.C(aclk),
        .CE(E),
        .D(incr_need_to_split__0),
        .Q(need_to_split_q),
        .R(SR));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_awaddr[0]_INST_0 
       (.I0(next_mi_addr[0]),
        .I1(size_mask_q[0]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[0]),
        .O(m_axi_awaddr[0]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[10]_INST_0 
       (.I0(S_AXI_AADDR_Q[10]),
        .I1(next_mi_addr[10]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[10]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[11]_INST_0 
       (.I0(S_AXI_AADDR_Q[11]),
        .I1(next_mi_addr[11]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[11]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[12]_INST_0 
       (.I0(S_AXI_AADDR_Q[12]),
        .I1(next_mi_addr[12]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[12]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[13]_INST_0 
       (.I0(S_AXI_AADDR_Q[13]),
        .I1(next_mi_addr[13]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[13]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[14]_INST_0 
       (.I0(S_AXI_AADDR_Q[14]),
        .I1(next_mi_addr[14]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[14]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[15]_INST_0 
       (.I0(S_AXI_AADDR_Q[15]),
        .I1(next_mi_addr[15]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[15]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[16]_INST_0 
       (.I0(S_AXI_AADDR_Q[16]),
        .I1(next_mi_addr[16]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[16]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[17]_INST_0 
       (.I0(S_AXI_AADDR_Q[17]),
        .I1(next_mi_addr[17]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[17]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[18]_INST_0 
       (.I0(S_AXI_AADDR_Q[18]),
        .I1(next_mi_addr[18]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[18]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[19]_INST_0 
       (.I0(S_AXI_AADDR_Q[19]),
        .I1(next_mi_addr[19]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[19]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_awaddr[1]_INST_0 
       (.I0(next_mi_addr[1]),
        .I1(size_mask_q[1]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[1]),
        .O(m_axi_awaddr[1]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[20]_INST_0 
       (.I0(S_AXI_AADDR_Q[20]),
        .I1(next_mi_addr[20]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[20]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[21]_INST_0 
       (.I0(S_AXI_AADDR_Q[21]),
        .I1(next_mi_addr[21]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[21]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[22]_INST_0 
       (.I0(S_AXI_AADDR_Q[22]),
        .I1(next_mi_addr[22]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[22]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[23]_INST_0 
       (.I0(S_AXI_AADDR_Q[23]),
        .I1(next_mi_addr[23]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[23]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[24]_INST_0 
       (.I0(S_AXI_AADDR_Q[24]),
        .I1(next_mi_addr[24]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[24]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[25]_INST_0 
       (.I0(S_AXI_AADDR_Q[25]),
        .I1(next_mi_addr[25]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[25]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[26]_INST_0 
       (.I0(S_AXI_AADDR_Q[26]),
        .I1(next_mi_addr[26]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[26]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[27]_INST_0 
       (.I0(S_AXI_AADDR_Q[27]),
        .I1(next_mi_addr[27]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[27]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[28]_INST_0 
       (.I0(S_AXI_AADDR_Q[28]),
        .I1(next_mi_addr[28]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[28]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[29]_INST_0 
       (.I0(S_AXI_AADDR_Q[29]),
        .I1(next_mi_addr[29]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[29]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_awaddr[2]_INST_0 
       (.I0(next_mi_addr[2]),
        .I1(size_mask_q[2]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[2]),
        .O(m_axi_awaddr[2]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[30]_INST_0 
       (.I0(S_AXI_AADDR_Q[30]),
        .I1(next_mi_addr[30]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[30]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[31]_INST_0 
       (.I0(S_AXI_AADDR_Q[31]),
        .I1(next_mi_addr[31]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[31]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_awaddr[3]_INST_0 
       (.I0(next_mi_addr[3]),
        .I1(size_mask_q[3]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[3]),
        .O(m_axi_awaddr[3]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_awaddr[4]_INST_0 
       (.I0(next_mi_addr[4]),
        .I1(size_mask_q[4]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[4]),
        .O(m_axi_awaddr[4]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_awaddr[5]_INST_0 
       (.I0(next_mi_addr[5]),
        .I1(size_mask_q[5]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[5]),
        .O(m_axi_awaddr[5]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_awaddr[6]_INST_0 
       (.I0(next_mi_addr[6]),
        .I1(size_mask_q[6]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(S_AXI_AADDR_Q[6]),
        .O(m_axi_awaddr[6]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[7]_INST_0 
       (.I0(S_AXI_AADDR_Q[7]),
        .I1(next_mi_addr[7]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[7]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[8]_INST_0 
       (.I0(S_AXI_AADDR_Q[8]),
        .I1(next_mi_addr[8]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[8]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_awaddr[9]_INST_0 
       (.I0(S_AXI_AADDR_Q[9]),
        .I1(next_mi_addr[9]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_awaddr[9]));
  LUT2 #(
    .INIT(4'h2)) 
    \m_axi_awlock[0]_INST_0 
       (.I0(\S_AXI_ALOCK_Q_reg_n_0_[0] ),
        .I1(need_to_split_q),
        .O(m_axi_awlock));
  LUT4 #(
    .INIT(16'h00AE)) 
    multiple_id_non_split_i_1
       (.I0(multiple_id_non_split),
        .I1(multiple_id_non_split_i_2_n_0),
        .I2(cmd_push_block_reg_0),
        .I3(split_in_progress),
        .O(multiple_id_non_split_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000511151110000)) 
    multiple_id_non_split_i_2
       (.I0(need_to_split_q),
        .I1(split_in_progress_reg_n_0),
        .I2(cmd_b_empty),
        .I3(cmd_empty),
        .I4(queue_id),
        .I5(din[4]),
        .O(multiple_id_non_split_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    multiple_id_non_split_reg
       (.C(aclk),
        .CE(1'b1),
        .D(multiple_id_non_split_i_1_n_0),
        .Q(multiple_id_non_split),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_2 
       (.I0(m_axi_awaddr[11]),
        .I1(addr_step_q[11]),
        .I2(first_split__2),
        .I3(first_step_q[11]),
        .O(\next_mi_addr[11]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_3 
       (.I0(m_axi_awaddr[10]),
        .I1(addr_step_q[10]),
        .I2(first_split__2),
        .I3(first_step_q[10]),
        .O(\next_mi_addr[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_4 
       (.I0(m_axi_awaddr[9]),
        .I1(addr_step_q[9]),
        .I2(first_split__2),
        .I3(first_step_q[9]),
        .O(\next_mi_addr[11]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_5 
       (.I0(m_axi_awaddr[8]),
        .I1(addr_step_q[8]),
        .I2(first_split__2),
        .I3(first_step_q[8]),
        .O(\next_mi_addr[11]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \next_mi_addr[11]_i_6 
       (.I0(pushed_commands_reg[1]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[3]),
        .I3(pushed_commands_reg[2]),
        .O(first_split__2));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_2 
       (.I0(S_AXI_AADDR_Q[15]),
        .I1(next_mi_addr[15]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_3 
       (.I0(S_AXI_AADDR_Q[14]),
        .I1(next_mi_addr[14]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_4 
       (.I0(S_AXI_AADDR_Q[13]),
        .I1(next_mi_addr[13]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_5 
       (.I0(S_AXI_AADDR_Q[12]),
        .I1(next_mi_addr[12]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_6 
       (.I0(S_AXI_AADDR_Q[15]),
        .I1(next_mi_addr[15]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_7 
       (.I0(S_AXI_AADDR_Q[14]),
        .I1(next_mi_addr[14]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_8 
       (.I0(S_AXI_AADDR_Q[13]),
        .I1(next_mi_addr[13]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_9 
       (.I0(S_AXI_AADDR_Q[12]),
        .I1(next_mi_addr[12]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[19]_i_2 
       (.I0(S_AXI_AADDR_Q[19]),
        .I1(next_mi_addr[19]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[19]_i_3 
       (.I0(S_AXI_AADDR_Q[18]),
        .I1(next_mi_addr[18]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[19]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[19]_i_4 
       (.I0(S_AXI_AADDR_Q[17]),
        .I1(next_mi_addr[17]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[19]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[19]_i_5 
       (.I0(S_AXI_AADDR_Q[16]),
        .I1(next_mi_addr[16]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[19]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[23]_i_2 
       (.I0(S_AXI_AADDR_Q[23]),
        .I1(next_mi_addr[23]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[23]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[23]_i_3 
       (.I0(S_AXI_AADDR_Q[22]),
        .I1(next_mi_addr[22]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[23]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[23]_i_4 
       (.I0(S_AXI_AADDR_Q[21]),
        .I1(next_mi_addr[21]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[23]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[23]_i_5 
       (.I0(S_AXI_AADDR_Q[20]),
        .I1(next_mi_addr[20]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[23]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[27]_i_2 
       (.I0(S_AXI_AADDR_Q[27]),
        .I1(next_mi_addr[27]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[27]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[27]_i_3 
       (.I0(S_AXI_AADDR_Q[26]),
        .I1(next_mi_addr[26]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[27]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[27]_i_4 
       (.I0(S_AXI_AADDR_Q[25]),
        .I1(next_mi_addr[25]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[27]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[27]_i_5 
       (.I0(S_AXI_AADDR_Q[24]),
        .I1(next_mi_addr[24]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[27]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[31]_i_2 
       (.I0(S_AXI_AADDR_Q[31]),
        .I1(next_mi_addr[31]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[31]_i_3 
       (.I0(S_AXI_AADDR_Q[30]),
        .I1(next_mi_addr[30]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[31]_i_4 
       (.I0(S_AXI_AADDR_Q[29]),
        .I1(next_mi_addr[29]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[31]_i_5 
       (.I0(S_AXI_AADDR_Q[28]),
        .I1(next_mi_addr[28]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
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
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \next_mi_addr[3]_i_6 
       (.I0(split_ongoing),
        .I1(access_is_incr_q),
        .O(M_AXI_AADDR_I1__0));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_2 
       (.I0(m_axi_awaddr[7]),
        .I1(addr_step_q[7]),
        .I2(first_split__2),
        .I3(first_step_q[7]),
        .O(\next_mi_addr[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_3 
       (.I0(m_axi_awaddr[6]),
        .I1(addr_step_q[6]),
        .I2(first_split__2),
        .I3(first_step_q[6]),
        .O(\next_mi_addr[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_4 
       (.I0(m_axi_awaddr[5]),
        .I1(addr_step_q[5]),
        .I2(first_split__2),
        .I3(first_step_q[5]),
        .O(\next_mi_addr[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_5 
       (.I0(m_axi_awaddr[4]),
        .I1(size_mask_q[0]),
        .I2(first_split__2),
        .I3(first_step_q[4]),
        .O(\next_mi_addr[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[0] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[0]),
        .Q(next_mi_addr[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[10] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[10]),
        .Q(next_mi_addr[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[11] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[11]),
        .Q(next_mi_addr[11]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[11]_i_1 
       (.CI(\next_mi_addr_reg[7]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[11]_i_1_n_0 ,\next_mi_addr_reg[11]_i_1_n_1 ,\next_mi_addr_reg[11]_i_1_n_2 ,\next_mi_addr_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(m_axi_awaddr[11:8]),
        .O(p_0_in[11:8]),
        .S({\next_mi_addr[11]_i_2_n_0 ,\next_mi_addr[11]_i_3_n_0 ,\next_mi_addr[11]_i_4_n_0 ,\next_mi_addr[11]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[12] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[12]),
        .Q(next_mi_addr[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[13] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[13]),
        .Q(next_mi_addr[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[14] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[14]),
        .Q(next_mi_addr[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[15] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[15]),
        .Q(next_mi_addr[15]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[15]_i_1 
       (.CI(\next_mi_addr_reg[11]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[15]_i_1_n_0 ,\next_mi_addr_reg[15]_i_1_n_1 ,\next_mi_addr_reg[15]_i_1_n_2 ,\next_mi_addr_reg[15]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({\next_mi_addr[15]_i_2_n_0 ,\next_mi_addr[15]_i_3_n_0 ,\next_mi_addr[15]_i_4_n_0 ,\next_mi_addr[15]_i_5_n_0 }),
        .O(p_0_in[15:12]),
        .S({\next_mi_addr[15]_i_6_n_0 ,\next_mi_addr[15]_i_7_n_0 ,\next_mi_addr[15]_i_8_n_0 ,\next_mi_addr[15]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[16] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[16]),
        .Q(next_mi_addr[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[17] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[17]),
        .Q(next_mi_addr[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[18] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[18]),
        .Q(next_mi_addr[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[19] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[19]),
        .Q(next_mi_addr[19]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[19]_i_1 
       (.CI(\next_mi_addr_reg[15]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[19]_i_1_n_0 ,\next_mi_addr_reg[19]_i_1_n_1 ,\next_mi_addr_reg[19]_i_1_n_2 ,\next_mi_addr_reg[19]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[19:16]),
        .S({\next_mi_addr[19]_i_2_n_0 ,\next_mi_addr[19]_i_3_n_0 ,\next_mi_addr[19]_i_4_n_0 ,\next_mi_addr[19]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[1] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[1]),
        .Q(next_mi_addr[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[20] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[20]),
        .Q(next_mi_addr[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[21] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[21]),
        .Q(next_mi_addr[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[22] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[22]),
        .Q(next_mi_addr[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[23] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[23]),
        .Q(next_mi_addr[23]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[23]_i_1 
       (.CI(\next_mi_addr_reg[19]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[23]_i_1_n_0 ,\next_mi_addr_reg[23]_i_1_n_1 ,\next_mi_addr_reg[23]_i_1_n_2 ,\next_mi_addr_reg[23]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[23:20]),
        .S({\next_mi_addr[23]_i_2_n_0 ,\next_mi_addr[23]_i_3_n_0 ,\next_mi_addr[23]_i_4_n_0 ,\next_mi_addr[23]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[24] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[24]),
        .Q(next_mi_addr[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[25] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[25]),
        .Q(next_mi_addr[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[26] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[26]),
        .Q(next_mi_addr[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[27] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[27]),
        .Q(next_mi_addr[27]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[27]_i_1 
       (.CI(\next_mi_addr_reg[23]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[27]_i_1_n_0 ,\next_mi_addr_reg[27]_i_1_n_1 ,\next_mi_addr_reg[27]_i_1_n_2 ,\next_mi_addr_reg[27]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[27:24]),
        .S({\next_mi_addr[27]_i_2_n_0 ,\next_mi_addr[27]_i_3_n_0 ,\next_mi_addr[27]_i_4_n_0 ,\next_mi_addr[27]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[28] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[28]),
        .Q(next_mi_addr[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[29] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[29]),
        .Q(next_mi_addr[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[2] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[2]),
        .Q(next_mi_addr[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[30] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[30]),
        .Q(next_mi_addr[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[31] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[31]),
        .Q(next_mi_addr[31]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[31]_i_1 
       (.CI(\next_mi_addr_reg[27]_i_1_n_0 ),
        .CO({\NLW_next_mi_addr_reg[31]_i_1_CO_UNCONNECTED [3],\next_mi_addr_reg[31]_i_1_n_1 ,\next_mi_addr_reg[31]_i_1_n_2 ,\next_mi_addr_reg[31]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in[31:28]),
        .S({\next_mi_addr[31]_i_2_n_0 ,\next_mi_addr[31]_i_3_n_0 ,\next_mi_addr[31]_i_4_n_0 ,\next_mi_addr[31]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[3] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[3]),
        .Q(next_mi_addr[3]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\next_mi_addr_reg[3]_i_1_n_0 ,\next_mi_addr_reg[3]_i_1_n_1 ,\next_mi_addr_reg[3]_i_1_n_2 ,\next_mi_addr_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(m_axi_awaddr[3:0]),
        .O(p_0_in[3:0]),
        .S({\next_mi_addr[3]_i_2_n_0 ,\next_mi_addr[3]_i_3_n_0 ,\next_mi_addr[3]_i_4_n_0 ,\next_mi_addr[3]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[4] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[4]),
        .Q(next_mi_addr[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[5] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[5]),
        .Q(next_mi_addr[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[6] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[6]),
        .Q(next_mi_addr[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[7] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[7]),
        .Q(next_mi_addr[7]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[7]_i_1 
       (.CI(\next_mi_addr_reg[3]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[7]_i_1_n_0 ,\next_mi_addr_reg[7]_i_1_n_1 ,\next_mi_addr_reg[7]_i_1_n_2 ,\next_mi_addr_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(m_axi_awaddr[7:4]),
        .O(p_0_in[7:4]),
        .S({\next_mi_addr[7]_i_2_n_0 ,\next_mi_addr[7]_i_3_n_0 ,\next_mi_addr[7]_i_4_n_0 ,\next_mi_addr[7]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[8] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[8]),
        .Q(next_mi_addr[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[9] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in[9]),
        .Q(next_mi_addr[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[4]),
        .Q(num_transactions_q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[5]),
        .Q(num_transactions_q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[6]),
        .Q(num_transactions_q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[7]),
        .Q(num_transactions_q[3]),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \pushed_commands[0]_i_1 
       (.I0(pushed_commands_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \pushed_commands[1]_i_1 
       (.I0(pushed_commands_reg[0]),
        .I1(pushed_commands_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \pushed_commands[2]_i_1 
       (.I0(pushed_commands_reg[1]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[2]),
        .O(p_0_in__0[2]));
  LUT2 #(
    .INIT(4'hB)) 
    \pushed_commands[3]_i_1 
       (.I0(E),
        .I1(aresetn),
        .O(\pushed_commands[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \pushed_commands[3]_i_2 
       (.I0(pushed_commands_reg[2]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[1]),
        .I3(pushed_commands_reg[3]),
        .O(p_0_in__0[3]));
  FDRE #(
    .INIT(1'b0)) 
    \pushed_commands_reg[0] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in__0[0]),
        .Q(pushed_commands_reg[0]),
        .R(\pushed_commands[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pushed_commands_reg[1] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in__0[1]),
        .Q(pushed_commands_reg[1]),
        .R(\pushed_commands[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pushed_commands_reg[2] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in__0[2]),
        .Q(pushed_commands_reg[2]),
        .R(\pushed_commands[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pushed_commands_reg[3] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in__0[3]),
        .Q(pushed_commands_reg[3]),
        .R(\pushed_commands[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \queue_id_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_B_CHANNEL.cmd_b_queue_n_21 ),
        .Q(queue_id),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \size_mask_q[0]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awsize[2]),
        .O(size_mask[0]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \size_mask_q[1]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[2]),
        .O(size_mask[1]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h15)) 
    \size_mask_q[2]_i_1 
       (.I0(s_axi_awsize[2]),
        .I1(s_axi_awsize[1]),
        .I2(s_axi_awsize[0]),
        .O(size_mask[2]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \size_mask_q[3]_i_1 
       (.I0(s_axi_awsize[2]),
        .O(size_mask[3]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h57)) 
    \size_mask_q[4]_i_1 
       (.I0(s_axi_awsize[2]),
        .I1(s_axi_awsize[1]),
        .I2(s_axi_awsize[0]),
        .O(size_mask[4]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \size_mask_q[5]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[2]),
        .O(size_mask[5]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \size_mask_q[6]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awsize[2]),
        .O(size_mask[6]));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[0]),
        .Q(size_mask_q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[1]),
        .Q(size_mask_q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[2]),
        .Q(size_mask_q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(1'b1),
        .Q(size_mask_q[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[3]),
        .Q(size_mask_q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[4]),
        .Q(size_mask_q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[5]),
        .Q(size_mask_q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[6]),
        .Q(size_mask_q[6]),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000AAAAAAEA)) 
    split_in_progress_i_1
       (.I0(split_in_progress_reg_n_0),
        .I1(cmd_id_check__3),
        .I2(need_to_split_q),
        .I3(multiple_id_non_split),
        .I4(cmd_push_block_reg_0),
        .I5(split_in_progress),
        .O(split_in_progress_i_1_n_0));
  LUT4 #(
    .INIT(16'hF88F)) 
    split_in_progress_i_2
       (.I0(cmd_b_empty),
        .I1(cmd_empty),
        .I2(queue_id),
        .I3(din[4]),
        .O(cmd_id_check__3));
  FDRE #(
    .INIT(1'b0)) 
    split_in_progress_reg
       (.C(aclk),
        .CE(1'b1),
        .D(split_in_progress_i_1_n_0),
        .Q(split_in_progress_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    split_ongoing_reg
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(cmd_b_split_i),
        .Q(split_ongoing),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_33_a_axi3_conv" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv__parameterized0
   (E,
    \S_AXI_AID_Q_reg[0]_0 ,
    m_axi_araddr,
    m_axi_arvalid,
    s_axi_rvalid,
    m_axi_arlen,
    m_axi_arlock,
    s_axi_rlast,
    m_axi_rready,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    aclk,
    SR,
    s_axi_arid,
    s_axi_arlock,
    s_axi_arsize,
    s_axi_arlen,
    m_axi_arready,
    aresetn,
    m_axi_rvalid,
    s_axi_rready,
    m_axi_rlast,
    s_axi_arvalid,
    areset_d,
    command_ongoing_reg_0,
    s_axi_araddr,
    s_axi_arburst,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos);
  output [0:0]E;
  output \S_AXI_AID_Q_reg[0]_0 ;
  output [31:0]m_axi_araddr;
  output m_axi_arvalid;
  output s_axi_rvalid;
  output [3:0]m_axi_arlen;
  output [0:0]m_axi_arlock;
  output s_axi_rlast;
  output m_axi_rready;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  input aclk;
  input [0:0]SR;
  input [0:0]s_axi_arid;
  input [0:0]s_axi_arlock;
  input [2:0]s_axi_arsize;
  input [7:0]s_axi_arlen;
  input m_axi_arready;
  input aresetn;
  input m_axi_rvalid;
  input s_axi_rready;
  input m_axi_rlast;
  input s_axi_arvalid;
  input [1:0]areset_d;
  input command_ongoing_reg_0;
  input [31:0]s_axi_araddr;
  input [1:0]s_axi_arburst;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;

  wire [0:0]E;
  wire M_AXI_AADDR_I1__0;
  wire [0:0]SR;
  wire \S_AXI_AADDR_Q_reg_n_0_[0] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[10] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[11] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[12] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[13] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[14] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[15] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[16] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[17] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[18] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[19] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[1] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[20] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[21] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[22] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[23] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[24] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[25] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[26] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[27] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[28] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[29] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[2] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[30] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[31] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[3] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[4] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[5] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[6] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[7] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[8] ;
  wire \S_AXI_AADDR_Q_reg_n_0_[9] ;
  wire \S_AXI_AID_Q_reg[0]_0 ;
  wire [3:0]S_AXI_ALEN_Q;
  wire \S_AXI_ALOCK_Q_reg_n_0_[0] ;
  wire \USE_READ.USE_SPLIT_R.rd_cmd_ready ;
  wire \USE_R_CHANNEL.cmd_queue_n_10 ;
  wire \USE_R_CHANNEL.cmd_queue_n_16 ;
  wire \USE_R_CHANNEL.cmd_queue_n_17 ;
  wire \USE_R_CHANNEL.cmd_queue_n_18 ;
  wire \USE_R_CHANNEL.cmd_queue_n_19 ;
  wire \USE_R_CHANNEL.cmd_queue_n_2 ;
  wire \USE_R_CHANNEL.cmd_queue_n_5 ;
  wire \USE_R_CHANNEL.cmd_queue_n_6 ;
  wire \USE_R_CHANNEL.cmd_queue_n_7 ;
  wire \USE_R_CHANNEL.cmd_queue_n_8 ;
  wire \USE_R_CHANNEL.cmd_queue_n_9 ;
  wire access_is_incr;
  wire access_is_incr_q;
  wire aclk;
  wire \addr_step_q[10]_i_1__0_n_0 ;
  wire \addr_step_q[11]_i_1__0_n_0 ;
  wire \addr_step_q[5]_i_1__0_n_0 ;
  wire \addr_step_q[6]_i_1__0_n_0 ;
  wire \addr_step_q[7]_i_1__0_n_0 ;
  wire \addr_step_q[8]_i_1__0_n_0 ;
  wire \addr_step_q[9]_i_1__0_n_0 ;
  wire \addr_step_q_reg_n_0_[10] ;
  wire \addr_step_q_reg_n_0_[11] ;
  wire \addr_step_q_reg_n_0_[5] ;
  wire \addr_step_q_reg_n_0_[6] ;
  wire \addr_step_q_reg_n_0_[7] ;
  wire \addr_step_q_reg_n_0_[8] ;
  wire \addr_step_q_reg_n_0_[9] ;
  wire almost_empty;
  wire [1:0]areset_d;
  wire aresetn;
  wire \cmd_depth[0]_i_1__0_n_0 ;
  wire [5:0]cmd_depth_reg;
  wire cmd_empty;
  wire cmd_empty_i_1_n_0;
  wire cmd_id_check__2;
  wire cmd_push_block;
  wire cmd_split_i;
  wire command_ongoing;
  wire command_ongoing_reg_0;
  wire first_split__2;
  wire [11:4]first_step;
  wire \first_step_q[0]_i_1__0_n_0 ;
  wire \first_step_q[10]_i_2__0_n_0 ;
  wire \first_step_q[11]_i_2__0_n_0 ;
  wire \first_step_q[1]_i_1__0_n_0 ;
  wire \first_step_q[2]_i_1__0_n_0 ;
  wire \first_step_q[3]_i_1__0_n_0 ;
  wire \first_step_q[6]_i_2__0_n_0 ;
  wire \first_step_q[7]_i_2__0_n_0 ;
  wire \first_step_q[8]_i_2__0_n_0 ;
  wire \first_step_q[9]_i_2__0_n_0 ;
  wire \first_step_q_reg_n_0_[0] ;
  wire \first_step_q_reg_n_0_[10] ;
  wire \first_step_q_reg_n_0_[11] ;
  wire \first_step_q_reg_n_0_[1] ;
  wire \first_step_q_reg_n_0_[2] ;
  wire \first_step_q_reg_n_0_[3] ;
  wire \first_step_q_reg_n_0_[4] ;
  wire \first_step_q_reg_n_0_[5] ;
  wire \first_step_q_reg_n_0_[6] ;
  wire \first_step_q_reg_n_0_[7] ;
  wire \first_step_q_reg_n_0_[8] ;
  wire \first_step_q_reg_n_0_[9] ;
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
  wire multiple_id_non_split;
  wire multiple_id_non_split0;
  wire multiple_id_non_split_i_1_n_0;
  wire need_to_split_q;
  wire [31:0]next_mi_addr;
  wire \next_mi_addr[11]_i_2_n_0 ;
  wire \next_mi_addr[11]_i_3_n_0 ;
  wire \next_mi_addr[11]_i_4_n_0 ;
  wire \next_mi_addr[11]_i_5_n_0 ;
  wire \next_mi_addr[15]_i_2__0_n_0 ;
  wire \next_mi_addr[15]_i_3__0_n_0 ;
  wire \next_mi_addr[15]_i_4__0_n_0 ;
  wire \next_mi_addr[15]_i_5__0_n_0 ;
  wire \next_mi_addr[15]_i_6__0_n_0 ;
  wire \next_mi_addr[15]_i_7__0_n_0 ;
  wire \next_mi_addr[15]_i_8__0_n_0 ;
  wire \next_mi_addr[15]_i_9__0_n_0 ;
  wire \next_mi_addr[19]_i_2__0_n_0 ;
  wire \next_mi_addr[19]_i_3__0_n_0 ;
  wire \next_mi_addr[19]_i_4__0_n_0 ;
  wire \next_mi_addr[19]_i_5__0_n_0 ;
  wire \next_mi_addr[23]_i_2__0_n_0 ;
  wire \next_mi_addr[23]_i_3__0_n_0 ;
  wire \next_mi_addr[23]_i_4__0_n_0 ;
  wire \next_mi_addr[23]_i_5__0_n_0 ;
  wire \next_mi_addr[27]_i_2__0_n_0 ;
  wire \next_mi_addr[27]_i_3__0_n_0 ;
  wire \next_mi_addr[27]_i_4__0_n_0 ;
  wire \next_mi_addr[27]_i_5__0_n_0 ;
  wire \next_mi_addr[31]_i_2__0_n_0 ;
  wire \next_mi_addr[31]_i_3__0_n_0 ;
  wire \next_mi_addr[31]_i_4__0_n_0 ;
  wire \next_mi_addr[31]_i_5__0_n_0 ;
  wire \next_mi_addr[3]_i_2_n_0 ;
  wire \next_mi_addr[3]_i_3_n_0 ;
  wire \next_mi_addr[3]_i_4_n_0 ;
  wire \next_mi_addr[3]_i_5_n_0 ;
  wire \next_mi_addr[7]_i_2_n_0 ;
  wire \next_mi_addr[7]_i_3_n_0 ;
  wire \next_mi_addr[7]_i_4_n_0 ;
  wire \next_mi_addr[7]_i_5_n_0 ;
  wire \next_mi_addr_reg[11]_i_1__0_n_0 ;
  wire \next_mi_addr_reg[11]_i_1__0_n_1 ;
  wire \next_mi_addr_reg[11]_i_1__0_n_2 ;
  wire \next_mi_addr_reg[11]_i_1__0_n_3 ;
  wire \next_mi_addr_reg[11]_i_1__0_n_4 ;
  wire \next_mi_addr_reg[11]_i_1__0_n_5 ;
  wire \next_mi_addr_reg[11]_i_1__0_n_6 ;
  wire \next_mi_addr_reg[11]_i_1__0_n_7 ;
  wire \next_mi_addr_reg[15]_i_1__0_n_0 ;
  wire \next_mi_addr_reg[15]_i_1__0_n_1 ;
  wire \next_mi_addr_reg[15]_i_1__0_n_2 ;
  wire \next_mi_addr_reg[15]_i_1__0_n_3 ;
  wire \next_mi_addr_reg[15]_i_1__0_n_4 ;
  wire \next_mi_addr_reg[15]_i_1__0_n_5 ;
  wire \next_mi_addr_reg[15]_i_1__0_n_6 ;
  wire \next_mi_addr_reg[15]_i_1__0_n_7 ;
  wire \next_mi_addr_reg[19]_i_1__0_n_0 ;
  wire \next_mi_addr_reg[19]_i_1__0_n_1 ;
  wire \next_mi_addr_reg[19]_i_1__0_n_2 ;
  wire \next_mi_addr_reg[19]_i_1__0_n_3 ;
  wire \next_mi_addr_reg[19]_i_1__0_n_4 ;
  wire \next_mi_addr_reg[19]_i_1__0_n_5 ;
  wire \next_mi_addr_reg[19]_i_1__0_n_6 ;
  wire \next_mi_addr_reg[19]_i_1__0_n_7 ;
  wire \next_mi_addr_reg[23]_i_1__0_n_0 ;
  wire \next_mi_addr_reg[23]_i_1__0_n_1 ;
  wire \next_mi_addr_reg[23]_i_1__0_n_2 ;
  wire \next_mi_addr_reg[23]_i_1__0_n_3 ;
  wire \next_mi_addr_reg[23]_i_1__0_n_4 ;
  wire \next_mi_addr_reg[23]_i_1__0_n_5 ;
  wire \next_mi_addr_reg[23]_i_1__0_n_6 ;
  wire \next_mi_addr_reg[23]_i_1__0_n_7 ;
  wire \next_mi_addr_reg[27]_i_1__0_n_0 ;
  wire \next_mi_addr_reg[27]_i_1__0_n_1 ;
  wire \next_mi_addr_reg[27]_i_1__0_n_2 ;
  wire \next_mi_addr_reg[27]_i_1__0_n_3 ;
  wire \next_mi_addr_reg[27]_i_1__0_n_4 ;
  wire \next_mi_addr_reg[27]_i_1__0_n_5 ;
  wire \next_mi_addr_reg[27]_i_1__0_n_6 ;
  wire \next_mi_addr_reg[27]_i_1__0_n_7 ;
  wire \next_mi_addr_reg[31]_i_1__0_n_1 ;
  wire \next_mi_addr_reg[31]_i_1__0_n_2 ;
  wire \next_mi_addr_reg[31]_i_1__0_n_3 ;
  wire \next_mi_addr_reg[31]_i_1__0_n_4 ;
  wire \next_mi_addr_reg[31]_i_1__0_n_5 ;
  wire \next_mi_addr_reg[31]_i_1__0_n_6 ;
  wire \next_mi_addr_reg[31]_i_1__0_n_7 ;
  wire \next_mi_addr_reg[3]_i_1__0_n_0 ;
  wire \next_mi_addr_reg[3]_i_1__0_n_1 ;
  wire \next_mi_addr_reg[3]_i_1__0_n_2 ;
  wire \next_mi_addr_reg[3]_i_1__0_n_3 ;
  wire \next_mi_addr_reg[3]_i_1__0_n_4 ;
  wire \next_mi_addr_reg[3]_i_1__0_n_5 ;
  wire \next_mi_addr_reg[3]_i_1__0_n_6 ;
  wire \next_mi_addr_reg[3]_i_1__0_n_7 ;
  wire \next_mi_addr_reg[7]_i_1__0_n_0 ;
  wire \next_mi_addr_reg[7]_i_1__0_n_1 ;
  wire \next_mi_addr_reg[7]_i_1__0_n_2 ;
  wire \next_mi_addr_reg[7]_i_1__0_n_3 ;
  wire \next_mi_addr_reg[7]_i_1__0_n_4 ;
  wire \next_mi_addr_reg[7]_i_1__0_n_5 ;
  wire \next_mi_addr_reg[7]_i_1__0_n_6 ;
  wire \next_mi_addr_reg[7]_i_1__0_n_7 ;
  wire \num_transactions_q_reg_n_0_[0] ;
  wire \num_transactions_q_reg_n_0_[1] ;
  wire \num_transactions_q_reg_n_0_[2] ;
  wire \num_transactions_q_reg_n_0_[3] ;
  wire [3:0]p_0_in__1;
  wire \pushed_commands[3]_i_1__0_n_0 ;
  wire [3:0]pushed_commands_reg;
  wire pushed_new_cmd;
  wire \queue_id_reg_n_0_[0] ;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [31:0]size_mask_q;
  wire \size_mask_q[0]_i_1__0_n_0 ;
  wire \size_mask_q[1]_i_1__0_n_0 ;
  wire \size_mask_q[2]_i_1__0_n_0 ;
  wire \size_mask_q[3]_i_1__0_n_0 ;
  wire \size_mask_q[4]_i_1__0_n_0 ;
  wire \size_mask_q[5]_i_1__0_n_0 ;
  wire \size_mask_q[6]_i_1__0_n_0 ;
  wire split_in_progress;
  wire split_in_progress_i_1_n_0;
  wire split_in_progress_reg_n_0;
  wire split_ongoing;
  wire [3:3]\NLW_next_mi_addr_reg[31]_i_1__0_CO_UNCONNECTED ;

  FDRE \S_AXI_AADDR_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[0]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[0] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[10]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[10] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[11]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[11] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[12] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[12]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[12] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[13] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[13]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[13] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[14] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[14]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[14] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[15] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[15]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[15] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[16] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[16]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[16] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[17] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[17]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[17] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[18] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[18]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[18] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[19] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[19]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[19] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[1]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[1] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[20] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[20]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[20] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[21] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[21]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[21] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[22] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[22]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[22] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[23] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[23]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[23] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[24] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[24]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[24] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[25] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[25]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[25] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[26] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[26]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[26] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[27] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[27]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[27] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[28] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[28]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[28] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[29] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[29]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[29] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[2]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[2] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[30] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[30]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[30] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[31]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[31] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[3]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[3] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[4]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[4] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[5]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[5] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[6]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[6] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[7]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[7] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[8]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[8] ),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_araddr[9]),
        .Q(\S_AXI_AADDR_Q_reg_n_0_[9] ),
        .R(SR));
  FDRE \S_AXI_ABURST_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arburst[0]),
        .Q(m_axi_arburst[0]),
        .R(SR));
  FDRE \S_AXI_ABURST_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arburst[1]),
        .Q(m_axi_arburst[1]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arcache[0]),
        .Q(m_axi_arcache[0]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arcache[1]),
        .Q(m_axi_arcache[1]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arcache[2]),
        .Q(m_axi_arcache[2]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arcache[3]),
        .Q(m_axi_arcache[3]),
        .R(SR));
  FDRE \S_AXI_AID_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arid),
        .Q(\S_AXI_AID_Q_reg[0]_0 ),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[0]),
        .Q(S_AXI_ALEN_Q[0]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[1]),
        .Q(S_AXI_ALEN_Q[1]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[2]),
        .Q(S_AXI_ALEN_Q[2]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[3]),
        .Q(S_AXI_ALEN_Q[3]),
        .R(SR));
  FDRE \S_AXI_ALOCK_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlock),
        .Q(\S_AXI_ALOCK_Q_reg_n_0_[0] ),
        .R(SR));
  FDRE \S_AXI_APROT_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arprot[0]),
        .Q(m_axi_arprot[0]),
        .R(SR));
  FDRE \S_AXI_APROT_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arprot[1]),
        .Q(m_axi_arprot[1]),
        .R(SR));
  FDRE \S_AXI_APROT_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arprot[2]),
        .Q(m_axi_arprot[2]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arqos[0]),
        .Q(m_axi_arqos[0]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arqos[1]),
        .Q(m_axi_arqos[1]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arqos[2]),
        .Q(m_axi_arqos[2]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arqos[3]),
        .Q(m_axi_arqos[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    S_AXI_AREADY_I_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_R_CHANNEL.cmd_queue_n_16 ),
        .Q(E),
        .R(SR));
  FDRE \S_AXI_ASIZE_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arsize[0]),
        .Q(m_axi_arsize[0]),
        .R(SR));
  FDRE \S_AXI_ASIZE_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arsize[1]),
        .Q(m_axi_arsize[1]),
        .R(SR));
  FDRE \S_AXI_ASIZE_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arsize[2]),
        .Q(m_axi_arsize[2]),
        .R(SR));
  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__parameterized0 \USE_R_CHANNEL.cmd_queue 
       (.D({\USE_R_CHANNEL.cmd_queue_n_6 ,\USE_R_CHANNEL.cmd_queue_n_7 ,\USE_R_CHANNEL.cmd_queue_n_8 ,\USE_R_CHANNEL.cmd_queue_n_9 ,\USE_R_CHANNEL.cmd_queue_n_10 }),
        .E(pushed_new_cmd),
        .Q(cmd_depth_reg),
        .SR(SR),
        .\USE_READ.USE_SPLIT_R.rd_cmd_ready (\USE_READ.USE_SPLIT_R.rd_cmd_ready ),
        .access_is_incr_q(access_is_incr_q),
        .aclk(aclk),
        .almost_empty(almost_empty),
        .areset_d(areset_d),
        .aresetn(aresetn),
        .cmd_empty(cmd_empty),
        .cmd_push_block(cmd_push_block),
        .cmd_push_block_reg(\USE_R_CHANNEL.cmd_queue_n_5 ),
        .cmd_push_block_reg_0(split_in_progress_reg_n_0),
        .command_ongoing(command_ongoing),
        .command_ongoing_reg(E),
        .command_ongoing_reg_0(command_ongoing_reg_0),
        .din(cmd_split_i),
        .empty_fwft_i_reg(\USE_R_CHANNEL.cmd_queue_n_19 ),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .multiple_id_non_split(multiple_id_non_split),
        .multiple_id_non_split0(multiple_id_non_split0),
        .need_to_split_q(need_to_split_q),
        .\queue_id_reg[0] (\USE_R_CHANNEL.cmd_queue_n_17 ),
        .\queue_id_reg[0]_0 (\S_AXI_AID_Q_reg[0]_0 ),
        .\queue_id_reg[0]_1 (\queue_id_reg_n_0_[0] ),
        .ram_full_i_reg(\USE_R_CHANNEL.cmd_queue_n_2 ),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arvalid_0(\USE_R_CHANNEL.cmd_queue_n_16 ),
        .s_axi_arvalid_1(\USE_R_CHANNEL.cmd_queue_n_18 ),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .split_in_progress(split_in_progress),
        .split_ongoing_reg({\num_transactions_q_reg_n_0_[3] ,\num_transactions_q_reg_n_0_[2] ,\num_transactions_q_reg_n_0_[1] ,\num_transactions_q_reg_n_0_[0] }),
        .split_ongoing_reg_0(pushed_commands_reg));
  LUT2 #(
    .INIT(4'h2)) 
    access_is_incr_q_i_1__0
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
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \addr_step_q[10]_i_1__0 
       (.I0(s_axi_arsize[0]),
        .I1(s_axi_arsize[2]),
        .I2(s_axi_arsize[1]),
        .O(\addr_step_q[10]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \addr_step_q[11]_i_1__0 
       (.I0(s_axi_arsize[2]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arsize[1]),
        .O(\addr_step_q[11]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addr_step_q[5]_i_1__0 
       (.I0(s_axi_arsize[0]),
        .I1(s_axi_arsize[2]),
        .I2(s_axi_arsize[1]),
        .O(\addr_step_q[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addr_step_q[6]_i_1__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arsize[2]),
        .O(\addr_step_q[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \addr_step_q[7]_i_1__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arsize[2]),
        .O(\addr_step_q[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addr_step_q[8]_i_1__0 
       (.I0(s_axi_arsize[2]),
        .I1(s_axi_arsize[1]),
        .I2(s_axi_arsize[0]),
        .O(\addr_step_q[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \addr_step_q[9]_i_1__0 
       (.I0(s_axi_arsize[0]),
        .I1(s_axi_arsize[2]),
        .I2(s_axi_arsize[1]),
        .O(\addr_step_q[9]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[10]_i_1__0_n_0 ),
        .Q(\addr_step_q_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[11]_i_1__0_n_0 ),
        .Q(\addr_step_q_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[5]_i_1__0_n_0 ),
        .Q(\addr_step_q_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[6]_i_1__0_n_0 ),
        .Q(\addr_step_q_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[7]_i_1__0_n_0 ),
        .Q(\addr_step_q_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[8]_i_1__0_n_0 ),
        .Q(\addr_step_q_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[9]_i_1__0_n_0 ),
        .Q(\addr_step_q_reg_n_0_[9] ),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \cmd_depth[0]_i_1__0 
       (.I0(cmd_depth_reg[0]),
        .O(\cmd_depth[0]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cmd_depth_reg[0] 
       (.C(aclk),
        .CE(\USE_R_CHANNEL.cmd_queue_n_19 ),
        .D(\cmd_depth[0]_i_1__0_n_0 ),
        .Q(cmd_depth_reg[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cmd_depth_reg[1] 
       (.C(aclk),
        .CE(\USE_R_CHANNEL.cmd_queue_n_19 ),
        .D(\USE_R_CHANNEL.cmd_queue_n_10 ),
        .Q(cmd_depth_reg[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cmd_depth_reg[2] 
       (.C(aclk),
        .CE(\USE_R_CHANNEL.cmd_queue_n_19 ),
        .D(\USE_R_CHANNEL.cmd_queue_n_9 ),
        .Q(cmd_depth_reg[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cmd_depth_reg[3] 
       (.C(aclk),
        .CE(\USE_R_CHANNEL.cmd_queue_n_19 ),
        .D(\USE_R_CHANNEL.cmd_queue_n_8 ),
        .Q(cmd_depth_reg[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cmd_depth_reg[4] 
       (.C(aclk),
        .CE(\USE_R_CHANNEL.cmd_queue_n_19 ),
        .D(\USE_R_CHANNEL.cmd_queue_n_7 ),
        .Q(cmd_depth_reg[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \cmd_depth_reg[5] 
       (.C(aclk),
        .CE(\USE_R_CHANNEL.cmd_queue_n_19 ),
        .D(\USE_R_CHANNEL.cmd_queue_n_6 ),
        .Q(cmd_depth_reg[5]),
        .R(SR));
  LUT4 #(
    .INIT(16'hBC80)) 
    cmd_empty_i_1
       (.I0(almost_empty),
        .I1(\USE_READ.USE_SPLIT_R.rd_cmd_ready ),
        .I2(\USE_R_CHANNEL.cmd_queue_n_5 ),
        .I3(cmd_empty),
        .O(cmd_empty_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    cmd_empty_i_2__0
       (.I0(cmd_depth_reg[2]),
        .I1(cmd_depth_reg[3]),
        .I2(cmd_depth_reg[0]),
        .I3(cmd_depth_reg[1]),
        .I4(cmd_depth_reg[5]),
        .I5(cmd_depth_reg[4]),
        .O(almost_empty));
  FDSE #(
    .INIT(1'b1)) 
    cmd_empty_reg
       (.C(aclk),
        .CE(1'b1),
        .D(cmd_empty_i_1_n_0),
        .Q(cmd_empty),
        .S(SR));
  FDRE #(
    .INIT(1'b0)) 
    cmd_push_block_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_R_CHANNEL.cmd_queue_n_2 ),
        .Q(cmd_push_block),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    command_ongoing_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_R_CHANNEL.cmd_queue_n_18 ),
        .Q(command_ongoing),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \first_step_q[0]_i_1__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arlen[0]),
        .I3(s_axi_arsize[2]),
        .O(\first_step_q[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \first_step_q[10]_i_1__0 
       (.I0(s_axi_arsize[2]),
        .I1(\first_step_q[10]_i_2__0_n_0 ),
        .O(first_step[10]));
  LUT6 #(
    .INIT(64'h2AAA800080000000)) 
    \first_step_q[10]_i_2__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arlen[2]),
        .I2(s_axi_arlen[0]),
        .I3(s_axi_arlen[1]),
        .I4(s_axi_arlen[3]),
        .I5(s_axi_arsize[0]),
        .O(\first_step_q[10]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \first_step_q[11]_i_1__0 
       (.I0(s_axi_arsize[2]),
        .I1(\first_step_q[11]_i_2__0_n_0 ),
        .O(first_step[11]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \first_step_q[11]_i_2__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arlen[3]),
        .I2(s_axi_arlen[1]),
        .I3(s_axi_arlen[0]),
        .I4(s_axi_arlen[2]),
        .I5(s_axi_arsize[0]),
        .O(\first_step_q[11]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h00000514)) 
    \first_step_q[1]_i_1__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arlen[0]),
        .I3(s_axi_arlen[1]),
        .I4(s_axi_arsize[2]),
        .O(\first_step_q[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h00000000000F3C6A)) 
    \first_step_q[2]_i_1__0 
       (.I0(s_axi_arlen[2]),
        .I1(s_axi_arlen[1]),
        .I2(s_axi_arlen[0]),
        .I3(s_axi_arsize[0]),
        .I4(s_axi_arsize[1]),
        .I5(s_axi_arsize[2]),
        .O(\first_step_q[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \first_step_q[3]_i_1__0 
       (.I0(\first_step_q[7]_i_2__0_n_0 ),
        .I1(s_axi_arsize[2]),
        .O(\first_step_q[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h01FF0100)) 
    \first_step_q[4]_i_1__0 
       (.I0(s_axi_arlen[0]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arsize[1]),
        .I3(s_axi_arsize[2]),
        .I4(\first_step_q[8]_i_2__0_n_0 ),
        .O(first_step[4]));
  LUT6 #(
    .INIT(64'h0036FFFF00360000)) 
    \first_step_q[5]_i_1__0 
       (.I0(s_axi_arlen[1]),
        .I1(s_axi_arlen[0]),
        .I2(s_axi_arsize[0]),
        .I3(s_axi_arsize[1]),
        .I4(s_axi_arsize[2]),
        .I5(\first_step_q[9]_i_2__0_n_0 ),
        .O(first_step[5]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \first_step_q[6]_i_1__0 
       (.I0(\first_step_q[6]_i_2__0_n_0 ),
        .I1(s_axi_arsize[2]),
        .I2(\first_step_q[10]_i_2__0_n_0 ),
        .O(first_step[6]));
  LUT5 #(
    .INIT(32'h07531642)) 
    \first_step_q[6]_i_2__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arlen[0]),
        .I3(s_axi_arlen[1]),
        .I4(s_axi_arlen[2]),
        .O(\first_step_q[6]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \first_step_q[7]_i_1__0 
       (.I0(\first_step_q[7]_i_2__0_n_0 ),
        .I1(s_axi_arsize[2]),
        .I2(\first_step_q[11]_i_2__0_n_0 ),
        .O(first_step[7]));
  LUT6 #(
    .INIT(64'h07FD53B916EC42A8)) 
    \first_step_q[7]_i_2__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arlen[1]),
        .I3(s_axi_arlen[0]),
        .I4(s_axi_arlen[2]),
        .I5(s_axi_arlen[3]),
        .O(\first_step_q[7]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \first_step_q[8]_i_1__0 
       (.I0(s_axi_arsize[2]),
        .I1(\first_step_q[8]_i_2__0_n_0 ),
        .O(first_step[8]));
  LUT6 #(
    .INIT(64'h14EAEA6262C8C840)) 
    \first_step_q[8]_i_2__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arlen[3]),
        .I3(s_axi_arlen[1]),
        .I4(s_axi_arlen[0]),
        .I5(s_axi_arlen[2]),
        .O(\first_step_q[8]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \first_step_q[9]_i_1__0 
       (.I0(s_axi_arsize[2]),
        .I1(\first_step_q[9]_i_2__0_n_0 ),
        .O(first_step[9]));
  LUT6 #(
    .INIT(64'h4AA2A2A228808080)) 
    \first_step_q[9]_i_2__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arlen[2]),
        .I3(s_axi_arlen[0]),
        .I4(s_axi_arlen[1]),
        .I5(s_axi_arlen[3]),
        .O(\first_step_q[9]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[0]_i_1__0_n_0 ),
        .Q(\first_step_q_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(first_step[10]),
        .Q(\first_step_q_reg_n_0_[10] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(first_step[11]),
        .Q(\first_step_q_reg_n_0_[11] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[1]_i_1__0_n_0 ),
        .Q(\first_step_q_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[2]_i_1__0_n_0 ),
        .Q(\first_step_q_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[3]_i_1__0_n_0 ),
        .Q(\first_step_q_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(first_step[4]),
        .Q(\first_step_q_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(first_step[5]),
        .Q(\first_step_q_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(first_step[6]),
        .Q(\first_step_q_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(first_step[7]),
        .Q(\first_step_q_reg_n_0_[7] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(first_step[8]),
        .Q(\first_step_q_reg_n_0_[8] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(first_step[9]),
        .Q(\first_step_q_reg_n_0_[9] ),
        .R(SR));
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
        .R(SR));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[0]_INST_0 
       (.I0(next_mi_addr[0]),
        .I1(size_mask_q[0]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(\S_AXI_AADDR_Q_reg_n_0_[0] ),
        .O(m_axi_araddr[0]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[10]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[10] ),
        .I1(next_mi_addr[10]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[10]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[11]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[11] ),
        .I1(next_mi_addr[11]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[11]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[12]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[12] ),
        .I1(next_mi_addr[12]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[12]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[13]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[13] ),
        .I1(next_mi_addr[13]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[13]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[14]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[14] ),
        .I1(next_mi_addr[14]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[14]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[15]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[15] ),
        .I1(next_mi_addr[15]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[15]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[16]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[16] ),
        .I1(next_mi_addr[16]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[16]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[17]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[17] ),
        .I1(next_mi_addr[17]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[17]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[18]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[18] ),
        .I1(next_mi_addr[18]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[18]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[19]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[19] ),
        .I1(next_mi_addr[19]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[19]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[1]_INST_0 
       (.I0(next_mi_addr[1]),
        .I1(size_mask_q[1]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(\S_AXI_AADDR_Q_reg_n_0_[1] ),
        .O(m_axi_araddr[1]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[20]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[20] ),
        .I1(next_mi_addr[20]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[20]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[21]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[21] ),
        .I1(next_mi_addr[21]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[21]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[22]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[22] ),
        .I1(next_mi_addr[22]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[22]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[23]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[23] ),
        .I1(next_mi_addr[23]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[23]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[24]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[24] ),
        .I1(next_mi_addr[24]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[24]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[25]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[25] ),
        .I1(next_mi_addr[25]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[25]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[26]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[26] ),
        .I1(next_mi_addr[26]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[26]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[27]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[27] ),
        .I1(next_mi_addr[27]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[27]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[28]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[28] ),
        .I1(next_mi_addr[28]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[28]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[29]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[29] ),
        .I1(next_mi_addr[29]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[29]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[2]_INST_0 
       (.I0(next_mi_addr[2]),
        .I1(size_mask_q[2]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(\S_AXI_AADDR_Q_reg_n_0_[2] ),
        .O(m_axi_araddr[2]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[30]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[30] ),
        .I1(next_mi_addr[30]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[30]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[31]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[31] ),
        .I1(next_mi_addr[31]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[31]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[3]_INST_0 
       (.I0(next_mi_addr[3]),
        .I1(size_mask_q[3]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(\S_AXI_AADDR_Q_reg_n_0_[3] ),
        .O(m_axi_araddr[3]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[4]_INST_0 
       (.I0(next_mi_addr[4]),
        .I1(size_mask_q[4]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(\S_AXI_AADDR_Q_reg_n_0_[4] ),
        .O(m_axi_araddr[4]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[5]_INST_0 
       (.I0(next_mi_addr[5]),
        .I1(size_mask_q[5]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(\S_AXI_AADDR_Q_reg_n_0_[5] ),
        .O(m_axi_araddr[5]));
  LUT5 #(
    .INIT(32'h8FFF8000)) 
    \m_axi_araddr[6]_INST_0 
       (.I0(next_mi_addr[6]),
        .I1(size_mask_q[6]),
        .I2(split_ongoing),
        .I3(access_is_incr_q),
        .I4(\S_AXI_AADDR_Q_reg_n_0_[6] ),
        .O(m_axi_araddr[6]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[7]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[7] ),
        .I1(next_mi_addr[7]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[7]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[8]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[8] ),
        .I1(next_mi_addr[8]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(m_axi_araddr[8]));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \m_axi_araddr[9]_INST_0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[9] ),
        .I1(next_mi_addr[9]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
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
  LUT6 #(
    .INIT(64'h00000EEE00000000)) 
    multiple_id_non_split_i_1
       (.I0(multiple_id_non_split),
        .I1(multiple_id_non_split0),
        .I2(almost_empty),
        .I3(\USE_READ.USE_SPLIT_R.rd_cmd_ready ),
        .I4(cmd_empty),
        .I5(aresetn),
        .O(multiple_id_non_split_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    multiple_id_non_split_reg
       (.C(aclk),
        .CE(1'b1),
        .D(multiple_id_non_split_i_1_n_0),
        .Q(multiple_id_non_split),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_2 
       (.I0(m_axi_araddr[11]),
        .I1(\addr_step_q_reg_n_0_[11] ),
        .I2(first_split__2),
        .I3(\first_step_q_reg_n_0_[11] ),
        .O(\next_mi_addr[11]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_3 
       (.I0(m_axi_araddr[10]),
        .I1(\addr_step_q_reg_n_0_[10] ),
        .I2(first_split__2),
        .I3(\first_step_q_reg_n_0_[10] ),
        .O(\next_mi_addr[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_4 
       (.I0(m_axi_araddr[9]),
        .I1(\addr_step_q_reg_n_0_[9] ),
        .I2(first_split__2),
        .I3(\first_step_q_reg_n_0_[9] ),
        .O(\next_mi_addr[11]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_5 
       (.I0(m_axi_araddr[8]),
        .I1(\addr_step_q_reg_n_0_[8] ),
        .I2(first_split__2),
        .I3(\first_step_q_reg_n_0_[8] ),
        .O(\next_mi_addr[11]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \next_mi_addr[11]_i_6__0 
       (.I0(pushed_commands_reg[1]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[3]),
        .I3(pushed_commands_reg[2]),
        .O(first_split__2));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_2__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[15] ),
        .I1(next_mi_addr[15]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_3__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[14] ),
        .I1(next_mi_addr[14]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_3__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_4__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[13] ),
        .I1(next_mi_addr[13]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_4__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_5__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[12] ),
        .I1(next_mi_addr[12]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_5__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_6__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[15] ),
        .I1(next_mi_addr[15]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_6__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_7__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[14] ),
        .I1(next_mi_addr[14]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_7__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_8__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[13] ),
        .I1(next_mi_addr[13]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_8__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[15]_i_9__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[12] ),
        .I1(next_mi_addr[12]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[15]_i_9__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[19]_i_2__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[19] ),
        .I1(next_mi_addr[19]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[19]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[19]_i_3__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[18] ),
        .I1(next_mi_addr[18]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[19]_i_3__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[19]_i_4__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[17] ),
        .I1(next_mi_addr[17]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[19]_i_4__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[19]_i_5__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[16] ),
        .I1(next_mi_addr[16]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[19]_i_5__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[23]_i_2__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[23] ),
        .I1(next_mi_addr[23]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[23]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[23]_i_3__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[22] ),
        .I1(next_mi_addr[22]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[23]_i_3__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[23]_i_4__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[21] ),
        .I1(next_mi_addr[21]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[23]_i_4__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[23]_i_5__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[20] ),
        .I1(next_mi_addr[20]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[23]_i_5__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[27]_i_2__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[27] ),
        .I1(next_mi_addr[27]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[27]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[27]_i_3__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[26] ),
        .I1(next_mi_addr[26]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[27]_i_3__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[27]_i_4__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[25] ),
        .I1(next_mi_addr[25]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[27]_i_4__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[27]_i_5__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[24] ),
        .I1(next_mi_addr[24]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[27]_i_5__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[31]_i_2__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[31] ),
        .I1(next_mi_addr[31]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[31]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[31]_i_3__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[30] ),
        .I1(next_mi_addr[30]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[31]_i_3__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[31]_i_4__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[29] ),
        .I1(next_mi_addr[29]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[31]_i_4__0_n_0 ));
  LUT5 #(
    .INIT(32'hCAAA0AAA)) 
    \next_mi_addr[31]_i_5__0 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[28] ),
        .I1(next_mi_addr[28]),
        .I2(access_is_incr_q),
        .I3(split_ongoing),
        .I4(size_mask_q[31]),
        .O(\next_mi_addr[31]_i_5__0_n_0 ));
  LUT6 #(
    .INIT(64'h1DDDE222E222E222)) 
    \next_mi_addr[3]_i_2 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[3] ),
        .I1(M_AXI_AADDR_I1__0),
        .I2(size_mask_q[3]),
        .I3(next_mi_addr[3]),
        .I4(first_split__2),
        .I5(\first_step_q_reg_n_0_[3] ),
        .O(\next_mi_addr[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1DDDE222E222E222)) 
    \next_mi_addr[3]_i_3 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[2] ),
        .I1(M_AXI_AADDR_I1__0),
        .I2(size_mask_q[2]),
        .I3(next_mi_addr[2]),
        .I4(first_split__2),
        .I5(\first_step_q_reg_n_0_[2] ),
        .O(\next_mi_addr[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h1DDDE222E222E222)) 
    \next_mi_addr[3]_i_4 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[1] ),
        .I1(M_AXI_AADDR_I1__0),
        .I2(size_mask_q[1]),
        .I3(next_mi_addr[1]),
        .I4(first_split__2),
        .I5(\first_step_q_reg_n_0_[1] ),
        .O(\next_mi_addr[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1DDDE222E222E222)) 
    \next_mi_addr[3]_i_5 
       (.I0(\S_AXI_AADDR_Q_reg_n_0_[0] ),
        .I1(M_AXI_AADDR_I1__0),
        .I2(size_mask_q[0]),
        .I3(next_mi_addr[0]),
        .I4(first_split__2),
        .I5(\first_step_q_reg_n_0_[0] ),
        .O(\next_mi_addr[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \next_mi_addr[3]_i_6__0 
       (.I0(split_ongoing),
        .I1(access_is_incr_q),
        .O(M_AXI_AADDR_I1__0));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_2 
       (.I0(m_axi_araddr[7]),
        .I1(\addr_step_q_reg_n_0_[7] ),
        .I2(first_split__2),
        .I3(\first_step_q_reg_n_0_[7] ),
        .O(\next_mi_addr[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_3 
       (.I0(m_axi_araddr[6]),
        .I1(\addr_step_q_reg_n_0_[6] ),
        .I2(first_split__2),
        .I3(\first_step_q_reg_n_0_[6] ),
        .O(\next_mi_addr[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_4 
       (.I0(m_axi_araddr[5]),
        .I1(\addr_step_q_reg_n_0_[5] ),
        .I2(first_split__2),
        .I3(\first_step_q_reg_n_0_[5] ),
        .O(\next_mi_addr[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_5 
       (.I0(m_axi_araddr[4]),
        .I1(size_mask_q[0]),
        .I2(first_split__2),
        .I3(\first_step_q_reg_n_0_[4] ),
        .O(\next_mi_addr[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[0] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[3]_i_1__0_n_7 ),
        .Q(next_mi_addr[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[10] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[11]_i_1__0_n_5 ),
        .Q(next_mi_addr[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[11] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[11]_i_1__0_n_4 ),
        .Q(next_mi_addr[11]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[11]_i_1__0 
       (.CI(\next_mi_addr_reg[7]_i_1__0_n_0 ),
        .CO({\next_mi_addr_reg[11]_i_1__0_n_0 ,\next_mi_addr_reg[11]_i_1__0_n_1 ,\next_mi_addr_reg[11]_i_1__0_n_2 ,\next_mi_addr_reg[11]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(m_axi_araddr[11:8]),
        .O({\next_mi_addr_reg[11]_i_1__0_n_4 ,\next_mi_addr_reg[11]_i_1__0_n_5 ,\next_mi_addr_reg[11]_i_1__0_n_6 ,\next_mi_addr_reg[11]_i_1__0_n_7 }),
        .S({\next_mi_addr[11]_i_2_n_0 ,\next_mi_addr[11]_i_3_n_0 ,\next_mi_addr[11]_i_4_n_0 ,\next_mi_addr[11]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[12] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[15]_i_1__0_n_7 ),
        .Q(next_mi_addr[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[13] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[15]_i_1__0_n_6 ),
        .Q(next_mi_addr[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[14] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[15]_i_1__0_n_5 ),
        .Q(next_mi_addr[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[15] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[15]_i_1__0_n_4 ),
        .Q(next_mi_addr[15]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[15]_i_1__0 
       (.CI(\next_mi_addr_reg[11]_i_1__0_n_0 ),
        .CO({\next_mi_addr_reg[15]_i_1__0_n_0 ,\next_mi_addr_reg[15]_i_1__0_n_1 ,\next_mi_addr_reg[15]_i_1__0_n_2 ,\next_mi_addr_reg[15]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({\next_mi_addr[15]_i_2__0_n_0 ,\next_mi_addr[15]_i_3__0_n_0 ,\next_mi_addr[15]_i_4__0_n_0 ,\next_mi_addr[15]_i_5__0_n_0 }),
        .O({\next_mi_addr_reg[15]_i_1__0_n_4 ,\next_mi_addr_reg[15]_i_1__0_n_5 ,\next_mi_addr_reg[15]_i_1__0_n_6 ,\next_mi_addr_reg[15]_i_1__0_n_7 }),
        .S({\next_mi_addr[15]_i_6__0_n_0 ,\next_mi_addr[15]_i_7__0_n_0 ,\next_mi_addr[15]_i_8__0_n_0 ,\next_mi_addr[15]_i_9__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[16] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[19]_i_1__0_n_7 ),
        .Q(next_mi_addr[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[17] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[19]_i_1__0_n_6 ),
        .Q(next_mi_addr[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[18] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[19]_i_1__0_n_5 ),
        .Q(next_mi_addr[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[19] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[19]_i_1__0_n_4 ),
        .Q(next_mi_addr[19]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[19]_i_1__0 
       (.CI(\next_mi_addr_reg[15]_i_1__0_n_0 ),
        .CO({\next_mi_addr_reg[19]_i_1__0_n_0 ,\next_mi_addr_reg[19]_i_1__0_n_1 ,\next_mi_addr_reg[19]_i_1__0_n_2 ,\next_mi_addr_reg[19]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\next_mi_addr_reg[19]_i_1__0_n_4 ,\next_mi_addr_reg[19]_i_1__0_n_5 ,\next_mi_addr_reg[19]_i_1__0_n_6 ,\next_mi_addr_reg[19]_i_1__0_n_7 }),
        .S({\next_mi_addr[19]_i_2__0_n_0 ,\next_mi_addr[19]_i_3__0_n_0 ,\next_mi_addr[19]_i_4__0_n_0 ,\next_mi_addr[19]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[1] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[3]_i_1__0_n_6 ),
        .Q(next_mi_addr[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[20] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[23]_i_1__0_n_7 ),
        .Q(next_mi_addr[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[21] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[23]_i_1__0_n_6 ),
        .Q(next_mi_addr[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[22] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[23]_i_1__0_n_5 ),
        .Q(next_mi_addr[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[23] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[23]_i_1__0_n_4 ),
        .Q(next_mi_addr[23]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[23]_i_1__0 
       (.CI(\next_mi_addr_reg[19]_i_1__0_n_0 ),
        .CO({\next_mi_addr_reg[23]_i_1__0_n_0 ,\next_mi_addr_reg[23]_i_1__0_n_1 ,\next_mi_addr_reg[23]_i_1__0_n_2 ,\next_mi_addr_reg[23]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\next_mi_addr_reg[23]_i_1__0_n_4 ,\next_mi_addr_reg[23]_i_1__0_n_5 ,\next_mi_addr_reg[23]_i_1__0_n_6 ,\next_mi_addr_reg[23]_i_1__0_n_7 }),
        .S({\next_mi_addr[23]_i_2__0_n_0 ,\next_mi_addr[23]_i_3__0_n_0 ,\next_mi_addr[23]_i_4__0_n_0 ,\next_mi_addr[23]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[24] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[27]_i_1__0_n_7 ),
        .Q(next_mi_addr[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[25] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[27]_i_1__0_n_6 ),
        .Q(next_mi_addr[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[26] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[27]_i_1__0_n_5 ),
        .Q(next_mi_addr[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[27] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[27]_i_1__0_n_4 ),
        .Q(next_mi_addr[27]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[27]_i_1__0 
       (.CI(\next_mi_addr_reg[23]_i_1__0_n_0 ),
        .CO({\next_mi_addr_reg[27]_i_1__0_n_0 ,\next_mi_addr_reg[27]_i_1__0_n_1 ,\next_mi_addr_reg[27]_i_1__0_n_2 ,\next_mi_addr_reg[27]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\next_mi_addr_reg[27]_i_1__0_n_4 ,\next_mi_addr_reg[27]_i_1__0_n_5 ,\next_mi_addr_reg[27]_i_1__0_n_6 ,\next_mi_addr_reg[27]_i_1__0_n_7 }),
        .S({\next_mi_addr[27]_i_2__0_n_0 ,\next_mi_addr[27]_i_3__0_n_0 ,\next_mi_addr[27]_i_4__0_n_0 ,\next_mi_addr[27]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[28] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[31]_i_1__0_n_7 ),
        .Q(next_mi_addr[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[29] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[31]_i_1__0_n_6 ),
        .Q(next_mi_addr[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[2] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[3]_i_1__0_n_5 ),
        .Q(next_mi_addr[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[30] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[31]_i_1__0_n_5 ),
        .Q(next_mi_addr[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[31] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[31]_i_1__0_n_4 ),
        .Q(next_mi_addr[31]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[31]_i_1__0 
       (.CI(\next_mi_addr_reg[27]_i_1__0_n_0 ),
        .CO({\NLW_next_mi_addr_reg[31]_i_1__0_CO_UNCONNECTED [3],\next_mi_addr_reg[31]_i_1__0_n_1 ,\next_mi_addr_reg[31]_i_1__0_n_2 ,\next_mi_addr_reg[31]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\next_mi_addr_reg[31]_i_1__0_n_4 ,\next_mi_addr_reg[31]_i_1__0_n_5 ,\next_mi_addr_reg[31]_i_1__0_n_6 ,\next_mi_addr_reg[31]_i_1__0_n_7 }),
        .S({\next_mi_addr[31]_i_2__0_n_0 ,\next_mi_addr[31]_i_3__0_n_0 ,\next_mi_addr[31]_i_4__0_n_0 ,\next_mi_addr[31]_i_5__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[3] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[3]_i_1__0_n_4 ),
        .Q(next_mi_addr[3]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[3]_i_1__0 
       (.CI(1'b0),
        .CO({\next_mi_addr_reg[3]_i_1__0_n_0 ,\next_mi_addr_reg[3]_i_1__0_n_1 ,\next_mi_addr_reg[3]_i_1__0_n_2 ,\next_mi_addr_reg[3]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(m_axi_araddr[3:0]),
        .O({\next_mi_addr_reg[3]_i_1__0_n_4 ,\next_mi_addr_reg[3]_i_1__0_n_5 ,\next_mi_addr_reg[3]_i_1__0_n_6 ,\next_mi_addr_reg[3]_i_1__0_n_7 }),
        .S({\next_mi_addr[3]_i_2_n_0 ,\next_mi_addr[3]_i_3_n_0 ,\next_mi_addr[3]_i_4_n_0 ,\next_mi_addr[3]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[4] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[7]_i_1__0_n_7 ),
        .Q(next_mi_addr[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[5] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[7]_i_1__0_n_6 ),
        .Q(next_mi_addr[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[6] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[7]_i_1__0_n_5 ),
        .Q(next_mi_addr[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[7] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[7]_i_1__0_n_4 ),
        .Q(next_mi_addr[7]),
        .R(SR));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[7]_i_1__0 
       (.CI(\next_mi_addr_reg[3]_i_1__0_n_0 ),
        .CO({\next_mi_addr_reg[7]_i_1__0_n_0 ,\next_mi_addr_reg[7]_i_1__0_n_1 ,\next_mi_addr_reg[7]_i_1__0_n_2 ,\next_mi_addr_reg[7]_i_1__0_n_3 }),
        .CYINIT(1'b0),
        .DI(m_axi_araddr[7:4]),
        .O({\next_mi_addr_reg[7]_i_1__0_n_4 ,\next_mi_addr_reg[7]_i_1__0_n_5 ,\next_mi_addr_reg[7]_i_1__0_n_6 ,\next_mi_addr_reg[7]_i_1__0_n_7 }),
        .S({\next_mi_addr[7]_i_2_n_0 ,\next_mi_addr[7]_i_3_n_0 ,\next_mi_addr[7]_i_4_n_0 ,\next_mi_addr[7]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[8] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[11]_i_1__0_n_7 ),
        .Q(next_mi_addr[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[9] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[11]_i_1__0_n_6 ),
        .Q(next_mi_addr[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[4]),
        .Q(\num_transactions_q_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[5]),
        .Q(\num_transactions_q_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[6]),
        .Q(\num_transactions_q_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_arlen[7]),
        .Q(\num_transactions_q_reg_n_0_[3] ),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \pushed_commands[0]_i_1__0 
       (.I0(pushed_commands_reg[0]),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \pushed_commands[1]_i_1__0 
       (.I0(pushed_commands_reg[0]),
        .I1(pushed_commands_reg[1]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \pushed_commands[2]_i_1__0 
       (.I0(pushed_commands_reg[1]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[2]),
        .O(p_0_in__1[2]));
  LUT2 #(
    .INIT(4'hB)) 
    \pushed_commands[3]_i_1__0 
       (.I0(E),
        .I1(aresetn),
        .O(\pushed_commands[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \pushed_commands[3]_i_2__0 
       (.I0(pushed_commands_reg[2]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[1]),
        .I3(pushed_commands_reg[3]),
        .O(p_0_in__1[3]));
  FDRE #(
    .INIT(1'b0)) 
    \pushed_commands_reg[0] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in__1[0]),
        .Q(pushed_commands_reg[0]),
        .R(\pushed_commands[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pushed_commands_reg[1] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in__1[1]),
        .Q(pushed_commands_reg[1]),
        .R(\pushed_commands[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pushed_commands_reg[2] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in__1[2]),
        .Q(pushed_commands_reg[2]),
        .R(\pushed_commands[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pushed_commands_reg[3] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(p_0_in__1[3]),
        .Q(pushed_commands_reg[3]),
        .R(\pushed_commands[3]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \queue_id_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_R_CHANNEL.cmd_queue_n_17 ),
        .Q(\queue_id_reg_n_0_[0] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \size_mask_q[0]_i_1__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arsize[2]),
        .O(\size_mask_q[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \size_mask_q[1]_i_1__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[2]),
        .O(\size_mask_q[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h15)) 
    \size_mask_q[2]_i_1__0 
       (.I0(s_axi_arsize[2]),
        .I1(s_axi_arsize[1]),
        .I2(s_axi_arsize[0]),
        .O(\size_mask_q[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \size_mask_q[3]_i_1__0 
       (.I0(s_axi_arsize[2]),
        .O(\size_mask_q[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h57)) 
    \size_mask_q[4]_i_1__0 
       (.I0(s_axi_arsize[2]),
        .I1(s_axi_arsize[1]),
        .I2(s_axi_arsize[0]),
        .O(\size_mask_q[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \size_mask_q[5]_i_1__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[2]),
        .O(\size_mask_q[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \size_mask_q[6]_i_1__0 
       (.I0(s_axi_arsize[1]),
        .I1(s_axi_arsize[0]),
        .I2(s_axi_arsize[2]),
        .O(\size_mask_q[6]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(\size_mask_q[0]_i_1__0_n_0 ),
        .Q(size_mask_q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(\size_mask_q[1]_i_1__0_n_0 ),
        .Q(size_mask_q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(\size_mask_q[2]_i_1__0_n_0 ),
        .Q(size_mask_q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(1'b1),
        .Q(size_mask_q[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(\size_mask_q[3]_i_1__0_n_0 ),
        .Q(size_mask_q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(\size_mask_q[4]_i_1__0_n_0 ),
        .Q(size_mask_q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(\size_mask_q[5]_i_1__0_n_0 ),
        .Q(size_mask_q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(\size_mask_q[6]_i_1__0_n_0 ),
        .Q(size_mask_q[6]),
        .R(SR));
  LUT6 #(
    .INIT(64'h00000000AAAAAAEA)) 
    split_in_progress_i_1
       (.I0(split_in_progress_reg_n_0),
        .I1(cmd_id_check__2),
        .I2(need_to_split_q),
        .I3(multiple_id_non_split),
        .I4(\USE_R_CHANNEL.cmd_queue_n_5 ),
        .I5(split_in_progress),
        .O(split_in_progress_i_1_n_0));
  LUT3 #(
    .INIT(8'hF9)) 
    split_in_progress_i_2__0
       (.I0(\queue_id_reg_n_0_[0] ),
        .I1(\S_AXI_AID_Q_reg[0]_0 ),
        .I2(cmd_empty),
        .O(cmd_id_check__2));
  FDRE #(
    .INIT(1'b0)) 
    split_in_progress_reg
       (.C(aclk),
        .CE(1'b1),
        .D(split_in_progress_i_1_n_0),
        .Q(split_in_progress_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    split_ongoing_reg
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(cmd_split_i),
        .Q(split_ongoing),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_33_axi3_conv" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi3_conv
   (ram_full_i_reg,
    S_AXI_AREADY_I_reg,
    m_axi_wid,
    M_AXI_AWID,
    m_axi_awlen,
    m_axi_bready,
    s_axi_bresp,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    S_AXI_AREADY_I_reg_0,
    M_AXI_ARID,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_awaddr,
    m_axi_araddr,
    s_axi_bvalid,
    empty_fwft_i_reg,
    m_axi_wvalid,
    m_axi_wlast,
    m_axi_arvalid,
    s_axi_rvalid,
    m_axi_awlock,
    m_axi_arlen,
    m_axi_arlock,
    s_axi_rlast,
    m_axi_rready,
    s_axi_awsize,
    s_axi_awlen,
    s_axi_arsize,
    s_axi_arlen,
    aresetn,
    m_axi_bvalid,
    s_axi_bready,
    m_axi_arready,
    aclk,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    m_axi_awready,
    m_axi_wready,
    s_axi_wvalid,
    m_axi_rvalid,
    s_axi_rready,
    m_axi_rlast,
    m_axi_bresp,
    s_axi_awvalid,
    s_axi_arvalid);
  output ram_full_i_reg;
  output S_AXI_AREADY_I_reg;
  output [0:0]m_axi_wid;
  output [0:0]M_AXI_AWID;
  output [3:0]m_axi_awlen;
  output m_axi_bready;
  output [1:0]s_axi_bresp;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output S_AXI_AREADY_I_reg_0;
  output [0:0]M_AXI_ARID;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [31:0]m_axi_awaddr;
  output [31:0]m_axi_araddr;
  output s_axi_bvalid;
  output empty_fwft_i_reg;
  output m_axi_wvalid;
  output m_axi_wlast;
  output m_axi_arvalid;
  output s_axi_rvalid;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_arlen;
  output [0:0]m_axi_arlock;
  output s_axi_rlast;
  output m_axi_rready;
  input [2:0]s_axi_awsize;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_arsize;
  input [7:0]s_axi_arlen;
  input aresetn;
  input m_axi_bvalid;
  input s_axi_bready;
  input m_axi_arready;
  input aclk;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input m_axi_awready;
  input m_axi_wready;
  input s_axi_wvalid;
  input m_axi_rvalid;
  input s_axi_rready;
  input m_axi_rlast;
  input [1:0]m_axi_bresp;
  input s_axi_awvalid;
  input s_axi_arvalid;

  wire [0:0]M_AXI_ARID;
  wire [0:0]M_AXI_AWID;
  wire S_AXI_AREADY_I_reg;
  wire S_AXI_AREADY_I_reg_0;
  wire \USE_BURSTS.cmd_queue/inst/empty ;
  wire [3:0]\USE_WRITE.wr_cmd_b_repeat ;
  wire \USE_WRITE.wr_cmd_b_split ;
  wire [3:0]\USE_WRITE.wr_cmd_length ;
  wire \USE_WRITE.wr_cmd_ready ;
  wire \USE_WRITE.write_addr_inst_n_21 ;
  wire \USE_WRITE.write_addr_inst_n_54 ;
  wire \USE_WRITE.write_addr_inst_n_57 ;
  wire \USE_WRITE.write_addr_inst_n_58 ;
  wire \USE_WRITE.write_addr_inst_n_59 ;
  wire \USE_WRITE.write_addr_inst_n_6 ;
  wire \USE_WRITE.write_data_inst_n_4 ;
  wire \USE_WRITE.write_data_inst_n_6 ;
  wire aclk;
  wire [1:0]areset_d;
  wire aresetn;
  wire empty_fwft_i_reg;
  wire first_mi_word;
  wire last_word;
  wire [1:0]length_counter_1_reg;
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
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]m_axi_awlock;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire [0:0]m_axi_wid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire ram_full_i_reg;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire s_axi_wvalid;

  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv__parameterized0 \USE_READ.USE_SPLIT_R.read_addr_inst 
       (.E(S_AXI_AREADY_I_reg_0),
        .SR(\USE_WRITE.write_addr_inst_n_6 ),
        .\S_AXI_AID_Q_reg[0]_0 (M_AXI_ARID),
        .aclk(aclk),
        .areset_d(areset_d),
        .aresetn(aresetn),
        .command_ongoing_reg_0(\USE_WRITE.write_addr_inst_n_59 ),
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
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arqos(s_axi_arqos),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid));
  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_b_downsizer \USE_WRITE.USE_SPLIT_W.write_resp_inst 
       (.E(m_axi_bready),
        .SR(\USE_WRITE.write_addr_inst_n_6 ),
        .aclk(aclk),
        .dout({\USE_WRITE.wr_cmd_b_split ,\USE_WRITE.wr_cmd_b_repeat }),
        .last_word(last_word),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid));
  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv \USE_WRITE.write_addr_inst 
       (.E(S_AXI_AREADY_I_reg),
        .SR(\USE_WRITE.write_addr_inst_n_6 ),
        .\USE_WRITE.wr_cmd_ready (\USE_WRITE.wr_cmd_ready ),
        .aclk(aclk),
        .areset_d(areset_d),
        .\areset_d_reg[0]_0 (\USE_WRITE.write_addr_inst_n_59 ),
        .aresetn(aresetn),
        .\cmd_depth_reg[5]_0 (\USE_WRITE.write_data_inst_n_6 ),
        .cmd_push_block_reg_0(\USE_WRITE.write_addr_inst_n_21 ),
        .din({M_AXI_AWID,m_axi_awlen}),
        .dout({m_axi_wid,\USE_WRITE.wr_cmd_length }),
        .empty(\USE_BURSTS.cmd_queue/inst/empty ),
        .empty_fwft_i_reg(empty_fwft_i_reg),
        .first_mi_word(first_mi_word),
        .first_mi_word_reg(\USE_WRITE.write_addr_inst_n_58 ),
        .\goreg_dm.dout_i_reg[1] (\USE_WRITE.write_addr_inst_n_54 ),
        .\goreg_dm.dout_i_reg[2] (\USE_WRITE.write_addr_inst_n_57 ),
        .\goreg_dm.dout_i_reg[4] ({\USE_WRITE.wr_cmd_b_split ,\USE_WRITE.wr_cmd_b_repeat }),
        .last_word(last_word),
        .length_counter_1_reg(length_counter_1_reg),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awlock(m_axi_awlock),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_wlast(\USE_WRITE.write_data_inst_n_4 ),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .ram_full_i_reg(ram_full_i_reg),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_wvalid(s_axi_wvalid));
  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_w_axi3_conv \USE_WRITE.write_data_inst 
       (.SR(\USE_WRITE.write_addr_inst_n_6 ),
        .\USE_WRITE.wr_cmd_ready (\USE_WRITE.wr_cmd_ready ),
        .aclk(aclk),
        .\cmd_depth_reg[5] (\USE_WRITE.write_addr_inst_n_58 ),
        .\cmd_depth_reg[5]_0 (\USE_WRITE.write_addr_inst_n_21 ),
        .dout(\USE_WRITE.wr_cmd_length ),
        .empty(\USE_BURSTS.cmd_queue/inst/empty ),
        .first_mi_word(first_mi_word),
        .first_mi_word_reg_0(\USE_WRITE.write_data_inst_n_4 ),
        .\length_counter_1_reg[1]_0 (length_counter_1_reg),
        .\length_counter_1_reg[1]_1 (\USE_WRITE.write_addr_inst_n_54 ),
        .\length_counter_1_reg[2]_0 (empty_fwft_i_reg),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wlast_0(\USE_WRITE.write_addr_inst_n_57 ),
        .m_axi_wready(m_axi_wready),
        .m_axi_wready_0(\USE_WRITE.write_data_inst_n_6 ),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* C_AXI_ADDR_WIDTH = "32" *) (* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) 
(* C_AXI_BUSER_WIDTH = "1" *) (* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) 
(* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_SUPPORTS_READ = "1" *) (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
(* C_AXI_SUPPORTS_WRITE = "1" *) (* C_AXI_WUSER_WIDTH = "1" *) (* C_FAMILY = "zynq" *) 
(* C_IGNORE_ID = "0" *) (* C_M_AXI_PROTOCOL = "1" *) (* C_S_AXI_PROTOCOL = "0" *) 
(* C_TRANSLATION_MODE = "2" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "axi_protocol_converter_v2_1_33_axi_protocol_converter" *) 
(* P_AXI3 = "1" *) (* P_AXI4 = "0" *) (* P_AXILITE = "2" *) 
(* P_AXILITE_SIZE = "3'b011" *) (* P_CONVERSION = "2" *) (* P_DECERR = "2'b11" *) 
(* P_INCR = "2'b01" *) (* P_PROTECTION = "1" *) (* P_SLVERR = "2'b10" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter
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
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
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
  output [63:0]s_axi_rdata;
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
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
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
  input [63:0]m_axi_rdata;
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
  wire [0:0]m_axi_arid;
  wire [3:0]m_axi_arlen;
  wire [0:0]\^m_axi_arlock ;
  wire [2:0]m_axi_arprot;
  wire [3:0]m_axi_arqos;
  wire m_axi_arready;
  wire [2:0]m_axi_arsize;
  wire m_axi_arvalid;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [0:0]m_axi_awid;
  wire [3:0]m_axi_awlen;
  wire [0:0]\^m_axi_awlock ;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire [0:0]m_axi_bid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [63:0]m_axi_rdata;
  wire [0:0]m_axi_rid;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire [0:0]m_axi_wid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign m_axi_arlock[1] = \<const0> ;
  assign m_axi_arlock[0] = \^m_axi_arlock [0];
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_awlock[1] = \<const0> ;
  assign m_axi_awlock[0] = \^m_axi_awlock [0];
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_wdata[63:0] = s_axi_wdata;
  assign m_axi_wstrb[7:0] = s_axi_wstrb;
  assign m_axi_wuser[0] = \<const0> ;
  assign s_axi_bid[0] = m_axi_bid;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_rdata[63:0] = m_axi_rdata;
  assign s_axi_rid[0] = m_axi_rid;
  assign s_axi_rresp[1:0] = m_axi_rresp;
  assign s_axi_ruser[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi3_conv \gen_axi4_axi3.axi3_conv_inst 
       (.M_AXI_ARID(m_axi_arid),
        .M_AXI_AWID(m_axi_awid),
        .S_AXI_AREADY_I_reg(s_axi_awready),
        .S_AXI_AREADY_I_reg_0(s_axi_arready),
        .aclk(aclk),
        .aresetn(aresetn),
        .empty_fwft_i_reg(s_axi_wready),
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
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awlock(\^m_axi_awlock ),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_wid(m_axi_wid),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .ram_full_i_reg(m_axi_awvalid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_arid(s_axi_arid),
        .s_axi_arlen(s_axi_arlen),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arqos(s_axi_arqos),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awid(s_axi_awid),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_33_b_downsizer" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_b_downsizer
   (E,
    last_word,
    s_axi_bvalid,
    s_axi_bresp,
    SR,
    aclk,
    s_axi_bready,
    m_axi_bvalid,
    dout,
    m_axi_bresp);
  output [0:0]E;
  output last_word;
  output s_axi_bvalid;
  output [1:0]s_axi_bresp;
  input [0:0]SR;
  input aclk;
  input s_axi_bready;
  input m_axi_bvalid;
  input [4:0]dout;
  input [1:0]m_axi_bresp;

  wire [0:0]E;
  wire [0:0]SR;
  wire [1:0]S_AXI_BRESP_ACC;
  wire aclk;
  wire [4:0]dout;
  wire first_mi_word;
  wire last_word;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [3:0]next_repeat_cnt;
  wire \repeat_cnt[3]_i_2_n_0 ;
  wire [3:0]repeat_cnt_reg;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;

  FDRE \S_AXI_BRESP_ACC_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_bresp[0]),
        .Q(S_AXI_BRESP_ACC[0]),
        .R(SR));
  FDRE \S_AXI_BRESP_ACC_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_bresp[1]),
        .Q(S_AXI_BRESP_ACC[1]),
        .R(SR));
  FDSE #(
    .INIT(1'b0)) 
    first_mi_word_reg
       (.C(aclk),
        .CE(E),
        .D(last_word),
        .Q(first_mi_word),
        .S(SR));
  LUT3 #(
    .INIT(8'hB0)) 
    m_axi_bready_INST_0
       (.I0(s_axi_bready),
        .I1(last_word),
        .I2(m_axi_bvalid),
        .O(E));
  LUT3 #(
    .INIT(8'h1D)) 
    \repeat_cnt[0]_i_1 
       (.I0(repeat_cnt_reg[0]),
        .I1(first_mi_word),
        .I2(dout[0]),
        .O(next_repeat_cnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'hB8748B47)) 
    \repeat_cnt[1]_i_1 
       (.I0(dout[1]),
        .I1(first_mi_word),
        .I2(repeat_cnt_reg[1]),
        .I3(dout[0]),
        .I4(repeat_cnt_reg[0]),
        .O(next_repeat_cnt[1]));
  LUT4 #(
    .INIT(16'hB847)) 
    \repeat_cnt[2]_i_1 
       (.I0(dout[2]),
        .I1(first_mi_word),
        .I2(repeat_cnt_reg[2]),
        .I3(\repeat_cnt[3]_i_2_n_0 ),
        .O(next_repeat_cnt[2]));
  LUT6 #(
    .INIT(64'hCCAACCAAC3AAC355)) 
    \repeat_cnt[3]_i_1 
       (.I0(repeat_cnt_reg[3]),
        .I1(dout[3]),
        .I2(dout[2]),
        .I3(first_mi_word),
        .I4(repeat_cnt_reg[2]),
        .I5(\repeat_cnt[3]_i_2_n_0 ),
        .O(next_repeat_cnt[3]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \repeat_cnt[3]_i_2 
       (.I0(repeat_cnt_reg[0]),
        .I1(dout[0]),
        .I2(repeat_cnt_reg[1]),
        .I3(first_mi_word),
        .I4(dout[1]),
        .O(\repeat_cnt[3]_i_2_n_0 ));
  FDRE \repeat_cnt_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(next_repeat_cnt[0]),
        .Q(repeat_cnt_reg[0]),
        .R(SR));
  FDRE \repeat_cnt_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(next_repeat_cnt[1]),
        .Q(repeat_cnt_reg[1]),
        .R(SR));
  FDRE \repeat_cnt_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(next_repeat_cnt[2]),
        .Q(repeat_cnt_reg[2]),
        .R(SR));
  FDRE \repeat_cnt_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(next_repeat_cnt[3]),
        .Q(repeat_cnt_reg[3]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFF4404FBFF0000)) 
    \s_axi_bresp[0]_INST_0 
       (.I0(first_mi_word),
        .I1(dout[4]),
        .I2(m_axi_bresp[1]),
        .I3(S_AXI_BRESP_ACC[1]),
        .I4(m_axi_bresp[0]),
        .I5(S_AXI_BRESP_ACC[0]),
        .O(s_axi_bresp[0]));
  LUT4 #(
    .INIT(16'hF4F0)) 
    \s_axi_bresp[1]_INST_0 
       (.I0(first_mi_word),
        .I1(dout[4]),
        .I2(m_axi_bresp[1]),
        .I3(S_AXI_BRESP_ACC[1]),
        .O(s_axi_bresp[1]));
  LUT2 #(
    .INIT(4'h8)) 
    s_axi_bvalid_INST_0
       (.I0(m_axi_bvalid),
        .I1(last_word),
        .O(s_axi_bvalid));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    s_axi_bvalid_INST_0_i_1
       (.I0(repeat_cnt_reg[3]),
        .I1(first_mi_word),
        .I2(repeat_cnt_reg[2]),
        .I3(repeat_cnt_reg[1]),
        .I4(repeat_cnt_reg[0]),
        .I5(dout[4]),
        .O(last_word));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_33_w_axi3_conv" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_w_axi3_conv
   (\length_counter_1_reg[1]_0 ,
    first_mi_word,
    \USE_WRITE.wr_cmd_ready ,
    first_mi_word_reg_0,
    m_axi_wlast,
    m_axi_wready_0,
    SR,
    aclk,
    \length_counter_1_reg[1]_1 ,
    m_axi_wready,
    s_axi_wvalid,
    empty,
    \cmd_depth_reg[5] ,
    \length_counter_1_reg[2]_0 ,
    dout,
    m_axi_wlast_0,
    \cmd_depth_reg[5]_0 );
  output [1:0]\length_counter_1_reg[1]_0 ;
  output first_mi_word;
  output \USE_WRITE.wr_cmd_ready ;
  output first_mi_word_reg_0;
  output m_axi_wlast;
  output [0:0]m_axi_wready_0;
  input [0:0]SR;
  input aclk;
  input \length_counter_1_reg[1]_1 ;
  input m_axi_wready;
  input s_axi_wvalid;
  input empty;
  input \cmd_depth_reg[5] ;
  input \length_counter_1_reg[2]_0 ;
  input [3:0]dout;
  input m_axi_wlast_0;
  input \cmd_depth_reg[5]_0 ;

  wire [0:0]SR;
  wire \USE_WRITE.wr_cmd_ready ;
  wire aclk;
  wire \cmd_depth_reg[5] ;
  wire \cmd_depth_reg[5]_0 ;
  wire [3:0]dout;
  wire empty;
  wire fifo_gen_inst_i_4_n_0;
  wire first_mi_word;
  wire first_mi_word_i_1_n_0;
  wire first_mi_word_reg_0;
  wire \length_counter_1[0]_i_1_n_0 ;
  wire \length_counter_1[2]_i_1_n_0 ;
  wire \length_counter_1[2]_i_2_n_0 ;
  wire \length_counter_1[3]_i_1_n_0 ;
  wire \length_counter_1[3]_i_2_n_0 ;
  wire \length_counter_1[4]_i_1_n_0 ;
  wire \length_counter_1[5]_i_1_n_0 ;
  wire \length_counter_1[6]_i_1_n_0 ;
  wire \length_counter_1[6]_i_2_n_0 ;
  wire \length_counter_1[7]_i_1_n_0 ;
  wire \length_counter_1[7]_i_2_n_0 ;
  wire [7:2]length_counter_1_reg;
  wire [1:0]\length_counter_1_reg[1]_0 ;
  wire \length_counter_1_reg[1]_1 ;
  wire \length_counter_1_reg[2]_0 ;
  wire m_axi_wlast;
  wire m_axi_wlast_0;
  wire m_axi_wready;
  wire [0:0]m_axi_wready_0;
  wire s_axi_wvalid;

  LUT2 #(
    .INIT(4'h9)) 
    \cmd_depth[5]_i_1 
       (.I0(\USE_WRITE.wr_cmd_ready ),
        .I1(\cmd_depth_reg[5]_0 ),
        .O(m_axi_wready_0));
  LUT6 #(
    .INIT(64'h0080008000800000)) 
    fifo_gen_inst_i_2
       (.I0(fifo_gen_inst_i_4_n_0),
        .I1(m_axi_wready),
        .I2(s_axi_wvalid),
        .I3(empty),
        .I4(first_mi_word_reg_0),
        .I5(\cmd_depth_reg[5] ),
        .O(\USE_WRITE.wr_cmd_ready ));
  LUT5 #(
    .INIT(32'hFFFF0001)) 
    fifo_gen_inst_i_4
       (.I0(length_counter_1_reg[6]),
        .I1(length_counter_1_reg[7]),
        .I2(length_counter_1_reg[4]),
        .I3(length_counter_1_reg[5]),
        .I4(first_mi_word),
        .O(fifo_gen_inst_i_4_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    fifo_gen_inst_i_5
       (.I0(first_mi_word),
        .I1(\length_counter_1_reg[1]_0 [0]),
        .I2(\length_counter_1_reg[1]_0 [1]),
        .I3(length_counter_1_reg[3]),
        .I4(length_counter_1_reg[2]),
        .O(first_mi_word_reg_0));
  LUT5 #(
    .INIT(32'hEFFF2000)) 
    first_mi_word_i_1
       (.I0(m_axi_wlast),
        .I1(empty),
        .I2(s_axi_wvalid),
        .I3(m_axi_wready),
        .I4(first_mi_word),
        .O(first_mi_word_i_1_n_0));
  FDSE #(
    .INIT(1'b0)) 
    first_mi_word_reg
       (.C(aclk),
        .CE(1'b1),
        .D(first_mi_word_i_1_n_0),
        .Q(first_mi_word),
        .S(SR));
  LUT6 #(
    .INIT(64'hF2FFFFFF07000000)) 
    \length_counter_1[0]_i_1 
       (.I0(first_mi_word),
        .I1(dout[0]),
        .I2(empty),
        .I3(s_axi_wvalid),
        .I4(m_axi_wready),
        .I5(\length_counter_1_reg[1]_0 [0]),
        .O(\length_counter_1[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT5 #(
    .INIT(32'hD7DD8222)) 
    \length_counter_1[2]_i_1 
       (.I0(\length_counter_1_reg[2]_0 ),
        .I1(\length_counter_1[2]_i_2_n_0 ),
        .I2(dout[2]),
        .I3(first_mi_word),
        .I4(length_counter_1_reg[2]),
        .O(\length_counter_1[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFCAAFC)) 
    \length_counter_1[2]_i_2 
       (.I0(dout[0]),
        .I1(\length_counter_1_reg[1]_0 [0]),
        .I2(\length_counter_1_reg[1]_0 [1]),
        .I3(first_mi_word),
        .I4(dout[1]),
        .O(\length_counter_1[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA959CCCC)) 
    \length_counter_1[3]_i_1 
       (.I0(\length_counter_1[3]_i_2_n_0 ),
        .I1(length_counter_1_reg[3]),
        .I2(first_mi_word),
        .I3(dout[3]),
        .I4(\length_counter_1_reg[2]_0 ),
        .O(\length_counter_1[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'hFFE2)) 
    \length_counter_1[3]_i_2 
       (.I0(length_counter_1_reg[2]),
        .I1(first_mi_word),
        .I2(dout[2]),
        .I3(\length_counter_1[2]_i_2_n_0 ),
        .O(\length_counter_1[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8AAABAAAAAAA9AAA)) 
    \length_counter_1[4]_i_1 
       (.I0(length_counter_1_reg[4]),
        .I1(empty),
        .I2(s_axi_wvalid),
        .I3(m_axi_wready),
        .I4(\length_counter_1[6]_i_2_n_0 ),
        .I5(first_mi_word),
        .O(\length_counter_1[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'h2E2EAAA6)) 
    \length_counter_1[5]_i_1 
       (.I0(length_counter_1_reg[5]),
        .I1(\length_counter_1_reg[2]_0 ),
        .I2(\length_counter_1[6]_i_2_n_0 ),
        .I3(length_counter_1_reg[4]),
        .I4(first_mi_word),
        .O(\length_counter_1[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h44EE44EECCCCCCC6)) 
    \length_counter_1[6]_i_1 
       (.I0(\length_counter_1_reg[2]_0 ),
        .I1(length_counter_1_reg[6]),
        .I2(length_counter_1_reg[5]),
        .I3(\length_counter_1[6]_i_2_n_0 ),
        .I4(length_counter_1_reg[4]),
        .I5(first_mi_word),
        .O(\length_counter_1[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFAEEEEFFFA)) 
    \length_counter_1[6]_i_2 
       (.I0(\length_counter_1[2]_i_2_n_0 ),
        .I1(dout[2]),
        .I2(length_counter_1_reg[2]),
        .I3(length_counter_1_reg[3]),
        .I4(first_mi_word),
        .I5(dout[3]),
        .O(\length_counter_1[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h3FEF00D0)) 
    \length_counter_1[7]_i_1 
       (.I0(length_counter_1_reg[6]),
        .I1(first_mi_word),
        .I2(\length_counter_1_reg[2]_0 ),
        .I3(\length_counter_1[7]_i_2_n_0 ),
        .I4(length_counter_1_reg[7]),
        .O(\length_counter_1[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'hCCFE)) 
    \length_counter_1[7]_i_2 
       (.I0(length_counter_1_reg[5]),
        .I1(\length_counter_1[6]_i_2_n_0 ),
        .I2(length_counter_1_reg[4]),
        .I3(first_mi_word),
        .O(\length_counter_1[7]_i_2_n_0 ));
  FDRE \length_counter_1_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[0]_i_1_n_0 ),
        .Q(\length_counter_1_reg[1]_0 [0]),
        .R(SR));
  FDRE \length_counter_1_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1_reg[1]_1 ),
        .Q(\length_counter_1_reg[1]_0 [1]),
        .R(SR));
  FDRE \length_counter_1_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[2]_i_1_n_0 ),
        .Q(length_counter_1_reg[2]),
        .R(SR));
  FDRE \length_counter_1_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[3]_i_1_n_0 ),
        .Q(length_counter_1_reg[3]),
        .R(SR));
  FDRE \length_counter_1_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[4]_i_1_n_0 ),
        .Q(length_counter_1_reg[4]),
        .R(SR));
  FDRE \length_counter_1_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[5]_i_1_n_0 ),
        .Q(length_counter_1_reg[5]),
        .R(SR));
  FDRE \length_counter_1_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[6]_i_1_n_0 ),
        .Q(length_counter_1_reg[6]),
        .R(SR));
  FDRE \length_counter_1_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[7]_i_1_n_0 ),
        .Q(length_counter_1_reg[7]),
        .R(SR));
  LUT6 #(
    .INIT(64'hAAAAAAAB00000000)) 
    m_axi_wlast_INST_0
       (.I0(first_mi_word),
        .I1(length_counter_1_reg[5]),
        .I2(length_counter_1_reg[4]),
        .I3(length_counter_1_reg[7]),
        .I4(length_counter_1_reg[6]),
        .I5(m_axi_wlast_0),
        .O(m_axi_wlast));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst
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

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3
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

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4
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
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
md0AksSCeI3fOZtF7nrw91OgSzGoACBon4GH9ENTzaI4jlg22H1uTtXayX2Kz+g4ZH2j52rtMH8H
Xc49HVcThMzO1cRXu+SkL59MRQ87klGca4XtjrTtunJoQ+jyOKRwRBeIMHUdntbk2T1kbXHf9KkB
bNYGEMqSrbiDt7IJUx8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
r6CzxR0T3O2wvZRQe25aX3/CWOx/3d/3vJvvS/XsrKr7v852GNQNqCBn+PKsunj0Ncep8DqHtVie
BE6tKIqZW+3txAUjrhSri5liuFWSnzAk+Drsb4RnvIy7BeOdAK6NhVhn8ZyplkJSHVwaGjN8gtPE
LeWEHPHf5qLnzqGKV7B6oIC7POGV6Vamos1p2z1xv2cEw4udvmtZ5EjzeyCMf+omtxEPxhPi6Z2h
ENlGOmuPMkWGMjP6HQCZ1Mi0uiST/zDo29UDIMmOGcsDMe97imU/z2ekKTPXXwjcV+9q+4zHRgJV
6JWWgjU9cztV5OMaEfpBgRBWae/ijWpPZaGuFA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
glFrHilvyO7nq7/OYhnyb9uU9d8UNGJruNnkmJWuTpgvyCDmtx7iVKPBPe1Bj9jUDT/HM9AGxvu0
g7b4TuMdVkegkVPeHhw31IW0HoTL8wPnrLEpzDVK+B7xl953hPKPe0vn+0EQh2UKeL5K8VLxmsSv
gbpEeToeR90yzlSUzDE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D4uBhES8Mkd0GCwY2aQOmEzTqz6hO5B9Wa2oyfVBEODkWyt+AHkIXn4tuBN05FcP2FVmgtVbvZX5
K6iog51IoPw5tv+pM5x8+bQBX/aZpf0c4to3qiX6RZuITpuSUWq/7sqQDqtMqDWOFMMnUBpTX+qI
t61NvyIZcfqRWo4yvIUV2Zh1etqYKDlhqRnMoBZKMeHFpVsp19nU4sf5Km7sSlPQ08vYD8qtJqgJ
ZDYC2KWFTHsnT+5anHvc80FgHt4zBHpPrGprgpltQmVmMZxUD6NRC9EvvXf+pBhgfwPHHePWIKUn
elLld/HEVeFw76SlVV8i4LsS4KWWOM+KmMprEg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EW9gHDqS12MVhy+y/xQVscLd4qOim+cNTepYzlas7WzqDJogZthddOuGjpm3a3fS/cMbF/h0O1Hb
Wjow664GIga0y96lkbkcJ3W8x/IGAsvgyrYT6ScsFhyq7tSd1HjvRG81BhhGM1mmpxfzh0Uqbfso
q+uVKPUmPnbQ/Gdu9YRoxmYVJdmUTpXJ5waYOdib8WNMPLdDfIo/FGrYrx2zYQBtpU5DwwVUTMrB
ZasEyxOj++icI5k5lR3Tx+3gdCFTy4XYQfcj2COm4gnVZ8FN/X1/+0ywsVGAc/OKL+mjMYH3NNH3
zfDO/TpYft+HaVl+CfF/U6IgJJeJs4qI4gB4FA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Myfv5Skg7QCxlNBoFiSTLAeIRYS0J0ArRihYk7dGAHZWAFlxJLgqo51W9P9zTVBurMJjZLtonoDJ
19RfxQj5GqhqN1A20s8xOFfLq6+uDG/V39xQFY32O626Kh4MMlH07hNJL5u1NjJWg1yze0XdFEe9
oLwKQz5lSKGMIh+VPXDuCGhShS+KhHwGEdS0lmA/IHPFNlRG1LsK0zQmUiNkG4kQ5OEVkQgvknNC
B6++ZDIYlT9WbZPs5giRY0zAhUepLPaO+N9F3fIBKVGw4ejbZOt0kXKixF86DDfLmF2+dov+PrTX
1MXJaea3YoQdR2c2MSHAk/TTkzg9ayjvxKaXpg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ks9l+EPHXfDNnWd0exs1j0Q9iSNYaIExwQnpsi8TFJimjPtOkX050wFklsLBM83WyfuD+F2KLNnZ
Jg/aiIiGe9o424jOiEFdnAJuzrD0QL9WmhQ3W9iRJ7uPhha6NfR2WGTCCM4TpN8rTKLQDKxenVfv
6x83rnL5NQxvpp9cQh3zMma73qoEJjhTR9MD9cwA4VeKq2u/R0iTWBplX81vYFd9TW2qW5/Qyzzj
A0+pXzczcJKdggV8h8bYcO+PRC3t2XrufhnjvhjMLG2tPHSMW/soDH/v8KorXyWe5N/q12fo5auN
SXr3olNuB5kpiVS3mJAPV0z4UsFfu2A4hLH7MQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
e3AJKDEM9byJqwpkFZqMIMKMQPOR1VrLFkshor7HR0C+ol7Uv3XTGyvQrINdBEArX0eazF0cHWjC
9B4BhDnysAhT6SENcNHIYHUGQE7uiF7zgL7WhCxClwEnIAVj+PU9FmqlvbreEikHQfbeIDPyCLii
NAS97RDxWki/MfR33zvZX4eEolA/oTyRzr1MagBs7LN1UXyGPvnze8JzHxA3zHVedIIrBrZxkfoj
Loqe6tLYRlC45h1Yr3Wa2gh3LJGtOSji+m7E9Xua/pPh8A/CAD+TNBa5d/X7C3a4AWl2bYTi7HBY
Y8vaIjHiSosru5F2UOEQG9xekCbNRK1Apew1UIvntzCmDMMhlAgB78AUOE2YEWKd9GOl+aTZjMS3
GxAYzrtv/bDRkPOYbcG0SNT9xf+izRM3lX1E2vN3i3uU2Qrh73fjU1lk3PIe/A/H56UrNPDnGT9W
TvlJR47bLDtGyX2+dLvfTaZGRP8aepePOXXLIlvqwCJSMVhCB/hIbz7E

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TfuXOFQtE7YhtTL4354NvKETmBCLSVnb+pbrT8gtzjU7pERE1Hu2ZVzHgVQXwt5RvwG1R/z2je+U
PzszCBhPNqUaXEhuJ0A/q0S/vvOOa6h6tW9MhiB3gnuqEFVWz5pbHZNfgrwh2gT8XyqLI8f1CoJM
xpcB2TbREV/kAAFMxIfH1Dg0KSO2dCeVV1na6N0AiMOQPvXZOB7QpXwNDbYfarWLtF0/l0hi4Fxu
Kgho2ggrUhajP0aKlrCQ9mLsqOyqJELeJldeD+vuUUqhYq4K4RrwtQF+B67lYc4AjznwQ92tUvYJ
ZspFoHJEScNvdFoHFTA2TQ2KToepsqXRiOCL1A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tmfbBpNtCYJ7zsgNxUzw7Dvn+hNn2PPUBeRfXSci/q2/OcQeF/eAAML8YIN1V+AEoAqZTE2/xRQz
+6zwVOLyAOLynMIBQ7EG7xReDJ9kEEiBjnMGO6NWdAsa/VcreVHrLD1PFtA1+WoVe6yOvNGK+Nbh
HjPkXyycyP6RQ4Rx/PtTxw31LOFVezddSgRlaKHTprKTP4LbjPG//onRBg3fAl8zwU1wYYNLzYCX
jwY7xfMkQyhUSpV2Tx3seqy2IYVl8jjxynFxfyxulvrJiqmc6aaKKBdkoOVbJ5eO2sCXFJB1mKEU
WR2Ee2ozisABzk9IcGILewCW7ghdLP82CRZv4A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GfDCxx9db4ripD5mvQy16BVlwPYfeC7ZobZXaX1my6WUDiKwd69J5SreUXKYD9lvZfI7djLgHkYm
5G247T4NX7zoBwc88bUD+tNvGNmzWFfSVVZqu8hjgd31lZXjy9uYdXA/gsE+T+JqEfRYdV8YoGgm
sREyiJjWRPDbx6kc8um8vlAK/Rjwz0EGVkGUoi/+UvxcnjG1PqCl7GSMOQ3gFMEOaxIflShnF2/c
//ioADxl3WjUGyTstMK54XlP8G1Hk95sSe/7Y+SbaIyoG8t6gGDimDJNuGs4JjDUi1V7Gxfzxk9+
O2J++9clyLkMZ3rRyxSvR+Xyrmn3YxjVC68GXw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 220640)
`pragma protect data_block
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
op9TBi4eDP8heCJzC2ZnLACUlpWXYmKsnz0vaRkdABGLDJG63MJ2SaiFKPZOalNVTel0H4tIB5NY
KwQKr1vqjFvcFMnfAPIgARCEdQKssmkVjT3Dtg5t0H/FdXffFau6BUUWqIpFoXvKLwr8LXgDWjNE
WneNSaDnsjJ0wlThDqfJJ2mgPdxf7BCM1xTP7mDPT/vPURfxKWpWCb468UznVjkLp61t7L2fDDOs
6gfZAku154xI43rgwOEMJFyWZmcf8O5SgPwtjXAZ9mXIqj9Yj0FfNfu0qmbBhp9I4du6zRZ4mMl7
d0+Jco2u1qh3Fzk+mTzPh/sbOswcjYfXrCCcCPeqFn7rxpot5nOPw/MXVnoiQ40rdE9bA/frD5OJ
S9ygtMVGSmOUXth3cIC8+L6C0w8zt9ysOKyMF4ijZU2/Nx5ppMmMZKPLrJ8FWPPImYFPTXW4TfNP
kIhNmkAPJHHATr1GnJROdIbPOOHiCeSWPTbGkf545wW4FTP0SHFI15+zfB80EgU4NmyViRCHOsFv
kbHqiMLK956gJAJaSjcGWoP1DWVMaF4lYETJCuCOSmPopf11/kwo/UEpmd/iosfcsoPYwIFhc1TH
Z9QLRZPTrl/BVVd8lHZUdNZu5RGcBo6XP9s6vCrubmaZ4VtiqOpdf3NoEeOX/4xOf4jFRD2P8n42
n3DfSszj004NgiWSpKl76/EUa075fKiryUWdbjP6/Ztr7dmr68fTnxSeLcMBLo1ykuOHYL3H4ULl
Y/rX/Rvna0RiQDAoiiNoMh7ocA7GlMfYOqEhAs39MKk1DSqZHrw7mpPWnlgm7kQ/f2z1+yp/1zqS
a3+OlTHoEci0bQ2N42I1eivxYGffIWLj9o7ZnqZ2pdHh/svYmL9VyrR/09257NqpsTwI0t5ySxFZ
CvWAP81sYXrH1DLriD6/y0NoII2ovRhhHdkrAhI6YyTKNKHet0qfSnfcxbNCge+SNaFHh3QkQyiO
IKoEQK207SnYC5POEgsuL+Odz8zxmhDcGVMc8iliMOPArZKY9AIMpS+2ZTWJACAEqyRx7CSGzmA4
xVCPIIpvqiqabfxboYBsbDLnrcOHMbwT9RuZ1KfxCgiyzkxqqeO8XAbenTrrrQ5E8MsBEGf7Rae8
KHI4eRq/SwJvs8F/b/94xudvK0w+v9Qhk2ZwLh4XaFOVSaTWpPoQvhyjDdCoTv4/up42ZmN5UGfT
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
