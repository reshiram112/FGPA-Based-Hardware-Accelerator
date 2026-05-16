-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Sat May  9 00:04:25 2026
-- Host        : LAPTOP-VNMTQE0B running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {c:/Users/Chappidi Sai
--               Sudheer/Desktop/bnn_accelerator/bnn_accelerator.gen/sources_1/bd/bnn_accelerator_design/ip/bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0/bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_sim_netlist.vhdl}
-- Design      : bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_b_downsizer is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    last_word : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    aclk : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    dout : in STD_LOGIC_VECTOR ( 4 downto 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_b_downsizer : entity is "axi_protocol_converter_v2_1_33_b_downsizer";
end bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_b_downsizer;

architecture STRUCTURE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_b_downsizer is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S_AXI_BRESP_ACC : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal first_mi_word : STD_LOGIC;
  signal \^last_word\ : STD_LOGIC;
  signal next_repeat_cnt : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \repeat_cnt[3]_i_2_n_0\ : STD_LOGIC;
  signal repeat_cnt_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \repeat_cnt[1]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \repeat_cnt[3]_i_2\ : label is "soft_lutpair27";
begin
  E(0) <= \^e\(0);
  last_word <= \^last_word\;
  s_axi_bresp(1 downto 0) <= \^s_axi_bresp\(1 downto 0);
\S_AXI_BRESP_ACC_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => \^s_axi_bresp\(0),
      Q => S_AXI_BRESP_ACC(0),
      R => SR(0)
    );
\S_AXI_BRESP_ACC_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => \^s_axi_bresp\(1),
      Q => S_AXI_BRESP_ACC(1),
      R => SR(0)
    );
first_mi_word_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \^last_word\,
      Q => first_mi_word,
      S => SR(0)
    );
m_axi_bready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B0"
    )
        port map (
      I0 => s_axi_bready,
      I1 => \^last_word\,
      I2 => m_axi_bvalid,
      O => \^e\(0)
    );
\repeat_cnt[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => repeat_cnt_reg(0),
      I1 => first_mi_word,
      I2 => dout(0),
      O => next_repeat_cnt(0)
    );
\repeat_cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8748B47"
    )
        port map (
      I0 => dout(1),
      I1 => first_mi_word,
      I2 => repeat_cnt_reg(1),
      I3 => dout(0),
      I4 => repeat_cnt_reg(0),
      O => next_repeat_cnt(1)
    );
\repeat_cnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B847"
    )
        port map (
      I0 => dout(2),
      I1 => first_mi_word,
      I2 => repeat_cnt_reg(2),
      I3 => \repeat_cnt[3]_i_2_n_0\,
      O => next_repeat_cnt(2)
    );
\repeat_cnt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCAACCAAC3AAC355"
    )
        port map (
      I0 => repeat_cnt_reg(3),
      I1 => dout(3),
      I2 => dout(2),
      I3 => first_mi_word,
      I4 => repeat_cnt_reg(2),
      I5 => \repeat_cnt[3]_i_2_n_0\,
      O => next_repeat_cnt(3)
    );
\repeat_cnt[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFACCFA"
    )
        port map (
      I0 => repeat_cnt_reg(0),
      I1 => dout(0),
      I2 => repeat_cnt_reg(1),
      I3 => first_mi_word,
      I4 => dout(1),
      O => \repeat_cnt[3]_i_2_n_0\
    );
\repeat_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => next_repeat_cnt(0),
      Q => repeat_cnt_reg(0),
      R => SR(0)
    );
\repeat_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => next_repeat_cnt(1),
      Q => repeat_cnt_reg(1),
      R => SR(0)
    );
\repeat_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => next_repeat_cnt(2),
      Q => repeat_cnt_reg(2),
      R => SR(0)
    );
\repeat_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => next_repeat_cnt(3),
      Q => repeat_cnt_reg(3),
      R => SR(0)
    );
\s_axi_bresp[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF4404FBFF0000"
    )
        port map (
      I0 => first_mi_word,
      I1 => dout(4),
      I2 => m_axi_bresp(1),
      I3 => S_AXI_BRESP_ACC(1),
      I4 => m_axi_bresp(0),
      I5 => S_AXI_BRESP_ACC(0),
      O => \^s_axi_bresp\(0)
    );
\s_axi_bresp[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F4F0"
    )
        port map (
      I0 => first_mi_word,
      I1 => dout(4),
      I2 => m_axi_bresp(1),
      I3 => S_AXI_BRESP_ACC(1),
      O => \^s_axi_bresp\(1)
    );
s_axi_bvalid_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => m_axi_bvalid,
      I1 => \^last_word\,
      O => s_axi_bvalid
    );
s_axi_bvalid_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000001FFFFFFFF"
    )
        port map (
      I0 => repeat_cnt_reg(3),
      I1 => first_mi_word,
      I2 => repeat_cnt_reg(2),
      I3 => repeat_cnt_reg(1),
      I4 => repeat_cnt_reg(0),
      I5 => dout(4),
      O => \^last_word\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_w_axi3_conv is
  port (
    \length_counter_1_reg[1]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    first_mi_word : out STD_LOGIC;
    \USE_WRITE.wr_cmd_ready\ : out STD_LOGIC;
    first_mi_word_reg_0 : out STD_LOGIC;
    m_axi_wlast : out STD_LOGIC;
    m_axi_wready_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    aclk : in STD_LOGIC;
    \length_counter_1_reg[1]_1\ : in STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    empty : in STD_LOGIC;
    \cmd_depth_reg[5]\ : in STD_LOGIC;
    \length_counter_1_reg[2]_0\ : in STD_LOGIC;
    dout : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wlast_0 : in STD_LOGIC;
    \cmd_depth_reg[5]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_w_axi3_conv : entity is "axi_protocol_converter_v2_1_33_w_axi3_conv";
end bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_w_axi3_conv;

architecture STRUCTURE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_w_axi3_conv is
  signal \^use_write.wr_cmd_ready\ : STD_LOGIC;
  signal fifo_gen_inst_i_4_n_0 : STD_LOGIC;
  signal \^first_mi_word\ : STD_LOGIC;
  signal first_mi_word_i_1_n_0 : STD_LOGIC;
  signal \^first_mi_word_reg_0\ : STD_LOGIC;
  signal \length_counter_1[0]_i_1_n_0\ : STD_LOGIC;
  signal \length_counter_1[2]_i_1_n_0\ : STD_LOGIC;
  signal \length_counter_1[2]_i_2_n_0\ : STD_LOGIC;
  signal \length_counter_1[3]_i_1_n_0\ : STD_LOGIC;
  signal \length_counter_1[3]_i_2_n_0\ : STD_LOGIC;
  signal \length_counter_1[4]_i_1_n_0\ : STD_LOGIC;
  signal \length_counter_1[5]_i_1_n_0\ : STD_LOGIC;
  signal \length_counter_1[6]_i_1_n_0\ : STD_LOGIC;
  signal \length_counter_1[6]_i_2_n_0\ : STD_LOGIC;
  signal \length_counter_1[7]_i_1_n_0\ : STD_LOGIC;
  signal \length_counter_1[7]_i_2_n_0\ : STD_LOGIC;
  signal length_counter_1_reg : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \^length_counter_1_reg[1]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^m_axi_wlast\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \length_counter_1[2]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \length_counter_1[3]_i_2\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \length_counter_1[5]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \length_counter_1[7]_i_2\ : label is "soft_lutpair61";
begin
  \USE_WRITE.wr_cmd_ready\ <= \^use_write.wr_cmd_ready\;
  first_mi_word <= \^first_mi_word\;
  first_mi_word_reg_0 <= \^first_mi_word_reg_0\;
  \length_counter_1_reg[1]_0\(1 downto 0) <= \^length_counter_1_reg[1]_0\(1 downto 0);
  m_axi_wlast <= \^m_axi_wlast\;
\cmd_depth[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^use_write.wr_cmd_ready\,
      I1 => \cmd_depth_reg[5]_0\,
      O => m_axi_wready_0(0)
    );
fifo_gen_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080008000800000"
    )
        port map (
      I0 => fifo_gen_inst_i_4_n_0,
      I1 => m_axi_wready,
      I2 => s_axi_wvalid,
      I3 => empty,
      I4 => \^first_mi_word_reg_0\,
      I5 => \cmd_depth_reg[5]\,
      O => \^use_write.wr_cmd_ready\
    );
fifo_gen_inst_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0001"
    )
        port map (
      I0 => length_counter_1_reg(6),
      I1 => length_counter_1_reg(7),
      I2 => length_counter_1_reg(4),
      I3 => length_counter_1_reg(5),
      I4 => \^first_mi_word\,
      O => fifo_gen_inst_i_4_n_0
    );
fifo_gen_inst_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \^first_mi_word\,
      I1 => \^length_counter_1_reg[1]_0\(0),
      I2 => \^length_counter_1_reg[1]_0\(1),
      I3 => length_counter_1_reg(3),
      I4 => length_counter_1_reg(2),
      O => \^first_mi_word_reg_0\
    );
first_mi_word_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => \^m_axi_wlast\,
      I1 => empty,
      I2 => s_axi_wvalid,
      I3 => m_axi_wready,
      I4 => \^first_mi_word\,
      O => first_mi_word_i_1_n_0
    );
first_mi_word_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => first_mi_word_i_1_n_0,
      Q => \^first_mi_word\,
      S => SR(0)
    );
\length_counter_1[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F2FFFFFF07000000"
    )
        port map (
      I0 => \^first_mi_word\,
      I1 => dout(0),
      I2 => empty,
      I3 => s_axi_wvalid,
      I4 => m_axi_wready,
      I5 => \^length_counter_1_reg[1]_0\(0),
      O => \length_counter_1[0]_i_1_n_0\
    );
\length_counter_1[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D7DD8222"
    )
        port map (
      I0 => \length_counter_1_reg[2]_0\,
      I1 => \length_counter_1[2]_i_2_n_0\,
      I2 => dout(2),
      I3 => \^first_mi_word\,
      I4 => length_counter_1_reg(2),
      O => \length_counter_1[2]_i_1_n_0\
    );
\length_counter_1[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFCAAFC"
    )
        port map (
      I0 => dout(0),
      I1 => \^length_counter_1_reg[1]_0\(0),
      I2 => \^length_counter_1_reg[1]_0\(1),
      I3 => \^first_mi_word\,
      I4 => dout(1),
      O => \length_counter_1[2]_i_2_n_0\
    );
\length_counter_1[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A959CCCC"
    )
        port map (
      I0 => \length_counter_1[3]_i_2_n_0\,
      I1 => length_counter_1_reg(3),
      I2 => \^first_mi_word\,
      I3 => dout(3),
      I4 => \length_counter_1_reg[2]_0\,
      O => \length_counter_1[3]_i_1_n_0\
    );
\length_counter_1[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFE2"
    )
        port map (
      I0 => length_counter_1_reg(2),
      I1 => \^first_mi_word\,
      I2 => dout(2),
      I3 => \length_counter_1[2]_i_2_n_0\,
      O => \length_counter_1[3]_i_2_n_0\
    );
\length_counter_1[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8AAABAAAAAAA9AAA"
    )
        port map (
      I0 => length_counter_1_reg(4),
      I1 => empty,
      I2 => s_axi_wvalid,
      I3 => m_axi_wready,
      I4 => \length_counter_1[6]_i_2_n_0\,
      I5 => \^first_mi_word\,
      O => \length_counter_1[4]_i_1_n_0\
    );
\length_counter_1[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2E2EAAA6"
    )
        port map (
      I0 => length_counter_1_reg(5),
      I1 => \length_counter_1_reg[2]_0\,
      I2 => \length_counter_1[6]_i_2_n_0\,
      I3 => length_counter_1_reg(4),
      I4 => \^first_mi_word\,
      O => \length_counter_1[5]_i_1_n_0\
    );
\length_counter_1[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44EE44EECCCCCCC6"
    )
        port map (
      I0 => \length_counter_1_reg[2]_0\,
      I1 => length_counter_1_reg(6),
      I2 => length_counter_1_reg(5),
      I3 => \length_counter_1[6]_i_2_n_0\,
      I4 => length_counter_1_reg(4),
      I5 => \^first_mi_word\,
      O => \length_counter_1[6]_i_1_n_0\
    );
\length_counter_1[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFAEEEEFFFA"
    )
        port map (
      I0 => \length_counter_1[2]_i_2_n_0\,
      I1 => dout(2),
      I2 => length_counter_1_reg(2),
      I3 => length_counter_1_reg(3),
      I4 => \^first_mi_word\,
      I5 => dout(3),
      O => \length_counter_1[6]_i_2_n_0\
    );
\length_counter_1[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3FEF00D0"
    )
        port map (
      I0 => length_counter_1_reg(6),
      I1 => \^first_mi_word\,
      I2 => \length_counter_1_reg[2]_0\,
      I3 => \length_counter_1[7]_i_2_n_0\,
      I4 => length_counter_1_reg(7),
      O => \length_counter_1[7]_i_1_n_0\
    );
\length_counter_1[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CCFE"
    )
        port map (
      I0 => length_counter_1_reg(5),
      I1 => \length_counter_1[6]_i_2_n_0\,
      I2 => length_counter_1_reg(4),
      I3 => \^first_mi_word\,
      O => \length_counter_1[7]_i_2_n_0\
    );
\length_counter_1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \length_counter_1[0]_i_1_n_0\,
      Q => \^length_counter_1_reg[1]_0\(0),
      R => SR(0)
    );
\length_counter_1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \length_counter_1_reg[1]_1\,
      Q => \^length_counter_1_reg[1]_0\(1),
      R => SR(0)
    );
\length_counter_1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \length_counter_1[2]_i_1_n_0\,
      Q => length_counter_1_reg(2),
      R => SR(0)
    );
\length_counter_1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \length_counter_1[3]_i_1_n_0\,
      Q => length_counter_1_reg(3),
      R => SR(0)
    );
\length_counter_1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \length_counter_1[4]_i_1_n_0\,
      Q => length_counter_1_reg(4),
      R => SR(0)
    );
\length_counter_1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \length_counter_1[5]_i_1_n_0\,
      Q => length_counter_1_reg(5),
      R => SR(0)
    );
\length_counter_1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \length_counter_1[6]_i_1_n_0\,
      Q => length_counter_1_reg(6),
      R => SR(0)
    );
\length_counter_1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \length_counter_1[7]_i_1_n_0\,
      Q => length_counter_1_reg(7),
      R => SR(0)
    );
m_axi_wlast_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAB00000000"
    )
        port map (
      I0 => \^first_mi_word\,
      I1 => length_counter_1_reg(5),
      I2 => length_counter_1_reg(4),
      I3 => length_counter_1_reg(7),
      I4 => length_counter_1_reg(6),
      I5 => m_axi_wlast_0,
      O => \^m_axi_wlast\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst is
  port (
    src_arst : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_arst : out STD_LOGIC
  );
  attribute DEF_VAL : string;
  attribute DEF_VAL of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst : entity is "1'b0";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst : entity is 2;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst : entity is 0;
  attribute INV_DEF_VAL : string;
  attribute INV_DEF_VAL of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst : entity is "1'b1";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst : entity is "xpm_cdc_async_rst";
  attribute RST_ACTIVE_HIGH : integer;
  attribute RST_ACTIVE_HIGH of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst : entity is 1;
  attribute VERSION : integer;
  attribute VERSION of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst : entity is "TRUE";
  attribute is_du_within_envelope : string;
  attribute is_du_within_envelope of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst : entity is "true";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst : entity is "true";
  attribute xpm_cdc : string;
  attribute xpm_cdc of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst : entity is "ASYNC_RST";
end bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst;

architecture STRUCTURE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst is
  signal arststages_ff : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of arststages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of arststages_ff : signal is "true";
  attribute xpm_cdc of arststages_ff : signal is "ASYNC_RST";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \arststages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \arststages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \arststages_ff_reg[0]\ : label is "ASYNC_RST";
  attribute ASYNC_REG_boolean of \arststages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \arststages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \arststages_ff_reg[1]\ : label is "ASYNC_RST";
begin
  dest_arst <= arststages_ff(1);
\arststages_ff_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => '0',
      PRE => src_arst,
      Q => arststages_ff(0)
    );
\arststages_ff_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => arststages_ff(0),
      PRE => src_arst,
      Q => arststages_ff(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ is
  port (
    src_arst : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_arst : out STD_LOGIC
  );
  attribute DEF_VAL : string;
  attribute DEF_VAL of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ : entity is "1'b0";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ : entity is 2;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ : entity is 0;
  attribute INV_DEF_VAL : string;
  attribute INV_DEF_VAL of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ : entity is "1'b1";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ : entity is "xpm_cdc_async_rst";
  attribute RST_ACTIVE_HIGH : integer;
  attribute RST_ACTIVE_HIGH of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ : entity is 1;
  attribute VERSION : integer;
  attribute VERSION of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ : entity is "TRUE";
  attribute is_du_within_envelope : string;
  attribute is_du_within_envelope of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ : entity is "true";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ : entity is "true";
  attribute xpm_cdc : string;
  attribute xpm_cdc of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ : entity is "ASYNC_RST";
end \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\;

architecture STRUCTURE of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__3\ is
  signal arststages_ff : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of arststages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of arststages_ff : signal is "true";
  attribute xpm_cdc of arststages_ff : signal is "ASYNC_RST";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \arststages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \arststages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \arststages_ff_reg[0]\ : label is "ASYNC_RST";
  attribute ASYNC_REG_boolean of \arststages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \arststages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \arststages_ff_reg[1]\ : label is "ASYNC_RST";
begin
  dest_arst <= arststages_ff(1);
\arststages_ff_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => '0',
      PRE => src_arst,
      Q => arststages_ff(0)
    );
\arststages_ff_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => arststages_ff(0),
      PRE => src_arst,
      Q => arststages_ff(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ is
  port (
    src_arst : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_arst : out STD_LOGIC
  );
  attribute DEF_VAL : string;
  attribute DEF_VAL of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ : entity is "1'b0";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ : entity is 2;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ : entity is 0;
  attribute INV_DEF_VAL : string;
  attribute INV_DEF_VAL of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ : entity is "1'b1";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ : entity is "xpm_cdc_async_rst";
  attribute RST_ACTIVE_HIGH : integer;
  attribute RST_ACTIVE_HIGH of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ : entity is 1;
  attribute VERSION : integer;
  attribute VERSION of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ : entity is "TRUE";
  attribute is_du_within_envelope : string;
  attribute is_du_within_envelope of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ : entity is "true";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ : entity is "true";
  attribute xpm_cdc : string;
  attribute xpm_cdc of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ : entity is "ASYNC_RST";
end \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\;

architecture STRUCTURE of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_xpm_cdc_async_rst__4\ is
  signal arststages_ff : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of arststages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of arststages_ff : signal is "true";
  attribute xpm_cdc of arststages_ff : signal is "ASYNC_RST";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \arststages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \arststages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \arststages_ff_reg[0]\ : label is "ASYNC_RST";
  attribute ASYNC_REG_boolean of \arststages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \arststages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \arststages_ff_reg[1]\ : label is "ASYNC_RST";
begin
  dest_arst <= arststages_ff(1);
\arststages_ff_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => '0',
      PRE => src_arst,
      Q => arststages_ff(0)
    );
\arststages_ff_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => arststages_ff(0),
      PRE => src_arst,
      Q => arststages_ff(1)
    );
end STRUCTURE;
`protect begin_protected
`protect version = 1
`protect encrypt_agent = "XILINX"
`protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`protect key_block
md0AksSCeI3fOZtF7nrw91OgSzGoACBon4GH9ENTzaI4jlg22H1uTtXayX2Kz+g4ZH2j52rtMH8H
Xc49HVcThMzO1cRXu+SkL59MRQ87klGca4XtjrTtunJoQ+jyOKRwRBeIMHUdntbk2T1kbXHf9KkB
bNYGEMqSrbiDt7IJUx8=

`protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
r6CzxR0T3O2wvZRQe25aX3/CWOx/3d/3vJvvS/XsrKr7v852GNQNqCBn+PKsunj0Ncep8DqHtVie
BE6tKIqZW+3txAUjrhSri5liuFWSnzAk+Drsb4RnvIy7BeOdAK6NhVhn8ZyplkJSHVwaGjN8gtPE
LeWEHPHf5qLnzqGKV7B6oIC7POGV6Vamos1p2z1xv2cEw4udvmtZ5EjzeyCMf+omtxEPxhPi6Z2h
ENlGOmuPMkWGMjP6HQCZ1Mi0uiST/zDo29UDIMmOGcsDMe97imU/z2ekKTPXXwjcV+9q+4zHRgJV
6JWWgjU9cztV5OMaEfpBgRBWae/ijWpPZaGuFA==

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`protect key_block
glFrHilvyO7nq7/OYhnyb9uU9d8UNGJruNnkmJWuTpgvyCDmtx7iVKPBPe1Bj9jUDT/HM9AGxvu0
g7b4TuMdVkegkVPeHhw31IW0HoTL8wPnrLEpzDVK+B7xl953hPKPe0vn+0EQh2UKeL5K8VLxmsSv
gbpEeToeR90yzlSUzDE=

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
D4uBhES8Mkd0GCwY2aQOmEzTqz6hO5B9Wa2oyfVBEODkWyt+AHkIXn4tuBN05FcP2FVmgtVbvZX5
K6iog51IoPw5tv+pM5x8+bQBX/aZpf0c4to3qiX6RZuITpuSUWq/7sqQDqtMqDWOFMMnUBpTX+qI
t61NvyIZcfqRWo4yvIUV2Zh1etqYKDlhqRnMoBZKMeHFpVsp19nU4sf5Km7sSlPQ08vYD8qtJqgJ
ZDYC2KWFTHsnT+5anHvc80FgHt4zBHpPrGprgpltQmVmMZxUD6NRC9EvvXf+pBhgfwPHHePWIKUn
elLld/HEVeFw76SlVV8i4LsS4KWWOM+KmMprEg==

`protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
EW9gHDqS12MVhy+y/xQVscLd4qOim+cNTepYzlas7WzqDJogZthddOuGjpm3a3fS/cMbF/h0O1Hb
Wjow664GIga0y96lkbkcJ3W8x/IGAsvgyrYT6ScsFhyq7tSd1HjvRG81BhhGM1mmpxfzh0Uqbfso
q+uVKPUmPnbQ/Gdu9YRoxmYVJdmUTpXJ5waYOdib8WNMPLdDfIo/FGrYrx2zYQBtpU5DwwVUTMrB
ZasEyxOj++icI5k5lR3Tx+3gdCFTy4XYQfcj2COm4gnVZ8FN/X1/+0ywsVGAc/OKL+mjMYH3NNH3
zfDO/TpYft+HaVl+CfF/U6IgJJeJs4qI4gB4FA==

`protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
Myfv5Skg7QCxlNBoFiSTLAeIRYS0J0ArRihYk7dGAHZWAFlxJLgqo51W9P9zTVBurMJjZLtonoDJ
19RfxQj5GqhqN1A20s8xOFfLq6+uDG/V39xQFY32O626Kh4MMlH07hNJL5u1NjJWg1yze0XdFEe9
oLwKQz5lSKGMIh+VPXDuCGhShS+KhHwGEdS0lmA/IHPFNlRG1LsK0zQmUiNkG4kQ5OEVkQgvknNC
B6++ZDIYlT9WbZPs5giRY0zAhUepLPaO+N9F3fIBKVGw4ejbZOt0kXKixF86DDfLmF2+dov+PrTX
1MXJaea3YoQdR2c2MSHAk/TTkzg9ayjvxKaXpg==

`protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
ks9l+EPHXfDNnWd0exs1j0Q9iSNYaIExwQnpsi8TFJimjPtOkX050wFklsLBM83WyfuD+F2KLNnZ
Jg/aiIiGe9o424jOiEFdnAJuzrD0QL9WmhQ3W9iRJ7uPhha6NfR2WGTCCM4TpN8rTKLQDKxenVfv
6x83rnL5NQxvpp9cQh3zMma73qoEJjhTR9MD9cwA4VeKq2u/R0iTWBplX81vYFd9TW2qW5/Qyzzj
A0+pXzczcJKdggV8h8bYcO+PRC3t2XrufhnjvhjMLG2tPHSMW/soDH/v8KorXyWe5N/q12fo5auN
SXr3olNuB5kpiVS3mJAPV0z4UsFfu2A4hLH7MQ==

`protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`protect key_block
e3AJKDEM9byJqwpkFZqMIMKMQPOR1VrLFkshor7HR0C+ol7Uv3XTGyvQrINdBEArX0eazF0cHWjC
9B4BhDnysAhT6SENcNHIYHUGQE7uiF7zgL7WhCxClwEnIAVj+PU9FmqlvbreEikHQfbeIDPyCLii
NAS97RDxWki/MfR33zvZX4eEolA/oTyRzr1MagBs7LN1UXyGPvnze8JzHxA3zHVedIIrBrZxkfoj
Loqe6tLYRlC45h1Yr3Wa2gh3LJGtOSji+m7E9Xua/pPh8A/CAD+TNBa5d/X7C3a4AWl2bYTi7HBY
Y8vaIjHiSosru5F2UOEQG9xekCbNRK1Apew1UIvntzCmDMMhlAgB78AUOE2YEWKd9GOl+aTZjMS3
GxAYzrtv/bDRkPOYbcG0SNT9xf+izRM3lX1E2vN3i3uU2Qrh73fjU1lk3PIe/A/H56UrNPDnGT9W
TvlJR47bLDtGyX2+dLvfTaZGRP8aepePOXXLIlvqwCJSMVhCB/hIbz7E

`protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
TfuXOFQtE7YhtTL4354NvKETmBCLSVnb+pbrT8gtzjU7pERE1Hu2ZVzHgVQXwt5RvwG1R/z2je+U
PzszCBhPNqUaXEhuJ0A/q0S/vvOOa6h6tW9MhiB3gnuqEFVWz5pbHZNfgrwh2gT8XyqLI8f1CoJM
xpcB2TbREV/kAAFMxIfH1Dg0KSO2dCeVV1na6N0AiMOQPvXZOB7QpXwNDbYfarWLtF0/l0hi4Fxu
Kgho2ggrUhajP0aKlrCQ9mLsqOyqJELeJldeD+vuUUqhYq4K4RrwtQF+B67lYc4AjznwQ92tUvYJ
ZspFoHJEScNvdFoHFTA2TQ2KToepsqXRiOCL1A==

`protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
tmfbBpNtCYJ7zsgNxUzw7Dvn+hNn2PPUBeRfXSci/q2/OcQeF/eAAML8YIN1V+AEoAqZTE2/xRQz
+6zwVOLyAOLynMIBQ7EG7xReDJ9kEEiBjnMGO6NWdAsa/VcreVHrLD1PFtA1+WoVe6yOvNGK+Nbh
HjPkXyycyP6RQ4Rx/PtTxw31LOFVezddSgRlaKHTprKTP4LbjPG//onRBg3fAl8zwU1wYYNLzYCX
jwY7xfMkQyhUSpV2Tx3seqy2IYVl8jjxynFxfyxulvrJiqmc6aaKKBdkoOVbJ5eO2sCXFJB1mKEU
WR2Ee2ozisABzk9IcGILewCW7ghdLP82CRZv4A==

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
GfDCxx9db4ripD5mvQy16BVlwPYfeC7ZobZXaX1my6WUDiKwd69J5SreUXKYD9lvZfI7djLgHkYm
5G247T4NX7zoBwc88bUD+tNvGNmzWFfSVVZqu8hjgd31lZXjy9uYdXA/gsE+T+JqEfRYdV8YoGgm
sREyiJjWRPDbx6kc8um8vlAK/Rjwz0EGVkGUoi/+UvxcnjG1PqCl7GSMOQ3gFMEOaxIflShnF2/c
//ioADxl3WjUGyTstMK54XlP8G1Hk95sSe/7Y+SbaIyoG8t6gGDimDJNuGs4JjDUi1V7Gxfzxk9+
O2J++9clyLkMZ3rRyxSvR+Xyrmn3YxjVC68GXw==

`protect data_method = "AES128-CBC"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 352000)
`protect data_block
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
P1qviofHZ8aXs0ip9/9nOeOFb4nUCDajxg==
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen is
  port (
    \goreg_dm.dout_i_reg[4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    din : out STD_LOGIC_VECTOR ( 0 to 0 );
    rd_en : out STD_LOGIC;
    cmd_empty_reg : out STD_LOGIC;
    cmd_push_block_reg : out STD_LOGIC;
    split_in_progress : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 4 downto 0 );
    wr_en : out STD_LOGIC;
    \S_AXI_AID_Q_reg[0]\ : out STD_LOGIC;
    split_in_progress_reg : out STD_LOGIC;
    \last_split__1\ : out STD_LOGIC;
    \queue_id_reg[0]\ : out STD_LOGIC;
    aclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ram_full_fb_i_reg : in STD_LOGIC;
    \USE_WRITE.wr_cmd_ready\ : in STD_LOGIC;
    almost_empty : in STD_LOGIC;
    cmd_empty : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    last_word : in STD_LOGIC;
    almost_b_empty : in STD_LOGIC;
    cmd_b_empty : in STD_LOGIC;
    \cmd_depth_reg[5]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    cmd_push_block : in STD_LOGIC;
    command_ongoing : in STD_LOGIC;
    \queue_id_reg[0]_0\ : in STD_LOGIC;
    m_axi_awvalid : in STD_LOGIC;
    queue_id : in STD_LOGIC;
    \queue_id_reg[0]_1\ : in STD_LOGIC;
    need_to_split_q : in STD_LOGIC;
    multiple_id_non_split : in STD_LOGIC;
    split_ongoing_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    access_is_incr_q : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen : entity is "axi_data_fifo_v2_1_32_fifo_gen";
end bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen;

architecture STRUCTURE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen is
  signal \^s_axi_aid_q_reg[0]\ : STD_LOGIC;
  signal S_AXI_AREADY_I_i_5_n_0 : STD_LOGIC;
  signal \cmd_depth[5]_i_3_n_0\ : STD_LOGIC;
  signal cmd_empty0 : STD_LOGIC;
  signal \^cmd_push_block_reg\ : STD_LOGIC;
  signal \^din\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^empty\ : STD_LOGIC;
  signal \^full\ : STD_LOGIC;
  signal \^last_split__1\ : STD_LOGIC;
  signal multiple_id_non_split_i_4_n_0 : STD_LOGIC;
  signal \^rd_en\ : STD_LOGIC;
  signal \^split_in_progress_reg\ : STD_LOGIC;
  signal NLW_fifo_gen_inst_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axis_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_ar_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_ar_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_aw_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_aw_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_aw_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_b_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_b_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_b_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_r_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_r_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_r_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_w_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_w_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_w_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_m_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_m_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cmd_depth[2]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \cmd_depth[3]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of cmd_empty_i_1 : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of cmd_empty_i_3 : label is "soft_lutpair43";
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of fifo_gen_inst : label is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of fifo_gen_inst : label is 64;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of fifo_gen_inst : label is 8;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of fifo_gen_inst : label is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of fifo_gen_inst : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of fifo_gen_inst : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of fifo_gen_inst : label is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of fifo_gen_inst : label is 2;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of fifo_gen_inst : label is 0;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of fifo_gen_inst : label is 1;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of fifo_gen_inst : label is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of fifo_gen_inst : label is 6;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of fifo_gen_inst : label is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of fifo_gen_inst : label is 5;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of fifo_gen_inst : label is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of fifo_gen_inst : label is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of fifo_gen_inst : label is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of fifo_gen_inst : label is 32;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of fifo_gen_inst : label is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of fifo_gen_inst : label is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of fifo_gen_inst : label is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of fifo_gen_inst : label is 5;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of fifo_gen_inst : label is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of fifo_gen_inst : label is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of fifo_gen_inst : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of fifo_gen_inst : label is "zynq";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of fifo_gen_inst : label is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of fifo_gen_inst : label is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of fifo_gen_inst : label is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of fifo_gen_inst : label is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of fifo_gen_inst : label is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of fifo_gen_inst : label is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of fifo_gen_inst : label is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of fifo_gen_inst : label is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of fifo_gen_inst : label is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of fifo_gen_inst : label is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of fifo_gen_inst : label is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of fifo_gen_inst : label is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of fifo_gen_inst : label is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of fifo_gen_inst : label is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of fifo_gen_inst : label is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of fifo_gen_inst : label is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of fifo_gen_inst : label is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of fifo_gen_inst : label is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of fifo_gen_inst : label is 0;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of fifo_gen_inst : label is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of fifo_gen_inst : label is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of fifo_gen_inst : label is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of fifo_gen_inst : label is 2;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of fifo_gen_inst : label is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of fifo_gen_inst : label is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of fifo_gen_inst : label is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of fifo_gen_inst : label is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of fifo_gen_inst : label is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of fifo_gen_inst : label is 0;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of fifo_gen_inst : label is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of fifo_gen_inst : label is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of fifo_gen_inst : label is 4;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of fifo_gen_inst : label is 5;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of fifo_gen_inst : label is 31;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of fifo_gen_inst : label is 30;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of fifo_gen_inst : label is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of fifo_gen_inst : label is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of fifo_gen_inst : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of fifo_gen_inst : label is 6;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of fifo_gen_inst : label is 32;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of fifo_gen_inst : label is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of fifo_gen_inst : label is 5;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of fifo_gen_inst : label is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of fifo_gen_inst : label is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of fifo_gen_inst : label is 3;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of fifo_gen_inst : label is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of fifo_gen_inst : label is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of fifo_gen_inst : label is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of fifo_gen_inst : label is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of fifo_gen_inst : label is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of fifo_gen_inst : label is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of fifo_gen_inst : label is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of fifo_gen_inst : label is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of fifo_gen_inst : label is 1;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of fifo_gen_inst : label is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of fifo_gen_inst : label is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of fifo_gen_inst : label is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of fifo_gen_inst : label is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of fifo_gen_inst : label is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of fifo_gen_inst : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of fifo_gen_inst : label is 6;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of fifo_gen_inst : label is 32;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of fifo_gen_inst : label is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of fifo_gen_inst : label is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of fifo_gen_inst : label is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of fifo_gen_inst : label is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of fifo_gen_inst : label is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of fifo_gen_inst : label is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of fifo_gen_inst : label is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of fifo_gen_inst : label is 5;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of fifo_gen_inst : label is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of fifo_gen_inst : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of fifo_gen_inst : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of fifo_gen_inst : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of fifo_gen_inst : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of fifo_gen_inst : label is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of fifo_gen_inst : label is 1;
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of fifo_gen_inst : label is "soft";
  attribute is_du_within_envelope : string;
  attribute is_du_within_envelope of fifo_gen_inst : label is "true";
  attribute SOFT_HLUTNM of fifo_gen_inst_i_1 : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \queue_id[0]_i_1\ : label is "soft_lutpair45";
begin
  \S_AXI_AID_Q_reg[0]\ <= \^s_axi_aid_q_reg[0]\;
  cmd_push_block_reg <= \^cmd_push_block_reg\;
  din(0) <= \^din\(0);
  empty <= \^empty\;
  full <= \^full\;
  \last_split__1\ <= \^last_split__1\;
  rd_en <= \^rd_en\;
  split_in_progress_reg <= \^split_in_progress_reg\;
S_AXI_AREADY_I_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"82000082FFFFFFFF"
    )
        port map (
      I0 => S_AXI_AREADY_I_i_5_n_0,
      I1 => Q(0),
      I2 => split_ongoing_reg(0),
      I3 => Q(3),
      I4 => split_ongoing_reg(3),
      I5 => access_is_incr_q,
      O => \^last_split__1\
    );
S_AXI_AREADY_I_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => split_ongoing_reg(2),
      I1 => Q(2),
      I2 => split_ongoing_reg(1),
      I3 => Q(1),
      O => S_AXI_AREADY_I_i_5_n_0
    );
\cmd_depth[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => cmd_empty0,
      I1 => \cmd_depth_reg[5]\(1),
      I2 => \cmd_depth_reg[5]\(0),
      O => D(0)
    );
