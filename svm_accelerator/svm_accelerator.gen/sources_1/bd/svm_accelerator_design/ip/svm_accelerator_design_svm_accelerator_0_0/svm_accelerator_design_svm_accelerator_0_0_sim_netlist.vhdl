-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Sat May  9 00:59:28 2026
-- Host        : LAPTOP-VNMTQE0B running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {c:/Users/Chappidi Sai
--               Sudheer/Desktop/svm_accelerator/svm_accelerator.gen/sources_1/bd/svm_accelerator_design/ip/svm_accelerator_design_svm_accelerator_0_0/svm_accelerator_design_svm_accelerator_0_0_sim_netlist.vhdl}
-- Design      : svm_accelerator_design_svm_accelerator_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity svm_accelerator_design_svm_accelerator_0_0_svm_accelerator is
  port (
    s_axis_tready : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    aresetn : in STD_LOGIC;
    aclk : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of svm_accelerator_design_svm_accelerator_0_0_svm_accelerator : entity is "svm_accelerator";
end svm_accelerator_design_svm_accelerator_0_0_svm_accelerator;

architecture STRUCTURE of svm_accelerator_design_svm_accelerator_0_0_svm_accelerator is
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_6_n_0\ : STD_LOGIC;
  signal feat_count : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \feat_count[3]_i_1_n_0\ : STD_LOGIC;
  signal \feat_count[3]_i_2_n_0\ : STD_LOGIC;
  signal \feat_count[3]_i_4_n_0\ : STD_LOGIC;
  signal \feat_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \feat_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \feat_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \feat_count_reg_n_0_[3]\ : STD_LOGIC;
  signal in8 : STD_LOGIC_VECTOR ( 11 downto 1 );
  signal \^m_axis_tvalid\ : STD_LOGIC;
  signal out_valid_i_1_n_0 : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal sv_index : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \sv_index0_carry__0_n_0\ : STD_LOGIC;
  signal \sv_index0_carry__0_n_1\ : STD_LOGIC;
  signal \sv_index0_carry__0_n_2\ : STD_LOGIC;
  signal \sv_index0_carry__0_n_3\ : STD_LOGIC;
  signal \sv_index0_carry__1_n_2\ : STD_LOGIC;
  signal \sv_index0_carry__1_n_3\ : STD_LOGIC;
  signal sv_index0_carry_n_0 : STD_LOGIC;
  signal sv_index0_carry_n_1 : STD_LOGIC;
  signal sv_index0_carry_n_2 : STD_LOGIC;
  signal sv_index0_carry_n_3 : STD_LOGIC;
  signal \sv_index[11]_i_1_n_0\ : STD_LOGIC;
  signal \sv_index_reg_n_0_[0]\ : STD_LOGIC;
  signal \sv_index_reg_n_0_[10]\ : STD_LOGIC;
  signal \sv_index_reg_n_0_[11]\ : STD_LOGIC;
  signal \sv_index_reg_n_0_[1]\ : STD_LOGIC;
  signal \sv_index_reg_n_0_[2]\ : STD_LOGIC;
  signal \sv_index_reg_n_0_[3]\ : STD_LOGIC;
  signal \sv_index_reg_n_0_[4]\ : STD_LOGIC;
  signal \sv_index_reg_n_0_[5]\ : STD_LOGIC;
  signal \sv_index_reg_n_0_[6]\ : STD_LOGIC;
  signal \sv_index_reg_n_0_[7]\ : STD_LOGIC;
  signal \sv_index_reg_n_0_[8]\ : STD_LOGIC;
  signal \sv_index_reg_n_0_[9]\ : STD_LOGIC;
  signal \NLW_sv_index0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_sv_index0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[2]_i_6\ : label is "soft_lutpair2";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "IDLE:000,RECV_FEAT:001,ACCUMULATE:011,COMPUTE_RBF:010,SEND_RESULT:100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "IDLE:000,RECV_FEAT:001,ACCUMULATE:011,COMPUTE_RBF:010,SEND_RESULT:100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "IDLE:000,RECV_FEAT:001,ACCUMULATE:011,COMPUTE_RBF:010,SEND_RESULT:100";
  attribute SOFT_HLUTNM of \feat_count[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \feat_count[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \feat_count[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of s_axis_tready_INST_0 : label is "soft_lutpair3";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of sv_index0_carry : label is 35;
  attribute ADDER_THRESHOLD of \sv_index0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \sv_index0_carry__1\ : label is 35;
  attribute SOFT_HLUTNM of \sv_index[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \sv_index[10]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \sv_index[11]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \sv_index[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \sv_index[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \sv_index[4]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \sv_index[5]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \sv_index[6]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \sv_index[7]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \sv_index[8]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \sv_index[9]_i_1\ : label is "soft_lutpair5";
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
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2E2A222A00000000"
    )
        port map (
      I0 => state(1),
      I1 => \FSM_sequential_state[2]_i_2_n_0\,
      I2 => state(2),
      I3 => state(0),
      I4 => \FSM_sequential_state[2]_i_3_n_0\,
      I5 => aresetn,
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"26220000"
    )
        port map (
      I0 => state(2),
      I1 => \FSM_sequential_state[2]_i_2_n_0\,
      I2 => \FSM_sequential_state[2]_i_3_n_0\,
      I3 => state(0),
      I4 => aresetn,
      O => \FSM_sequential_state[2]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAEEAAEEBAFFBAEE"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_4_n_0\,
      I1 => state(1),
      I2 => m_axis_tready,
      I3 => state(2),
      I4 => s_axis_tvalid,
      I5 => state(0),
      O => \FSM_sequential_state[2]_i_2_n_0\
    );
\FSM_sequential_state[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFBFF"
    )
        port map (
      I0 => \FSM_sequential_state[2]_i_5_n_0\,
      I1 => \sv_index_reg_n_0_[4]\,
      I2 => \sv_index_reg_n_0_[3]\,
      I3 => \sv_index_reg_n_0_[6]\,
      I4 => \sv_index_reg_n_0_[5]\,
      I5 => \FSM_sequential_state[2]_i_6_n_0\,
      O => \FSM_sequential_state[2]_i_3_n_0\
    );
\FSM_sequential_state[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => \feat_count_reg_n_0_[3]\,
      I1 => \feat_count_reg_n_0_[2]\,
      I2 => \feat_count_reg_n_0_[1]\,
      I3 => \feat_count_reg_n_0_[0]\,
      I4 => state(2),
      I5 => state(0),
      O => \FSM_sequential_state[2]_i_4_n_0\
    );
\FSM_sequential_state[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \sv_index_reg_n_0_[8]\,
      I1 => \sv_index_reg_n_0_[7]\,
      I2 => \sv_index_reg_n_0_[9]\,
      I3 => \sv_index_reg_n_0_[10]\,
      O => \FSM_sequential_state[2]_i_5_n_0\
    );
\FSM_sequential_state[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFBFFF"
    )
        port map (
      I0 => \sv_index_reg_n_0_[0]\,
      I1 => \sv_index_reg_n_0_[11]\,
      I2 => state(1),
      I3 => \sv_index_reg_n_0_[2]\,
      I4 => \sv_index_reg_n_0_[1]\,
      O => \FSM_sequential_state[2]_i_6_n_0\
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
\feat_count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1310"
    )
        port map (
      I0 => \feat_count_reg_n_0_[0]\,
      I1 => state(2),
      I2 => state(0),
      I3 => s_axis_tvalid,
      O => feat_count(0)
    );
\feat_count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0220"
    )
        port map (
      I0 => state(0),
      I1 => state(2),
      I2 => \feat_count_reg_n_0_[0]\,
      I3 => \feat_count_reg_n_0_[1]\,
      O => feat_count(1)
    );
\feat_count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"07000800"
    )
        port map (
      I0 => \feat_count_reg_n_0_[0]\,
      I1 => \feat_count_reg_n_0_[1]\,
      I2 => state(2),
      I3 => state(0),
      I4 => \feat_count_reg_n_0_[2]\,
      O => feat_count(2)
    );
\feat_count[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => \feat_count[3]_i_1_n_0\
    );
\feat_count[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAAB"
    )
        port map (
      I0 => \feat_count[3]_i_4_n_0\,
      I1 => state(2),
      I2 => state(0),
      I3 => state(1),
      O => \feat_count[3]_i_2_n_0\
    );
\feat_count[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"007F000000800000"
    )
        port map (
      I0 => \feat_count_reg_n_0_[1]\,
      I1 => \feat_count_reg_n_0_[0]\,
      I2 => \feat_count_reg_n_0_[2]\,
      I3 => state(2),
      I4 => state(0),
      I5 => \feat_count_reg_n_0_[3]\,
      O => feat_count(3)
    );
\feat_count[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000400040404"
    )
        port map (
      I0 => state(2),
      I1 => s_axis_tvalid,
      I2 => state(1),
      I3 => \feat_count_reg_n_0_[3]\,
      I4 => \feat_count_reg_n_0_[1]\,
      I5 => \feat_count_reg_n_0_[2]\,
      O => \feat_count[3]_i_4_n_0\
    );
\feat_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \feat_count[3]_i_2_n_0\,
      D => feat_count(0),
      Q => \feat_count_reg_n_0_[0]\,
      R => \feat_count[3]_i_1_n_0\
    );
\feat_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \feat_count[3]_i_2_n_0\,
      D => feat_count(1),
      Q => \feat_count_reg_n_0_[1]\,
      R => \feat_count[3]_i_1_n_0\
    );
\feat_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \feat_count[3]_i_2_n_0\,
      D => feat_count(2),
      Q => \feat_count_reg_n_0_[2]\,
      R => \feat_count[3]_i_1_n_0\
    );
\feat_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \feat_count[3]_i_2_n_0\,
      D => feat_count(3),
      Q => \feat_count_reg_n_0_[3]\,
      R => \feat_count[3]_i_1_n_0\
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
sv_index0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => sv_index0_carry_n_0,
      CO(2) => sv_index0_carry_n_1,
      CO(1) => sv_index0_carry_n_2,
      CO(0) => sv_index0_carry_n_3,
      CYINIT => \sv_index_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in8(4 downto 1),
      S(3) => \sv_index_reg_n_0_[4]\,
      S(2) => \sv_index_reg_n_0_[3]\,
      S(1) => \sv_index_reg_n_0_[2]\,
      S(0) => \sv_index_reg_n_0_[1]\
    );
