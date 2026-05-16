-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Sat May  9 00:10:09 2026
-- Host        : LAPTOP-VNMTQE0B running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {c:/Users/Chappidi Sai
--               Sudheer/Desktop/bnn_accelerator/bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ip/bnn_accelerator_design_bnn_accelerator_0_0/bnn_accelerator_design_bnn_accelerator_0_0_sim_netlist.vhdl}
-- Design      : bnn_accelerator_design_bnn_accelerator_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bnn_accelerator_design_bnn_accelerator_0_0_bnn_accelerator is
  port (
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    aresetn : in STD_LOGIC;
    aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bnn_accelerator_design_bnn_accelerator_0_0_bnn_accelerator : entity is "bnn_accelerator";
end bnn_accelerator_design_bnn_accelerator_0_0_bnn_accelerator;

architecture STRUCTURE of bnn_accelerator_design_bnn_accelerator_0_0_bnn_accelerator is
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_5_n_0\ : STD_LOGIC;
  signal \^m_axis_tvalid\ : STD_LOGIC;
  signal out_valid_i_1_n_0 : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal word_count : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \word_count[4]_i_2_n_0\ : STD_LOGIC;
  signal \word_count[6]_i_1_n_0\ : STD_LOGIC;
  signal \word_count[6]_i_2_n_0\ : STD_LOGIC;
  signal \word_count[6]_i_4_n_0\ : STD_LOGIC;
  signal \word_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \word_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \word_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \word_count_reg_n_0_[3]\ : STD_LOGIC;
  signal \word_count_reg_n_0_[4]\ : STD_LOGIC;
  signal \word_count_reg_n_0_[5]\ : STD_LOGIC;
  signal \word_count_reg_n_0_[6]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_4\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_5\ : label is "soft_lutpair3";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "IDLE:000,RECV_FEAT:001,COMPUTE_FC1:010,COMPUTE_FC2:011,SEND_RESULT:100,";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "IDLE:000,RECV_FEAT:001,COMPUTE_FC1:010,COMPUTE_FC2:011,SEND_RESULT:100,";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "IDLE:000,RECV_FEAT:001,COMPUTE_FC1:010,COMPUTE_FC2:011,SEND_RESULT:100,";
  attribute SOFT_HLUTNM of \word_count[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \word_count[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \word_count[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \word_count[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \word_count[4]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \word_count[5]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \word_count[6]_i_3\ : label is "soft_lutpair4";
begin
  m_axis_tvalid <= \^m_axis_tvalid\;
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2600"
    )
        port map (
      I0 => state(0),
      I1 => \FSM_sequential_state[2]_i_2_n_0\,
      I2 => state(2),
      I3 => aresetn,
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"262A0000"
    )
        port map (
      I0 => state(1),
      I1 => \FSM_sequential_state[2]_i_2_n_0\,
      I2 => state(2),
      I3 => state(0),
      I4 => aresetn,
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"62220000"
    )
        port map (
      I0 => state(2),
      I1 => \FSM_sequential_state[2]_i_2_n_0\,
      I2 => state(1),
      I3 => state(0),
      I4 => aresetn,
      O => \FSM_sequential_state[2]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF0002"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_3_n_0\,
      I1 => \word_count_reg_n_0_[0]\,
      I2 => \word_count_reg_n_0_[1]\,
      I3 => \word_count_reg_n_0_[2]\,
      I4 => \FSM_sequential_state[2]_i_4_n_0\,
      I5 => \FSM_sequential_state[2]_i_5_n_0\,
      O => \FSM_sequential_state[2]_i_2_n_0\
    );
\FSM_sequential_state[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => \word_count_reg_n_0_[3]\,
      I1 => \word_count_reg_n_0_[4]\,
      I2 => \word_count_reg_n_0_[6]\,
      I3 => \word_count_reg_n_0_[5]\,
      I4 => state(2),
      I5 => state(0),
      O => \FSM_sequential_state[2]_i_3_n_0\
    );
\FSM_sequential_state[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => state(0),
      I3 => m_axis_tready,
      O => \FSM_sequential_state[2]_i_4_n_0\
    );
\FSM_sequential_state[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0E"
    )
        port map (
      I0 => state(1),
      I1 => s_axis_tvalid,
      I2 => state(2),
      I3 => state(0),
      O => \FSM_sequential_state[2]_i_5_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \FSM_sequential_state[1]_i_1_n_0\,
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \FSM_sequential_state[2]_i_1_n_0\,
      Q => state(2),
      R => '0'
    );
out_valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A9ABA8A800000000"
    )
        port map (
      I0 => \^m_axis_tvalid\,
      I1 => state(1),
      I2 => state(0),
      I3 => m_axis_tready,
      I4 => state(2),
      I5 => aresetn,
      O => out_valid_i_1_n_0
    );
out_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => out_valid_i_1_n_0,
      Q => \^m_axis_tvalid\,
      R => '0'
    );
s_axis_tready_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      O => s_axis_tready
    );
\word_count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5C"
    )
        port map (
      I0 => \word_count_reg_n_0_[0]\,
      I1 => s_axis_tvalid,
      I2 => state(0),
      O => word_count(0)
    );