\cmd_depth[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AA9"
    )
        port map (
      I0 => \cmd_depth_reg[5]\(2),
      I1 => cmd_empty0,
      I2 => \cmd_depth_reg[5]\(1),
      I3 => \cmd_depth_reg[5]\(0),
      O => D(1)
    );
\cmd_depth[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAA9"
    )
        port map (
      I0 => \cmd_depth_reg[5]\(3),
      I1 => cmd_empty0,
      I2 => \cmd_depth_reg[5]\(0),
      I3 => \cmd_depth_reg[5]\(1),
      I4 => \cmd_depth_reg[5]\(2),
      O => D(2)
    );
\cmd_depth[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAA9"
    )
        port map (
      I0 => \cmd_depth_reg[5]\(4),
      I1 => cmd_empty0,
      I2 => \cmd_depth_reg[5]\(0),
      I3 => \cmd_depth_reg[5]\(1),
      I4 => \cmd_depth_reg[5]\(2),
      I5 => \cmd_depth_reg[5]\(3),
      O => D(3)
    );
\cmd_depth[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AA9"
    )
        port map (
      I0 => \cmd_depth_reg[5]\(5),
      I1 => \cmd_depth[5]_i_3_n_0\,
      I2 => \cmd_depth_reg[5]\(3),
      I3 => \cmd_depth_reg[5]\(4),
      O => D(4)
    );
\cmd_depth[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555455545554D555"
    )
        port map (
      I0 => \cmd_depth_reg[5]\(3),
      I1 => \cmd_depth_reg[5]\(2),
      I2 => \cmd_depth_reg[5]\(1),
      I3 => \cmd_depth_reg[5]\(0),
      I4 => \^cmd_push_block_reg\,
      I5 => \USE_WRITE.wr_cmd_ready\,
      O => \cmd_depth[5]_i_3_n_0\
    );
cmd_empty_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"66F60090"
    )
        port map (
      I0 => \USE_WRITE.wr_cmd_ready\,
      I1 => \^cmd_push_block_reg\,
      I2 => almost_empty,
      I3 => cmd_empty0,
      I4 => cmd_empty,
      O => cmd_empty_reg
    );
cmd_empty_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^cmd_push_block_reg\,
      I1 => \USE_WRITE.wr_cmd_ready\,
      O => cmd_empty0
    );
fifo_gen_inst: entity work.bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_fifo_generator_v13_2_11
     port map (
      almost_empty => NLW_fifo_gen_inst_almost_empty_UNCONNECTED,
      almost_full => NLW_fifo_gen_inst_almost_full_UNCONNECTED,
      axi_ar_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_ar_data_count_UNCONNECTED(4 downto 0),
      axi_ar_dbiterr => NLW_fifo_gen_inst_axi_ar_dbiterr_UNCONNECTED,
      axi_ar_injectdbiterr => '0',
      axi_ar_injectsbiterr => '0',
      axi_ar_overflow => NLW_fifo_gen_inst_axi_ar_overflow_UNCONNECTED,
      axi_ar_prog_empty => NLW_fifo_gen_inst_axi_ar_prog_empty_UNCONNECTED,
      axi_ar_prog_empty_thresh(3 downto 0) => B"0000",
      axi_ar_prog_full => NLW_fifo_gen_inst_axi_ar_prog_full_UNCONNECTED,
      axi_ar_prog_full_thresh(3 downto 0) => B"0000",
      axi_ar_rd_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_ar_rd_data_count_UNCONNECTED(4 downto 0),
      axi_ar_sbiterr => NLW_fifo_gen_inst_axi_ar_sbiterr_UNCONNECTED,
      axi_ar_underflow => NLW_fifo_gen_inst_axi_ar_underflow_UNCONNECTED,
      axi_ar_wr_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_ar_wr_data_count_UNCONNECTED(4 downto 0),
      axi_aw_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_aw_data_count_UNCONNECTED(4 downto 0),
      axi_aw_dbiterr => NLW_fifo_gen_inst_axi_aw_dbiterr_UNCONNECTED,
      axi_aw_injectdbiterr => '0',
      axi_aw_injectsbiterr => '0',
      axi_aw_overflow => NLW_fifo_gen_inst_axi_aw_overflow_UNCONNECTED,
      axi_aw_prog_empty => NLW_fifo_gen_inst_axi_aw_prog_empty_UNCONNECTED,
      axi_aw_prog_empty_thresh(3 downto 0) => B"0000",
      axi_aw_prog_full => NLW_fifo_gen_inst_axi_aw_prog_full_UNCONNECTED,
      axi_aw_prog_full_thresh(3 downto 0) => B"0000",
      axi_aw_rd_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_aw_rd_data_count_UNCONNECTED(4 downto 0),
      axi_aw_sbiterr => NLW_fifo_gen_inst_axi_aw_sbiterr_UNCONNECTED,
      axi_aw_underflow => NLW_fifo_gen_inst_axi_aw_underflow_UNCONNECTED,
      axi_aw_wr_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_aw_wr_data_count_UNCONNECTED(4 downto 0),
      axi_b_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_b_data_count_UNCONNECTED(4 downto 0),
      axi_b_dbiterr => NLW_fifo_gen_inst_axi_b_dbiterr_UNCONNECTED,
      axi_b_injectdbiterr => '0',
      axi_b_injectsbiterr => '0',
      axi_b_overflow => NLW_fifo_gen_inst_axi_b_overflow_UNCONNECTED,
      axi_b_prog_empty => NLW_fifo_gen_inst_axi_b_prog_empty_UNCONNECTED,
      axi_b_prog_empty_thresh(3 downto 0) => B"0000",
      axi_b_prog_full => NLW_fifo_gen_inst_axi_b_prog_full_UNCONNECTED,
      axi_b_prog_full_thresh(3 downto 0) => B"0000",
      axi_b_rd_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_b_rd_data_count_UNCONNECTED(4 downto 0),
      axi_b_sbiterr => NLW_fifo_gen_inst_axi_b_sbiterr_UNCONNECTED,
      axi_b_underflow => NLW_fifo_gen_inst_axi_b_underflow_UNCONNECTED,
      axi_b_wr_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_b_wr_data_count_UNCONNECTED(4 downto 0),
      axi_r_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_r_data_count_UNCONNECTED(10 downto 0),
      axi_r_dbiterr => NLW_fifo_gen_inst_axi_r_dbiterr_UNCONNECTED,
      axi_r_injectdbiterr => '0',
      axi_r_injectsbiterr => '0',
      axi_r_overflow => NLW_fifo_gen_inst_axi_r_overflow_UNCONNECTED,
      axi_r_prog_empty => NLW_fifo_gen_inst_axi_r_prog_empty_UNCONNECTED,
      axi_r_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_r_prog_full => NLW_fifo_gen_inst_axi_r_prog_full_UNCONNECTED,
      axi_r_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_r_rd_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_r_rd_data_count_UNCONNECTED(10 downto 0),
      axi_r_sbiterr => NLW_fifo_gen_inst_axi_r_sbiterr_UNCONNECTED,
      axi_r_underflow => NLW_fifo_gen_inst_axi_r_underflow_UNCONNECTED,
      axi_r_wr_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_r_wr_data_count_UNCONNECTED(10 downto 0),
      axi_w_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_w_data_count_UNCONNECTED(10 downto 0),
      axi_w_dbiterr => NLW_fifo_gen_inst_axi_w_dbiterr_UNCONNECTED,
      axi_w_injectdbiterr => '0',
      axi_w_injectsbiterr => '0',
      axi_w_overflow => NLW_fifo_gen_inst_axi_w_overflow_UNCONNECTED,
      axi_w_prog_empty => NLW_fifo_gen_inst_axi_w_prog_empty_UNCONNECTED,
      axi_w_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_w_prog_full => NLW_fifo_gen_inst_axi_w_prog_full_UNCONNECTED,
      axi_w_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_w_rd_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_w_rd_data_count_UNCONNECTED(10 downto 0),
      axi_w_sbiterr => NLW_fifo_gen_inst_axi_w_sbiterr_UNCONNECTED,
      axi_w_underflow => NLW_fifo_gen_inst_axi_w_underflow_UNCONNECTED,
      axi_w_wr_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_w_wr_data_count_UNCONNECTED(10 downto 0),
      axis_data_count(10 downto 0) => NLW_fifo_gen_inst_axis_data_count_UNCONNECTED(10 downto 0),
      axis_dbiterr => NLW_fifo_gen_inst_axis_dbiterr_UNCONNECTED,
      axis_injectdbiterr => '0',
      axis_injectsbiterr => '0',
      axis_overflow => NLW_fifo_gen_inst_axis_overflow_UNCONNECTED,
      axis_prog_empty => NLW_fifo_gen_inst_axis_prog_empty_UNCONNECTED,
      axis_prog_empty_thresh(9 downto 0) => B"0000000000",
      axis_prog_full => NLW_fifo_gen_inst_axis_prog_full_UNCONNECTED,
      axis_prog_full_thresh(9 downto 0) => B"0000000000",
      axis_rd_data_count(10 downto 0) => NLW_fifo_gen_inst_axis_rd_data_count_UNCONNECTED(10 downto 0),
      axis_sbiterr => NLW_fifo_gen_inst_axis_sbiterr_UNCONNECTED,
      axis_underflow => NLW_fifo_gen_inst_axis_underflow_UNCONNECTED,
      axis_wr_data_count(10 downto 0) => NLW_fifo_gen_inst_axis_wr_data_count_UNCONNECTED(10 downto 0),
      backup => '0',
      backup_marker => '0',
      clk => aclk,
      data_count(5 downto 0) => NLW_fifo_gen_inst_data_count_UNCONNECTED(5 downto 0),
      dbiterr => NLW_fifo_gen_inst_dbiterr_UNCONNECTED,
      din(4) => \^din\(0),
      din(3 downto 0) => Q(3 downto 0),
      dout(4 downto 0) => \goreg_dm.dout_i_reg[4]\(4 downto 0),
      empty => \^empty\,
      full => \^full\,
      injectdbiterr => '0',
      injectsbiterr => '0',
      int_clk => '0',
      m_aclk => '0',
      m_aclk_en => '0',
      m_axi_araddr(31 downto 0) => NLW_fifo_gen_inst_m_axi_araddr_UNCONNECTED(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_fifo_gen_inst_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arcache(3 downto 0) => NLW_fifo_gen_inst_m_axi_arcache_UNCONNECTED(3 downto 0),
      m_axi_arid(3 downto 0) => NLW_fifo_gen_inst_m_axi_arid_UNCONNECTED(3 downto 0),
      m_axi_arlen(7 downto 0) => NLW_fifo_gen_inst_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arlock(1 downto 0) => NLW_fifo_gen_inst_m_axi_arlock_UNCONNECTED(1 downto 0),
      m_axi_arprot(2 downto 0) => NLW_fifo_gen_inst_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_fifo_gen_inst_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => '0',
      m_axi_arregion(3 downto 0) => NLW_fifo_gen_inst_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => NLW_fifo_gen_inst_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_aruser(0) => NLW_fifo_gen_inst_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => NLW_fifo_gen_inst_m_axi_arvalid_UNCONNECTED,
      m_axi_awaddr(31 downto 0) => NLW_fifo_gen_inst_m_axi_awaddr_UNCONNECTED(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_fifo_gen_inst_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awcache(3 downto 0) => NLW_fifo_gen_inst_m_axi_awcache_UNCONNECTED(3 downto 0),
      m_axi_awid(3 downto 0) => NLW_fifo_gen_inst_m_axi_awid_UNCONNECTED(3 downto 0),
      m_axi_awlen(7 downto 0) => NLW_fifo_gen_inst_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awlock(1 downto 0) => NLW_fifo_gen_inst_m_axi_awlock_UNCONNECTED(1 downto 0),
      m_axi_awprot(2 downto 0) => NLW_fifo_gen_inst_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awqos(3 downto 0) => NLW_fifo_gen_inst_m_axi_awqos_UNCONNECTED(3 downto 0),
      m_axi_awready => '0',
      m_axi_awregion(3 downto 0) => NLW_fifo_gen_inst_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => NLW_fifo_gen_inst_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awuser(0) => NLW_fifo_gen_inst_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => NLW_fifo_gen_inst_m_axi_awvalid_UNCONNECTED,
      m_axi_bid(3 downto 0) => B"0000",
      m_axi_bready => NLW_fifo_gen_inst_m_axi_bready_UNCONNECTED,
      m_axi_bresp(1 downto 0) => B"00",
      m_axi_buser(0) => '0',
      m_axi_bvalid => '0',
      m_axi_rdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      m_axi_rid(3 downto 0) => B"0000",
      m_axi_rlast => '0',
      m_axi_rready => NLW_fifo_gen_inst_m_axi_rready_UNCONNECTED,
      m_axi_rresp(1 downto 0) => B"00",
      m_axi_ruser(0) => '0',
      m_axi_rvalid => '0',
      m_axi_wdata(63 downto 0) => NLW_fifo_gen_inst_m_axi_wdata_UNCONNECTED(63 downto 0),
      m_axi_wid(3 downto 0) => NLW_fifo_gen_inst_m_axi_wid_UNCONNECTED(3 downto 0),
      m_axi_wlast => NLW_fifo_gen_inst_m_axi_wlast_UNCONNECTED,
      m_axi_wready => '0',
      m_axi_wstrb(7 downto 0) => NLW_fifo_gen_inst_m_axi_wstrb_UNCONNECTED(7 downto 0),
      m_axi_wuser(0) => NLW_fifo_gen_inst_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => NLW_fifo_gen_inst_m_axi_wvalid_UNCONNECTED,
      m_axis_tdata(63 downto 0) => NLW_fifo_gen_inst_m_axis_tdata_UNCONNECTED(63 downto 0),
      m_axis_tdest(3 downto 0) => NLW_fifo_gen_inst_m_axis_tdest_UNCONNECTED(3 downto 0),
      m_axis_tid(7 downto 0) => NLW_fifo_gen_inst_m_axis_tid_UNCONNECTED(7 downto 0),
      m_axis_tkeep(3 downto 0) => NLW_fifo_gen_inst_m_axis_tkeep_UNCONNECTED(3 downto 0),
      m_axis_tlast => NLW_fifo_gen_inst_m_axis_tlast_UNCONNECTED,
      m_axis_tready => '0',
      m_axis_tstrb(3 downto 0) => NLW_fifo_gen_inst_m_axis_tstrb_UNCONNECTED(3 downto 0),
      m_axis_tuser(3 downto 0) => NLW_fifo_gen_inst_m_axis_tuser_UNCONNECTED(3 downto 0),
      m_axis_tvalid => NLW_fifo_gen_inst_m_axis_tvalid_UNCONNECTED,
      overflow => NLW_fifo_gen_inst_overflow_UNCONNECTED,
      prog_empty => NLW_fifo_gen_inst_prog_empty_UNCONNECTED,
      prog_empty_thresh(4 downto 0) => B"00000",
      prog_empty_thresh_assert(4 downto 0) => B"00000",
      prog_empty_thresh_negate(4 downto 0) => B"00000",
      prog_full => NLW_fifo_gen_inst_prog_full_UNCONNECTED,
      prog_full_thresh(4 downto 0) => B"00000",
      prog_full_thresh_assert(4 downto 0) => B"00000",
      prog_full_thresh_negate(4 downto 0) => B"00000",
      rd_clk => '0',
      rd_data_count(5 downto 0) => NLW_fifo_gen_inst_rd_data_count_UNCONNECTED(5 downto 0),
      rd_en => \^rd_en\,
      rd_rst => '0',
      rd_rst_busy => NLW_fifo_gen_inst_rd_rst_busy_UNCONNECTED,
      rst => SR(0),
      s_aclk => '0',
      s_aclk_en => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arcache(3 downto 0) => B"0000",
      s_axi_arid(3 downto 0) => B"0000",
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arlock(1 downto 0) => B"00",
      s_axi_arprot(2 downto 0) => B"000",
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => NLW_fifo_gen_inst_s_axi_arready_UNCONNECTED,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_aruser(0) => '0',
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awcache(3 downto 0) => B"0000",
      s_axi_awid(3 downto 0) => B"0000",
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awlock(1 downto 0) => B"00",
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => NLW_fifo_gen_inst_s_axi_awready_UNCONNECTED,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awuser(0) => '0',
      s_axi_awvalid => '0',
      s_axi_bid(3 downto 0) => NLW_fifo_gen_inst_s_axi_bid_UNCONNECTED(3 downto 0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_fifo_gen_inst_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_buser(0) => NLW_fifo_gen_inst_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => NLW_fifo_gen_inst_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(63 downto 0) => NLW_fifo_gen_inst_s_axi_rdata_UNCONNECTED(63 downto 0),
      s_axi_rid(3 downto 0) => NLW_fifo_gen_inst_s_axi_rid_UNCONNECTED(3 downto 0),
      s_axi_rlast => NLW_fifo_gen_inst_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_fifo_gen_inst_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_ruser(0) => NLW_fifo_gen_inst_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => NLW_fifo_gen_inst_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axi_wid(3 downto 0) => B"0000",
      s_axi_wlast => '0',
      s_axi_wready => NLW_fifo_gen_inst_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(7 downto 0) => B"00000000",
      s_axi_wuser(0) => '0',
      s_axi_wvalid => '0',
      s_axis_tdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axis_tdest(3 downto 0) => B"0000",
      s_axis_tid(7 downto 0) => B"00000000",
      s_axis_tkeep(3 downto 0) => B"0000",
      s_axis_tlast => '0',
      s_axis_tready => NLW_fifo_gen_inst_s_axis_tready_UNCONNECTED,
      s_axis_tstrb(3 downto 0) => B"0000",
      s_axis_tuser(3 downto 0) => B"0000",
      s_axis_tvalid => '0',
      sbiterr => NLW_fifo_gen_inst_sbiterr_UNCONNECTED,
      sleep => '0',
      srst => '0',
      underflow => NLW_fifo_gen_inst_underflow_UNCONNECTED,
      valid => NLW_fifo_gen_inst_valid_UNCONNECTED,
      wr_ack => NLW_fifo_gen_inst_wr_ack_UNCONNECTED,
      wr_clk => '0',
      wr_data_count(5 downto 0) => NLW_fifo_gen_inst_wr_data_count_UNCONNECTED(5 downto 0),
      wr_en => ram_full_fb_i_reg,
      wr_rst => '0',
      wr_rst_busy => NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED
    );
fifo_gen_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^cmd_push_block_reg\,
      O => wr_en
    );
\fifo_gen_inst_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => need_to_split_q,
      I1 => \^last_split__1\,
      O => \^din\(0)
    );
fifo_gen_inst_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^empty\,
      I1 => m_axi_bvalid,
      I2 => s_axi_bready,
      I3 => last_word,
      O => \^rd_en\
    );
\fifo_gen_inst_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFBFFFBFFFBFFFF"
    )
        port map (
      I0 => cmd_push_block,
      I1 => command_ongoing,
      I2 => \^full\,
      I3 => \queue_id_reg[0]_0\,
      I4 => \^s_axi_aid_q_reg[0]\,
      I5 => \^split_in_progress_reg\,
      O => \^cmd_push_block_reg\
    );
m_axi_awvalid_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFD5D5FF"
    )
        port map (
      I0 => m_axi_awvalid,
      I1 => cmd_b_empty,
      I2 => cmd_empty,
      I3 => queue_id,
      I4 => \queue_id_reg[0]_1\,
      I5 => need_to_split_q,
      O => \^split_in_progress_reg\
    );
m_axi_awvalid_INST_0_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F999"
    )
        port map (
      I0 => \queue_id_reg[0]_1\,
      I1 => queue_id,
      I2 => cmd_empty,
      I3 => cmd_b_empty,
      I4 => multiple_id_non_split,
      O => \^s_axi_aid_q_reg[0]\
    );
multiple_id_non_split_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F5D5D5D5"
    )
        port map (
      I0 => aresetn,
      I1 => cmd_empty,
      I2 => multiple_id_non_split_i_4_n_0,
      I3 => almost_empty,
      I4 => \USE_WRITE.wr_cmd_ready\,
      O => split_in_progress
    );
multiple_id_non_split_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF40000000"
    )
        port map (
      I0 => \^empty\,
      I1 => m_axi_bvalid,
      I2 => s_axi_bready,
      I3 => last_word,
      I4 => almost_b_empty,
      I5 => cmd_b_empty,
      O => multiple_id_non_split_i_4_n_0
    );
\queue_id[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => queue_id,
      I1 => \^cmd_push_block_reg\,
      I2 => \queue_id_reg[0]_1\,
      O => \queue_id_reg[0]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__parameterized0\ is
  port (
    din : out STD_LOGIC_VECTOR ( 0 to 0 );
    rd_en : out STD_LOGIC;
    ram_full_i_reg : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    multiple_id_non_split0 : out STD_LOGIC;
    cmd_push_block_reg : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 4 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    split_in_progress : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rlast : out STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axi_arvalid_0 : out STD_LOGIC;
    \queue_id_reg[0]\ : out STD_LOGIC;
    s_axi_arvalid_1 : out STD_LOGIC;
    empty_fwft_i_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    aclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    command_ongoing : in STD_LOGIC;
    cmd_push_block : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    cmd_empty : in STD_LOGIC;
    \queue_id_reg[0]_0\ : in STD_LOGIC;
    \queue_id_reg[0]_1\ : in STD_LOGIC;
    cmd_push_block_reg_0 : in STD_LOGIC;
    need_to_split_q : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    multiple_id_non_split : in STD_LOGIC;
    almost_empty : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_rlast : in STD_LOGIC;
    split_ongoing_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    split_ongoing_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    access_is_incr_q : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    command_ongoing_reg : in STD_LOGIC;
    areset_d : in STD_LOGIC_VECTOR ( 1 downto 0 );
    command_ongoing_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__parameterized0\ : entity is "axi_data_fifo_v2_1_32_fifo_gen";
end \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__parameterized0\;

architecture STRUCTURE of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__parameterized0\ is
  signal \S_AXI_AREADY_I_i_3__0_n_0\ : STD_LOGIC;
  signal \S_AXI_AREADY_I_i_4__0_n_0\ : STD_LOGIC;
  signal \USE_READ.USE_SPLIT_R.rd_cmd_split\ : STD_LOGIC;
  signal \cmd_depth[5]_i_3__0_n_0\ : STD_LOGIC;
  signal cmd_empty0 : STD_LOGIC;
  signal cmd_push : STD_LOGIC;
  signal \^cmd_push_block_reg\ : STD_LOGIC;
  signal \^din\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal empty : STD_LOGIC;
  signal full : STD_LOGIC;
  signal \last_split__1\ : STD_LOGIC;
  signal m_axi_arvalid_INST_0_i_1_n_0 : STD_LOGIC;
  signal \^rd_en\ : STD_LOGIC;
  signal NLW_fifo_gen_inst_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axis_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_ar_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_ar_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_aw_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_aw_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_aw_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_b_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_b_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_b_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_r_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_r_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_r_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_w_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_w_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_w_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_m_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_m_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \S_AXI_AREADY_I_i_3__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cmd_depth[1]_i_1__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \cmd_depth[2]_i_1__0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \cmd_depth[3]_i_1__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \cmd_depth[4]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \cmd_depth[5]_i_1__0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \cmd_depth[5]_i_3__0\ : label is "soft_lutpair7";
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of fifo_gen_inst : label is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of fifo_gen_inst : label is 64;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of fifo_gen_inst : label is 8;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of fifo_gen_inst : label is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of fifo_gen_inst : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of fifo_gen_inst : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of fifo_gen_inst : label is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of fifo_gen_inst : label is 2;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of fifo_gen_inst : label is 0;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of fifo_gen_inst : label is 1;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of fifo_gen_inst : label is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of fifo_gen_inst : label is 6;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of fifo_gen_inst : label is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of fifo_gen_inst : label is 1;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of fifo_gen_inst : label is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of fifo_gen_inst : label is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of fifo_gen_inst : label is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of fifo_gen_inst : label is 32;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of fifo_gen_inst : label is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of fifo_gen_inst : label is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of fifo_gen_inst : label is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of fifo_gen_inst : label is 1;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of fifo_gen_inst : label is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of fifo_gen_inst : label is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of fifo_gen_inst : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of fifo_gen_inst : label is "zynq";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of fifo_gen_inst : label is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of fifo_gen_inst : label is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of fifo_gen_inst : label is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of fifo_gen_inst : label is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of fifo_gen_inst : label is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of fifo_gen_inst : label is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of fifo_gen_inst : label is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of fifo_gen_inst : label is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of fifo_gen_inst : label is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of fifo_gen_inst : label is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of fifo_gen_inst : label is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of fifo_gen_inst : label is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of fifo_gen_inst : label is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of fifo_gen_inst : label is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of fifo_gen_inst : label is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of fifo_gen_inst : label is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of fifo_gen_inst : label is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of fifo_gen_inst : label is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of fifo_gen_inst : label is 0;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of fifo_gen_inst : label is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of fifo_gen_inst : label is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of fifo_gen_inst : label is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of fifo_gen_inst : label is 2;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of fifo_gen_inst : label is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of fifo_gen_inst : label is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of fifo_gen_inst : label is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of fifo_gen_inst : label is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of fifo_gen_inst : label is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of fifo_gen_inst : label is 0;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of fifo_gen_inst : label is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of fifo_gen_inst : label is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of fifo_gen_inst : label is 4;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of fifo_gen_inst : label is 5;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of fifo_gen_inst : label is 31;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of fifo_gen_inst : label is 30;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of fifo_gen_inst : label is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of fifo_gen_inst : label is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of fifo_gen_inst : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of fifo_gen_inst : label is 6;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of fifo_gen_inst : label is 32;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of fifo_gen_inst : label is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of fifo_gen_inst : label is 5;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of fifo_gen_inst : label is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of fifo_gen_inst : label is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of fifo_gen_inst : label is 3;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of fifo_gen_inst : label is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of fifo_gen_inst : label is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of fifo_gen_inst : label is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of fifo_gen_inst : label is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of fifo_gen_inst : label is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of fifo_gen_inst : label is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of fifo_gen_inst : label is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of fifo_gen_inst : label is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of fifo_gen_inst : label is 1;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of fifo_gen_inst : label is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of fifo_gen_inst : label is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of fifo_gen_inst : label is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of fifo_gen_inst : label is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of fifo_gen_inst : label is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of fifo_gen_inst : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of fifo_gen_inst : label is 6;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of fifo_gen_inst : label is 32;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of fifo_gen_inst : label is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of fifo_gen_inst : label is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of fifo_gen_inst : label is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of fifo_gen_inst : label is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of fifo_gen_inst : label is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of fifo_gen_inst : label is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of fifo_gen_inst : label is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of fifo_gen_inst : label is 5;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of fifo_gen_inst : label is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of fifo_gen_inst : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of fifo_gen_inst : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of fifo_gen_inst : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of fifo_gen_inst : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of fifo_gen_inst : label is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of fifo_gen_inst : label is 1;
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of fifo_gen_inst : label is "soft";
  attribute is_du_within_envelope : string;
  attribute is_du_within_envelope of fifo_gen_inst : label is "true";
  attribute SOFT_HLUTNM of \fifo_gen_inst_i_2__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \fifo_gen_inst_i_3__1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \fifo_gen_inst_i_4__0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of m_axi_arvalid_INST_0 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of m_axi_rready_INST_0 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \queue_id[0]_i_1__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of s_axi_rvalid_INST_0 : label is "soft_lutpair11";
begin
  cmd_push_block_reg <= \^cmd_push_block_reg\;
  din(0) <= \^din\(0);
  rd_en <= \^rd_en\;
\S_AXI_AREADY_I_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44744474FFFF4474"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => command_ongoing_reg,
      I2 => \last_split__1\,
      I3 => \S_AXI_AREADY_I_i_3__0_n_0\,
      I4 => areset_d(1),
      I5 => areset_d(0),
      O => s_axi_arvalid_0
    );
S_AXI_AREADY_I_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"82000082FFFFFFFF"
    )
        port map (
      I0 => \S_AXI_AREADY_I_i_4__0_n_0\,
      I1 => split_ongoing_reg(0),
      I2 => split_ongoing_reg_0(0),
      I3 => split_ongoing_reg(3),
      I4 => split_ongoing_reg_0(3),
      I5 => access_is_incr_q,
      O => \last_split__1\
    );
\S_AXI_AREADY_I_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FDFFFFF"
    )
        port map (
      I0 => m_axi_arvalid_INST_0_i_1_n_0,
      I1 => full,
      I2 => command_ongoing,
      I3 => cmd_push_block,
      I4 => m_axi_arready,
      O => \S_AXI_AREADY_I_i_3__0_n_0\
    );
\S_AXI_AREADY_I_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => split_ongoing_reg_0(2),
      I1 => split_ongoing_reg(2),
      I2 => split_ongoing_reg_0(1),
      I3 => split_ongoing_reg(1),
      O => \S_AXI_AREADY_I_i_4__0_n_0\
    );
\cmd_depth[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => cmd_empty0,
      I1 => Q(1),
      I2 => Q(0),
      O => D(0)
    );
\cmd_depth[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AA9"
    )
        port map (
      I0 => Q(2),
      I1 => cmd_empty0,
      I2 => Q(1),
      I3 => Q(0),
      O => D(1)
    );
\cmd_depth[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAA9"
    )
        port map (
      I0 => Q(3),
      I1 => cmd_empty0,
      I2 => Q(0),
      I3 => Q(1),
      I4 => Q(2),
      O => D(2)
    );
\cmd_depth[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAA9"
    )
        port map (
      I0 => Q(4),
      I1 => cmd_empty0,
      I2 => Q(0),
      I3 => Q(1),
      I4 => Q(2),
      I5 => Q(3),
      O => D(3)
    );
\cmd_depth[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => m_axi_arvalid_INST_0_i_1_n_0,
      I1 => full,
      I2 => command_ongoing,
      I3 => cmd_push_block,
      I4 => \^rd_en\,
      O => cmd_empty0
    );
\cmd_depth[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4000BFFF"
    )
        port map (
      I0 => empty,
      I1 => m_axi_rvalid,
      I2 => s_axi_rready,
      I3 => m_axi_rlast,
      I4 => \^cmd_push_block_reg\,
      O => empty_fwft_i_reg(0)
    );
\cmd_depth[5]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AA9"
    )
        port map (
      I0 => Q(5),
      I1 => \cmd_depth[5]_i_3__0_n_0\,
      I2 => Q(3),
      I3 => Q(4),
      O => D(4)
    );
\cmd_depth[5]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D5555554"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(1),
      I3 => Q(0),
      I4 => cmd_empty0,
      O => \cmd_depth[5]_i_3__0_n_0\
    );
\cmd_push_block_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F000000FF200000"
    )
        port map (
      I0 => m_axi_arvalid_INST_0_i_1_n_0,
      I1 => full,
      I2 => command_ongoing,
      I3 => cmd_push_block,
      I4 => aresetn,
      I5 => m_axi_arready,
      O => ram_full_i_reg
    );
\command_ongoing_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF8FFFFF88880000"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => command_ongoing_reg,
      I2 => \last_split__1\,
      I3 => \S_AXI_AREADY_I_i_3__0_n_0\,
      I4 => command_ongoing_reg_0,
      I5 => command_ongoing,
      O => s_axi_arvalid_1
    );
