// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Sun Apr 19 23:15:26 2026
// Host        : DESKTOP-G7LOJLI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Akshay/OneDrive/Desktop/FGPA-Based-Hardware-Accelerator/CNN/fpga/vivado/proj_mnist_cnn/mnist_cnn.gen/sources_1/bd/cnn_system/ip/cnn_system_axi_ic_hp1_imp_auto_pc_1/cnn_system_axi_ic_hp1_imp_auto_pc_1_sim_netlist.v
// Design      : cnn_system_axi_ic_hp1_imp_auto_pc_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cnn_system_axi_ic_hp1_imp_auto_pc_1,axi_protocol_converter_v2_1_36_axi_protocol_converter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axi_protocol_converter_v2_1_36_axi_protocol_converter,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module cnn_system_axi_ic_hp1_imp_auto_pc_1
   (aclk,
    aresetn,
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
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
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
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, ASSOCIATED_BUSIF S_AXI:M_AXI, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN cnn_system_ps7_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 0, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 16, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN cnn_system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [31:0]s_axi_awaddr;
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *) input s_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI, DATA_WIDTH 32, PROTOCOL AXI3, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 0, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 16, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN cnn_system_ps7_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [31:0]m_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *) output [3:0]m_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE" *) output [2:0]m_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWBURST" *) output [1:0]m_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK" *) output [1:0]m_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE" *) output [3:0]m_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *) output [2:0]m_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWQOS" *) output [3:0]m_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *) output m_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *) input m_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *) output [31:0]m_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *) output [3:0]m_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *) output m_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *) output m_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *) input m_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *) input [1:0]m_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *) input m_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *) output m_axi_bready;

  wire \<const0> ;
  wire aclk;
  wire aresetn;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]\^m_axi_awlock ;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [31:0]m_axi_wdata;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire [3:0]m_axi_wstrb;
  wire m_axi_wvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
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
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire NLW_inst_m_axi_arvalid_UNCONNECTED;
  wire NLW_inst_m_axi_rready_UNCONNECTED;
  wire NLW_inst_s_axi_arready_UNCONNECTED;
  wire NLW_inst_s_axi_rlast_UNCONNECTED;
  wire NLW_inst_s_axi_rvalid_UNCONNECTED;
  wire [31:0]NLW_inst_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_arid_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arlen_UNCONNECTED;
  wire [1:0]NLW_inst_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_inst_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_aruser_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awid_UNCONNECTED;
  wire [1:1]NLW_inst_m_axi_awlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awregion_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awuser_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wid_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_bid_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_buser_UNCONNECTED;
  wire [31:0]NLW_inst_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_inst_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_ruser_UNCONNECTED;

  assign m_axi_awlock[1] = \<const0> ;
  assign m_axi_awlock[0] = \^m_axi_awlock [0];
  GND GND
       (.G(\<const0> ));
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "32" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_SUPPORTS_READ = "0" *) 
  (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
  (* C_AXI_SUPPORTS_WRITE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_IGNORE_ID = "1" *) 
  (* C_M_AXI_PROTOCOL = "1" *) 
  (* C_S_AXI_PROTOCOL = "0" *) 
  (* C_TRANSLATION_MODE = "2" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
  (* P_AXI3 = "1" *) 
  (* P_AXI4 = "0" *) 
  (* P_AXILITE = "2" *) 
  (* P_AXILITE_SIZE = "3'b010" *) 
  (* P_CONVERSION = "2" *) 
  (* P_DECERR = "2'b11" *) 
  (* P_INCR = "2'b01" *) 
  (* P_PROTECTION = "1" *) 
  (* P_SLVERR = "2'b10" *) 
  cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_protocol_converter_v2_1_36_axi_protocol_converter inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .m_axi_araddr(NLW_inst_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_inst_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_inst_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_inst_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_inst_m_axi_arlen_UNCONNECTED[3:0]),
        .m_axi_arlock(NLW_inst_m_axi_arlock_UNCONNECTED[1:0]),
        .m_axi_arprot(NLW_inst_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_inst_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_inst_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_inst_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_inst_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_inst_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awid(NLW_inst_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awlock({NLW_inst_m_axi_awlock_UNCONNECTED[1],\^m_axi_awlock }),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awregion(NLW_inst_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awuser(NLW_inst_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bid(1'b0),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b1),
        .m_axi_rready(NLW_inst_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wid(NLW_inst_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wuser(NLW_inst_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(m_axi_wvalid),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b1}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_inst_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awid(1'b0),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awready(s_axi_awready),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(NLW_inst_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_buser(NLW_inst_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(NLW_inst_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_inst_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_inst_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_inst_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_inst_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_inst_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_35_axic_fifo" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_data_fifo_v2_1_35_axic_fifo
   (\goreg_dm.dout_i_reg[4] ,
    full,
    empty_fwft_i_reg,
    din,
    wr_en,
    cmd_b_push_block_reg,
    m_axi_awvalid,
    E,
    \areset_d_reg[0] ,
    S_AXI_AREADY_I_reg,
    aclk,
    SR,
    Q,
    \goreg_dm.dout_i_reg[4]_0 ,
    command_ongoing,
    cmd_push_block,
    \pushed_commands_reg[0] ,
    cmd_b_push_block,
    cmd_b_push_block_reg_0,
    m_axi_awready,
    need_to_split_q,
    access_is_incr_q,
    S_AXI_AREADY_I_i_3,
    S_AXI_AREADY_I_reg_0,
    command_ongoing_reg,
    s_axi_awvalid,
    command_ongoing_reg_0);
  output [4:0]\goreg_dm.dout_i_reg[4] ;
  output full;
  output empty_fwft_i_reg;
  output [0:0]din;
  output wr_en;
  output cmd_b_push_block_reg;
  output m_axi_awvalid;
  output [0:0]E;
  output \areset_d_reg[0] ;
  output S_AXI_AREADY_I_reg;
  input aclk;
  input [0:0]SR;
  input [3:0]Q;
  input \goreg_dm.dout_i_reg[4]_0 ;
  input command_ongoing;
  input cmd_push_block;
  input \pushed_commands_reg[0] ;
  input cmd_b_push_block;
  input [0:0]cmd_b_push_block_reg_0;
  input m_axi_awready;
  input need_to_split_q;
  input access_is_incr_q;
  input [3:0]S_AXI_AREADY_I_i_3;
  input [1:0]S_AXI_AREADY_I_reg_0;
  input command_ongoing_reg;
  input s_axi_awvalid;
  input command_ongoing_reg_0;

  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;
  wire [3:0]S_AXI_AREADY_I_i_3;
  wire S_AXI_AREADY_I_reg;
  wire [1:0]S_AXI_AREADY_I_reg_0;
  wire access_is_incr_q;
  wire aclk;
  wire \areset_d_reg[0] ;
  wire cmd_b_push_block;
  wire cmd_b_push_block_reg;
  wire [0:0]cmd_b_push_block_reg_0;
  wire cmd_push_block;
  wire command_ongoing;
  wire command_ongoing_reg;
  wire command_ongoing_reg_0;
  wire [0:0]din;
  wire empty_fwft_i_reg;
  wire full;
  wire [4:0]\goreg_dm.dout_i_reg[4] ;
  wire \goreg_dm.dout_i_reg[4]_0 ;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire need_to_split_q;
  wire \pushed_commands_reg[0] ;
  wire s_axi_awvalid;
  wire wr_en;

  cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_data_fifo_v2_1_35_fifo_gen inst
       (.E(E),
        .Q(Q),
        .SR(SR),
        .S_AXI_AREADY_I_i_3_0(S_AXI_AREADY_I_i_3),
        .S_AXI_AREADY_I_reg(S_AXI_AREADY_I_reg),
        .S_AXI_AREADY_I_reg_0(S_AXI_AREADY_I_reg_0),
        .access_is_incr_q(access_is_incr_q),
        .aclk(aclk),
        .\areset_d_reg[0] (\areset_d_reg[0] ),
        .cmd_b_push_block(cmd_b_push_block),
        .cmd_b_push_block_reg(cmd_b_push_block_reg),
        .cmd_b_push_block_reg_0(cmd_b_push_block_reg_0),
        .cmd_push_block(cmd_push_block),
        .command_ongoing(command_ongoing),
        .command_ongoing_reg(command_ongoing_reg),
        .command_ongoing_reg_0(command_ongoing_reg_0),
        .din(din),
        .empty_fwft_i_reg(empty_fwft_i_reg),
        .full(full),
        .\goreg_dm.dout_i_reg[4] (\goreg_dm.dout_i_reg[4] ),
        .\goreg_dm.dout_i_reg[4]_0 (\goreg_dm.dout_i_reg[4]_0 ),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .need_to_split_q(need_to_split_q),
        .\pushed_commands_reg[0] (\pushed_commands_reg[0] ),
        .s_axi_awvalid(s_axi_awvalid),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_35_axic_fifo" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_data_fifo_v2_1_35_axic_fifo__xdcDup__1
   (dout,
    full,
    empty,
    SR,
    m_axi_awlen,
    aresetn_0,
    m_axi_wready_0,
    m_axi_wvalid,
    aclk,
    wr_en,
    rd_en,
    aresetn,
    cmd_push_block_reg,
    cmd_push_block,
    command_ongoing,
    m_axi_awready,
    m_axi_wready,
    s_axi_wvalid,
    Q,
    \m_axi_awlen[3] ,
    need_to_split_q);
  output [3:0]dout;
  output full;
  output empty;
  output [0:0]SR;
  output [3:0]m_axi_awlen;
  output aresetn_0;
  output m_axi_wready_0;
  output m_axi_wvalid;
  input aclk;
  input wr_en;
  input rd_en;
  input aresetn;
  input cmd_push_block_reg;
  input cmd_push_block;
  input command_ongoing;
  input m_axi_awready;
  input m_axi_wready;
  input s_axi_wvalid;
  input [3:0]Q;
  input [3:0]\m_axi_awlen[3] ;
  input need_to_split_q;

  wire [3:0]Q;
  wire [0:0]SR;
  wire aclk;
  wire aresetn;
  wire aresetn_0;
  wire cmd_push_block;
  wire cmd_push_block_reg;
  wire command_ongoing;
  wire [3:0]dout;
  wire empty;
  wire full;
  wire [3:0]m_axi_awlen;
  wire [3:0]\m_axi_awlen[3] ;
  wire m_axi_awready;
  wire m_axi_wready;
  wire m_axi_wready_0;
  wire m_axi_wvalid;
  wire need_to_split_q;
  wire rd_en;
  wire s_axi_wvalid;
  wire wr_en;

  cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_data_fifo_v2_1_35_fifo_gen__xdcDup__1 inst
       (.Q(Q),
        .SR(SR),
        .aclk(aclk),
        .aresetn(aresetn),
        .aresetn_0(aresetn_0),
        .cmd_push_block(cmd_push_block),
        .cmd_push_block_reg(cmd_push_block_reg),
        .command_ongoing(command_ongoing),
        .dout(dout),
        .empty(empty),
        .full(full),
        .m_axi_awlen(m_axi_awlen),
        .\m_axi_awlen[3] (\m_axi_awlen[3] ),
        .m_axi_awready(m_axi_awready),
        .m_axi_wready(m_axi_wready),
        .m_axi_wready_0(m_axi_wready_0),
        .m_axi_wvalid(m_axi_wvalid),
        .need_to_split_q(need_to_split_q),
        .rd_en(rd_en),
        .s_axi_wvalid(s_axi_wvalid),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_35_fifo_gen" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_data_fifo_v2_1_35_fifo_gen
   (\goreg_dm.dout_i_reg[4] ,
    full,
    empty_fwft_i_reg,
    din,
    wr_en,
    cmd_b_push_block_reg,
    m_axi_awvalid,
    E,
    \areset_d_reg[0] ,
    S_AXI_AREADY_I_reg,
    aclk,
    SR,
    Q,
    \goreg_dm.dout_i_reg[4]_0 ,
    command_ongoing,
    cmd_push_block,
    \pushed_commands_reg[0] ,
    cmd_b_push_block,
    cmd_b_push_block_reg_0,
    m_axi_awready,
    need_to_split_q,
    access_is_incr_q,
    S_AXI_AREADY_I_i_3_0,
    S_AXI_AREADY_I_reg_0,
    command_ongoing_reg,
    s_axi_awvalid,
    command_ongoing_reg_0);
  output [4:0]\goreg_dm.dout_i_reg[4] ;
  output full;
  output empty_fwft_i_reg;
  output [0:0]din;
  output wr_en;
  output cmd_b_push_block_reg;
  output m_axi_awvalid;
  output [0:0]E;
  output \areset_d_reg[0] ;
  output S_AXI_AREADY_I_reg;
  input aclk;
  input [0:0]SR;
  input [3:0]Q;
  input \goreg_dm.dout_i_reg[4]_0 ;
  input command_ongoing;
  input cmd_push_block;
  input \pushed_commands_reg[0] ;
  input cmd_b_push_block;
  input [0:0]cmd_b_push_block_reg_0;
  input m_axi_awready;
  input need_to_split_q;
  input access_is_incr_q;
  input [3:0]S_AXI_AREADY_I_i_3_0;
  input [1:0]S_AXI_AREADY_I_reg_0;
  input command_ongoing_reg;
  input s_axi_awvalid;
  input command_ongoing_reg_0;

  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;
  wire [3:0]S_AXI_AREADY_I_i_3_0;
  wire S_AXI_AREADY_I_i_3_n_0;
  wire S_AXI_AREADY_I_i_4_n_0;
  wire S_AXI_AREADY_I_reg;
  wire [1:0]S_AXI_AREADY_I_reg_0;
  wire access_is_incr_q;
  wire aclk;
  wire \areset_d_reg[0] ;
  wire cmd_b_push;
  wire cmd_b_push_block;
  wire cmd_b_push_block_reg;
  wire [0:0]cmd_b_push_block_reg_0;
  wire cmd_push_block;
  wire command_ongoing;
  wire command_ongoing_reg;
  wire command_ongoing_reg_0;
  wire [0:0]din;
  wire empty_fwft_i_reg;
  wire full;
  wire [4:0]\goreg_dm.dout_i_reg[4] ;
  wire \goreg_dm.dout_i_reg[4]_0 ;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire need_to_split_q;
  wire \pushed_commands_reg[0] ;
  wire s_axi_awvalid;
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
    .INIT(64'h444444F4FFFF44F4)) 
    S_AXI_AREADY_I_i_2
       (.I0(S_AXI_AREADY_I_reg_0[0]),
        .I1(S_AXI_AREADY_I_reg_0[1]),
        .I2(E),
        .I3(S_AXI_AREADY_I_i_3_n_0),
        .I4(command_ongoing_reg),
        .I5(s_axi_awvalid),
        .O(\areset_d_reg[0] ));
  LUT6 #(
    .INIT(64'h8AA8AAAAAAAA8AA8)) 
    S_AXI_AREADY_I_i_3
       (.I0(access_is_incr_q),
        .I1(S_AXI_AREADY_I_i_4_n_0),
        .I2(Q[0]),
        .I3(S_AXI_AREADY_I_i_3_0[0]),
        .I4(Q[2]),
        .I5(S_AXI_AREADY_I_i_3_0[2]),
        .O(S_AXI_AREADY_I_i_3_n_0));
  LUT4 #(
    .INIT(16'h6FF6)) 
    S_AXI_AREADY_I_i_4
       (.I0(Q[3]),
        .I1(S_AXI_AREADY_I_i_3_0[3]),
        .I2(Q[1]),
        .I3(S_AXI_AREADY_I_i_3_0[1]),
        .O(S_AXI_AREADY_I_i_4_n_0));
  LUT6 #(
    .INIT(64'h00000000EAEAEAEE)) 
    cmd_b_push_block_i_1
       (.I0(cmd_b_push_block),
        .I1(command_ongoing),
        .I2(cmd_push_block),
        .I3(full),
        .I4(\pushed_commands_reg[0] ),
        .I5(cmd_b_push_block_reg_0),
        .O(cmd_b_push_block_reg));
  LUT6 #(
    .INIT(64'hFFFFFDDD0000F000)) 
    command_ongoing_i_1
       (.I0(E),
        .I1(S_AXI_AREADY_I_i_3_n_0),
        .I2(command_ongoing_reg),
        .I3(s_axi_awvalid),
        .I4(command_ongoing_reg_0),
        .I5(command_ongoing),
        .O(S_AXI_AREADY_I_reg));
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
  cnn_system_axi_ic_hp1_imp_auto_pc_1_fifo_generator_v13_2_13 fifo_gen_inst
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
        .empty(empty_fwft_i_reg),
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
        .rd_en(\goreg_dm.dout_i_reg[4]_0 ),
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
        .wr_en(cmd_b_push),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED));
  LUT2 #(
    .INIT(4'h8)) 
    fifo_gen_inst_i_1
       (.I0(need_to_split_q),
        .I1(S_AXI_AREADY_I_i_3_n_0),
        .O(din));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    fifo_gen_inst_i_1__0
       (.I0(command_ongoing),
        .I1(cmd_push_block),
        .I2(full),
        .I3(\pushed_commands_reg[0] ),
        .O(wr_en));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h40404044)) 
    fifo_gen_inst_i_2
       (.I0(cmd_b_push_block),
        .I1(command_ongoing),
        .I2(cmd_push_block),
        .I3(full),
        .I4(\pushed_commands_reg[0] ),
        .O(cmd_b_push));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h888A)) 
    m_axi_awvalid_INST_0
       (.I0(command_ongoing),
        .I1(cmd_push_block),
        .I2(full),
        .I3(\pushed_commands_reg[0] ),
        .O(m_axi_awvalid));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h80808088)) 
    split_ongoing_i_1
       (.I0(m_axi_awready),
        .I1(command_ongoing),
        .I2(cmd_push_block),
        .I3(full),
        .I4(\pushed_commands_reg[0] ),
        .O(E));
endmodule

(* ORIG_REF_NAME = "axi_data_fifo_v2_1_35_fifo_gen" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_data_fifo_v2_1_35_fifo_gen__xdcDup__1
   (dout,
    full,
    empty,
    SR,
    m_axi_awlen,
    aresetn_0,
    m_axi_wready_0,
    m_axi_wvalid,
    aclk,
    wr_en,
    rd_en,
    aresetn,
    cmd_push_block_reg,
    cmd_push_block,
    command_ongoing,
    m_axi_awready,
    m_axi_wready,
    s_axi_wvalid,
    Q,
    \m_axi_awlen[3] ,
    need_to_split_q);
  output [3:0]dout;
  output full;
  output empty;
  output [0:0]SR;
  output [3:0]m_axi_awlen;
  output aresetn_0;
  output m_axi_wready_0;
  output m_axi_wvalid;
  input aclk;
  input wr_en;
  input rd_en;
  input aresetn;
  input cmd_push_block_reg;
  input cmd_push_block;
  input command_ongoing;
  input m_axi_awready;
  input m_axi_wready;
  input s_axi_wvalid;
  input [3:0]Q;
  input [3:0]\m_axi_awlen[3] ;
  input need_to_split_q;

  wire [3:0]Q;
  wire [0:0]SR;
  wire aclk;
  wire aresetn;
  wire aresetn_0;
  wire cmd_push_block;
  wire cmd_push_block_reg;
  wire command_ongoing;
  wire [3:0]dout;
  wire empty;
  wire full;
  wire [3:0]m_axi_awlen;
  wire [3:0]\m_axi_awlen[3] ;
  wire m_axi_awready;
  wire m_axi_wready;
  wire m_axi_wready_0;
  wire m_axi_wvalid;
  wire need_to_split_q;
  wire rd_en;
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
  wire [4:4]NLW_fifo_gen_inst_dout_UNCONNECTED;
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

  LUT1 #(
    .INIT(2'h1)) 
    S_AXI_AREADY_I_i_1
       (.I0(aresetn),
        .O(SR));
  LUT6 #(
    .INIT(64'h0000AA00AA02AA00)) 
    cmd_push_block_i_1
       (.I0(aresetn),
        .I1(full),
        .I2(cmd_push_block_reg),
        .I3(cmd_push_block),
        .I4(command_ongoing),
        .I5(m_axi_awready),
        .O(aresetn_0));
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
  cnn_system_axi_ic_hp1_imp_auto_pc_1_fifo_generator_v13_2_13__xdcDup__1 fifo_gen_inst
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
        .din({1'b0,m_axi_awlen}),
        .dout({NLW_fifo_gen_inst_dout_UNCONNECTED[4],dout}),
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
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \m_axi_awlen[0]_INST_0 
       (.I0(Q[0]),
        .I1(\m_axi_awlen[3] [3]),
        .I2(\m_axi_awlen[3] [2]),
        .I3(\m_axi_awlen[3] [1]),
        .I4(\m_axi_awlen[3] [0]),
        .I5(need_to_split_q),
        .O(m_axi_awlen[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \m_axi_awlen[1]_INST_0 
       (.I0(Q[1]),
        .I1(\m_axi_awlen[3] [3]),
        .I2(\m_axi_awlen[3] [2]),
        .I3(\m_axi_awlen[3] [1]),
        .I4(\m_axi_awlen[3] [0]),
        .I5(need_to_split_q),
        .O(m_axi_awlen[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \m_axi_awlen[2]_INST_0 
       (.I0(Q[2]),
        .I1(\m_axi_awlen[3] [3]),
        .I2(\m_axi_awlen[3] [2]),
        .I3(\m_axi_awlen[3] [1]),
        .I4(\m_axi_awlen[3] [0]),
        .I5(need_to_split_q),
        .O(m_axi_awlen[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \m_axi_awlen[3]_INST_0 
       (.I0(Q[3]),
        .I1(\m_axi_awlen[3] [3]),
        .I2(\m_axi_awlen[3] [2]),
        .I3(\m_axi_awlen[3] [1]),
        .I4(\m_axi_awlen[3] [0]),
        .I5(need_to_split_q),
        .O(m_axi_awlen[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    m_axi_wvalid_INST_0
       (.I0(s_axi_wvalid),
        .I1(empty),
        .O(m_axi_wvalid));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h08)) 
    s_axi_wready_INST_0
       (.I0(m_axi_wready),
        .I1(s_axi_wvalid),
        .I2(empty),
        .O(m_axi_wready_0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_36_a_axi3_conv" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_protocol_converter_v2_1_36_a_axi3_conv
   (dout,
    empty,
    aresetn_0,
    m_axi_awlen,
    \goreg_dm.dout_i_reg[4] ,
    empty_fwft_i_reg,
    E,
    m_axi_awaddr,
    m_axi_awvalid,
    m_axi_wready_0,
    m_axi_wvalid,
    m_axi_awlock,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    aclk,
    rd_en,
    \goreg_dm.dout_i_reg[4]_0 ,
    s_axi_awlock,
    s_axi_awsize,
    s_axi_awlen,
    aresetn,
    m_axi_awready,
    m_axi_wready,
    s_axi_wvalid,
    s_axi_awvalid,
    s_axi_awaddr,
    s_axi_awburst,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos);
  output [3:0]dout;
  output empty;
  output aresetn_0;
  output [3:0]m_axi_awlen;
  output [4:0]\goreg_dm.dout_i_reg[4] ;
  output empty_fwft_i_reg;
  output [0:0]E;
  output [31:0]m_axi_awaddr;
  output m_axi_awvalid;
  output m_axi_wready_0;
  output m_axi_wvalid;
  output [0:0]m_axi_awlock;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  input aclk;
  input rd_en;
  input \goreg_dm.dout_i_reg[4]_0 ;
  input [0:0]s_axi_awlock;
  input [2:0]s_axi_awsize;
  input [7:0]s_axi_awlen;
  input aresetn;
  input m_axi_awready;
  input m_axi_wready;
  input s_axi_wvalid;
  input s_axi_awvalid;
  input [31:0]s_axi_awaddr;
  input [1:0]s_axi_awburst;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;

  wire [0:0]E;
  wire [31:0]S_AXI_AADDR_Q;
  wire [3:0]S_AXI_ALEN_Q;
  wire \S_AXI_ALOCK_Q_reg_n_0_[0] ;
  wire \USE_BURSTS.cmd_queue_n_11 ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_12 ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_13 ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_8 ;
  wire \USE_B_CHANNEL.cmd_b_queue_n_9 ;
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
  wire aresetn_0;
  wire cmd_b_push_block;
  wire cmd_b_split_i;
  wire cmd_push_block;
  wire command_ongoing;
  wire command_ongoing_i_2_n_0;
  wire [3:0]dout;
  wire empty;
  wire empty_fwft_i_reg;
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
  wire [4:0]\goreg_dm.dout_i_reg[4] ;
  wire \goreg_dm.dout_i_reg[4]_0 ;
  wire incr_need_to_split__0;
  wire \inst/full ;
  wire \inst/full_0 ;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]m_axi_awlock;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire m_axi_wready;
  wire m_axi_wready_0;
  wire m_axi_wvalid;
  wire need_to_split_q;
  wire [31:0]next_mi_addr;
  wire \next_mi_addr[11]_i_2_n_0 ;
  wire \next_mi_addr[11]_i_3_n_0 ;
  wire \next_mi_addr[11]_i_4_n_0 ;
  wire \next_mi_addr[11]_i_5_n_0 ;
  wire \next_mi_addr[11]_i_6_n_0 ;
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
  wire \next_mi_addr[3]_i_6_n_0 ;
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
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_wvalid;
  wire [6:0]size_mask;
  wire [31:0]size_mask_q;
  wire split_ongoing;
  wire [3:3]\NLW_next_mi_addr_reg[31]_i_1_CO_UNCONNECTED ;

  FDRE \S_AXI_AADDR_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[0]),
        .Q(S_AXI_AADDR_Q[0]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[10]),
        .Q(S_AXI_AADDR_Q[10]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[11]),
        .Q(S_AXI_AADDR_Q[11]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[12] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[12]),
        .Q(S_AXI_AADDR_Q[12]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[13] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[13]),
        .Q(S_AXI_AADDR_Q[13]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[14] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[14]),
        .Q(S_AXI_AADDR_Q[14]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[15] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[15]),
        .Q(S_AXI_AADDR_Q[15]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[16] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[16]),
        .Q(S_AXI_AADDR_Q[16]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[17] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[17]),
        .Q(S_AXI_AADDR_Q[17]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[18] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[18]),
        .Q(S_AXI_AADDR_Q[18]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[19] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[19]),
        .Q(S_AXI_AADDR_Q[19]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[1]),
        .Q(S_AXI_AADDR_Q[1]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[20] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[20]),
        .Q(S_AXI_AADDR_Q[20]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[21] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[21]),
        .Q(S_AXI_AADDR_Q[21]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[22] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[22]),
        .Q(S_AXI_AADDR_Q[22]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[23] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[23]),
        .Q(S_AXI_AADDR_Q[23]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[24] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[24]),
        .Q(S_AXI_AADDR_Q[24]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[25] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[25]),
        .Q(S_AXI_AADDR_Q[25]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[26] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[26]),
        .Q(S_AXI_AADDR_Q[26]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[27] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[27]),
        .Q(S_AXI_AADDR_Q[27]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[28] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[28]),
        .Q(S_AXI_AADDR_Q[28]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[29] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[29]),
        .Q(S_AXI_AADDR_Q[29]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[2]),
        .Q(S_AXI_AADDR_Q[2]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[30] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[30]),
        .Q(S_AXI_AADDR_Q[30]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[31]),
        .Q(S_AXI_AADDR_Q[31]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[3]),
        .Q(S_AXI_AADDR_Q[3]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[4]),
        .Q(S_AXI_AADDR_Q[4]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[5]),
        .Q(S_AXI_AADDR_Q[5]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[6]),
        .Q(S_AXI_AADDR_Q[6]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[7]),
        .Q(S_AXI_AADDR_Q[7]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[8]),
        .Q(S_AXI_AADDR_Q[8]),
        .R(aresetn_0));
  FDRE \S_AXI_AADDR_Q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[9]),
        .Q(S_AXI_AADDR_Q[9]),
        .R(aresetn_0));
  FDRE \S_AXI_ABURST_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awburst[0]),
        .Q(m_axi_awburst[0]),
        .R(aresetn_0));
  FDRE \S_AXI_ABURST_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awburst[1]),
        .Q(m_axi_awburst[1]),
        .R(aresetn_0));
  FDRE \S_AXI_ACACHE_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[0]),
        .Q(m_axi_awcache[0]),
        .R(aresetn_0));
  FDRE \S_AXI_ACACHE_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[1]),
        .Q(m_axi_awcache[1]),
        .R(aresetn_0));
  FDRE \S_AXI_ACACHE_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[2]),
        .Q(m_axi_awcache[2]),
        .R(aresetn_0));
  FDRE \S_AXI_ACACHE_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[3]),
        .Q(m_axi_awcache[3]),
        .R(aresetn_0));
  FDRE \S_AXI_ALEN_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[0]),
        .Q(S_AXI_ALEN_Q[0]),
        .R(aresetn_0));
  FDRE \S_AXI_ALEN_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[1]),
        .Q(S_AXI_ALEN_Q[1]),
        .R(aresetn_0));
  FDRE \S_AXI_ALEN_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[2]),
        .Q(S_AXI_ALEN_Q[2]),
        .R(aresetn_0));
  FDRE \S_AXI_ALEN_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[3]),
        .Q(S_AXI_ALEN_Q[3]),
        .R(aresetn_0));
  FDRE \S_AXI_ALOCK_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlock),
        .Q(\S_AXI_ALOCK_Q_reg_n_0_[0] ),
        .R(aresetn_0));
  FDRE \S_AXI_APROT_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awprot[0]),
        .Q(m_axi_awprot[0]),
        .R(aresetn_0));
  FDRE \S_AXI_APROT_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awprot[1]),
        .Q(m_axi_awprot[1]),
        .R(aresetn_0));
  FDRE \S_AXI_APROT_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awprot[2]),
        .Q(m_axi_awprot[2]),
        .R(aresetn_0));
  FDRE \S_AXI_AQOS_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[0]),
        .Q(m_axi_awqos[0]),
        .R(aresetn_0));
  FDRE \S_AXI_AQOS_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[1]),
        .Q(m_axi_awqos[1]),
        .R(aresetn_0));
  FDRE \S_AXI_AQOS_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[2]),
        .Q(m_axi_awqos[2]),
        .R(aresetn_0));
  FDRE \S_AXI_AQOS_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[3]),
        .Q(m_axi_awqos[3]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    S_AXI_AREADY_I_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_B_CHANNEL.cmd_b_queue_n_12 ),
        .Q(E),
        .R(aresetn_0));
  FDRE \S_AXI_ASIZE_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awsize[0]),
        .Q(m_axi_awsize[0]),
        .R(aresetn_0));
  FDRE \S_AXI_ASIZE_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awsize[1]),
        .Q(m_axi_awsize[1]),
        .R(aresetn_0));
  FDRE \S_AXI_ASIZE_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awsize[2]),
        .Q(m_axi_awsize[2]),
        .R(aresetn_0));
  cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_data_fifo_v2_1_35_axic_fifo__xdcDup__1 \USE_BURSTS.cmd_queue 
       (.Q(S_AXI_ALEN_Q),
        .SR(aresetn_0),
        .aclk(aclk),
        .aresetn(aresetn),
        .aresetn_0(\USE_BURSTS.cmd_queue_n_11 ),
        .cmd_push_block(cmd_push_block),
        .cmd_push_block_reg(\inst/full_0 ),
        .command_ongoing(command_ongoing),
        .dout(dout),
        .empty(empty),
        .full(\inst/full ),
        .m_axi_awlen(m_axi_awlen),
        .\m_axi_awlen[3] (pushed_commands_reg),
        .m_axi_awready(m_axi_awready),
        .m_axi_wready(m_axi_wready),
        .m_axi_wready_0(m_axi_wready_0),
        .m_axi_wvalid(m_axi_wvalid),
        .need_to_split_q(need_to_split_q),
        .rd_en(rd_en),
        .s_axi_wvalid(s_axi_wvalid),
        .wr_en(\USE_B_CHANNEL.cmd_b_queue_n_8 ));
  cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_data_fifo_v2_1_35_axic_fifo \USE_B_CHANNEL.cmd_b_queue 
       (.E(pushed_new_cmd),
        .Q(num_transactions_q),
        .SR(aresetn_0),
        .S_AXI_AREADY_I_i_3(pushed_commands_reg),
        .S_AXI_AREADY_I_reg(\USE_B_CHANNEL.cmd_b_queue_n_13 ),
        .S_AXI_AREADY_I_reg_0(areset_d),
        .access_is_incr_q(access_is_incr_q),
        .aclk(aclk),
        .\areset_d_reg[0] (\USE_B_CHANNEL.cmd_b_queue_n_12 ),
        .cmd_b_push_block(cmd_b_push_block),
        .cmd_b_push_block_reg(\USE_B_CHANNEL.cmd_b_queue_n_9 ),
        .cmd_b_push_block_reg_0(\pushed_commands[3]_i_1_n_0 ),
        .cmd_push_block(cmd_push_block),
        .command_ongoing(command_ongoing),
        .command_ongoing_reg(E),
        .command_ongoing_reg_0(command_ongoing_i_2_n_0),
        .din(cmd_b_split_i),
        .empty_fwft_i_reg(empty_fwft_i_reg),
        .full(\inst/full_0 ),
        .\goreg_dm.dout_i_reg[4] (\goreg_dm.dout_i_reg[4] ),
        .\goreg_dm.dout_i_reg[4]_0 (\goreg_dm.dout_i_reg[4]_0 ),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .need_to_split_q(need_to_split_q),
        .\pushed_commands_reg[0] (\inst/full ),
        .s_axi_awvalid(s_axi_awvalid),
        .wr_en(\USE_B_CHANNEL.cmd_b_queue_n_8 ));
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
        .R(aresetn_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \addr_step_q[10]_i_1 
       (.I0(s_axi_awsize[0]),
        .I1(s_axi_awsize[2]),
        .I2(s_axi_awsize[1]),
        .O(addr_step[10]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \addr_step_q[11]_i_1 
       (.I0(s_axi_awsize[2]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awsize[1]),
        .O(addr_step[11]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addr_step_q[5]_i_1 
       (.I0(s_axi_awsize[0]),
        .I1(s_axi_awsize[2]),
        .I2(s_axi_awsize[1]),
        .O(addr_step[5]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addr_step_q[6]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awsize[2]),
        .O(\addr_step_q[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \addr_step_q[7]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awsize[2]),
        .O(\addr_step_q[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addr_step_q[8]_i_1 
       (.I0(s_axi_awsize[2]),
        .I1(s_axi_awsize[1]),
        .I2(s_axi_awsize[0]),
        .O(\addr_step_q[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
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
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(addr_step[11]),
        .Q(addr_step_q[11]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(addr_step[5]),
        .Q(addr_step_q[5]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[6]_i_1_n_0 ),
        .Q(addr_step_q[6]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[7]_i_1_n_0 ),
        .Q(addr_step_q[7]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[8]_i_1_n_0 ),
        .Q(addr_step_q[8]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_step_q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(\addr_step_q[9]_i_1_n_0 ),
        .Q(addr_step_q[9]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \areset_d_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(aresetn_0),
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
        .D(\USE_B_CHANNEL.cmd_b_queue_n_9 ),
        .Q(cmd_b_push_block),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    cmd_push_block_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_BURSTS.cmd_queue_n_11 ),
        .Q(cmd_push_block),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    command_ongoing_i_2
       (.I0(areset_d[1]),
        .I1(areset_d[0]),
        .O(command_ongoing_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    command_ongoing_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_B_CHANNEL.cmd_b_queue_n_13 ),
        .Q(command_ongoing),
        .R(aresetn_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \first_step_q[0]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awlen[0]),
        .I3(s_axi_awsize[2]),
        .O(\first_step_q[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \first_step_q[3]_i_1 
       (.I0(\first_step_q[7]_i_2_n_0 ),
        .I1(s_axi_awsize[2]),
        .O(\first_step_q[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
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
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(first_step[10]),
        .Q(first_step_q[10]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(first_step[11]),
        .Q(first_step_q[11]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[1]_i_1_n_0 ),
        .Q(first_step_q[1]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[2]_i_1_n_0 ),
        .Q(first_step_q[2]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(\first_step_q[3]_i_1_n_0 ),
        .Q(first_step_q[3]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(first_step[4]),
        .Q(first_step_q[4]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(first_step[5]),
        .Q(first_step_q[5]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(first_step[6]),
        .Q(first_step_q[6]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(first_step[7]),
        .Q(first_step_q[7]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(first_step[8]),
        .Q(first_step_q[8]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \first_step_q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(first_step[9]),
        .Q(first_step_q[9]),
        .R(aresetn_0));
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
        .R(aresetn_0));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[0]_INST_0 
       (.I0(S_AXI_AADDR_Q[0]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[0]),
        .I4(next_mi_addr[0]),
        .O(m_axi_awaddr[0]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[10]_INST_0 
       (.I0(S_AXI_AADDR_Q[10]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[10]),
        .O(m_axi_awaddr[10]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[11]_INST_0 
       (.I0(S_AXI_AADDR_Q[11]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[11]),
        .O(m_axi_awaddr[11]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[12]_INST_0 
       (.I0(S_AXI_AADDR_Q[12]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[12]),
        .O(m_axi_awaddr[12]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[13]_INST_0 
       (.I0(S_AXI_AADDR_Q[13]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[13]),
        .O(m_axi_awaddr[13]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[14]_INST_0 
       (.I0(S_AXI_AADDR_Q[14]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[14]),
        .O(m_axi_awaddr[14]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[15]_INST_0 
       (.I0(S_AXI_AADDR_Q[15]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[15]),
        .O(m_axi_awaddr[15]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[16]_INST_0 
       (.I0(S_AXI_AADDR_Q[16]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[16]),
        .O(m_axi_awaddr[16]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[17]_INST_0 
       (.I0(S_AXI_AADDR_Q[17]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[17]),
        .O(m_axi_awaddr[17]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[18]_INST_0 
       (.I0(S_AXI_AADDR_Q[18]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[18]),
        .O(m_axi_awaddr[18]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[19]_INST_0 
       (.I0(S_AXI_AADDR_Q[19]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[19]),
        .O(m_axi_awaddr[19]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[1]_INST_0 
       (.I0(S_AXI_AADDR_Q[1]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[1]),
        .I4(next_mi_addr[1]),
        .O(m_axi_awaddr[1]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[20]_INST_0 
       (.I0(S_AXI_AADDR_Q[20]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[20]),
        .O(m_axi_awaddr[20]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[21]_INST_0 
       (.I0(S_AXI_AADDR_Q[21]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[21]),
        .O(m_axi_awaddr[21]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[22]_INST_0 
       (.I0(S_AXI_AADDR_Q[22]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[22]),
        .O(m_axi_awaddr[22]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[23]_INST_0 
       (.I0(S_AXI_AADDR_Q[23]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[23]),
        .O(m_axi_awaddr[23]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[24]_INST_0 
       (.I0(S_AXI_AADDR_Q[24]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[24]),
        .O(m_axi_awaddr[24]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[25]_INST_0 
       (.I0(S_AXI_AADDR_Q[25]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[25]),
        .O(m_axi_awaddr[25]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[26]_INST_0 
       (.I0(S_AXI_AADDR_Q[26]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[26]),
        .O(m_axi_awaddr[26]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[27]_INST_0 
       (.I0(S_AXI_AADDR_Q[27]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[27]),
        .O(m_axi_awaddr[27]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[28]_INST_0 
       (.I0(S_AXI_AADDR_Q[28]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[28]),
        .O(m_axi_awaddr[28]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[29]_INST_0 
       (.I0(S_AXI_AADDR_Q[29]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[29]),
        .O(m_axi_awaddr[29]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[2]_INST_0 
       (.I0(S_AXI_AADDR_Q[2]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[2]),
        .I4(next_mi_addr[2]),
        .O(m_axi_awaddr[2]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[30]_INST_0 
       (.I0(S_AXI_AADDR_Q[30]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[30]),
        .O(m_axi_awaddr[30]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[31]_INST_0 
       (.I0(S_AXI_AADDR_Q[31]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[31]),
        .O(m_axi_awaddr[31]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[3]_INST_0 
       (.I0(S_AXI_AADDR_Q[3]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[3]),
        .I4(next_mi_addr[3]),
        .O(m_axi_awaddr[3]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[4]_INST_0 
       (.I0(S_AXI_AADDR_Q[4]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[4]),
        .I4(next_mi_addr[4]),
        .O(m_axi_awaddr[4]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[5]_INST_0 
       (.I0(S_AXI_AADDR_Q[5]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[5]),
        .I4(next_mi_addr[5]),
        .O(m_axi_awaddr[5]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[6]_INST_0 
       (.I0(S_AXI_AADDR_Q[6]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[6]),
        .I4(next_mi_addr[6]),
        .O(m_axi_awaddr[6]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[7]_INST_0 
       (.I0(S_AXI_AADDR_Q[7]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[7]),
        .O(m_axi_awaddr[7]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[8]_INST_0 
       (.I0(S_AXI_AADDR_Q[8]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[8]),
        .O(m_axi_awaddr[8]));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \m_axi_awaddr[9]_INST_0 
       (.I0(S_AXI_AADDR_Q[9]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[9]),
        .O(m_axi_awaddr[9]));
  LUT2 #(
    .INIT(4'h2)) 
    \m_axi_awlock[0]_INST_0 
       (.I0(\S_AXI_ALOCK_Q_reg_n_0_[0] ),
        .I1(need_to_split_q),
        .O(m_axi_awlock));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_2 
       (.I0(m_axi_awaddr[11]),
        .I1(first_step_q[11]),
        .I2(\next_mi_addr[11]_i_6_n_0 ),
        .I3(addr_step_q[11]),
        .O(\next_mi_addr[11]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_3 
       (.I0(m_axi_awaddr[10]),
        .I1(first_step_q[10]),
        .I2(\next_mi_addr[11]_i_6_n_0 ),
        .I3(addr_step_q[10]),
        .O(\next_mi_addr[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_4 
       (.I0(m_axi_awaddr[9]),
        .I1(first_step_q[9]),
        .I2(\next_mi_addr[11]_i_6_n_0 ),
        .I3(addr_step_q[9]),
        .O(\next_mi_addr[11]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[11]_i_5 
       (.I0(m_axi_awaddr[8]),
        .I1(first_step_q[8]),
        .I2(\next_mi_addr[11]_i_6_n_0 ),
        .I3(addr_step_q[8]),
        .O(\next_mi_addr[11]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \next_mi_addr[11]_i_6 
       (.I0(pushed_commands_reg[3]),
        .I1(pushed_commands_reg[2]),
        .I2(pushed_commands_reg[1]),
        .I3(pushed_commands_reg[0]),
        .O(\next_mi_addr[11]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[15]_i_2 
       (.I0(S_AXI_AADDR_Q[15]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[15]),
        .O(\next_mi_addr[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[15]_i_3 
       (.I0(S_AXI_AADDR_Q[14]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[14]),
        .O(\next_mi_addr[15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[15]_i_4 
       (.I0(S_AXI_AADDR_Q[13]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[13]),
        .O(\next_mi_addr[15]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[15]_i_5 
       (.I0(S_AXI_AADDR_Q[12]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[12]),
        .O(\next_mi_addr[15]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[15]_i_6 
       (.I0(S_AXI_AADDR_Q[15]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[15]),
        .O(\next_mi_addr[15]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[15]_i_7 
       (.I0(S_AXI_AADDR_Q[14]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[14]),
        .O(\next_mi_addr[15]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[15]_i_8 
       (.I0(S_AXI_AADDR_Q[13]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[13]),
        .O(\next_mi_addr[15]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[15]_i_9 
       (.I0(S_AXI_AADDR_Q[12]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[12]),
        .O(\next_mi_addr[15]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[19]_i_2 
       (.I0(S_AXI_AADDR_Q[19]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[19]),
        .O(\next_mi_addr[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[19]_i_3 
       (.I0(S_AXI_AADDR_Q[18]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[18]),
        .O(\next_mi_addr[19]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[19]_i_4 
       (.I0(S_AXI_AADDR_Q[17]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[17]),
        .O(\next_mi_addr[19]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[19]_i_5 
       (.I0(S_AXI_AADDR_Q[16]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[16]),
        .O(\next_mi_addr[19]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[23]_i_2 
       (.I0(S_AXI_AADDR_Q[23]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[23]),
        .O(\next_mi_addr[23]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[23]_i_3 
       (.I0(S_AXI_AADDR_Q[22]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[22]),
        .O(\next_mi_addr[23]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[23]_i_4 
       (.I0(S_AXI_AADDR_Q[21]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[21]),
        .O(\next_mi_addr[23]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[23]_i_5 
       (.I0(S_AXI_AADDR_Q[20]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[20]),
        .O(\next_mi_addr[23]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[27]_i_2 
       (.I0(S_AXI_AADDR_Q[27]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[27]),
        .O(\next_mi_addr[27]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[27]_i_3 
       (.I0(S_AXI_AADDR_Q[26]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[26]),
        .O(\next_mi_addr[27]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[27]_i_4 
       (.I0(S_AXI_AADDR_Q[25]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[25]),
        .O(\next_mi_addr[27]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[27]_i_5 
       (.I0(S_AXI_AADDR_Q[24]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[24]),
        .O(\next_mi_addr[27]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[31]_i_2 
       (.I0(S_AXI_AADDR_Q[31]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[31]),
        .O(\next_mi_addr[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[31]_i_3 
       (.I0(S_AXI_AADDR_Q[30]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[30]),
        .O(\next_mi_addr[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[31]_i_4 
       (.I0(S_AXI_AADDR_Q[29]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[29]),
        .O(\next_mi_addr[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hEA2A2A2A)) 
    \next_mi_addr[31]_i_5 
       (.I0(S_AXI_AADDR_Q[28]),
        .I1(access_is_incr_q),
        .I2(split_ongoing),
        .I3(size_mask_q[31]),
        .I4(next_mi_addr[28]),
        .O(\next_mi_addr[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF80807F7F808F808)) 
    \next_mi_addr[3]_i_2 
       (.I0(next_mi_addr[3]),
        .I1(size_mask_q[3]),
        .I2(\next_mi_addr[3]_i_6_n_0 ),
        .I3(S_AXI_AADDR_Q[3]),
        .I4(\next_mi_addr[11]_i_6_n_0 ),
        .I5(first_step_q[3]),
        .O(\next_mi_addr[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF80807F7F808F808)) 
    \next_mi_addr[3]_i_3 
       (.I0(next_mi_addr[2]),
        .I1(size_mask_q[2]),
        .I2(\next_mi_addr[3]_i_6_n_0 ),
        .I3(S_AXI_AADDR_Q[2]),
        .I4(\next_mi_addr[11]_i_6_n_0 ),
        .I5(first_step_q[2]),
        .O(\next_mi_addr[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF80807F7F808F808)) 
    \next_mi_addr[3]_i_4 
       (.I0(next_mi_addr[1]),
        .I1(size_mask_q[1]),
        .I2(\next_mi_addr[3]_i_6_n_0 ),
        .I3(S_AXI_AADDR_Q[1]),
        .I4(\next_mi_addr[11]_i_6_n_0 ),
        .I5(first_step_q[1]),
        .O(\next_mi_addr[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF80807F7F808F808)) 
    \next_mi_addr[3]_i_5 
       (.I0(next_mi_addr[0]),
        .I1(size_mask_q[0]),
        .I2(\next_mi_addr[3]_i_6_n_0 ),
        .I3(S_AXI_AADDR_Q[0]),
        .I4(\next_mi_addr[11]_i_6_n_0 ),
        .I5(first_step_q[0]),
        .O(\next_mi_addr[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \next_mi_addr[3]_i_6 
       (.I0(access_is_incr_q),
        .I1(split_ongoing),
        .O(\next_mi_addr[3]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_2 
       (.I0(m_axi_awaddr[7]),
        .I1(first_step_q[7]),
        .I2(\next_mi_addr[11]_i_6_n_0 ),
        .I3(addr_step_q[7]),
        .O(\next_mi_addr[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_3 
       (.I0(m_axi_awaddr[6]),
        .I1(first_step_q[6]),
        .I2(\next_mi_addr[11]_i_6_n_0 ),
        .I3(addr_step_q[6]),
        .O(\next_mi_addr[7]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_4 
       (.I0(m_axi_awaddr[5]),
        .I1(first_step_q[5]),
        .I2(\next_mi_addr[11]_i_6_n_0 ),
        .I3(addr_step_q[5]),
        .O(\next_mi_addr[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \next_mi_addr[7]_i_5 
       (.I0(m_axi_awaddr[4]),
        .I1(first_step_q[4]),
        .I2(\next_mi_addr[11]_i_6_n_0 ),
        .I3(size_mask_q[0]),
        .O(\next_mi_addr[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[0] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[3]_i_1_n_7 ),
        .Q(next_mi_addr[0]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[10] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[11]_i_1_n_5 ),
        .Q(next_mi_addr[10]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[11] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[11]_i_1_n_4 ),
        .Q(next_mi_addr[11]),
        .R(aresetn_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[11]_i_1 
       (.CI(\next_mi_addr_reg[7]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[11]_i_1_n_0 ,\next_mi_addr_reg[11]_i_1_n_1 ,\next_mi_addr_reg[11]_i_1_n_2 ,\next_mi_addr_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(m_axi_awaddr[11:8]),
        .O({\next_mi_addr_reg[11]_i_1_n_4 ,\next_mi_addr_reg[11]_i_1_n_5 ,\next_mi_addr_reg[11]_i_1_n_6 ,\next_mi_addr_reg[11]_i_1_n_7 }),
        .S({\next_mi_addr[11]_i_2_n_0 ,\next_mi_addr[11]_i_3_n_0 ,\next_mi_addr[11]_i_4_n_0 ,\next_mi_addr[11]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[12] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[15]_i_1_n_7 ),
        .Q(next_mi_addr[12]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[13] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[15]_i_1_n_6 ),
        .Q(next_mi_addr[13]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[14] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[15]_i_1_n_5 ),
        .Q(next_mi_addr[14]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[15] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[15]_i_1_n_4 ),
        .Q(next_mi_addr[15]),
        .R(aresetn_0));
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
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[17] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[19]_i_1_n_6 ),
        .Q(next_mi_addr[17]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[18] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[19]_i_1_n_5 ),
        .Q(next_mi_addr[18]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[19] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[19]_i_1_n_4 ),
        .Q(next_mi_addr[19]),
        .R(aresetn_0));
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
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[20] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[23]_i_1_n_7 ),
        .Q(next_mi_addr[20]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[21] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[23]_i_1_n_6 ),
        .Q(next_mi_addr[21]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[22] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[23]_i_1_n_5 ),
        .Q(next_mi_addr[22]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[23] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[23]_i_1_n_4 ),
        .Q(next_mi_addr[23]),
        .R(aresetn_0));
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
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[25] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[27]_i_1_n_6 ),
        .Q(next_mi_addr[25]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[26] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[27]_i_1_n_5 ),
        .Q(next_mi_addr[26]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[27] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[27]_i_1_n_4 ),
        .Q(next_mi_addr[27]),
        .R(aresetn_0));
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
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[29] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[31]_i_1_n_6 ),
        .Q(next_mi_addr[29]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[2] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[3]_i_1_n_5 ),
        .Q(next_mi_addr[2]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[30] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[31]_i_1_n_5 ),
        .Q(next_mi_addr[30]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[31] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[31]_i_1_n_4 ),
        .Q(next_mi_addr[31]),
        .R(aresetn_0));
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
        .R(aresetn_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\next_mi_addr_reg[3]_i_1_n_0 ,\next_mi_addr_reg[3]_i_1_n_1 ,\next_mi_addr_reg[3]_i_1_n_2 ,\next_mi_addr_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(m_axi_awaddr[3:0]),
        .O({\next_mi_addr_reg[3]_i_1_n_4 ,\next_mi_addr_reg[3]_i_1_n_5 ,\next_mi_addr_reg[3]_i_1_n_6 ,\next_mi_addr_reg[3]_i_1_n_7 }),
        .S({\next_mi_addr[3]_i_2_n_0 ,\next_mi_addr[3]_i_3_n_0 ,\next_mi_addr[3]_i_4_n_0 ,\next_mi_addr[3]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[4] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[7]_i_1_n_7 ),
        .Q(next_mi_addr[4]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[5] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[7]_i_1_n_6 ),
        .Q(next_mi_addr[5]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[6] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[7]_i_1_n_5 ),
        .Q(next_mi_addr[6]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[7] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[7]_i_1_n_4 ),
        .Q(next_mi_addr[7]),
        .R(aresetn_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \next_mi_addr_reg[7]_i_1 
       (.CI(\next_mi_addr_reg[3]_i_1_n_0 ),
        .CO({\next_mi_addr_reg[7]_i_1_n_0 ,\next_mi_addr_reg[7]_i_1_n_1 ,\next_mi_addr_reg[7]_i_1_n_2 ,\next_mi_addr_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI(m_axi_awaddr[7:4]),
        .O({\next_mi_addr_reg[7]_i_1_n_4 ,\next_mi_addr_reg[7]_i_1_n_5 ,\next_mi_addr_reg[7]_i_1_n_6 ,\next_mi_addr_reg[7]_i_1_n_7 }),
        .S({\next_mi_addr[7]_i_2_n_0 ,\next_mi_addr[7]_i_3_n_0 ,\next_mi_addr[7]_i_4_n_0 ,\next_mi_addr[7]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[8] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[11]_i_1_n_7 ),
        .Q(next_mi_addr[8]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \next_mi_addr_reg[9] 
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(\next_mi_addr_reg[11]_i_1_n_6 ),
        .Q(next_mi_addr[9]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[4]),
        .Q(num_transactions_q[0]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[5]),
        .Q(num_transactions_q[1]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[6]),
        .Q(num_transactions_q[2]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \num_transactions_q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[7]),
        .Q(num_transactions_q[3]),
        .R(aresetn_0));
  LUT1 #(
    .INIT(2'h1)) 
    \pushed_commands[0]_i_1 
       (.I0(pushed_commands_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \pushed_commands[1]_i_1 
       (.I0(pushed_commands_reg[0]),
        .I1(pushed_commands_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \pushed_commands[2]_i_1 
       (.I0(pushed_commands_reg[2]),
        .I1(pushed_commands_reg[1]),
        .I2(pushed_commands_reg[0]),
        .O(p_0_in[2]));
  LUT2 #(
    .INIT(4'hB)) 
    \pushed_commands[3]_i_1 
       (.I0(E),
        .I1(aresetn),
        .O(\pushed_commands[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \pushed_commands[3]_i_2 
       (.I0(pushed_commands_reg[3]),
        .I1(pushed_commands_reg[0]),
        .I2(pushed_commands_reg[1]),
        .I3(pushed_commands_reg[2]),
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
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \size_mask_q[0]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[0]),
        .I2(s_axi_awsize[2]),
        .O(size_mask[0]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \size_mask_q[1]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[2]),
        .O(size_mask[1]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h15)) 
    \size_mask_q[2]_i_1 
       (.I0(s_axi_awsize[2]),
        .I1(s_axi_awsize[1]),
        .I2(s_axi_awsize[0]),
        .O(size_mask[2]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \size_mask_q[3]_i_1 
       (.I0(s_axi_awsize[2]),
        .O(size_mask[3]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h57)) 
    \size_mask_q[4]_i_1 
       (.I0(s_axi_awsize[2]),
        .I1(s_axi_awsize[1]),
        .I2(s_axi_awsize[0]),
        .O(size_mask[4]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \size_mask_q[5]_i_1 
       (.I0(s_axi_awsize[1]),
        .I1(s_axi_awsize[2]),
        .O(size_mask[5]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
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
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[1]),
        .Q(size_mask_q[1]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[2]),
        .Q(size_mask_q[2]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(1'b1),
        .Q(size_mask_q[31]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[3]),
        .Q(size_mask_q[3]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[4]),
        .Q(size_mask_q[4]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[5]),
        .Q(size_mask_q[5]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    \size_mask_q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(size_mask[6]),
        .Q(size_mask_q[6]),
        .R(aresetn_0));
  FDRE #(
    .INIT(1'b0)) 
    split_ongoing_reg
       (.C(aclk),
        .CE(pushed_new_cmd),
        .D(cmd_b_split_i),
        .Q(split_ongoing),
        .R(aresetn_0));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_36_axi3_conv" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_protocol_converter_v2_1_36_axi3_conv
   (s_axi_bresp,
    m_axi_awlen,
    m_axi_bready,
    S_AXI_AREADY_I_reg,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    s_axi_wready,
    m_axi_wlast,
    m_axi_awaddr,
    s_axi_bvalid,
    m_axi_awvalid,
    m_axi_wvalid,
    m_axi_awlock,
    m_axi_bresp,
    s_axi_awsize,
    s_axi_awlen,
    aclk,
    s_axi_awaddr,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    m_axi_bvalid,
    s_axi_bready,
    aresetn,
    m_axi_awready,
    s_axi_wvalid,
    m_axi_wready,
    s_axi_awvalid);
  output [1:0]s_axi_bresp;
  output [3:0]m_axi_awlen;
  output m_axi_bready;
  output S_AXI_AREADY_I_reg;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output s_axi_wready;
  output m_axi_wlast;
  output [31:0]m_axi_awaddr;
  output s_axi_bvalid;
  output m_axi_awvalid;
  output m_axi_wvalid;
  output [0:0]m_axi_awlock;
  input [1:0]m_axi_bresp;
  input [2:0]s_axi_awsize;
  input [7:0]s_axi_awlen;
  input aclk;
  input [31:0]s_axi_awaddr;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input m_axi_bvalid;
  input s_axi_bready;
  input aresetn;
  input m_axi_awready;
  input s_axi_wvalid;
  input m_axi_wready;
  input s_axi_awvalid;

  wire S_AXI_AREADY_I_reg;
  wire \USE_BURSTS.cmd_queue/inst/empty ;
  wire \USE_B_CHANNEL.cmd_b_queue/inst/empty ;
  wire \USE_WRITE.wr_cmd_b_ready ;
  wire [3:0]\USE_WRITE.wr_cmd_b_repeat ;
  wire \USE_WRITE.wr_cmd_b_split ;
  wire [3:0]\USE_WRITE.wr_cmd_length ;
  wire \USE_WRITE.wr_cmd_ready ;
  wire \USE_WRITE.write_addr_inst_n_5 ;
  wire aclk;
  wire aresetn;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]m_axi_awlock;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire s_axi_wready;
  wire s_axi_wvalid;

  cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_protocol_converter_v2_1_36_b_downsizer \USE_WRITE.USE_SPLIT_W.write_resp_inst 
       (.E(m_axi_bready),
        .aclk(aclk),
        .dout({\USE_WRITE.wr_cmd_b_split ,\USE_WRITE.wr_cmd_b_repeat }),
        .empty(\USE_B_CHANNEL.cmd_b_queue/inst/empty ),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .rd_en(\USE_WRITE.wr_cmd_b_ready ),
        .\repeat_cnt_reg[3]_0 (\USE_WRITE.write_addr_inst_n_5 ),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid));
  cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_protocol_converter_v2_1_36_a_axi3_conv \USE_WRITE.write_addr_inst 
       (.E(S_AXI_AREADY_I_reg),
        .aclk(aclk),
        .aresetn(aresetn),
        .aresetn_0(\USE_WRITE.write_addr_inst_n_5 ),
        .dout(\USE_WRITE.wr_cmd_length ),
        .empty(\USE_BURSTS.cmd_queue/inst/empty ),
        .empty_fwft_i_reg(\USE_B_CHANNEL.cmd_b_queue/inst/empty ),
        .\goreg_dm.dout_i_reg[4] ({\USE_WRITE.wr_cmd_b_split ,\USE_WRITE.wr_cmd_b_repeat }),
        .\goreg_dm.dout_i_reg[4]_0 (\USE_WRITE.wr_cmd_b_ready ),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awlock(m_axi_awlock),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_wready(m_axi_wready),
        .m_axi_wready_0(s_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .rd_en(\USE_WRITE.wr_cmd_ready ),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_wvalid(s_axi_wvalid));
  cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_protocol_converter_v2_1_36_w_axi3_conv \USE_WRITE.write_data_inst 
       (.aclk(aclk),
        .dout(\USE_WRITE.wr_cmd_length ),
        .empty(\USE_BURSTS.cmd_queue/inst/empty ),
        .\length_counter_1_reg[4]_0 (\USE_WRITE.write_addr_inst_n_5 ),
        .\length_counter_1_reg[6]_0 (s_axi_wready),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .rd_en(\USE_WRITE.wr_cmd_ready ),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* C_AXI_ADDR_WIDTH = "32" *) (* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) 
(* C_AXI_BUSER_WIDTH = "1" *) (* C_AXI_DATA_WIDTH = "32" *) (* C_AXI_ID_WIDTH = "1" *) 
(* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_SUPPORTS_READ = "0" *) (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
(* C_AXI_SUPPORTS_WRITE = "1" *) (* C_AXI_WUSER_WIDTH = "1" *) (* C_FAMILY = "zynq" *) 
(* C_IGNORE_ID = "1" *) (* C_M_AXI_PROTOCOL = "1" *) (* C_S_AXI_PROTOCOL = "0" *) 
(* C_TRANSLATION_MODE = "2" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "axi_protocol_converter_v2_1_36_axi_protocol_converter" *) 
(* P_AXI3 = "1" *) (* P_AXI4 = "0" *) (* P_AXILITE = "2" *) 
(* P_AXILITE_SIZE = "3'b010" *) (* P_CONVERSION = "2" *) (* P_DECERR = "2'b11" *) 
(* P_INCR = "2'b01" *) (* P_PROTECTION = "1" *) (* P_SLVERR = "2'b10" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_protocol_converter_v2_1_36_axi_protocol_converter
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
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]\^m_axi_awlock ;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
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
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[1] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlock[1] = \<const0> ;
  assign m_axi_awlock[0] = \^m_axi_awlock [0];
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[31:0] = s_axi_wdata;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wstrb[3:0] = s_axi_wstrb;
  assign m_axi_wuser[0] = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  GND GND
       (.G(\<const0> ));
  cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_protocol_converter_v2_1_36_axi3_conv \gen_axi4_axi3.axi3_conv_inst 
       (.S_AXI_AREADY_I_reg(s_axi_awready),
        .aclk(aclk),
        .aresetn(aresetn),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awlock(\^m_axi_awlock ),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_wready(s_axi_wready),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_36_b_downsizer" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_protocol_converter_v2_1_36_b_downsizer
   (E,
    s_axi_bresp,
    rd_en,
    s_axi_bvalid,
    \repeat_cnt_reg[3]_0 ,
    aclk,
    dout,
    m_axi_bresp,
    m_axi_bvalid,
    s_axi_bready,
    empty);
  output [0:0]E;
  output [1:0]s_axi_bresp;
  output rd_en;
  output s_axi_bvalid;
  input \repeat_cnt_reg[3]_0 ;
  input aclk;
  input [4:0]dout;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  input s_axi_bready;
  input empty;

  wire [0:0]E;
  wire [1:0]S_AXI_BRESP_ACC;
  wire aclk;
  wire [4:0]dout;
  wire empty;
  wire first_mi_word;
  wire last_word;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [3:0]next_repeat_cnt;
  wire rd_en;
  wire \repeat_cnt[1]_i_1_n_0 ;
  wire \repeat_cnt[2]_i_2_n_0 ;
  wire \repeat_cnt[3]_i_2_n_0 ;
  wire [3:0]repeat_cnt_reg;
  wire \repeat_cnt_reg[3]_0 ;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;

  FDRE \S_AXI_BRESP_ACC_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_bresp[0]),
        .Q(S_AXI_BRESP_ACC[0]),
        .R(\repeat_cnt_reg[3]_0 ));
  FDRE \S_AXI_BRESP_ACC_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_bresp[1]),
        .Q(S_AXI_BRESP_ACC[1]),
        .R(\repeat_cnt_reg[3]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    fifo_gen_inst_i_3
       (.I0(last_word),
        .I1(m_axi_bvalid),
        .I2(s_axi_bready),
        .I3(empty),
        .O(rd_en));
  FDSE #(
    .INIT(1'b0)) 
    first_mi_word_reg
       (.C(aclk),
        .CE(E),
        .D(last_word),
        .Q(first_mi_word),
        .S(\repeat_cnt_reg[3]_0 ));
  LUT3 #(
    .INIT(8'h8A)) 
    m_axi_bready_INST_0
       (.I0(m_axi_bvalid),
        .I1(s_axi_bready),
        .I2(last_word),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    \repeat_cnt[0]_i_1 
       (.I0(repeat_cnt_reg[0]),
        .I1(first_mi_word),
        .I2(dout[0]),
        .O(next_repeat_cnt[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hCCA533A5)) 
    \repeat_cnt[1]_i_1 
       (.I0(repeat_cnt_reg[1]),
        .I1(dout[1]),
        .I2(repeat_cnt_reg[0]),
        .I3(first_mi_word),
        .I4(dout[0]),
        .O(\repeat_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEFA051111FA05)) 
    \repeat_cnt[2]_i_1 
       (.I0(\repeat_cnt[2]_i_2_n_0 ),
        .I1(dout[1]),
        .I2(repeat_cnt_reg[1]),
        .I3(repeat_cnt_reg[2]),
        .I4(first_mi_word),
        .I5(dout[2]),
        .O(next_repeat_cnt[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \repeat_cnt[2]_i_2 
       (.I0(dout[0]),
        .I1(first_mi_word),
        .I2(repeat_cnt_reg[0]),
        .O(\repeat_cnt[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFAFCF305050CF30)) 
    \repeat_cnt[3]_i_1 
       (.I0(dout[2]),
        .I1(repeat_cnt_reg[2]),
        .I2(\repeat_cnt[3]_i_2_n_0 ),
        .I3(repeat_cnt_reg[3]),
        .I4(first_mi_word),
        .I5(dout[3]),
        .O(next_repeat_cnt[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00053305)) 
    \repeat_cnt[3]_i_2 
       (.I0(repeat_cnt_reg[1]),
        .I1(dout[1]),
        .I2(repeat_cnt_reg[0]),
        .I3(first_mi_word),
        .I4(dout[0]),
        .O(\repeat_cnt[3]_i_2_n_0 ));
  FDRE \repeat_cnt_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(next_repeat_cnt[0]),
        .Q(repeat_cnt_reg[0]),
        .R(\repeat_cnt_reg[3]_0 ));
  FDRE \repeat_cnt_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(\repeat_cnt[1]_i_1_n_0 ),
        .Q(repeat_cnt_reg[1]),
        .R(\repeat_cnt_reg[3]_0 ));
  FDRE \repeat_cnt_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(next_repeat_cnt[2]),
        .Q(repeat_cnt_reg[2]),
        .R(\repeat_cnt_reg[3]_0 ));
  FDRE \repeat_cnt_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(next_repeat_cnt[3]),
        .Q(repeat_cnt_reg[3]),
        .R(\repeat_cnt_reg[3]_0 ));
  LUT6 #(
    .INIT(64'hBAAABA8AAAAABAAA)) 
    \s_axi_bresp[0]_INST_0 
       (.I0(m_axi_bresp[0]),
        .I1(first_mi_word),
        .I2(dout[4]),
        .I3(S_AXI_BRESP_ACC[0]),
        .I4(m_axi_bresp[1]),
        .I5(S_AXI_BRESP_ACC[1]),
        .O(s_axi_bresp[0]));
  LUT4 #(
    .INIT(16'hAEAA)) 
    \s_axi_bresp[1]_INST_0 
       (.I0(m_axi_bresp[1]),
        .I1(S_AXI_BRESP_ACC[1]),
        .I2(first_mi_word),
        .I3(dout[4]),
        .O(s_axi_bresp[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    s_axi_bvalid_INST_0
       (.I0(m_axi_bvalid),
        .I1(last_word),
        .O(s_axi_bvalid));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    s_axi_bvalid_INST_0_i_1
       (.I0(repeat_cnt_reg[0]),
        .I1(repeat_cnt_reg[3]),
        .I2(repeat_cnt_reg[1]),
        .I3(first_mi_word),
        .I4(repeat_cnt_reg[2]),
        .I5(dout[4]),
        .O(last_word));
endmodule

(* ORIG_REF_NAME = "axi_protocol_converter_v2_1_36_w_axi3_conv" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_1_axi_protocol_converter_v2_1_36_w_axi3_conv
   (m_axi_wlast,
    rd_en,
    \length_counter_1_reg[4]_0 ,
    \length_counter_1_reg[6]_0 ,
    aclk,
    dout,
    empty,
    s_axi_wvalid,
    m_axi_wready);
  output m_axi_wlast;
  output rd_en;
  input \length_counter_1_reg[4]_0 ;
  input \length_counter_1_reg[6]_0 ;
  input aclk;
  input [3:0]dout;
  input empty;
  input s_axi_wvalid;
  input m_axi_wready;

  wire aclk;
  wire [3:0]dout;
  wire empty;
  wire fifo_gen_inst_i_3__0_n_0;
  wire first_mi_word;
  wire \length_counter_1[0]_i_1_n_0 ;
  wire \length_counter_1[1]_i_1_n_0 ;
  wire \length_counter_1[2]_i_1_n_0 ;
  wire \length_counter_1[3]_i_1_n_0 ;
  wire \length_counter_1[4]_i_1_n_0 ;
  wire \length_counter_1[5]_i_1_n_0 ;
  wire \length_counter_1[6]_i_1_n_0 ;
  wire \length_counter_1[7]_i_1_n_0 ;
  wire [7:0]length_counter_1_reg;
  wire \length_counter_1_reg[4]_0 ;
  wire \length_counter_1_reg[6]_0 ;
  wire m_axi_wlast;
  wire m_axi_wlast_INST_0_i_1_n_0;
  wire m_axi_wlast_INST_0_i_2_n_0;
  wire m_axi_wready;
  wire rd_en;
  wire s_axi_wvalid;

  LUT6 #(
    .INIT(64'h4400000044040000)) 
    fifo_gen_inst_i_2__0
       (.I0(fifo_gen_inst_i_3__0_n_0),
        .I1(m_axi_wlast_INST_0_i_1_n_0),
        .I2(length_counter_1_reg[6]),
        .I3(first_mi_word),
        .I4(\length_counter_1_reg[6]_0 ),
        .I5(length_counter_1_reg[7]),
        .O(rd_en));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h32)) 
    fifo_gen_inst_i_3__0
       (.I0(length_counter_1_reg[5]),
        .I1(first_mi_word),
        .I2(length_counter_1_reg[4]),
        .O(fifo_gen_inst_i_3__0_n_0));
  FDSE #(
    .INIT(1'b0)) 
    first_mi_word_reg
       (.C(aclk),
        .CE(\length_counter_1_reg[6]_0 ),
        .D(m_axi_wlast),
        .Q(first_mi_word),
        .S(\length_counter_1_reg[4]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    \length_counter_1[0]_i_1 
       (.I0(length_counter_1_reg[0]),
        .I1(first_mi_word),
        .I2(dout[0]),
        .O(\length_counter_1[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'hCCA533A5)) 
    \length_counter_1[1]_i_1 
       (.I0(length_counter_1_reg[1]),
        .I1(dout[1]),
        .I2(length_counter_1_reg[0]),
        .I3(first_mi_word),
        .I4(dout[0]),
        .O(\length_counter_1[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \length_counter_1[2]_i_1 
       (.I0(m_axi_wlast_INST_0_i_2_n_0),
        .I1(length_counter_1_reg[2]),
        .I2(first_mi_word),
        .I3(dout[2]),
        .O(\length_counter_1[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC3AAC355CCAACCAA)) 
    \length_counter_1[3]_i_1 
       (.I0(length_counter_1_reg[3]),
        .I1(dout[3]),
        .I2(dout[2]),
        .I3(first_mi_word),
        .I4(length_counter_1_reg[2]),
        .I5(m_axi_wlast_INST_0_i_2_n_0),
        .O(\length_counter_1[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF9FFFFFF0A000000)) 
    \length_counter_1[4]_i_1 
       (.I0(m_axi_wlast_INST_0_i_1_n_0),
        .I1(first_mi_word),
        .I2(empty),
        .I3(s_axi_wvalid),
        .I4(m_axi_wready),
        .I5(length_counter_1_reg[4]),
        .O(\length_counter_1[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'hF90A)) 
    \length_counter_1[5]_i_1 
       (.I0(length_counter_1_reg[5]),
        .I1(length_counter_1_reg[4]),
        .I2(first_mi_word),
        .I3(m_axi_wlast_INST_0_i_1_n_0),
        .O(\length_counter_1[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'hFAF90A0A)) 
    \length_counter_1[6]_i_1 
       (.I0(length_counter_1_reg[6]),
        .I1(length_counter_1_reg[5]),
        .I2(first_mi_word),
        .I3(length_counter_1_reg[4]),
        .I4(m_axi_wlast_INST_0_i_1_n_0),
        .O(\length_counter_1[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h44FBFFFF44040000)) 
    \length_counter_1[7]_i_1 
       (.I0(fifo_gen_inst_i_3__0_n_0),
        .I1(m_axi_wlast_INST_0_i_1_n_0),
        .I2(length_counter_1_reg[6]),
        .I3(first_mi_word),
        .I4(\length_counter_1_reg[6]_0 ),
        .I5(length_counter_1_reg[7]),
        .O(\length_counter_1[7]_i_1_n_0 ));
  FDRE \length_counter_1_reg[0] 
       (.C(aclk),
        .CE(\length_counter_1_reg[6]_0 ),
        .D(\length_counter_1[0]_i_1_n_0 ),
        .Q(length_counter_1_reg[0]),
        .R(\length_counter_1_reg[4]_0 ));
  FDRE \length_counter_1_reg[1] 
       (.C(aclk),
        .CE(\length_counter_1_reg[6]_0 ),
        .D(\length_counter_1[1]_i_1_n_0 ),
        .Q(length_counter_1_reg[1]),
        .R(\length_counter_1_reg[4]_0 ));
  FDRE \length_counter_1_reg[2] 
       (.C(aclk),
        .CE(\length_counter_1_reg[6]_0 ),
        .D(\length_counter_1[2]_i_1_n_0 ),
        .Q(length_counter_1_reg[2]),
        .R(\length_counter_1_reg[4]_0 ));
  FDRE \length_counter_1_reg[3] 
       (.C(aclk),
        .CE(\length_counter_1_reg[6]_0 ),
        .D(\length_counter_1[3]_i_1_n_0 ),
        .Q(length_counter_1_reg[3]),
        .R(\length_counter_1_reg[4]_0 ));
  FDRE \length_counter_1_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[4]_i_1_n_0 ),
        .Q(length_counter_1_reg[4]),
        .R(\length_counter_1_reg[4]_0 ));
  FDRE \length_counter_1_reg[5] 
       (.C(aclk),
        .CE(\length_counter_1_reg[6]_0 ),
        .D(\length_counter_1[5]_i_1_n_0 ),
        .Q(length_counter_1_reg[5]),
        .R(\length_counter_1_reg[4]_0 ));
  FDRE \length_counter_1_reg[6] 
       (.C(aclk),
        .CE(\length_counter_1_reg[6]_0 ),
        .D(\length_counter_1[6]_i_1_n_0 ),
        .Q(length_counter_1_reg[6]),
        .R(\length_counter_1_reg[4]_0 ));
  FDRE \length_counter_1_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[7]_i_1_n_0 ),
        .Q(length_counter_1_reg[7]),
        .R(\length_counter_1_reg[4]_0 ));
  LUT6 #(
    .INIT(64'hCCCC0000CCCC0004)) 
    m_axi_wlast_INST_0
       (.I0(length_counter_1_reg[6]),
        .I1(m_axi_wlast_INST_0_i_1_n_0),
        .I2(length_counter_1_reg[4]),
        .I3(length_counter_1_reg[5]),
        .I4(first_mi_word),
        .I5(length_counter_1_reg[7]),
        .O(m_axi_wlast));
  LUT6 #(
    .INIT(64'h00002020000A202A)) 
    m_axi_wlast_INST_0_i_1
       (.I0(m_axi_wlast_INST_0_i_2_n_0),
        .I1(dout[2]),
        .I2(first_mi_word),
        .I3(length_counter_1_reg[2]),
        .I4(dout[3]),
        .I5(length_counter_1_reg[3]),
        .O(m_axi_wlast_INST_0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h00053305)) 
    m_axi_wlast_INST_0_i_2
       (.I0(length_counter_1_reg[1]),
        .I1(dout[1]),
        .I2(length_counter_1_reg[0]),
        .I3(first_mi_word),
        .I4(dout[0]),
        .O(m_axi_wlast_INST_0_i_2_n_0));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_cdc_async_rst" *) (* RST_ACTIVE_HIGH = "1" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "ASYNC_RST" *) 
module cnn_system_axi_ic_hp1_imp_auto_pc_1_xpm_cdc_async_rst
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
module cnn_system_axi_ic_hp1_imp_auto_pc_1_xpm_cdc_async_rst__2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 144896)
`pragma protect data_block
sdZ8xL+JYKXrIUDzAw6O2bif+Y+7xdSRA3PYfn2yOCXmzb38cr8GvhQODprbBs/CgGmUDWDKfjZw
zglGC4PF6wL3hAh9ocFJjS+nLhznFwJ4e6/f9ygwn2FYejWOGqSfsCfJ7eSmmyCRbFd3taELucQR
LK68ZAcQKjMwgII0mqd2d229nzvF3WWcRHxJaP/bMsOCHpg/8vM3wLw5c0NkzPx8T00MicvUQ2lc
Dgcs7+Q5ZmfBEd90uBmBF97Wjf1B19A3vWNfgiOZu8QeS7uAHVQveEOLqCYhmaV48gX/acHwdiYy
UHfrhz75ZRI/TOG9X3DtLp0W+9CH8eyAE9tBLMcl5PTJUZ/sr9wY2WL56QGVPrupRVMVdnapS+wh
6Mfo/xmoDEcl/RPupN6SvdEWsyNZajAJ7JOVFMGYvfg4Rx10jTlMHONTVrMDiBcCTwlw/ZP5OJmc
NlbCT+PocWrPFd9LQGFPILUlvfkjn0n6Mh0RYvnKCIz7Q8zcd/SOnO8f6gwQS8gBkb6e/PB53UOv
lhtKHofD6DfnxzMpwJEftBD5GtQR/4/IginN2fXQR54YMPfuehkb8GA8lhvIU29NRiU/5ttYM0u4
6AEu25Leb1ioXS+PWPnzGTrDK7qIa5h0oJlqFs0xNfxHcTxAwfrFl2Mfb6GUsPuQ7xgFnuky4Qkz
IOSxL6F1BJ/O+Y5Ilyww7ANlzbQ59zQtGKK8j8LgOzxJWnZLlF5ao17OIwF1Od8TywW1JIw4qeJy
O78HKb8tEmqOqnrMb33Bpu2BnHY7XukZgiRUeAK/V8l2XlyG/v4GuzSCbB3/SurN6Re68q+2rus+
v5YHx/aXUhcY4wJNWD/BQwJFthsrLVdoQkYOe94x8BxgOBMjkwsQN9Qcy6Yvl4pTTNGQoS6pJi91
8ZFITYW2AtTGS7qdY77HzirSkpxUOJz+YN7JBouISaTg6yeYcUXarMAHFZBcAa+jbNFqiGqcn5Mi
QfmqsBwN2vdyBeQ+yrvSxoT9knpNb4JXBU/NgetCo/dGJmkPxUHVEnO9biaFl0zgHM1FLbeYawbz
QirW4ZiOSagLCAYPA/KqOhZa6NC92lg4Hwzm7vEG4k/XYXl9zBdZodjfo5sVoJjOB94WbdcvNnmX
QdK73+Ree/D1PgrG+42WeNhEXWXJCv+cprW8diSK50MzkH7/nR/WQcx9Ss4amEzXgfOVYiUiq3Hz
vLyFAET4tOmACAzmmVKU4DENknKeJsMyFd/CHApkFc32S+MaXjadmt2NZKFF3inU2L/tVWT18wbU
wtoQF4wptGZq2E8oIU7gm/SlQneit4If00zGcYpUKHRXGhoRZOQLCh+GYBReU4GPKMEInVk7CzmC
aSezWlHFfre6Cs6Ak82MvznQEkzK6wUU1f3VLuZHH236XR4bWeNXeJA5c6fNhCHrrXafwunGdg6+
q3co0B+YCsHKQHhFohd8ENQaFKzicmfM9tabbXBjcWDYRX3DSAP66mEI7bhUqXHll4klwqtPosrh
oUKO1YcPZfgluAr4I5Hlmk2KW0da7AT/7vljtGw/E7xpx6f0fidrFJB5kJTpZuU73ipBDTEaUO/S
1XcD6Co07SNqf1jQi45c87OMQHsxaBtzepUkg9RhXqcruej4bcDZ7Hji6BnyAEYkEo9jeobyeyWI
+j3zf/y67syENEtthsE2e1UvIauKbEMXmpTA3TCdIicSleBZCwpD1kjSK47Pkj2H/us+C4TOGobr
YGOhGXPSM+jC+QMOI2cARZY6vV5rzPjMvXiP5uRuAJFYHyCcBK/7SLzS99hHuNfhYE4n03uSFce/
pTeKJaBPYEY/YTwR3+VuoLDAHCPM8GDlnns2WU5moMyNzw+KPQs/5XSscxFyYH8d/cn4QjUXQVh+
TF4Oa1BA/Y0XQzSSKsNfBTc3IbbFxtyG/oURHmYeIywIJ6fAq0biNdjV11DUr6hY/G+UXw/b70Ve
aFr9mFoqNTC7pxQE49rG1/WhgF83c8qLXej3TxIDaFbADywySJFIpsXRRP+l02FDGAxrccer1jZB
/WjyUr7bkySpCNoqQQy6arTv6226hCs5lPl6hvpD3fA8r6/tzy84QbGCNsSb1zEcHSv3YNukaMmZ
7csfHCDHM9HLT50f7NiHPiayhXcIxPzLidc9WdGeOd+TiKXQnbnagFr+TODZKm3GT1SMILYQh/i6
sAcLAvCd229kZDq+G5fDkYFBfCsUzjpVk5v8q+FliuCuPk9iL2oa3WQXkhG6d0naMTZmb+wyoI+I
5yhFnLwrKjMuySrDDdrCK/AeUlBQRIY//U02bu8BN1ENvvLseOVMG9SrOv2eCRWxk+m+wsyXKrVo
WjJIVZ7gVYocsK6ia6PhI0Xy7aajrpLqIZNIxADnNolpia9nH2qgLQO2EcszO7KZSonuWcxajkla
SpRZtiB6ATCJ+n5KyABdGCWZRCrevKuykUACwM4gLRcu/JsgrQigzePMFBIwwbiOqru7wP++2hIX
t0O1GzOVaPrcJoTTRghWAjYO61Mi7N8FQMjtBEutETmiZeCkGBrgXR63n1zpizPSW7iaaZWrKUQx
jH6pepPq8wfygbbKnDr9ntBv9vRAbY5OEKtPksTnsBQFXeZrOzphrj6TPSu8QYz2yivD3BdvhRkk
+8o9ySs+l6DZmXnSfJnwD3FBMUrTwOFSclK8GWHTuTIagZpu2XC5vfP6Umm+WYKC/S045B1Xv8Fw
i9tcSf5LE51k4Zmlv0lajNuC3LhKGvjzOPTWjiKA1ePRwu7fqA8U/cfU81BVfMNF9ktK8r/43ici
CCbtoNDTRgJBHBtA4lKAOBF6aXENXkPjQBBxGbHy+ESqpu02gwM+ugRiVsFbw+/0OJYxWJARtvh7
+d+nV/jdshZ2bbm8FSetQ9eJCpk+Tq3oBWHdchmeTYbjOUkYTZv5WjbyBxFSwiK2NRnkd2P9E4EL
Kip+wei0BTEf18jfAkggrncBVpKV8zdE/9+D29KlVwoVCggGofCor0aEK+ARb/9xJJnT6P3m6hsv
KG3EMbNSldKPg2ZnfXTUS5qWk12bQJvKaG70L24iSoctFlHfxOoaXB7GQY6ApsQDpSgkzQqhh4id
3WPYRhfQ37r3vlx+pEI0sok6jtxOqScFAtlBs1E0yaFVvvkoH+a/5/xcVvUfL9ez96KbHUgUEI85
IsJTmBUDz/u7rtU5wpca3ewLn+SQ0lr6O5B1SC9Rf6J/Bt63eNiMqrCZMZp9MapuOT/9IupkTx+C
w8xwvnjCVP8if8yCu/rkXCJS198FGY6177oIPtYvMuydyHds0n45FwuNV9uwQ+qmoC24VaolHyrM
oVpz8eirbhUVsGnxllu3LjBrKs5fXRNT3o0xLplz47Be8cDG3xS4/ZWF7GUBmM3+KaB7SWh2J8Ag
xPvsQL5RAK5f//yT9ATx2DxnUwnlkk2eY2cH88bTcAPQs5R64pKwCHvNUP1+UXjDJbqk/ev5X/u+
FcrHmQwOZHivIthsBVoc2VCv+4iedXaX5nqPNhziO1WjudxF3aZVpZkNYNVOYeVnX7RQ3sYVv6V/
lgpeGBJn+IKrj3ilHsQdsx7stkLmqYgugdIdOEgGqJbyDsU+XGXTlpoE/ruYz6IyY0Xsr8gdU21T
LZhXVkbwqReZj7xG6vw7B0NbKAFFQpuLYI/Z0bQ4dcoDhopUOG5EQ941deCykDjLQAc/ISraNFrJ
dCQIkQc32D7032VI/FApUuPlbfh1WapQyHdaFq1ac8P9vK1UpV94E70X5PWQf67O6XajmQyWE/2C
oJf0Zvv7cY4aEBB1OQL9eeEySFRFrlgePAkqsic0lmwAlEdLOSDo9sH3zNif94S9gieYMIuc6xJ1
HKLPjIGBytDTxgy1Y8uzHJPzKBRplR1aUZpWiQgawXKrPZcbKEiuw1xuxK+jlq8oKj4Mu13P6cvI
SKAeOioQmhTKofAUV9Kz9q4ZQ/uWs4cq2rChnEHRB64KjEzM5gZ/iBwnRA3qpho/4jyR8ZT7DlLr
ipfLujLldf+I1QdF4LfNXLQZ1ht7F9nPfvsVWXDLiSe7bdWQ8HO6vOSLiVQOf2gGifkattwV2SN3
yvQtlSEAXZxf5E9MP1gZ0AhD9B2fCgg8j/+ELRB1cBTg97E/GXKEb8IZVwnYIgDv7DK5f0/Ap1QH
J0YI4YYXSJdM+Z3nwoh/OynkrXXvv7tJubeUfBTNL6ReazNmHf9DlLOLVEe90MmKymohZ5Ds1XnO
nbdaUmJoq9mWNUxJ4ZgDHzpfReUqAG+PH5XzvcIOo6RHoYdWN4JxSo+DKObxDYQ7h2bWYX35lmlu
DL/TT7XsPIlsbwAsMYJnDatbKngSszncGZGr7tPCB7St2Jc4BV7YHxFnlXphuBl5rDy4py/ZiTre
chaCGyTtu+qGgamwQRs9+VNDOUgP9ikNs3V9LGoerPRLLh/LywJRVe4ZqLaPui+mBU5AJotEMaGR
BGpnCA+Vw6SMJUh5pTcYYAKB444MxDdXuTnXh6+YKHxsvV7chzaxRUL2XSkw/0OTijaljj5DlHiA
5VuVH2LKPmimCTv9wg7ZrvJ9tjjgCAUaCXmhhZM7OabCfyxVsetq4KD/w8R2v9EDQ/S///rwhVRi
7GFRYnnDEfioZdOWqFnp+L4fiF3EnMTW+Y8h4EyIn2KZ842mOaVRSi7nwTvlcsHfcR4X5FulnyoS
VvyjfXjUEft/2lwXM3AtEjZ6mFpnAaOYaLGMDlOqYNiB847ywWEocJqnHbSaITClzHVRG6bpBLQ8
/yC6C6yrZ4E05sEMtbPbmp71Al+DSkAkBtnTQ23Ccr5ghyl3mU10YL9B5JaVK/8K9bbJvsOIFcY0
Nz+pnzd1uShcaZWlVxaD+4LTJCcDilMBSr5gicpTAy9rUiogGIYLipQPS6sfIUIRk8++2vRuCa6D
DuntEMnnvHK+vnN11OS37FQczLH2UumkVX0P8R8XsTkYEwWpCZBsvl+RrjujC3JuWb/YsLZedIWk
MlL4+bL120x9rXYcFPMFmyTNQ/XD3Ei0+AnWXJXono8UDp2MubzfZ3xmDhIqltnKD+WFq+9ryfcc
59Hh3rqFGYaYsP0XDzxpwQKY7wrONqLoj2abzb3Xz69xv7Ka3e9LvRuiR6xb6cAEJ9mF0x08ykzX
4InVfV6//C5oxSKW1R+i86kGDa12yIal8y+1v+u1PbYue8Ph7oYrx4o+Mko2q0wGvLaZI6Dl6MF6
tNzsknTr5eOn5Ng5C0aULo4KtCwooEkHmW9s6w53eclOoe07/D8p0rWa6Pm6oS9JYjDQit5vKSJa
F3uFZtwM8uvlGlf9wsp8GxItq3AgvMGrJ8Z5OPb9Q3HSUj6p+wB3Pug0CPk8Ae92LdwwICoIsuk1
eqdesX1N3gdCXFQpewFxW63CTs0i6VFok8W1WqPV0LSBSdcyHZb856IrCOunZGyqkizCgNILgvys
bzH1rinXz4VV57U6poxVMYYWR3vLCYOlJASjGYT56NcKGqf3BreVewckM+Dm2r3dSplgidWSYuY/
RuXzx6f9mgDAao6y0juDs50zn8TisWTea3+eYfNkOZwZ/xcoXnbI6J2aIyVo7f+HXOsEEu855Nj6
PfSkJ8SqVkyQ8R4Ry+1UiPECsi0NmrfmsbzqWSYcv4DE3zPbACrXXXB+1DTvh3JfulemGqaMIA6M
0MLwUYNB6ZXWOuJ2ocNMrNPG2dtP/uaLIOJjkeaHvUQ0NIT7pc8j1XwaGNIjFhrxPnI/tgCd/CJr
NzrNKGv/o2VqNJzOAGXrAM874Mc9TNJN92JOAe1lrNX/BZS5yElZPFpI8Po3xbjpJ3yNOx1+bFy/
ml1438ojQkabe54ouWiLIy6Dn5kvAXwXmpV+iK5ekR1Jxcc4bSba3fVCQjqlaFkYDAQFJNg/luyt
20OpiaCb0WGv4jyDFvLoxXav6bW/Li6RI8Ji4xE+GgJetOEt7tEP8AXhbJeCMz4Dwxu8RnsdcumY
dTZV1vZpQqLlttqFIG/YkFn7/ildeOPiKuGIRhzEyN/iY5QRdMF5r2hGUB7WepsdNAP9J6K/0w/Q
Aa3FGSRfB7a8MNZUc7IgVzeGT4eIO2j8KKw17nE5BKFpLiVNlkhNebEYL+Xun2KiLrwuCaNpYD6i
f5CsqR8NAYZC+TLivBtN0mxzD+E12mhaVXAgGh1rdtWaoDGt6FoP5mWGyhwT0JTP1KF/sIv9YyuU
ol7KgZDBaCnLZkVS7ZJeNt+eWU/hQQwrzdagJwI+i0aC9ruw4X8wysgSnStSLDZ+QqyYaEDMfWfr
VvPr8c+ZFYtl0H5aCUvK6DUawZvrfwU7AjTPZ61n71Crckz/Q5hDO/x+t4b5V+nz+ucBj+3yzTh1
wDEOFX5wtuN+EJ1KU6cXdd8VcVfOQYax27l8q9GO1aIwsVPwSgawOMhisJKafXtD+9kZWGTpkJI5
R7JgdNzkmwsBGVxE+04z1NRCpAzeSvW6gGIAB6LvWFO6ISZ/h+4f6BX7GwQ9iaq2GTwQxjmTPejG
PtLrAVcPImFQh/cQDvcK630QF1dTuVrE6xDZ2lmcnh9gQFvBgk2fALLnljdnxPKTHuCDNvNWhegB
sAH3zSx3+sX4IwH/zMLSdQhxNdTrM+ldDwAPWyip3URxSv6creppqC3x7qxHRIhEPlgPD01g0v2M
B3rlLzB65mFFSKAl2UIGoV2VdceYi0fUuKcMuQ6OCK6BQilW7CVkQYj8xOfKC0g3ycPbhwNvOqiN
4XJ8D08OuxqFiHHin5XSzR3iJccfnvYi9e3GF6KgFXFSnYjklnYnwH+qBlPSg6FrYXS3qkiHTqhu
efDT1w7gwK1ussmvuFot8Mgv9Pv4fLl2Qyel3DgCegmVHoR2bugP/N6yiUH2nMFX2C57+i11Eo2W
Qry6uvK7Etwjct5LOrIegh9wEO+sWlahIVbScsEVUz3KOXwPWDX+QnJchORPqEugEe1KIn7uTuGq
M24IUhmM2EuLhnqCHC/TZXhUJ2j8LRiids5qgliKSMIWxqjNHDixO9ESoSge3wHLhGozRhzTJo5Y
Vs3crq37AFu+zq4h8V+Uz2tIXbmw8dJ+c9iMR+2ZcNV7Gn5DnPfBQgt52fOdAvCo4llb7/HwdUYI
AmbuI6CoOWj0e7VXe9JLWES+BuP5/FO7XaQ37ZffjjFiDOmbAos2vdihVTCD3NPIiJVIOCkq5065
9De7HdZH5kNlU2i1tMeCr7dipXdmuXslDdx9LX39y2uFt7bGO0zSyj8+v2xE3uPJhliWhqqN1t0s
NGGKylOO8ze9JtvliGoGbVO1mCdzGTl/rSHTFkU+zs7nyYrupc8utdRmFwWf99Pm9M6V2kEs2f2t
n6Vbzt0yV8tAj3B5+eWWlEMksC9Jv8nBvWf+FqySOFyyp2JnRm8mIFGP/vFlKwNE6M8L1UHPxIgT
eJsohm38sSeavaznxWxn+bDjTtYJ1VeffH23545ZWrfxIuEAm8+yT/mIzN/9R95D/QXNwPGm36iD
/vxsHBo+m5WxtxI3/fIrW4asO5J/U1zkP56r9k1A/4fjPttQaPWot2/KUW/odvjXgWtX0mlw3UDp
HYVg9l6g4rrOdSR+YQ1ReC/s1wRD8eZD648V7JtJsQKfo4zHlhVkWVgR/BTU4WEgeQ44qKav9wCK
btyrE3pa5BpxOgWq9RmCp59wP7GvsJ/iu8QVzgnntbbS5I6FVQFNMJ9W3U7XiXKXp5cZSmdfin6i
ZijIE5pbKi4IERvAJJzm2J35xLCxd+fo873xG5Z/JvmbjkEHTjwZOiVbhg8jRL7bn4gEWh+Dp4/K
5XLIDS/yqDUykDPudjEPg/+W3Nc+cii5+j9E7HdDIHlWkVnc3TC4Pr49TMzf90VPy1Z+K/5jyLxG
gAvGvv064TywlinFZ12adVFEChlrDU5D6gh0djIa4lZTTotZAHLc/kUosvBkDX+EQK7UcI2jOmhR
IvK29rCe16UXoWPN1YY8ExuRa+6QCHsBlT7s1o+Sba6td71cwXVsBnBn09+9/GO9neh941bQkpcv
2ToIt0N6B+2iZXmtYF/2FMCg3IBufUfo2EjpzWOzIHdaTmDS0MkvylxmhHN1lXHkO130siOA3dwl
uBJTW3H+YiGMtm79jNzgxB4g++2uPR8cPZXzMzFFmft09UFg7J+POEfYK2A4Fw92L0ryDuZQ8yFM
3yOtkpsPKkmg7nf3o6DpDBOdLIaFh47O+QidjDMTnJ9yt3z47QN37/eN9L2ntpSwZshSWMxMiAlG
z9cKr1+FMKB1LTqhLVzcXh9k9Bl2YwWv5Tc3X4gGibFwtDMocqIeJcZ87wmTq3PqEFrWJQWpPVeb
GcT9h1OdohwuhKzyCcLgWLIuDvEZwVgpYf+KXzZKhj1mWEs+JLpxiOI5TIoq/urWCU/Q10S+nLgW
UnZcs/YYF3KnVLGYvaAxtv6R1WXr09KOIf8MUPu0tDlXmFG79OwVIHxNzMKFDgCmAzbmFCUQRLAr
+oIL88zoCjhAziDsBO6T18xPb7LqcmssewJ/7WmA8PMbjivY9mVKnYcQGmDaUE6h22qmgafvmwsS
EfZKMj5TicmUr8l5gaUoiR63cBQhFhHNYahlSLfDSvHlzn5LWwafGC2uKdHVtB3KVtwXc3K5KYrR
Szhkl8HnTAUuUmSAFNCaW35peQPFL1mli9h3LZV4NUJQRD9aftMZ57wQoTf7LqRimw8TeCxyT1FX
R0k+zjNjisH0sFJxZ0JNAEgHD2WQEzbkm5GkEPeUaBb/qaCrFOVns6IhTqLDNOkhkQRoIZaXDgs0
QpH4RF/K//BijZo0ZJlctTMDkcj+UEK+RBsoFGUBwqS6hrGBDIQRhyPe4mjriWJB1/ZyhXQH6N92
QSVxd28blPiJQNScpR9vlXckEYRojMEiifU6SzBuNBT6yv0alIi0uiqHDie95WHLp+xF2UnoEDeJ
RMmgP/yy9gavS3ozo59Xl8WcRxc3KmsqI6bntLYdYrsSen42mc0Q8f8V/8taX6zqAQbK1onIizSa
hyDNvepBHrJzJED/zDm3FrrpBVnEyIqQhYbRPFC655aO1X/aJcStjY6dgv9Jpe3RzQBycIZ3yp4z
BFDP20v8r/Up77iLqxHknXzFsjMY8DlVv73+8PZeOosCu3nLqxr2+kpveuUmkSVybBNVcGTStnD+
pJuH38g+pyjUQcWd1qfAH5QLCFSfrpoJjoxyJGW03/GzxVLdtx/ecAP7yMjjwRYPLhs84pFvJ5cC
2mRml3Bybz5+2vpKianEQyKTncCzziyrNtVJ6sZW2klBbqzA6N6J0muhUDMDxmaSc7ud1OoS8Ym8
DA+VzS3PY9wH7DiZHHiD9/4hLFLXwTECRI235oh+rXzO+ciUctOpTjZP4dZ1/8Q2N/CqTseIY3hJ
sO1AftsZVUHrE0P5nAsO9fsfrcUHxgHQLomZJzezDXktmHjlxg6afaCZt89bak/mm9UMhFzI7qEe
hDclfrHeixTkgg3/FL5yNAuqjf/JbFYlmJvCrl7V5GqZHxkMcMcmdkFbq+G8lvGPR38GQNM2fGcs
wicPLJe7TjY1ngnGzLq6m0ycShdLibZo1QhEOjQT2jm5ShyuK6cVsYnbYK3Ejpx/VHU4Vp/DSG2M
vugG+pzQEcRnTBvQUqFZ67IOUmm1Pap3BiCc+kJP76SR7UjHpLxT4sJyJAIV4vLJIwAOo8Fda0yw
rd4qTUaQ/Z2t2TV4kCTRqOSM6dVs/OFf5I0YudshsPTBRO4z7N40z3auoPdWpl3XB4AJJYZTle/D
I6Fn9kpRGCBW6ihznT/Kk0zAaugohhlcdTorAJ5/TOS5NRLzukf6eJPgcbnAO6aJCZF2uChE0A6N
DgF2m2t1XVT3Q2yUUf/nSSY1hq2RsDQCERD7GlzVmnhgXE4lmeobmYyB2hYUprl+lDjwe4qdmpaG
xDBabqJQqt4rNhhpmQlJZiZvmVu/ZEU8Ui/1a/ZD1mJEQYaKa4+rSNf695E/dJA9XjuAUQAECC3W
693VDOUUxMiircrTKIih4dQ64MGlaer+4iINYn6+o8q70jIKlNkOwmev4OX5nyj6hmctl+YNZQF5
pJ4J6WhgFDuJiycXjJV2+ngP40HPaHzaUcmUu+3VK6FJGa8CJHlbI91JG+NgpfNe3rq7aBQdmjLq
+ZgUPgwbsLVMjcBfP/gwDhgU2XbILIyP5CdBVlBDQ7Nn7dHit4oZXD7qku8TdY5QbBphsW0BQazs
FEHan1EtYC5ow8ruqgoWi8n5SgYmKO70Bp4DhRKFQpDkkt4i1azRIBfOMPkGGQRqWmvaM9L7MCCf
pVahBD7oCU0vG0/gAfLGhXnsFPXfe2LwgPJpmowOHERO8feoNEliTJXzXHHLNSg+O+U+mbnHJWlv
s2FR9Qi8W6FWhuPE9XTXczXJoz5fxJ6Nt0voOXPINi3jPo1H84wdlV4Xm10WkLVTjEdJYpjMPXOD
mdmtG8eCZ40ScZMkFwK8MqCKPlr2o+NjvARyFfWwD2ti5Ra2PW4IPCgVvaLbmz412T2Pm3EhAnpw
lUExgKqvzHhNqv17D5lIna0tPBtCI7ghaOzABrFXxUFX/zZEfemHtaVMMFaFGPDezA+u1N0hQe6v
azc6wmzeOWfcQEP3fhjFpv86W/SHqW9NoEOgX/c8pM3svG6m26gaG22ay3AfAlmTKJsOCsA52Qx4
l9b8Q7bEnjI1oS+gqBnzuQNFQJoUPNiK3HJ/izv3ZSs31/SB/ZDApBo5AYMUkkKax22UvycypEay
pPK2+WJWXjffZkljysllHBGUuY/nQgSA+AgQD8SVShxqnue563dRPC3qWeHusPSAkpM5UTvGZYlY
6yYAn34vYvpZBT8X3LjqesImSC9t/9+cXmojjurgBwgniSBanQvjET++nCu27MZLdNmzTa9kfg/k
lAIX/lde/huLKhUXLvNZBx/AAvyYHklqRJnt8OmuEOF7n/iqIKcFiiU/dul86TZiD0VCACABTRWi
NSSi/i5cGWOYwDXEv1Pdu6weSp8ZdbuMNR8kwkps4xAOWbe7pjicn4H+HH3eSR1P28gcydIQDXtM
eE1xh6v7g2kNkjmJHuav0hoC5+pjOc5jbN54vUedh5/vEXADVl0CuMOSh1G1wW8mrOfHgWg5a42e
pU7fuhMy1uAe5fZRwm7VJVUwtmS8Q1yYpDYLgDT+qf/ng4SW7Ac/LeUsPtBlioKbyj0CtzSYrC+I
tx/FxoDx60BCPp1pwDQhnxP6tLI8b7diD+TCOp22coOBBUAPkNlJcvrPYDvLpTqvlZnQXTGjIUYQ
2lTOPW+M5yZ1Dsue87SEl0ytvFmfqguN331Hbl+1y47236yG4D4wOuRYpynbIaGIHSiLe6ZOMyLC
DQTlO2FSRUsL96mada8fkweSNYlN5BspQooxwrstROhyIAHsAF7+03LsDXXNspFvKVwVAnETbzNp
5sn9MXpXj0IiJmAG8+/RCAIPlSUhkQ+FTOeFbB92pNiMwr4pPLN7h2UjVTC0H0JN37L3VFdEXKm3
17X8qJR0fFww5/bpkavBKi4ViNd5alOqVWN+Tol1h6YmMJ1rtPSABeOEmHHtRAYhChLx8WnzSNoP
mgHg3AUPnlVLS/4iZ9cktx3eUnpjA4RQEr9ngFoJQfKmFp89WrYmQVfK0WtPjSHNtJ+hmISkaSmf
grW0JifLqJ72JZyNVlmR4UXYfMc19wugGpvTWnM84uArkQ5NLFNcQDlKLRnsCTxAHRgh0cQK0b3I
Ph9uqQ9c97Pd2ztaXI4HyZJclaGO8pjopJFOmTR/Ot/zAimgyHrkFOwyqYLzJ6J0/kWO02Pc7ErP
klHAYIED6IMOgMp/Ir7fxiaelea/P72NXpQ1CdAlUVyDX4zQ/2H0DKIgxh9t7h8Ndc0a/3elqydT
MK1gFshsR1n14rpeQcjBdhcCdyfqRWyq/3pH3r6AhC+XQbbvpov7XGP7vbqKGgsg+n+QRv1QqpQ/
8hnr9lbwoDUqmJF5dseCyvys8dGJ7RVHGld7dlTqO97U3eB0latctC2srXNS9kB2GOa7yE7EuiFz
3qf5eTluK0ubfJ9R5f8zWedKkHFAf7KNhcZJ19R0qyyZcPgfwFcIeChLmqJE7R5PdmwXEPXuOswm
TyusJRGHnTzm2SY8i9IhDk90q4LAjvkAefI8FTAMGm2U4Vxlsbvs4xHI5GzkaobpT6f/LGBigob/
8p/tVJoFUFc4JTqpNs4IgX1jwbKjm9dA0se0mwg+GFl57uPnfmp9hlRvvb/1cXUs0hJah5aV0Md5
KgFCyQeVrQOGkH5130bulFf0v+SxjH50Ds1+Zt+BJMjGvNFpJXQx5Txb9+BlhDgCvBIW/5WR5m7P
SyXOK9SxEv30FbkRvwfGlI6QXtflg4oA3ybT1zC5xm4zCa4OEP36KCATcr4i5bc8Iw+egJEc7cR7
sBOSMxRhkzFHOJmNI8AOBOOvP4hSxvKXJJ3Icjv8svBeL0Eur/m68GGnzoqzf3UyzKVzJk6E6Na7
GLCC+Yh5hzaSyF+dHHPhPxzMdc4/uV22z2ejYwgjcURaF4AQxN9/RbxypkXnKTQjjeTbWuzhp7jH
QCQqj+yJLPCPs04wGwKxDvjBZ67mwsIAKXvxzPgmpsvG61ZG3F1yH2saKCgQDIvCwMrWK4e1ocwE
XnuBWpUJNfrWfpgnFl+lJfLmS4LY2xWx2YAve3A5mazmfTWzk109CHCyr8YYCafaIIPaXKN6NZfU
9xTWad4YlAFkxcXhtK/25/pufyEcrN5Sm3RX1jJcvCYMh9kUjQrXxe0fYIdriUWsnLDN+aNwnLBb
RLvcgVj9uUeNJE2/mB/L4XjrsE+zOSTXtrR9dvd/3O/Q2vn9HQFP9N4ByGC3v1PEQWnXrI/g1jiF
WCyDb3onnH/nvN51QsOysobRMleOoFxZl3Nq0UyWsKb4j/U650IFB0QS5RaOdX+hsbNzJPPHDBh+
pBHo0iYEq+njnyoMkzpPRioGfDLGfcMgqDXTPXO7k6Im3wrNgdwLzZuUeaoNuGdeZFTnBzhGL6k5
MJOBAk9kSUDS8hKJ0y1tS3oIEqGfZkHD+TQegVZkxc9SHApfUlqEjoITNUaHFcUHGWfDCAL1e3cT
Cf8lGT2x2vDp3MUHPLuPURzThVYZ1d8Dg2AqiC3Y0eWX+Y8PPHl5rB6v/q1yRLnghWV1BrHy98mA
/iWyfAacSc/h0j+Fvc1VF230bCcJ+iAw/82Mwi5q9Uy4MUUCEKEf+c8z9PB9G/1GR/nlnrpBI9GF
XFQabI5DjkezWBhrvF/Zw6yAafVxnAY8wbzQ4LfDsB0EkQFAKKEgTrNabnOK3/zkv3FHEBg/i0k2
/CPoN5w2tSjmRsw5BBNUfstGfCbwOdC7RFeas53J3EMGcaBQdOFUx6WD/cuLczMpGSxs8tudAvg5
L0TTVN/rNv17z4UCqNAxVNF+y7UGtAGuwXZ9oCLTTaOkodokwqtegul6/Ctv+WwCmqiSewGnbbwW
jBlq8+GJ5/FBM2Dj9zZwjkJ5gDH1SggwTfT2QyPMqjGJGiTlzgeATyeStuFZraLMqkVkhWqeSWfd
J2XEmELKTXY3g2uuXoRzHnIBarAeJ2Cm8iG+Z1vRjJ7OhkxMG075PVJkZL1+G/DTwcG4O+4bcLQr
hHgKdJ3u/mC0Q+f2w1rn2heEO6arxqd9vIsero1FhooKBmVHJc6LTGhcdot9LaURgLMemEFb0zLw
bWA41ywqwORvBdG9I3ml0Aq8ZJM60pifngrtYEVvr4zrnqi+KKMDM38fI+rODI/xWW4xYLbuyDQj
R0aToO5Ofhy7VSNJGSvYr9reXC6BfmdcPWtZGyT1OilXpX2iL57ZQlpp1657Fo0U5qhGFf9v50Px
J57xFwO6ED+s6F3mfi8nGbVMPHGeCroF3GCinin/p3vzbn7PHNFJtfx9rMABWdqYkiIxH621jff9
dlOrJ9W0E5rRmpEOPaAtYy7UBwoAgxnfK0uGXyVaBy00p38OUuDdE/OfpqK1OrgRtGpTeA17QAmw
hZuK993ZNKU7Jq5nuX59OyXq/AAmgv/RNQNPm/KfoQ6KmomoGMvUSn+zqKuu2Utp9iLbibAPqVz3
0wnpskBSLJ2X0srlyolbhGoaj6Jx+IalgPSVcb1LaASRVHcE4r9wvpPwpwKG44dTP1E9kygwUPe+
NOdbONJTd9Jr288tNNO1+CLLJuzL11AOYJpBzivt9IcFZdyqWKuvjpyAWjtMbkcjmXo5tR9BHNfQ
TZv+kGUg9V1oDEyZW0KUILoPZz41hMMBIrhZPCStVceQM+VZvmjx+jbslAFfgJ8cTSbhK4JDhNHq
ynzDg9ttAPSOZTtGcMw7Z0zYk9R02JS8S1nhm3M1PzbfQFAEZ1rxjZiZDDoGGGS62T4wfwj1EKaJ
6ncA4Vrn53iwe9/XTUUZcsnTnbrDYd5GlPmz9+s2766NHcSpiBiXY1HOIZ6UWLMRoJFJQHB2y5ie
AUi4WJsnZHiAPuYD9xKzOWdJUdKi+yY/5Svxd6J0TMckmvIIevWrPkR3SE4SuckXSydgWj4h7qH1
FqsujLdRWh+HJbr0PXpOpp8BaLAefwJjPNv4Jiksmqp7E0mXBAOEVIcvl6wpoIAn33UlOZcKejPy
werdvE9nS/tnGKxBAjOqPlosdG/0EtP8x4ZSYTYzZzcOzTWGDKvBldDp7e8HWwdjruyJIDKZxMhJ
xgtlWAD/M957l3yG5CQWIEucbwkZMeZA3M2o5HYXPXbJBvxbKlQSBhTuRjvgcQGPxBlXIdIPDmHM
ezND1qP7CAXTyq2kXaLxbjQZhQ9mbvenzCHczPQbPhNm6enEcPY4xd8qttoe72KZuyKDMlWonglH
DSqwZusYrjklOexGksGl1ijWEAmt7e/530CcYmaXu5gsigmHygg4zSBroc1bCzP8rzEjaBCSteQL
Qz9wmRL5CFdcgKI24lzht/wh8IB6ThmPnf8Nx4YA7ivwgF0RySs67Gb9tE9fkjMv+p6wt8mkupsu
t55dn7VsptFPgZmw2xUSmF1tQ1/3fhj52wZtA+45XR7HqDl6pJ49bNT1RyUBGUBZhdSgIJILfHgL
YwWF+IwRqeagzwe7Ldxnf6D4WcBs4r7U+EVGfT/UufVNiNiOGJMHI9hS7Ue/pMqlI7r+BLqjD/8f
qjfCXuQcsjNdcJOMSN1vulu278xY92wOnDJqvmg1wrdHW/CaQt+8Pk15uTQHZUbABN951UNbOJBQ
nyeOS0om4gAMF6MlcLIYN3qpCTQkAWRYfzkSGMJdI3OT+WZjvLs0GyA57HiPnkLXu9aVm0NnRzSp
2qRJ8rUz+3HlHGlUOpfcmM7PYJ4zlPE+UCXuHH+Da51D+td8fZdTjlJXMOfPhtq4HuVxjjggC6/Z
1uHGGJXCymnoAzqV5U0xLP7LAPw9qbs1u72E8udoU8OBW9MzIT85jH9r9BGqugUgvFrgrHd3umSt
yYMK5sFCcMpJLCeVMAK1SP16yo4K45c/T+ajmj6MPWoJzF0+VdjNQgUDRrPc+8vpXjzvdGTkcdcB
6phzDyIsKNEsyzbK6VdyOtBxNTWoRXOSEvZfKf2/Jrb+EJnYMueWyJ4oGlrvwB0nQvIqPFA47gXo
esLANOXQSnZzXeVQA6RMnjwUad+GB2IY+6aqubxHqnUffz+nV65eNBnumLFw2k/jM5coFUQaueSE
VFmbFtTNSioYA/Gf4qKk8XoTKKsd7DRFjtf3+D1gHFBarYZpFuVsBAn7q9sct2SPk0212kvP7y1w
YDuSlFPFkbi/dD3QXQSjuxtj9lz0ivQTjph9ZAH2nHQWjY6ydd3CMk/c/nB7dFQBtsqAg1+V0C0E
F+7ejVSa2vCjkcEswMHMwjVfLlvZGKIpEhF8nKj8E8ooXbNfTFmYflVYD4Y2Cn9pNiR48u2/vw2q
67I0egoNE5pOsLOrQOjvwq30w4BsrZnRhPahwvnTUm/ma8sGze7f+AN0f5JyRfrDkGEuMoReMfwl
92Jn2RVkFO7xdF5jc+jeSX2fJy3PZ8YC93rj2Naqs9OU9hNvREvFtGzfDWfkwVGefnelr9BTNT0K
PJU84FVjS/L2HJYKARYsdbyw9k0VuPiODbhQAvjVBd5dBH6mq8SG+DnrEC/HDhbqe9xYOBGOzsbj
yD5KHeuJ/fRq1VKs3D1Tm3uyWNJDujPqXIA8MouldyqwvMtV44yqWElVrMLugKVoqK9YRf41GIzG
Z9uepcF/pQVCUSGMpf2U2GCXxUO3AQhXNySiFDTNXQsNCePiD5x0GVS5qhnGipXD11NNK1sJD26n
B6VlM09iWgYFgRjcVq6VkXeBqCx0FE7jmYdsm4tWclWVs6/b5mxQUffSjfxu5e1yZVOUIlHQ0Tyv
xO2MBa105JK7PQdzusNK2DEC0wvtE2K6DVLsw4irpH8WpAlkCZg78yspVFatsepLYlt1g+5sHsoY
NKVXoEfYJgNez3xXGZGiuphpetKGWR9v/baNsHOWdEgeTBslwW4fpDCsunwMSz+C56RL3xY8MnFd
1ZKsMv53z2pVd0U8yDpcgr2mQtvE3KzPnuX889yrjDl3aqajJcnS5mblmpLi6ByLkDBhzbjdEgFz
aSPI/qR9RpzxtENBho6pKxIGMw9VMlUgZGP5e6kb9KbBLuQBBhBVGu87m8gKw0a1DenAbYSRwi3e
NX4Lbswzeg2DFcDU+IEh1Kz9AA/wpVMsmy+KhClHQpObbhlOT6RsLjgSbGZ00F6CV8mCASw7SLQw
sy+JQtM69suDG/lbxshXsRS/vQDKjTrMmY+xSWRbx0zA9cjmGOm8ovCuagbma8I6BNBlPOAJLZzP
hyx9z+icToIdVap/JIF1+18GfRaQPJwdQ3TS0ywKNZqlhtUXw8q2geL99oTty+zxpAhAjcG6VVDQ
Xx8QF2ZFHDmaEbsrfQPwRGebxdopCccvZErCpkvAKXwWeP40nvdNeOvGH8rDljRSev0icdhlxxhj
92qwZwHFT6vknH2i0E9TPAvbumPc2KQGSXbl9xco2nT2GdjM8b3ay+DzA9PDXiKswhAW9RiVV5u8
F8EOLMzCJUxyR3jrofJq6cX8nuo8nY6Kg14P0w27waYqylRISgUQjU5iJSkk+Hc/3Zdq/uExBkP/
EQ+zneVcP26u+r3I7RWncMi6tT6TKSVHO9jAt9hSwXfTE6j/h3HV+65XwsVOhPXIUrKpeeQShlw8
+HVmnuNEYdnYvhw9aUKyiOfMGqiL9ng7Dh9S+kTsMihAcwFmMbgstEtt2Pm28iVr3jzcp/1uvD3k
z7CsoXb84VbWP6s9bcGCJtjfgW0ybfLT0/nNNfLibivayzFAmQu3d5iZAouGEw0IGczLwTUeEjm8
0qRdq64KFHfUPAyS+dPt3nVb3l6ZlNlmSoaT1FZAaDIgVh4nnxzYKMaYPOVwmf/yRpXfi+8X881M
hJqoCMuTc0DCV5GDYFutMQ55aHSEoE6Rk61umKASaY1/lgkqSySeyDlTeU/mVlwVk0UghCODlFbC
WRxYjgst5LlAgnuXlXiB1fS6nf2CLvqo53WPpalCiBXNZuBcVS/sUE0SBgMRz6rkPogZcT2+bGtH
FPy4UoneuUGz1B1g50mWzV9zXlANyN36TBar+t3Z1/aB+IMGIWBd8ATD0FRJhhcW2c7Li4ZRa4D2
w42jtOOrNLZ0CThAAo7aGlH8GRg33x5d0j8JlK5/VGwFFck76erZh4oUOAsAmeGKIi+d2pthLf4N
2HjDWOiJinRYg4q13K6qBQiAX0B3kPVSOf+W+8WWQSv4cleWPqP0iQMap67moU/UPQtOFy8C7SOS
wm55OmFbXoHFtCxjG0ytO9HTKRoYoxWKG7ta7NN5P7LSCwC0wddCW+XGh31z+azWx6EaErxbl0Vi
eG8k1cAddJlcAR8cJOA9cn3QeJ0gYT13uqija8sEdKX84++EcDEKMqy4CmYSiApDvmgFv3TITXkf
9ungu9TlFOMXq3BaQO9bWMgLdTMExCAZXtSjsVDPek+TurP2MRSZPMB/T9Wqhap0JwpIGafRb4Ob
Wcv7woQTyqZdclDBKUdZXhTDLfFHon7X0haq++F2jjiOpEU1Vtcfzit/ZdWCV+UfQZ9fuBYHJNNV
zPj4wps1gj7zbRRc/OsBeK7+RMEA8j0eQrDnaQ9HemY547O0NDGuJTmRXk04NEEo5TuJatyXlkWS
B+lj3vscc9PshKqi9uhKdnhlNS8neeFZC4bVm+daEeHFnw+UXz7EdOPYccy1I0lXShnOUs8dpBoM
2huY1lBD7sCzAtR1uGa5vlEItwG/8i68OJJD8dSNFMQiKY5AgHrkaQdUcs3Pa32CAM3NMg0IKgaY
IRxrKE975tCj4+lx51OCnaMVzOsNmqmrseFuwMxEWt6cgJgn47jGbf7Hoihfg9oO+sVVHy/sLOXE
Vce1pGwaeJe5xuxBVrlxKXtMPOQf2ePvyuGrubzm8DlY24Kh0YUBS3x7H5/DRn1UsiT11EhOc1EK
ftQUgHyAIva8Y35rbk+wjl/CET1kvlyY3O9s+sM412/aTZcscvlwX4iLqTNsTGetA7MTuUGKRc49
nbXDNOX7GfsgrrCSX2Itv22ZCg8OkW55+0DXS8s+pkueCGyegMv1/QibtWVHX/vfav0X1HoTT8m9
ZYXYaN7zyX+ixW3rRJZG2yJ2wE+W8QDpqPKutC8zS2CDPmHt1Isnazf6ud13HhtP4MqYWrDOvAK1
Kj4ot+gPshuZqZWpXdQKMUZ7A8pf2J0cJ3h9obQ2ZOS4ZlpRC4ydOUZsi0OvfK74QzYAoMABh4Eq
SMkq7TdIhei9saflGWM91v4OVUmIuOnvLGxc8jktWpbXqZd2fm2Tbif+WsEap8wxj9TWB7JYZHks
gYJxuoIg0cVjI9hBuFbOJ+n3H4FX1NwotsoJzFhwP2wXpclZUokfkX6W4mT47Nwc4oKzZT9bQB0O
9l90OG74xSJpVc4B1le0Re1rzK2VNjAT0iViQ1x7oNRvw/okCF/YNrXuQ4TtCNeKPdB3H4WudczU
FvA8nD/HWtRfKpgIlDfgMTS2KU+91DDbLWqLYud0epx9iiOOOx9py10985XdZyJPD3HSa5NqngJE
SzvojWCom+KAjRLDvCpb/Nw691M1qx/NmlK5U1h8lcz5716Za/cajm/r0Dyi2BU3HJzGB6/gFFy6
UMq291MptqN1W1+y7jZ7qFISmK3zBRtlRRZAFxWQ9LhkWKNwGJfQutdN/9G/iiQhGYuc0AqrM3j4
SeaTEqkkmEu1gNVD9IZiaPbCuWVAGLUyucMyo8UDCxioMNuEwvR5DSLzUTJqGTGmbApJ5I+Qwt3u
I6ykGsmsvK3lOkGhEBpmFiePMbt7GSwvuDMUuCXOzV6It6n/tRA34fwfkCfPVZoRXX0Eicj2koTp
DcnTxYo6iR6KWl2be0BcYFxIhqxHg81I8/ZPhZE6H97g0Rx8/zRdx2p68jcqt2ZVcS6HNWIWAxj3
AZX36Zn1nwdEpzUG85nVYw9yNU6FiIbszmLHaa6/Gc0bl/TN/mvLBk35f/PXY8nCFy9nGiEuz6hq
M/hJZSNKCmn3jXc/bWJwS1eUwD1kKGTo9Ee4cTeuz6XW5SEpzRsgiuZrHuH6pnQhwxwDq8OS8NWu
PbySFaKI0svkH9LICFNref9TrOiwoKwSKoMQCp8E6cd9weeaEeag1j59FfVmXte8o3AG14dUyQ0Z
a8YhrLZy3t6HM5geYLeXA5oV9XFG8LmRY3KTGrg1zROQ5x2l93GK7ynkEWVQuORzP6dud10C6JMg
r3EsgAwG1YGQ3ofKt0DURATMCiHCL6gkDdIXJkOde7j1HVUEd2keaj6ofYgSXyBtuH8CuGOHvFis
L4Lyc9IADnBs0VAIKPx5pYQBXeqRhWxXCcx/vbYxAS5B5eOUOkRclWWhrTsKKubpWy5SOnPrx/KW
E3XRZm4n+W1EQUhiJGHdnMfCmNz39ICGfIpM/vTm6Yxml2ECguqREe+yhewDxpgnWTCF9joQ92dU
yAfQYY5jKZegiZVI3mQOjpNgyNNhfeAXIAOoWS2BUDuN1JrJHRwJjEuh25RK3hCosHKg3E8ErbIz
qzEMKQ5GwVcXbUAC4KAst+FpWXK9jG4P28K/zrL2t/LhsM81AcGlqIq9iS+LbXMZjOVVtdhi7kJ7
BEotGfRJi+ebbFgZWaoI+oymPRFSlnLTUUaCW9GSyXxg6Z5aG2pN62p9SW+B54Zx4Qn6/SZ5NMJ4
hFDtw88BsXdTwED/uy/vKAciuezRNA2lYUQcWwm+cND7gLwfcxu3qd/GHUsqFVBZe7f8S5ElIapZ
ePEvE+cP7qal/bqFtJEyDeEVhpNVC/ZR0bxRdn3CRKNcM2KKVC3AeKDIWp0ucbrf4/rHptWtSRmD
5+kbyTkuPBxFz/TWb1ncVutXonQg3YDfH6Sc8cTUUcu00tV6RJvkyllTGM3S3plYYOS8qDOsblGy
7PQLDswzbelPD0AzWoffq3d89hB1cCrQxeakccGZxlxqQ8BQPoQLfZcICIak38w1KvowGiEGe+YD
7ZBlmLyxNF7GsVlXahltSxsRBl8BTLYZiNILdbg0AVq5iRwKUfUD01G+Gdd/7yAtkBRAveAoQEUx
MmPZuXyCb9kBdD1CEOR4hNTJyYoZs09PhDmcWoxWasa1YRfOZra8uTIiWBBOKu0ZvqGeKr6z8U0l
isS9HuIHvARpqZNV7d+t6plU3Kfd9pKr99mEf7g4XOI5sgWYyXwh0yOZ+v5R5PvlDu0VR6ZV2ORR
tRjg293/vqJCtxsi3TsVwvJGdswTbqhYi2Ah1wjOW+zHuX1G4Yt8Gv2vYC91yxlaorYQ8c0E99tP
Q/ntb5ZqBMISSkQrePHoOTDgoa/7StYvs7UCvOx5qHlZ/n+ag6C6+wXTNy05caVV8zhuOOQyWGXW
xmSWlou9WHWq0axi73i2VIDhHrpmXiTlVCN67/rj6rK9LMGmvyrYObTSmkfLVWPi7thCOjtjbuAM
IfjZ0KT75BnlhmGP6GD2k47ArqDZPOGfHTyYNa7nBniV2CqkVVCNAlDRaiyLmQ39I66O0c9RPRqP
iDprzjtvtOD6We1TgbQ2dD9lnEPkApxkvx29g6CE6Pdc3gSaDpRbXnSI16Y/uV15myeaA5Amjn5r
uABotOMCr6WJ5jhRmzXmBa9A9D9r+Tbk5cPjVuNBiw6ugt/L5EXt1fJNf5YFP+grkn7xX6TUQY1O
AH7fDuPfg3m7sW597Nd26qDbUzhtHel6RJ0VuP4PPnc/n1JJLNUnhsF0JtX4fBAFn19Jff/aQYvW
aFLx0OvTNHVUzI4B7ZE8OHrSB8UmZDXEmoCcFFqoreiLTnrPy0XVfoEa16Cpm16jzZS9ESJABD2v
Etil/U6ILUIXK6gQIljtDrjHmlk+UmJ06NypHuqWSBTYE4PaX5ShGHo4GsDkjQPGhtLLCax7lKg1
zQCwG9MSv2MSZdHG1LGQjiGSdUCNYx/6U6/tzLzDXtkprjR7KclPEhH2xyYkfuHjLm4yIyCvwTAo
KhPMm1DIft4FwDK+/RFXtHjCqHH4fI1J338JXCTH8XJhKZXm50XnoLul05jgjxk3C+WkyDJEZ+hY
sfp252wmnekCymg7JKYsDZldwr1De6JrfPW7BEF1gNioY1BpobSnw+GTI/zcvDjAFyYGHWq+btZm
ewtH21YXXxoybcHYxgGh7/j/vgewiq3nKX/uDh2Ew0QrR1u34HXtTlezjIBPngO9Vym9Au60KErb
CEqS83gnOlpNiiXtYWDBCAj2xv0mar0yWYaLWGKcZNdPxIaFpm16//RYvV0k0ZwtpI4i6UozLnqF
b/4wrwcfEny3oVJalS0SdMdq7anSVSJprQoSB91YsjQO1eNtREJkAEhNAPtZZT8aiJVRNi5sMzHd
UQ+7tZHgSn7CSbwtQhIv3hkCaVxAAHW5lJ3HXoPUsDNrBuItS9H3ObaExKmhhAJIoA9hdA9ZFXW7
7tylsaoibLfDax52zkx7O8bTb0Jtryacawu28ni/W/1zJbX0E8wQQNaSPSWBDfbJVEROgn0morSm
ikyu37qdUQBjIl3s1lxyY4y1lFkoy5VNbVPiIteI0ewikKxWDOtoMvoJPvFXJrf3VYa9q2VLtTWC
EJ/8R3sBX980HmtdIVWn9T9rSXPATyMXQ2uiCniKhQ6u0neLt3cvZMdWr9gy6ii/An0dEmVk/5Y1
+bHDYMkYbFmfNorAqXNc8cCvdLa9iVmfKbbykhcOk0b2I8vpqN4pUmJXwYS/RrZ/JAw76oBLrGSy
obg98RsRvudzj4QkoRFIGubX30kulP4BZ54sRNxEbpnNoKKR1zeWl31hF3aFnQ+V/B++nNq64Om9
QNhNJhJZ54la56Ytvk82StJCuy5XIxy4VLDab78u1GsUm5w+x1QquLmpUWrrW2BQ+UDXQLnYv/GD
0yop5GpoRdnUV/hcOV18bDLUyC3xz2LdBNAMTPeb75jhB6M5p5v+Yxhj9WHWIIG0lX1Fo3IIO1x5
D4LgrVJNOzltVt88IISq6X96Wr0ZJqwmX5/wAh4OBeufCkXuiyPdksJS0TTAsMB3w54C/BhhEgDb
P4/dReii6mE+17blx7yCeBySsY7ksQeNM+WU1n1NDXn/UZgFk3757Cz2N5+Iw/Szi7y1Zb/2tXKB
39ZZWAw6Yp5hqRn9vL2IlKIacsRL7jMTkAY9lBbaB/Mg2IPMbUmIogZNPId//KzGv3Pv4x/TfXzh
cnZH4Mwo5jCpwcIcVvGDlHzMSlN/mxbyetW1HGDjuW1uMG7x0ucUtLx60ptQ+GjpusFxOVgJV6TX
DDv5jSh8JqXe5f50+0wmtwIIMtfNBHLNhptI4smM7IJ8/hdR2gEZYk4TO27rfOAxcuLC/UZucrSN
ARnLgx5OzfYe7En3IQ6kp59QZWATLZ7QenLHFwpkkpJvbTEq2VOsf3UvZbjgxsPiYjuTs/ivgXw/
59fiGE7yFz5LOSbVmJp4JjBHTA/XHfTQP/0QazxCkP21KullNCJoZBGNY/0CYrhtQOvzOS+njyvr
DHdqkv9XR+xYCY/GJIJfacJWmjeI6boLgt2ezUu4as2yUPFb+FEUhKRzAaAKg7tFouuX5GMt54Iw
vwrtf08fGA+je7zkiDoSoUKM8VoviCotnfL25349PoQ798rR5zdS0OX0AIgCYK6EthAWaY3RPXyk
DhqayKcBcofdFXsQQksmNdl/Bj0uvqqLYztCm/A5Gkl1pyHMQ56HgBJLxXgW4WA2WNPtk75Tb9UZ
fBvw0a4MBFUztVim6eD1nUz8wUV3r1eaa97lU9tKxVsYb232rpa9ODqFr/a0NPtwfy6rei00wzN3
sOId+FeKjA6ED60x1eppJqtdwB+7qWjcCAatfzEncKO2LKDmuAQsWVUYuvVQA4tIS0/zIW2OZl0n
92B2e5coenxsgH/6bPXvquCHN0spMf+uP3RLMjQkDER3zh4IZHdsCK9P3uDIHiqPG9OuwzV0Gx79
aaI782EM549Pmnh8aS36N9tfcinoG2jRX682+bB4d7VMgSFNvXZC41xmIHUIB1jrOsFU1hu4yIad
gFyZisQHKkGDNNrLZE6AWpyynP3dSRj84jhyWU97QLIFsPcmd0UyiZBxdwlVe4TcpJ7kS7tJEqKA
C0f832SQrKhUD/IriqpvpkpynYeg3dDs4eTSwuQLp21IQvPen8cU6DRE8YwPBMMO4tf2JUePU/2f
0tG5vNbuW0rcXcOb3X1BPZynQs4G4VQMh2S6ShXCAACPy3X7ufpjJ1dFtKUpxAGEJjqK0s/aQE1Z
qvyuD7rVTWu9Dmr41g1OGzRCCBtXvSYzTd1lKgvQuIyRe86mDSBJi/qr6n3IJS2FNhnzjAg+Utq2
249bx94txhs2FNJ1jZRyeqymHLkVWLvUzeVd2XgHkjGXQi3JAWfEI32tBQ9poFEzj2WQoijU1BJx
OwCqq0j9oij7GtGH84xb3HY7J5jD+p17BDZXFKs1jMMiqGvpUDzDCoSsjz8EFJtbu9WuOCvY+3n7
vYjgZFjxIaP94O/ec2MCJutYSWn6z9tBtd/HIKgDpjsByAkiNW0SDcSOdw0x3mfmfC8j4FNIQdun
0idecsP92J8T2MHfHL7ybfqJqx6Viy1GFgUtRk6eKOUFfehu7Nh8xBCBk7PHbIYDWSi7xb8yxq0D
77GZ1PPkVa66EDz+NfwUQVqDr/PjpHYv+uf2GgRE8r0JRaff9Z8LKYpICh/s2pR94dse+1VR7uk+
xMB2Kf8k4reSlE0bfLzYZS7uIoVSPwpfN8xuikK8kbiZ/TfkIqjwx1q5RGb2aSiSwbN7Q1SfRJFo
szF6VQETNNoFSgQE91chefJFZQoyuDBi+GFw6sQW14fVEnLqVEwTnscI0C51Vb82htB62kPqut9F
WXENypNXyEMP4YQSoDDHIJxiUFuzZItglW979w5vnofGqhxrx4nO0Nf9V3BqcovMOIMDKXFFymcY
tuCNSXobMdTOiU9cOwhH0x3NjusUiFyV7OjU66sVPrixdViait/x4IcI0Hucuh88JvQSs08m3XM9
wnkWvyRi4Sn+TQoVq6MvpT5uW0AICpyOPzOrIiWDEN7jVp+IWhN96J5wYNRcgrqO2oFWB80CLWon
EF7XctyJqLWEugNIxwglKaqdfJstR0/7a3Ye2Ug5gxfTiBj1zGE3tkxwCo2JKpMHysFfWKjer2tB
4Rc0yzjbGlmBWyga8RTuE8lE+SnhUU1S4Ygij8Z5iWrLmPqKtamBAY+kS+ASL9g0FkIv0Cm6jlU0
EspTv+0bubPKcYSV/OXId3AKU+A1pYffAcdsgpKLOT/ef8qC6ARC51GlNe1SdXLTzL8oxlhd6kaH
DuV5KxQtJjMfk/uPICyS6Wg3dlbr/hU1SAVAbAZrl98G3RuWM+HqC8E+BBu8XcjI0ZUx4v0Oz58o
+zvHt9dNIARZhmCAH6kDUvBefZ97fPvGrghHef5LGVyjVNxjZljbziaYkdYttim04eh0GEksoG62
0x+TIVqbIBOsOqmnGgxrp1rlS5JnQPjp5Kb3LnEYuknzq4xnF1wyXf1MSrGZp+21N7VVcvvAbzTv
LOB8oUiXy+UqcYvhF8ttjhZ+lbvcVGXXv8dJj0KLG+LwJ+Cl6/5mXapwQYG8bvvb6h5xf8qnsQbn
ipqFlG7VVvU6dGuJ8SohGpkFfVz//VWj3AwUaFicRTlBZOatxiSE6VK/RSbLyx5hqIZIx9Y7QeFu
bi0pGMu+dFxjixcKLxURb0ik/ULExpvEpnvLXmBcqhX1r9YVHdBztefJuVmwUZqfI5qzu0GIYlUn
dQjpW91N3BKkcKuR28Wx7jPprBCXGoElnC9jmi8/5PaK19fzXb2JyREXeEKm8dmPopVSd+VI5x9y
RNa3DfAdAlzprgSa/TFy6AJcGvoHfehaaXv1DQAwj0jKOAXEUbqzMsBlC4KMymPySpyckOiZZEEI
hCro2aa9AXd3MW7zRPMcfHyfgYnXbuF+NM1B8QG2OPY4m7BivusCp4KLPKiPF5W1Y1IwK4oxDKIX
GYEACBfLr7d9SKV/SXiNpZU0EccSL54zPkulB/VOwSih08LGuPcLdy86HpwmqlUe+mFiEY8hhT9f
iuX9PD9xAyxMq8UT4LVb8j22yvdmzMJ9uqnnWt0SAJUWSfV2w9rd/NnAXlU+88KHT05r7NyheZ9H
+3kumCXOstjeswKz647FzIETAbemIFVbDe+rIcpOoSOfsdQm2XulLBl8hKsUwtFPzHKBufSBKzpV
L8wW0vcjpRKOdSw3/UK1meJwC2hpv0V1AC0BSjuf8jKNNz7ISywUzaDlCoWbV1SnadR3IIERj6MY
lJaDAXNR22GLLyAAx9t3veJFevPrJVlU6ze1JffOcVq0yh/2RAnvvYmvf5oib8OMYOpoNianXo+F
fxLtKJUBpasWkd2ZyCmudTP5IUXUGqcb5Gb4lgTW2oFOZOwqaoYjA/P71KMOxqsXM1/AC+CRK1Ss
kypR7td+D8dI17/OLtmvhwNFf59Ib9m9GZO5dVSVZwSYnUJ6FKtG5v7ZUsBc+xSDYuKryPyLIA9L
gQ2FMIXvEuRyXy9o8k8CPZURes85QP/Itvo/poT+mmroaCup9THhCq6vWzl6qIutDEuDsPsvvNGF
TLca6jcBb029FgKANIikmkiFnvpPFr0/HsmrNM6sN3wRKXweQOcM2wEQ1VIQnCPTCMmfbdzhCPX4
1ZZw21ScM0hy+5Wyn0vm4siC+eFzbcZtnPyo5DuSYgpQocMhf8eaM4tJKa1Bc5m/gOTpzOaNJ92V
MaaulBQOvGiQBe3vELGQbzVh0H7eH8fmukrzJp3aZoOHXuws6h1javZpY02UAH+UQAqmrO6T053V
X7Co6QLEReeXJOPdi69D1XxWyERs9Wk4h5SZjL4wb+YhSFKLl1RGpckjOD7tsvy7kCZl4nh+3zGD
K800yRKF9pFRIRxQ5Pun2mpkXPxM4ZcyldWebU/m0MuCVlmVA6ZHwtfFyDec9uWqQE7Kq3XO97CR
iAbovRlkgNJ51hhzG/tmbj2bL/+BxBEittwczdjXIfjtp7nylg0V9dXGd3mtVwKncp8D8cAI/kPO
3Ul5OY+PUnIJdVcucNlCD3yEtGFyBe8Nk5Bhq8A/9d5auE1Ys4zRtOLCOWARkShRz0Q0QEMfwTeo
mT89cQb/m0b4a6Vb2X9tAZ5hWa9qNCXs5rqMSwItM5Q9Sgl7i75lRShPoAgSA/y7l6yLcPbizOGN
wpZ1l39Da2bHyNkrIA1K7oE7frOH4+9vtSqFVVN6k97YL3zDRX3FrvfOR3uSi8nOREmqgaqf+tRR
Q9ODPlItNjZKEfbGmzUQf6O6BswyMqyFGM3T4Y9vq+6B8eV7Nml0PwonzkRTYu3L8Y9Uwusj0/VV
Sv9L55W7T8VX5A2NqjxMPvg4fwcPXcuMRfNV3DPEqBiGxv5tzvTO/mllhf2vJOMUx9SEXVtteMjD
R4y1g219wubfLus+tAZzfRyIrldIYhI4Q79Kw+U5CrwZSW+ZGmlMXHwz0Megd5mSD/txc770RvQG
N3khJt1N+JGBrLcZvWXjTMoWyIr0VYG6nhgxdPceS1pcWA10ZXireYeS97jqFQFaOKy9vInqvkUQ
Nan7Z3YTr2x7AkOhHu0fltFQBPxVzC810KfKf/+F1YeHFgP745KWHUbHLrv6Pd+MpGVbgWGYLFlW
g88EKyZbww8u+144pBuVNgQC0A3MMnGkeSqXwW0Cxksb1JTqgZx7Z6820INrv6z2JPnyav1vIOX8
hHKnNaYnlGDkzmZ/JztXqHxp47E1HCGzhT9wNcQryyjgJU+SfU2Yzrv26TwPffoYEkbAasej+qKD
fGwjpvOlCisHdWS+3pJecfelv4x+crhIhYIFMIJLASXQlqmbf62cSlJl5pjzL3uAgxrcOygH+g2u
ezus1GOsOiXquEwg+qsSUGyUY8scvANqGWMc+vRZqHpkt2qdsQxnzHo2bc+2ia0sNfBlS5dVS5E8
X8D76hEGbM9eGNTohHcKlcpTFv45x4bH1g4rVS+NuUP0NtJt2jDQgxhsjqKeekr5zURoGN2xg8AU
jbIEJH8egqYUsRYQXgFV47RSHqboREoJCJJea/uZyHoIsIwIcpOHKZjjlcDEolj0cvGYSncgdwHq
vGrwOCOa89UHvQcdJOwAUzkHiOj+sjkZ8pxse1qfpdxwTZYfgo7MrtvBB18KufYYBHDpmAshIdh0
zR2lkivgv5vBdoVrRB6iBfz61zeIVn4B1oZiTyMjrEN6hCiUAE5hHX44/UmwIJQNgKqDII/HtQon
1OcGgvVK5hhgLWCskMVGDzOA5p/46J6nJFqnonCa13LyyCSiBOSooF/Dvu2cIl7oWxAhLgmVror8
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
fxw=
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