\word_count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => state(0),
      I1 => \word_count_reg_n_0_[0]\,
      I2 => \word_count_reg_n_0_[1]\,
      O => word_count(1)
    );
\word_count[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => \word_count_reg_n_0_[1]\,
      I1 => \word_count_reg_n_0_[0]\,
      I2 => state(0),
      I3 => \word_count_reg_n_0_[2]\,
      O => word_count(2)
    );
\word_count[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F008000"
    )
        port map (
      I0 => \word_count_reg_n_0_[2]\,
      I1 => \word_count_reg_n_0_[0]\,
      I2 => \word_count_reg_n_0_[1]\,
      I3 => state(0),
      I4 => \word_count_reg_n_0_[3]\,
      O => word_count(3)
    );
\word_count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => \word_count_reg_n_0_[1]\,
      I1 => \word_count_reg_n_0_[0]\,
      I2 => \word_count_reg_n_0_[2]\,
      I3 => \word_count_reg_n_0_[3]\,
      I4 => \word_count[4]_i_2_n_0\,
      I5 => \word_count_reg_n_0_[4]\,
      O => word_count(4)
    );
\word_count[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      O => \word_count[4]_i_2_n_0\
    );
\word_count[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => \word_count[6]_i_4_n_0\,
      I1 => state(0),
      I2 => \word_count_reg_n_0_[5]\,
      O => word_count(5)
    );
\word_count[6]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => \word_count[6]_i_1_n_0\
    );
\word_count[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0002000F"
    )
        port map (
      I0 => s_axis_tvalid,
      I1 => \word_count_reg_n_0_[6]\,
      I2 => state(1),
      I3 => state(2),
      I4 => state(0),
      O => \word_count[6]_i_2_n_0\
    );
\word_count[6]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => \word_count[6]_i_4_n_0\,
      I1 => \word_count_reg_n_0_[5]\,
      I2 => state(0),
      I3 => \word_count_reg_n_0_[6]\,
      O => word_count(6)
    );
\word_count[6]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \word_count_reg_n_0_[4]\,
      I1 => \word_count_reg_n_0_[3]\,
      I2 => \word_count_reg_n_0_[2]\,
      I3 => \word_count_reg_n_0_[0]\,
      I4 => \word_count_reg_n_0_[1]\,
      O => \word_count[6]_i_4_n_0\
    );
\word_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \word_count[6]_i_2_n_0\,
      D => word_count(0),
      Q => \word_count_reg_n_0_[0]\,
      R => \word_count[6]_i_1_n_0\
    );
\word_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \word_count[6]_i_2_n_0\,
      D => word_count(1),
      Q => \word_count_reg_n_0_[1]\,
      R => \word_count[6]_i_1_n_0\
    );
\word_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \word_count[6]_i_2_n_0\,
      D => word_count(2),
      Q => \word_count_reg_n_0_[2]\,
      R => \word_count[6]_i_1_n_0\
    );
\word_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \word_count[6]_i_2_n_0\,
      D => word_count(3),
      Q => \word_count_reg_n_0_[3]\,
      R => \word_count[6]_i_1_n_0\
    );