fifo_gen_inst: entity work.\bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_fifo_generator_v13_2_11__parameterized0\
     port map (
      almost_empty => NLW_fifo_gen_inst_almost_empty_UNCONNECTED,
      almost_full => NLW_fifo_gen_inst_almost_full_UNCONNECTED,
      axi_ar_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_ar_data_count_UNCONNECTED(4 downto 0),
      axi_ar_dbiterr => NLW_fifo_gen_inst_axi_ar_dbiterr_UNCONNECTED,
      axi_ar_injectdbiterr => '0',
      axi_ar_injectsbiterr => '0',
      axi_ar_overflow => NLW_fifo_gen_inst_axi_ar_overflow_UNCONNECTED,
      axi_ar_prog_empty => NLW_fifo_gen_inst_axi_ar_prog_empty_UNCONNECTED,
      axi_ar_prog_empty_thresh(3 downto 0) => B"0000",
      axi_ar_prog_full => NLW_fifo_gen_inst_axi_ar_prog_full_UNCONNECTED,
      axi_ar_prog_full_thresh(3 downto 0) => B"0000",
      axi_ar_rd_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_ar_rd_data_count_UNCONNECTED(4 downto 0),
      axi_ar_sbiterr => NLW_fifo_gen_inst_axi_ar_sbiterr_UNCONNECTED,
      axi_ar_underflow => NLW_fifo_gen_inst_axi_ar_underflow_UNCONNECTED,
      axi_ar_wr_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_ar_wr_data_count_UNCONNECTED(4 downto 0),
      axi_aw_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_aw_data_count_UNCONNECTED(4 downto 0),
      axi_aw_dbiterr => NLW_fifo_gen_inst_axi_aw_dbiterr_UNCONNECTED,
      axi_aw_injectdbiterr => '0',
      axi_aw_injectsbiterr => '0',
      axi_aw_overflow => NLW_fifo_gen_inst_axi_aw_overflow_UNCONNECTED,
      axi_aw_prog_empty => NLW_fifo_gen_inst_axi_aw_prog_empty_UNCONNECTED,
      axi_aw_prog_empty_thresh(3 downto 0) => B"0000",
      axi_aw_prog_full => NLW_fifo_gen_inst_axi_aw_prog_full_UNCONNECTED,
      axi_aw_prog_full_thresh(3 downto 0) => B"0000",
      axi_aw_rd_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_aw_rd_data_count_UNCONNECTED(4 downto 0),
      axi_aw_sbiterr => NLW_fifo_gen_inst_axi_aw_sbiterr_UNCONNECTED,
      axi_aw_underflow => NLW_fifo_gen_inst_axi_aw_underflow_UNCONNECTED,
      axi_aw_wr_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_aw_wr_data_count_UNCONNECTED(4 downto 0),
      axi_b_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_b_data_count_UNCONNECTED(4 downto 0),
      axi_b_dbiterr => NLW_fifo_gen_inst_axi_b_dbiterr_UNCONNECTED,
      axi_b_injectdbiterr => '0',
      axi_b_injectsbiterr => '0',
      axi_b_overflow => NLW_fifo_gen_inst_axi_b_overflow_UNCONNECTED,
      axi_b_prog_empty => NLW_fifo_gen_inst_axi_b_prog_empty_UNCONNECTED,
      axi_b_prog_empty_thresh(3 downto 0) => B"0000",
      axi_b_prog_full => NLW_fifo_gen_inst_axi_b_prog_full_UNCONNECTED,
      axi_b_prog_full_thresh(3 downto 0) => B"0000",
      axi_b_rd_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_b_rd_data_count_UNCONNECTED(4 downto 0),
      axi_b_sbiterr => NLW_fifo_gen_inst_axi_b_sbiterr_UNCONNECTED,
      axi_b_underflow => NLW_fifo_gen_inst_axi_b_underflow_UNCONNECTED,
      axi_b_wr_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_b_wr_data_count_UNCONNECTED(4 downto 0),
      axi_r_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_r_data_count_UNCONNECTED(10 downto 0),
      axi_r_dbiterr => NLW_fifo_gen_inst_axi_r_dbiterr_UNCONNECTED,
      axi_r_injectdbiterr => '0',
      axi_r_injectsbiterr => '0',
      axi_r_overflow => NLW_fifo_gen_inst_axi_r_overflow_UNCONNECTED,
      axi_r_prog_empty => NLW_fifo_gen_inst_axi_r_prog_empty_UNCONNECTED,
      axi_r_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_r_prog_full => NLW_fifo_gen_inst_axi_r_prog_full_UNCONNECTED,
      axi_r_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_r_rd_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_r_rd_data_count_UNCONNECTED(10 downto 0),
      axi_r_sbiterr => NLW_fifo_gen_inst_axi_r_sbiterr_UNCONNECTED,
      axi_r_underflow => NLW_fifo_gen_inst_axi_r_underflow_UNCONNECTED,
      axi_r_wr_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_r_wr_data_count_UNCONNECTED(10 downto 0),
      axi_w_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_w_data_count_UNCONNECTED(10 downto 0),
      axi_w_dbiterr => NLW_fifo_gen_inst_axi_w_dbiterr_UNCONNECTED,
      axi_w_injectdbiterr => '0',
      axi_w_injectsbiterr => '0',
      axi_w_overflow => NLW_fifo_gen_inst_axi_w_overflow_UNCONNECTED,
      axi_w_prog_empty => NLW_fifo_gen_inst_axi_w_prog_empty_UNCONNECTED,
      axi_w_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_w_prog_full => NLW_fifo_gen_inst_axi_w_prog_full_UNCONNECTED,
      axi_w_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_w_rd_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_w_rd_data_count_UNCONNECTED(10 downto 0),
      axi_w_sbiterr => NLW_fifo_gen_inst_axi_w_sbiterr_UNCONNECTED,
      axi_w_underflow => NLW_fifo_gen_inst_axi_w_underflow_UNCONNECTED,
      axi_w_wr_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_w_wr_data_count_UNCONNECTED(10 downto 0),
      axis_data_count(10 downto 0) => NLW_fifo_gen_inst_axis_data_count_UNCONNECTED(10 downto 0),
      axis_dbiterr => NLW_fifo_gen_inst_axis_dbiterr_UNCONNECTED,
      axis_injectdbiterr => '0',
      axis_injectsbiterr => '0',
      axis_overflow => NLW_fifo_gen_inst_axis_overflow_UNCONNECTED,
      axis_prog_empty => NLW_fifo_gen_inst_axis_prog_empty_UNCONNECTED,
      axis_prog_empty_thresh(9 downto 0) => B"0000000000",
      axis_prog_full => NLW_fifo_gen_inst_axis_prog_full_UNCONNECTED,
      axis_prog_full_thresh(9 downto 0) => B"0000000000",
      axis_rd_data_count(10 downto 0) => NLW_fifo_gen_inst_axis_rd_data_count_UNCONNECTED(10 downto 0),
      axis_sbiterr => NLW_fifo_gen_inst_axis_sbiterr_UNCONNECTED,
      axis_underflow => NLW_fifo_gen_inst_axis_underflow_UNCONNECTED,
      axis_wr_data_count(10 downto 0) => NLW_fifo_gen_inst_axis_wr_data_count_UNCONNECTED(10 downto 0),
      backup => '0',
      backup_marker => '0',
      clk => aclk,
      data_count(5 downto 0) => NLW_fifo_gen_inst_data_count_UNCONNECTED(5 downto 0),
      dbiterr => NLW_fifo_gen_inst_dbiterr_UNCONNECTED,
      din(0) => \^din\(0),
      dout(0) => \USE_READ.USE_SPLIT_R.rd_cmd_split\,
      empty => empty,
      full => full,
      injectdbiterr => '0',
      injectsbiterr => '0',
      int_clk => '0',
      m_aclk => '0',
      m_aclk_en => '0',
      m_axi_araddr(31 downto 0) => NLW_fifo_gen_inst_m_axi_araddr_UNCONNECTED(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_fifo_gen_inst_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arcache(3 downto 0) => NLW_fifo_gen_inst_m_axi_arcache_UNCONNECTED(3 downto 0),
      m_axi_arid(3 downto 0) => NLW_fifo_gen_inst_m_axi_arid_UNCONNECTED(3 downto 0),
      m_axi_arlen(7 downto 0) => NLW_fifo_gen_inst_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arlock(1 downto 0) => NLW_fifo_gen_inst_m_axi_arlock_UNCONNECTED(1 downto 0),
      m_axi_arprot(2 downto 0) => NLW_fifo_gen_inst_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_fifo_gen_inst_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => '0',
      m_axi_arregion(3 downto 0) => NLW_fifo_gen_inst_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => NLW_fifo_gen_inst_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_aruser(0) => NLW_fifo_gen_inst_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => NLW_fifo_gen_inst_m_axi_arvalid_UNCONNECTED,
      m_axi_awaddr(31 downto 0) => NLW_fifo_gen_inst_m_axi_awaddr_UNCONNECTED(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_fifo_gen_inst_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awcache(3 downto 0) => NLW_fifo_gen_inst_m_axi_awcache_UNCONNECTED(3 downto 0),
      m_axi_awid(3 downto 0) => NLW_fifo_gen_inst_m_axi_awid_UNCONNECTED(3 downto 0),
      m_axi_awlen(7 downto 0) => NLW_fifo_gen_inst_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awlock(1 downto 0) => NLW_fifo_gen_inst_m_axi_awlock_UNCONNECTED(1 downto 0),
      m_axi_awprot(2 downto 0) => NLW_fifo_gen_inst_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awqos(3 downto 0) => NLW_fifo_gen_inst_m_axi_awqos_UNCONNECTED(3 downto 0),
      m_axi_awready => '0',
      m_axi_awregion(3 downto 0) => NLW_fifo_gen_inst_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => NLW_fifo_gen_inst_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awuser(0) => NLW_fifo_gen_inst_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => NLW_fifo_gen_inst_m_axi_awvalid_UNCONNECTED,
      m_axi_bid(3 downto 0) => B"0000",
      m_axi_bready => NLW_fifo_gen_inst_m_axi_bready_UNCONNECTED,
      m_axi_bresp(1 downto 0) => B"00",
      m_axi_buser(0) => '0',
      m_axi_bvalid => '0',
      m_axi_rdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      m_axi_rid(3 downto 0) => B"0000",
      m_axi_rlast => '0',
      m_axi_rready => NLW_fifo_gen_inst_m_axi_rready_UNCONNECTED,
      m_axi_rresp(1 downto 0) => B"00",
      m_axi_ruser(0) => '0',
      m_axi_rvalid => '0',
      m_axi_wdata(63 downto 0) => NLW_fifo_gen_inst_m_axi_wdata_UNCONNECTED(63 downto 0),
      m_axi_wid(3 downto 0) => NLW_fifo_gen_inst_m_axi_wid_UNCONNECTED(3 downto 0),
      m_axi_wlast => NLW_fifo_gen_inst_m_axi_wlast_UNCONNECTED,
      m_axi_wready => '0',
      m_axi_wstrb(7 downto 0) => NLW_fifo_gen_inst_m_axi_wstrb_UNCONNECTED(7 downto 0),
      m_axi_wuser(0) => NLW_fifo_gen_inst_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => NLW_fifo_gen_inst_m_axi_wvalid_UNCONNECTED,
      m_axis_tdata(63 downto 0) => NLW_fifo_gen_inst_m_axis_tdata_UNCONNECTED(63 downto 0),
      m_axis_tdest(3 downto 0) => NLW_fifo_gen_inst_m_axis_tdest_UNCONNECTED(3 downto 0),
      m_axis_tid(7 downto 0) => NLW_fifo_gen_inst_m_axis_tid_UNCONNECTED(7 downto 0),
      m_axis_tkeep(3 downto 0) => NLW_fifo_gen_inst_m_axis_tkeep_UNCONNECTED(3 downto 0),
      m_axis_tlast => NLW_fifo_gen_inst_m_axis_tlast_UNCONNECTED,
      m_axis_tready => '0',
      m_axis_tstrb(3 downto 0) => NLW_fifo_gen_inst_m_axis_tstrb_UNCONNECTED(3 downto 0),
      m_axis_tuser(3 downto 0) => NLW_fifo_gen_inst_m_axis_tuser_UNCONNECTED(3 downto 0),
      m_axis_tvalid => NLW_fifo_gen_inst_m_axis_tvalid_UNCONNECTED,
      overflow => NLW_fifo_gen_inst_overflow_UNCONNECTED,
      prog_empty => NLW_fifo_gen_inst_prog_empty_UNCONNECTED,
      prog_empty_thresh(4 downto 0) => B"00000",
      prog_empty_thresh_assert(4 downto 0) => B"00000",
      prog_empty_thresh_negate(4 downto 0) => B"00000",
      prog_full => NLW_fifo_gen_inst_prog_full_UNCONNECTED,
      prog_full_thresh(4 downto 0) => B"00000",
      prog_full_thresh_assert(4 downto 0) => B"00000",
      prog_full_thresh_negate(4 downto 0) => B"00000",
      rd_clk => '0',
      rd_data_count(5 downto 0) => NLW_fifo_gen_inst_rd_data_count_UNCONNECTED(5 downto 0),
      rd_en => \^rd_en\,
      rd_rst => '0',
      rd_rst_busy => NLW_fifo_gen_inst_rd_rst_busy_UNCONNECTED,
      rst => SR(0),
      s_aclk => '0',
      s_aclk_en => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arcache(3 downto 0) => B"0000",
      s_axi_arid(3 downto 0) => B"0000",
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arlock(1 downto 0) => B"00",
      s_axi_arprot(2 downto 0) => B"000",
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => NLW_fifo_gen_inst_s_axi_arready_UNCONNECTED,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_aruser(0) => '0',
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awcache(3 downto 0) => B"0000",
      s_axi_awid(3 downto 0) => B"0000",
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awlock(1 downto 0) => B"00",
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => NLW_fifo_gen_inst_s_axi_awready_UNCONNECTED,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awuser(0) => '0',
      s_axi_awvalid => '0',
      s_axi_bid(3 downto 0) => NLW_fifo_gen_inst_s_axi_bid_UNCONNECTED(3 downto 0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_fifo_gen_inst_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_buser(0) => NLW_fifo_gen_inst_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => NLW_fifo_gen_inst_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(63 downto 0) => NLW_fifo_gen_inst_s_axi_rdata_UNCONNECTED(63 downto 0),
      s_axi_rid(3 downto 0) => NLW_fifo_gen_inst_s_axi_rid_UNCONNECTED(3 downto 0),
      s_axi_rlast => NLW_fifo_gen_inst_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_fifo_gen_inst_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_ruser(0) => NLW_fifo_gen_inst_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => NLW_fifo_gen_inst_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axi_wid(3 downto 0) => B"0000",
      s_axi_wlast => '0',
      s_axi_wready => NLW_fifo_gen_inst_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(7 downto 0) => B"00000000",
      s_axi_wuser(0) => '0',
      s_axi_wvalid => '0',
      s_axis_tdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axis_tdest(3 downto 0) => B"0000",
      s_axis_tid(7 downto 0) => B"00000000",
      s_axis_tkeep(3 downto 0) => B"0000",
      s_axis_tlast => '0',
      s_axis_tready => NLW_fifo_gen_inst_s_axis_tready_UNCONNECTED,
      s_axis_tstrb(3 downto 0) => B"0000",
      s_axis_tuser(3 downto 0) => B"0000",
      s_axis_tvalid => '0',
      sbiterr => NLW_fifo_gen_inst_sbiterr_UNCONNECTED,
      sleep => '0',
      srst => '0',
      underflow => NLW_fifo_gen_inst_underflow_UNCONNECTED,
      valid => NLW_fifo_gen_inst_valid_UNCONNECTED,
      wr_ack => NLW_fifo_gen_inst_wr_ack_UNCONNECTED,
      wr_clk => '0',
      wr_data_count(5 downto 0) => NLW_fifo_gen_inst_wr_data_count_UNCONNECTED(5 downto 0),
      wr_en => cmd_push,
      wr_rst => '0',
      wr_rst_busy => NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED
    );
\fifo_gen_inst_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => need_to_split_q,
      I1 => \last_split__1\,
      O => \^din\(0)
    );
\fifo_gen_inst_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^cmd_push_block_reg\,
      O => cmd_push
    );
\fifo_gen_inst_i_3__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => empty,
      I1 => m_axi_rvalid,
      I2 => s_axi_rready,
      I3 => m_axi_rlast,
      O => \^rd_en\
    );
\fifo_gen_inst_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBFF"
    )
        port map (
      I0 => cmd_push_block,
      I1 => command_ongoing,
      I2 => full,
      I3 => m_axi_arvalid_INST_0_i_1_n_0,
      O => \^cmd_push_block_reg\
    );
m_axi_arvalid_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F020"
    )
        port map (
      I0 => m_axi_arvalid_INST_0_i_1_n_0,
      I1 => full,
      I2 => command_ongoing,
      I3 => cmd_push_block,
      O => m_axi_arvalid
    );
m_axi_arvalid_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5F5F5F5F5F11115F"
    )
        port map (
      I0 => need_to_split_q,
      I1 => cmd_push_block_reg_0,
      I2 => multiple_id_non_split,
      I3 => \queue_id_reg[0]_1\,
      I4 => \queue_id_reg[0]_0\,
      I5 => cmd_empty,
      O => m_axi_arvalid_INST_0_i_1_n_0
    );
m_axi_rready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"31"
    )
        port map (
      I0 => m_axi_rvalid,
      I1 => empty,
      I2 => s_axi_rready,
      O => m_axi_rready
    );
\multiple_id_non_split_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000283C"
    )
        port map (
      I0 => cmd_empty,
      I1 => \queue_id_reg[0]_0\,
      I2 => \queue_id_reg[0]_1\,
      I3 => cmd_push_block_reg_0,
      I4 => need_to_split_q,
      I5 => \^cmd_push_block_reg\,
      O => multiple_id_non_split0
    );
\queue_id[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \queue_id_reg[0]_1\,
      I1 => \^cmd_push_block_reg\,
      I2 => \queue_id_reg[0]_0\,
      O => \queue_id_reg[0]\
    );
s_axi_rlast_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => m_axi_rlast,
      I1 => \USE_READ.USE_SPLIT_R.rd_cmd_split\,
      O => s_axi_rlast
    );
s_axi_rvalid_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => m_axi_rvalid,
      I1 => empty,
      O => s_axi_rvalid
    );
split_in_progress_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDDD"
    )
        port map (
      I0 => aresetn,
      I1 => cmd_empty,
      I2 => \^rd_en\,
      I3 => almost_empty,
      O => split_in_progress
    );
\split_ongoing_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \S_AXI_AREADY_I_i_3__0_n_0\,
      O => E(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__xdcDup__1\ is
  port (
    dout : out STD_LOGIC_VECTOR ( 4 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    din : out STD_LOGIC_VECTOR ( 3 downto 0 );
    cmd_b_push_block_reg : out STD_LOGIC;
    ram_full_i_reg : out STD_LOGIC;
    cmd_b_push_block_reg_0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    cmd_b_push_block_reg_1 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 4 downto 0 );
    aresetn_0 : out STD_LOGIC;
    m_axi_awready_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \goreg_dm.dout_i_reg[1]\ : out STD_LOGIC;
    empty_fwft_i_reg : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    \goreg_dm.dout_i_reg[2]\ : out STD_LOGIC;
    first_mi_word_reg : out STD_LOGIC;
    s_axi_awvalid_0 : out STD_LOGIC;
    s_axi_awvalid_1 : out STD_LOGIC;
    aclk : in STD_LOGIC;
    \gpr1.dout_i_reg[1]\ : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    \USE_WRITE.wr_cmd_ready\ : in STD_LOGIC;
    cmd_b_push_block : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    cmd_b_push_block_reg_2 : in STD_LOGIC;
    \USE_B_CHANNEL.cmd_b_depth_reg[0]\ : in STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    last_word : in STD_LOGIC;
    almost_b_empty : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    cmd_b_empty : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    cmd_push_block : in STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_awvalid : in STD_LOGIC;
    m_axi_awvalid_0 : in STD_LOGIC;
    m_axi_awvalid_1 : in STD_LOGIC;
    command_ongoing : in STD_LOGIC;
    length_counter_1_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    first_mi_word : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_wlast : in STD_LOGIC;
    \m_axi_awlen[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    need_to_split_q : in STD_LOGIC;
    \m_axi_awlen[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    \last_split__1\ : in STD_LOGIC;
    areset_d : in STD_LOGIC_VECTOR ( 1 downto 0 );
    command_ongoing_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__xdcDup__1\ : entity is "axi_data_fifo_v2_1_32_fifo_gen";
end \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__xdcDup__1\;

architecture STRUCTURE of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__xdcDup__1\ is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S_AXI_AREADY_I_i_4_n_0 : STD_LOGIC;
  signal \USE_B_CHANNEL.cmd_b_depth[5]_i_3_n_0\ : STD_LOGIC;
  signal cmd_b_empty0 : STD_LOGIC;
  signal \^din\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^dout\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^empty\ : STD_LOGIC;
  signal \^empty_fwft_i_reg\ : STD_LOGIC;
  signal \^full\ : STD_LOGIC;
  signal \^ram_full_i_reg\ : STD_LOGIC;
  signal NLW_fifo_gen_inst_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_aw_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_b_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_r_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_w_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axis_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_m_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_s_axis_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_fifo_gen_inst_axi_ar_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_ar_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_ar_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_aw_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_aw_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_aw_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_b_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_b_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_b_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_fifo_gen_inst_axi_r_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_r_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_r_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_w_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_w_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axi_w_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_fifo_gen_inst_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_m_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_m_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_gen_inst_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_fifo_gen_inst_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_fifo_gen_inst_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of S_AXI_AREADY_I_i_1 : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of S_AXI_AREADY_I_i_4 : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \USE_B_CHANNEL.cmd_b_depth[2]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \USE_B_CHANNEL.cmd_b_depth[3]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \USE_B_CHANNEL.cmd_b_empty_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of cmd_b_push_block_i_1 : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of cmd_push_block_i_1 : label is "soft_lutpair36";
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of fifo_gen_inst : label is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of fifo_gen_inst : label is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of fifo_gen_inst : label is 64;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of fifo_gen_inst : label is 8;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of fifo_gen_inst : label is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of fifo_gen_inst : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of fifo_gen_inst : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of fifo_gen_inst : label is 4;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of fifo_gen_inst : label is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of fifo_gen_inst : label is 2;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of fifo_gen_inst : label is 0;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of fifo_gen_inst : label is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of fifo_gen_inst : label is 1;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of fifo_gen_inst : label is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of fifo_gen_inst : label is 6;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of fifo_gen_inst : label is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of fifo_gen_inst : label is 5;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of fifo_gen_inst : label is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of fifo_gen_inst : label is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of fifo_gen_inst : label is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of fifo_gen_inst : label is 32;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of fifo_gen_inst : label is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of fifo_gen_inst : label is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of fifo_gen_inst : label is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of fifo_gen_inst : label is 5;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of fifo_gen_inst : label is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of fifo_gen_inst : label is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of fifo_gen_inst : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of fifo_gen_inst : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of fifo_gen_inst : label is "zynq";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of fifo_gen_inst : label is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of fifo_gen_inst : label is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of fifo_gen_inst : label is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of fifo_gen_inst : label is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of fifo_gen_inst : label is 0;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of fifo_gen_inst : label is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of fifo_gen_inst : label is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of fifo_gen_inst : label is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of fifo_gen_inst : label is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of fifo_gen_inst : label is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of fifo_gen_inst : label is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of fifo_gen_inst : label is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of fifo_gen_inst : label is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of fifo_gen_inst : label is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of fifo_gen_inst : label is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of fifo_gen_inst : label is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of fifo_gen_inst : label is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of fifo_gen_inst : label is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of fifo_gen_inst : label is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of fifo_gen_inst : label is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of fifo_gen_inst : label is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of fifo_gen_inst : label is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of fifo_gen_inst : label is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of fifo_gen_inst : label is 0;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of fifo_gen_inst : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of fifo_gen_inst : label is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of fifo_gen_inst : label is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of fifo_gen_inst : label is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of fifo_gen_inst : label is 2;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of fifo_gen_inst : label is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of fifo_gen_inst : label is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of fifo_gen_inst : label is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of fifo_gen_inst : label is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of fifo_gen_inst : label is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of fifo_gen_inst : label is 0;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of fifo_gen_inst : label is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of fifo_gen_inst : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of fifo_gen_inst : label is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of fifo_gen_inst : label is 4;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of fifo_gen_inst : label is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of fifo_gen_inst : label is 5;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of fifo_gen_inst : label is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of fifo_gen_inst : label is 31;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of fifo_gen_inst : label is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of fifo_gen_inst : label is 30;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of fifo_gen_inst : label is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of fifo_gen_inst : label is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of fifo_gen_inst : label is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of fifo_gen_inst : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of fifo_gen_inst : label is 6;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of fifo_gen_inst : label is 32;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of fifo_gen_inst : label is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of fifo_gen_inst : label is 5;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of fifo_gen_inst : label is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of fifo_gen_inst : label is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of fifo_gen_inst : label is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of fifo_gen_inst : label is 3;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of fifo_gen_inst : label is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of fifo_gen_inst : label is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of fifo_gen_inst : label is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of fifo_gen_inst : label is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of fifo_gen_inst : label is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of fifo_gen_inst : label is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of fifo_gen_inst : label is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of fifo_gen_inst : label is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of fifo_gen_inst : label is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of fifo_gen_inst : label is 1;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of fifo_gen_inst : label is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of fifo_gen_inst : label is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of fifo_gen_inst : label is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of fifo_gen_inst : label is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of fifo_gen_inst : label is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of fifo_gen_inst : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of fifo_gen_inst : label is 6;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of fifo_gen_inst : label is 32;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of fifo_gen_inst : label is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of fifo_gen_inst : label is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of fifo_gen_inst : label is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of fifo_gen_inst : label is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of fifo_gen_inst : label is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of fifo_gen_inst : label is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of fifo_gen_inst : label is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of fifo_gen_inst : label is 5;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of fifo_gen_inst : label is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of fifo_gen_inst : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of fifo_gen_inst : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of fifo_gen_inst : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of fifo_gen_inst : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of fifo_gen_inst : label is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of fifo_gen_inst : label is 1;
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of fifo_gen_inst : label is "soft";
  attribute is_du_within_envelope : string;
  attribute is_du_within_envelope of fifo_gen_inst : label is "true";
  attribute SOFT_HLUTNM of \fifo_gen_inst_i_2__1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of m_axi_wvalid_INST_0 : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of s_axi_wready_INST_0 : label is "soft_lutpair37";
begin
  SR(0) <= \^sr\(0);
  din(3 downto 0) <= \^din\(3 downto 0);
  dout(4 downto 0) <= \^dout\(4 downto 0);
  empty <= \^empty\;
  empty_fwft_i_reg <= \^empty_fwft_i_reg\;
  full <= \^full\;
  ram_full_i_reg <= \^ram_full_i_reg\;
S_AXI_AREADY_I_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => \^sr\(0)
    );
\S_AXI_AREADY_I_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44744474FFFF4474"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => cmd_b_push_block_reg_2,
      I2 => \last_split__1\,
      I3 => S_AXI_AREADY_I_i_4_n_0,
      I4 => areset_d(1),
      I5 => areset_d(0),
      O => s_axi_awvalid_0
    );
S_AXI_AREADY_I_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^ram_full_i_reg\,
      I1 => m_axi_awready,
      O => S_AXI_AREADY_I_i_4_n_0
    );
\USE_B_CHANNEL.cmd_b_depth[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => cmd_b_empty0,
      I1 => Q(1),
      I2 => Q(0),
      O => D(0)
    );
\USE_B_CHANNEL.cmd_b_depth[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AA9"
    )
        port map (
      I0 => Q(2),
      I1 => cmd_b_empty0,
      I2 => Q(1),
      I3 => Q(0),
      O => D(1)
    );
\USE_B_CHANNEL.cmd_b_depth[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAA9"
    )
        port map (
      I0 => Q(3),
      I1 => cmd_b_empty0,
      I2 => Q(0),
      I3 => Q(1),
      I4 => Q(2),
      O => D(2)
    );
\USE_B_CHANNEL.cmd_b_depth[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAA9"
    )
        port map (
      I0 => Q(4),
      I1 => cmd_b_empty0,
      I2 => Q(0),
      I3 => Q(1),
      I4 => Q(2),
      I5 => Q(3),
      O => D(3)
    );
\USE_B_CHANNEL.cmd_b_depth[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2222222202222222"
    )
        port map (
      I0 => \^ram_full_i_reg\,
      I1 => cmd_b_push_block,
      I2 => last_word,
      I3 => s_axi_bready,
      I4 => m_axi_bvalid,
      I5 => \USE_B_CHANNEL.cmd_b_depth_reg[0]\,
      O => cmd_b_empty0
    );
\USE_B_CHANNEL.cmd_b_depth[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4B44444444444444"
    )
        port map (
      I0 => cmd_b_push_block,
      I1 => \^ram_full_i_reg\,
      I2 => \USE_B_CHANNEL.cmd_b_depth_reg[0]\,
      I3 => m_axi_bvalid,
      I4 => s_axi_bready,
      I5 => last_word,
      O => E(0)
    );
\USE_B_CHANNEL.cmd_b_depth[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAA9"
    )
        port map (
      I0 => Q(5),
      I1 => \USE_B_CHANNEL.cmd_b_depth[5]_i_3_n_0\,
      I2 => Q(2),
      I3 => Q(3),
      I4 => Q(4),
      O => D(4)
    );
\USE_B_CHANNEL.cmd_b_depth[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"545454545454D554"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      I2 => Q(0),
      I3 => \^ram_full_i_reg\,
      I4 => cmd_b_push_block,
      I5 => rd_en,
      O => \USE_B_CHANNEL.cmd_b_depth[5]_i_3_n_0\
    );
\USE_B_CHANNEL.cmd_b_empty_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F4BBB000"
    )
        port map (
      I0 => cmd_b_push_block,
      I1 => \^ram_full_i_reg\,
      I2 => almost_b_empty,
      I3 => rd_en,
      I4 => cmd_b_empty,
      O => cmd_b_push_block_reg_1
    );
cmd_b_push_block_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E0"
    )
        port map (
      I0 => cmd_b_push_block,
      I1 => \^ram_full_i_reg\,
      I2 => aresetn,
      I3 => cmd_b_push_block_reg_2,
      O => cmd_b_push_block_reg_0
    );
cmd_push_block_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A88"
    )
        port map (
      I0 => aresetn,
      I1 => cmd_push_block,
      I2 => m_axi_awready,
      I3 => \^ram_full_i_reg\,
      O => aresetn_0
    );
command_ongoing_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF8FFFFF88880000"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => cmd_b_push_block_reg_2,
      I2 => \last_split__1\,
      I3 => S_AXI_AREADY_I_i_4_n_0,
      I4 => command_ongoing_reg,
      I5 => command_ongoing,
      O => s_axi_awvalid_1
    );
fifo_gen_inst: entity work.\bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_fifo_generator_v13_2_11__xdcDup__1\
     port map (
      almost_empty => NLW_fifo_gen_inst_almost_empty_UNCONNECTED,
      almost_full => NLW_fifo_gen_inst_almost_full_UNCONNECTED,
      axi_ar_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_ar_data_count_UNCONNECTED(4 downto 0),
      axi_ar_dbiterr => NLW_fifo_gen_inst_axi_ar_dbiterr_UNCONNECTED,
      axi_ar_injectdbiterr => '0',
      axi_ar_injectsbiterr => '0',
      axi_ar_overflow => NLW_fifo_gen_inst_axi_ar_overflow_UNCONNECTED,
      axi_ar_prog_empty => NLW_fifo_gen_inst_axi_ar_prog_empty_UNCONNECTED,
      axi_ar_prog_empty_thresh(3 downto 0) => B"0000",
      axi_ar_prog_full => NLW_fifo_gen_inst_axi_ar_prog_full_UNCONNECTED,
      axi_ar_prog_full_thresh(3 downto 0) => B"0000",
      axi_ar_rd_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_ar_rd_data_count_UNCONNECTED(4 downto 0),
      axi_ar_sbiterr => NLW_fifo_gen_inst_axi_ar_sbiterr_UNCONNECTED,
      axi_ar_underflow => NLW_fifo_gen_inst_axi_ar_underflow_UNCONNECTED,
      axi_ar_wr_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_ar_wr_data_count_UNCONNECTED(4 downto 0),
      axi_aw_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_aw_data_count_UNCONNECTED(4 downto 0),
      axi_aw_dbiterr => NLW_fifo_gen_inst_axi_aw_dbiterr_UNCONNECTED,
      axi_aw_injectdbiterr => '0',
      axi_aw_injectsbiterr => '0',
      axi_aw_overflow => NLW_fifo_gen_inst_axi_aw_overflow_UNCONNECTED,
      axi_aw_prog_empty => NLW_fifo_gen_inst_axi_aw_prog_empty_UNCONNECTED,
      axi_aw_prog_empty_thresh(3 downto 0) => B"0000",
      axi_aw_prog_full => NLW_fifo_gen_inst_axi_aw_prog_full_UNCONNECTED,
      axi_aw_prog_full_thresh(3 downto 0) => B"0000",
      axi_aw_rd_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_aw_rd_data_count_UNCONNECTED(4 downto 0),
      axi_aw_sbiterr => NLW_fifo_gen_inst_axi_aw_sbiterr_UNCONNECTED,
      axi_aw_underflow => NLW_fifo_gen_inst_axi_aw_underflow_UNCONNECTED,
      axi_aw_wr_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_aw_wr_data_count_UNCONNECTED(4 downto 0),
      axi_b_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_b_data_count_UNCONNECTED(4 downto 0),
      axi_b_dbiterr => NLW_fifo_gen_inst_axi_b_dbiterr_UNCONNECTED,
      axi_b_injectdbiterr => '0',
      axi_b_injectsbiterr => '0',
      axi_b_overflow => NLW_fifo_gen_inst_axi_b_overflow_UNCONNECTED,
      axi_b_prog_empty => NLW_fifo_gen_inst_axi_b_prog_empty_UNCONNECTED,
      axi_b_prog_empty_thresh(3 downto 0) => B"0000",
      axi_b_prog_full => NLW_fifo_gen_inst_axi_b_prog_full_UNCONNECTED,
      axi_b_prog_full_thresh(3 downto 0) => B"0000",
      axi_b_rd_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_b_rd_data_count_UNCONNECTED(4 downto 0),
      axi_b_sbiterr => NLW_fifo_gen_inst_axi_b_sbiterr_UNCONNECTED,
      axi_b_underflow => NLW_fifo_gen_inst_axi_b_underflow_UNCONNECTED,
      axi_b_wr_data_count(4 downto 0) => NLW_fifo_gen_inst_axi_b_wr_data_count_UNCONNECTED(4 downto 0),
      axi_r_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_r_data_count_UNCONNECTED(10 downto 0),
      axi_r_dbiterr => NLW_fifo_gen_inst_axi_r_dbiterr_UNCONNECTED,
      axi_r_injectdbiterr => '0',
      axi_r_injectsbiterr => '0',
      axi_r_overflow => NLW_fifo_gen_inst_axi_r_overflow_UNCONNECTED,
      axi_r_prog_empty => NLW_fifo_gen_inst_axi_r_prog_empty_UNCONNECTED,
      axi_r_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_r_prog_full => NLW_fifo_gen_inst_axi_r_prog_full_UNCONNECTED,
      axi_r_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_r_rd_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_r_rd_data_count_UNCONNECTED(10 downto 0),
      axi_r_sbiterr => NLW_fifo_gen_inst_axi_r_sbiterr_UNCONNECTED,
      axi_r_underflow => NLW_fifo_gen_inst_axi_r_underflow_UNCONNECTED,
      axi_r_wr_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_r_wr_data_count_UNCONNECTED(10 downto 0),
      axi_w_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_w_data_count_UNCONNECTED(10 downto 0),
      axi_w_dbiterr => NLW_fifo_gen_inst_axi_w_dbiterr_UNCONNECTED,
      axi_w_injectdbiterr => '0',
      axi_w_injectsbiterr => '0',
      axi_w_overflow => NLW_fifo_gen_inst_axi_w_overflow_UNCONNECTED,
      axi_w_prog_empty => NLW_fifo_gen_inst_axi_w_prog_empty_UNCONNECTED,
      axi_w_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_w_prog_full => NLW_fifo_gen_inst_axi_w_prog_full_UNCONNECTED,
      axi_w_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_w_rd_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_w_rd_data_count_UNCONNECTED(10 downto 0),
      axi_w_sbiterr => NLW_fifo_gen_inst_axi_w_sbiterr_UNCONNECTED,
      axi_w_underflow => NLW_fifo_gen_inst_axi_w_underflow_UNCONNECTED,
      axi_w_wr_data_count(10 downto 0) => NLW_fifo_gen_inst_axi_w_wr_data_count_UNCONNECTED(10 downto 0),
      axis_data_count(10 downto 0) => NLW_fifo_gen_inst_axis_data_count_UNCONNECTED(10 downto 0),
      axis_dbiterr => NLW_fifo_gen_inst_axis_dbiterr_UNCONNECTED,
      axis_injectdbiterr => '0',
      axis_injectsbiterr => '0',
      axis_overflow => NLW_fifo_gen_inst_axis_overflow_UNCONNECTED,
      axis_prog_empty => NLW_fifo_gen_inst_axis_prog_empty_UNCONNECTED,
      axis_prog_empty_thresh(9 downto 0) => B"0000000000",
      axis_prog_full => NLW_fifo_gen_inst_axis_prog_full_UNCONNECTED,
      axis_prog_full_thresh(9 downto 0) => B"0000000000",
      axis_rd_data_count(10 downto 0) => NLW_fifo_gen_inst_axis_rd_data_count_UNCONNECTED(10 downto 0),
      axis_sbiterr => NLW_fifo_gen_inst_axis_sbiterr_UNCONNECTED,
      axis_underflow => NLW_fifo_gen_inst_axis_underflow_UNCONNECTED,
      axis_wr_data_count(10 downto 0) => NLW_fifo_gen_inst_axis_wr_data_count_UNCONNECTED(10 downto 0),
      backup => '0',
      backup_marker => '0',
      clk => aclk,
      data_count(5 downto 0) => NLW_fifo_gen_inst_data_count_UNCONNECTED(5 downto 0),
      dbiterr => NLW_fifo_gen_inst_dbiterr_UNCONNECTED,
      din(4) => \gpr1.dout_i_reg[1]\,
      din(3 downto 0) => \^din\(3 downto 0),
      dout(4 downto 0) => \^dout\(4 downto 0),
      empty => \^empty\,
      full => \^full\,
      injectdbiterr => '0',
      injectsbiterr => '0',
      int_clk => '0',
      m_aclk => '0',
      m_aclk_en => '0',
      m_axi_araddr(31 downto 0) => NLW_fifo_gen_inst_m_axi_araddr_UNCONNECTED(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_fifo_gen_inst_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arcache(3 downto 0) => NLW_fifo_gen_inst_m_axi_arcache_UNCONNECTED(3 downto 0),
      m_axi_arid(3 downto 0) => NLW_fifo_gen_inst_m_axi_arid_UNCONNECTED(3 downto 0),
      m_axi_arlen(7 downto 0) => NLW_fifo_gen_inst_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arlock(1 downto 0) => NLW_fifo_gen_inst_m_axi_arlock_UNCONNECTED(1 downto 0),
      m_axi_arprot(2 downto 0) => NLW_fifo_gen_inst_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_fifo_gen_inst_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => '0',
      m_axi_arregion(3 downto 0) => NLW_fifo_gen_inst_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => NLW_fifo_gen_inst_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_aruser(0) => NLW_fifo_gen_inst_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => NLW_fifo_gen_inst_m_axi_arvalid_UNCONNECTED,
      m_axi_awaddr(31 downto 0) => NLW_fifo_gen_inst_m_axi_awaddr_UNCONNECTED(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_fifo_gen_inst_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awcache(3 downto 0) => NLW_fifo_gen_inst_m_axi_awcache_UNCONNECTED(3 downto 0),
      m_axi_awid(3 downto 0) => NLW_fifo_gen_inst_m_axi_awid_UNCONNECTED(3 downto 0),
      m_axi_awlen(7 downto 0) => NLW_fifo_gen_inst_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awlock(1 downto 0) => NLW_fifo_gen_inst_m_axi_awlock_UNCONNECTED(1 downto 0),
      m_axi_awprot(2 downto 0) => NLW_fifo_gen_inst_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awqos(3 downto 0) => NLW_fifo_gen_inst_m_axi_awqos_UNCONNECTED(3 downto 0),
      m_axi_awready => '0',
      m_axi_awregion(3 downto 0) => NLW_fifo_gen_inst_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => NLW_fifo_gen_inst_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awuser(0) => NLW_fifo_gen_inst_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => NLW_fifo_gen_inst_m_axi_awvalid_UNCONNECTED,
      m_axi_bid(3 downto 0) => B"0000",
      m_axi_bready => NLW_fifo_gen_inst_m_axi_bready_UNCONNECTED,
      m_axi_bresp(1 downto 0) => B"00",
      m_axi_buser(0) => '0',
      m_axi_bvalid => '0',
      m_axi_rdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      m_axi_rid(3 downto 0) => B"0000",
      m_axi_rlast => '0',
      m_axi_rready => NLW_fifo_gen_inst_m_axi_rready_UNCONNECTED,
      m_axi_rresp(1 downto 0) => B"00",
      m_axi_ruser(0) => '0',
      m_axi_rvalid => '0',
      m_axi_wdata(63 downto 0) => NLW_fifo_gen_inst_m_axi_wdata_UNCONNECTED(63 downto 0),
      m_axi_wid(3 downto 0) => NLW_fifo_gen_inst_m_axi_wid_UNCONNECTED(3 downto 0),
      m_axi_wlast => NLW_fifo_gen_inst_m_axi_wlast_UNCONNECTED,
      m_axi_wready => '0',
      m_axi_wstrb(7 downto 0) => NLW_fifo_gen_inst_m_axi_wstrb_UNCONNECTED(7 downto 0),
      m_axi_wuser(0) => NLW_fifo_gen_inst_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => NLW_fifo_gen_inst_m_axi_wvalid_UNCONNECTED,
      m_axis_tdata(63 downto 0) => NLW_fifo_gen_inst_m_axis_tdata_UNCONNECTED(63 downto 0),
      m_axis_tdest(3 downto 0) => NLW_fifo_gen_inst_m_axis_tdest_UNCONNECTED(3 downto 0),
      m_axis_tid(7 downto 0) => NLW_fifo_gen_inst_m_axis_tid_UNCONNECTED(7 downto 0),
      m_axis_tkeep(3 downto 0) => NLW_fifo_gen_inst_m_axis_tkeep_UNCONNECTED(3 downto 0),
      m_axis_tlast => NLW_fifo_gen_inst_m_axis_tlast_UNCONNECTED,
      m_axis_tready => '0',
      m_axis_tstrb(3 downto 0) => NLW_fifo_gen_inst_m_axis_tstrb_UNCONNECTED(3 downto 0),
      m_axis_tuser(3 downto 0) => NLW_fifo_gen_inst_m_axis_tuser_UNCONNECTED(3 downto 0),
      m_axis_tvalid => NLW_fifo_gen_inst_m_axis_tvalid_UNCONNECTED,
      overflow => NLW_fifo_gen_inst_overflow_UNCONNECTED,
      prog_empty => NLW_fifo_gen_inst_prog_empty_UNCONNECTED,
      prog_empty_thresh(4 downto 0) => B"00000",
      prog_empty_thresh_assert(4 downto 0) => B"00000",
      prog_empty_thresh_negate(4 downto 0) => B"00000",
      prog_full => NLW_fifo_gen_inst_prog_full_UNCONNECTED,
      prog_full_thresh(4 downto 0) => B"00000",
      prog_full_thresh_assert(4 downto 0) => B"00000",
      prog_full_thresh_negate(4 downto 0) => B"00000",
      rd_clk => '0',
      rd_data_count(5 downto 0) => NLW_fifo_gen_inst_rd_data_count_UNCONNECTED(5 downto 0),
      rd_en => \USE_WRITE.wr_cmd_ready\,
      rd_rst => '0',
      rd_rst_busy => NLW_fifo_gen_inst_rd_rst_busy_UNCONNECTED,
      rst => \^sr\(0),
      s_aclk => '0',
      s_aclk_en => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arcache(3 downto 0) => B"0000",
      s_axi_arid(3 downto 0) => B"0000",
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arlock(1 downto 0) => B"00",
      s_axi_arprot(2 downto 0) => B"000",
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => NLW_fifo_gen_inst_s_axi_arready_UNCONNECTED,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_aruser(0) => '0',
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awcache(3 downto 0) => B"0000",
      s_axi_awid(3 downto 0) => B"0000",
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awlock(1 downto 0) => B"00",
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => NLW_fifo_gen_inst_s_axi_awready_UNCONNECTED,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awuser(0) => '0',
      s_axi_awvalid => '0',
      s_axi_bid(3 downto 0) => NLW_fifo_gen_inst_s_axi_bid_UNCONNECTED(3 downto 0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_fifo_gen_inst_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_buser(0) => NLW_fifo_gen_inst_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => NLW_fifo_gen_inst_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(63 downto 0) => NLW_fifo_gen_inst_s_axi_rdata_UNCONNECTED(63 downto 0),
      s_axi_rid(3 downto 0) => NLW_fifo_gen_inst_s_axi_rid_UNCONNECTED(3 downto 0),
      s_axi_rlast => NLW_fifo_gen_inst_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_fifo_gen_inst_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_ruser(0) => NLW_fifo_gen_inst_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => NLW_fifo_gen_inst_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axi_wid(3 downto 0) => B"0000",
      s_axi_wlast => '0',
      s_axi_wready => NLW_fifo_gen_inst_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(7 downto 0) => B"00000000",
      s_axi_wuser(0) => '0',
      s_axi_wvalid => '0',
      s_axis_tdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axis_tdest(3 downto 0) => B"0000",
      s_axis_tid(7 downto 0) => B"00000000",
      s_axis_tkeep(3 downto 0) => B"0000",
      s_axis_tlast => '0',
      s_axis_tready => NLW_fifo_gen_inst_s_axis_tready_UNCONNECTED,
      s_axis_tstrb(3 downto 0) => B"0000",
      s_axis_tuser(3 downto 0) => B"0000",
      s_axis_tvalid => '0',
      sbiterr => NLW_fifo_gen_inst_sbiterr_UNCONNECTED,
      sleep => '0',
      srst => '0',
      underflow => NLW_fifo_gen_inst_underflow_UNCONNECTED,
      valid => NLW_fifo_gen_inst_valid_UNCONNECTED,
      wr_ack => NLW_fifo_gen_inst_wr_ack_UNCONNECTED,
      wr_clk => '0',
      wr_data_count(5 downto 0) => NLW_fifo_gen_inst_wr_data_count_UNCONNECTED(5 downto 0),
      wr_en => wr_en,
      wr_rst => '0',
      wr_rst_busy => NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED
    );
\fifo_gen_inst_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => cmd_b_push_block,
      I1 => \^ram_full_i_reg\,
      O => cmd_b_push_block_reg
    );
fifo_gen_inst_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => first_mi_word,
      I1 => \^dout\(0),
      I2 => \^dout\(1),
      I3 => \^dout\(3),
      I4 => \^dout\(2),
      O => first_mi_word_reg
    );
\length_counter_1[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ACACCC3C5C5CCC3C"
    )
        port map (
      I0 => \^dout\(1),
      I1 => length_counter_1_reg(1),
      I2 => \^empty_fwft_i_reg\,
      I3 => length_counter_1_reg(0),
      I4 => first_mi_word,
      I5 => \^dout\(0),
      O => \goreg_dm.dout_i_reg[1]\
    );
\m_axi_awlen[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFE0000"
    )
        port map (
      I0 => \m_axi_awlen[3]\(1),
      I1 => \m_axi_awlen[3]\(0),
      I2 => \m_axi_awlen[3]\(3),
      I3 => \m_axi_awlen[3]\(2),
      I4 => need_to_split_q,
      I5 => \m_axi_awlen[3]_0\(0),
      O => \^din\(0)
    );
\m_axi_awlen[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFE0000"
    )
        port map (
      I0 => \m_axi_awlen[3]\(1),
      I1 => \m_axi_awlen[3]\(0),
      I2 => \m_axi_awlen[3]\(3),
      I3 => \m_axi_awlen[3]\(2),
      I4 => need_to_split_q,
      I5 => \m_axi_awlen[3]_0\(1),
      O => \^din\(1)
    );
\m_axi_awlen[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFE0000"
    )
        port map (
      I0 => \m_axi_awlen[3]\(1),
      I1 => \m_axi_awlen[3]\(0),
      I2 => \m_axi_awlen[3]\(3),
      I3 => \m_axi_awlen[3]\(2),
      I4 => need_to_split_q,
      I5 => \m_axi_awlen[3]_0\(2),
      O => \^din\(2)
    );
\m_axi_awlen[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFE0000"
    )
        port map (
      I0 => \m_axi_awlen[3]\(1),
      I1 => \m_axi_awlen[3]\(0),
      I2 => \m_axi_awlen[3]\(3),
      I3 => \m_axi_awlen[3]\(2),
      I4 => need_to_split_q,
      I5 => \m_axi_awlen[3]_0\(3),
      O => \^din\(3)
    );
m_axi_awvalid_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000000E0000"
    )
        port map (
      I0 => m_axi_awvalid,
      I1 => m_axi_awvalid_0,
      I2 => \^full\,
      I3 => m_axi_awvalid_1,
      I4 => command_ongoing,
      I5 => cmd_push_block,
      O => \^ram_full_i_reg\
    );