\sv_index0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => sv_index0_carry_n_0,
      CO(3) => \sv_index0_carry__0_n_0\,
      CO(2) => \sv_index0_carry__0_n_1\,
      CO(1) => \sv_index0_carry__0_n_2\,
      CO(0) => \sv_index0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => in8(8 downto 5),
      S(3) => \sv_index_reg_n_0_[8]\,
      S(2) => \sv_index_reg_n_0_[7]\,
      S(1) => \sv_index_reg_n_0_[6]\,
      S(0) => \sv_index_reg_n_0_[5]\
    );
\sv_index0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \sv_index0_carry__0_n_0\,
      CO(3 downto 2) => \NLW_sv_index0_carry__1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \sv_index0_carry__1_n_2\,
      CO(0) => \sv_index0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_sv_index0_carry__1_O_UNCONNECTED\(3),
      O(2 downto 0) => in8(11 downto 9),
      S(3) => '0',
      S(2) => \sv_index_reg_n_0_[11]\,
      S(1) => \sv_index_reg_n_0_[10]\,
      S(0) => \sv_index_reg_n_0_[9]\
    );
\sv_index[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state(1),
      I1 => \sv_index_reg_n_0_[0]\,
      O => sv_index(0)
    );
\sv_index[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => in8(10),
      O => sv_index(10)
    );