\word_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \word_count[6]_i_2_n_0\,
      D => word_count(4),
      Q => \word_count_reg_n_0_[4]\,
      R => \word_count[6]_i_1_n_0\
    );
\word_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \word_count[6]_i_2_n_0\,
      D => word_count(5),
      Q => \word_count_reg_n_0_[5]\,
      R => \word_count[6]_i_1_n_0\
    );
\word_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \word_count[6]_i_2_n_0\,
      D => word_count(6),
      Q => \word_count_reg_n_0_[6]\,
      R => \word_count[6]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bnn_accelerator_design_bnn_accelerator_0_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tlast : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of bnn_accelerator_design_bnn_accelerator_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of bnn_accelerator_design_bnn_accelerator_0_0 : entity is "bnn_accelerator_design_bnn_accelerator_0_0,bnn_accelerator,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of bnn_accelerator_design_bnn_accelerator_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of bnn_accelerator_design_bnn_accelerator_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of bnn_accelerator_design_bnn_accelerator_0_0 : entity is "bnn_accelerator,Vivado 2024.2";
end bnn_accelerator_design_bnn_accelerator_0_0;

architecture STRUCTURE of bnn_accelerator_design_bnn_accelerator_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^m_axis_tvalid\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis:s_axis, ASSOCIATED_RESET aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bnn_accelerator_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tlast : signal is "xilinx.com:interface:axis:1.0 m_axis TLAST";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 m_axis TREADY";
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 m_axis TVALID";
  attribute X_INTERFACE_INFO of s_axis_tlast : signal is "xilinx.com:interface:axis:1.0 s_axis TLAST";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 s_axis TREADY";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 s_axis TVALID";
  attribute X_INTERFACE_INFO of m_axis_tdata : signal is "xilinx.com:interface:axis:1.0 m_axis TDATA";
  attribute X_INTERFACE_MODE of m_axis_tdata : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axis_tdata : signal is "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN bnn_accelerator_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
  attribute X_INTERFACE_MODE of s_axis_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_tdata : signal is "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN bnn_accelerator_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
begin
  m_axis_tdata(31) <= \<const0>\;
  m_axis_tdata(30) <= \<const0>\;
  m_axis_tdata(29) <= \<const0>\;
  m_axis_tdata(28) <= \<const0>\;
  m_axis_tdata(27) <= \<const0>\;
  m_axis_tdata(26) <= \<const0>\;
  m_axis_tdata(25) <= \<const0>\;
  m_axis_tdata(24) <= \<const0>\;
  m_axis_tdata(23) <= \<const0>\;
  m_axis_tdata(22) <= \<const0>\;
  m_axis_tdata(21) <= \<const0>\;
  m_axis_tdata(20) <= \<const0>\;
  m_axis_tdata(19) <= \<const0>\;
  m_axis_tdata(18) <= \<const0>\;
  m_axis_tdata(17) <= \<const0>\;
  m_axis_tdata(16) <= \<const0>\;
  m_axis_tdata(15) <= \<const0>\;
  m_axis_tdata(14) <= \<const0>\;
  m_axis_tdata(13) <= \<const0>\;
  m_axis_tdata(12) <= \<const0>\;
  m_axis_tdata(11) <= \<const0>\;
  m_axis_tdata(10) <= \<const0>\;
  m_axis_tdata(9) <= \<const0>\;
  m_axis_tdata(8) <= \<const0>\;
  m_axis_tdata(7) <= \<const0>\;
  m_axis_tdata(6) <= \<const0>\;
  m_axis_tdata(5) <= \<const0>\;
  m_axis_tdata(4) <= \<const0>\;
  m_axis_tdata(3) <= \<const0>\;
  m_axis_tdata(2) <= \<const0>\;
  m_axis_tdata(1) <= \<const0>\;
  m_axis_tdata(0) <= \<const1>\;
  m_axis_tlast <= \^m_axis_tvalid\;
  m_axis_tvalid <= \^m_axis_tvalid\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.bnn_accelerator_design_bnn_accelerator_0_0_bnn_accelerator
     port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => \^m_axis_tvalid\,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