m_axi_wlast_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00010000"
    )
        port map (
      I0 => \^dout\(2),
      I1 => \^dout\(3),
      I2 => \^dout\(1),
      I3 => \^dout\(0),
      I4 => first_mi_word,
      I5 => m_axi_wlast,
      O => \goreg_dm.dout_i_reg[2]\
    );
m_axi_wvalid_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => \^empty\,
      O => m_axi_wvalid
    );
s_axi_wready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^empty\,
      I1 => s_axi_wvalid,
      I2 => m_axi_wready,
      O => \^empty_fwft_i_reg\
    );
split_ongoing_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXI_AREADY_I_i_4_n_0,
      O => m_axi_awready_0(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo is
  port (
    \goreg_dm.dout_i_reg[4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    din : out STD_LOGIC_VECTOR ( 0 to 0 );
    rd_en : out STD_LOGIC;
    cmd_empty_reg : out STD_LOGIC;
    cmd_push_block_reg : out STD_LOGIC;
    split_in_progress : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 4 downto 0 );
    wr_en : out STD_LOGIC;
    \S_AXI_AID_Q_reg[0]\ : out STD_LOGIC;
    split_in_progress_reg : out STD_LOGIC;
    \last_split__1\ : out STD_LOGIC;
    \queue_id_reg[0]\ : out STD_LOGIC;
    aclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ram_full_fb_i_reg : in STD_LOGIC;
    \USE_WRITE.wr_cmd_ready\ : in STD_LOGIC;
    almost_empty : in STD_LOGIC;
    cmd_empty : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    last_word : in STD_LOGIC;
    almost_b_empty : in STD_LOGIC;
    cmd_b_empty : in STD_LOGIC;
    \cmd_depth_reg[5]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    cmd_push_block : in STD_LOGIC;
    command_ongoing : in STD_LOGIC;
    \queue_id_reg[0]_0\ : in STD_LOGIC;
    m_axi_awvalid : in STD_LOGIC;
    queue_id : in STD_LOGIC;
    \queue_id_reg[0]_1\ : in STD_LOGIC;
    need_to_split_q : in STD_LOGIC;
    multiple_id_non_split : in STD_LOGIC;
    split_ongoing_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    access_is_incr_q : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo : entity is "axi_data_fifo_v2_1_32_axic_fifo";
end bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo;

architecture STRUCTURE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo is
begin
inst: entity work.bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen
     port map (
      D(4 downto 0) => D(4 downto 0),
      Q(3 downto 0) => Q(3 downto 0),
      SR(0) => SR(0),
      \S_AXI_AID_Q_reg[0]\ => \S_AXI_AID_Q_reg[0]\,
      \USE_WRITE.wr_cmd_ready\ => \USE_WRITE.wr_cmd_ready\,
      access_is_incr_q => access_is_incr_q,
      aclk => aclk,
      almost_b_empty => almost_b_empty,
      almost_empty => almost_empty,
      aresetn => aresetn,
      cmd_b_empty => cmd_b_empty,
      \cmd_depth_reg[5]\(5 downto 0) => \cmd_depth_reg[5]\(5 downto 0),
      cmd_empty => cmd_empty,
      cmd_empty_reg => cmd_empty_reg,
      cmd_push_block => cmd_push_block,
      cmd_push_block_reg => cmd_push_block_reg,
      command_ongoing => command_ongoing,
      din(0) => din(0),
      empty => empty,
      full => full,
      \goreg_dm.dout_i_reg[4]\(4 downto 0) => \goreg_dm.dout_i_reg[4]\(4 downto 0),
      \last_split__1\ => \last_split__1\,
      last_word => last_word,
      m_axi_awvalid => m_axi_awvalid,
      m_axi_bvalid => m_axi_bvalid,
      multiple_id_non_split => multiple_id_non_split,
      need_to_split_q => need_to_split_q,
      queue_id => queue_id,
      \queue_id_reg[0]\ => \queue_id_reg[0]\,
      \queue_id_reg[0]_0\ => \queue_id_reg[0]_0\,
      \queue_id_reg[0]_1\ => \queue_id_reg[0]_1\,
      ram_full_fb_i_reg => ram_full_fb_i_reg,
      rd_en => rd_en,
      s_axi_bready => s_axi_bready,
      split_in_progress => split_in_progress,
      split_in_progress_reg => split_in_progress_reg,
      split_ongoing_reg(3 downto 0) => split_ongoing_reg(3 downto 0),
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__parameterized0\ is
  port (
    din : out STD_LOGIC_VECTOR ( 0 to 0 );
    \USE_READ.USE_SPLIT_R.rd_cmd_ready\ : out STD_LOGIC;
    ram_full_i_reg : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    multiple_id_non_split0 : out STD_LOGIC;
    cmd_push_block_reg : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 4 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    split_in_progress : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rlast : out STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axi_arvalid_0 : out STD_LOGIC;
    \queue_id_reg[0]\ : out STD_LOGIC;
    s_axi_arvalid_1 : out STD_LOGIC;
    empty_fwft_i_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    aclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    command_ongoing : in STD_LOGIC;
    cmd_push_block : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    cmd_empty : in STD_LOGIC;
    \queue_id_reg[0]_0\ : in STD_LOGIC;
    \queue_id_reg[0]_1\ : in STD_LOGIC;
    cmd_push_block_reg_0 : in STD_LOGIC;
    need_to_split_q : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    multiple_id_non_split : in STD_LOGIC;
    almost_empty : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_rlast : in STD_LOGIC;
    split_ongoing_reg : in STD_LOGIC_VECTOR ( 3 downto 0 );
    split_ongoing_reg_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    access_is_incr_q : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    command_ongoing_reg : in STD_LOGIC;
    areset_d : in STD_LOGIC_VECTOR ( 1 downto 0 );
    command_ongoing_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__parameterized0\ : entity is "axi_data_fifo_v2_1_32_axic_fifo";
end \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__parameterized0\;

architecture STRUCTURE of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__parameterized0\ is
begin
inst: entity work.\bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__parameterized0\
     port map (
      D(4 downto 0) => D(4 downto 0),
      E(0) => E(0),
      Q(5 downto 0) => Q(5 downto 0),
      SR(0) => SR(0),
      access_is_incr_q => access_is_incr_q,
      aclk => aclk,
      almost_empty => almost_empty,
      areset_d(1 downto 0) => areset_d(1 downto 0),
      aresetn => aresetn,
      cmd_empty => cmd_empty,
      cmd_push_block => cmd_push_block,
      cmd_push_block_reg => cmd_push_block_reg,
      cmd_push_block_reg_0 => cmd_push_block_reg_0,
      command_ongoing => command_ongoing,
      command_ongoing_reg => command_ongoing_reg,
      command_ongoing_reg_0 => command_ongoing_reg_0,
      din(0) => din(0),
      empty_fwft_i_reg(0) => empty_fwft_i_reg(0),
      m_axi_arready => m_axi_arready,
      m_axi_arvalid => m_axi_arvalid,
      m_axi_rlast => m_axi_rlast,
      m_axi_rready => m_axi_rready,
      m_axi_rvalid => m_axi_rvalid,
      multiple_id_non_split => multiple_id_non_split,
      multiple_id_non_split0 => multiple_id_non_split0,
      need_to_split_q => need_to_split_q,
      \queue_id_reg[0]\ => \queue_id_reg[0]\,
      \queue_id_reg[0]_0\ => \queue_id_reg[0]_0\,
      \queue_id_reg[0]_1\ => \queue_id_reg[0]_1\,
      ram_full_i_reg => ram_full_i_reg,
      rd_en => \USE_READ.USE_SPLIT_R.rd_cmd_ready\,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_arvalid_0 => s_axi_arvalid_0,
      s_axi_arvalid_1 => s_axi_arvalid_1,
      s_axi_rlast => s_axi_rlast,
      s_axi_rready => s_axi_rready,
      s_axi_rvalid => s_axi_rvalid,
      split_in_progress => split_in_progress,
      split_ongoing_reg(3 downto 0) => split_ongoing_reg(3 downto 0),
      split_ongoing_reg_0(3 downto 0) => split_ongoing_reg_0(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__xdcDup__1\ is
  port (
    dout : out STD_LOGIC_VECTOR ( 4 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    din : out STD_LOGIC_VECTOR ( 3 downto 0 );
    cmd_b_push_block_reg : out STD_LOGIC;
    ram_full_i_reg : out STD_LOGIC;
    cmd_b_push_block_reg_0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    cmd_b_push_block_reg_1 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 4 downto 0 );
    aresetn_0 : out STD_LOGIC;
    m_axi_awready_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    \goreg_dm.dout_i_reg[1]\ : out STD_LOGIC;
    empty_fwft_i_reg : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    \goreg_dm.dout_i_reg[2]\ : out STD_LOGIC;
    first_mi_word_reg : out STD_LOGIC;
    s_axi_awvalid_0 : out STD_LOGIC;
    s_axi_awvalid_1 : out STD_LOGIC;
    aclk : in STD_LOGIC;
    \gpr1.dout_i_reg[1]\ : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    \USE_WRITE.wr_cmd_ready\ : in STD_LOGIC;
    cmd_b_push_block : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    cmd_b_push_block_reg_2 : in STD_LOGIC;
    \USE_B_CHANNEL.cmd_b_depth_reg[0]\ : in STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    last_word : in STD_LOGIC;
    almost_b_empty : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    cmd_b_empty : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    cmd_push_block : in STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_awvalid : in STD_LOGIC;
    m_axi_awvalid_0 : in STD_LOGIC;
    m_axi_awvalid_1 : in STD_LOGIC;
    command_ongoing : in STD_LOGIC;
    length_counter_1_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    first_mi_word : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_wlast : in STD_LOGIC;
    \m_axi_awlen[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    need_to_split_q : in STD_LOGIC;
    \m_axi_awlen[3]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    \last_split__1\ : in STD_LOGIC;
    areset_d : in STD_LOGIC_VECTOR ( 1 downto 0 );
    command_ongoing_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__xdcDup__1\ : entity is "axi_data_fifo_v2_1_32_axic_fifo";
end \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__xdcDup__1\;

architecture STRUCTURE of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__xdcDup__1\ is
begin
inst: entity work.\bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_fifo_gen__xdcDup__1\
     port map (
      D(4 downto 0) => D(4 downto 0),
      E(0) => E(0),
      Q(5 downto 0) => Q(5 downto 0),
      SR(0) => SR(0),
      \USE_B_CHANNEL.cmd_b_depth_reg[0]\ => \USE_B_CHANNEL.cmd_b_depth_reg[0]\,
      \USE_WRITE.wr_cmd_ready\ => \USE_WRITE.wr_cmd_ready\,
      aclk => aclk,
      almost_b_empty => almost_b_empty,
      areset_d(1 downto 0) => areset_d(1 downto 0),
      aresetn => aresetn,
      aresetn_0 => aresetn_0,
      cmd_b_empty => cmd_b_empty,
      cmd_b_push_block => cmd_b_push_block,
      cmd_b_push_block_reg => cmd_b_push_block_reg,
      cmd_b_push_block_reg_0 => cmd_b_push_block_reg_0,
      cmd_b_push_block_reg_1 => cmd_b_push_block_reg_1,
      cmd_b_push_block_reg_2 => cmd_b_push_block_reg_2,
      cmd_push_block => cmd_push_block,
      command_ongoing => command_ongoing,
      command_ongoing_reg => command_ongoing_reg,
      din(3 downto 0) => din(3 downto 0),
      dout(4 downto 0) => dout(4 downto 0),
      empty => empty,
      empty_fwft_i_reg => empty_fwft_i_reg,
      first_mi_word => first_mi_word,
      first_mi_word_reg => first_mi_word_reg,
      full => full,
      \goreg_dm.dout_i_reg[1]\ => \goreg_dm.dout_i_reg[1]\,
      \goreg_dm.dout_i_reg[2]\ => \goreg_dm.dout_i_reg[2]\,
      \gpr1.dout_i_reg[1]\ => \gpr1.dout_i_reg[1]\,
      \last_split__1\ => \last_split__1\,
      last_word => last_word,
      length_counter_1_reg(1 downto 0) => length_counter_1_reg(1 downto 0),
      \m_axi_awlen[3]\(3 downto 0) => \m_axi_awlen[3]\(3 downto 0),
      \m_axi_awlen[3]_0\(3 downto 0) => \m_axi_awlen[3]_0\(3 downto 0),
      m_axi_awready => m_axi_awready,
      m_axi_awready_0(0) => m_axi_awready_0(0),
      m_axi_awvalid => m_axi_awvalid,
      m_axi_awvalid_0 => m_axi_awvalid_0,
      m_axi_awvalid_1 => m_axi_awvalid_1,
      m_axi_bvalid => m_axi_bvalid,
      m_axi_wlast => m_axi_wlast,
      m_axi_wready => m_axi_wready,
      m_axi_wvalid => m_axi_wvalid,
      need_to_split_q => need_to_split_q,
      ram_full_i_reg => ram_full_i_reg,
      rd_en => rd_en,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_awvalid_0 => s_axi_awvalid_0,
      s_axi_awvalid_1 => s_axi_awvalid_1,
      s_axi_bready => s_axi_bready,
      s_axi_wvalid => s_axi_wvalid,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv is
  port (
    dout : out STD_LOGIC_VECTOR ( 4 downto 0 );
    empty : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    din : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \goreg_dm.dout_i_reg[4]\ : out STD_LOGIC_VECTOR ( 4 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    areset_d : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ram_full_i_reg : out STD_LOGIC;
    cmd_push_block_reg_0 : out STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \goreg_dm.dout_i_reg[1]\ : out STD_LOGIC;
    empty_fwft_i_reg : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    \goreg_dm.dout_i_reg[2]\ : out STD_LOGIC;
    first_mi_word_reg : out STD_LOGIC;
    \areset_d_reg[0]_0\ : out STD_LOGIC;
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    aclk : in STD_LOGIC;
    \USE_WRITE.wr_cmd_ready\ : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    aresetn : in STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    last_word : in STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    length_counter_1_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    first_mi_word : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_wlast : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \cmd_depth_reg[5]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv : entity is "axi_protocol_converter_v2_1_33_a_axi3_conv";
end bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv;

architecture STRUCTURE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \M_AXI_AADDR_I1__0\ : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S_AXI_AADDR_Q : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal S_AXI_ALEN_Q : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \S_AXI_ALOCK_Q_reg_n_0_[0]\ : STD_LOGIC;
  signal \USE_BURSTS.cmd_queue_n_14\ : STD_LOGIC;
  signal \USE_BURSTS.cmd_queue_n_15\ : STD_LOGIC;
  signal \USE_BURSTS.cmd_queue_n_16\ : STD_LOGIC;
  signal \USE_BURSTS.cmd_queue_n_17\ : STD_LOGIC;
  signal \USE_BURSTS.cmd_queue_n_18\ : STD_LOGIC;
  signal \USE_BURSTS.cmd_queue_n_19\ : STD_LOGIC;
  signal \USE_BURSTS.cmd_queue_n_20\ : STD_LOGIC;
  signal \USE_BURSTS.cmd_queue_n_21\ : STD_LOGIC;
  signal \USE_BURSTS.cmd_queue_n_22\ : STD_LOGIC;
  signal \USE_BURSTS.cmd_queue_n_29\ : STD_LOGIC;
  signal \USE_BURSTS.cmd_queue_n_30\ : STD_LOGIC;
  signal \USE_B_CHANNEL.cmd_b_depth[0]_i_1_n_0\ : STD_LOGIC;
  signal \USE_B_CHANNEL.cmd_b_depth_reg\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \USE_B_CHANNEL.cmd_b_queue_n_12\ : STD_LOGIC;
  signal \USE_B_CHANNEL.cmd_b_queue_n_13\ : STD_LOGIC;
  signal \USE_B_CHANNEL.cmd_b_queue_n_14\ : STD_LOGIC;
  signal \USE_B_CHANNEL.cmd_b_queue_n_15\ : STD_LOGIC;
  signal \USE_B_CHANNEL.cmd_b_queue_n_16\ : STD_LOGIC;
  signal \USE_B_CHANNEL.cmd_b_queue_n_18\ : STD_LOGIC;
  signal \USE_B_CHANNEL.cmd_b_queue_n_19\ : STD_LOGIC;
  signal \USE_B_CHANNEL.cmd_b_queue_n_21\ : STD_LOGIC;
  signal \USE_B_CHANNEL.cmd_b_queue_n_9\ : STD_LOGIC;
  signal \USE_WRITE.wr_cmd_b_ready\ : STD_LOGIC;
  signal access_is_incr : STD_LOGIC;
  signal access_is_incr_q : STD_LOGIC;
  signal addr_step : STD_LOGIC_VECTOR ( 11 downto 5 );
  signal addr_step_q : STD_LOGIC_VECTOR ( 11 downto 5 );
  signal \addr_step_q[6]_i_1_n_0\ : STD_LOGIC;
  signal \addr_step_q[7]_i_1_n_0\ : STD_LOGIC;
  signal \addr_step_q[8]_i_1_n_0\ : STD_LOGIC;
  signal \addr_step_q[9]_i_1_n_0\ : STD_LOGIC;
  signal almost_b_empty : STD_LOGIC;
  signal almost_empty : STD_LOGIC;
  signal \^areset_d\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^areset_d_reg[0]_0\ : STD_LOGIC;
  signal cmd_b_empty : STD_LOGIC;
  signal cmd_b_push : STD_LOGIC;
  signal cmd_b_push_block : STD_LOGIC;
  signal cmd_b_split_i : STD_LOGIC;
  signal \cmd_depth[0]_i_1_n_0\ : STD_LOGIC;
  signal cmd_depth_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal cmd_empty : STD_LOGIC;
  signal \cmd_id_check__3\ : STD_LOGIC;
  signal cmd_push : STD_LOGIC;
  signal cmd_push_block : STD_LOGIC;
  signal \^cmd_push_block_reg_0\ : STD_LOGIC;
  signal command_ongoing : STD_LOGIC;
  signal \^din\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \first_split__2\ : STD_LOGIC;
  signal first_step : STD_LOGIC_VECTOR ( 11 downto 4 );
  signal first_step_q : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \first_step_q[0]_i_1_n_0\ : STD_LOGIC;
  signal \first_step_q[10]_i_2_n_0\ : STD_LOGIC;
  signal \first_step_q[11]_i_2_n_0\ : STD_LOGIC;
  signal \first_step_q[1]_i_1_n_0\ : STD_LOGIC;
  signal \first_step_q[2]_i_1_n_0\ : STD_LOGIC;
  signal \first_step_q[3]_i_1_n_0\ : STD_LOGIC;
  signal \first_step_q[6]_i_2_n_0\ : STD_LOGIC;
  signal \first_step_q[7]_i_2_n_0\ : STD_LOGIC;
  signal \first_step_q[8]_i_2_n_0\ : STD_LOGIC;
  signal \first_step_q[9]_i_2_n_0\ : STD_LOGIC;
  signal \incr_need_to_split__0\ : STD_LOGIC;
  signal \inst/empty\ : STD_LOGIC;
  signal \inst/full\ : STD_LOGIC;
  signal \inst/full_0\ : STD_LOGIC;
  signal \last_split__1\ : STD_LOGIC;
  signal \^m_axi_awaddr\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal multiple_id_non_split : STD_LOGIC;
  signal multiple_id_non_split_i_1_n_0 : STD_LOGIC;
  signal multiple_id_non_split_i_2_n_0 : STD_LOGIC;
  signal need_to_split_q : STD_LOGIC;
  signal next_mi_addr : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \next_mi_addr[11]_i_2_n_0\ : STD_LOGIC;
  signal \next_mi_addr[11]_i_3_n_0\ : STD_LOGIC;
  signal \next_mi_addr[11]_i_4_n_0\ : STD_LOGIC;
  signal \next_mi_addr[11]_i_5_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_2_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_3_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_4_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_5_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_6_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_7_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_8_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_9_n_0\ : STD_LOGIC;
  signal \next_mi_addr[19]_i_2_n_0\ : STD_LOGIC;
  signal \next_mi_addr[19]_i_3_n_0\ : STD_LOGIC;
  signal \next_mi_addr[19]_i_4_n_0\ : STD_LOGIC;
  signal \next_mi_addr[19]_i_5_n_0\ : STD_LOGIC;
  signal \next_mi_addr[23]_i_2_n_0\ : STD_LOGIC;
  signal \next_mi_addr[23]_i_3_n_0\ : STD_LOGIC;
  signal \next_mi_addr[23]_i_4_n_0\ : STD_LOGIC;
  signal \next_mi_addr[23]_i_5_n_0\ : STD_LOGIC;
  signal \next_mi_addr[27]_i_2_n_0\ : STD_LOGIC;
  signal \next_mi_addr[27]_i_3_n_0\ : STD_LOGIC;
  signal \next_mi_addr[27]_i_4_n_0\ : STD_LOGIC;
  signal \next_mi_addr[27]_i_5_n_0\ : STD_LOGIC;
  signal \next_mi_addr[31]_i_2_n_0\ : STD_LOGIC;
  signal \next_mi_addr[31]_i_3_n_0\ : STD_LOGIC;
  signal \next_mi_addr[31]_i_4_n_0\ : STD_LOGIC;
  signal \next_mi_addr[31]_i_5_n_0\ : STD_LOGIC;
  signal \next_mi_addr[3]_i_2_n_0\ : STD_LOGIC;
  signal \next_mi_addr[3]_i_3_n_0\ : STD_LOGIC;
  signal \next_mi_addr[3]_i_4_n_0\ : STD_LOGIC;
  signal \next_mi_addr[3]_i_5_n_0\ : STD_LOGIC;
  signal \next_mi_addr[7]_i_2_n_0\ : STD_LOGIC;
  signal \next_mi_addr[7]_i_3_n_0\ : STD_LOGIC;
  signal \next_mi_addr[7]_i_4_n_0\ : STD_LOGIC;
  signal \next_mi_addr[7]_i_5_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[27]_i_1_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[27]_i_1_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[27]_i_1_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[31]_i_1_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[31]_i_1_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[31]_i_1_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal num_transactions_q : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \pushed_commands[3]_i_1_n_0\ : STD_LOGIC;
  signal pushed_commands_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal pushed_new_cmd : STD_LOGIC;
  signal queue_id : STD_LOGIC;
  signal size_mask : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal size_mask_q : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal split_in_progress : STD_LOGIC;
  signal split_in_progress_i_1_n_0 : STD_LOGIC;
  signal split_in_progress_reg_n_0 : STD_LOGIC;
  signal split_ongoing : STD_LOGIC;
  signal \NLW_next_mi_addr_reg[31]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \addr_step_q[10]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \addr_step_q[11]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \addr_step_q[5]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \addr_step_q[6]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \addr_step_q[7]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \addr_step_q[8]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \addr_step_q[9]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \first_step_q[0]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \first_step_q[10]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \first_step_q[11]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \first_step_q[1]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \first_step_q[3]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \first_step_q[4]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \first_step_q[6]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \first_step_q[7]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \first_step_q[8]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \first_step_q[9]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \m_axi_awaddr[12]_INST_0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \next_mi_addr[11]_i_6\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \next_mi_addr[3]_i_6\ : label is "soft_lutpair47";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[11]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[15]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[19]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[23]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[27]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[31]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[3]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[7]_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \pushed_commands[1]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \pushed_commands[2]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \pushed_commands[3]_i_2\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \size_mask_q[0]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \size_mask_q[1]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \size_mask_q[2]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \size_mask_q[3]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \size_mask_q[4]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \size_mask_q[5]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \size_mask_q[6]_i_1\ : label is "soft_lutpair53";
begin
  E(0) <= \^e\(0);
  SR(0) <= \^sr\(0);
  areset_d(1 downto 0) <= \^areset_d\(1 downto 0);
  \areset_d_reg[0]_0\ <= \^areset_d_reg[0]_0\;
  cmd_push_block_reg_0 <= \^cmd_push_block_reg_0\;
  din(4 downto 0) <= \^din\(4 downto 0);
  m_axi_awaddr(31 downto 0) <= \^m_axi_awaddr\(31 downto 0);
\S_AXI_AADDR_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(0),
      Q => S_AXI_AADDR_Q(0),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(10),
      Q => S_AXI_AADDR_Q(10),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(11),
      Q => S_AXI_AADDR_Q(11),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(12),
      Q => S_AXI_AADDR_Q(12),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(13),
      Q => S_AXI_AADDR_Q(13),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(14),
      Q => S_AXI_AADDR_Q(14),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(15),
      Q => S_AXI_AADDR_Q(15),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(16),
      Q => S_AXI_AADDR_Q(16),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(17),
      Q => S_AXI_AADDR_Q(17),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(18),
      Q => S_AXI_AADDR_Q(18),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(19),
      Q => S_AXI_AADDR_Q(19),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(1),
      Q => S_AXI_AADDR_Q(1),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(20),
      Q => S_AXI_AADDR_Q(20),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(21),
      Q => S_AXI_AADDR_Q(21),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(22),
      Q => S_AXI_AADDR_Q(22),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(23),
      Q => S_AXI_AADDR_Q(23),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(24),
      Q => S_AXI_AADDR_Q(24),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(25),
      Q => S_AXI_AADDR_Q(25),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(26),
      Q => S_AXI_AADDR_Q(26),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(27),
      Q => S_AXI_AADDR_Q(27),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(28),
      Q => S_AXI_AADDR_Q(28),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(29),
      Q => S_AXI_AADDR_Q(29),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(2),
      Q => S_AXI_AADDR_Q(2),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(30),
      Q => S_AXI_AADDR_Q(30),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(31),
      Q => S_AXI_AADDR_Q(31),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(3),
      Q => S_AXI_AADDR_Q(3),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(4),
      Q => S_AXI_AADDR_Q(4),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(5),
      Q => S_AXI_AADDR_Q(5),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(6),
      Q => S_AXI_AADDR_Q(6),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(7),
      Q => S_AXI_AADDR_Q(7),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(8),
      Q => S_AXI_AADDR_Q(8),
      R => \^sr\(0)
    );
\S_AXI_AADDR_Q_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awaddr(9),
      Q => S_AXI_AADDR_Q(9),
      R => \^sr\(0)
    );
\S_AXI_ABURST_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awburst(0),
      Q => m_axi_awburst(0),
      R => \^sr\(0)
    );
\S_AXI_ABURST_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awburst(1),
      Q => m_axi_awburst(1),
      R => \^sr\(0)
    );
\S_AXI_ACACHE_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awcache(0),
      Q => m_axi_awcache(0),
      R => \^sr\(0)
    );
\S_AXI_ACACHE_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awcache(1),
      Q => m_axi_awcache(1),
      R => \^sr\(0)
    );
\S_AXI_ACACHE_Q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awcache(2),
      Q => m_axi_awcache(2),
      R => \^sr\(0)
    );
\S_AXI_ACACHE_Q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awcache(3),
      Q => m_axi_awcache(3),
      R => \^sr\(0)
    );
\S_AXI_AID_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awid(0),
      Q => \^din\(4),
      R => \^sr\(0)
    );
\S_AXI_ALEN_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awlen(0),
      Q => S_AXI_ALEN_Q(0),
      R => \^sr\(0)
    );
\S_AXI_ALEN_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awlen(1),
      Q => S_AXI_ALEN_Q(1),
      R => \^sr\(0)
    );