\sv_index[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"41"
    )
        port map (
      I0 => state(2),
      I1 => state(0),
      I2 => state(1),
      O => \sv_index[11]_i_1_n_0\
    );
\sv_index[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => in8(11),
      O => sv_index(11)
    );
\sv_index[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => in8(1),
      O => sv_index(1)
    );
\sv_index[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => in8(2),
      O => sv_index(2)
    );
\sv_index[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => in8(3),
      O => sv_index(3)
    );
\sv_index[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => in8(4),
      O => sv_index(4)
    );
\sv_index[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => in8(5),
      O => sv_index(5)
    );
\sv_index[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => in8(6),
      O => sv_index(6)
    );
\sv_index[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => in8(7),
      O => sv_index(7)
    );
\sv_index[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => in8(8),
      O => sv_index(8)
    );
\sv_index[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => state(1),
      I1 => in8(9),
      O => sv_index(9)
    );
\sv_index_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \sv_index[11]_i_1_n_0\,
      D => sv_index(0),
      Q => \sv_index_reg_n_0_[0]\,
      R => \feat_count[3]_i_1_n_0\
    );
\sv_index_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \sv_index[11]_i_1_n_0\,
      D => sv_index(10),
      Q => \sv_index_reg_n_0_[10]\,
      R => \feat_count[3]_i_1_n_0\
    );