\S_AXI_ALEN_Q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awlen(2),
      Q => S_AXI_ALEN_Q(2),
      R => \^sr\(0)
    );
\S_AXI_ALEN_Q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awlen(3),
      Q => S_AXI_ALEN_Q(3),
      R => \^sr\(0)
    );
\S_AXI_ALOCK_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awlock(0),
      Q => \S_AXI_ALOCK_Q_reg_n_0_[0]\,
      R => \^sr\(0)
    );
\S_AXI_APROT_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awprot(0),
      Q => m_axi_awprot(0),
      R => \^sr\(0)
    );
\S_AXI_APROT_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awprot(1),
      Q => m_axi_awprot(1),
      R => \^sr\(0)
    );
\S_AXI_APROT_Q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awprot(2),
      Q => m_axi_awprot(2),
      R => \^sr\(0)
    );
\S_AXI_AQOS_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awqos(0),
      Q => m_axi_awqos(0),
      R => \^sr\(0)
    );
\S_AXI_AQOS_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awqos(1),
      Q => m_axi_awqos(1),
      R => \^sr\(0)
    );
\S_AXI_AQOS_Q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awqos(2),
      Q => m_axi_awqos(2),
      R => \^sr\(0)
    );
\S_AXI_AQOS_Q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awqos(3),
      Q => m_axi_awqos(3),
      R => \^sr\(0)
    );
S_AXI_AREADY_I_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \USE_BURSTS.cmd_queue_n_29\,
      Q => \^e\(0),
      R => \^sr\(0)
    );
\S_AXI_ASIZE_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awsize(0),
      Q => m_axi_awsize(0),
      R => \^sr\(0)
    );
\S_AXI_ASIZE_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awsize(1),
      Q => m_axi_awsize(1),
      R => \^sr\(0)
    );
\S_AXI_ASIZE_Q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awsize(2),
      Q => m_axi_awsize(2),
      R => \^sr\(0)
    );
\USE_BURSTS.cmd_queue\: entity work.\bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__xdcDup__1\
     port map (
      D(4) => \USE_BURSTS.cmd_queue_n_17\,
      D(3) => \USE_BURSTS.cmd_queue_n_18\,
      D(2) => \USE_BURSTS.cmd_queue_n_19\,
      D(1) => \USE_BURSTS.cmd_queue_n_20\,
      D(0) => \USE_BURSTS.cmd_queue_n_21\,
      E(0) => \USE_BURSTS.cmd_queue_n_15\,
      Q(5 downto 0) => \USE_B_CHANNEL.cmd_b_depth_reg\(5 downto 0),
      SR(0) => \^sr\(0),
      \USE_B_CHANNEL.cmd_b_depth_reg[0]\ => \inst/empty\,
      \USE_WRITE.wr_cmd_ready\ => \USE_WRITE.wr_cmd_ready\,
      aclk => aclk,
      almost_b_empty => almost_b_empty,
      areset_d(1 downto 0) => \^areset_d\(1 downto 0),
      aresetn => aresetn,
      aresetn_0 => \USE_BURSTS.cmd_queue_n_22\,
      cmd_b_empty => cmd_b_empty,
      cmd_b_push_block => cmd_b_push_block,
      cmd_b_push_block_reg => cmd_b_push,
      cmd_b_push_block_reg_0 => \USE_BURSTS.cmd_queue_n_14\,
      cmd_b_push_block_reg_1 => \USE_BURSTS.cmd_queue_n_16\,
      cmd_b_push_block_reg_2 => \^e\(0),
      cmd_push_block => cmd_push_block,
      command_ongoing => command_ongoing,
      command_ongoing_reg => \^areset_d_reg[0]_0\,
      din(3 downto 0) => \^din\(3 downto 0),
      dout(4 downto 0) => dout(4 downto 0),
      empty => empty,
      empty_fwft_i_reg => empty_fwft_i_reg,
      first_mi_word => first_mi_word,
      first_mi_word_reg => first_mi_word_reg,
      full => \inst/full\,
      \goreg_dm.dout_i_reg[1]\ => \goreg_dm.dout_i_reg[1]\,
      \goreg_dm.dout_i_reg[2]\ => \goreg_dm.dout_i_reg[2]\,
      \gpr1.dout_i_reg[1]\ => \^din\(4),
      \last_split__1\ => \last_split__1\,
      last_word => last_word,
      length_counter_1_reg(1 downto 0) => length_counter_1_reg(1 downto 0),
      \m_axi_awlen[3]\(3 downto 0) => pushed_commands_reg(3 downto 0),
      \m_axi_awlen[3]_0\(3 downto 0) => S_AXI_ALEN_Q(3 downto 0),
      m_axi_awready => m_axi_awready,
      m_axi_awready_0(0) => pushed_new_cmd,
      m_axi_awvalid => \USE_B_CHANNEL.cmd_b_queue_n_19\,
      m_axi_awvalid_0 => \USE_B_CHANNEL.cmd_b_queue_n_18\,
      m_axi_awvalid_1 => \inst/full_0\,
      m_axi_bvalid => m_axi_bvalid,
      m_axi_wlast => m_axi_wlast,
      m_axi_wready => m_axi_wready,
      m_axi_wvalid => m_axi_wvalid,
      need_to_split_q => need_to_split_q,
      ram_full_i_reg => ram_full_i_reg,
      rd_en => \USE_WRITE.wr_cmd_b_ready\,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_awvalid_0 => \USE_BURSTS.cmd_queue_n_29\,
      s_axi_awvalid_1 => \USE_BURSTS.cmd_queue_n_30\,
      s_axi_bready => s_axi_bready,
      s_axi_wvalid => s_axi_wvalid,
      wr_en => cmd_push
    );
\USE_B_CHANNEL.cmd_b_depth[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \USE_B_CHANNEL.cmd_b_depth_reg\(0),
      O => \USE_B_CHANNEL.cmd_b_depth[0]_i_1_n_0\
    );
\USE_B_CHANNEL.cmd_b_depth_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \USE_BURSTS.cmd_queue_n_15\,
      D => \USE_B_CHANNEL.cmd_b_depth[0]_i_1_n_0\,
      Q => \USE_B_CHANNEL.cmd_b_depth_reg\(0),
      R => \^sr\(0)
    );
\USE_B_CHANNEL.cmd_b_depth_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \USE_BURSTS.cmd_queue_n_15\,
      D => \USE_BURSTS.cmd_queue_n_21\,
      Q => \USE_B_CHANNEL.cmd_b_depth_reg\(1),
      R => \^sr\(0)
    );
\USE_B_CHANNEL.cmd_b_depth_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \USE_BURSTS.cmd_queue_n_15\,
      D => \USE_BURSTS.cmd_queue_n_20\,
      Q => \USE_B_CHANNEL.cmd_b_depth_reg\(2),
      R => \^sr\(0)
    );
\USE_B_CHANNEL.cmd_b_depth_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \USE_BURSTS.cmd_queue_n_15\,
      D => \USE_BURSTS.cmd_queue_n_19\,
      Q => \USE_B_CHANNEL.cmd_b_depth_reg\(3),
      R => \^sr\(0)
    );
\USE_B_CHANNEL.cmd_b_depth_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \USE_BURSTS.cmd_queue_n_15\,
      D => \USE_BURSTS.cmd_queue_n_18\,
      Q => \USE_B_CHANNEL.cmd_b_depth_reg\(4),
      R => \^sr\(0)
    );
\USE_B_CHANNEL.cmd_b_depth_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \USE_BURSTS.cmd_queue_n_15\,
      D => \USE_BURSTS.cmd_queue_n_17\,
      Q => \USE_B_CHANNEL.cmd_b_depth_reg\(5),
      R => \^sr\(0)
    );
\USE_B_CHANNEL.cmd_b_empty_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => \USE_B_CHANNEL.cmd_b_depth_reg\(2),
      I1 => \USE_B_CHANNEL.cmd_b_depth_reg\(3),
      I2 => \USE_B_CHANNEL.cmd_b_depth_reg\(0),
      I3 => \USE_B_CHANNEL.cmd_b_depth_reg\(1),
      I4 => \USE_B_CHANNEL.cmd_b_depth_reg\(5),
      I5 => \USE_B_CHANNEL.cmd_b_depth_reg\(4),
      O => almost_b_empty
    );
\USE_B_CHANNEL.cmd_b_empty_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \USE_BURSTS.cmd_queue_n_16\,
      Q => cmd_b_empty,
      S => \^sr\(0)
    );
\USE_B_CHANNEL.cmd_b_queue\: entity work.bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo
     port map (
      D(4) => \USE_B_CHANNEL.cmd_b_queue_n_12\,
      D(3) => \USE_B_CHANNEL.cmd_b_queue_n_13\,
      D(2) => \USE_B_CHANNEL.cmd_b_queue_n_14\,
      D(1) => \USE_B_CHANNEL.cmd_b_queue_n_15\,
      D(0) => \USE_B_CHANNEL.cmd_b_queue_n_16\,
      Q(3 downto 0) => num_transactions_q(3 downto 0),
      SR(0) => \^sr\(0),
      \S_AXI_AID_Q_reg[0]\ => \USE_B_CHANNEL.cmd_b_queue_n_18\,
      \USE_WRITE.wr_cmd_ready\ => \USE_WRITE.wr_cmd_ready\,
      access_is_incr_q => access_is_incr_q,
      aclk => aclk,
      almost_b_empty => almost_b_empty,
      almost_empty => almost_empty,
      aresetn => aresetn,
      cmd_b_empty => cmd_b_empty,
      \cmd_depth_reg[5]\(5 downto 0) => cmd_depth_reg(5 downto 0),
      cmd_empty => cmd_empty,
      cmd_empty_reg => \USE_B_CHANNEL.cmd_b_queue_n_9\,
      cmd_push_block => cmd_push_block,
      cmd_push_block_reg => \^cmd_push_block_reg_0\,
      command_ongoing => command_ongoing,
      din(0) => cmd_b_split_i,
      empty => \inst/empty\,
      full => \inst/full_0\,
      \goreg_dm.dout_i_reg[4]\(4 downto 0) => \goreg_dm.dout_i_reg[4]\(4 downto 0),
      \last_split__1\ => \last_split__1\,
      last_word => last_word,
      m_axi_awvalid => split_in_progress_reg_n_0,
      m_axi_bvalid => m_axi_bvalid,
      multiple_id_non_split => multiple_id_non_split,
      need_to_split_q => need_to_split_q,
      queue_id => queue_id,
      \queue_id_reg[0]\ => \USE_B_CHANNEL.cmd_b_queue_n_21\,
      \queue_id_reg[0]_0\ => \inst/full\,
      \queue_id_reg[0]_1\ => \^din\(4),
      ram_full_fb_i_reg => cmd_b_push,
      rd_en => \USE_WRITE.wr_cmd_b_ready\,
      s_axi_bready => s_axi_bready,
      split_in_progress => split_in_progress,
      split_in_progress_reg => \USE_B_CHANNEL.cmd_b_queue_n_19\,
      split_ongoing_reg(3 downto 0) => pushed_commands_reg(3 downto 0),
      wr_en => cmd_push
    );
access_is_incr_q_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_awburst(0),
      I1 => s_axi_awburst(1),
      O => access_is_incr
    );
access_is_incr_q_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => access_is_incr,
      Q => access_is_incr_q,
      R => \^sr\(0)
    );
\addr_step_q[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_awsize(0),
      I1 => s_axi_awsize(2),
      I2 => s_axi_awsize(1),
      O => addr_step(10)
    );
\addr_step_q[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => s_axi_awsize(2),
      I1 => s_axi_awsize(0),
      I2 => s_axi_awsize(1),
      O => addr_step(11)
    );
\addr_step_q[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => s_axi_awsize(0),
      I1 => s_axi_awsize(2),
      I2 => s_axi_awsize(1),
      O => addr_step(5)
    );
\addr_step_q[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awsize(0),
      I2 => s_axi_awsize(2),
      O => \addr_step_q[6]_i_1_n_0\
    );
\addr_step_q[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awsize(0),
      I2 => s_axi_awsize(2),
      O => \addr_step_q[7]_i_1_n_0\
    );
\addr_step_q[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => s_axi_awsize(2),
      I1 => s_axi_awsize(1),
      I2 => s_axi_awsize(0),
      O => \addr_step_q[8]_i_1_n_0\
    );
\addr_step_q[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => s_axi_awsize(0),
      I1 => s_axi_awsize(2),
      I2 => s_axi_awsize(1),
      O => \addr_step_q[9]_i_1_n_0\
    );
\addr_step_q_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => addr_step(10),
      Q => addr_step_q(10),
      R => \^sr\(0)
    );
\addr_step_q_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => addr_step(11),
      Q => addr_step_q(11),
      R => \^sr\(0)
    );
\addr_step_q_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => addr_step(5),
      Q => addr_step_q(5),
      R => \^sr\(0)
    );
\addr_step_q_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \addr_step_q[6]_i_1_n_0\,
      Q => addr_step_q(6),
      R => \^sr\(0)
    );
\addr_step_q_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \addr_step_q[7]_i_1_n_0\,
      Q => addr_step_q(7),
      R => \^sr\(0)
    );
\addr_step_q_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \addr_step_q[8]_i_1_n_0\,
      Q => addr_step_q(8),
      R => \^sr\(0)
    );
\addr_step_q_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \addr_step_q[9]_i_1_n_0\,
      Q => addr_step_q(9),
      R => \^sr\(0)
    );
\areset_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \^sr\(0),
      Q => \^areset_d\(0),
      R => '0'
    );
\areset_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \^areset_d\(0),
      Q => \^areset_d\(1),
      R => '0'
    );
cmd_b_push_block_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \USE_BURSTS.cmd_queue_n_14\,
      Q => cmd_b_push_block,
      R => '0'
    );
\cmd_depth[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cmd_depth_reg(0),
      O => \cmd_depth[0]_i_1_n_0\
    );
\cmd_depth_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \cmd_depth_reg[5]_0\(0),
      D => \cmd_depth[0]_i_1_n_0\,
      Q => cmd_depth_reg(0),
      R => \^sr\(0)
    );
\cmd_depth_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \cmd_depth_reg[5]_0\(0),
      D => \USE_B_CHANNEL.cmd_b_queue_n_16\,
      Q => cmd_depth_reg(1),
      R => \^sr\(0)
    );
\cmd_depth_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \cmd_depth_reg[5]_0\(0),
      D => \USE_B_CHANNEL.cmd_b_queue_n_15\,
      Q => cmd_depth_reg(2),
      R => \^sr\(0)
    );
\cmd_depth_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \cmd_depth_reg[5]_0\(0),
      D => \USE_B_CHANNEL.cmd_b_queue_n_14\,
      Q => cmd_depth_reg(3),
      R => \^sr\(0)
    );
\cmd_depth_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \cmd_depth_reg[5]_0\(0),
      D => \USE_B_CHANNEL.cmd_b_queue_n_13\,
      Q => cmd_depth_reg(4),
      R => \^sr\(0)
    );
\cmd_depth_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \cmd_depth_reg[5]_0\(0),
      D => \USE_B_CHANNEL.cmd_b_queue_n_12\,
      Q => cmd_depth_reg(5),
      R => \^sr\(0)
    );
cmd_empty_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => cmd_depth_reg(2),
      I1 => cmd_depth_reg(3),
      I2 => cmd_depth_reg(0),
      I3 => cmd_depth_reg(1),
      I4 => cmd_depth_reg(5),
      I5 => cmd_depth_reg(4),
      O => almost_empty
    );
cmd_empty_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \USE_B_CHANNEL.cmd_b_queue_n_9\,
      Q => cmd_empty,
      S => \^sr\(0)
    );
cmd_push_block_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \USE_BURSTS.cmd_queue_n_22\,
      Q => cmd_push_block,
      R => '0'
    );
command_ongoing_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^areset_d\(0),
      I1 => \^areset_d\(1),
      O => \^areset_d_reg[0]_0\
    );
command_ongoing_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \USE_BURSTS.cmd_queue_n_30\,
      Q => command_ongoing,
      R => \^sr\(0)
    );
\first_step_q[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awsize(0),
      I2 => s_axi_awlen(0),
      I3 => s_axi_awsize(2),
      O => \first_step_q[0]_i_1_n_0\
    );
\first_step_q[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_awsize(2),
      I1 => \first_step_q[10]_i_2_n_0\,
      O => first_step(10)
    );
\first_step_q[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAA800080000000"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awlen(2),
      I2 => s_axi_awlen(0),
      I3 => s_axi_awlen(1),
      I4 => s_axi_awlen(3),
      I5 => s_axi_awsize(0),
      O => \first_step_q[10]_i_2_n_0\
    );
\first_step_q[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_awsize(2),
      I1 => \first_step_q[11]_i_2_n_0\,
      O => first_step(11)
    );
\first_step_q[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awlen(3),
      I2 => s_axi_awlen(1),
      I3 => s_axi_awlen(0),
      I4 => s_axi_awlen(2),
      I5 => s_axi_awsize(0),
      O => \first_step_q[11]_i_2_n_0\
    );
\first_step_q[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000514"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awsize(0),
      I2 => s_axi_awlen(0),
      I3 => s_axi_awlen(1),
      I4 => s_axi_awsize(2),
      O => \first_step_q[1]_i_1_n_0\
    );
\first_step_q[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000F3C6A"
    )
        port map (
      I0 => s_axi_awlen(2),
      I1 => s_axi_awlen(1),
      I2 => s_axi_awlen(0),
      I3 => s_axi_awsize(0),
      I4 => s_axi_awsize(1),
      I5 => s_axi_awsize(2),
      O => \first_step_q[2]_i_1_n_0\
    );
\first_step_q[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \first_step_q[7]_i_2_n_0\,
      I1 => s_axi_awsize(2),
      O => \first_step_q[3]_i_1_n_0\
    );
\first_step_q[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01FF0100"
    )
        port map (
      I0 => s_axi_awlen(0),
      I1 => s_axi_awsize(0),
      I2 => s_axi_awsize(1),
      I3 => s_axi_awsize(2),
      I4 => \first_step_q[8]_i_2_n_0\,
      O => first_step(4)
    );
\first_step_q[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0036FFFF00360000"
    )
        port map (
      I0 => s_axi_awlen(1),
      I1 => s_axi_awlen(0),
      I2 => s_axi_awsize(0),
      I3 => s_axi_awsize(1),
      I4 => s_axi_awsize(2),
      I5 => \first_step_q[9]_i_2_n_0\,
      O => first_step(5)
    );
\first_step_q[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \first_step_q[6]_i_2_n_0\,
      I1 => s_axi_awsize(2),
      I2 => \first_step_q[10]_i_2_n_0\,
      O => first_step(6)
    );
\first_step_q[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"07531642"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awsize(0),
      I2 => s_axi_awlen(0),
      I3 => s_axi_awlen(1),
      I4 => s_axi_awlen(2),
      O => \first_step_q[6]_i_2_n_0\
    );
\first_step_q[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \first_step_q[7]_i_2_n_0\,
      I1 => s_axi_awsize(2),
      I2 => \first_step_q[11]_i_2_n_0\,
      O => first_step(7)
    );
\first_step_q[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07FD53B916EC42A8"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awsize(0),
      I2 => s_axi_awlen(1),
      I3 => s_axi_awlen(0),
      I4 => s_axi_awlen(2),
      I5 => s_axi_awlen(3),
      O => \first_step_q[7]_i_2_n_0\
    );
\first_step_q[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_awsize(2),
      I1 => \first_step_q[8]_i_2_n_0\,
      O => first_step(8)
    );
\first_step_q[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"14EAEA6262C8C840"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awsize(0),
      I2 => s_axi_awlen(3),
      I3 => s_axi_awlen(1),
      I4 => s_axi_awlen(0),
      I5 => s_axi_awlen(2),
      O => \first_step_q[8]_i_2_n_0\
    );
\first_step_q[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_awsize(2),
      I1 => \first_step_q[9]_i_2_n_0\,
      O => first_step(9)
    );
\first_step_q[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4AA2A2A228808080"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awsize(0),
      I2 => s_axi_awlen(2),
      I3 => s_axi_awlen(0),
      I4 => s_axi_awlen(1),
      I5 => s_axi_awlen(3),
      O => \first_step_q[9]_i_2_n_0\
    );
\first_step_q_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \first_step_q[0]_i_1_n_0\,
      Q => first_step_q(0),
      R => \^sr\(0)
    );
\first_step_q_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(10),
      Q => first_step_q(10),
      R => \^sr\(0)
    );
\first_step_q_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(11),
      Q => first_step_q(11),
      R => \^sr\(0)
    );
\first_step_q_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \first_step_q[1]_i_1_n_0\,
      Q => first_step_q(1),
      R => \^sr\(0)
    );
\first_step_q_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \first_step_q[2]_i_1_n_0\,
      Q => first_step_q(2),
      R => \^sr\(0)
    );
\first_step_q_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \first_step_q[3]_i_1_n_0\,
      Q => first_step_q(3),
      R => \^sr\(0)
    );
\first_step_q_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(4),
      Q => first_step_q(4),
      R => \^sr\(0)
    );
\first_step_q_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(5),
      Q => first_step_q(5),
      R => \^sr\(0)
    );
\first_step_q_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(6),
      Q => first_step_q(6),
      R => \^sr\(0)
    );
\first_step_q_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(7),
      Q => first_step_q(7),
      R => \^sr\(0)
    );
\first_step_q_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(8),
      Q => first_step_q(8),
      R => \^sr\(0)
    );
\first_step_q_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(9),
      Q => first_step_q(9),
      R => \^sr\(0)
    );
incr_need_to_split: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444444444440"
    )
        port map (
      I0 => s_axi_awburst(1),
      I1 => s_axi_awburst(0),
      I2 => s_axi_awlen(5),
      I3 => s_axi_awlen(4),
      I4 => s_axi_awlen(6),
      I5 => s_axi_awlen(7),
      O => \incr_need_to_split__0\
    );
incr_need_to_split_q_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \incr_need_to_split__0\,
      Q => need_to_split_q,
      R => \^sr\(0)
    );
\m_axi_awaddr[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(0),
      I1 => size_mask_q(0),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => S_AXI_AADDR_Q(0),
      O => \^m_axi_awaddr\(0)
    );
\m_axi_awaddr[10]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(10),
      I1 => next_mi_addr(10),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(10)
    );
\m_axi_awaddr[11]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(11),
      I1 => next_mi_addr(11),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(11)
    );
\m_axi_awaddr[12]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(12),
      I1 => next_mi_addr(12),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(12)
    );
\m_axi_awaddr[13]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(13),
      I1 => next_mi_addr(13),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(13)
    );
\m_axi_awaddr[14]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(14),
      I1 => next_mi_addr(14),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(14)
    );
\m_axi_awaddr[15]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(15),
      I1 => next_mi_addr(15),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(15)
    );
\m_axi_awaddr[16]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(16),
      I1 => next_mi_addr(16),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(16)
    );
\m_axi_awaddr[17]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(17),
      I1 => next_mi_addr(17),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(17)
    );
\m_axi_awaddr[18]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(18),
      I1 => next_mi_addr(18),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(18)
    );
\m_axi_awaddr[19]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(19),
      I1 => next_mi_addr(19),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(19)
    );
\m_axi_awaddr[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(1),
      I1 => size_mask_q(1),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => S_AXI_AADDR_Q(1),
      O => \^m_axi_awaddr\(1)
    );
\m_axi_awaddr[20]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(20),
      I1 => next_mi_addr(20),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(20)
    );
\m_axi_awaddr[21]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(21),
      I1 => next_mi_addr(21),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(21)
    );
\m_axi_awaddr[22]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(22),
      I1 => next_mi_addr(22),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(22)
    );
\m_axi_awaddr[23]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(23),
      I1 => next_mi_addr(23),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(23)
    );
\m_axi_awaddr[24]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(24),
      I1 => next_mi_addr(24),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(24)
    );
\m_axi_awaddr[25]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(25),
      I1 => next_mi_addr(25),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(25)
    );
\m_axi_awaddr[26]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(26),
      I1 => next_mi_addr(26),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(26)
    );
\m_axi_awaddr[27]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(27),
      I1 => next_mi_addr(27),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(27)
    );
\m_axi_awaddr[28]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(28),
      I1 => next_mi_addr(28),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(28)
    );
\m_axi_awaddr[29]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(29),
      I1 => next_mi_addr(29),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(29)
    );
\m_axi_awaddr[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(2),
      I1 => size_mask_q(2),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => S_AXI_AADDR_Q(2),
      O => \^m_axi_awaddr\(2)
    );
\m_axi_awaddr[30]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(30),
      I1 => next_mi_addr(30),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(30)
    );
\m_axi_awaddr[31]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(31),
      I1 => next_mi_addr(31),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(31)
    );
\m_axi_awaddr[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(3),
      I1 => size_mask_q(3),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => S_AXI_AADDR_Q(3),
      O => \^m_axi_awaddr\(3)
    );
\m_axi_awaddr[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(4),
      I1 => size_mask_q(4),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => S_AXI_AADDR_Q(4),
      O => \^m_axi_awaddr\(4)
    );
\m_axi_awaddr[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(5),
      I1 => size_mask_q(5),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => S_AXI_AADDR_Q(5),
      O => \^m_axi_awaddr\(5)
    );
\m_axi_awaddr[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(6),
      I1 => size_mask_q(6),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => S_AXI_AADDR_Q(6),
      O => \^m_axi_awaddr\(6)
    );
\m_axi_awaddr[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(7),
      I1 => next_mi_addr(7),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(7)
    );
\m_axi_awaddr[8]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(8),
      I1 => next_mi_addr(8),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(8)
    );
\m_axi_awaddr[9]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(9),
      I1 => next_mi_addr(9),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_awaddr\(9)
    );
\m_axi_awlock[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \S_AXI_ALOCK_Q_reg_n_0_[0]\,
      I1 => need_to_split_q,
      O => m_axi_awlock(0)
    );
multiple_id_non_split_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AE"
    )
        port map (
      I0 => multiple_id_non_split,
      I1 => multiple_id_non_split_i_2_n_0,
      I2 => \^cmd_push_block_reg_0\,
      I3 => split_in_progress,
      O => multiple_id_non_split_i_1_n_0
    );
multiple_id_non_split_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000511151110000"
    )
        port map (
      I0 => need_to_split_q,
      I1 => split_in_progress_reg_n_0,
      I2 => cmd_b_empty,
      I3 => cmd_empty,
      I4 => queue_id,
      I5 => \^din\(4),
      O => multiple_id_non_split_i_2_n_0
    );
multiple_id_non_split_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => multiple_id_non_split_i_1_n_0,
      Q => multiple_id_non_split,
      R => '0'
    );
\next_mi_addr[11]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_awaddr\(11),
      I1 => addr_step_q(11),
      I2 => \first_split__2\,
      I3 => first_step_q(11),
      O => \next_mi_addr[11]_i_2_n_0\
    );
\next_mi_addr[11]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_awaddr\(10),
      I1 => addr_step_q(10),
      I2 => \first_split__2\,
      I3 => first_step_q(10),
      O => \next_mi_addr[11]_i_3_n_0\
    );
\next_mi_addr[11]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_awaddr\(9),
      I1 => addr_step_q(9),
      I2 => \first_split__2\,
      I3 => first_step_q(9),
      O => \next_mi_addr[11]_i_4_n_0\
    );
\next_mi_addr[11]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_awaddr\(8),
      I1 => addr_step_q(8),
      I2 => \first_split__2\,
      I3 => first_step_q(8),
      O => \next_mi_addr[11]_i_5_n_0\
    );
\next_mi_addr[11]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => pushed_commands_reg(1),
      I1 => pushed_commands_reg(0),
      I2 => pushed_commands_reg(3),
      I3 => pushed_commands_reg(2),
      O => \first_split__2\
    );
\next_mi_addr[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(15),
      I1 => next_mi_addr(15),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_2_n_0\
    );
\next_mi_addr[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(14),
      I1 => next_mi_addr(14),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_3_n_0\
    );
\next_mi_addr[15]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(13),
      I1 => next_mi_addr(13),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_4_n_0\
    );
\next_mi_addr[15]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(12),
      I1 => next_mi_addr(12),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_5_n_0\
    );
\next_mi_addr[15]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(15),
      I1 => next_mi_addr(15),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_6_n_0\
    );
\next_mi_addr[15]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(14),
      I1 => next_mi_addr(14),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_7_n_0\
    );
\next_mi_addr[15]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(13),
      I1 => next_mi_addr(13),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_8_n_0\
    );
\next_mi_addr[15]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(12),
      I1 => next_mi_addr(12),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_9_n_0\
    );
\next_mi_addr[19]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(19),
      I1 => next_mi_addr(19),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[19]_i_2_n_0\
    );
\next_mi_addr[19]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(18),
      I1 => next_mi_addr(18),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[19]_i_3_n_0\
    );
\next_mi_addr[19]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(17),
      I1 => next_mi_addr(17),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[19]_i_4_n_0\
    );
\next_mi_addr[19]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(16),
      I1 => next_mi_addr(16),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[19]_i_5_n_0\
    );
\next_mi_addr[23]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(23),
      I1 => next_mi_addr(23),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[23]_i_2_n_0\
    );
\next_mi_addr[23]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(22),
      I1 => next_mi_addr(22),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[23]_i_3_n_0\
    );
\next_mi_addr[23]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(21),
      I1 => next_mi_addr(21),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[23]_i_4_n_0\
    );
\next_mi_addr[23]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(20),
      I1 => next_mi_addr(20),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[23]_i_5_n_0\
    );
\next_mi_addr[27]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(27),
      I1 => next_mi_addr(27),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[27]_i_2_n_0\
    );
\next_mi_addr[27]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(26),
      I1 => next_mi_addr(26),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[27]_i_3_n_0\
    );
\next_mi_addr[27]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(25),
      I1 => next_mi_addr(25),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[27]_i_4_n_0\
    );
\next_mi_addr[27]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(24),
      I1 => next_mi_addr(24),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[27]_i_5_n_0\
    );
\next_mi_addr[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(31),
      I1 => next_mi_addr(31),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[31]_i_2_n_0\
    );
\next_mi_addr[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(30),
      I1 => next_mi_addr(30),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[31]_i_3_n_0\
    );
\next_mi_addr[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(29),
      I1 => next_mi_addr(29),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[31]_i_4_n_0\
    );
\next_mi_addr[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => S_AXI_AADDR_Q(28),
      I1 => next_mi_addr(28),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[31]_i_5_n_0\
    );
\next_mi_addr[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1DDDE222E222E222"
    )
        port map (
      I0 => S_AXI_AADDR_Q(3),
      I1 => \M_AXI_AADDR_I1__0\,
      I2 => size_mask_q(3),
      I3 => next_mi_addr(3),
      I4 => \first_split__2\,
      I5 => first_step_q(3),
      O => \next_mi_addr[3]_i_2_n_0\
    );
\next_mi_addr[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1DDDE222E222E222"
    )
        port map (
      I0 => S_AXI_AADDR_Q(2),
      I1 => \M_AXI_AADDR_I1__0\,
      I2 => size_mask_q(2),
      I3 => next_mi_addr(2),
      I4 => \first_split__2\,
      I5 => first_step_q(2),
      O => \next_mi_addr[3]_i_3_n_0\
    );
\next_mi_addr[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1DDDE222E222E222"
    )
        port map (
      I0 => S_AXI_AADDR_Q(1),
      I1 => \M_AXI_AADDR_I1__0\,
      I2 => size_mask_q(1),
      I3 => next_mi_addr(1),
      I4 => \first_split__2\,
      I5 => first_step_q(1),
      O => \next_mi_addr[3]_i_4_n_0\
    );
\next_mi_addr[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1DDDE222E222E222"
    )
        port map (
      I0 => S_AXI_AADDR_Q(0),
      I1 => \M_AXI_AADDR_I1__0\,
      I2 => size_mask_q(0),
      I3 => next_mi_addr(0),
      I4 => \first_split__2\,
      I5 => first_step_q(0),
      O => \next_mi_addr[3]_i_5_n_0\
    );
\next_mi_addr[3]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => split_ongoing,
      I1 => access_is_incr_q,
      O => \M_AXI_AADDR_I1__0\
    );
\next_mi_addr[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_awaddr\(7),
      I1 => addr_step_q(7),
      I2 => \first_split__2\,
      I3 => first_step_q(7),
      O => \next_mi_addr[7]_i_2_n_0\
    );
\next_mi_addr[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_awaddr\(6),
      I1 => addr_step_q(6),
      I2 => \first_split__2\,
      I3 => first_step_q(6),
      O => \next_mi_addr[7]_i_3_n_0\
    );
\next_mi_addr[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_awaddr\(5),
      I1 => addr_step_q(5),
      I2 => \first_split__2\,
      I3 => first_step_q(5),
      O => \next_mi_addr[7]_i_4_n_0\
    );
\next_mi_addr[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_awaddr\(4),
      I1 => size_mask_q(0),
      I2 => \first_split__2\,
      I3 => first_step_q(4),
      O => \next_mi_addr[7]_i_5_n_0\
    );
\next_mi_addr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(0),
      Q => next_mi_addr(0),
      R => \^sr\(0)
    );
\next_mi_addr_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(10),
      Q => next_mi_addr(10),
      R => \^sr\(0)
    );
\next_mi_addr_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(11),
      Q => next_mi_addr(11),
      R => \^sr\(0)
    );
\next_mi_addr_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[7]_i_1_n_0\,
      CO(3) => \next_mi_addr_reg[11]_i_1_n_0\,
      CO(2) => \next_mi_addr_reg[11]_i_1_n_1\,
      CO(1) => \next_mi_addr_reg[11]_i_1_n_2\,
      CO(0) => \next_mi_addr_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^m_axi_awaddr\(11 downto 8),
      O(3 downto 0) => p_0_in(11 downto 8),
      S(3) => \next_mi_addr[11]_i_2_n_0\,
      S(2) => \next_mi_addr[11]_i_3_n_0\,
      S(1) => \next_mi_addr[11]_i_4_n_0\,
      S(0) => \next_mi_addr[11]_i_5_n_0\
    );
\next_mi_addr_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(12),
      Q => next_mi_addr(12),
      R => \^sr\(0)
    );
\next_mi_addr_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(13),
      Q => next_mi_addr(13),
      R => \^sr\(0)
    );
\next_mi_addr_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(14),
      Q => next_mi_addr(14),
      R => \^sr\(0)
    );
\next_mi_addr_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(15),
      Q => next_mi_addr(15),
      R => \^sr\(0)
    );
\next_mi_addr_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[11]_i_1_n_0\,
      CO(3) => \next_mi_addr_reg[15]_i_1_n_0\,
      CO(2) => \next_mi_addr_reg[15]_i_1_n_1\,
      CO(1) => \next_mi_addr_reg[15]_i_1_n_2\,
      CO(0) => \next_mi_addr_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \next_mi_addr[15]_i_2_n_0\,
      DI(2) => \next_mi_addr[15]_i_3_n_0\,
      DI(1) => \next_mi_addr[15]_i_4_n_0\,
      DI(0) => \next_mi_addr[15]_i_5_n_0\,
      O(3 downto 0) => p_0_in(15 downto 12),
      S(3) => \next_mi_addr[15]_i_6_n_0\,
      S(2) => \next_mi_addr[15]_i_7_n_0\,
      S(1) => \next_mi_addr[15]_i_8_n_0\,
      S(0) => \next_mi_addr[15]_i_9_n_0\
    );
\next_mi_addr_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(16),
      Q => next_mi_addr(16),
      R => \^sr\(0)
    );
\next_mi_addr_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(17),
      Q => next_mi_addr(17),
      R => \^sr\(0)
    );
\next_mi_addr_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(18),
      Q => next_mi_addr(18),
      R => \^sr\(0)
    );
\next_mi_addr_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(19),
      Q => next_mi_addr(19),
      R => \^sr\(0)
    );
\next_mi_addr_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[15]_i_1_n_0\,
      CO(3) => \next_mi_addr_reg[19]_i_1_n_0\,
      CO(2) => \next_mi_addr_reg[19]_i_1_n_1\,
      CO(1) => \next_mi_addr_reg[19]_i_1_n_2\,
      CO(0) => \next_mi_addr_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(19 downto 16),
      S(3) => \next_mi_addr[19]_i_2_n_0\,
      S(2) => \next_mi_addr[19]_i_3_n_0\,
      S(1) => \next_mi_addr[19]_i_4_n_0\,
      S(0) => \next_mi_addr[19]_i_5_n_0\
    );
\next_mi_addr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(1),
      Q => next_mi_addr(1),
      R => \^sr\(0)
    );
\next_mi_addr_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(20),
      Q => next_mi_addr(20),
      R => \^sr\(0)
    );
\next_mi_addr_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(21),
      Q => next_mi_addr(21),
      R => \^sr\(0)
    );
\next_mi_addr_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(22),
      Q => next_mi_addr(22),
      R => \^sr\(0)
    );
\next_mi_addr_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(23),
      Q => next_mi_addr(23),
      R => \^sr\(0)
    );
\next_mi_addr_reg[23]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[19]_i_1_n_0\,
      CO(3) => \next_mi_addr_reg[23]_i_1_n_0\,
      CO(2) => \next_mi_addr_reg[23]_i_1_n_1\,
      CO(1) => \next_mi_addr_reg[23]_i_1_n_2\,
      CO(0) => \next_mi_addr_reg[23]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(23 downto 20),
      S(3) => \next_mi_addr[23]_i_2_n_0\,
      S(2) => \next_mi_addr[23]_i_3_n_0\,
      S(1) => \next_mi_addr[23]_i_4_n_0\,
      S(0) => \next_mi_addr[23]_i_5_n_0\
    );
\next_mi_addr_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(24),
      Q => next_mi_addr(24),
      R => \^sr\(0)
    );
\next_mi_addr_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(25),
      Q => next_mi_addr(25),
      R => \^sr\(0)
    );
\next_mi_addr_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(26),
      Q => next_mi_addr(26),
      R => \^sr\(0)
    );
\next_mi_addr_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(27),
      Q => next_mi_addr(27),
      R => \^sr\(0)
    );
\next_mi_addr_reg[27]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[23]_i_1_n_0\,
      CO(3) => \next_mi_addr_reg[27]_i_1_n_0\,
      CO(2) => \next_mi_addr_reg[27]_i_1_n_1\,
      CO(1) => \next_mi_addr_reg[27]_i_1_n_2\,
      CO(0) => \next_mi_addr_reg[27]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(27 downto 24),
      S(3) => \next_mi_addr[27]_i_2_n_0\,
      S(2) => \next_mi_addr[27]_i_3_n_0\,
      S(1) => \next_mi_addr[27]_i_4_n_0\,
      S(0) => \next_mi_addr[27]_i_5_n_0\
    );
\next_mi_addr_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(28),
      Q => next_mi_addr(28),
      R => \^sr\(0)
    );
\next_mi_addr_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(29),
      Q => next_mi_addr(29),
      R => \^sr\(0)
    );
\next_mi_addr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(2),
      Q => next_mi_addr(2),
      R => \^sr\(0)
    );
\next_mi_addr_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(30),
      Q => next_mi_addr(30),
      R => \^sr\(0)
    );
\next_mi_addr_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(31),
      Q => next_mi_addr(31),
      R => \^sr\(0)
    );
\next_mi_addr_reg[31]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[27]_i_1_n_0\,
      CO(3) => \NLW_next_mi_addr_reg[31]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \next_mi_addr_reg[31]_i_1_n_1\,
      CO(1) => \next_mi_addr_reg[31]_i_1_n_2\,
      CO(0) => \next_mi_addr_reg[31]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_0_in(31 downto 28),
      S(3) => \next_mi_addr[31]_i_2_n_0\,
      S(2) => \next_mi_addr[31]_i_3_n_0\,
      S(1) => \next_mi_addr[31]_i_4_n_0\,
      S(0) => \next_mi_addr[31]_i_5_n_0\
    );
\next_mi_addr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(3),
      Q => next_mi_addr(3),
      R => \^sr\(0)
    );
\next_mi_addr_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \next_mi_addr_reg[3]_i_1_n_0\,
      CO(2) => \next_mi_addr_reg[3]_i_1_n_1\,
      CO(1) => \next_mi_addr_reg[3]_i_1_n_2\,
      CO(0) => \next_mi_addr_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^m_axi_awaddr\(3 downto 0),
      O(3 downto 0) => p_0_in(3 downto 0),
      S(3) => \next_mi_addr[3]_i_2_n_0\,
      S(2) => \next_mi_addr[3]_i_3_n_0\,
      S(1) => \next_mi_addr[3]_i_4_n_0\,
      S(0) => \next_mi_addr[3]_i_5_n_0\
    );
\next_mi_addr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(4),
      Q => next_mi_addr(4),
      R => \^sr\(0)
    );
\next_mi_addr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(5),
      Q => next_mi_addr(5),
      R => \^sr\(0)
    );
\next_mi_addr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(6),
      Q => next_mi_addr(6),
      R => \^sr\(0)
    );
\next_mi_addr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(7),
      Q => next_mi_addr(7),
      R => \^sr\(0)
    );
\next_mi_addr_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[3]_i_1_n_0\,
      CO(3) => \next_mi_addr_reg[7]_i_1_n_0\,
      CO(2) => \next_mi_addr_reg[7]_i_1_n_1\,
      CO(1) => \next_mi_addr_reg[7]_i_1_n_2\,
      CO(0) => \next_mi_addr_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^m_axi_awaddr\(7 downto 4),
      O(3 downto 0) => p_0_in(7 downto 4),
      S(3) => \next_mi_addr[7]_i_2_n_0\,
      S(2) => \next_mi_addr[7]_i_3_n_0\,
      S(1) => \next_mi_addr[7]_i_4_n_0\,
      S(0) => \next_mi_addr[7]_i_5_n_0\
    );
\next_mi_addr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(8),
      Q => next_mi_addr(8),
      R => \^sr\(0)
    );
\next_mi_addr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => p_0_in(9),
      Q => next_mi_addr(9),
      R => \^sr\(0)
    );
\num_transactions_q_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awlen(4),
      Q => num_transactions_q(0),
      R => \^sr\(0)
    );
\num_transactions_q_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awlen(5),
      Q => num_transactions_q(1),
      R => \^sr\(0)
    );
\num_transactions_q_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awlen(6),
      Q => num_transactions_q(2),
      R => \^sr\(0)
    );
\num_transactions_q_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_awlen(7),
      Q => num_transactions_q(3),
      R => \^sr\(0)
    );
\pushed_commands[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pushed_commands_reg(0),
      O => \p_0_in__0\(0)
    );
\pushed_commands[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => pushed_commands_reg(0),
      I1 => pushed_commands_reg(1),
      O => \p_0_in__0\(1)
    );
\pushed_commands[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => pushed_commands_reg(1),
      I1 => pushed_commands_reg(0),
      I2 => pushed_commands_reg(2),
      O => \p_0_in__0\(2)
    );
\pushed_commands[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^e\(0),
      I1 => aresetn,
      O => \pushed_commands[3]_i_1_n_0\
    );
\pushed_commands[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => pushed_commands_reg(2),
      I1 => pushed_commands_reg(0),
      I2 => pushed_commands_reg(1),
      I3 => pushed_commands_reg(3),
      O => \p_0_in__0\(3)
    );
\pushed_commands_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \p_0_in__0\(0),
      Q => pushed_commands_reg(0),
      R => \pushed_commands[3]_i_1_n_0\
    );
\pushed_commands_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \p_0_in__0\(1),
      Q => pushed_commands_reg(1),
      R => \pushed_commands[3]_i_1_n_0\
    );
\pushed_commands_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \p_0_in__0\(2),
      Q => pushed_commands_reg(2),
      R => \pushed_commands[3]_i_1_n_0\
    );
\pushed_commands_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \p_0_in__0\(3),
      Q => pushed_commands_reg(3),
      R => \pushed_commands[3]_i_1_n_0\
    );
\queue_id_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \USE_B_CHANNEL.cmd_b_queue_n_21\,
      Q => queue_id,
      R => \^sr\(0)
    );
\size_mask_q[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awsize(0),
      I2 => s_axi_awsize(2),
      O => size_mask(0)
    );
\size_mask_q[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awsize(2),
      O => size_mask(1)
    );
\size_mask_q[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"15"
    )
        port map (
      I0 => s_axi_awsize(2),
      I1 => s_axi_awsize(1),
      I2 => s_axi_awsize(0),
      O => size_mask(2)
    );
\size_mask_q[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_awsize(2),
      O => size_mask(3)
    );
\size_mask_q[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"57"
    )
        port map (
      I0 => s_axi_awsize(2),
      I1 => s_axi_awsize(1),
      I2 => s_axi_awsize(0),
      O => size_mask(4)
    );
\size_mask_q[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awsize(2),
      O => size_mask(5)
    );
\size_mask_q[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => s_axi_awsize(1),
      I1 => s_axi_awsize(0),
      I2 => s_axi_awsize(2),
      O => size_mask(6)
    );
\size_mask_q_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => size_mask(0),
      Q => size_mask_q(0),
      R => \^sr\(0)
    );
\size_mask_q_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => size_mask(1),
      Q => size_mask_q(1),
      R => \^sr\(0)
    );
\size_mask_q_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => size_mask(2),
      Q => size_mask_q(2),
      R => \^sr\(0)
    );
\size_mask_q_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => '1',
      Q => size_mask_q(31),
      R => \^sr\(0)
    );
\size_mask_q_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => size_mask(3),
      Q => size_mask_q(3),
      R => \^sr\(0)
    );
\size_mask_q_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => size_mask(4),
      Q => size_mask_q(4),
      R => \^sr\(0)
    );
\size_mask_q_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => size_mask(5),
      Q => size_mask_q(5),
      R => \^sr\(0)
    );
\size_mask_q_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => size_mask(6),
      Q => size_mask_q(6),
      R => \^sr\(0)
    );
split_in_progress_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAAAEA"
    )
        port map (
      I0 => split_in_progress_reg_n_0,
      I1 => \cmd_id_check__3\,
      I2 => need_to_split_q,
      I3 => multiple_id_non_split,
      I4 => \^cmd_push_block_reg_0\,
      I5 => split_in_progress,
      O => split_in_progress_i_1_n_0
    );
split_in_progress_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F88F"
    )
        port map (
      I0 => cmd_b_empty,
      I1 => cmd_empty,
      I2 => queue_id,
      I3 => \^din\(4),
      O => \cmd_id_check__3\
    );
split_in_progress_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => split_in_progress_i_1_n_0,
      Q => split_in_progress_reg_n_0,
      R => '0'
    );
split_ongoing_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => cmd_b_split_i,
      Q => split_ongoing,
      R => \^sr\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv__parameterized0\ is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \S_AXI_AID_Q_reg[0]_0\ : out STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    m_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rlast : out STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    aclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arready : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_rlast : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    areset_d : in STD_LOGIC_VECTOR ( 1 downto 0 );
    command_ongoing_reg_0 : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv__parameterized0\ : entity is "axi_protocol_converter_v2_1_33_a_axi3_conv";
end \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv__parameterized0\;

architecture STRUCTURE of \bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv__parameterized0\ is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \M_AXI_AADDR_I1__0\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[0]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[10]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[11]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[12]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[13]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[14]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[15]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[16]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[17]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[18]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[19]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[1]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[20]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[21]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[22]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[23]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[24]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[25]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[26]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[27]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[28]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[29]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[2]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[30]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[31]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[3]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[4]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[5]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[6]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[7]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[8]\ : STD_LOGIC;
  signal \S_AXI_AADDR_Q_reg_n_0_[9]\ : STD_LOGIC;
  signal \^s_axi_aid_q_reg[0]_0\ : STD_LOGIC;
  signal S_AXI_ALEN_Q : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \S_AXI_ALOCK_Q_reg_n_0_[0]\ : STD_LOGIC;
  signal \USE_READ.USE_SPLIT_R.rd_cmd_ready\ : STD_LOGIC;
  signal \USE_R_CHANNEL.cmd_queue_n_10\ : STD_LOGIC;
  signal \USE_R_CHANNEL.cmd_queue_n_16\ : STD_LOGIC;
  signal \USE_R_CHANNEL.cmd_queue_n_17\ : STD_LOGIC;
  signal \USE_R_CHANNEL.cmd_queue_n_18\ : STD_LOGIC;
  signal \USE_R_CHANNEL.cmd_queue_n_19\ : STD_LOGIC;
  signal \USE_R_CHANNEL.cmd_queue_n_2\ : STD_LOGIC;
  signal \USE_R_CHANNEL.cmd_queue_n_5\ : STD_LOGIC;
  signal \USE_R_CHANNEL.cmd_queue_n_6\ : STD_LOGIC;
  signal \USE_R_CHANNEL.cmd_queue_n_7\ : STD_LOGIC;
  signal \USE_R_CHANNEL.cmd_queue_n_8\ : STD_LOGIC;
  signal \USE_R_CHANNEL.cmd_queue_n_9\ : STD_LOGIC;
  signal access_is_incr : STD_LOGIC;
  signal access_is_incr_q : STD_LOGIC;
  signal \addr_step_q[10]_i_1__0_n_0\ : STD_LOGIC;
  signal \addr_step_q[11]_i_1__0_n_0\ : STD_LOGIC;
  signal \addr_step_q[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \addr_step_q[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \addr_step_q[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \addr_step_q[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \addr_step_q[9]_i_1__0_n_0\ : STD_LOGIC;
  signal \addr_step_q_reg_n_0_[10]\ : STD_LOGIC;
  signal \addr_step_q_reg_n_0_[11]\ : STD_LOGIC;
  signal \addr_step_q_reg_n_0_[5]\ : STD_LOGIC;
  signal \addr_step_q_reg_n_0_[6]\ : STD_LOGIC;
  signal \addr_step_q_reg_n_0_[7]\ : STD_LOGIC;
  signal \addr_step_q_reg_n_0_[8]\ : STD_LOGIC;
  signal \addr_step_q_reg_n_0_[9]\ : STD_LOGIC;
  signal almost_empty : STD_LOGIC;
  signal \cmd_depth[0]_i_1__0_n_0\ : STD_LOGIC;
  signal cmd_depth_reg : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal cmd_empty : STD_LOGIC;
  signal cmd_empty_i_1_n_0 : STD_LOGIC;
  signal \cmd_id_check__2\ : STD_LOGIC;
  signal cmd_push_block : STD_LOGIC;
  signal cmd_split_i : STD_LOGIC;
  signal command_ongoing : STD_LOGIC;
  signal \first_split__2\ : STD_LOGIC;
  signal first_step : STD_LOGIC_VECTOR ( 11 downto 4 );
  signal \first_step_q[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \first_step_q[10]_i_2__0_n_0\ : STD_LOGIC;
  signal \first_step_q[11]_i_2__0_n_0\ : STD_LOGIC;
  signal \first_step_q[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \first_step_q[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \first_step_q[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \first_step_q[6]_i_2__0_n_0\ : STD_LOGIC;
  signal \first_step_q[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \first_step_q[8]_i_2__0_n_0\ : STD_LOGIC;
  signal \first_step_q[9]_i_2__0_n_0\ : STD_LOGIC;
  signal \first_step_q_reg_n_0_[0]\ : STD_LOGIC;
  signal \first_step_q_reg_n_0_[10]\ : STD_LOGIC;
  signal \first_step_q_reg_n_0_[11]\ : STD_LOGIC;
  signal \first_step_q_reg_n_0_[1]\ : STD_LOGIC;
  signal \first_step_q_reg_n_0_[2]\ : STD_LOGIC;
  signal \first_step_q_reg_n_0_[3]\ : STD_LOGIC;
  signal \first_step_q_reg_n_0_[4]\ : STD_LOGIC;
  signal \first_step_q_reg_n_0_[5]\ : STD_LOGIC;
  signal \first_step_q_reg_n_0_[6]\ : STD_LOGIC;
  signal \first_step_q_reg_n_0_[7]\ : STD_LOGIC;
  signal \first_step_q_reg_n_0_[8]\ : STD_LOGIC;
  signal \first_step_q_reg_n_0_[9]\ : STD_LOGIC;
  signal \incr_need_to_split__0\ : STD_LOGIC;
  signal \^m_axi_araddr\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal multiple_id_non_split : STD_LOGIC;
  signal multiple_id_non_split0 : STD_LOGIC;
  signal multiple_id_non_split_i_1_n_0 : STD_LOGIC;
  signal need_to_split_q : STD_LOGIC;
  signal next_mi_addr : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \next_mi_addr[11]_i_2_n_0\ : STD_LOGIC;
  signal \next_mi_addr[11]_i_3_n_0\ : STD_LOGIC;
  signal \next_mi_addr[11]_i_4_n_0\ : STD_LOGIC;
  signal \next_mi_addr[11]_i_5_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_2__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_3__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_4__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_5__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_6__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_7__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_8__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[15]_i_9__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[19]_i_2__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[19]_i_3__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[19]_i_4__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[19]_i_5__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[23]_i_2__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[23]_i_3__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[23]_i_4__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[23]_i_5__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[27]_i_2__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[27]_i_3__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[27]_i_4__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[27]_i_5__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[31]_i_2__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[31]_i_3__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[31]_i_4__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[31]_i_5__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr[3]_i_2_n_0\ : STD_LOGIC;
  signal \next_mi_addr[3]_i_3_n_0\ : STD_LOGIC;
  signal \next_mi_addr[3]_i_4_n_0\ : STD_LOGIC;
  signal \next_mi_addr[3]_i_5_n_0\ : STD_LOGIC;
  signal \next_mi_addr[7]_i_2_n_0\ : STD_LOGIC;
  signal \next_mi_addr[7]_i_3_n_0\ : STD_LOGIC;
  signal \next_mi_addr[7]_i_4_n_0\ : STD_LOGIC;
  signal \next_mi_addr[7]_i_5_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[11]_i_1__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[11]_i_1__0_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[11]_i_1__0_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[11]_i_1__0_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[11]_i_1__0_n_4\ : STD_LOGIC;
  signal \next_mi_addr_reg[11]_i_1__0_n_5\ : STD_LOGIC;
  signal \next_mi_addr_reg[11]_i_1__0_n_6\ : STD_LOGIC;
  signal \next_mi_addr_reg[11]_i_1__0_n_7\ : STD_LOGIC;
  signal \next_mi_addr_reg[15]_i_1__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[15]_i_1__0_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[15]_i_1__0_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[15]_i_1__0_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[15]_i_1__0_n_4\ : STD_LOGIC;
  signal \next_mi_addr_reg[15]_i_1__0_n_5\ : STD_LOGIC;
  signal \next_mi_addr_reg[15]_i_1__0_n_6\ : STD_LOGIC;
  signal \next_mi_addr_reg[15]_i_1__0_n_7\ : STD_LOGIC;
  signal \next_mi_addr_reg[19]_i_1__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[19]_i_1__0_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[19]_i_1__0_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[19]_i_1__0_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[19]_i_1__0_n_4\ : STD_LOGIC;
  signal \next_mi_addr_reg[19]_i_1__0_n_5\ : STD_LOGIC;
  signal \next_mi_addr_reg[19]_i_1__0_n_6\ : STD_LOGIC;
  signal \next_mi_addr_reg[19]_i_1__0_n_7\ : STD_LOGIC;
  signal \next_mi_addr_reg[23]_i_1__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[23]_i_1__0_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[23]_i_1__0_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[23]_i_1__0_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[23]_i_1__0_n_4\ : STD_LOGIC;
  signal \next_mi_addr_reg[23]_i_1__0_n_5\ : STD_LOGIC;
  signal \next_mi_addr_reg[23]_i_1__0_n_6\ : STD_LOGIC;
  signal \next_mi_addr_reg[23]_i_1__0_n_7\ : STD_LOGIC;
  signal \next_mi_addr_reg[27]_i_1__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[27]_i_1__0_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[27]_i_1__0_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[27]_i_1__0_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[27]_i_1__0_n_4\ : STD_LOGIC;
  signal \next_mi_addr_reg[27]_i_1__0_n_5\ : STD_LOGIC;
  signal \next_mi_addr_reg[27]_i_1__0_n_6\ : STD_LOGIC;
  signal \next_mi_addr_reg[27]_i_1__0_n_7\ : STD_LOGIC;
  signal \next_mi_addr_reg[31]_i_1__0_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[31]_i_1__0_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[31]_i_1__0_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[31]_i_1__0_n_4\ : STD_LOGIC;
  signal \next_mi_addr_reg[31]_i_1__0_n_5\ : STD_LOGIC;
  signal \next_mi_addr_reg[31]_i_1__0_n_6\ : STD_LOGIC;
  signal \next_mi_addr_reg[31]_i_1__0_n_7\ : STD_LOGIC;
  signal \next_mi_addr_reg[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[3]_i_1__0_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[3]_i_1__0_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[3]_i_1__0_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[3]_i_1__0_n_4\ : STD_LOGIC;
  signal \next_mi_addr_reg[3]_i_1__0_n_5\ : STD_LOGIC;
  signal \next_mi_addr_reg[3]_i_1__0_n_6\ : STD_LOGIC;
  signal \next_mi_addr_reg[3]_i_1__0_n_7\ : STD_LOGIC;
  signal \next_mi_addr_reg[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \next_mi_addr_reg[7]_i_1__0_n_1\ : STD_LOGIC;
  signal \next_mi_addr_reg[7]_i_1__0_n_2\ : STD_LOGIC;
  signal \next_mi_addr_reg[7]_i_1__0_n_3\ : STD_LOGIC;
  signal \next_mi_addr_reg[7]_i_1__0_n_4\ : STD_LOGIC;
  signal \next_mi_addr_reg[7]_i_1__0_n_5\ : STD_LOGIC;
  signal \next_mi_addr_reg[7]_i_1__0_n_6\ : STD_LOGIC;
  signal \next_mi_addr_reg[7]_i_1__0_n_7\ : STD_LOGIC;
  signal \num_transactions_q_reg_n_0_[0]\ : STD_LOGIC;
  signal \num_transactions_q_reg_n_0_[1]\ : STD_LOGIC;
  signal \num_transactions_q_reg_n_0_[2]\ : STD_LOGIC;
  signal \num_transactions_q_reg_n_0_[3]\ : STD_LOGIC;
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \pushed_commands[3]_i_1__0_n_0\ : STD_LOGIC;
  signal pushed_commands_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal pushed_new_cmd : STD_LOGIC;
  signal \queue_id_reg_n_0_[0]\ : STD_LOGIC;
  signal size_mask_q : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \size_mask_q[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \size_mask_q[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \size_mask_q[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \size_mask_q[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \size_mask_q[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \size_mask_q[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \size_mask_q[6]_i_1__0_n_0\ : STD_LOGIC;
  signal split_in_progress : STD_LOGIC;
  signal split_in_progress_i_1_n_0 : STD_LOGIC;
  signal split_in_progress_reg_n_0 : STD_LOGIC;
  signal split_ongoing : STD_LOGIC;
  signal \NLW_next_mi_addr_reg[31]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \addr_step_q[10]_i_1__0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \addr_step_q[11]_i_1__0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \addr_step_q[5]_i_1__0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \addr_step_q[6]_i_1__0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \addr_step_q[7]_i_1__0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \addr_step_q[8]_i_1__0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \addr_step_q[9]_i_1__0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \first_step_q[0]_i_1__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \first_step_q[10]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \first_step_q[11]_i_1__0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \first_step_q[1]_i_1__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \first_step_q[3]_i_1__0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \first_step_q[4]_i_1__0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \first_step_q[6]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \first_step_q[7]_i_1__0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \first_step_q[8]_i_1__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \first_step_q[9]_i_1__0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \m_axi_araddr[12]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \next_mi_addr[11]_i_6__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \next_mi_addr[3]_i_6__0\ : label is "soft_lutpair13";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[11]_i_1__0\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[15]_i_1__0\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[19]_i_1__0\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[23]_i_1__0\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[27]_i_1__0\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[31]_i_1__0\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[3]_i_1__0\ : label is 35;
  attribute ADDER_THRESHOLD of \next_mi_addr_reg[7]_i_1__0\ : label is 35;
  attribute SOFT_HLUTNM of \pushed_commands[1]_i_1__0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \pushed_commands[2]_i_1__0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \pushed_commands[3]_i_2__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \size_mask_q[0]_i_1__0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \size_mask_q[1]_i_1__0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \size_mask_q[2]_i_1__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \size_mask_q[3]_i_1__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \size_mask_q[4]_i_1__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \size_mask_q[5]_i_1__0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \size_mask_q[6]_i_1__0\ : label is "soft_lutpair19";
begin
  E(0) <= \^e\(0);
  \S_AXI_AID_Q_reg[0]_0\ <= \^s_axi_aid_q_reg[0]_0\;
  m_axi_araddr(31 downto 0) <= \^m_axi_araddr\(31 downto 0);
\S_AXI_AADDR_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(0),
      Q => \S_AXI_AADDR_Q_reg_n_0_[0]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(10),
      Q => \S_AXI_AADDR_Q_reg_n_0_[10]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(11),
      Q => \S_AXI_AADDR_Q_reg_n_0_[11]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(12),
      Q => \S_AXI_AADDR_Q_reg_n_0_[12]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(13),
      Q => \S_AXI_AADDR_Q_reg_n_0_[13]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(14),
      Q => \S_AXI_AADDR_Q_reg_n_0_[14]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(15),
      Q => \S_AXI_AADDR_Q_reg_n_0_[15]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(16),
      Q => \S_AXI_AADDR_Q_reg_n_0_[16]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(17),
      Q => \S_AXI_AADDR_Q_reg_n_0_[17]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(18),
      Q => \S_AXI_AADDR_Q_reg_n_0_[18]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(19),
      Q => \S_AXI_AADDR_Q_reg_n_0_[19]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(1),
      Q => \S_AXI_AADDR_Q_reg_n_0_[1]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(20),
      Q => \S_AXI_AADDR_Q_reg_n_0_[20]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(21),
      Q => \S_AXI_AADDR_Q_reg_n_0_[21]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(22),
      Q => \S_AXI_AADDR_Q_reg_n_0_[22]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(23),
      Q => \S_AXI_AADDR_Q_reg_n_0_[23]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(24),
      Q => \S_AXI_AADDR_Q_reg_n_0_[24]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(25),
      Q => \S_AXI_AADDR_Q_reg_n_0_[25]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(26),
      Q => \S_AXI_AADDR_Q_reg_n_0_[26]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(27),
      Q => \S_AXI_AADDR_Q_reg_n_0_[27]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(28),
      Q => \S_AXI_AADDR_Q_reg_n_0_[28]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(29),
      Q => \S_AXI_AADDR_Q_reg_n_0_[29]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(2),
      Q => \S_AXI_AADDR_Q_reg_n_0_[2]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(30),
      Q => \S_AXI_AADDR_Q_reg_n_0_[30]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(31),
      Q => \S_AXI_AADDR_Q_reg_n_0_[31]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(3),
      Q => \S_AXI_AADDR_Q_reg_n_0_[3]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(4),
      Q => \S_AXI_AADDR_Q_reg_n_0_[4]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(5),
      Q => \S_AXI_AADDR_Q_reg_n_0_[5]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(6),
      Q => \S_AXI_AADDR_Q_reg_n_0_[6]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(7),
      Q => \S_AXI_AADDR_Q_reg_n_0_[7]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(8),
      Q => \S_AXI_AADDR_Q_reg_n_0_[8]\,
      R => SR(0)
    );
\S_AXI_AADDR_Q_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_araddr(9),
      Q => \S_AXI_AADDR_Q_reg_n_0_[9]\,
      R => SR(0)
    );
\S_AXI_ABURST_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arburst(0),
      Q => m_axi_arburst(0),
      R => SR(0)
    );
\S_AXI_ABURST_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arburst(1),
      Q => m_axi_arburst(1),
      R => SR(0)
    );
\S_AXI_ACACHE_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arcache(0),
      Q => m_axi_arcache(0),
      R => SR(0)
    );
\S_AXI_ACACHE_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arcache(1),
      Q => m_axi_arcache(1),
      R => SR(0)
    );
\S_AXI_ACACHE_Q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arcache(2),
      Q => m_axi_arcache(2),
      R => SR(0)
    );
\S_AXI_ACACHE_Q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arcache(3),
      Q => m_axi_arcache(3),
      R => SR(0)
    );
\S_AXI_AID_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arid(0),
      Q => \^s_axi_aid_q_reg[0]_0\,
      R => SR(0)
    );
\S_AXI_ALEN_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arlen(0),
      Q => S_AXI_ALEN_Q(0),
      R => SR(0)
    );
\S_AXI_ALEN_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arlen(1),
      Q => S_AXI_ALEN_Q(1),
      R => SR(0)
    );
\S_AXI_ALEN_Q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arlen(2),
      Q => S_AXI_ALEN_Q(2),
      R => SR(0)
    );
\S_AXI_ALEN_Q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arlen(3),
      Q => S_AXI_ALEN_Q(3),
      R => SR(0)
    );
\S_AXI_ALOCK_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arlock(0),
      Q => \S_AXI_ALOCK_Q_reg_n_0_[0]\,
      R => SR(0)
    );
\S_AXI_APROT_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arprot(0),
      Q => m_axi_arprot(0),
      R => SR(0)
    );
\S_AXI_APROT_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arprot(1),
      Q => m_axi_arprot(1),
      R => SR(0)
    );
\S_AXI_APROT_Q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arprot(2),
      Q => m_axi_arprot(2),
      R => SR(0)
    );
\S_AXI_AQOS_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arqos(0),
      Q => m_axi_arqos(0),
      R => SR(0)
    );
\S_AXI_AQOS_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arqos(1),
      Q => m_axi_arqos(1),
      R => SR(0)
    );
\S_AXI_AQOS_Q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arqos(2),
      Q => m_axi_arqos(2),
      R => SR(0)
    );
\S_AXI_AQOS_Q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arqos(3),
      Q => m_axi_arqos(3),
      R => SR(0)
    );
S_AXI_AREADY_I_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \USE_R_CHANNEL.cmd_queue_n_16\,
      Q => \^e\(0),
      R => SR(0)
    );
\S_AXI_ASIZE_Q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arsize(0),
      Q => m_axi_arsize(0),
      R => SR(0)
    );
\S_AXI_ASIZE_Q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arsize(1),
      Q => m_axi_arsize(1),
      R => SR(0)
    );
\S_AXI_ASIZE_Q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arsize(2),
      Q => m_axi_arsize(2),
      R => SR(0)
    );
\USE_R_CHANNEL.cmd_queue\: entity work.\bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_data_fifo_v2_1_32_axic_fifo__parameterized0\
     port map (
      D(4) => \USE_R_CHANNEL.cmd_queue_n_6\,
      D(3) => \USE_R_CHANNEL.cmd_queue_n_7\,
      D(2) => \USE_R_CHANNEL.cmd_queue_n_8\,
      D(1) => \USE_R_CHANNEL.cmd_queue_n_9\,
      D(0) => \USE_R_CHANNEL.cmd_queue_n_10\,
      E(0) => pushed_new_cmd,
      Q(5 downto 0) => cmd_depth_reg(5 downto 0),
      SR(0) => SR(0),
      \USE_READ.USE_SPLIT_R.rd_cmd_ready\ => \USE_READ.USE_SPLIT_R.rd_cmd_ready\,
      access_is_incr_q => access_is_incr_q,
      aclk => aclk,
      almost_empty => almost_empty,
      areset_d(1 downto 0) => areset_d(1 downto 0),
      aresetn => aresetn,
      cmd_empty => cmd_empty,
      cmd_push_block => cmd_push_block,
      cmd_push_block_reg => \USE_R_CHANNEL.cmd_queue_n_5\,
      cmd_push_block_reg_0 => split_in_progress_reg_n_0,
      command_ongoing => command_ongoing,
      command_ongoing_reg => \^e\(0),
      command_ongoing_reg_0 => command_ongoing_reg_0,
      din(0) => cmd_split_i,
      empty_fwft_i_reg(0) => \USE_R_CHANNEL.cmd_queue_n_19\,
      m_axi_arready => m_axi_arready,
      m_axi_arvalid => m_axi_arvalid,
      m_axi_rlast => m_axi_rlast,
      m_axi_rready => m_axi_rready,
      m_axi_rvalid => m_axi_rvalid,
      multiple_id_non_split => multiple_id_non_split,
      multiple_id_non_split0 => multiple_id_non_split0,
      need_to_split_q => need_to_split_q,
      \queue_id_reg[0]\ => \USE_R_CHANNEL.cmd_queue_n_17\,
      \queue_id_reg[0]_0\ => \^s_axi_aid_q_reg[0]_0\,
      \queue_id_reg[0]_1\ => \queue_id_reg_n_0_[0]\,
      ram_full_i_reg => \USE_R_CHANNEL.cmd_queue_n_2\,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_arvalid_0 => \USE_R_CHANNEL.cmd_queue_n_16\,
      s_axi_arvalid_1 => \USE_R_CHANNEL.cmd_queue_n_18\,
      s_axi_rlast => s_axi_rlast,
      s_axi_rready => s_axi_rready,
      s_axi_rvalid => s_axi_rvalid,
      split_in_progress => split_in_progress,
      split_ongoing_reg(3) => \num_transactions_q_reg_n_0_[3]\,
      split_ongoing_reg(2) => \num_transactions_q_reg_n_0_[2]\,
      split_ongoing_reg(1) => \num_transactions_q_reg_n_0_[1]\,
      split_ongoing_reg(0) => \num_transactions_q_reg_n_0_[0]\,
      split_ongoing_reg_0(3 downto 0) => pushed_commands_reg(3 downto 0)
    );
\access_is_incr_q_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_axi_arburst(0),
      I1 => s_axi_arburst(1),
      O => access_is_incr
    );
access_is_incr_q_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => access_is_incr,
      Q => access_is_incr_q,
      R => SR(0)
    );
\addr_step_q[10]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_axi_arsize(0),
      I1 => s_axi_arsize(2),
      I2 => s_axi_arsize(1),
      O => \addr_step_q[10]_i_1__0_n_0\
    );
\addr_step_q[11]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => s_axi_arsize(2),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arsize(1),
      O => \addr_step_q[11]_i_1__0_n_0\
    );
\addr_step_q[5]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => s_axi_arsize(0),
      I1 => s_axi_arsize(2),
      I2 => s_axi_arsize(1),
      O => \addr_step_q[5]_i_1__0_n_0\
    );
\addr_step_q[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arsize(2),
      O => \addr_step_q[6]_i_1__0_n_0\
    );
\addr_step_q[7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arsize(2),
      O => \addr_step_q[7]_i_1__0_n_0\
    );
\addr_step_q[8]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => s_axi_arsize(2),
      I1 => s_axi_arsize(1),
      I2 => s_axi_arsize(0),
      O => \addr_step_q[8]_i_1__0_n_0\
    );
\addr_step_q[9]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => s_axi_arsize(0),
      I1 => s_axi_arsize(2),
      I2 => s_axi_arsize(1),
      O => \addr_step_q[9]_i_1__0_n_0\
    );
\addr_step_q_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \addr_step_q[10]_i_1__0_n_0\,
      Q => \addr_step_q_reg_n_0_[10]\,
      R => SR(0)
    );