\sv_index_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \sv_index[11]_i_1_n_0\,
      D => sv_index(11),
      Q => \sv_index_reg_n_0_[11]\,
      R => \feat_count[3]_i_1_n_0\
    );
\sv_index_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \sv_index[11]_i_1_n_0\,
      D => sv_index(1),
      Q => \sv_index_reg_n_0_[1]\,
      R => \feat_count[3]_i_1_n_0\
    );
\sv_index_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \sv_index[11]_i_1_n_0\,
      D => sv_index(2),
      Q => \sv_index_reg_n_0_[2]\,
      R => \feat_count[3]_i_1_n_0\
    );
\sv_index_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \sv_index[11]_i_1_n_0\,
      D => sv_index(3),
      Q => \sv_index_reg_n_0_[3]\,
      R => \feat_count[3]_i_1_n_0\
    );
\sv_index_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \sv_index[11]_i_1_n_0\,
      D => sv_index(4),
      Q => \sv_index_reg_n_0_[4]\,
      R => \feat_count[3]_i_1_n_0\
    );
\sv_index_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \sv_index[11]_i_1_n_0\,
      D => sv_index(5),
      Q => \sv_index_reg_n_0_[5]\,
      R => \feat_count[3]_i_1_n_0\
    );
\sv_index_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \sv_index[11]_i_1_n_0\,
      D => sv_index(6),
      Q => \sv_index_reg_n_0_[6]\,
      R => \feat_count[3]_i_1_n_0\
    );
\sv_index_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \sv_index[11]_i_1_n_0\,
      D => sv_index(7),
      Q => \sv_index_reg_n_0_[7]\,
      R => \feat_count[3]_i_1_n_0\
    );
\sv_index_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \sv_index[11]_i_1_n_0\,
      D => sv_index(8),
      Q => \sv_index_reg_n_0_[8]\,
      R => \feat_count[3]_i_1_n_0\
    );
\sv_index_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \sv_index[11]_i_1_n_0\,
      D => sv_index(9),
      Q => \sv_index_reg_n_0_[9]\,
      R => \feat_count[3]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity svm_accelerator_design_svm_accelerator_0_0 is
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
  attribute NotValidForBitStream of svm_accelerator_design_svm_accelerator_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of svm_accelerator_design_svm_accelerator_0_0 : entity is "svm_accelerator_design_svm_accelerator_0_0,svm_accelerator,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of svm_accelerator_design_svm_accelerator_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of svm_accelerator_design_svm_accelerator_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of svm_accelerator_design_svm_accelerator_0_0 : entity is "svm_accelerator,Vivado 2024.2";
end svm_accelerator_design_svm_accelerator_0_0;

architecture STRUCTURE of svm_accelerator_design_svm_accelerator_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^m_axis_tvalid\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis:s_axis, ASSOCIATED_RESET aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN svm_accelerator_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
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
  attribute X_INTERFACE_PARAMETER of m_axis_tdata : signal is "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN svm_accelerator_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 s_axis TDATA";
  attribute X_INTERFACE_MODE of s_axis_tdata : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axis_tdata : signal is "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN svm_accelerator_design_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
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
inst: entity work.svm_accelerator_design_svm_accelerator_0_0_svm_accelerator
     port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => \^m_axis_tvalid\,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