\addr_step_q_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \addr_step_q[11]_i_1__0_n_0\,
      Q => \addr_step_q_reg_n_0_[11]\,
      R => SR(0)
    );
\addr_step_q_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \addr_step_q[5]_i_1__0_n_0\,
      Q => \addr_step_q_reg_n_0_[5]\,
      R => SR(0)
    );
\addr_step_q_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \addr_step_q[6]_i_1__0_n_0\,
      Q => \addr_step_q_reg_n_0_[6]\,
      R => SR(0)
    );
\addr_step_q_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \addr_step_q[7]_i_1__0_n_0\,
      Q => \addr_step_q_reg_n_0_[7]\,
      R => SR(0)
    );
\addr_step_q_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \addr_step_q[8]_i_1__0_n_0\,
      Q => \addr_step_q_reg_n_0_[8]\,
      R => SR(0)
    );
\addr_step_q_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \addr_step_q[9]_i_1__0_n_0\,
      Q => \addr_step_q_reg_n_0_[9]\,
      R => SR(0)
    );
\cmd_depth[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cmd_depth_reg(0),
      O => \cmd_depth[0]_i_1__0_n_0\
    );
\cmd_depth_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \USE_R_CHANNEL.cmd_queue_n_19\,
      D => \cmd_depth[0]_i_1__0_n_0\,
      Q => cmd_depth_reg(0),
      R => SR(0)
    );
\cmd_depth_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \USE_R_CHANNEL.cmd_queue_n_19\,
      D => \USE_R_CHANNEL.cmd_queue_n_10\,
      Q => cmd_depth_reg(1),
      R => SR(0)
    );
\cmd_depth_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \USE_R_CHANNEL.cmd_queue_n_19\,
      D => \USE_R_CHANNEL.cmd_queue_n_9\,
      Q => cmd_depth_reg(2),
      R => SR(0)
    );
\cmd_depth_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \USE_R_CHANNEL.cmd_queue_n_19\,
      D => \USE_R_CHANNEL.cmd_queue_n_8\,
      Q => cmd_depth_reg(3),
      R => SR(0)
    );
\cmd_depth_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \USE_R_CHANNEL.cmd_queue_n_19\,
      D => \USE_R_CHANNEL.cmd_queue_n_7\,
      Q => cmd_depth_reg(4),
      R => SR(0)
    );
\cmd_depth_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \USE_R_CHANNEL.cmd_queue_n_19\,
      D => \USE_R_CHANNEL.cmd_queue_n_6\,
      Q => cmd_depth_reg(5),
      R => SR(0)
    );
cmd_empty_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => almost_empty,
      I1 => \USE_READ.USE_SPLIT_R.rd_cmd_ready\,
      I2 => \USE_R_CHANNEL.cmd_queue_n_5\,
      I3 => cmd_empty,
      O => cmd_empty_i_1_n_0
    );
\cmd_empty_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => cmd_depth_reg(2),
      I1 => cmd_depth_reg(3),
      I2 => cmd_depth_reg(0),
      I3 => cmd_depth_reg(1),
      I4 => cmd_depth_reg(5),
      I5 => cmd_depth_reg(4),
      O => almost_empty
    );
cmd_empty_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => '1',
      D => cmd_empty_i_1_n_0,
      Q => cmd_empty,
      S => SR(0)
    );
cmd_push_block_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \USE_R_CHANNEL.cmd_queue_n_2\,
      Q => cmd_push_block,
      R => '0'
    );
command_ongoing_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \USE_R_CHANNEL.cmd_queue_n_18\,
      Q => command_ongoing,
      R => SR(0)
    );
\first_step_q[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arlen(0),
      I3 => s_axi_arsize(2),
      O => \first_step_q[0]_i_1__0_n_0\
    );
\first_step_q[10]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_arsize(2),
      I1 => \first_step_q[10]_i_2__0_n_0\,
      O => first_step(10)
    );
\first_step_q[10]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAA800080000000"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arlen(2),
      I2 => s_axi_arlen(0),
      I3 => s_axi_arlen(1),
      I4 => s_axi_arlen(3),
      I5 => s_axi_arsize(0),
      O => \first_step_q[10]_i_2__0_n_0\
    );
\first_step_q[11]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_arsize(2),
      I1 => \first_step_q[11]_i_2__0_n_0\,
      O => first_step(11)
    );
\first_step_q[11]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arlen(3),
      I2 => s_axi_arlen(1),
      I3 => s_axi_arlen(0),
      I4 => s_axi_arlen(2),
      I5 => s_axi_arsize(0),
      O => \first_step_q[11]_i_2__0_n_0\
    );
\first_step_q[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000514"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arlen(0),
      I3 => s_axi_arlen(1),
      I4 => s_axi_arsize(2),
      O => \first_step_q[1]_i_1__0_n_0\
    );
\first_step_q[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000F3C6A"
    )
        port map (
      I0 => s_axi_arlen(2),
      I1 => s_axi_arlen(1),
      I2 => s_axi_arlen(0),
      I3 => s_axi_arsize(0),
      I4 => s_axi_arsize(1),
      I5 => s_axi_arsize(2),
      O => \first_step_q[2]_i_1__0_n_0\
    );
\first_step_q[3]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \first_step_q[7]_i_2__0_n_0\,
      I1 => s_axi_arsize(2),
      O => \first_step_q[3]_i_1__0_n_0\
    );
\first_step_q[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01FF0100"
    )
        port map (
      I0 => s_axi_arlen(0),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arsize(1),
      I3 => s_axi_arsize(2),
      I4 => \first_step_q[8]_i_2__0_n_0\,
      O => first_step(4)
    );
\first_step_q[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0036FFFF00360000"
    )
        port map (
      I0 => s_axi_arlen(1),
      I1 => s_axi_arlen(0),
      I2 => s_axi_arsize(0),
      I3 => s_axi_arsize(1),
      I4 => s_axi_arsize(2),
      I5 => \first_step_q[9]_i_2__0_n_0\,
      O => first_step(5)
    );
\first_step_q[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \first_step_q[6]_i_2__0_n_0\,
      I1 => s_axi_arsize(2),
      I2 => \first_step_q[10]_i_2__0_n_0\,
      O => first_step(6)
    );
\first_step_q[6]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"07531642"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arlen(0),
      I3 => s_axi_arlen(1),
      I4 => s_axi_arlen(2),
      O => \first_step_q[6]_i_2__0_n_0\
    );
\first_step_q[7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \first_step_q[7]_i_2__0_n_0\,
      I1 => s_axi_arsize(2),
      I2 => \first_step_q[11]_i_2__0_n_0\,
      O => first_step(7)
    );
\first_step_q[7]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"07FD53B916EC42A8"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arlen(1),
      I3 => s_axi_arlen(0),
      I4 => s_axi_arlen(2),
      I5 => s_axi_arlen(3),
      O => \first_step_q[7]_i_2__0_n_0\
    );
\first_step_q[8]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_arsize(2),
      I1 => \first_step_q[8]_i_2__0_n_0\,
      O => first_step(8)
    );
\first_step_q[8]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"14EAEA6262C8C840"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arlen(3),
      I3 => s_axi_arlen(1),
      I4 => s_axi_arlen(0),
      I5 => s_axi_arlen(2),
      O => \first_step_q[8]_i_2__0_n_0\
    );
\first_step_q[9]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_arsize(2),
      I1 => \first_step_q[9]_i_2__0_n_0\,
      O => first_step(9)
    );
\first_step_q[9]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4AA2A2A228808080"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arlen(2),
      I3 => s_axi_arlen(0),
      I4 => s_axi_arlen(1),
      I5 => s_axi_arlen(3),
      O => \first_step_q[9]_i_2__0_n_0\
    );
\first_step_q_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \first_step_q[0]_i_1__0_n_0\,
      Q => \first_step_q_reg_n_0_[0]\,
      R => SR(0)
    );
\first_step_q_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(10),
      Q => \first_step_q_reg_n_0_[10]\,
      R => SR(0)
    );
\first_step_q_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(11),
      Q => \first_step_q_reg_n_0_[11]\,
      R => SR(0)
    );
\first_step_q_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \first_step_q[1]_i_1__0_n_0\,
      Q => \first_step_q_reg_n_0_[1]\,
      R => SR(0)
    );
\first_step_q_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \first_step_q[2]_i_1__0_n_0\,
      Q => \first_step_q_reg_n_0_[2]\,
      R => SR(0)
    );
\first_step_q_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \first_step_q[3]_i_1__0_n_0\,
      Q => \first_step_q_reg_n_0_[3]\,
      R => SR(0)
    );
\first_step_q_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(4),
      Q => \first_step_q_reg_n_0_[4]\,
      R => SR(0)
    );
\first_step_q_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(5),
      Q => \first_step_q_reg_n_0_[5]\,
      R => SR(0)
    );
\first_step_q_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(6),
      Q => \first_step_q_reg_n_0_[6]\,
      R => SR(0)
    );
\first_step_q_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(7),
      Q => \first_step_q_reg_n_0_[7]\,
      R => SR(0)
    );
\first_step_q_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(8),
      Q => \first_step_q_reg_n_0_[8]\,
      R => SR(0)
    );
\first_step_q_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => first_step(9),
      Q => \first_step_q_reg_n_0_[9]\,
      R => SR(0)
    );
incr_need_to_split: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444444444440"
    )
        port map (
      I0 => s_axi_arburst(1),
      I1 => s_axi_arburst(0),
      I2 => s_axi_arlen(5),
      I3 => s_axi_arlen(4),
      I4 => s_axi_arlen(6),
      I5 => s_axi_arlen(7),
      O => \incr_need_to_split__0\
    );
incr_need_to_split_q_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \incr_need_to_split__0\,
      Q => need_to_split_q,
      R => SR(0)
    );
\m_axi_araddr[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(0),
      I1 => size_mask_q(0),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => \S_AXI_AADDR_Q_reg_n_0_[0]\,
      O => \^m_axi_araddr\(0)
    );
\m_axi_araddr[10]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[10]\,
      I1 => next_mi_addr(10),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(10)
    );
\m_axi_araddr[11]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[11]\,
      I1 => next_mi_addr(11),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(11)
    );
\m_axi_araddr[12]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[12]\,
      I1 => next_mi_addr(12),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(12)
    );
\m_axi_araddr[13]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[13]\,
      I1 => next_mi_addr(13),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(13)
    );
\m_axi_araddr[14]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[14]\,
      I1 => next_mi_addr(14),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(14)
    );
\m_axi_araddr[15]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[15]\,
      I1 => next_mi_addr(15),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(15)
    );
\m_axi_araddr[16]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[16]\,
      I1 => next_mi_addr(16),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(16)
    );
\m_axi_araddr[17]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[17]\,
      I1 => next_mi_addr(17),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(17)
    );
\m_axi_araddr[18]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[18]\,
      I1 => next_mi_addr(18),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(18)
    );
\m_axi_araddr[19]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[19]\,
      I1 => next_mi_addr(19),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(19)
    );
\m_axi_araddr[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(1),
      I1 => size_mask_q(1),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => \S_AXI_AADDR_Q_reg_n_0_[1]\,
      O => \^m_axi_araddr\(1)
    );
\m_axi_araddr[20]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[20]\,
      I1 => next_mi_addr(20),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(20)
    );
\m_axi_araddr[21]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[21]\,
      I1 => next_mi_addr(21),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(21)
    );
\m_axi_araddr[22]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[22]\,
      I1 => next_mi_addr(22),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(22)
    );
\m_axi_araddr[23]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[23]\,
      I1 => next_mi_addr(23),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(23)
    );
\m_axi_araddr[24]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[24]\,
      I1 => next_mi_addr(24),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(24)
    );
\m_axi_araddr[25]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[25]\,
      I1 => next_mi_addr(25),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(25)
    );
\m_axi_araddr[26]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[26]\,
      I1 => next_mi_addr(26),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(26)
    );
\m_axi_araddr[27]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[27]\,
      I1 => next_mi_addr(27),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(27)
    );
\m_axi_araddr[28]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[28]\,
      I1 => next_mi_addr(28),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(28)
    );
\m_axi_araddr[29]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[29]\,
      I1 => next_mi_addr(29),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(29)
    );
\m_axi_araddr[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(2),
      I1 => size_mask_q(2),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => \S_AXI_AADDR_Q_reg_n_0_[2]\,
      O => \^m_axi_araddr\(2)
    );
\m_axi_araddr[30]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[30]\,
      I1 => next_mi_addr(30),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(30)
    );
\m_axi_araddr[31]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[31]\,
      I1 => next_mi_addr(31),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(31)
    );
\m_axi_araddr[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(3),
      I1 => size_mask_q(3),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => \S_AXI_AADDR_Q_reg_n_0_[3]\,
      O => \^m_axi_araddr\(3)
    );
\m_axi_araddr[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(4),
      I1 => size_mask_q(4),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => \S_AXI_AADDR_Q_reg_n_0_[4]\,
      O => \^m_axi_araddr\(4)
    );
\m_axi_araddr[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(5),
      I1 => size_mask_q(5),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => \S_AXI_AADDR_Q_reg_n_0_[5]\,
      O => \^m_axi_araddr\(5)
    );
\m_axi_araddr[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8FFF8000"
    )
        port map (
      I0 => next_mi_addr(6),
      I1 => size_mask_q(6),
      I2 => split_ongoing,
      I3 => access_is_incr_q,
      I4 => \S_AXI_AADDR_Q_reg_n_0_[6]\,
      O => \^m_axi_araddr\(6)
    );
\m_axi_araddr[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[7]\,
      I1 => next_mi_addr(7),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(7)
    );
\m_axi_araddr[8]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[8]\,
      I1 => next_mi_addr(8),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(8)
    );
\m_axi_araddr[9]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[9]\,
      I1 => next_mi_addr(9),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \^m_axi_araddr\(9)
    );
\m_axi_arlen[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFE0000"
    )
        port map (
      I0 => pushed_commands_reg(1),
      I1 => pushed_commands_reg(0),
      I2 => pushed_commands_reg(3),
      I3 => pushed_commands_reg(2),
      I4 => need_to_split_q,
      I5 => S_AXI_ALEN_Q(0),
      O => m_axi_arlen(0)
    );
\m_axi_arlen[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFE0000"
    )
        port map (
      I0 => pushed_commands_reg(1),
      I1 => pushed_commands_reg(0),
      I2 => pushed_commands_reg(3),
      I3 => pushed_commands_reg(2),
      I4 => need_to_split_q,
      I5 => S_AXI_ALEN_Q(1),
      O => m_axi_arlen(1)
    );
\m_axi_arlen[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFE0000"
    )
        port map (
      I0 => pushed_commands_reg(1),
      I1 => pushed_commands_reg(0),
      I2 => pushed_commands_reg(3),
      I3 => pushed_commands_reg(2),
      I4 => need_to_split_q,
      I5 => S_AXI_ALEN_Q(2),
      O => m_axi_arlen(2)
    );
\m_axi_arlen[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFE0000"
    )
        port map (
      I0 => pushed_commands_reg(1),
      I1 => pushed_commands_reg(0),
      I2 => pushed_commands_reg(3),
      I3 => pushed_commands_reg(2),
      I4 => need_to_split_q,
      I5 => S_AXI_ALEN_Q(3),
      O => m_axi_arlen(3)
    );
\m_axi_arlock[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \S_AXI_ALOCK_Q_reg_n_0_[0]\,
      I1 => need_to_split_q,
      O => m_axi_arlock(0)
    );
multiple_id_non_split_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000EEE00000000"
    )
        port map (
      I0 => multiple_id_non_split,
      I1 => multiple_id_non_split0,
      I2 => almost_empty,
      I3 => \USE_READ.USE_SPLIT_R.rd_cmd_ready\,
      I4 => cmd_empty,
      I5 => aresetn,
      O => multiple_id_non_split_i_1_n_0
    );
multiple_id_non_split_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => multiple_id_non_split_i_1_n_0,
      Q => multiple_id_non_split,
      R => '0'
    );
\next_mi_addr[11]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_araddr\(11),
      I1 => \addr_step_q_reg_n_0_[11]\,
      I2 => \first_split__2\,
      I3 => \first_step_q_reg_n_0_[11]\,
      O => \next_mi_addr[11]_i_2_n_0\
    );
\next_mi_addr[11]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_araddr\(10),
      I1 => \addr_step_q_reg_n_0_[10]\,
      I2 => \first_split__2\,
      I3 => \first_step_q_reg_n_0_[10]\,
      O => \next_mi_addr[11]_i_3_n_0\
    );
\next_mi_addr[11]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_araddr\(9),
      I1 => \addr_step_q_reg_n_0_[9]\,
      I2 => \first_split__2\,
      I3 => \first_step_q_reg_n_0_[9]\,
      O => \next_mi_addr[11]_i_4_n_0\
    );
\next_mi_addr[11]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_araddr\(8),
      I1 => \addr_step_q_reg_n_0_[8]\,
      I2 => \first_split__2\,
      I3 => \first_step_q_reg_n_0_[8]\,
      O => \next_mi_addr[11]_i_5_n_0\
    );
\next_mi_addr[11]_i_6__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => pushed_commands_reg(1),
      I1 => pushed_commands_reg(0),
      I2 => pushed_commands_reg(3),
      I3 => pushed_commands_reg(2),
      O => \first_split__2\
    );
\next_mi_addr[15]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[15]\,
      I1 => next_mi_addr(15),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_2__0_n_0\
    );
\next_mi_addr[15]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[14]\,
      I1 => next_mi_addr(14),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_3__0_n_0\
    );
\next_mi_addr[15]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[13]\,
      I1 => next_mi_addr(13),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_4__0_n_0\
    );
\next_mi_addr[15]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[12]\,
      I1 => next_mi_addr(12),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_5__0_n_0\
    );
\next_mi_addr[15]_i_6__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[15]\,
      I1 => next_mi_addr(15),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_6__0_n_0\
    );
\next_mi_addr[15]_i_7__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[14]\,
      I1 => next_mi_addr(14),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_7__0_n_0\
    );
\next_mi_addr[15]_i_8__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[13]\,
      I1 => next_mi_addr(13),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_8__0_n_0\
    );
\next_mi_addr[15]_i_9__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[12]\,
      I1 => next_mi_addr(12),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[15]_i_9__0_n_0\
    );
\next_mi_addr[19]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[19]\,
      I1 => next_mi_addr(19),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[19]_i_2__0_n_0\
    );
\next_mi_addr[19]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[18]\,
      I1 => next_mi_addr(18),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[19]_i_3__0_n_0\
    );
\next_mi_addr[19]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[17]\,
      I1 => next_mi_addr(17),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[19]_i_4__0_n_0\
    );
\next_mi_addr[19]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[16]\,
      I1 => next_mi_addr(16),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[19]_i_5__0_n_0\
    );
\next_mi_addr[23]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[23]\,
      I1 => next_mi_addr(23),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[23]_i_2__0_n_0\
    );
\next_mi_addr[23]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[22]\,
      I1 => next_mi_addr(22),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[23]_i_3__0_n_0\
    );
\next_mi_addr[23]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[21]\,
      I1 => next_mi_addr(21),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[23]_i_4__0_n_0\
    );
\next_mi_addr[23]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[20]\,
      I1 => next_mi_addr(20),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[23]_i_5__0_n_0\
    );
\next_mi_addr[27]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[27]\,
      I1 => next_mi_addr(27),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[27]_i_2__0_n_0\
    );
\next_mi_addr[27]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[26]\,
      I1 => next_mi_addr(26),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[27]_i_3__0_n_0\
    );
\next_mi_addr[27]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[25]\,
      I1 => next_mi_addr(25),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[27]_i_4__0_n_0\
    );
\next_mi_addr[27]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[24]\,
      I1 => next_mi_addr(24),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[27]_i_5__0_n_0\
    );
\next_mi_addr[31]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[31]\,
      I1 => next_mi_addr(31),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[31]_i_2__0_n_0\
    );
\next_mi_addr[31]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[30]\,
      I1 => next_mi_addr(30),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[31]_i_3__0_n_0\
    );
\next_mi_addr[31]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[29]\,
      I1 => next_mi_addr(29),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[31]_i_4__0_n_0\
    );
\next_mi_addr[31]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CAAA0AAA"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[28]\,
      I1 => next_mi_addr(28),
      I2 => access_is_incr_q,
      I3 => split_ongoing,
      I4 => size_mask_q(31),
      O => \next_mi_addr[31]_i_5__0_n_0\
    );
\next_mi_addr[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1DDDE222E222E222"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[3]\,
      I1 => \M_AXI_AADDR_I1__0\,
      I2 => size_mask_q(3),
      I3 => next_mi_addr(3),
      I4 => \first_split__2\,
      I5 => \first_step_q_reg_n_0_[3]\,
      O => \next_mi_addr[3]_i_2_n_0\
    );
\next_mi_addr[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1DDDE222E222E222"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[2]\,
      I1 => \M_AXI_AADDR_I1__0\,
      I2 => size_mask_q(2),
      I3 => next_mi_addr(2),
      I4 => \first_split__2\,
      I5 => \first_step_q_reg_n_0_[2]\,
      O => \next_mi_addr[3]_i_3_n_0\
    );
\next_mi_addr[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1DDDE222E222E222"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[1]\,
      I1 => \M_AXI_AADDR_I1__0\,
      I2 => size_mask_q(1),
      I3 => next_mi_addr(1),
      I4 => \first_split__2\,
      I5 => \first_step_q_reg_n_0_[1]\,
      O => \next_mi_addr[3]_i_4_n_0\
    );
\next_mi_addr[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1DDDE222E222E222"
    )
        port map (
      I0 => \S_AXI_AADDR_Q_reg_n_0_[0]\,
      I1 => \M_AXI_AADDR_I1__0\,
      I2 => size_mask_q(0),
      I3 => next_mi_addr(0),
      I4 => \first_split__2\,
      I5 => \first_step_q_reg_n_0_[0]\,
      O => \next_mi_addr[3]_i_5_n_0\
    );
\next_mi_addr[3]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => split_ongoing,
      I1 => access_is_incr_q,
      O => \M_AXI_AADDR_I1__0\
    );
\next_mi_addr[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_araddr\(7),
      I1 => \addr_step_q_reg_n_0_[7]\,
      I2 => \first_split__2\,
      I3 => \first_step_q_reg_n_0_[7]\,
      O => \next_mi_addr[7]_i_2_n_0\
    );
\next_mi_addr[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_araddr\(6),
      I1 => \addr_step_q_reg_n_0_[6]\,
      I2 => \first_split__2\,
      I3 => \first_step_q_reg_n_0_[6]\,
      O => \next_mi_addr[7]_i_3_n_0\
    );
\next_mi_addr[7]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_araddr\(5),
      I1 => \addr_step_q_reg_n_0_[5]\,
      I2 => \first_split__2\,
      I3 => \first_step_q_reg_n_0_[5]\,
      O => \next_mi_addr[7]_i_4_n_0\
    );
\next_mi_addr[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \^m_axi_araddr\(4),
      I1 => size_mask_q(0),
      I2 => \first_split__2\,
      I3 => \first_step_q_reg_n_0_[4]\,
      O => \next_mi_addr[7]_i_5_n_0\
    );
\next_mi_addr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[3]_i_1__0_n_7\,
      Q => next_mi_addr(0),
      R => SR(0)
    );
\next_mi_addr_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[11]_i_1__0_n_5\,
      Q => next_mi_addr(10),
      R => SR(0)
    );
\next_mi_addr_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[11]_i_1__0_n_4\,
      Q => next_mi_addr(11),
      R => SR(0)
    );
\next_mi_addr_reg[11]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[7]_i_1__0_n_0\,
      CO(3) => \next_mi_addr_reg[11]_i_1__0_n_0\,
      CO(2) => \next_mi_addr_reg[11]_i_1__0_n_1\,
      CO(1) => \next_mi_addr_reg[11]_i_1__0_n_2\,
      CO(0) => \next_mi_addr_reg[11]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^m_axi_araddr\(11 downto 8),
      O(3) => \next_mi_addr_reg[11]_i_1__0_n_4\,
      O(2) => \next_mi_addr_reg[11]_i_1__0_n_5\,
      O(1) => \next_mi_addr_reg[11]_i_1__0_n_6\,
      O(0) => \next_mi_addr_reg[11]_i_1__0_n_7\,
      S(3) => \next_mi_addr[11]_i_2_n_0\,
      S(2) => \next_mi_addr[11]_i_3_n_0\,
      S(1) => \next_mi_addr[11]_i_4_n_0\,
      S(0) => \next_mi_addr[11]_i_5_n_0\
    );
\next_mi_addr_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[15]_i_1__0_n_7\,
      Q => next_mi_addr(12),
      R => SR(0)
    );
\next_mi_addr_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[15]_i_1__0_n_6\,
      Q => next_mi_addr(13),
      R => SR(0)
    );
\next_mi_addr_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[15]_i_1__0_n_5\,
      Q => next_mi_addr(14),
      R => SR(0)
    );
\next_mi_addr_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[15]_i_1__0_n_4\,
      Q => next_mi_addr(15),
      R => SR(0)
    );
\next_mi_addr_reg[15]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[11]_i_1__0_n_0\,
      CO(3) => \next_mi_addr_reg[15]_i_1__0_n_0\,
      CO(2) => \next_mi_addr_reg[15]_i_1__0_n_1\,
      CO(1) => \next_mi_addr_reg[15]_i_1__0_n_2\,
      CO(0) => \next_mi_addr_reg[15]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3) => \next_mi_addr[15]_i_2__0_n_0\,
      DI(2) => \next_mi_addr[15]_i_3__0_n_0\,
      DI(1) => \next_mi_addr[15]_i_4__0_n_0\,
      DI(0) => \next_mi_addr[15]_i_5__0_n_0\,
      O(3) => \next_mi_addr_reg[15]_i_1__0_n_4\,
      O(2) => \next_mi_addr_reg[15]_i_1__0_n_5\,
      O(1) => \next_mi_addr_reg[15]_i_1__0_n_6\,
      O(0) => \next_mi_addr_reg[15]_i_1__0_n_7\,
      S(3) => \next_mi_addr[15]_i_6__0_n_0\,
      S(2) => \next_mi_addr[15]_i_7__0_n_0\,
      S(1) => \next_mi_addr[15]_i_8__0_n_0\,
      S(0) => \next_mi_addr[15]_i_9__0_n_0\
    );
\next_mi_addr_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[19]_i_1__0_n_7\,
      Q => next_mi_addr(16),
      R => SR(0)
    );
\next_mi_addr_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[19]_i_1__0_n_6\,
      Q => next_mi_addr(17),
      R => SR(0)
    );
\next_mi_addr_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[19]_i_1__0_n_5\,
      Q => next_mi_addr(18),
      R => SR(0)
    );
\next_mi_addr_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[19]_i_1__0_n_4\,
      Q => next_mi_addr(19),
      R => SR(0)
    );
\next_mi_addr_reg[19]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[15]_i_1__0_n_0\,
      CO(3) => \next_mi_addr_reg[19]_i_1__0_n_0\,
      CO(2) => \next_mi_addr_reg[19]_i_1__0_n_1\,
      CO(1) => \next_mi_addr_reg[19]_i_1__0_n_2\,
      CO(0) => \next_mi_addr_reg[19]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \next_mi_addr_reg[19]_i_1__0_n_4\,
      O(2) => \next_mi_addr_reg[19]_i_1__0_n_5\,
      O(1) => \next_mi_addr_reg[19]_i_1__0_n_6\,
      O(0) => \next_mi_addr_reg[19]_i_1__0_n_7\,
      S(3) => \next_mi_addr[19]_i_2__0_n_0\,
      S(2) => \next_mi_addr[19]_i_3__0_n_0\,
      S(1) => \next_mi_addr[19]_i_4__0_n_0\,
      S(0) => \next_mi_addr[19]_i_5__0_n_0\
    );
\next_mi_addr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[3]_i_1__0_n_6\,
      Q => next_mi_addr(1),
      R => SR(0)
    );
\next_mi_addr_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[23]_i_1__0_n_7\,
      Q => next_mi_addr(20),
      R => SR(0)
    );
\next_mi_addr_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[23]_i_1__0_n_6\,
      Q => next_mi_addr(21),
      R => SR(0)
    );
\next_mi_addr_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[23]_i_1__0_n_5\,
      Q => next_mi_addr(22),
      R => SR(0)
    );
\next_mi_addr_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[23]_i_1__0_n_4\,
      Q => next_mi_addr(23),
      R => SR(0)
    );
\next_mi_addr_reg[23]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[19]_i_1__0_n_0\,
      CO(3) => \next_mi_addr_reg[23]_i_1__0_n_0\,
      CO(2) => \next_mi_addr_reg[23]_i_1__0_n_1\,
      CO(1) => \next_mi_addr_reg[23]_i_1__0_n_2\,
      CO(0) => \next_mi_addr_reg[23]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \next_mi_addr_reg[23]_i_1__0_n_4\,
      O(2) => \next_mi_addr_reg[23]_i_1__0_n_5\,
      O(1) => \next_mi_addr_reg[23]_i_1__0_n_6\,
      O(0) => \next_mi_addr_reg[23]_i_1__0_n_7\,
      S(3) => \next_mi_addr[23]_i_2__0_n_0\,
      S(2) => \next_mi_addr[23]_i_3__0_n_0\,
      S(1) => \next_mi_addr[23]_i_4__0_n_0\,
      S(0) => \next_mi_addr[23]_i_5__0_n_0\
    );
\next_mi_addr_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[27]_i_1__0_n_7\,
      Q => next_mi_addr(24),
      R => SR(0)
    );
\next_mi_addr_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[27]_i_1__0_n_6\,
      Q => next_mi_addr(25),
      R => SR(0)
    );
\next_mi_addr_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[27]_i_1__0_n_5\,
      Q => next_mi_addr(26),
      R => SR(0)
    );
\next_mi_addr_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[27]_i_1__0_n_4\,
      Q => next_mi_addr(27),
      R => SR(0)
    );
\next_mi_addr_reg[27]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[23]_i_1__0_n_0\,
      CO(3) => \next_mi_addr_reg[27]_i_1__0_n_0\,
      CO(2) => \next_mi_addr_reg[27]_i_1__0_n_1\,
      CO(1) => \next_mi_addr_reg[27]_i_1__0_n_2\,
      CO(0) => \next_mi_addr_reg[27]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \next_mi_addr_reg[27]_i_1__0_n_4\,
      O(2) => \next_mi_addr_reg[27]_i_1__0_n_5\,
      O(1) => \next_mi_addr_reg[27]_i_1__0_n_6\,
      O(0) => \next_mi_addr_reg[27]_i_1__0_n_7\,
      S(3) => \next_mi_addr[27]_i_2__0_n_0\,
      S(2) => \next_mi_addr[27]_i_3__0_n_0\,
      S(1) => \next_mi_addr[27]_i_4__0_n_0\,
      S(0) => \next_mi_addr[27]_i_5__0_n_0\
    );
\next_mi_addr_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[31]_i_1__0_n_7\,
      Q => next_mi_addr(28),
      R => SR(0)
    );
\next_mi_addr_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[31]_i_1__0_n_6\,
      Q => next_mi_addr(29),
      R => SR(0)
    );
\next_mi_addr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[3]_i_1__0_n_5\,
      Q => next_mi_addr(2),
      R => SR(0)
    );
\next_mi_addr_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[31]_i_1__0_n_5\,
      Q => next_mi_addr(30),
      R => SR(0)
    );
\next_mi_addr_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[31]_i_1__0_n_4\,
      Q => next_mi_addr(31),
      R => SR(0)
    );
\next_mi_addr_reg[31]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[27]_i_1__0_n_0\,
      CO(3) => \NLW_next_mi_addr_reg[31]_i_1__0_CO_UNCONNECTED\(3),
      CO(2) => \next_mi_addr_reg[31]_i_1__0_n_1\,
      CO(1) => \next_mi_addr_reg[31]_i_1__0_n_2\,
      CO(0) => \next_mi_addr_reg[31]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \next_mi_addr_reg[31]_i_1__0_n_4\,
      O(2) => \next_mi_addr_reg[31]_i_1__0_n_5\,
      O(1) => \next_mi_addr_reg[31]_i_1__0_n_6\,
      O(0) => \next_mi_addr_reg[31]_i_1__0_n_7\,
      S(3) => \next_mi_addr[31]_i_2__0_n_0\,
      S(2) => \next_mi_addr[31]_i_3__0_n_0\,
      S(1) => \next_mi_addr[31]_i_4__0_n_0\,
      S(0) => \next_mi_addr[31]_i_5__0_n_0\
    );
\next_mi_addr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[3]_i_1__0_n_4\,
      Q => next_mi_addr(3),
      R => SR(0)
    );
\next_mi_addr_reg[3]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \next_mi_addr_reg[3]_i_1__0_n_0\,
      CO(2) => \next_mi_addr_reg[3]_i_1__0_n_1\,
      CO(1) => \next_mi_addr_reg[3]_i_1__0_n_2\,
      CO(0) => \next_mi_addr_reg[3]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^m_axi_araddr\(3 downto 0),
      O(3) => \next_mi_addr_reg[3]_i_1__0_n_4\,
      O(2) => \next_mi_addr_reg[3]_i_1__0_n_5\,
      O(1) => \next_mi_addr_reg[3]_i_1__0_n_6\,
      O(0) => \next_mi_addr_reg[3]_i_1__0_n_7\,
      S(3) => \next_mi_addr[3]_i_2_n_0\,
      S(2) => \next_mi_addr[3]_i_3_n_0\,
      S(1) => \next_mi_addr[3]_i_4_n_0\,
      S(0) => \next_mi_addr[3]_i_5_n_0\
    );
\next_mi_addr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[7]_i_1__0_n_7\,
      Q => next_mi_addr(4),
      R => SR(0)
    );
\next_mi_addr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[7]_i_1__0_n_6\,
      Q => next_mi_addr(5),
      R => SR(0)
    );
\next_mi_addr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[7]_i_1__0_n_5\,
      Q => next_mi_addr(6),
      R => SR(0)
    );
\next_mi_addr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[7]_i_1__0_n_4\,
      Q => next_mi_addr(7),
      R => SR(0)
    );
\next_mi_addr_reg[7]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_mi_addr_reg[3]_i_1__0_n_0\,
      CO(3) => \next_mi_addr_reg[7]_i_1__0_n_0\,
      CO(2) => \next_mi_addr_reg[7]_i_1__0_n_1\,
      CO(1) => \next_mi_addr_reg[7]_i_1__0_n_2\,
      CO(0) => \next_mi_addr_reg[7]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \^m_axi_araddr\(7 downto 4),
      O(3) => \next_mi_addr_reg[7]_i_1__0_n_4\,
      O(2) => \next_mi_addr_reg[7]_i_1__0_n_5\,
      O(1) => \next_mi_addr_reg[7]_i_1__0_n_6\,
      O(0) => \next_mi_addr_reg[7]_i_1__0_n_7\,
      S(3) => \next_mi_addr[7]_i_2_n_0\,
      S(2) => \next_mi_addr[7]_i_3_n_0\,
      S(1) => \next_mi_addr[7]_i_4_n_0\,
      S(0) => \next_mi_addr[7]_i_5_n_0\
    );
\next_mi_addr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[11]_i_1__0_n_7\,
      Q => next_mi_addr(8),
      R => SR(0)
    );
\next_mi_addr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \next_mi_addr_reg[11]_i_1__0_n_6\,
      Q => next_mi_addr(9),
      R => SR(0)
    );
\num_transactions_q_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arlen(4),
      Q => \num_transactions_q_reg_n_0_[0]\,
      R => SR(0)
    );
\num_transactions_q_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arlen(5),
      Q => \num_transactions_q_reg_n_0_[1]\,
      R => SR(0)
    );
\num_transactions_q_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arlen(6),
      Q => \num_transactions_q_reg_n_0_[2]\,
      R => SR(0)
    );
\num_transactions_q_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => s_axi_arlen(7),
      Q => \num_transactions_q_reg_n_0_[3]\,
      R => SR(0)
    );
\pushed_commands[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pushed_commands_reg(0),
      O => \p_0_in__1\(0)
    );
\pushed_commands[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => pushed_commands_reg(0),
      I1 => pushed_commands_reg(1),
      O => \p_0_in__1\(1)
    );
\pushed_commands[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => pushed_commands_reg(1),
      I1 => pushed_commands_reg(0),
      I2 => pushed_commands_reg(2),
      O => \p_0_in__1\(2)
    );
\pushed_commands[3]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^e\(0),
      I1 => aresetn,
      O => \pushed_commands[3]_i_1__0_n_0\
    );
\pushed_commands[3]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => pushed_commands_reg(2),
      I1 => pushed_commands_reg(0),
      I2 => pushed_commands_reg(1),
      I3 => pushed_commands_reg(3),
      O => \p_0_in__1\(3)
    );
\pushed_commands_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \p_0_in__1\(0),
      Q => pushed_commands_reg(0),
      R => \pushed_commands[3]_i_1__0_n_0\
    );
\pushed_commands_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \p_0_in__1\(1),
      Q => pushed_commands_reg(1),
      R => \pushed_commands[3]_i_1__0_n_0\
    );
\pushed_commands_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \p_0_in__1\(2),
      Q => pushed_commands_reg(2),
      R => \pushed_commands[3]_i_1__0_n_0\
    );
\pushed_commands_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => \p_0_in__1\(3),
      Q => pushed_commands_reg(3),
      R => \pushed_commands[3]_i_1__0_n_0\
    );
\queue_id_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => \USE_R_CHANNEL.cmd_queue_n_17\,
      Q => \queue_id_reg_n_0_[0]\,
      R => SR(0)
    );
\size_mask_q[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arsize(2),
      O => \size_mask_q[0]_i_1__0_n_0\
    );
\size_mask_q[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arsize(2),
      O => \size_mask_q[1]_i_1__0_n_0\
    );
\size_mask_q[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"15"
    )
        port map (
      I0 => s_axi_arsize(2),
      I1 => s_axi_arsize(1),
      I2 => s_axi_arsize(0),
      O => \size_mask_q[2]_i_1__0_n_0\
    );
\size_mask_q[3]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_arsize(2),
      O => \size_mask_q[3]_i_1__0_n_0\
    );
\size_mask_q[4]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"57"
    )
        port map (
      I0 => s_axi_arsize(2),
      I1 => s_axi_arsize(1),
      I2 => s_axi_arsize(0),
      O => \size_mask_q[4]_i_1__0_n_0\
    );
\size_mask_q[5]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arsize(2),
      O => \size_mask_q[5]_i_1__0_n_0\
    );
\size_mask_q[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => s_axi_arsize(1),
      I1 => s_axi_arsize(0),
      I2 => s_axi_arsize(2),
      O => \size_mask_q[6]_i_1__0_n_0\
    );
\size_mask_q_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \size_mask_q[0]_i_1__0_n_0\,
      Q => size_mask_q(0),
      R => SR(0)
    );
\size_mask_q_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \size_mask_q[1]_i_1__0_n_0\,
      Q => size_mask_q(1),
      R => SR(0)
    );
\size_mask_q_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \size_mask_q[2]_i_1__0_n_0\,
      Q => size_mask_q(2),
      R => SR(0)
    );
\size_mask_q_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => '1',
      Q => size_mask_q(31),
      R => SR(0)
    );
\size_mask_q_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \size_mask_q[3]_i_1__0_n_0\,
      Q => size_mask_q(3),
      R => SR(0)
    );
\size_mask_q_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \size_mask_q[4]_i_1__0_n_0\,
      Q => size_mask_q(4),
      R => SR(0)
    );
\size_mask_q_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \size_mask_q[5]_i_1__0_n_0\,
      Q => size_mask_q(5),
      R => SR(0)
    );
\size_mask_q_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => \^e\(0),
      D => \size_mask_q[6]_i_1__0_n_0\,
      Q => size_mask_q(6),
      R => SR(0)
    );
split_in_progress_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAAAEA"
    )
        port map (
      I0 => split_in_progress_reg_n_0,
      I1 => \cmd_id_check__2\,
      I2 => need_to_split_q,
      I3 => multiple_id_non_split,
      I4 => \USE_R_CHANNEL.cmd_queue_n_5\,
      I5 => split_in_progress,
      O => split_in_progress_i_1_n_0
    );
\split_in_progress_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F9"
    )
        port map (
      I0 => \queue_id_reg_n_0_[0]\,
      I1 => \^s_axi_aid_q_reg[0]_0\,
      I2 => cmd_empty,
      O => \cmd_id_check__2\
    );
split_in_progress_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => '1',
      D => split_in_progress_i_1_n_0,
      Q => split_in_progress_reg_n_0,
      R => '0'
    );
split_ongoing_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => pushed_new_cmd,
      D => cmd_split_i,
      Q => split_ongoing,
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi3_conv is
  port (
    ram_full_i_reg : out STD_LOGIC;
    S_AXI_AREADY_I_reg : out STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AXI_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_bready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AREADY_I_reg_0 : out STD_LOGIC;
    M_AXI_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    empty_fwft_i_reg : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wlast : out STD_LOGIC;
    m_axi_arvalid : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rlast : out STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    aresetn : in STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    aclk : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awready : in STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_rlast : in STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi3_conv : entity is "axi_protocol_converter_v2_1_33_axi3_conv";
end bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi3_conv;

architecture STRUCTURE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi3_conv is
  signal \USE_BURSTS.cmd_queue/inst/empty\ : STD_LOGIC;
  signal \USE_WRITE.wr_cmd_b_repeat\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \USE_WRITE.wr_cmd_b_split\ : STD_LOGIC;
  signal \USE_WRITE.wr_cmd_length\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \USE_WRITE.wr_cmd_ready\ : STD_LOGIC;
  signal \USE_WRITE.write_addr_inst_n_21\ : STD_LOGIC;
  signal \USE_WRITE.write_addr_inst_n_54\ : STD_LOGIC;
  signal \USE_WRITE.write_addr_inst_n_57\ : STD_LOGIC;
  signal \USE_WRITE.write_addr_inst_n_58\ : STD_LOGIC;
  signal \USE_WRITE.write_addr_inst_n_59\ : STD_LOGIC;
  signal \USE_WRITE.write_addr_inst_n_6\ : STD_LOGIC;
  signal \USE_WRITE.write_data_inst_n_4\ : STD_LOGIC;
  signal \USE_WRITE.write_data_inst_n_6\ : STD_LOGIC;
  signal areset_d : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^empty_fwft_i_reg\ : STD_LOGIC;
  signal first_mi_word : STD_LOGIC;
  signal last_word : STD_LOGIC;
  signal length_counter_1_reg : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  empty_fwft_i_reg <= \^empty_fwft_i_reg\;
\USE_READ.USE_SPLIT_R.read_addr_inst\: entity work.\bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv__parameterized0\
     port map (
      E(0) => S_AXI_AREADY_I_reg_0,
      SR(0) => \USE_WRITE.write_addr_inst_n_6\,
      \S_AXI_AID_Q_reg[0]_0\ => M_AXI_ARID(0),
      aclk => aclk,
      areset_d(1 downto 0) => areset_d(1 downto 0),
      aresetn => aresetn,
      command_ongoing_reg_0 => \USE_WRITE.write_addr_inst_n_59\,
      m_axi_araddr(31 downto 0) => m_axi_araddr(31 downto 0),
      m_axi_arburst(1 downto 0) => m_axi_arburst(1 downto 0),
      m_axi_arcache(3 downto 0) => m_axi_arcache(3 downto 0),
      m_axi_arlen(3 downto 0) => m_axi_arlen(3 downto 0),
      m_axi_arlock(0) => m_axi_arlock(0),
      m_axi_arprot(2 downto 0) => m_axi_arprot(2 downto 0),
      m_axi_arqos(3 downto 0) => m_axi_arqos(3 downto 0),
      m_axi_arready => m_axi_arready,
      m_axi_arsize(2 downto 0) => m_axi_arsize(2 downto 0),
      m_axi_arvalid => m_axi_arvalid,
      m_axi_rlast => m_axi_rlast,
      m_axi_rready => m_axi_rready,
      m_axi_rvalid => m_axi_rvalid,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_arcache(3 downto 0) => s_axi_arcache(3 downto 0),
      s_axi_arid(0) => s_axi_arid(0),
      s_axi_arlen(7 downto 0) => s_axi_arlen(7 downto 0),
      s_axi_arlock(0) => s_axi_arlock(0),
      s_axi_arprot(2 downto 0) => s_axi_arprot(2 downto 0),
      s_axi_arqos(3 downto 0) => s_axi_arqos(3 downto 0),
      s_axi_arsize(2 downto 0) => s_axi_arsize(2 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      s_axi_rlast => s_axi_rlast,
      s_axi_rready => s_axi_rready,
      s_axi_rvalid => s_axi_rvalid
    );
\USE_WRITE.USE_SPLIT_W.write_resp_inst\: entity work.bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_b_downsizer
     port map (
      E(0) => m_axi_bready,
      SR(0) => \USE_WRITE.write_addr_inst_n_6\,
      aclk => aclk,
      dout(4) => \USE_WRITE.wr_cmd_b_split\,
      dout(3 downto 0) => \USE_WRITE.wr_cmd_b_repeat\(3 downto 0),
      last_word => last_word,
      m_axi_bresp(1 downto 0) => m_axi_bresp(1 downto 0),
      m_axi_bvalid => m_axi_bvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      s_axi_bvalid => s_axi_bvalid
    );
\USE_WRITE.write_addr_inst\: entity work.bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_a_axi3_conv
     port map (
      E(0) => S_AXI_AREADY_I_reg,
      SR(0) => \USE_WRITE.write_addr_inst_n_6\,
      \USE_WRITE.wr_cmd_ready\ => \USE_WRITE.wr_cmd_ready\,
      aclk => aclk,
      areset_d(1 downto 0) => areset_d(1 downto 0),
      \areset_d_reg[0]_0\ => \USE_WRITE.write_addr_inst_n_59\,
      aresetn => aresetn,
      \cmd_depth_reg[5]_0\(0) => \USE_WRITE.write_data_inst_n_6\,
      cmd_push_block_reg_0 => \USE_WRITE.write_addr_inst_n_21\,
      din(4) => M_AXI_AWID(0),
      din(3 downto 0) => m_axi_awlen(3 downto 0),
      dout(4) => m_axi_wid(0),
      dout(3 downto 0) => \USE_WRITE.wr_cmd_length\(3 downto 0),
      empty => \USE_BURSTS.cmd_queue/inst/empty\,
      empty_fwft_i_reg => \^empty_fwft_i_reg\,
      first_mi_word => first_mi_word,
      first_mi_word_reg => \USE_WRITE.write_addr_inst_n_58\,
      \goreg_dm.dout_i_reg[1]\ => \USE_WRITE.write_addr_inst_n_54\,
      \goreg_dm.dout_i_reg[2]\ => \USE_WRITE.write_addr_inst_n_57\,
      \goreg_dm.dout_i_reg[4]\(4) => \USE_WRITE.wr_cmd_b_split\,
      \goreg_dm.dout_i_reg[4]\(3 downto 0) => \USE_WRITE.wr_cmd_b_repeat\(3 downto 0),
      last_word => last_word,
      length_counter_1_reg(1 downto 0) => length_counter_1_reg(1 downto 0),
      m_axi_awaddr(31 downto 0) => m_axi_awaddr(31 downto 0),
      m_axi_awburst(1 downto 0) => m_axi_awburst(1 downto 0),
      m_axi_awcache(3 downto 0) => m_axi_awcache(3 downto 0),
      m_axi_awlock(0) => m_axi_awlock(0),
      m_axi_awprot(2 downto 0) => m_axi_awprot(2 downto 0),
      m_axi_awqos(3 downto 0) => m_axi_awqos(3 downto 0),
      m_axi_awready => m_axi_awready,
      m_axi_awsize(2 downto 0) => m_axi_awsize(2 downto 0),
      m_axi_bvalid => m_axi_bvalid,
      m_axi_wlast => \USE_WRITE.write_data_inst_n_4\,
      m_axi_wready => m_axi_wready,
      m_axi_wvalid => m_axi_wvalid,
      ram_full_i_reg => ram_full_i_reg,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awcache(3 downto 0) => s_axi_awcache(3 downto 0),
      s_axi_awid(0) => s_axi_awid(0),
      s_axi_awlen(7 downto 0) => s_axi_awlen(7 downto 0),
      s_axi_awlock(0) => s_axi_awlock(0),
      s_axi_awprot(2 downto 0) => s_axi_awprot(2 downto 0),
      s_axi_awqos(3 downto 0) => s_axi_awqos(3 downto 0),
      s_axi_awsize(2 downto 0) => s_axi_awsize(2 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_wvalid => s_axi_wvalid
    );
\USE_WRITE.write_data_inst\: entity work.bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_w_axi3_conv
     port map (
      SR(0) => \USE_WRITE.write_addr_inst_n_6\,
      \USE_WRITE.wr_cmd_ready\ => \USE_WRITE.wr_cmd_ready\,
      aclk => aclk,
      \cmd_depth_reg[5]\ => \USE_WRITE.write_addr_inst_n_58\,
      \cmd_depth_reg[5]_0\ => \USE_WRITE.write_addr_inst_n_21\,
      dout(3 downto 0) => \USE_WRITE.wr_cmd_length\(3 downto 0),
      empty => \USE_BURSTS.cmd_queue/inst/empty\,
      first_mi_word => first_mi_word,
      first_mi_word_reg_0 => \USE_WRITE.write_data_inst_n_4\,
      \length_counter_1_reg[1]_0\(1 downto 0) => length_counter_1_reg(1 downto 0),
      \length_counter_1_reg[1]_1\ => \USE_WRITE.write_addr_inst_n_54\,
      \length_counter_1_reg[2]_0\ => \^empty_fwft_i_reg\,
      m_axi_wlast => m_axi_wlast,
      m_axi_wlast_0 => \USE_WRITE.write_addr_inst_n_57\,
      m_axi_wready => m_axi_wready,
      m_axi_wready_0(0) => \USE_WRITE.write_data_inst_n_6\,
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_buser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 1;
  attribute C_AXI_SUPPORTS_READ : integer;
  attribute C_AXI_SUPPORTS_READ of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 1;
  attribute C_AXI_SUPPORTS_USER_SIGNALS : integer;
  attribute C_AXI_SUPPORTS_USER_SIGNALS of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 0;
  attribute C_AXI_SUPPORTS_WRITE : integer;
  attribute C_AXI_SUPPORTS_WRITE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 1;
  attribute C_FAMILY : string;
  attribute C_FAMILY of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is "zynq";
  attribute C_IGNORE_ID : integer;
  attribute C_IGNORE_ID of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 0;
  attribute C_M_AXI_PROTOCOL : integer;
  attribute C_M_AXI_PROTOCOL of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 1;
  attribute C_S_AXI_PROTOCOL : integer;
  attribute C_S_AXI_PROTOCOL of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 0;
  attribute C_TRANSLATION_MODE : integer;
  attribute C_TRANSLATION_MODE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 2;
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is "axi_protocol_converter_v2_1_33_axi_protocol_converter";
  attribute P_AXI3 : integer;
  attribute P_AXI3 of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 1;
  attribute P_AXI4 : integer;
  attribute P_AXI4 of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 0;
  attribute P_AXILITE : integer;
  attribute P_AXILITE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 2;
  attribute P_AXILITE_SIZE : string;
  attribute P_AXILITE_SIZE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is "3'b011";
  attribute P_CONVERSION : integer;
  attribute P_CONVERSION of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 2;
  attribute P_DECERR : string;
  attribute P_DECERR of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is "2'b11";
  attribute P_INCR : string;
  attribute P_INCR of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is "2'b01";
  attribute P_PROTECTION : integer;
  attribute P_PROTECTION of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is 1;
  attribute P_SLVERR : string;
  attribute P_SLVERR of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter : entity is "2'b10";
end bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter;

architecture STRUCTURE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter is
  signal \<const0>\ : STD_LOGIC;
  signal \^m_axi_arlock\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^m_axi_awlock\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^m_axi_bid\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^m_axi_rdata\ : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal \^m_axi_rid\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^m_axi_rresp\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^s_axi_wdata\ : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal \^s_axi_wstrb\ : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
  \^m_axi_bid\(0) <= m_axi_bid(0);
  \^m_axi_rdata\(63 downto 0) <= m_axi_rdata(63 downto 0);
  \^m_axi_rid\(0) <= m_axi_rid(0);
  \^m_axi_rresp\(1 downto 0) <= m_axi_rresp(1 downto 0);
  \^s_axi_wdata\(63 downto 0) <= s_axi_wdata(63 downto 0);
  \^s_axi_wstrb\(7 downto 0) <= s_axi_wstrb(7 downto 0);
  m_axi_arlock(1) <= \<const0>\;
  m_axi_arlock(0) <= \^m_axi_arlock\(0);
  m_axi_arregion(3) <= \<const0>\;
  m_axi_arregion(2) <= \<const0>\;
  m_axi_arregion(1) <= \<const0>\;
  m_axi_arregion(0) <= \<const0>\;
  m_axi_aruser(0) <= \<const0>\;
  m_axi_awlock(1) <= \<const0>\;
  m_axi_awlock(0) <= \^m_axi_awlock\(0);
  m_axi_awregion(3) <= \<const0>\;
  m_axi_awregion(2) <= \<const0>\;
  m_axi_awregion(1) <= \<const0>\;
  m_axi_awregion(0) <= \<const0>\;
  m_axi_awuser(0) <= \<const0>\;
  m_axi_wdata(63 downto 0) <= \^s_axi_wdata\(63 downto 0);
  m_axi_wstrb(7 downto 0) <= \^s_axi_wstrb\(7 downto 0);
  m_axi_wuser(0) <= \<const0>\;
  s_axi_bid(0) <= \^m_axi_bid\(0);
  s_axi_buser(0) <= \<const0>\;
  s_axi_rdata(63 downto 0) <= \^m_axi_rdata\(63 downto 0);
  s_axi_rid(0) <= \^m_axi_rid\(0);
  s_axi_rresp(1 downto 0) <= \^m_axi_rresp\(1 downto 0);
  s_axi_ruser(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gen_axi4_axi3.axi3_conv_inst\: entity work.bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi3_conv
     port map (
      M_AXI_ARID(0) => m_axi_arid(0),
      M_AXI_AWID(0) => m_axi_awid(0),
      S_AXI_AREADY_I_reg => s_axi_awready,
      S_AXI_AREADY_I_reg_0 => s_axi_arready,
      aclk => aclk,
      aresetn => aresetn,
      empty_fwft_i_reg => s_axi_wready,
      m_axi_araddr(31 downto 0) => m_axi_araddr(31 downto 0),
      m_axi_arburst(1 downto 0) => m_axi_arburst(1 downto 0),
      m_axi_arcache(3 downto 0) => m_axi_arcache(3 downto 0),
      m_axi_arlen(3 downto 0) => m_axi_arlen(3 downto 0),
      m_axi_arlock(0) => \^m_axi_arlock\(0),
      m_axi_arprot(2 downto 0) => m_axi_arprot(2 downto 0),
      m_axi_arqos(3 downto 0) => m_axi_arqos(3 downto 0),
      m_axi_arready => m_axi_arready,
      m_axi_arsize(2 downto 0) => m_axi_arsize(2 downto 0),
      m_axi_arvalid => m_axi_arvalid,
      m_axi_awaddr(31 downto 0) => m_axi_awaddr(31 downto 0),
      m_axi_awburst(1 downto 0) => m_axi_awburst(1 downto 0),
      m_axi_awcache(3 downto 0) => m_axi_awcache(3 downto 0),
      m_axi_awlen(3 downto 0) => m_axi_awlen(3 downto 0),
      m_axi_awlock(0) => \^m_axi_awlock\(0),
      m_axi_awprot(2 downto 0) => m_axi_awprot(2 downto 0),
      m_axi_awqos(3 downto 0) => m_axi_awqos(3 downto 0),
      m_axi_awready => m_axi_awready,
      m_axi_awsize(2 downto 0) => m_axi_awsize(2 downto 0),
      m_axi_bready => m_axi_bready,
      m_axi_bresp(1 downto 0) => m_axi_bresp(1 downto 0),
      m_axi_bvalid => m_axi_bvalid,
      m_axi_rlast => m_axi_rlast,
      m_axi_rready => m_axi_rready,
      m_axi_rvalid => m_axi_rvalid,
      m_axi_wid(0) => m_axi_wid(0),
      m_axi_wlast => m_axi_wlast,
      m_axi_wready => m_axi_wready,
      m_axi_wvalid => m_axi_wvalid,
      ram_full_i_reg => m_axi_awvalid,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_arcache(3 downto 0) => s_axi_arcache(3 downto 0),
      s_axi_arid(0) => s_axi_arid(0),
      s_axi_arlen(7 downto 0) => s_axi_arlen(7 downto 0),
      s_axi_arlock(0) => s_axi_arlock(0),
      s_axi_arprot(2 downto 0) => s_axi_arprot(2 downto 0),
      s_axi_arqos(3 downto 0) => s_axi_arqos(3 downto 0),
      s_axi_arsize(2 downto 0) => s_axi_arsize(2 downto 0),
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awcache(3 downto 0) => s_axi_awcache(3 downto 0),
      s_axi_awid(0) => s_axi_awid(0),
      s_axi_awlen(7 downto 0) => s_axi_awlen(7 downto 0),
      s_axi_awlock(0) => s_axi_awlock(0),
      s_axi_awprot(2 downto 0) => s_axi_awprot(2 downto 0),
      s_axi_awqos(3 downto 0) => s_axi_awqos(3 downto 0),
      s_axi_awsize(2 downto 0) => s_axi_awsize(2 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rlast => s_axi_rlast,
      s_axi_rready => s_axi_rready,
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0 is
  port (
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0 : entity is "bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0,axi_protocol_converter_v2_1_33_axi_protocol_converter,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0 : entity is "axi_protocol_converter_v2_1_33_axi_protocol_converter,Vivado 2024.2";
end bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0;

architecture STRUCTURE of bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^m_axi_arlock\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^m_axi_awlock\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_inst_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_inst_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of inst : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of inst : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of inst : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of inst : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of inst : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of inst : label is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of inst : label is 1;
  attribute C_AXI_SUPPORTS_READ : integer;
  attribute C_AXI_SUPPORTS_READ of inst : label is 1;
  attribute C_AXI_SUPPORTS_USER_SIGNALS : integer;
  attribute C_AXI_SUPPORTS_USER_SIGNALS of inst : label is 0;
  attribute C_AXI_SUPPORTS_WRITE : integer;
  attribute C_AXI_SUPPORTS_WRITE of inst : label is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of inst : label is 1;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "zynq";
  attribute C_IGNORE_ID : integer;
  attribute C_IGNORE_ID of inst : label is 0;
  attribute C_M_AXI_PROTOCOL : integer;
  attribute C_M_AXI_PROTOCOL of inst : label is 1;
  attribute C_S_AXI_PROTOCOL : integer;
  attribute C_S_AXI_PROTOCOL of inst : label is 0;
  attribute C_TRANSLATION_MODE : integer;
  attribute C_TRANSLATION_MODE of inst : label is 2;
  attribute DowngradeIPIdentifiedWarnings of inst : label is "yes";
  attribute P_AXI3 : integer;
  attribute P_AXI3 of inst : label is 1;
  attribute P_AXI4 : integer;
  attribute P_AXI4 of inst : label is 0;
  attribute P_AXILITE : integer;
  attribute P_AXILITE of inst : label is 2;
  attribute P_AXILITE_SIZE : string;
  attribute P_AXILITE_SIZE of inst : label is "3'b011";
  attribute P_CONVERSION : integer;
  attribute P_CONVERSION of inst : label is 2;
  attribute P_DECERR : string;
  attribute P_DECERR of inst : label is "2'b11";
  attribute P_INCR : string;
  attribute P_INCR of inst : label is "2'b01";
  attribute P_PROTECTION : integer;
  attribute P_PROTECTION of inst : label is 1;
  attribute P_SLVERR : string;
  attribute P_SLVERR of inst : label is "2'b10";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 CLK CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME CLK, ASSOCIATED_BUSIF S_AXI:M_AXI, ASSOCIATED_RESET aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bnn_accelerator_design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 RST RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT";
  attribute X_INTERFACE_INFO of m_axi_arready : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARREADY";
  attribute X_INTERFACE_INFO of m_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARVALID";
  attribute X_INTERFACE_INFO of m_axi_awready : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWREADY";
  attribute X_INTERFACE_INFO of m_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWVALID";
  attribute X_INTERFACE_INFO of m_axi_bready : signal is "xilinx.com:interface:aximm:1.0 M_AXI BREADY";
  attribute X_INTERFACE_INFO of m_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI BVALID";
  attribute X_INTERFACE_INFO of m_axi_rlast : signal is "xilinx.com:interface:aximm:1.0 M_AXI RLAST";
  attribute X_INTERFACE_INFO of m_axi_rready : signal is "xilinx.com:interface:aximm:1.0 M_AXI RREADY";
  attribute X_INTERFACE_INFO of m_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI RVALID";
  attribute X_INTERFACE_INFO of m_axi_wlast : signal is "xilinx.com:interface:aximm:1.0 M_AXI WLAST";
  attribute X_INTERFACE_INFO of m_axi_wready : signal is "xilinx.com:interface:aximm:1.0 M_AXI WREADY";
  attribute X_INTERFACE_INFO of m_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI WVALID";
  attribute X_INTERFACE_INFO of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute X_INTERFACE_INFO of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute X_INTERFACE_INFO of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute X_INTERFACE_INFO of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute X_INTERFACE_INFO of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute X_INTERFACE_INFO of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute X_INTERFACE_INFO of s_axi_rlast : signal is "xilinx.com:interface:aximm:1.0 S_AXI RLAST";
  attribute X_INTERFACE_INFO of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute X_INTERFACE_INFO of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute X_INTERFACE_INFO of s_axi_wlast : signal is "xilinx.com:interface:aximm:1.0 S_AXI WLAST";
  attribute X_INTERFACE_INFO of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute X_INTERFACE_INFO of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute X_INTERFACE_INFO of m_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARADDR";
  attribute X_INTERFACE_INFO of m_axi_arburst : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARBURST";
  attribute X_INTERFACE_INFO of m_axi_arcache : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE";
  attribute X_INTERFACE_INFO of m_axi_arid : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARID";
  attribute X_INTERFACE_INFO of m_axi_arlen : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARLEN";
  attribute X_INTERFACE_INFO of m_axi_arlock : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK";
  attribute X_INTERFACE_INFO of m_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARPROT";
  attribute X_INTERFACE_INFO of m_axi_arqos : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARQOS";
  attribute X_INTERFACE_INFO of m_axi_arsize : signal is "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE";
  attribute X_INTERFACE_INFO of m_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWADDR";
  attribute X_INTERFACE_INFO of m_axi_awburst : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWBURST";
  attribute X_INTERFACE_INFO of m_axi_awcache : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE";
  attribute X_INTERFACE_INFO of m_axi_awid : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWID";
  attribute X_INTERFACE_MODE of m_axi_awid : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axi_awid : signal is "XIL_INTERFACENAME M_AXI, DATA_WIDTH 64, PROTOCOL AXI3, FREQ_HZ 50000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN bnn_accelerator_design_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axi_awlen : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWLEN";
  attribute X_INTERFACE_INFO of m_axi_awlock : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK";
  attribute X_INTERFACE_INFO of m_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWPROT";
  attribute X_INTERFACE_INFO of m_axi_awqos : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWQOS";
  attribute X_INTERFACE_INFO of m_axi_awsize : signal is "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE";
  attribute X_INTERFACE_INFO of m_axi_bid : signal is "xilinx.com:interface:aximm:1.0 M_AXI BID";
  attribute X_INTERFACE_INFO of m_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 M_AXI BRESP";
  attribute X_INTERFACE_INFO of m_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 M_AXI RDATA";
  attribute X_INTERFACE_INFO of m_axi_rid : signal is "xilinx.com:interface:aximm:1.0 M_AXI RID";
  attribute X_INTERFACE_INFO of m_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 M_AXI RRESP";
  attribute X_INTERFACE_INFO of m_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 M_AXI WDATA";
  attribute X_INTERFACE_INFO of m_axi_wid : signal is "xilinx.com:interface:aximm:1.0 M_AXI WID";
  attribute X_INTERFACE_INFO of m_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 M_AXI WSTRB";
  attribute X_INTERFACE_INFO of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute X_INTERFACE_INFO of s_axi_arburst : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARBURST";
  attribute X_INTERFACE_INFO of s_axi_arcache : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE";
  attribute X_INTERFACE_INFO of s_axi_arid : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARID";
  attribute X_INTERFACE_INFO of s_axi_arlen : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARLEN";
  attribute X_INTERFACE_INFO of s_axi_arlock : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK";
  attribute X_INTERFACE_INFO of s_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARPROT";
  attribute X_INTERFACE_INFO of s_axi_arqos : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARQOS";
  attribute X_INTERFACE_INFO of s_axi_arregion : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREGION";
  attribute X_INTERFACE_INFO of s_axi_arsize : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE";
  attribute X_INTERFACE_INFO of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute X_INTERFACE_INFO of s_axi_awburst : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWBURST";
  attribute X_INTERFACE_INFO of s_axi_awcache : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE";
  attribute X_INTERFACE_INFO of s_axi_awid : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWID";
  attribute X_INTERFACE_MODE of s_axi_awid : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axi_awid : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 64, PROTOCOL AXI4, FREQ_HZ 50000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 8, PHASE 0.0, CLK_DOMAIN bnn_accelerator_design_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_awlen : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWLEN";
  attribute X_INTERFACE_INFO of s_axi_awlock : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK";
  attribute X_INTERFACE_INFO of s_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWPROT";
  attribute X_INTERFACE_INFO of s_axi_awqos : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWQOS";
  attribute X_INTERFACE_INFO of s_axi_awregion : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREGION";
  attribute X_INTERFACE_INFO of s_axi_awsize : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE";
  attribute X_INTERFACE_INFO of s_axi_bid : signal is "xilinx.com:interface:aximm:1.0 S_AXI BID";
  attribute X_INTERFACE_INFO of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute X_INTERFACE_INFO of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute X_INTERFACE_INFO of s_axi_rid : signal is "xilinx.com:interface:aximm:1.0 S_AXI RID";
  attribute X_INTERFACE_INFO of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute X_INTERFACE_INFO of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute X_INTERFACE_INFO of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
begin
  m_axi_arlock(1) <= \<const0>\;
  m_axi_arlock(0) <= \^m_axi_arlock\(0);
  m_axi_awlock(1) <= \<const0>\;
  m_axi_awlock(0) <= \^m_axi_awlock\(0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.bnn_accelerator_design_axi_mem_intercon_imp_auto_pc_0_axi_protocol_converter_v2_1_33_axi_protocol_converter
     port map (
      aclk => aclk,
      aresetn => aresetn,
      m_axi_araddr(31 downto 0) => m_axi_araddr(31 downto 0),
      m_axi_arburst(1 downto 0) => m_axi_arburst(1 downto 0),
      m_axi_arcache(3 downto 0) => m_axi_arcache(3 downto 0),
      m_axi_arid(0) => m_axi_arid(0),
      m_axi_arlen(3 downto 0) => m_axi_arlen(3 downto 0),
      m_axi_arlock(1) => NLW_inst_m_axi_arlock_UNCONNECTED(1),
      m_axi_arlock(0) => \^m_axi_arlock\(0),
      m_axi_arprot(2 downto 0) => m_axi_arprot(2 downto 0),
      m_axi_arqos(3 downto 0) => m_axi_arqos(3 downto 0),
      m_axi_arready => m_axi_arready,
      m_axi_arregion(3 downto 0) => NLW_inst_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => m_axi_arsize(2 downto 0),
      m_axi_aruser(0) => NLW_inst_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => m_axi_arvalid,
      m_axi_awaddr(31 downto 0) => m_axi_awaddr(31 downto 0),
      m_axi_awburst(1 downto 0) => m_axi_awburst(1 downto 0),
      m_axi_awcache(3 downto 0) => m_axi_awcache(3 downto 0),
      m_axi_awid(0) => m_axi_awid(0),
      m_axi_awlen(3 downto 0) => m_axi_awlen(3 downto 0),
      m_axi_awlock(1) => NLW_inst_m_axi_awlock_UNCONNECTED(1),
      m_axi_awlock(0) => \^m_axi_awlock\(0),
      m_axi_awprot(2 downto 0) => m_axi_awprot(2 downto 0),
      m_axi_awqos(3 downto 0) => m_axi_awqos(3 downto 0),
      m_axi_awready => m_axi_awready,
      m_axi_awregion(3 downto 0) => NLW_inst_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => m_axi_awsize(2 downto 0),
      m_axi_awuser(0) => NLW_inst_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => m_axi_awvalid,
      m_axi_bid(0) => m_axi_bid(0),
      m_axi_bready => m_axi_bready,
      m_axi_bresp(1 downto 0) => m_axi_bresp(1 downto 0),
      m_axi_buser(0) => '0',
      m_axi_bvalid => m_axi_bvalid,
      m_axi_rdata(63 downto 0) => m_axi_rdata(63 downto 0),
      m_axi_rid(0) => m_axi_rid(0),
      m_axi_rlast => m_axi_rlast,
      m_axi_rready => m_axi_rready,
      m_axi_rresp(1 downto 0) => m_axi_rresp(1 downto 0),
      m_axi_ruser(0) => '0',
      m_axi_rvalid => m_axi_rvalid,
      m_axi_wdata(63 downto 0) => m_axi_wdata(63 downto 0),
      m_axi_wid(0) => m_axi_wid(0),
      m_axi_wlast => m_axi_wlast,
      m_axi_wready => m_axi_wready,
      m_axi_wstrb(7 downto 0) => m_axi_wstrb(7 downto 0),
      m_axi_wuser(0) => NLW_inst_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => m_axi_wvalid,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => s_axi_arburst(1 downto 0),
      s_axi_arcache(3 downto 0) => s_axi_arcache(3 downto 0),
      s_axi_arid(0) => s_axi_arid(0),
      s_axi_arlen(7 downto 0) => s_axi_arlen(7 downto 0),
      s_axi_arlock(0) => s_axi_arlock(0),
      s_axi_arprot(2 downto 0) => s_axi_arprot(2 downto 0),
      s_axi_arqos(3 downto 0) => s_axi_arqos(3 downto 0),
      s_axi_arready => s_axi_arready,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => s_axi_arsize(2 downto 0),
      s_axi_aruser(0) => '0',
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => s_axi_awburst(1 downto 0),
      s_axi_awcache(3 downto 0) => s_axi_awcache(3 downto 0),
      s_axi_awid(0) => s_axi_awid(0),
      s_axi_awlen(7 downto 0) => s_axi_awlen(7 downto 0),
      s_axi_awlock(0) => s_axi_awlock(0),
      s_axi_awprot(2 downto 0) => s_axi_awprot(2 downto 0),
      s_axi_awqos(3 downto 0) => s_axi_awqos(3 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => s_axi_awsize(2 downto 0),
      s_axi_awuser(0) => '0',
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bid(0) => s_axi_bid(0),
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      s_axi_buser(0) => NLW_inst_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(63 downto 0) => s_axi_rdata(63 downto 0),
      s_axi_rid(0) => s_axi_rid(0),
      s_axi_rlast => s_axi_rlast,
      s_axi_rready => s_axi_rready,
      s_axi_rresp(1 downto 0) => s_axi_rresp(1 downto 0),
      s_axi_ruser(0) => NLW_inst_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(63 downto 0) => s_axi_wdata(63 downto 0),
      s_axi_wid(0) => '0',
      s_axi_wlast => '0',
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(7 downto 0) => s_axi_wstrb(7 downto 0),
      s_axi_wuser(0) => '0',
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
