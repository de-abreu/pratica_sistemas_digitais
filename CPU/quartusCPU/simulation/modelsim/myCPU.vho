-- Copyright (C) 2021  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"

-- DATE "11/25/2024 11:49:44"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CentralProcessingUnit IS
    PORT (
	input : IN std_logic_vector(7 DOWNTO 0);
	clk : IN std_logic;
	set : IN std_logic;
	rst : IN std_logic;
	output : BUFFER std_logic_vector(7 DOWNTO 0);
	waiting : BUFFER std_logic
	);
END CentralProcessingUnit;

-- Design Ports Information
-- output[0]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[1]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[2]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[3]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[4]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[5]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[6]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- output[7]	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- waiting	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[0]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- set	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[1]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[2]	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[3]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[4]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[5]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[6]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[7]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF CentralProcessingUnit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_set : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_output : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_waiting : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[28]~feeder_combout\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[32]~feeder_combout\ : std_logic;
SIGNAL \set~input_o\ : std_logic;
SIGNAL \ControlUnit:opcode.HALT~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.HALT~q\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \ControlUnit:next_state.execute~q\ : std_logic;
SIGNAL \ControlUnit:next_state.memory_access~q\ : std_logic;
SIGNAL \Selector31~0_combout\ : std_logic;
SIGNAL \input[3]~input_o\ : std_logic;
SIGNAL \mem|mem~17feeder_combout\ : std_logic;
SIGNAL \mem|mem~17DUPLICATE_q\ : std_logic;
SIGNAL \ControlUnit:next_state.fetch~q\ : std_logic;
SIGNAL \Selector38~0_combout\ : std_logic;
SIGNAL \mem_write~q\ : std_logic;
SIGNAL \ControlUnit:pc[2]~feeder_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.DOUT~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.DOUT~q\ : std_logic;
SIGNAL \ControlUnit:opcode.NOP~1_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.NOP~q\ : std_logic;
SIGNAL \WideNor0~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.CMP~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.CMP~q\ : std_logic;
SIGNAL \ControlUnit:opcode.MOV~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.MOV~q\ : std_logic;
SIGNAL \input[7]~input_o\ : std_logic;
SIGNAL \mem|mem~57_combout\ : std_logic;
SIGNAL \mem|mem~25_q\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \ControlUnit:opcode.LNOT~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.LNOT~q\ : std_logic;
SIGNAL \ControlUnit:opcode.LOR~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.LOR~q\ : std_logic;
SIGNAL \ControlUnit:opcode.SUB~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.SUB~q\ : std_logic;
SIGNAL \Selector18~0_combout\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \ControlUnit:next_state.write_back~q\ : std_logic;
SIGNAL \Selector31~1_combout\ : std_logic;
SIGNAL \input[1]~input_o\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[30]~feeder_combout\ : std_logic;
SIGNAL \mem|mem~31_combout\ : std_logic;
SIGNAL \mem|mem~25DUPLICATE_q\ : std_logic;
SIGNAL \mem|mem~17_q\ : std_logic;
SIGNAL \mem|mem~32_combout\ : std_logic;
SIGNAL \mem|mem~56_combout\ : std_logic;
SIGNAL \mem|mem~24_q\ : std_logic;
SIGNAL \input[4]~input_o\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[26]~feeder_combout\ : std_logic;
SIGNAL \mem|mem~41_combout\ : std_logic;
SIGNAL \mem|mem~22_q\ : std_logic;
SIGNAL \input[5]~input_o\ : std_logic;
SIGNAL \mem|mem~23_q\ : std_logic;
SIGNAL \mem|mem~51_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \ControlUnit:pc[6]~q\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[24]~feeder_combout\ : std_logic;
SIGNAL \input[2]~input_o\ : std_logic;
SIGNAL \alu_in[0][2]~q\ : std_logic;
SIGNAL \alu_in[1][2]~feeder_combout\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[22]~feeder_combout\ : std_logic;
SIGNAL \mem|mem~20_q\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \mem|mem~47_combout\ : std_logic;
SIGNAL \mem|mem~48_combout\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[17]~0_combout\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[17]~DUPLICATE_q\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[18]~feeder_combout\ : std_logic;
SIGNAL \mem|mem~55_combout\ : std_logic;
SIGNAL \mem|mem~18DUPLICATE_q\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \mem|mem~43_combout\ : std_logic;
SIGNAL \mem|mem~44_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.HALT~1_combout\ : std_logic;
SIGNAL \rs[1][0]~q\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[20]~feeder_combout\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[19]~3_combout\ : std_logic;
SIGNAL \mem|mem~58_combout\ : std_logic;
SIGNAL \mem|mem~19_q\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \mem|mem~45_combout\ : std_logic;
SIGNAL \mem|mem~46_combout\ : std_logic;
SIGNAL \rs[1][1]~q\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \alu_in[1][2]~q\ : std_logic;
SIGNAL \alu_in[0][1]~q\ : std_logic;
SIGNAL \alu_in[0][0]~q\ : std_logic;
SIGNAL \alu_in[1][0]~feeder_combout\ : std_logic;
SIGNAL \alu_in[1][0]~q\ : std_logic;
SIGNAL \alu|Add0~34_cout\ : std_logic;
SIGNAL \alu|Add0~2\ : std_logic;
SIGNAL \alu|Add0~6\ : std_logic;
SIGNAL \alu|Add0~9_sumout\ : std_logic;
SIGNAL \alu|Selector5~0_combout\ : std_logic;
SIGNAL \alu_op.SUB~q\ : std_logic;
SIGNAL \alu_op.LOR~q\ : std_logic;
SIGNAL \alu_op.LNOT~q\ : std_logic;
SIGNAL \alu|Selector5~1_combout\ : std_logic;
SIGNAL \alu|Selector5~2_combout\ : std_logic;
SIGNAL \alu|Selector5~3_combout\ : std_logic;
SIGNAL \mem|mem~39_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \Selector15~1_combout\ : std_logic;
SIGNAL \wb[0]~0_combout\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \mem|mem~49_combout\ : std_logic;
SIGNAL \mem|mem~50_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \ControlUnit:pc[3]~feeder_combout\ : std_logic;
SIGNAL \ControlUnit:pc[3]~q\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \ControlUnit:pc[4]~feeder_combout\ : std_logic;
SIGNAL \ControlUnit:pc[4]~q\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \ControlUnit:pc[5]~q\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Selector30~0_combout\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \mem|mem~42_combout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \Selector12~1_combout\ : std_logic;
SIGNAL \alu_in[0][5]~q\ : std_logic;
SIGNAL \alu_in[1][5]~feeder_combout\ : std_logic;
SIGNAL \alu_in[1][5]~q\ : std_logic;
SIGNAL \alu_in[1][4]~feeder_combout\ : std_logic;
SIGNAL \alu_in[1][4]~q\ : std_logic;
SIGNAL \alu_in[0][3]~q\ : std_logic;
SIGNAL \alu|Add0~10\ : std_logic;
SIGNAL \alu|Add0~14\ : std_logic;
SIGNAL \alu|Add0~18\ : std_logic;
SIGNAL \alu|Add0~21_sumout\ : std_logic;
SIGNAL \alu|Selector2~1_combout\ : std_logic;
SIGNAL \alu|Selector2~0_combout\ : std_logic;
SIGNAL \alu|Selector2~2_combout\ : std_logic;
SIGNAL \Selector31~2_combout\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \Selector13~1_combout\ : std_logic;
SIGNAL \alu_in[0][4]~q\ : std_logic;
SIGNAL \alu|Selector3~0_combout\ : std_logic;
SIGNAL \alu|Selector3~1_combout\ : std_logic;
SIGNAL \alu|Add0~17_sumout\ : std_logic;
SIGNAL \alu|Selector3~2_combout\ : std_logic;
SIGNAL \Selector32~0_combout\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \mem|mem~30_combout\ : std_logic;
SIGNAL \RotateRight0~1_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.LOAD~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.LOAD~q\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \mem|mem~38_combout\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \Selector16~1_combout\ : std_logic;
SIGNAL \alu_in[1][1]~feeder_combout\ : std_logic;
SIGNAL \alu_in[1][1]~q\ : std_logic;
SIGNAL \alu|Selector6~0_combout\ : std_logic;
SIGNAL \alu|WideNor0~combout\ : std_logic;
SIGNAL \alu|Add0~5_sumout\ : std_logic;
SIGNAL \alu|Selector6~1_combout\ : std_logic;
SIGNAL \Selector35~0_combout\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \Selector10~1_combout\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[31]~2_combout\ : std_logic;
SIGNAL \RotateRight0~2_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.JMP~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.JMP~q\ : std_logic;
SIGNAL \ControlUnit:opcode.JEQ~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.JEQ~q\ : std_logic;
SIGNAL \alu_op.HALT~0_combout\ : std_logic;
SIGNAL \alu_op.CMP~q\ : std_logic;
SIGNAL \alu|WideNor0~0_combout\ : std_logic;
SIGNAL \alu|Add0~1_sumout\ : std_logic;
SIGNAL \alu|Add0~13_sumout\ : std_logic;
SIGNAL \alu|Equal0~0_combout\ : std_logic;
SIGNAL \alu_in[0][7]~q\ : std_logic;
SIGNAL \alu_in[1][7]~feeder_combout\ : std_logic;
SIGNAL \mem|mem~52_combout\ : std_logic;
SIGNAL \alu_in[1][7]~q\ : std_logic;
SIGNAL \alu_in[1][6]~feeder_combout\ : std_logic;
SIGNAL \alu_in[1][6]~q\ : std_logic;
SIGNAL \alu_in[0][6]~q\ : std_logic;
SIGNAL \alu|Add0~22\ : std_logic;
SIGNAL \alu|Add0~26\ : std_logic;
SIGNAL \alu|Add0~29_sumout\ : std_logic;
SIGNAL \alu|Add0~30\ : std_logic;
SIGNAL \alu|Add0~37_sumout\ : std_logic;
SIGNAL \alu|Equal0~1_combout\ : std_logic;
SIGNAL \alu|zero~combout\ : std_logic;
SIGNAL \alu|signal_bit~combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \ControlUnit:pc[1]~q\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \ControlUnit:pc[2]~q\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector34~0_combout\ : std_logic;
SIGNAL \mem|mem~53_combout\ : std_logic;
SIGNAL \mem|mem~54_combout\ : std_logic;
SIGNAL \mem|mem~21_q\ : std_logic;
SIGNAL \mem|mem~40_combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \Selector14~1_combout\ : std_logic;
SIGNAL \alu_in[1][3]~feeder_combout\ : std_logic;
SIGNAL \alu_in[1][3]~q\ : std_logic;
SIGNAL \alu|Selector4~0_combout\ : std_logic;
SIGNAL \alu|Selector4~1_combout\ : std_logic;
SIGNAL \alu|Selector4~2_combout\ : std_logic;
SIGNAL \Selector33~0_combout\ : std_logic;
SIGNAL \mem|mem~28_combout\ : std_logic;
SIGNAL \mem|mem~33_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.NOP~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.ADD~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.ADD~q\ : std_logic;
SIGNAL \alu_op.ADD~q\ : std_logic;
SIGNAL \alu|Add0~25_sumout\ : std_logic;
SIGNAL \alu|Selector1~1_combout\ : std_logic;
SIGNAL \alu|Selector1~0_combout\ : std_logic;
SIGNAL \alu|Selector1~2_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \input[6]~input_o\ : std_logic;
SIGNAL \Selector11~1_combout\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass[29]~1_combout\ : std_logic;
SIGNAL \RotateRight0~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.DIN~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.DIN~q\ : std_logic;
SIGNAL \Selector18~1_combout\ : std_logic;
SIGNAL \ControlUnit:next_state.fetch~DUPLICATE_q\ : std_logic;
SIGNAL \ControlUnit:opcode.LAND~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.LAND~q\ : std_logic;
SIGNAL \alu_op.LAND~q\ : std_logic;
SIGNAL \alu|Selector0~0_combout\ : std_logic;
SIGNAL \alu|Selector0~1_combout\ : std_logic;
SIGNAL \alu|Selector0~2_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \ControlUnit:pc[7]~q\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \Selector29~0_combout\ : std_logic;
SIGNAL \mem|mem~26_combout\ : std_logic;
SIGNAL \mem|mem~36_combout\ : std_logic;
SIGNAL \mem|mem~37_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.JGR~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.JGR~q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \ControlUnit:pc[0]~q\ : std_logic;
SIGNAL \alu|Selector7~0_combout\ : std_logic;
SIGNAL \alu|Selector7~1_combout\ : std_logic;
SIGNAL \Selector36~0_combout\ : std_logic;
SIGNAL \mem|mem~27_combout\ : std_logic;
SIGNAL \mem|mem~34_combout\ : std_logic;
SIGNAL \mem|mem~35_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.STORE~0_combout\ : std_logic;
SIGNAL \ControlUnit:opcode.STORE~q\ : std_logic;
SIGNAL \next_state~1_combout\ : std_logic;
SIGNAL \input[0]~input_o\ : std_logic;
SIGNAL \mem|mem~18_q\ : std_logic;
SIGNAL \mem|mem~29_combout\ : std_logic;
SIGNAL \Selector17~1_combout\ : std_logic;
SIGNAL \Selector17~2_combout\ : std_logic;
SIGNAL \output[0]~reg0feeder_combout\ : std_logic;
SIGNAL \output[0]~0_combout\ : std_logic;
SIGNAL \output[0]~reg0_q\ : std_logic;
SIGNAL \output[1]~reg0_q\ : std_logic;
SIGNAL \output[2]~reg0_q\ : std_logic;
SIGNAL \output[3]~reg0_q\ : std_logic;
SIGNAL \output[4]~reg0_q\ : std_logic;
SIGNAL \output[5]~reg0_q\ : std_logic;
SIGNAL \output[6]~reg0_q\ : std_logic;
SIGNAL \output[7]~reg0_q\ : std_logic;
SIGNAL \Selector37~0_combout\ : std_logic;
SIGNAL \waiting~reg0_q\ : std_logic;
SIGNAL \mem|mem_rtl_0_bypass\ : std_logic_vector(0 TO 32);
SIGNAL wb : std_logic_vector(7 DOWNTO 0);
SIGNAL address : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_alu_in[0][1]~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.HALT~q\ : std_logic;
SIGNAL \mem|ALT_INV_mem~37_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem_rtl_0_bypass\ : std_logic_vector(32 DOWNTO 0);
SIGNAL \mem|ALT_INV_mem~36_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~22_q\ : std_logic;
SIGNAL \mem|ALT_INV_mem~35_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~34_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~23_q\ : std_logic;
SIGNAL \ALT_INV_RotateRight0~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~33_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~32_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~25_q\ : std_logic;
SIGNAL \mem|ALT_INV_mem~31_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~30_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~24_q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:next_state.write_back~q\ : std_logic;
SIGNAL \ALT_INV_Selector17~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector17~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~29_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~28_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~27_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~26_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~18_q\ : std_logic;
SIGNAL \mem|ALT_INV_mem~17_q\ : std_logic;
SIGNAL \alu|ALT_INV_Selector7~1_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector7~0_combout\ : std_logic;
SIGNAL \ALT_INV_alu_in[0][0]~q\ : std_logic;
SIGNAL \alu|ALT_INV_WideNor0~combout\ : std_logic;
SIGNAL \ALT_INV_alu_op.LNOT~q\ : std_logic;
SIGNAL \ALT_INV_alu_op.LOR~q\ : std_logic;
SIGNAL \ALT_INV_alu_op.LAND~q\ : std_logic;
SIGNAL \alu|ALT_INV_WideNor0~0_combout\ : std_logic;
SIGNAL \ALT_INV_alu_op.CMP~q\ : std_logic;
SIGNAL \ALT_INV_alu_op.SUB~q\ : std_logic;
SIGNAL \ALT_INV_alu_op.ADD~q\ : std_logic;
SIGNAL \ALT_INV_next_state~1_combout\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.STORE~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.LOAD~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.MOV~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:next_state.fetch~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.DIN~q\ : std_logic;
SIGNAL ALT_INV_wb : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_ControlUnit:next_state.execute~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.DOUT~q\ : std_logic;
SIGNAL \ALT_INV_waiting~reg0_q\ : std_logic;
SIGNAL \ALT_INV_Selector3~2_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:pc[7]~q\ : std_logic;
SIGNAL \ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:pc[6]~q\ : std_logic;
SIGNAL \ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:pc[5]~q\ : std_logic;
SIGNAL \ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:pc[4]~q\ : std_logic;
SIGNAL \ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:pc[3]~q\ : std_logic;
SIGNAL \ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:pc[2]~q\ : std_logic;
SIGNAL \ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:pc[1]~q\ : std_logic;
SIGNAL \ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:pc[0]~q\ : std_logic;
SIGNAL \ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \alu|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \ALT_INV_alu_in[1][7]~q\ : std_logic;
SIGNAL \alu|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \ALT_INV_alu_in[1][6]~q\ : std_logic;
SIGNAL \alu|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \ALT_INV_alu_in[1][5]~q\ : std_logic;
SIGNAL \alu|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \ALT_INV_alu_in[1][4]~q\ : std_logic;
SIGNAL \alu|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \ALT_INV_alu_in[1][3]~q\ : std_logic;
SIGNAL \alu|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \ALT_INV_alu_in[1][2]~q\ : std_logic;
SIGNAL \alu|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \ALT_INV_alu_in[1][1]~q\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a1\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a2\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a3\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a4\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a5\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a6\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a7\ : std_logic;
SIGNAL \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\ : std_logic;
SIGNAL \alu|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \ALT_INV_alu_in[1][0]~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:next_state.memory_access~q\ : std_logic;
SIGNAL \ALT_INV_RotateRight0~2_combout\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.NOP~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~53_combout\ : std_logic;
SIGNAL \ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~52_combout\ : std_logic;
SIGNAL \ALT_INV_Selector1~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~51_combout\ : std_logic;
SIGNAL \ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector3~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector4~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~50_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~49_combout\ : std_logic;
SIGNAL \ALT_INV_Selector5~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~48_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~47_combout\ : std_logic;
SIGNAL \ALT_INV_Selector6~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~46_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~45_combout\ : std_logic;
SIGNAL \ALT_INV_Selector31~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector31~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector7~0_combout\ : std_logic;
SIGNAL \ALT_INV_Selector3~0_combout\ : std_logic;
SIGNAL ALT_INV_address : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_mem_write~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.CMP~q\ : std_logic;
SIGNAL \ALT_INV_WideNor0~0_combout\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.NOP~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.JGR~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.JEQ~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.JMP~q\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_rs[1][0]~q\ : std_logic;
SIGNAL \ALT_INV_rs[1][1]~q\ : std_logic;
SIGNAL \mem|ALT_INV_mem~44_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~43_combout\ : std_logic;
SIGNAL \ALT_INV_RotateRight0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Selector18~0_combout\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.LNOT~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.LOR~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.LAND~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.SUB~q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:opcode.ADD~q\ : std_logic;
SIGNAL \ALT_INV_Selector10~0_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector0~2_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector0~1_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \ALT_INV_alu_in[0][7]~q\ : std_logic;
SIGNAL \ALT_INV_Selector11~0_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector1~2_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector1~1_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector1~0_combout\ : std_logic;
SIGNAL \ALT_INV_alu_in[0][6]~q\ : std_logic;
SIGNAL \ALT_INV_Selector12~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~42_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector2~2_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector2~1_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \ALT_INV_alu_in[0][5]~q\ : std_logic;
SIGNAL \ALT_INV_Selector13~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~41_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector3~2_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector3~1_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector3~0_combout\ : std_logic;
SIGNAL \ALT_INV_alu_in[0][4]~q\ : std_logic;
SIGNAL \ALT_INV_Selector14~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~40_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~21_q\ : std_logic;
SIGNAL \alu|ALT_INV_Selector4~2_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector4~1_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector4~0_combout\ : std_logic;
SIGNAL \ALT_INV_alu_in[0][3]~q\ : std_logic;
SIGNAL \ALT_INV_Selector15~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~39_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~20_q\ : std_logic;
SIGNAL \alu|ALT_INV_Selector5~3_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector5~2_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector5~1_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector5~0_combout\ : std_logic;
SIGNAL \ALT_INV_alu_in[0][2]~q\ : std_logic;
SIGNAL \ALT_INV_Selector16~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~38_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~19_q\ : std_logic;
SIGNAL \alu|ALT_INV_Selector6~1_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Selector6~0_combout\ : std_logic;
SIGNAL \mem|ALT_INV_mem~25DUPLICATE_q\ : std_logic;
SIGNAL \mem|ALT_INV_mem_rtl_0_bypass[17]~DUPLICATE_q\ : std_logic;
SIGNAL \mem|ALT_INV_mem~18DUPLICATE_q\ : std_logic;
SIGNAL \mem|ALT_INV_mem~17DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_input[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_input[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_set~input_o\ : std_logic;
SIGNAL \ALT_INV_input[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \alu|ALT_INV_signal_bit~combout\ : std_logic;
SIGNAL \alu|ALT_INV_zero~combout\ : std_logic;
SIGNAL \alu|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \alu|ALT_INV_Equal0~0_combout\ : std_logic;

BEGIN

ww_input <= input;
ww_clk <= clk;
ww_set <= set;
ww_rst <= rst;
output <= ww_output;
waiting <= ww_waiting;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\mem|mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& wb(7) & wb(6) & wb(5) & wb(4) & wb(3) & wb(2) & wb(1) & wb(0));

\mem|mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (address(7) & address(6) & address(5) & address(4) & address(3) & address(2) & address(1) & address(0));

\mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\Selector29~0_combout\ & \Selector30~0_combout\ & \Selector31~2_combout\ & \Selector32~0_combout\ & \Selector33~0_combout\ & \Selector34~0_combout\ & \Selector35~0_combout\ & 
\Selector36~0_combout\);

\mem|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\mem|mem_rtl_0|auto_generated|ram_block1a1\ <= \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\mem|mem_rtl_0|auto_generated|ram_block1a2\ <= \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\mem|mem_rtl_0|auto_generated|ram_block1a3\ <= \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\mem|mem_rtl_0|auto_generated|ram_block1a4\ <= \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\mem|mem_rtl_0|auto_generated|ram_block1a5\ <= \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\mem|mem_rtl_0|auto_generated|ram_block1a6\ <= \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\mem|mem_rtl_0|auto_generated|ram_block1a7\ <= \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\ALT_INV_alu_in[0][1]~q\ <= NOT \alu_in[0][1]~q\;
\ALT_INV_ControlUnit:opcode.HALT~q\ <= NOT \ControlUnit:opcode.HALT~q\;
\mem|ALT_INV_mem~37_combout\ <= NOT \mem|mem~37_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(25) <= NOT \mem|mem_rtl_0_bypass\(25);
\mem|ALT_INV_mem_rtl_0_bypass\(26) <= NOT \mem|mem_rtl_0_bypass\(26);
\mem|ALT_INV_mem~36_combout\ <= NOT \mem|mem~36_combout\;
\mem|ALT_INV_mem~22_q\ <= NOT \mem|mem~22_q\;
\mem|ALT_INV_mem~35_combout\ <= NOT \mem|mem~35_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(27) <= NOT \mem|mem_rtl_0_bypass\(27);
\mem|ALT_INV_mem_rtl_0_bypass\(28) <= NOT \mem|mem_rtl_0_bypass\(28);
\mem|ALT_INV_mem~34_combout\ <= NOT \mem|mem~34_combout\;
\mem|ALT_INV_mem~23_q\ <= NOT \mem|mem~23_q\;
\ALT_INV_RotateRight0~0_combout\ <= NOT \RotateRight0~0_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(31) <= NOT \mem|mem_rtl_0_bypass\(31);
\mem|ALT_INV_mem~33_combout\ <= NOT \mem|mem~33_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(32) <= NOT \mem|mem_rtl_0_bypass\(32);
\mem|ALT_INV_mem~32_combout\ <= NOT \mem|mem~32_combout\;
\mem|ALT_INV_mem~25_q\ <= NOT \mem|mem~25_q\;
\mem|ALT_INV_mem_rtl_0_bypass\(29) <= NOT \mem|mem_rtl_0_bypass\(29);
\mem|ALT_INV_mem~31_combout\ <= NOT \mem|mem~31_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(30) <= NOT \mem|mem_rtl_0_bypass\(30);
\mem|ALT_INV_mem~30_combout\ <= NOT \mem|mem~30_combout\;
\mem|ALT_INV_mem~24_q\ <= NOT \mem|mem~24_q\;
\ALT_INV_ControlUnit:next_state.write_back~q\ <= NOT \ControlUnit:next_state.write_back~q\;
\ALT_INV_Selector17~1_combout\ <= NOT \Selector17~1_combout\;
\ALT_INV_Selector17~0_combout\ <= NOT \Selector17~0_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(17) <= NOT \mem|mem_rtl_0_bypass\(17);
\mem|ALT_INV_mem~29_combout\ <= NOT \mem|mem~29_combout\;
\mem|ALT_INV_mem~28_combout\ <= NOT \mem|mem~28_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(10) <= NOT \mem|mem_rtl_0_bypass\(10);
\mem|ALT_INV_mem_rtl_0_bypass\(9) <= NOT \mem|mem_rtl_0_bypass\(9);
\mem|ALT_INV_mem_rtl_0_bypass\(8) <= NOT \mem|mem_rtl_0_bypass\(8);
\mem|ALT_INV_mem_rtl_0_bypass\(7) <= NOT \mem|mem_rtl_0_bypass\(7);
\mem|ALT_INV_mem_rtl_0_bypass\(6) <= NOT \mem|mem_rtl_0_bypass\(6);
\mem|ALT_INV_mem_rtl_0_bypass\(5) <= NOT \mem|mem_rtl_0_bypass\(5);
\mem|ALT_INV_mem~27_combout\ <= NOT \mem|mem~27_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(4) <= NOT \mem|mem_rtl_0_bypass\(4);
\mem|ALT_INV_mem_rtl_0_bypass\(3) <= NOT \mem|mem_rtl_0_bypass\(3);
\mem|ALT_INV_mem_rtl_0_bypass\(2) <= NOT \mem|mem_rtl_0_bypass\(2);
\mem|ALT_INV_mem_rtl_0_bypass\(1) <= NOT \mem|mem_rtl_0_bypass\(1);
\mem|ALT_INV_mem_rtl_0_bypass\(0) <= NOT \mem|mem_rtl_0_bypass\(0);
\mem|ALT_INV_mem~26_combout\ <= NOT \mem|mem~26_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(16) <= NOT \mem|mem_rtl_0_bypass\(16);
\mem|ALT_INV_mem_rtl_0_bypass\(15) <= NOT \mem|mem_rtl_0_bypass\(15);
\mem|ALT_INV_mem_rtl_0_bypass\(14) <= NOT \mem|mem_rtl_0_bypass\(14);
\mem|ALT_INV_mem_rtl_0_bypass\(13) <= NOT \mem|mem_rtl_0_bypass\(13);
\mem|ALT_INV_mem_rtl_0_bypass\(12) <= NOT \mem|mem_rtl_0_bypass\(12);
\mem|ALT_INV_mem_rtl_0_bypass\(11) <= NOT \mem|mem_rtl_0_bypass\(11);
\mem|ALT_INV_mem_rtl_0_bypass\(18) <= NOT \mem|mem_rtl_0_bypass\(18);
\mem|ALT_INV_mem~18_q\ <= NOT \mem|mem~18_q\;
\mem|ALT_INV_mem~17_q\ <= NOT \mem|mem~17_q\;
\alu|ALT_INV_Selector7~1_combout\ <= NOT \alu|Selector7~1_combout\;
\alu|ALT_INV_Selector7~0_combout\ <= NOT \alu|Selector7~0_combout\;
\ALT_INV_alu_in[0][0]~q\ <= NOT \alu_in[0][0]~q\;
\alu|ALT_INV_WideNor0~combout\ <= NOT \alu|WideNor0~combout\;
\ALT_INV_alu_op.LNOT~q\ <= NOT \alu_op.LNOT~q\;
\ALT_INV_alu_op.LOR~q\ <= NOT \alu_op.LOR~q\;
\ALT_INV_alu_op.LAND~q\ <= NOT \alu_op.LAND~q\;
\alu|ALT_INV_WideNor0~0_combout\ <= NOT \alu|WideNor0~0_combout\;
\ALT_INV_alu_op.CMP~q\ <= NOT \alu_op.CMP~q\;
\ALT_INV_alu_op.SUB~q\ <= NOT \alu_op.SUB~q\;
\ALT_INV_alu_op.ADD~q\ <= NOT \alu_op.ADD~q\;
\ALT_INV_next_state~1_combout\ <= NOT \next_state~1_combout\;
\ALT_INV_ControlUnit:opcode.STORE~q\ <= NOT \ControlUnit:opcode.STORE~q\;
\ALT_INV_ControlUnit:opcode.LOAD~q\ <= NOT \ControlUnit:opcode.LOAD~q\;
\ALT_INV_ControlUnit:opcode.MOV~q\ <= NOT \ControlUnit:opcode.MOV~q\;
\ALT_INV_ControlUnit:next_state.fetch~q\ <= NOT \ControlUnit:next_state.fetch~q\;
\ALT_INV_ControlUnit:opcode.DIN~q\ <= NOT \ControlUnit:opcode.DIN~q\;
ALT_INV_wb(7) <= NOT wb(7);
ALT_INV_wb(6) <= NOT wb(6);
ALT_INV_wb(5) <= NOT wb(5);
ALT_INV_wb(4) <= NOT wb(4);
ALT_INV_wb(3) <= NOT wb(3);
ALT_INV_wb(2) <= NOT wb(2);
ALT_INV_wb(1) <= NOT wb(1);
\ALT_INV_ControlUnit:next_state.execute~q\ <= NOT \ControlUnit:next_state.execute~q\;
\ALT_INV_ControlUnit:opcode.DOUT~q\ <= NOT \ControlUnit:opcode.DOUT~q\;
ALT_INV_wb(0) <= NOT wb(0);
\ALT_INV_waiting~reg0_q\ <= NOT \waiting~reg0_q\;
\ALT_INV_Selector3~2_combout\ <= NOT \Selector3~2_combout\;
\alu|ALT_INV_Add0~37_sumout\ <= NOT \alu|Add0~37_sumout\;
\ALT_INV_ControlUnit:pc[7]~q\ <= NOT \ControlUnit:pc[7]~q\;
\ALT_INV_Add0~29_sumout\ <= NOT \Add0~29_sumout\;
\ALT_INV_ControlUnit:pc[6]~q\ <= NOT \ControlUnit:pc[6]~q\;
\ALT_INV_Add0~25_sumout\ <= NOT \Add0~25_sumout\;
\ALT_INV_ControlUnit:pc[5]~q\ <= NOT \ControlUnit:pc[5]~q\;
\ALT_INV_Add0~21_sumout\ <= NOT \Add0~21_sumout\;
\ALT_INV_ControlUnit:pc[4]~q\ <= NOT \ControlUnit:pc[4]~q\;
\ALT_INV_Add0~17_sumout\ <= NOT \Add0~17_sumout\;
\ALT_INV_ControlUnit:pc[3]~q\ <= NOT \ControlUnit:pc[3]~q\;
\ALT_INV_Add0~13_sumout\ <= NOT \Add0~13_sumout\;
\ALT_INV_ControlUnit:pc[2]~q\ <= NOT \ControlUnit:pc[2]~q\;
\ALT_INV_Add0~9_sumout\ <= NOT \Add0~9_sumout\;
\ALT_INV_ControlUnit:pc[1]~q\ <= NOT \ControlUnit:pc[1]~q\;
\ALT_INV_Add0~5_sumout\ <= NOT \Add0~5_sumout\;
\ALT_INV_ControlUnit:pc[0]~q\ <= NOT \ControlUnit:pc[0]~q\;
\ALT_INV_Add0~1_sumout\ <= NOT \Add0~1_sumout\;
\alu|ALT_INV_Add0~29_sumout\ <= NOT \alu|Add0~29_sumout\;
\ALT_INV_alu_in[1][7]~q\ <= NOT \alu_in[1][7]~q\;
\alu|ALT_INV_Add0~25_sumout\ <= NOT \alu|Add0~25_sumout\;
\ALT_INV_alu_in[1][6]~q\ <= NOT \alu_in[1][6]~q\;
\alu|ALT_INV_Add0~21_sumout\ <= NOT \alu|Add0~21_sumout\;
\ALT_INV_alu_in[1][5]~q\ <= NOT \alu_in[1][5]~q\;
\alu|ALT_INV_Add0~17_sumout\ <= NOT \alu|Add0~17_sumout\;
\ALT_INV_alu_in[1][4]~q\ <= NOT \alu_in[1][4]~q\;
\alu|ALT_INV_Add0~13_sumout\ <= NOT \alu|Add0~13_sumout\;
\ALT_INV_alu_in[1][3]~q\ <= NOT \alu_in[1][3]~q\;
\alu|ALT_INV_Add0~9_sumout\ <= NOT \alu|Add0~9_sumout\;
\ALT_INV_alu_in[1][2]~q\ <= NOT \alu_in[1][2]~q\;
\alu|ALT_INV_Add0~5_sumout\ <= NOT \alu|Add0~5_sumout\;
\ALT_INV_alu_in[1][1]~q\ <= NOT \alu_in[1][1]~q\;
\mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a1\ <= NOT \mem|mem_rtl_0|auto_generated|ram_block1a1\;
\mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a2\ <= NOT \mem|mem_rtl_0|auto_generated|ram_block1a2\;
\mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a3\ <= NOT \mem|mem_rtl_0|auto_generated|ram_block1a3\;
\mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a4\ <= NOT \mem|mem_rtl_0|auto_generated|ram_block1a4\;
\mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a5\ <= NOT \mem|mem_rtl_0|auto_generated|ram_block1a5\;
\mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a6\ <= NOT \mem|mem_rtl_0|auto_generated|ram_block1a6\;
\mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a7\ <= NOT \mem|mem_rtl_0|auto_generated|ram_block1a7\;
\mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\ <= NOT \mem|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\;
\alu|ALT_INV_Add0~1_sumout\ <= NOT \alu|Add0~1_sumout\;
\ALT_INV_alu_in[1][0]~q\ <= NOT \alu_in[1][0]~q\;
\ALT_INV_ControlUnit:next_state.memory_access~q\ <= NOT \ControlUnit:next_state.memory_access~q\;
\ALT_INV_RotateRight0~2_combout\ <= NOT \RotateRight0~2_combout\;
\ALT_INV_ControlUnit:opcode.NOP~0_combout\ <= NOT \ControlUnit:opcode.NOP~0_combout\;
\mem|ALT_INV_mem~53_combout\ <= NOT \mem|mem~53_combout\;
\ALT_INV_Selector0~0_combout\ <= NOT \Selector0~0_combout\;
\mem|ALT_INV_mem~52_combout\ <= NOT \mem|mem~52_combout\;
\ALT_INV_Selector1~0_combout\ <= NOT \Selector1~0_combout\;
\mem|ALT_INV_mem~51_combout\ <= NOT \mem|mem~51_combout\;
\ALT_INV_Selector2~0_combout\ <= NOT \Selector2~0_combout\;
\ALT_INV_Selector3~1_combout\ <= NOT \Selector3~1_combout\;
\ALT_INV_Selector4~0_combout\ <= NOT \Selector4~0_combout\;
\mem|ALT_INV_mem~50_combout\ <= NOT \mem|mem~50_combout\;
\mem|ALT_INV_mem~49_combout\ <= NOT \mem|mem~49_combout\;
\ALT_INV_Selector5~0_combout\ <= NOT \Selector5~0_combout\;
\mem|ALT_INV_mem~48_combout\ <= NOT \mem|mem~48_combout\;
\mem|ALT_INV_mem~47_combout\ <= NOT \mem|mem~47_combout\;
\ALT_INV_Selector6~0_combout\ <= NOT \Selector6~0_combout\;
\mem|ALT_INV_mem~46_combout\ <= NOT \mem|mem~46_combout\;
\mem|ALT_INV_mem~45_combout\ <= NOT \mem|mem~45_combout\;
\ALT_INV_Selector31~1_combout\ <= NOT \Selector31~1_combout\;
\ALT_INV_Selector31~0_combout\ <= NOT \Selector31~0_combout\;
\ALT_INV_Selector7~0_combout\ <= NOT \Selector7~0_combout\;
\ALT_INV_Selector3~0_combout\ <= NOT \Selector3~0_combout\;
ALT_INV_address(7) <= NOT address(7);
ALT_INV_address(6) <= NOT address(6);
ALT_INV_address(5) <= NOT address(5);
ALT_INV_address(4) <= NOT address(4);
ALT_INV_address(3) <= NOT address(3);
ALT_INV_address(2) <= NOT address(2);
ALT_INV_address(1) <= NOT address(1);
ALT_INV_address(0) <= NOT address(0);
\ALT_INV_mem_write~q\ <= NOT \mem_write~q\;
\ALT_INV_ControlUnit:opcode.CMP~q\ <= NOT \ControlUnit:opcode.CMP~q\;
\ALT_INV_WideNor0~0_combout\ <= NOT \WideNor0~0_combout\;
\ALT_INV_ControlUnit:opcode.NOP~q\ <= NOT \ControlUnit:opcode.NOP~q\;
\ALT_INV_ControlUnit:opcode.JGR~q\ <= NOT \ControlUnit:opcode.JGR~q\;
\ALT_INV_ControlUnit:opcode.JEQ~q\ <= NOT \ControlUnit:opcode.JEQ~q\;
\ALT_INV_ControlUnit:opcode.JMP~q\ <= NOT \ControlUnit:opcode.JMP~q\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_rs[1][0]~q\ <= NOT \rs[1][0]~q\;
\ALT_INV_rs[1][1]~q\ <= NOT \rs[1][1]~q\;
\mem|ALT_INV_mem~44_combout\ <= NOT \mem|mem~44_combout\;
\mem|ALT_INV_mem~43_combout\ <= NOT \mem|mem~43_combout\;
\ALT_INV_RotateRight0~1_combout\ <= NOT \RotateRight0~1_combout\;
\ALT_INV_Selector18~0_combout\ <= NOT \Selector18~0_combout\;
\ALT_INV_ControlUnit:opcode.LNOT~q\ <= NOT \ControlUnit:opcode.LNOT~q\;
\ALT_INV_ControlUnit:opcode.LOR~q\ <= NOT \ControlUnit:opcode.LOR~q\;
\ALT_INV_ControlUnit:opcode.LAND~q\ <= NOT \ControlUnit:opcode.LAND~q\;
\ALT_INV_ControlUnit:opcode.SUB~q\ <= NOT \ControlUnit:opcode.SUB~q\;
\ALT_INV_ControlUnit:opcode.ADD~q\ <= NOT \ControlUnit:opcode.ADD~q\;
\ALT_INV_Selector10~0_combout\ <= NOT \Selector10~0_combout\;
\alu|ALT_INV_Selector0~2_combout\ <= NOT \alu|Selector0~2_combout\;
\alu|ALT_INV_Selector0~1_combout\ <= NOT \alu|Selector0~1_combout\;
\alu|ALT_INV_Selector0~0_combout\ <= NOT \alu|Selector0~0_combout\;
\ALT_INV_alu_in[0][7]~q\ <= NOT \alu_in[0][7]~q\;
\ALT_INV_Selector11~0_combout\ <= NOT \Selector11~0_combout\;
\alu|ALT_INV_Selector1~2_combout\ <= NOT \alu|Selector1~2_combout\;
\alu|ALT_INV_Selector1~1_combout\ <= NOT \alu|Selector1~1_combout\;
\alu|ALT_INV_Selector1~0_combout\ <= NOT \alu|Selector1~0_combout\;
\ALT_INV_alu_in[0][6]~q\ <= NOT \alu_in[0][6]~q\;
\ALT_INV_Selector12~0_combout\ <= NOT \Selector12~0_combout\;
\mem|ALT_INV_mem~42_combout\ <= NOT \mem|mem~42_combout\;
\alu|ALT_INV_Selector2~2_combout\ <= NOT \alu|Selector2~2_combout\;
\alu|ALT_INV_Selector2~1_combout\ <= NOT \alu|Selector2~1_combout\;
\alu|ALT_INV_Selector2~0_combout\ <= NOT \alu|Selector2~0_combout\;
\ALT_INV_alu_in[0][5]~q\ <= NOT \alu_in[0][5]~q\;
\ALT_INV_Selector13~0_combout\ <= NOT \Selector13~0_combout\;
\mem|ALT_INV_mem~41_combout\ <= NOT \mem|mem~41_combout\;
\alu|ALT_INV_Selector3~2_combout\ <= NOT \alu|Selector3~2_combout\;
\alu|ALT_INV_Selector3~1_combout\ <= NOT \alu|Selector3~1_combout\;
\alu|ALT_INV_Selector3~0_combout\ <= NOT \alu|Selector3~0_combout\;
\ALT_INV_alu_in[0][4]~q\ <= NOT \alu_in[0][4]~q\;
\ALT_INV_Selector14~0_combout\ <= NOT \Selector14~0_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(23) <= NOT \mem|mem_rtl_0_bypass\(23);
\mem|ALT_INV_mem~40_combout\ <= NOT \mem|mem~40_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(24) <= NOT \mem|mem_rtl_0_bypass\(24);
\mem|ALT_INV_mem~21_q\ <= NOT \mem|mem~21_q\;
\alu|ALT_INV_Selector4~2_combout\ <= NOT \alu|Selector4~2_combout\;
\alu|ALT_INV_Selector4~1_combout\ <= NOT \alu|Selector4~1_combout\;
\alu|ALT_INV_Selector4~0_combout\ <= NOT \alu|Selector4~0_combout\;
\ALT_INV_alu_in[0][3]~q\ <= NOT \alu_in[0][3]~q\;
\ALT_INV_Selector15~0_combout\ <= NOT \Selector15~0_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(21) <= NOT \mem|mem_rtl_0_bypass\(21);
\mem|ALT_INV_mem~39_combout\ <= NOT \mem|mem~39_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(22) <= NOT \mem|mem_rtl_0_bypass\(22);
\mem|ALT_INV_mem~20_q\ <= NOT \mem|mem~20_q\;
\alu|ALT_INV_Selector5~3_combout\ <= NOT \alu|Selector5~3_combout\;
\alu|ALT_INV_Selector5~2_combout\ <= NOT \alu|Selector5~2_combout\;
\alu|ALT_INV_Selector5~1_combout\ <= NOT \alu|Selector5~1_combout\;
\alu|ALT_INV_Selector5~0_combout\ <= NOT \alu|Selector5~0_combout\;
\ALT_INV_alu_in[0][2]~q\ <= NOT \alu_in[0][2]~q\;
\ALT_INV_Selector16~0_combout\ <= NOT \Selector16~0_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(19) <= NOT \mem|mem_rtl_0_bypass\(19);
\mem|ALT_INV_mem~38_combout\ <= NOT \mem|mem~38_combout\;
\mem|ALT_INV_mem_rtl_0_bypass\(20) <= NOT \mem|mem_rtl_0_bypass\(20);
\mem|ALT_INV_mem~19_q\ <= NOT \mem|mem~19_q\;
\alu|ALT_INV_Selector6~1_combout\ <= NOT \alu|Selector6~1_combout\;
\alu|ALT_INV_Selector6~0_combout\ <= NOT \alu|Selector6~0_combout\;
\mem|ALT_INV_mem~25DUPLICATE_q\ <= NOT \mem|mem~25DUPLICATE_q\;
\mem|ALT_INV_mem_rtl_0_bypass[17]~DUPLICATE_q\ <= NOT \mem|mem_rtl_0_bypass[17]~DUPLICATE_q\;
\mem|ALT_INV_mem~18DUPLICATE_q\ <= NOT \mem|mem~18DUPLICATE_q\;
\mem|ALT_INV_mem~17DUPLICATE_q\ <= NOT \mem|mem~17DUPLICATE_q\;
\ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\ <= NOT \ControlUnit:next_state.fetch~DUPLICATE_q\;
\ALT_INV_input[7]~input_o\ <= NOT \input[7]~input_o\;
\ALT_INV_input[6]~input_o\ <= NOT \input[6]~input_o\;
\ALT_INV_input[5]~input_o\ <= NOT \input[5]~input_o\;
\ALT_INV_input[4]~input_o\ <= NOT \input[4]~input_o\;
\ALT_INV_input[3]~input_o\ <= NOT \input[3]~input_o\;
\ALT_INV_input[2]~input_o\ <= NOT \input[2]~input_o\;
\ALT_INV_input[1]~input_o\ <= NOT \input[1]~input_o\;
\ALT_INV_set~input_o\ <= NOT \set~input_o\;
\ALT_INV_input[0]~input_o\ <= NOT \input[0]~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\alu|ALT_INV_signal_bit~combout\ <= NOT \alu|signal_bit~combout\;
\alu|ALT_INV_zero~combout\ <= NOT \alu|zero~combout\;
\alu|ALT_INV_Equal0~1_combout\ <= NOT \alu|Equal0~1_combout\;
\alu|ALT_INV_Equal0~0_combout\ <= NOT \alu|Equal0~0_combout\;

-- Location: IOOBUF_X12_Y45_N53
\output[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \output[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_output(0));

-- Location: IOOBUF_X0_Y19_N39
\output[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \output[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_output(1));

-- Location: IOOBUF_X0_Y18_N79
\output[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \output[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_output(2));

-- Location: IOOBUF_X0_Y18_N45
\output[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \output[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_output(3));

-- Location: IOOBUF_X0_Y18_N96
\output[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \output[4]~reg0_q\,
	devoe => ww_devoe,
	o => ww_output(4));

-- Location: IOOBUF_X0_Y18_N62
\output[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \output[5]~reg0_q\,
	devoe => ww_devoe,
	o => ww_output(5));

-- Location: IOOBUF_X0_Y21_N39
\output[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \output[6]~reg0_q\,
	devoe => ww_devoe,
	o => ww_output(6));

-- Location: IOOBUF_X0_Y20_N22
\output[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \output[7]~reg0_q\,
	devoe => ww_devoe,
	o => ww_output(7));

-- Location: IOOBUF_X8_Y45_N76
\waiting~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \waiting~reg0_q\,
	devoe => ww_devoe,
	o => ww_waiting);

-- Location: IOIBUF_X54_Y18_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X0_Y21_N55
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: MLABCELL_X4_Y20_N3
\mem|mem_rtl_0_bypass[28]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem_rtl_0_bypass[28]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \mem|mem_rtl_0_bypass[28]~feeder_combout\);

-- Location: FF_X4_Y20_N4
\mem|mem_rtl_0_bypass[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem_rtl_0_bypass[28]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(28));

-- Location: LABCELL_X2_Y19_N48
\mem|mem_rtl_0_bypass[32]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem_rtl_0_bypass[32]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \mem|mem_rtl_0_bypass[32]~feeder_combout\);

-- Location: FF_X2_Y19_N49
\mem|mem_rtl_0_bypass[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem_rtl_0_bypass[32]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(32));

-- Location: IOIBUF_X0_Y21_N21
\set~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_set,
	o => \set~input_o\);

-- Location: MLABCELL_X4_Y19_N18
\ControlUnit:opcode.HALT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.HALT~0_combout\ = ( \ControlUnit:opcode.HALT~q\ & ( \RotateRight0~0_combout\ & ( (((\mem|mem~35_combout\ & \mem|mem~37_combout\)) # (\rst~input_o\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\) ) ) ) # ( !\ControlUnit:opcode.HALT~q\ 
-- & ( \RotateRight0~0_combout\ & ( (!\ControlUnit:next_state.fetch~DUPLICATE_q\ & (!\rst~input_o\ & (\mem|mem~35_combout\ & \mem|mem~37_combout\))) ) ) ) # ( \ControlUnit:opcode.HALT~q\ & ( !\RotateRight0~0_combout\ & ( (\rst~input_o\) # 
-- (\ControlUnit:next_state.fetch~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000011101110111011100000000000010000111011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datab => \ALT_INV_rst~input_o\,
	datac => \mem|ALT_INV_mem~35_combout\,
	datad => \mem|ALT_INV_mem~37_combout\,
	datae => \ALT_INV_ControlUnit:opcode.HALT~q\,
	dataf => \ALT_INV_RotateRight0~0_combout\,
	combout => \ControlUnit:opcode.HALT~0_combout\);

-- Location: FF_X4_Y19_N20
\ControlUnit:opcode.HALT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.HALT~q\);

-- Location: LABCELL_X1_Y21_N39
\Selector19~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = ( \ControlUnit:next_state.fetch~DUPLICATE_q\ & ( (\ControlUnit:next_state.execute~q\ & ((!\ControlUnit:opcode.DIN~q\ & ((\ControlUnit:opcode.HALT~q\))) # (\ControlUnit:opcode.DIN~q\ & (!\set~input_o\)))) ) ) # ( 
-- !\ControlUnit:next_state.fetch~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000010011100000000001001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.DIN~q\,
	datab => \ALT_INV_set~input_o\,
	datac => \ALT_INV_ControlUnit:opcode.HALT~q\,
	datad => \ALT_INV_ControlUnit:next_state.execute~q\,
	dataf => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	combout => \Selector19~0_combout\);

-- Location: FF_X1_Y21_N41
\ControlUnit:next_state.execute\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector19~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:next_state.execute~q\);

-- Location: FF_X1_Y21_N13
\ControlUnit:next_state.memory_access\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \next_state~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \ALT_INV_ControlUnit:next_state.execute~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:next_state.memory_access~q\);

-- Location: LABCELL_X1_Y21_N27
\Selector31~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector31~0_combout\ = ( !\ControlUnit:next_state.execute~q\ & ( !\ControlUnit:next_state.memory_access~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ControlUnit:next_state.memory_access~q\,
	dataf => \ALT_INV_ControlUnit:next_state.execute~q\,
	combout => \Selector31~0_combout\);

-- Location: IOIBUF_X54_Y21_N21
\input[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(3),
	o => \input[3]~input_o\);

-- Location: MLABCELL_X4_Y20_N9
\mem|mem~17feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~17feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \mem|mem~17feeder_combout\);

-- Location: FF_X4_Y20_N11
\mem|mem~17DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem~17feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem~17DUPLICATE_q\);

-- Location: FF_X1_Y21_N56
\ControlUnit:next_state.fetch\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector18~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:next_state.fetch~q\);

-- Location: LABCELL_X1_Y21_N33
\Selector38~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector38~0_combout\ = ( \mem_write~q\ & ( \ControlUnit:next_state.memory_access~q\ & ( ((!\ControlUnit:next_state.fetch~q\) # (\ControlUnit:next_state.execute~q\)) # (\ControlUnit:opcode.STORE~q\) ) ) ) # ( !\mem_write~q\ & ( 
-- \ControlUnit:next_state.memory_access~q\ & ( \ControlUnit:opcode.STORE~q\ ) ) ) # ( \mem_write~q\ & ( !\ControlUnit:next_state.memory_access~q\ & ( (!\ControlUnit:next_state.fetch~q\) # (\ControlUnit:next_state.execute~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000111101010101010101011111111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.STORE~q\,
	datac => \ALT_INV_ControlUnit:next_state.execute~q\,
	datad => \ALT_INV_ControlUnit:next_state.fetch~q\,
	datae => \ALT_INV_mem_write~q\,
	dataf => \ALT_INV_ControlUnit:next_state.memory_access~q\,
	combout => \Selector38~0_combout\);

-- Location: FF_X1_Y21_N35
mem_write : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector38~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem_write~q\);

-- Location: LABCELL_X2_Y20_N24
\ControlUnit:pc[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:pc[2]~feeder_combout\ = \Selector5~0_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Selector5~0_combout\,
	combout => \ControlUnit:pc[2]~feeder_combout\);

-- Location: LABCELL_X5_Y21_N48
\ControlUnit:opcode.DOUT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.DOUT~0_combout\ = ( \ControlUnit:opcode.DOUT~q\ & ( \RotateRight0~0_combout\ & ( (((\mem|mem~37_combout\ & !\mem|mem~35_combout\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\)) # (\rst~input_o\) ) ) ) # ( !\ControlUnit:opcode.DOUT~q\ 
-- & ( \RotateRight0~0_combout\ & ( (\mem|mem~37_combout\ & (!\rst~input_o\ & (!\mem|mem~35_combout\ & !\ControlUnit:next_state.fetch~DUPLICATE_q\))) ) ) ) # ( \ControlUnit:opcode.DOUT~q\ & ( !\RotateRight0~0_combout\ & ( 
-- (\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100111111111101000000000000000111001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~37_combout\,
	datab => \ALT_INV_rst~input_o\,
	datac => \mem|ALT_INV_mem~35_combout\,
	datad => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datae => \ALT_INV_ControlUnit:opcode.DOUT~q\,
	dataf => \ALT_INV_RotateRight0~0_combout\,
	combout => \ControlUnit:opcode.DOUT~0_combout\);

-- Location: FF_X5_Y21_N50
\ControlUnit:opcode.DOUT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.DOUT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.DOUT~q\);

-- Location: LABCELL_X5_Y21_N18
\ControlUnit:opcode.NOP~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.NOP~1_combout\ = ( \ControlUnit:opcode.NOP~q\ & ( \mem|mem~37_combout\ ) ) # ( !\ControlUnit:opcode.NOP~q\ & ( \mem|mem~37_combout\ & ( (!\rst~input_o\ & !\ControlUnit:next_state.fetch~DUPLICATE_q\) ) ) ) # ( \ControlUnit:opcode.NOP~q\ 
-- & ( !\mem|mem~37_combout\ & ( ((!\ControlUnit:opcode.NOP~0_combout\) # ((\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\mem|mem~35_combout\))) # (\rst~input_o\) ) ) ) # ( !\ControlUnit:opcode.NOP~q\ & ( !\mem|mem~37_combout\ & ( (!\rst~input_o\ & 
-- (!\ControlUnit:next_state.fetch~DUPLICATE_q\ & ((!\ControlUnit:opcode.NOP~0_combout\) # (\mem|mem~35_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000101000000000110111111111111110101010000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \ALT_INV_ControlUnit:opcode.NOP~0_combout\,
	datac => \mem|ALT_INV_mem~35_combout\,
	datad => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datae => \ALT_INV_ControlUnit:opcode.NOP~q\,
	dataf => \mem|ALT_INV_mem~37_combout\,
	combout => \ControlUnit:opcode.NOP~1_combout\);

-- Location: FF_X5_Y21_N20
\ControlUnit:opcode.NOP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.NOP~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.NOP~q\);

-- Location: LABCELL_X5_Y21_N12
\WideNor0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \WideNor0~0_combout\ = ( !\ControlUnit:opcode.DIN~q\ & ( (!\ControlUnit:opcode.DOUT~q\ & (\ControlUnit:opcode.NOP~q\ & !\ControlUnit:opcode.HALT~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000000000010100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.DOUT~q\,
	datac => \ALT_INV_ControlUnit:opcode.NOP~q\,
	datad => \ALT_INV_ControlUnit:opcode.HALT~q\,
	dataf => \ALT_INV_ControlUnit:opcode.DIN~q\,
	combout => \WideNor0~0_combout\);

-- Location: LABCELL_X6_Y19_N51
\ControlUnit:opcode.CMP~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.CMP~0_combout\ = ( \ControlUnit:opcode.CMP~q\ & ( \ControlUnit:opcode.NOP~0_combout\ & ( (((\mem|mem~35_combout\ & \mem|mem~37_combout\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\)) # (\rst~input_o\) ) ) ) # ( 
-- !\ControlUnit:opcode.CMP~q\ & ( \ControlUnit:opcode.NOP~0_combout\ & ( (!\rst~input_o\ & (\mem|mem~35_combout\ & (\mem|mem~37_combout\ & !\ControlUnit:next_state.fetch~DUPLICATE_q\))) ) ) ) # ( \ControlUnit:opcode.CMP~q\ & ( 
-- !\ControlUnit:opcode.NOP~0_combout\ & ( (\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101011111111100000010000000000101011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \mem|ALT_INV_mem~35_combout\,
	datac => \mem|ALT_INV_mem~37_combout\,
	datad => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datae => \ALT_INV_ControlUnit:opcode.CMP~q\,
	dataf => \ALT_INV_ControlUnit:opcode.NOP~0_combout\,
	combout => \ControlUnit:opcode.CMP~0_combout\);

-- Location: FF_X6_Y19_N52
\ControlUnit:opcode.CMP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.CMP~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.CMP~q\);

-- Location: LABCELL_X6_Y19_N15
\ControlUnit:opcode.MOV~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.MOV~0_combout\ = ( \ControlUnit:opcode.MOV~q\ & ( \RotateRight0~0_combout\ & ( (((\mem|mem~35_combout\ & !\mem|mem~37_combout\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\)) # (\rst~input_o\) ) ) ) # ( !\ControlUnit:opcode.MOV~q\ & 
-- ( \RotateRight0~0_combout\ & ( (!\rst~input_o\ & (\mem|mem~35_combout\ & (!\mem|mem~37_combout\ & !\ControlUnit:next_state.fetch~DUPLICATE_q\))) ) ) ) # ( \ControlUnit:opcode.MOV~q\ & ( !\RotateRight0~0_combout\ & ( 
-- (\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101011111111100100000000000000111010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \mem|ALT_INV_mem~35_combout\,
	datac => \mem|ALT_INV_mem~37_combout\,
	datad => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datae => \ALT_INV_ControlUnit:opcode.MOV~q\,
	dataf => \ALT_INV_RotateRight0~0_combout\,
	combout => \ControlUnit:opcode.MOV~0_combout\);

-- Location: FF_X6_Y19_N17
\ControlUnit:opcode.MOV\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.MOV~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.MOV~q\);

-- Location: IOIBUF_X0_Y20_N38
\input[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(7),
	o => \input[7]~input_o\);

-- Location: LABCELL_X7_Y20_N18
\mem|mem~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~57_combout\ = ( !wb(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(7),
	combout => \mem|mem~57_combout\);

-- Location: FF_X7_Y20_N20
\mem|mem~25\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem~57_combout\,
	ena => \mem|mem~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem~25_q\);

-- Location: FF_X4_Y20_N20
\address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector36~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(0));

-- Location: LABCELL_X5_Y20_N30
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( \ControlUnit:pc[0]~q\ ) + ( VCC ) + ( !VCC ))
-- \Add0~2\ = CARRY(( \ControlUnit:pc[0]~q\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_ControlUnit:pc[0]~q\,
	cin => GND,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: LABCELL_X5_Y20_N33
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( \ControlUnit:pc[1]~q\ ) + ( GND ) + ( \Add0~2\ ))
-- \Add0~6\ = CARRY(( \ControlUnit:pc[1]~q\ ) + ( GND ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:pc[1]~q\,
	cin => \Add0~2\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: LABCELL_X6_Y19_N0
\ControlUnit:opcode.LNOT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.LNOT~0_combout\ = ( \ControlUnit:opcode.LNOT~q\ & ( \RotateRight0~2_combout\ & ( (((!\mem|mem~37_combout\ & \mem|mem~35_combout\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\)) # (\rst~input_o\) ) ) ) # ( !\ControlUnit:opcode.LNOT~q\ 
-- & ( \RotateRight0~2_combout\ & ( (!\rst~input_o\ & (!\mem|mem~37_combout\ & (!\ControlUnit:next_state.fetch~DUPLICATE_q\ & \mem|mem~35_combout\))) ) ) ) # ( \ControlUnit:opcode.LNOT~q\ & ( !\RotateRight0~2_combout\ & ( 
-- (\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010111110101111100000000100000000101111111011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \mem|ALT_INV_mem~37_combout\,
	datac => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datad => \mem|ALT_INV_mem~35_combout\,
	datae => \ALT_INV_ControlUnit:opcode.LNOT~q\,
	dataf => \ALT_INV_RotateRight0~2_combout\,
	combout => \ControlUnit:opcode.LNOT~0_combout\);

-- Location: FF_X6_Y19_N2
\ControlUnit:opcode.LNOT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.LNOT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.LNOT~q\);

-- Location: LABCELL_X5_Y19_N36
\ControlUnit:opcode.LOR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.LOR~0_combout\ = ( \ControlUnit:opcode.LOR~q\ & ( \RotateRight0~2_combout\ & ( (((\mem|mem~37_combout\ & !\mem|mem~35_combout\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\)) # (\rst~input_o\) ) ) ) # ( !\ControlUnit:opcode.LOR~q\ & 
-- ( \RotateRight0~2_combout\ & ( (!\rst~input_o\ & (!\ControlUnit:next_state.fetch~DUPLICATE_q\ & (\mem|mem~37_combout\ & !\mem|mem~35_combout\))) ) ) ) # ( \ControlUnit:opcode.LOR~q\ & ( !\RotateRight0~2_combout\ & ( 
-- (\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000011101110111011100001000000000000111111101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datac => \mem|ALT_INV_mem~37_combout\,
	datad => \mem|ALT_INV_mem~35_combout\,
	datae => \ALT_INV_ControlUnit:opcode.LOR~q\,
	dataf => \ALT_INV_RotateRight0~2_combout\,
	combout => \ControlUnit:opcode.LOR~0_combout\);

-- Location: FF_X5_Y19_N38
\ControlUnit:opcode.LOR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.LOR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.LOR~q\);

-- Location: LABCELL_X6_Y19_N3
\ControlUnit:opcode.SUB~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.SUB~0_combout\ = ( \ControlUnit:opcode.SUB~q\ & ( \ControlUnit:opcode.NOP~0_combout\ & ( (((!\mem|mem~37_combout\ & \mem|mem~35_combout\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\)) # (\rst~input_o\) ) ) ) # ( 
-- !\ControlUnit:opcode.SUB~q\ & ( \ControlUnit:opcode.NOP~0_combout\ & ( (!\rst~input_o\ & (!\mem|mem~37_combout\ & (\mem|mem~35_combout\ & !\ControlUnit:next_state.fetch~DUPLICATE_q\))) ) ) ) # ( \ControlUnit:opcode.SUB~q\ & ( 
-- !\ControlUnit:opcode.NOP~0_combout\ & ( (\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101011111111100001000000000000101110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \mem|ALT_INV_mem~37_combout\,
	datac => \mem|ALT_INV_mem~35_combout\,
	datad => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datae => \ALT_INV_ControlUnit:opcode.SUB~q\,
	dataf => \ALT_INV_ControlUnit:opcode.NOP~0_combout\,
	combout => \ControlUnit:opcode.SUB~0_combout\);

-- Location: FF_X6_Y19_N5
\ControlUnit:opcode.SUB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.SUB~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.SUB~q\);

-- Location: LABCELL_X6_Y19_N36
\Selector18~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector18~0_combout\ = ( !\ControlUnit:opcode.LOR~q\ & ( !\ControlUnit:opcode.SUB~q\ & ( (!\ControlUnit:opcode.LAND~q\ & (!\ControlUnit:opcode.MOV~q\ & (!\ControlUnit:opcode.LNOT~q\ & !\ControlUnit:opcode.ADD~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.LAND~q\,
	datab => \ALT_INV_ControlUnit:opcode.MOV~q\,
	datac => \ALT_INV_ControlUnit:opcode.LNOT~q\,
	datad => \ALT_INV_ControlUnit:opcode.ADD~q\,
	datae => \ALT_INV_ControlUnit:opcode.LOR~q\,
	dataf => \ALT_INV_ControlUnit:opcode.SUB~q\,
	combout => \Selector18~0_combout\);

-- Location: LABCELL_X1_Y21_N36
\Selector20~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = ( \ControlUnit:next_state.memory_access~q\ ) # ( !\ControlUnit:next_state.memory_access~q\ & ( (\ControlUnit:next_state.execute~q\ & ((!\Selector18~0_combout\) # ((\ControlUnit:opcode.DIN~q\ & \set~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000001000011110000000111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.DIN~q\,
	datab => \ALT_INV_set~input_o\,
	datac => \ALT_INV_ControlUnit:next_state.execute~q\,
	datad => \ALT_INV_Selector18~0_combout\,
	dataf => \ALT_INV_ControlUnit:next_state.memory_access~q\,
	combout => \Selector20~0_combout\);

-- Location: FF_X1_Y21_N38
\ControlUnit:next_state.write_back\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector20~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:next_state.write_back~q\);

-- Location: LABCELL_X1_Y21_N9
\Selector31~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector31~1_combout\ = ( !\ControlUnit:next_state.write_back~q\ & ( !\ControlUnit:next_state.memory_access~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_ControlUnit:next_state.write_back~q\,
	dataf => \ALT_INV_ControlUnit:next_state.memory_access~q\,
	combout => \Selector31~1_combout\);

-- Location: IOIBUF_X0_Y19_N4
\input[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(1),
	o => \input[1]~input_o\);

-- Location: LABCELL_X2_Y19_N9
\mem|mem_rtl_0_bypass[30]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem_rtl_0_bypass[30]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \mem|mem_rtl_0_bypass[30]~feeder_combout\);

-- Location: FF_X2_Y19_N10
\mem|mem_rtl_0_bypass[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem_rtl_0_bypass[30]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(30));

-- Location: LABCELL_X5_Y19_N42
\mem|mem~31\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~31_combout\ = ( \mem|mem~28_combout\ & ( (\mem|mem_rtl_0_bypass\(30) & ((!\mem|mem~27_combout\) # (!\mem|mem~26_combout\))) ) ) # ( !\mem|mem~28_combout\ & ( \mem|mem_rtl_0_bypass\(30) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011100000111000001111000011110000111000001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~27_combout\,
	datab => \mem|ALT_INV_mem~26_combout\,
	datac => \mem|ALT_INV_mem_rtl_0_bypass\(30),
	datae => \mem|ALT_INV_mem~28_combout\,
	combout => \mem|mem~31_combout\);

-- Location: FF_X7_Y20_N19
\mem|mem~25DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem~57_combout\,
	ena => \mem|mem~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem~25DUPLICATE_q\);

-- Location: FF_X4_Y20_N10
\mem|mem~17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem~17feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem~17_q\);

-- Location: LABCELL_X5_Y20_N57
\mem|mem~32\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~32_combout\ = ( \mem|mem~17_q\ & ( \mem|mem_rtl_0|auto_generated|ram_block1a7\ ) ) # ( !\mem|mem~17_q\ & ( !\mem|mem~25DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a7\,
	datad => \mem|ALT_INV_mem~25DUPLICATE_q\,
	dataf => \mem|ALT_INV_mem~17_q\,
	combout => \mem|mem~32_combout\);

-- Location: MLABCELL_X9_Y20_N9
\mem|mem~56\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~56_combout\ = ( !wb(6) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(6),
	combout => \mem|mem~56_combout\);

-- Location: FF_X7_Y20_N35
\mem|mem~24\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \mem|mem~56_combout\,
	sload => VCC,
	ena => \mem|mem~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem~24_q\);

-- Location: FF_X4_Y21_N2
\address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector33~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(3));

-- Location: IOIBUF_X0_Y21_N4
\input[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(4),
	o => \input[4]~input_o\);

-- Location: FF_X6_Y21_N1
\mem|mem_rtl_0_bypass[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(4),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(25));

-- Location: LABCELL_X2_Y21_N36
\mem|mem_rtl_0_bypass[26]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem_rtl_0_bypass[26]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \mem|mem_rtl_0_bypass[26]~feeder_combout\);

-- Location: FF_X2_Y21_N37
\mem|mem_rtl_0_bypass[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem_rtl_0_bypass[26]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(26));

-- Location: LABCELL_X6_Y21_N6
\mem|mem~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~41_combout\ = ( \mem|mem~28_combout\ & ( \mem|mem~26_combout\ & ( (\mem|mem_rtl_0_bypass\(26) & !\mem|mem~27_combout\) ) ) ) # ( !\mem|mem~28_combout\ & ( \mem|mem~26_combout\ & ( \mem|mem_rtl_0_bypass\(26) ) ) ) # ( \mem|mem~28_combout\ & ( 
-- !\mem|mem~26_combout\ & ( \mem|mem_rtl_0_bypass\(26) ) ) ) # ( !\mem|mem~28_combout\ & ( !\mem|mem~26_combout\ & ( \mem|mem_rtl_0_bypass\(26) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(26),
	datad => \mem|ALT_INV_mem~27_combout\,
	datae => \mem|ALT_INV_mem~28_combout\,
	dataf => \mem|ALT_INV_mem~26_combout\,
	combout => \mem|mem~41_combout\);

-- Location: FF_X4_Y21_N31
\mem|mem~22\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(4),
	sload => VCC,
	ena => \mem|mem~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem~22_q\);

-- Location: IOIBUF_X0_Y20_N55
\input[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(5),
	o => \input[5]~input_o\);

-- Location: FF_X4_Y20_N50
\mem|mem_rtl_0_bypass[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(5),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(27));

-- Location: FF_X4_Y20_N44
\mem|mem~23\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(5),
	sload => VCC,
	ena => \mem|mem~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem~23_q\);

-- Location: LABCELL_X2_Y20_N15
\mem|mem~51\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~51_combout\ = ( \mem|mem~28_combout\ & ( \mem|mem~26_combout\ & ( (!\mem|mem_rtl_0_bypass\(30) & (((!\mem|mem_rtl_0_bypass\(29))))) # (\mem|mem_rtl_0_bypass\(30) & ((!\mem|mem~27_combout\ & (\mem|mem~30_combout\)) # (\mem|mem~27_combout\ & 
-- ((!\mem|mem_rtl_0_bypass\(29)))))) ) ) ) # ( !\mem|mem~28_combout\ & ( \mem|mem~26_combout\ & ( (!\mem|mem_rtl_0_bypass\(30) & ((!\mem|mem_rtl_0_bypass\(29)))) # (\mem|mem_rtl_0_bypass\(30) & (\mem|mem~30_combout\)) ) ) ) # ( \mem|mem~28_combout\ & ( 
-- !\mem|mem~26_combout\ & ( (!\mem|mem_rtl_0_bypass\(30) & ((!\mem|mem_rtl_0_bypass\(29)))) # (\mem|mem_rtl_0_bypass\(30) & (\mem|mem~30_combout\)) ) ) ) # ( !\mem|mem~28_combout\ & ( !\mem|mem~26_combout\ & ( (!\mem|mem_rtl_0_bypass\(30) & 
-- ((!\mem|mem_rtl_0_bypass\(29)))) # (\mem|mem_rtl_0_bypass\(30) & (\mem|mem~30_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101100010001101110110001000110111011000100011011111100010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem_rtl_0_bypass\(30),
	datab => \mem|ALT_INV_mem~30_combout\,
	datac => \mem|ALT_INV_mem~27_combout\,
	datad => \mem|ALT_INV_mem_rtl_0_bypass\(29),
	datae => \mem|ALT_INV_mem~28_combout\,
	dataf => \mem|ALT_INV_mem~26_combout\,
	combout => \mem|mem~51_combout\);

-- Location: LABCELL_X2_Y20_N27
\Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = ( \mem|mem~51_combout\ & ( (!\Selector3~0_combout\ & (((\ControlUnit:pc[6]~q\)))) # (\Selector3~0_combout\ & ((!\Selector3~2_combout\) # ((\Add0~25_sumout\)))) ) ) # ( !\mem|mem~51_combout\ & ( (!\Selector3~0_combout\ & 
-- (((\ControlUnit:pc[6]~q\)))) # (\Selector3~0_combout\ & (\Selector3~2_combout\ & (\Add0~25_sumout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000110101011000000011010101101000101111011110100010111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector3~0_combout\,
	datab => \ALT_INV_Selector3~2_combout\,
	datac => \ALT_INV_Add0~25_sumout\,
	datad => \ALT_INV_ControlUnit:pc[6]~q\,
	dataf => \mem|ALT_INV_mem~51_combout\,
	combout => \Selector1~0_combout\);

-- Location: FF_X2_Y20_N29
\ControlUnit:pc[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector1~0_combout\,
	asdata => \Add0~25_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_ControlUnit:next_state.execute~q\,
	ena => \Selector31~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:pc[6]~q\);

-- Location: LABCELL_X5_Y20_N36
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( \ControlUnit:pc[2]~q\ ) + ( GND ) + ( \Add0~6\ ))
-- \Add0~10\ = CARRY(( \ControlUnit:pc[2]~q\ ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ControlUnit:pc[2]~q\,
	cin => \Add0~6\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: LABCELL_X5_Y20_N39
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( \ControlUnit:pc[3]~q\ ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~14\ = CARRY(( \ControlUnit:pc[3]~q\ ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ControlUnit:pc[3]~q\,
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: MLABCELL_X4_Y21_N12
\mem|mem_rtl_0_bypass[24]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem_rtl_0_bypass[24]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \mem|mem_rtl_0_bypass[24]~feeder_combout\);

-- Location: FF_X4_Y21_N14
\mem|mem_rtl_0_bypass[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem_rtl_0_bypass[24]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(24));

-- Location: FF_X4_Y21_N8
\mem|mem_rtl_0_bypass[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(23));

-- Location: IOIBUF_X0_Y20_N4
\input[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(2),
	o => \input[2]~input_o\);

-- Location: FF_X6_Y20_N20
\alu_in[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(2),
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[0][2]~q\);

-- Location: LABCELL_X5_Y21_N39
\alu_in[1][2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu_in[1][2]~feeder_combout\ = wb(2)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_wb(2),
	combout => \alu_in[1][2]~feeder_combout\);

-- Location: LABCELL_X2_Y20_N48
\mem|mem_rtl_0_bypass[22]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem_rtl_0_bypass[22]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \mem|mem_rtl_0_bypass[22]~feeder_combout\);

-- Location: FF_X2_Y20_N49
\mem|mem_rtl_0_bypass[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem_rtl_0_bypass[22]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(22));

-- Location: FF_X2_Y20_N56
\mem|mem~20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(2),
	sload => VCC,
	ena => \mem|mem~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem~20_q\);

-- Location: M10K_X3_Y20_N0
\mem|mem_rtl_0|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init3 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F000000000D800000000FF00000000AB00000000060000000093000000003400000000E800000000FF00000000BB0000000001000000001B00000000FF00000000AB00000000E2000000002900000000E800000000FF00000000BB000000000000000000EB00000000C700000000C3",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/myCPU.ram0_Memory_a0c6519c.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Memory:mem|altsyncram:mem_rtl_0|altsyncram_avm1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 8,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 40,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 255,
	port_a_logical_ram_depth => 256,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 8,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 40,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 255,
	port_b_logical_ram_depth => 256,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \mem_write~q\,
	portbre => VCC,
	clk0 => \clk~inputCLKENA0_outclk\,
	clk1 => \clk~inputCLKENA0_outclk\,
	ena0 => \mem_write~q\,
	portadatain => \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \mem|mem_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LABCELL_X2_Y20_N54
\mem|mem~47\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~47_combout\ = ( \mem|mem_rtl_0|auto_generated|ram_block1a2\ & ( (\mem|mem~20_q\) # (\mem|mem~17DUPLICATE_q\) ) ) # ( !\mem|mem_rtl_0|auto_generated|ram_block1a2\ & ( (!\mem|mem~17DUPLICATE_q\ & \mem|mem~20_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~17DUPLICATE_q\,
	datad => \mem|ALT_INV_mem~20_q\,
	dataf => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a2\,
	combout => \mem|mem~47_combout\);

-- Location: FF_X2_Y20_N20
\mem|mem_rtl_0_bypass[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(21));

-- Location: LABCELL_X2_Y20_N18
\mem|mem~48\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~48_combout\ = ( \mem|mem_rtl_0_bypass\(21) & ( \mem|mem~26_combout\ & ( (!\mem|mem_rtl_0_bypass\(22)) # (((\mem|mem~27_combout\ & \mem|mem~28_combout\)) # (\mem|mem~47_combout\)) ) ) ) # ( !\mem|mem_rtl_0_bypass\(21) & ( \mem|mem~26_combout\ & ( 
-- (\mem|mem_rtl_0_bypass\(22) & (\mem|mem~47_combout\ & ((!\mem|mem~27_combout\) # (!\mem|mem~28_combout\)))) ) ) ) # ( \mem|mem_rtl_0_bypass\(21) & ( !\mem|mem~26_combout\ & ( (!\mem|mem_rtl_0_bypass\(22)) # (\mem|mem~47_combout\) ) ) ) # ( 
-- !\mem|mem_rtl_0_bypass\(21) & ( !\mem|mem~26_combout\ & ( (\mem|mem_rtl_0_bypass\(22) & \mem|mem~47_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101101011111010111100000101000001001010111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem_rtl_0_bypass\(22),
	datab => \mem|ALT_INV_mem~27_combout\,
	datac => \mem|ALT_INV_mem~47_combout\,
	datad => \mem|ALT_INV_mem~28_combout\,
	datae => \mem|ALT_INV_mem_rtl_0_bypass\(21),
	dataf => \mem|ALT_INV_mem~26_combout\,
	combout => \mem|mem~48_combout\);

-- Location: MLABCELL_X4_Y19_N15
\mem|mem_rtl_0_bypass[17]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem_rtl_0_bypass[17]~0_combout\ = ( !wb(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(0),
	combout => \mem|mem_rtl_0_bypass[17]~0_combout\);

-- Location: FF_X4_Y19_N16
\mem|mem_rtl_0_bypass[17]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem_rtl_0_bypass[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass[17]~DUPLICATE_q\);

-- Location: LABCELL_X2_Y19_N27
\mem|mem_rtl_0_bypass[18]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem_rtl_0_bypass[18]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \mem|mem_rtl_0_bypass[18]~feeder_combout\);

-- Location: FF_X2_Y19_N28
\mem|mem_rtl_0_bypass[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem_rtl_0_bypass[18]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(18));

-- Location: LABCELL_X2_Y19_N57
\mem|mem~55\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~55_combout\ = ( !wb(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(0),
	combout => \mem|mem~55_combout\);

-- Location: FF_X4_Y19_N46
\mem|mem~18DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \mem|mem~55_combout\,
	sload => VCC,
	ena => \mem|mem~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem~18DUPLICATE_q\);

-- Location: MLABCELL_X4_Y20_N0
\mem|mem~43\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~43_combout\ = ( \mem|mem~17DUPLICATE_q\ & ( \mem|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\ ) ) # ( !\mem|mem~17DUPLICATE_q\ & ( !\mem|mem~18DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \mem|ALT_INV_mem~18DUPLICATE_q\,
	datad => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\,
	dataf => \mem|ALT_INV_mem~17DUPLICATE_q\,
	combout => \mem|mem~43_combout\);

-- Location: LABCELL_X5_Y19_N6
\mem|mem~44\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~44_combout\ = ( \mem|mem~28_combout\ & ( \mem|mem~43_combout\ & ( (!\mem|mem_rtl_0_bypass[17]~DUPLICATE_q\) # ((\mem|mem_rtl_0_bypass\(18) & ((!\mem|mem~26_combout\) # (!\mem|mem~27_combout\)))) ) ) ) # ( !\mem|mem~28_combout\ & ( 
-- \mem|mem~43_combout\ & ( (!\mem|mem_rtl_0_bypass[17]~DUPLICATE_q\) # (\mem|mem_rtl_0_bypass\(18)) ) ) ) # ( \mem|mem~28_combout\ & ( !\mem|mem~43_combout\ & ( (!\mem|mem_rtl_0_bypass[17]~DUPLICATE_q\ & ((!\mem|mem_rtl_0_bypass\(18)) # 
-- ((\mem|mem~26_combout\ & \mem|mem~27_combout\)))) ) ) ) # ( !\mem|mem~28_combout\ & ( !\mem|mem~43_combout\ & ( (!\mem|mem_rtl_0_bypass[17]~DUPLICATE_q\ & !\mem|mem_rtl_0_bypass\(18)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000001010101010111111111010101011111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem_rtl_0_bypass[17]~DUPLICATE_q\,
	datab => \mem|ALT_INV_mem~26_combout\,
	datac => \mem|ALT_INV_mem~27_combout\,
	datad => \mem|ALT_INV_mem_rtl_0_bypass\(18),
	datae => \mem|ALT_INV_mem~28_combout\,
	dataf => \mem|ALT_INV_mem~43_combout\,
	combout => \mem|mem~44_combout\);

-- Location: LABCELL_X2_Y19_N39
\ControlUnit:opcode.HALT~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.HALT~1_combout\ = ( !\ControlUnit:next_state.fetch~DUPLICATE_q\ & ( !\rst~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	dataf => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	combout => \ControlUnit:opcode.HALT~1_combout\);

-- Location: FF_X5_Y19_N53
\rs[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \mem|mem~44_combout\,
	sload => VCC,
	ena => \ControlUnit:opcode.HALT~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs[1][0]~q\);

-- Location: LABCELL_X5_Y19_N18
\mem|mem_rtl_0_bypass[20]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem_rtl_0_bypass[20]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \mem|mem_rtl_0_bypass[20]~feeder_combout\);

-- Location: FF_X5_Y19_N19
\mem|mem_rtl_0_bypass[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem_rtl_0_bypass[20]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(20));

-- Location: LABCELL_X6_Y19_N30
\mem|mem_rtl_0_bypass[19]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem_rtl_0_bypass[19]~3_combout\ = ( !wb(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(1),
	combout => \mem|mem_rtl_0_bypass[19]~3_combout\);

-- Location: FF_X5_Y19_N23
\mem|mem_rtl_0_bypass[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \mem|mem_rtl_0_bypass[19]~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(19));

-- Location: MLABCELL_X4_Y19_N0
\mem|mem~58\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~58_combout\ = ( !wb(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(1),
	combout => \mem|mem~58_combout\);

-- Location: FF_X4_Y19_N2
\mem|mem~19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem~58_combout\,
	ena => \mem|mem~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem~19_q\);

-- Location: MLABCELL_X4_Y19_N3
\mem|mem~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~45_combout\ = ( \mem|mem_rtl_0|auto_generated|ram_block1a1\ & ( (!\mem|mem~19_q\) # (\mem|mem~17DUPLICATE_q\) ) ) # ( !\mem|mem_rtl_0|auto_generated|ram_block1a1\ & ( (!\mem|mem~19_q\ & !\mem|mem~17DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000101000001010000010101111101011111010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~19_q\,
	datac => \mem|ALT_INV_mem~17DUPLICATE_q\,
	dataf => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a1\,
	combout => \mem|mem~45_combout\);

-- Location: LABCELL_X5_Y19_N33
\mem|mem~46\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~46_combout\ = ( \mem|mem~28_combout\ & ( \mem|mem~45_combout\ & ( (!\mem|mem_rtl_0_bypass\(19)) # ((\mem|mem_rtl_0_bypass\(20) & ((!\mem|mem~27_combout\) # (!\mem|mem~26_combout\)))) ) ) ) # ( !\mem|mem~28_combout\ & ( \mem|mem~45_combout\ & ( 
-- (!\mem|mem_rtl_0_bypass\(19)) # (\mem|mem_rtl_0_bypass\(20)) ) ) ) # ( \mem|mem~28_combout\ & ( !\mem|mem~45_combout\ & ( (!\mem|mem_rtl_0_bypass\(19) & ((!\mem|mem_rtl_0_bypass\(20)) # ((\mem|mem~27_combout\ & \mem|mem~26_combout\)))) ) ) ) # ( 
-- !\mem|mem~28_combout\ & ( !\mem|mem~45_combout\ & ( (!\mem|mem_rtl_0_bypass\(20) & !\mem|mem_rtl_0_bypass\(19)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000000000110011010000000011111111001100111111111100110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~27_combout\,
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(20),
	datac => \mem|ALT_INV_mem~26_combout\,
	datad => \mem|ALT_INV_mem_rtl_0_bypass\(19),
	datae => \mem|ALT_INV_mem~28_combout\,
	dataf => \mem|ALT_INV_mem~45_combout\,
	combout => \mem|mem~46_combout\);

-- Location: FF_X5_Y19_N47
\rs[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \mem|mem~46_combout\,
	sload => VCC,
	ena => \ControlUnit:opcode.HALT~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs[1][1]~q\);

-- Location: LABCELL_X5_Y19_N12
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\rs[1][0]~q\ & \rs[1][1]~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_rs[1][0]~q\,
	datad => \ALT_INV_rs[1][1]~q\,
	combout => \Equal0~0_combout\);

-- Location: FF_X5_Y21_N41
\alu_in[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \alu_in[1][2]~feeder_combout\,
	asdata => \mem|mem~48_combout\,
	sload => \Equal0~0_combout\,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[1][2]~q\);

-- Location: FF_X6_Y20_N8
\alu_in[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(1),
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[0][1]~q\);

-- Location: FF_X6_Y20_N29
\alu_in[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(0),
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[0][0]~q\);

-- Location: LABCELL_X5_Y19_N15
\alu_in[1][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu_in[1][0]~feeder_combout\ = ( wb(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(0),
	combout => \alu_in[1][0]~feeder_combout\);

-- Location: FF_X5_Y19_N17
\alu_in[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \alu_in[1][0]~feeder_combout\,
	asdata => \mem|mem~44_combout\,
	sload => \Equal0~0_combout\,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[1][0]~q\);

-- Location: LABCELL_X6_Y20_N30
\alu|Add0~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Add0~34_cout\ = CARRY(( !\alu_op.ADD~q\ ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_alu_op.ADD~q\,
	cin => GND,
	cout => \alu|Add0~34_cout\);

-- Location: LABCELL_X6_Y20_N33
\alu|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Add0~1_sumout\ = SUM(( !\alu_op.ADD~q\ $ (\alu_in[1][0]~q\) ) + ( \alu_in[0][0]~q\ ) + ( \alu|Add0~34_cout\ ))
-- \alu|Add0~2\ = CARRY(( !\alu_op.ADD~q\ $ (\alu_in[1][0]~q\) ) + ( \alu_in[0][0]~q\ ) + ( \alu|Add0~34_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000001100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_in[0][0]~q\,
	datab => \ALT_INV_alu_op.ADD~q\,
	datac => \ALT_INV_alu_in[1][0]~q\,
	cin => \alu|Add0~34_cout\,
	sumout => \alu|Add0~1_sumout\,
	cout => \alu|Add0~2\);

-- Location: LABCELL_X6_Y20_N36
\alu|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Add0~5_sumout\ = SUM(( !\alu_op.ADD~q\ $ (\alu_in[1][1]~q\) ) + ( \alu_in[0][1]~q\ ) + ( \alu|Add0~2\ ))
-- \alu|Add0~6\ = CARRY(( !\alu_op.ADD~q\ $ (\alu_in[1][1]~q\) ) + ( \alu_in[0][1]~q\ ) + ( \alu|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000001111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_alu_in[0][1]~q\,
	datac => \ALT_INV_alu_op.ADD~q\,
	datad => \ALT_INV_alu_in[1][1]~q\,
	cin => \alu|Add0~2\,
	sumout => \alu|Add0~5_sumout\,
	cout => \alu|Add0~6\);

-- Location: LABCELL_X6_Y20_N39
\alu|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Add0~9_sumout\ = SUM(( !\alu_op.ADD~q\ $ (\alu_in[1][2]~q\) ) + ( \alu_in[0][2]~q\ ) + ( \alu|Add0~6\ ))
-- \alu|Add0~10\ = CARRY(( !\alu_op.ADD~q\ $ (\alu_in[1][2]~q\) ) + ( \alu_in[0][2]~q\ ) + ( \alu|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000001111000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_in[0][2]~q\,
	datac => \ALT_INV_alu_op.ADD~q\,
	datad => \ALT_INV_alu_in[1][2]~q\,
	cin => \alu|Add0~6\,
	sumout => \alu|Add0~9_sumout\,
	cout => \alu|Add0~10\);

-- Location: LABCELL_X7_Y20_N3
\alu|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector5~0_combout\ = ( \alu_in[0][2]~q\ & ( \alu_op.LAND~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_alu_op.LAND~q\,
	dataf => \ALT_INV_alu_in[0][2]~q\,
	combout => \alu|Selector5~0_combout\);

-- Location: FF_X6_Y19_N41
\alu_op.SUB\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ControlUnit:opcode.SUB~q\,
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_op.SUB~q\);

-- Location: FF_X6_Y19_N38
\alu_op.LOR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ControlUnit:opcode.LOR~q\,
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_op.LOR~q\);

-- Location: FF_X6_Y19_N20
\alu_op.LNOT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ControlUnit:opcode.LNOT~q\,
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_op.LNOT~q\);

-- Location: LABCELL_X6_Y19_N21
\alu|Selector5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector5~1_combout\ = ( \alu_op.LAND~q\ & ( \alu_op.LNOT~q\ & ( !\alu_op.LOR~q\ ) ) ) # ( !\alu_op.LAND~q\ & ( \alu_op.LNOT~q\ & ( !\alu_op.LOR~q\ ) ) ) # ( \alu_op.LAND~q\ & ( !\alu_op.LNOT~q\ & ( !\alu_op.LOR~q\ ) ) ) # ( !\alu_op.LAND~q\ & ( 
-- !\alu_op.LNOT~q\ & ( (!\alu_op.LOR~q\ & (((\alu_op.CMP~q\) # (\alu_op.SUB~q\)) # (\alu_op.ADD~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111100000000111111110000000011111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_op.ADD~q\,
	datab => \ALT_INV_alu_op.SUB~q\,
	datac => \ALT_INV_alu_op.CMP~q\,
	datad => \ALT_INV_alu_op.LOR~q\,
	datae => \ALT_INV_alu_op.LAND~q\,
	dataf => \ALT_INV_alu_op.LNOT~q\,
	combout => \alu|Selector5~1_combout\);

-- Location: LABCELL_X2_Y19_N33
\alu|Selector5~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector5~2_combout\ = ( \alu_op.LNOT~q\ & ( \alu_op.LOR~q\ ) ) # ( !\alu_op.LNOT~q\ & ( \alu_op.LOR~q\ & ( \alu_in[0][2]~q\ ) ) ) # ( \alu_op.LNOT~q\ & ( !\alu_op.LOR~q\ & ( !\alu_in[0][2]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101001010101010101011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_in[0][2]~q\,
	datae => \ALT_INV_alu_op.LNOT~q\,
	dataf => \ALT_INV_alu_op.LOR~q\,
	combout => \alu|Selector5~2_combout\);

-- Location: LABCELL_X2_Y20_N0
\alu|Selector5~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector5~3_combout\ = ( \alu_in[1][2]~q\ & ( !\alu|Selector5~2_combout\ & ( (!\alu|Selector5~0_combout\ & (\alu|Selector5~1_combout\ & ((!\alu|Add0~9_sumout\) # (\alu|WideNor0~0_combout\)))) ) ) ) # ( !\alu_in[1][2]~q\ & ( !\alu|Selector5~2_combout\ 
-- & ( (!\alu|Add0~9_sumout\) # (\alu|WideNor0~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101110111011000000001011000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_Add0~9_sumout\,
	datab => \alu|ALT_INV_WideNor0~0_combout\,
	datac => \alu|ALT_INV_Selector5~0_combout\,
	datad => \alu|ALT_INV_Selector5~1_combout\,
	datae => \ALT_INV_alu_in[1][2]~q\,
	dataf => \alu|ALT_INV_Selector5~2_combout\,
	combout => \alu|Selector5~3_combout\);

-- Location: LABCELL_X7_Y20_N33
\mem|mem~39\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~39_combout\ = ( \mem|mem~27_combout\ & ( (\mem|mem_rtl_0_bypass\(22) & ((!\mem|mem~26_combout\) # (!\mem|mem~28_combout\))) ) ) # ( !\mem|mem~27_combout\ & ( \mem|mem_rtl_0_bypass\(22) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100000011001100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(22),
	datac => \mem|ALT_INV_mem~26_combout\,
	datad => \mem|ALT_INV_mem~28_combout\,
	dataf => \mem|ALT_INV_mem~27_combout\,
	combout => \mem|mem~39_combout\);

-- Location: MLABCELL_X9_Y20_N18
\Selector15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = ( \mem|mem_rtl_0|auto_generated|ram_block1a2\ & ( \mem|mem~39_combout\ & ( (\Selector17~0_combout\ & ((\mem|mem~20_q\) # (\mem|mem~17DUPLICATE_q\))) ) ) ) # ( !\mem|mem_rtl_0|auto_generated|ram_block1a2\ & ( \mem|mem~39_combout\ & 
-- ( (!\mem|mem~17DUPLICATE_q\ & (\mem|mem~20_q\ & \Selector17~0_combout\)) ) ) ) # ( \mem|mem_rtl_0|auto_generated|ram_block1a2\ & ( !\mem|mem~39_combout\ & ( (\mem|mem_rtl_0_bypass\(21) & \Selector17~0_combout\) ) ) ) # ( 
-- !\mem|mem_rtl_0|auto_generated|ram_block1a2\ & ( !\mem|mem~39_combout\ & ( (\mem|mem_rtl_0_bypass\(21) & \Selector17~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000001000100000000001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~17DUPLICATE_q\,
	datab => \mem|ALT_INV_mem~20_q\,
	datac => \mem|ALT_INV_mem_rtl_0_bypass\(21),
	datad => \ALT_INV_Selector17~0_combout\,
	datae => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a2\,
	dataf => \mem|ALT_INV_mem~39_combout\,
	combout => \Selector15~0_combout\);

-- Location: MLABCELL_X9_Y20_N27
\Selector15~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector15~1_combout\ = ( \ControlUnit:opcode.MOV~q\ & ( \Selector15~0_combout\ ) ) # ( !\ControlUnit:opcode.MOV~q\ & ( \Selector15~0_combout\ ) ) # ( \ControlUnit:opcode.MOV~q\ & ( !\Selector15~0_combout\ & ( !\alu|Selector5~3_combout\ ) ) ) # ( 
-- !\ControlUnit:opcode.MOV~q\ & ( !\Selector15~0_combout\ & ( (!\ControlUnit:opcode.DIN~q\ & (((!\alu|Selector5~3_combout\ & !\next_state~1_combout\)))) # (\ControlUnit:opcode.DIN~q\ & (\input[2]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100010100000101110011001100110011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[2]~input_o\,
	datab => \alu|ALT_INV_Selector5~3_combout\,
	datac => \ALT_INV_ControlUnit:opcode.DIN~q\,
	datad => \ALT_INV_next_state~1_combout\,
	datae => \ALT_INV_ControlUnit:opcode.MOV~q\,
	dataf => \ALT_INV_Selector15~0_combout\,
	combout => \Selector15~1_combout\);

-- Location: LABCELL_X1_Y21_N48
\wb[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \wb[0]~0_combout\ = ( \ControlUnit:next_state.write_back~q\ & ( !\ControlUnit:opcode.STORE~q\ & ( !\rst~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_rst~input_o\,
	datae => \ALT_INV_ControlUnit:next_state.write_back~q\,
	dataf => \ALT_INV_ControlUnit:opcode.STORE~q\,
	combout => \wb[0]~0_combout\);

-- Location: FF_X9_Y20_N29
\wb[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector15~1_combout\,
	ena => \wb[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => wb(2));

-- Location: MLABCELL_X4_Y21_N48
\mem|mem~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~49_combout\ = ( \mem|mem~21_q\ & ( \mem|mem_rtl_0|auto_generated|ram_block1a3\ ) ) # ( !\mem|mem~21_q\ & ( \mem|mem_rtl_0|auto_generated|ram_block1a3\ & ( \mem|mem~17DUPLICATE_q\ ) ) ) # ( \mem|mem~21_q\ & ( 
-- !\mem|mem_rtl_0|auto_generated|ram_block1a3\ & ( !\mem|mem~17DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \mem|ALT_INV_mem~17DUPLICATE_q\,
	datae => \mem|ALT_INV_mem~21_q\,
	dataf => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a3\,
	combout => \mem|mem~49_combout\);

-- Location: MLABCELL_X4_Y21_N6
\mem|mem~50\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~50_combout\ = ( \mem|mem_rtl_0_bypass\(23) & ( \mem|mem~49_combout\ ) ) # ( !\mem|mem_rtl_0_bypass\(23) & ( \mem|mem~49_combout\ & ( (\mem|mem_rtl_0_bypass\(24) & ((!\mem|mem~28_combout\) # ((!\mem|mem~26_combout\) # (!\mem|mem~27_combout\)))) ) 
-- ) ) # ( \mem|mem_rtl_0_bypass\(23) & ( !\mem|mem~49_combout\ & ( (!\mem|mem_rtl_0_bypass\(24)) # ((\mem|mem~28_combout\ & (\mem|mem~26_combout\ & \mem|mem~27_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110100110011001100101111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~28_combout\,
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(24),
	datac => \mem|ALT_INV_mem~26_combout\,
	datad => \mem|ALT_INV_mem~27_combout\,
	datae => \mem|ALT_INV_mem_rtl_0_bypass\(23),
	dataf => \mem|ALT_INV_mem~49_combout\,
	combout => \mem|mem~50_combout\);

-- Location: MLABCELL_X4_Y21_N15
\Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = ( \Selector3~2_combout\ & ( (!\Selector3~0_combout\ & (\ControlUnit:pc[3]~q\)) # (\Selector3~0_combout\ & ((\Add0~13_sumout\))) ) ) # ( !\Selector3~2_combout\ & ( (!\Selector3~0_combout\ & (\ControlUnit:pc[3]~q\)) # 
-- (\Selector3~0_combout\ & ((\mem|mem~50_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001111010101010000111101010101001100110101010100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:pc[3]~q\,
	datab => \ALT_INV_Add0~13_sumout\,
	datac => \mem|ALT_INV_mem~50_combout\,
	datad => \ALT_INV_Selector3~0_combout\,
	dataf => \ALT_INV_Selector3~2_combout\,
	combout => \Selector4~0_combout\);

-- Location: MLABCELL_X4_Y21_N27
\ControlUnit:pc[3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:pc[3]~feeder_combout\ = \Selector4~0_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Selector4~0_combout\,
	combout => \ControlUnit:pc[3]~feeder_combout\);

-- Location: FF_X4_Y21_N29
\ControlUnit:pc[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:pc[3]~feeder_combout\,
	asdata => \Add0~13_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_ControlUnit:next_state.execute~q\,
	ena => \Selector31~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:pc[3]~q\);

-- Location: LABCELL_X5_Y20_N42
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( \ControlUnit:pc[4]~q\ ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~18\ = CARRY(( \ControlUnit:pc[4]~q\ ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_ControlUnit:pc[4]~q\,
	cin => \Add0~14\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: MLABCELL_X4_Y21_N39
\Selector3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = ( \Selector3~2_combout\ & ( (!\Selector3~0_combout\ & (\ControlUnit:pc[4]~q\)) # (\Selector3~0_combout\ & ((\Add0~17_sumout\))) ) ) # ( !\Selector3~2_combout\ & ( (!\Selector3~0_combout\ & (\ControlUnit:pc[4]~q\)) # 
-- (\Selector3~0_combout\ & ((\mem|mem~37_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001011111010100000101111101010011010100110101001101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:pc[4]~q\,
	datab => \ALT_INV_Add0~17_sumout\,
	datac => \ALT_INV_Selector3~0_combout\,
	datad => \mem|ALT_INV_mem~37_combout\,
	dataf => \ALT_INV_Selector3~2_combout\,
	combout => \Selector3~1_combout\);

-- Location: MLABCELL_X4_Y21_N36
\ControlUnit:pc[4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:pc[4]~feeder_combout\ = \Selector3~1_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Selector3~1_combout\,
	combout => \ControlUnit:pc[4]~feeder_combout\);

-- Location: FF_X4_Y21_N38
\ControlUnit:pc[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:pc[4]~feeder_combout\,
	asdata => \Add0~17_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_ControlUnit:next_state.execute~q\,
	ena => \Selector31~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:pc[4]~q\);

-- Location: LABCELL_X5_Y20_N45
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( \ControlUnit:pc[5]~q\ ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( \ControlUnit:pc[5]~q\ ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ControlUnit:pc[5]~q\,
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: LABCELL_X5_Y20_N15
\Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = ( \ControlUnit:pc[5]~q\ & ( (!\Selector3~0_combout\) # ((!\Selector3~2_combout\ & (\mem|mem~35_combout\)) # (\Selector3~2_combout\ & ((\Add0~21_sumout\)))) ) ) # ( !\ControlUnit:pc[5]~q\ & ( (\Selector3~0_combout\ & 
-- ((!\Selector3~2_combout\ & (\mem|mem~35_combout\)) # (\Selector3~2_combout\ & ((\Add0~21_sumout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010101000100000001010110111010101111111011101010111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector3~0_combout\,
	datab => \mem|ALT_INV_mem~35_combout\,
	datac => \ALT_INV_Selector3~2_combout\,
	datad => \ALT_INV_Add0~21_sumout\,
	dataf => \ALT_INV_ControlUnit:pc[5]~q\,
	combout => \Selector2~0_combout\);

-- Location: FF_X5_Y20_N17
\ControlUnit:pc[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector2~0_combout\,
	asdata => \Add0~21_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_ControlUnit:next_state.execute~q\,
	ena => \Selector31~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:pc[5]~q\);

-- Location: LABCELL_X5_Y20_N48
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( \ControlUnit:pc[6]~q\ ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( \ControlUnit:pc[6]~q\ ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ControlUnit:pc[6]~q\,
	cin => \Add0~22\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: LABCELL_X2_Y20_N6
\Selector30~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector30~0_combout\ = ( \ControlUnit:pc[6]~q\ & ( \Selector1~0_combout\ & ( (!\Selector31~0_combout\ & ((!\alu|Selector1~2_combout\) # ((\Selector31~1_combout\)))) # (\Selector31~0_combout\ & (((!\Selector31~1_combout\) # (\Add0~25_sumout\)))) ) ) ) # 
-- ( !\ControlUnit:pc[6]~q\ & ( \Selector1~0_combout\ & ( (!\Selector31~0_combout\ & ((!\alu|Selector1~2_combout\) # ((\Selector31~1_combout\)))) # (\Selector31~0_combout\ & (((\Selector31~1_combout\ & \Add0~25_sumout\)))) ) ) ) # ( \ControlUnit:pc[6]~q\ & ( 
-- !\Selector1~0_combout\ & ( (!\Selector31~0_combout\ & (!\alu|Selector1~2_combout\ & (!\Selector31~1_combout\))) # (\Selector31~0_combout\ & (((!\Selector31~1_combout\) # (\Add0~25_sumout\)))) ) ) ) # ( !\ControlUnit:pc[6]~q\ & ( !\Selector1~0_combout\ & ( 
-- (!\Selector31~0_combout\ & (!\alu|Selector1~2_combout\ & (!\Selector31~1_combout\))) # (\Selector31~0_combout\ & (((\Selector31~1_combout\ & \Add0~25_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000101110100001101010110001010100011111101101011011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector31~0_combout\,
	datab => \alu|ALT_INV_Selector1~2_combout\,
	datac => \ALT_INV_Selector31~1_combout\,
	datad => \ALT_INV_Add0~25_sumout\,
	datae => \ALT_INV_ControlUnit:pc[6]~q\,
	dataf => \ALT_INV_Selector1~0_combout\,
	combout => \Selector30~0_combout\);

-- Location: FF_X2_Y20_N8
\address[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector30~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(6));

-- Location: MLABCELL_X4_Y20_N6
\mem|mem~42\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~42_combout\ = ( \mem|mem~26_combout\ & ( (\mem|mem_rtl_0_bypass\(28) & ((!\mem|mem~28_combout\) # (!\mem|mem~27_combout\))) ) ) # ( !\mem|mem~26_combout\ & ( \mem|mem_rtl_0_bypass\(28) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001110000011100000111000001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~28_combout\,
	datab => \mem|ALT_INV_mem~27_combout\,
	datac => \mem|ALT_INV_mem_rtl_0_bypass\(28),
	dataf => \mem|ALT_INV_mem~26_combout\,
	combout => \mem|mem~42_combout\);

-- Location: MLABCELL_X4_Y20_N54
\Selector12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = ( \mem|mem_rtl_0|auto_generated|ram_block1a5\ & ( \mem|mem~42_combout\ & ( (\Selector17~0_combout\ & ((\mem|mem~23_q\) # (\mem|mem~17DUPLICATE_q\))) ) ) ) # ( !\mem|mem_rtl_0|auto_generated|ram_block1a5\ & ( \mem|mem~42_combout\ & 
-- ( (!\mem|mem~17DUPLICATE_q\ & (\Selector17~0_combout\ & \mem|mem~23_q\)) ) ) ) # ( \mem|mem_rtl_0|auto_generated|ram_block1a5\ & ( !\mem|mem~42_combout\ & ( (\mem|mem_rtl_0_bypass\(27) & \Selector17~0_combout\) ) ) ) # ( 
-- !\mem|mem_rtl_0|auto_generated|ram_block1a5\ & ( !\mem|mem~42_combout\ & ( (\mem|mem_rtl_0_bypass\(27) & \Selector17~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000000000011000000001100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem_rtl_0_bypass\(27),
	datab => \mem|ALT_INV_mem~17DUPLICATE_q\,
	datac => \ALT_INV_Selector17~0_combout\,
	datad => \mem|ALT_INV_mem~23_q\,
	datae => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a5\,
	dataf => \mem|ALT_INV_mem~42_combout\,
	combout => \Selector12~0_combout\);

-- Location: LABCELL_X7_Y20_N12
\Selector12~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector12~1_combout\ = ( \Selector12~0_combout\ & ( \alu|Selector2~2_combout\ ) ) # ( !\Selector12~0_combout\ & ( \alu|Selector2~2_combout\ & ( (\input[5]~input_o\ & (!\ControlUnit:opcode.MOV~q\ & \ControlUnit:opcode.DIN~q\)) ) ) ) # ( 
-- \Selector12~0_combout\ & ( !\alu|Selector2~2_combout\ ) ) # ( !\Selector12~0_combout\ & ( !\alu|Selector2~2_combout\ & ( ((!\ControlUnit:opcode.DIN~q\ & ((!\next_state~1_combout\))) # (\ControlUnit:opcode.DIN~q\ & (\input[5]~input_o\))) # 
-- (\ControlUnit:opcode.MOV~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111011100110111111111111111111100000100000001001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_input[5]~input_o\,
	datab => \ALT_INV_ControlUnit:opcode.MOV~q\,
	datac => \ALT_INV_ControlUnit:opcode.DIN~q\,
	datad => \ALT_INV_next_state~1_combout\,
	datae => \ALT_INV_Selector12~0_combout\,
	dataf => \alu|ALT_INV_Selector2~2_combout\,
	combout => \Selector12~1_combout\);

-- Location: FF_X7_Y20_N14
\wb[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector12~1_combout\,
	ena => \wb[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => wb(5));

-- Location: FF_X6_Y20_N35
\alu_in[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(5),
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[0][5]~q\);

-- Location: LABCELL_X5_Y21_N33
\alu_in[1][5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu_in[1][5]~feeder_combout\ = ( wb(5) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(5),
	combout => \alu_in[1][5]~feeder_combout\);

-- Location: FF_X5_Y21_N35
\alu_in[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \alu_in[1][5]~feeder_combout\,
	asdata => \mem|mem~35_combout\,
	sload => \Equal0~0_combout\,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[1][5]~q\);

-- Location: LABCELL_X5_Y21_N27
\alu_in[1][4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu_in[1][4]~feeder_combout\ = ( wb(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(4),
	combout => \alu_in[1][4]~feeder_combout\);

-- Location: FF_X5_Y21_N29
\alu_in[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \alu_in[1][4]~feeder_combout\,
	asdata => \mem|mem~37_combout\,
	sload => \Equal0~0_combout\,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[1][4]~q\);

-- Location: FF_X6_Y20_N26
\alu_in[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(3),
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[0][3]~q\);

-- Location: LABCELL_X6_Y20_N42
\alu|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Add0~13_sumout\ = SUM(( !\alu_in[1][3]~q\ $ (\alu_op.ADD~q\) ) + ( \alu_in[0][3]~q\ ) + ( \alu|Add0~10\ ))
-- \alu|Add0~14\ = CARRY(( !\alu_in[1][3]~q\ $ (\alu_op.ADD~q\) ) + ( \alu_in[0][3]~q\ ) + ( \alu|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001001100110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_in[1][3]~q\,
	datab => \ALT_INV_alu_op.ADD~q\,
	datac => \ALT_INV_alu_in[0][3]~q\,
	cin => \alu|Add0~10\,
	sumout => \alu|Add0~13_sumout\,
	cout => \alu|Add0~14\);

-- Location: LABCELL_X6_Y20_N45
\alu|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Add0~17_sumout\ = SUM(( \alu_in[0][4]~q\ ) + ( !\alu_op.ADD~q\ $ (\alu_in[1][4]~q\) ) + ( \alu|Add0~14\ ))
-- \alu|Add0~18\ = CARRY(( \alu_in[0][4]~q\ ) + ( !\alu_op.ADD~q\ $ (\alu_in[1][4]~q\) ) + ( \alu|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001111000011110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_alu_op.ADD~q\,
	datac => \ALT_INV_alu_in[1][4]~q\,
	datad => \ALT_INV_alu_in[0][4]~q\,
	cin => \alu|Add0~14\,
	sumout => \alu|Add0~17_sumout\,
	cout => \alu|Add0~18\);

-- Location: LABCELL_X6_Y20_N48
\alu|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Add0~21_sumout\ = SUM(( !\alu_op.ADD~q\ $ (\alu_in[1][5]~q\) ) + ( \alu_in[0][5]~q\ ) + ( \alu|Add0~18\ ))
-- \alu|Add0~22\ = CARRY(( !\alu_op.ADD~q\ $ (\alu_in[1][5]~q\) ) + ( \alu_in[0][5]~q\ ) + ( \alu|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001010101001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_op.ADD~q\,
	datac => \ALT_INV_alu_in[0][5]~q\,
	datad => \ALT_INV_alu_in[1][5]~q\,
	cin => \alu|Add0~18\,
	sumout => \alu|Add0~21_sumout\,
	cout => \alu|Add0~22\);

-- Location: LABCELL_X7_Y20_N54
\alu|Selector2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector2~1_combout\ = ( \alu_op.LNOT~q\ & ( (!\alu_in[0][5]~q\) # (\alu_op.LOR~q\) ) ) # ( !\alu_op.LNOT~q\ & ( (\alu_in[0][5]~q\ & \alu_op.LOR~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010110101111101011111010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_in[0][5]~q\,
	datac => \ALT_INV_alu_op.LOR~q\,
	dataf => \ALT_INV_alu_op.LNOT~q\,
	combout => \alu|Selector2~1_combout\);

-- Location: LABCELL_X7_Y20_N57
\alu|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector2~0_combout\ = ( \alu_in[0][5]~q\ & ( \alu_op.LAND~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_alu_op.LAND~q\,
	dataf => \ALT_INV_alu_in[0][5]~q\,
	combout => \alu|Selector2~0_combout\);

-- Location: LABCELL_X7_Y20_N24
\alu|Selector2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector2~2_combout\ = ( \alu|Selector2~0_combout\ & ( \alu|WideNor0~0_combout\ & ( (!\alu|Selector2~1_combout\ & !\alu_in[1][5]~q\) ) ) ) # ( !\alu|Selector2~0_combout\ & ( \alu|WideNor0~0_combout\ & ( (!\alu|Selector2~1_combout\ & 
-- ((!\alu_in[1][5]~q\) # (\alu|Selector5~1_combout\))) ) ) ) # ( \alu|Selector2~0_combout\ & ( !\alu|WideNor0~0_combout\ & ( (!\alu|Add0~21_sumout\ & (!\alu|Selector2~1_combout\ & !\alu_in[1][5]~q\)) ) ) ) # ( !\alu|Selector2~0_combout\ & ( 
-- !\alu|WideNor0~0_combout\ & ( (!\alu|Add0~21_sumout\ & (!\alu|Selector2~1_combout\ & ((!\alu_in[1][5]~q\) # (\alu|Selector5~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000100000101000000000000011110000001100001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_Add0~21_sumout\,
	datab => \alu|ALT_INV_Selector5~1_combout\,
	datac => \alu|ALT_INV_Selector2~1_combout\,
	datad => \ALT_INV_alu_in[1][5]~q\,
	datae => \alu|ALT_INV_Selector2~0_combout\,
	dataf => \alu|ALT_INV_WideNor0~0_combout\,
	combout => \alu|Selector2~2_combout\);

-- Location: MLABCELL_X4_Y20_N12
\Selector31~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector31~2_combout\ = ( \Selector31~0_combout\ & ( \Selector2~0_combout\ & ( (!\Selector31~1_combout\ & ((\ControlUnit:pc[5]~q\))) # (\Selector31~1_combout\ & (\Add0~21_sumout\)) ) ) ) # ( !\Selector31~0_combout\ & ( \Selector2~0_combout\ & ( 
-- (!\alu|Selector2~2_combout\) # (\Selector31~1_combout\) ) ) ) # ( \Selector31~0_combout\ & ( !\Selector2~0_combout\ & ( (!\Selector31~1_combout\ & ((\ControlUnit:pc[5]~q\))) # (\Selector31~1_combout\ & (\Add0~21_sumout\)) ) ) ) # ( !\Selector31~0_combout\ 
-- & ( !\Selector2~0_combout\ & ( (!\alu|Selector2~2_combout\ & !\Selector31~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010001000000000111100111110111011101110110000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_Selector2~2_combout\,
	datab => \ALT_INV_Selector31~1_combout\,
	datac => \ALT_INV_Add0~21_sumout\,
	datad => \ALT_INV_ControlUnit:pc[5]~q\,
	datae => \ALT_INV_Selector31~0_combout\,
	dataf => \ALT_INV_Selector2~0_combout\,
	combout => \Selector31~2_combout\);

-- Location: FF_X4_Y20_N56
\address[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector31~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(5));

-- Location: LABCELL_X6_Y21_N24
\Selector13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = ( \Selector17~0_combout\ & ( \mem|mem_rtl_0|auto_generated|ram_block1a4\ & ( (!\mem|mem~41_combout\ & (\mem|mem_rtl_0_bypass\(25))) # (\mem|mem~41_combout\ & (((\mem|mem~22_q\) # (\mem|mem~17DUPLICATE_q\)))) ) ) ) # ( 
-- \Selector17~0_combout\ & ( !\mem|mem_rtl_0|auto_generated|ram_block1a4\ & ( (!\mem|mem~41_combout\ & (\mem|mem_rtl_0_bypass\(25))) # (\mem|mem~41_combout\ & (((!\mem|mem~17DUPLICATE_q\ & \mem|mem~22_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010001000111010000000000000000000100011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem_rtl_0_bypass\(25),
	datab => \mem|ALT_INV_mem~41_combout\,
	datac => \mem|ALT_INV_mem~17DUPLICATE_q\,
	datad => \mem|ALT_INV_mem~22_q\,
	datae => \ALT_INV_Selector17~0_combout\,
	dataf => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a4\,
	combout => \Selector13~0_combout\);

-- Location: LABCELL_X6_Y21_N33
\Selector13~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector13~1_combout\ = ( \next_state~1_combout\ & ( \alu|Selector3~2_combout\ & ( ((\ControlUnit:opcode.DIN~q\ & (\input[4]~input_o\ & !\ControlUnit:opcode.MOV~q\))) # (\Selector13~0_combout\) ) ) ) # ( !\next_state~1_combout\ & ( 
-- \alu|Selector3~2_combout\ & ( ((\ControlUnit:opcode.DIN~q\ & (\input[4]~input_o\ & !\ControlUnit:opcode.MOV~q\))) # (\Selector13~0_combout\) ) ) ) # ( \next_state~1_combout\ & ( !\alu|Selector3~2_combout\ & ( (((\ControlUnit:opcode.DIN~q\ & 
-- \input[4]~input_o\)) # (\Selector13~0_combout\)) # (\ControlUnit:opcode.MOV~q\) ) ) ) # ( !\next_state~1_combout\ & ( !\alu|Selector3~2_combout\ & ( (!\ControlUnit:opcode.DIN~q\) # (((\Selector13~0_combout\) # (\ControlUnit:opcode.MOV~q\)) # 
-- (\input[4]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011111111111111000111111111111100010000111111110001000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.DIN~q\,
	datab => \ALT_INV_input[4]~input_o\,
	datac => \ALT_INV_ControlUnit:opcode.MOV~q\,
	datad => \ALT_INV_Selector13~0_combout\,
	datae => \ALT_INV_next_state~1_combout\,
	dataf => \alu|ALT_INV_Selector3~2_combout\,
	combout => \Selector13~1_combout\);

-- Location: FF_X6_Y21_N35
\wb[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector13~1_combout\,
	ena => \wb[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => wb(4));

-- Location: FF_X6_Y20_N2
\alu_in[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(4),
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[0][4]~q\);

-- Location: LABCELL_X5_Y21_N24
\alu|Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector3~0_combout\ = (\alu_op.LAND~q\ & \alu_in[0][4]~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_op.LAND~q\,
	datac => \ALT_INV_alu_in[0][4]~q\,
	combout => \alu|Selector3~0_combout\);

-- Location: LABCELL_X6_Y19_N33
\alu|Selector3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector3~1_combout\ = ( \alu_in[0][4]~q\ & ( \alu_op.LOR~q\ ) ) # ( !\alu_in[0][4]~q\ & ( \alu_op.LNOT~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_op.LNOT~q\,
	datad => \ALT_INV_alu_op.LOR~q\,
	dataf => \ALT_INV_alu_in[0][4]~q\,
	combout => \alu|Selector3~1_combout\);

-- Location: LABCELL_X5_Y21_N9
\alu|Selector3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector3~2_combout\ = ( \alu|Selector5~1_combout\ & ( \alu|Add0~17_sumout\ & ( (!\alu|Selector3~1_combout\ & (\alu|WideNor0~0_combout\ & ((!\alu|Selector3~0_combout\) # (!\alu_in[1][4]~q\)))) ) ) ) # ( !\alu|Selector5~1_combout\ & ( 
-- \alu|Add0~17_sumout\ & ( (!\alu|Selector3~1_combout\ & (\alu|WideNor0~0_combout\ & !\alu_in[1][4]~q\)) ) ) ) # ( \alu|Selector5~1_combout\ & ( !\alu|Add0~17_sumout\ & ( (!\alu|Selector3~1_combout\ & ((!\alu|Selector3~0_combout\) # (!\alu_in[1][4]~q\))) ) 
-- ) ) # ( !\alu|Selector5~1_combout\ & ( !\alu|Add0~17_sumout\ & ( (!\alu|Selector3~1_combout\ & !\alu_in[1][4]~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000000000110011001000100000001100000000000000110000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_Selector3~0_combout\,
	datab => \alu|ALT_INV_Selector3~1_combout\,
	datac => \alu|ALT_INV_WideNor0~0_combout\,
	datad => \ALT_INV_alu_in[1][4]~q\,
	datae => \alu|ALT_INV_Selector5~1_combout\,
	dataf => \alu|ALT_INV_Add0~17_sumout\,
	combout => \alu|Selector3~2_combout\);

-- Location: MLABCELL_X4_Y21_N18
\Selector32~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector32~0_combout\ = ( \ControlUnit:pc[4]~q\ & ( \Selector3~1_combout\ & ( (!\Selector31~1_combout\ & ((!\alu|Selector3~2_combout\) # ((\Selector31~0_combout\)))) # (\Selector31~1_combout\ & (((!\Selector31~0_combout\) # (\Add0~17_sumout\)))) ) ) ) # 
-- ( !\ControlUnit:pc[4]~q\ & ( \Selector3~1_combout\ & ( (!\Selector31~1_combout\ & (!\alu|Selector3~2_combout\ & ((!\Selector31~0_combout\)))) # (\Selector31~1_combout\ & (((!\Selector31~0_combout\) # (\Add0~17_sumout\)))) ) ) ) # ( \ControlUnit:pc[4]~q\ & 
-- ( !\Selector3~1_combout\ & ( (!\Selector31~1_combout\ & ((!\alu|Selector3~2_combout\) # ((\Selector31~0_combout\)))) # (\Selector31~1_combout\ & (((\Add0~17_sumout\ & \Selector31~0_combout\)))) ) ) ) # ( !\ControlUnit:pc[4]~q\ & ( !\Selector3~1_combout\ & 
-- ( (!\Selector31~1_combout\ & (!\alu|Selector3~2_combout\ & ((!\Selector31~0_combout\)))) # (\Selector31~1_combout\ & (((\Add0~17_sumout\ & \Selector31~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000011101000001111001110101111000000111010111111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_Selector3~2_combout\,
	datab => \ALT_INV_Add0~17_sumout\,
	datac => \ALT_INV_Selector31~1_combout\,
	datad => \ALT_INV_Selector31~0_combout\,
	datae => \ALT_INV_ControlUnit:pc[4]~q\,
	dataf => \ALT_INV_Selector3~1_combout\,
	combout => \Selector32~0_combout\);

-- Location: FF_X4_Y21_N20
\address[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector32~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(4));

-- Location: LABCELL_X2_Y20_N57
\mem|mem~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~30_combout\ = ( \mem|mem_rtl_0|auto_generated|ram_block1a6\ & ( (!\mem|mem~24_q\) # (\mem|mem~17DUPLICATE_q\) ) ) # ( !\mem|mem_rtl_0|auto_generated|ram_block1a6\ & ( (!\mem|mem~17DUPLICATE_q\ & !\mem|mem~24_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000101000001010000011110101111101011111010111110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~17DUPLICATE_q\,
	datac => \mem|ALT_INV_mem~24_q\,
	dataf => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a6\,
	combout => \mem|mem~30_combout\);

-- Location: LABCELL_X6_Y19_N9
\RotateRight0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \RotateRight0~1_combout\ = ( \mem|mem~32_combout\ & ( \mem|mem~30_combout\ & ( (\mem|mem_rtl_0_bypass\(29) & (!\mem|mem~31_combout\ & ((!\mem|mem_rtl_0_bypass\(31)) # (\mem|mem~33_combout\)))) ) ) ) # ( !\mem|mem~32_combout\ & ( \mem|mem~30_combout\ & ( 
-- (\mem|mem_rtl_0_bypass\(29) & (!\mem|mem_rtl_0_bypass\(31) & (!\mem|mem~31_combout\ & !\mem|mem~33_combout\))) ) ) ) # ( \mem|mem~32_combout\ & ( !\mem|mem~30_combout\ & ( (!\mem|mem_rtl_0_bypass\(29) & (\mem|mem~31_combout\ & 
-- ((!\mem|mem_rtl_0_bypass\(31)) # (\mem|mem~33_combout\)))) # (\mem|mem_rtl_0_bypass\(29) & ((!\mem|mem_rtl_0_bypass\(31)) # ((\mem|mem~33_combout\)))) ) ) ) # ( !\mem|mem~32_combout\ & ( !\mem|mem~30_combout\ & ( (!\mem|mem_rtl_0_bypass\(31) & 
-- (!\mem|mem~33_combout\ & ((\mem|mem~31_combout\) # (\mem|mem_rtl_0_bypass\(29))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100110000000000010011000101111101000000000000000100000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem_rtl_0_bypass\(29),
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(31),
	datac => \mem|ALT_INV_mem~31_combout\,
	datad => \mem|ALT_INV_mem~33_combout\,
	datae => \mem|ALT_INV_mem~32_combout\,
	dataf => \mem|ALT_INV_mem~30_combout\,
	combout => \RotateRight0~1_combout\);

-- Location: LABCELL_X6_Y19_N12
\ControlUnit:opcode.LOAD~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.LOAD~0_combout\ = ( \ControlUnit:opcode.LOAD~q\ & ( \RotateRight0~1_combout\ & ( (((\mem|mem~35_combout\ & !\mem|mem~37_combout\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\)) # (\rst~input_o\) ) ) ) # ( !\ControlUnit:opcode.LOAD~q\ 
-- & ( \RotateRight0~1_combout\ & ( (!\rst~input_o\ & (\mem|mem~35_combout\ & (!\ControlUnit:next_state.fetch~DUPLICATE_q\ & !\mem|mem~37_combout\))) ) ) ) # ( \ControlUnit:opcode.LOAD~q\ & ( !\RotateRight0~1_combout\ & ( 
-- (\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010111110101111100100000000000000111111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \mem|ALT_INV_mem~35_combout\,
	datac => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datad => \mem|ALT_INV_mem~37_combout\,
	datae => \ALT_INV_ControlUnit:opcode.LOAD~q\,
	dataf => \ALT_INV_RotateRight0~1_combout\,
	combout => \ControlUnit:opcode.LOAD~0_combout\);

-- Location: FF_X6_Y19_N14
\ControlUnit:opcode.LOAD\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.LOAD~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.LOAD~q\);

-- Location: MLABCELL_X4_Y19_N48
\Selector17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = ( !\ControlUnit:opcode.MOV~q\ & ( (!\ControlUnit:opcode.DIN~q\ & ((\ControlUnit:opcode.LOAD~q\) # (\ControlUnit:opcode.STORE~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011100000000011101110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.STORE~q\,
	datab => \ALT_INV_ControlUnit:opcode.LOAD~q\,
	datad => \ALT_INV_ControlUnit:opcode.DIN~q\,
	dataf => \ALT_INV_ControlUnit:opcode.MOV~q\,
	combout => \Selector17~0_combout\);

-- Location: MLABCELL_X4_Y19_N12
\mem|mem~38\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~38_combout\ = ( \mem|mem~27_combout\ & ( (\mem|mem_rtl_0_bypass\(20) & ((!\mem|mem~26_combout\) # (!\mem|mem~28_combout\))) ) ) # ( !\mem|mem~27_combout\ & ( \mem|mem_rtl_0_bypass\(20) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011000000111100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \mem|ALT_INV_mem~26_combout\,
	datac => \mem|ALT_INV_mem_rtl_0_bypass\(20),
	datad => \mem|ALT_INV_mem~28_combout\,
	dataf => \mem|ALT_INV_mem~27_combout\,
	combout => \mem|mem~38_combout\);

-- Location: MLABCELL_X4_Y19_N6
\Selector16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = ( \mem|mem_rtl_0_bypass\(19) & ( \mem|mem_rtl_0|auto_generated|ram_block1a1\ & ( (\Selector17~0_combout\ & (\mem|mem~38_combout\ & ((!\mem|mem~19_q\) # (\mem|mem~17DUPLICATE_q\)))) ) ) ) # ( !\mem|mem_rtl_0_bypass\(19) & ( 
-- \mem|mem_rtl_0|auto_generated|ram_block1a1\ & ( (\Selector17~0_combout\ & (((!\mem|mem~19_q\) # (!\mem|mem~38_combout\)) # (\mem|mem~17DUPLICATE_q\))) ) ) ) # ( \mem|mem_rtl_0_bypass\(19) & ( !\mem|mem_rtl_0|auto_generated|ram_block1a1\ & ( 
-- (\Selector17~0_combout\ & (!\mem|mem~17DUPLICATE_q\ & (!\mem|mem~19_q\ & \mem|mem~38_combout\))) ) ) ) # ( !\mem|mem_rtl_0_bypass\(19) & ( !\mem|mem_rtl_0|auto_generated|ram_block1a1\ & ( (\Selector17~0_combout\ & ((!\mem|mem~38_combout\) # 
-- ((!\mem|mem~17DUPLICATE_q\ & !\mem|mem~19_q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101000000000000000100000001010101010100010000000001010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector17~0_combout\,
	datab => \mem|ALT_INV_mem~17DUPLICATE_q\,
	datac => \mem|ALT_INV_mem~19_q\,
	datad => \mem|ALT_INV_mem~38_combout\,
	datae => \mem|ALT_INV_mem_rtl_0_bypass\(19),
	dataf => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a1\,
	combout => \Selector16~0_combout\);

-- Location: MLABCELL_X4_Y19_N54
\Selector16~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector16~1_combout\ = ( \ControlUnit:opcode.DIN~q\ & ( \Selector16~0_combout\ ) ) # ( !\ControlUnit:opcode.DIN~q\ & ( \Selector16~0_combout\ ) ) # ( \ControlUnit:opcode.DIN~q\ & ( !\Selector16~0_combout\ & ( (!\ControlUnit:opcode.MOV~q\ & 
-- ((\input[1]~input_o\))) # (\ControlUnit:opcode.MOV~q\ & (!\alu|Selector6~1_combout\)) ) ) ) # ( !\ControlUnit:opcode.DIN~q\ & ( !\Selector16~0_combout\ & ( (!\alu|Selector6~1_combout\ & ((!\next_state~1_combout\) # (\ControlUnit:opcode.MOV~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001010100010001000101110111011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_Selector6~1_combout\,
	datab => \ALT_INV_ControlUnit:opcode.MOV~q\,
	datac => \ALT_INV_next_state~1_combout\,
	datad => \ALT_INV_input[1]~input_o\,
	datae => \ALT_INV_ControlUnit:opcode.DIN~q\,
	dataf => \ALT_INV_Selector16~0_combout\,
	combout => \Selector16~1_combout\);

-- Location: FF_X4_Y19_N56
\wb[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector16~1_combout\,
	ena => \wb[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => wb(1));

-- Location: LABCELL_X5_Y19_N27
\alu_in[1][1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu_in[1][1]~feeder_combout\ = wb(1)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_wb(1),
	combout => \alu_in[1][1]~feeder_combout\);

-- Location: FF_X5_Y19_N29
\alu_in[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \alu_in[1][1]~feeder_combout\,
	asdata => \mem|mem~46_combout\,
	sload => \Equal0~0_combout\,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[1][1]~q\);

-- Location: MLABCELL_X4_Y19_N30
\alu|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector6~0_combout\ = ( !\alu_op.LOR~q\ & ( \alu_op.LNOT~q\ & ( (\alu_in[0][1]~q\ & ((!\alu_in[1][1]~q\) # (!\alu_op.LAND~q\))) ) ) ) # ( \alu_op.LOR~q\ & ( !\alu_op.LNOT~q\ & ( (!\alu_in[1][1]~q\ & !\alu_in[0][1]~q\) ) ) ) # ( !\alu_op.LOR~q\ & ( 
-- !\alu_op.LNOT~q\ & ( (!\alu_in[1][1]~q\) # ((!\alu_in[0][1]~q\) # (!\alu_op.LAND~q\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111010101000001010000000001111000010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_in[1][1]~q\,
	datac => \ALT_INV_alu_in[0][1]~q\,
	datad => \ALT_INV_alu_op.LAND~q\,
	datae => \ALT_INV_alu_op.LOR~q\,
	dataf => \ALT_INV_alu_op.LNOT~q\,
	combout => \alu|Selector6~0_combout\);

-- Location: LABCELL_X5_Y19_N54
\alu|WideNor0\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|WideNor0~combout\ = ( !\alu_op.LAND~q\ & ( !\alu_op.LNOT~q\ & ( (!\alu_op.SUB~q\ & (!\alu_op.ADD~q\ & (!\alu_op.CMP~q\ & !\alu_op.LOR~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_op.SUB~q\,
	datab => \ALT_INV_alu_op.ADD~q\,
	datac => \ALT_INV_alu_op.CMP~q\,
	datad => \ALT_INV_alu_op.LOR~q\,
	datae => \ALT_INV_alu_op.LAND~q\,
	dataf => \ALT_INV_alu_op.LNOT~q\,
	combout => \alu|WideNor0~combout\);

-- Location: MLABCELL_X4_Y20_N30
\alu|Selector6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector6~1_combout\ = ( \alu|Add0~5_sumout\ & ( (\alu|WideNor0~0_combout\ & (\alu|Selector6~0_combout\ & ((!\alu|WideNor0~combout\) # (!\alu_in[1][1]~q\)))) ) ) # ( !\alu|Add0~5_sumout\ & ( (\alu|Selector6~0_combout\ & ((!\alu|WideNor0~combout\) # 
-- (!\alu_in[1][1]~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110000001100110011000000010001000100000001000100010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_WideNor0~0_combout\,
	datab => \alu|ALT_INV_Selector6~0_combout\,
	datac => \alu|ALT_INV_WideNor0~combout\,
	datad => \ALT_INV_alu_in[1][1]~q\,
	dataf => \alu|ALT_INV_Add0~5_sumout\,
	combout => \alu|Selector6~1_combout\);

-- Location: MLABCELL_X4_Y20_N36
\Selector35~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector35~0_combout\ = ( \Selector6~0_combout\ & ( \alu|Selector6~1_combout\ & ( (!\Selector31~0_combout\ & (((\Selector31~1_combout\)))) # (\Selector31~0_combout\ & ((!\Selector31~1_combout\ & (\ControlUnit:pc[1]~q\)) # (\Selector31~1_combout\ & 
-- ((\Add0~5_sumout\))))) ) ) ) # ( !\Selector6~0_combout\ & ( \alu|Selector6~1_combout\ & ( (\Selector31~0_combout\ & ((!\Selector31~1_combout\ & (\ControlUnit:pc[1]~q\)) # (\Selector31~1_combout\ & ((\Add0~5_sumout\))))) ) ) ) # ( \Selector6~0_combout\ & ( 
-- !\alu|Selector6~1_combout\ & ( (!\Selector31~0_combout\) # ((!\Selector31~1_combout\ & (\ControlUnit:pc[1]~q\)) # (\Selector31~1_combout\ & ((\Add0~5_sumout\)))) ) ) ) # ( !\Selector6~0_combout\ & ( !\alu|Selector6~1_combout\ & ( (!\Selector31~0_combout\ 
-- & (((!\Selector31~1_combout\)))) # (\Selector31~0_combout\ & ((!\Selector31~1_combout\ & (\ControlUnit:pc[1]~q\)) # (\Selector31~1_combout\ & ((\Add0~5_sumout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101100000101101110111010111100010001000001010001000110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector31~0_combout\,
	datab => \ALT_INV_ControlUnit:pc[1]~q\,
	datac => \ALT_INV_Add0~5_sumout\,
	datad => \ALT_INV_Selector31~1_combout\,
	datae => \ALT_INV_Selector6~0_combout\,
	dataf => \alu|ALT_INV_Selector6~1_combout\,
	combout => \Selector35~0_combout\);

-- Location: FF_X4_Y20_N38
\address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector35~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(1));

-- Location: LABCELL_X7_Y20_N6
\Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = ( \Selector17~0_combout\ & ( \mem|mem~33_combout\ & ( (!\mem|mem~17DUPLICATE_q\ & (!\mem|mem~25_q\)) # (\mem|mem~17DUPLICATE_q\ & ((\mem|mem_rtl_0|auto_generated|ram_block1a7\))) ) ) ) # ( \Selector17~0_combout\ & ( 
-- !\mem|mem~33_combout\ & ( !\mem|mem_rtl_0_bypass\(31) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001000100010111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~25_q\,
	datab => \mem|ALT_INV_mem~17DUPLICATE_q\,
	datac => \mem|ALT_INV_mem_rtl_0_bypass\(31),
	datad => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a7\,
	datae => \ALT_INV_Selector17~0_combout\,
	dataf => \mem|ALT_INV_mem~33_combout\,
	combout => \Selector10~0_combout\);

-- Location: LABCELL_X7_Y20_N36
\Selector10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector10~1_combout\ = ( \input[7]~input_o\ & ( \Selector10~0_combout\ ) ) # ( !\input[7]~input_o\ & ( \Selector10~0_combout\ ) ) # ( \input[7]~input_o\ & ( !\Selector10~0_combout\ & ( (!\ControlUnit:opcode.MOV~q\ & (((!\alu|Selector0~2_combout\ & 
-- !\next_state~1_combout\)) # (\ControlUnit:opcode.DIN~q\))) # (\ControlUnit:opcode.MOV~q\ & (((!\alu|Selector0~2_combout\)))) ) ) ) # ( !\input[7]~input_o\ & ( !\Selector10~0_combout\ & ( (!\alu|Selector0~2_combout\ & (((!\ControlUnit:opcode.DIN~q\ & 
-- !\next_state~1_combout\)) # (\ControlUnit:opcode.MOV~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000011001100110101011100110011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.DIN~q\,
	datab => \alu|ALT_INV_Selector0~2_combout\,
	datac => \ALT_INV_next_state~1_combout\,
	datad => \ALT_INV_ControlUnit:opcode.MOV~q\,
	datae => \ALT_INV_input[7]~input_o\,
	dataf => \ALT_INV_Selector10~0_combout\,
	combout => \Selector10~1_combout\);

-- Location: FF_X7_Y20_N38
\wb[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector10~1_combout\,
	ena => \wb[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => wb(7));

-- Location: MLABCELL_X4_Y20_N33
\mem|mem_rtl_0_bypass[31]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem_rtl_0_bypass[31]~2_combout\ = ( !wb(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(7),
	combout => \mem|mem_rtl_0_bypass[31]~2_combout\);

-- Location: FF_X4_Y20_N34
\mem|mem_rtl_0_bypass[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem_rtl_0_bypass[31]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(31));

-- Location: LABCELL_X5_Y19_N48
\RotateRight0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \RotateRight0~2_combout\ = ( \mem|mem~30_combout\ & ( \mem|mem~32_combout\ & ( (\mem|mem_rtl_0_bypass\(31) & (!\mem|mem~33_combout\ & ((!\mem|mem_rtl_0_bypass\(29)) # (\mem|mem~31_combout\)))) ) ) ) # ( !\mem|mem~30_combout\ & ( \mem|mem~32_combout\ & ( 
-- (!\mem|mem_rtl_0_bypass\(29) & (\mem|mem_rtl_0_bypass\(31) & (!\mem|mem~33_combout\ & !\mem|mem~31_combout\))) ) ) ) # ( \mem|mem~30_combout\ & ( !\mem|mem~32_combout\ & ( (!\mem|mem_rtl_0_bypass\(29) & (((\mem|mem~33_combout\)) # 
-- (\mem|mem_rtl_0_bypass\(31)))) # (\mem|mem_rtl_0_bypass\(29) & (\mem|mem~31_combout\ & ((\mem|mem~33_combout\) # (\mem|mem_rtl_0_bypass\(31))))) ) ) ) # ( !\mem|mem~30_combout\ & ( !\mem|mem~32_combout\ & ( (!\mem|mem_rtl_0_bypass\(29) & 
-- (!\mem|mem~31_combout\ & ((\mem|mem~33_combout\) # (\mem|mem_rtl_0_bypass\(31))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101000000000001010100011111100100000000000000010000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem_rtl_0_bypass\(29),
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(31),
	datac => \mem|ALT_INV_mem~33_combout\,
	datad => \mem|ALT_INV_mem~31_combout\,
	datae => \mem|ALT_INV_mem~30_combout\,
	dataf => \mem|ALT_INV_mem~32_combout\,
	combout => \RotateRight0~2_combout\);

-- Location: MLABCELL_X4_Y19_N21
\ControlUnit:opcode.JMP~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.JMP~0_combout\ = ( \ControlUnit:opcode.JMP~q\ & ( \RotateRight0~2_combout\ & ( (((\mem|mem~37_combout\ & \mem|mem~35_combout\)) # (\rst~input_o\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\) ) ) ) # ( !\ControlUnit:opcode.JMP~q\ & ( 
-- \RotateRight0~2_combout\ & ( (!\ControlUnit:next_state.fetch~DUPLICATE_q\ & (!\rst~input_o\ & (\mem|mem~37_combout\ & \mem|mem~35_combout\))) ) ) ) # ( \ControlUnit:opcode.JMP~q\ & ( !\RotateRight0~2_combout\ & ( (\rst~input_o\) # 
-- (\ControlUnit:next_state.fetch~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000011101110111011100000000000010000111011101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datab => \ALT_INV_rst~input_o\,
	datac => \mem|ALT_INV_mem~37_combout\,
	datad => \mem|ALT_INV_mem~35_combout\,
	datae => \ALT_INV_ControlUnit:opcode.JMP~q\,
	dataf => \ALT_INV_RotateRight0~2_combout\,
	combout => \ControlUnit:opcode.JMP~0_combout\);

-- Location: FF_X4_Y19_N23
\ControlUnit:opcode.JMP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.JMP~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.JMP~q\);

-- Location: LABCELL_X6_Y19_N27
\ControlUnit:opcode.JEQ~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.JEQ~0_combout\ = ( \ControlUnit:opcode.JEQ~q\ & ( \RotateRight0~1_combout\ & ( (((!\mem|mem~35_combout\ & !\mem|mem~37_combout\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\)) # (\rst~input_o\) ) ) ) # ( !\ControlUnit:opcode.JEQ~q\ & 
-- ( \RotateRight0~1_combout\ & ( (!\rst~input_o\ & (!\mem|mem~35_combout\ & (!\mem|mem~37_combout\ & !\ControlUnit:next_state.fetch~DUPLICATE_q\))) ) ) ) # ( \ControlUnit:opcode.JEQ~q\ & ( !\RotateRight0~1_combout\ & ( 
-- (\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101011111111110000000000000001101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \mem|ALT_INV_mem~35_combout\,
	datac => \mem|ALT_INV_mem~37_combout\,
	datad => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datae => \ALT_INV_ControlUnit:opcode.JEQ~q\,
	dataf => \ALT_INV_RotateRight0~1_combout\,
	combout => \ControlUnit:opcode.JEQ~0_combout\);

-- Location: FF_X6_Y19_N29
\ControlUnit:opcode.JEQ\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.JEQ~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.JEQ~q\);

-- Location: LABCELL_X5_Y21_N0
\alu_op.HALT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu_op.HALT~0_combout\ = ( !\rst~input_o\ & ( \WideNor0~0_combout\ & ( (!\ControlUnit:opcode.JGR~q\ & (!\ControlUnit:opcode.JMP~q\ & (!\ControlUnit:opcode.JEQ~q\ & \ControlUnit:next_state.execute~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000100000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.JGR~q\,
	datab => \ALT_INV_ControlUnit:opcode.JMP~q\,
	datac => \ALT_INV_ControlUnit:opcode.JEQ~q\,
	datad => \ALT_INV_ControlUnit:next_state.execute~q\,
	datae => \ALT_INV_rst~input_o\,
	dataf => \ALT_INV_WideNor0~0_combout\,
	combout => \alu_op.HALT~0_combout\);

-- Location: FF_X6_Y19_N32
\alu_op.CMP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ControlUnit:opcode.CMP~q\,
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_op.CMP~q\);

-- Location: LABCELL_X6_Y19_N54
\alu|WideNor0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|WideNor0~0_combout\ = ( !\alu_op.SUB~q\ & ( (!\alu_op.ADD~q\ & !\alu_op.CMP~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_alu_op.ADD~q\,
	datad => \ALT_INV_alu_op.CMP~q\,
	dataf => \ALT_INV_alu_op.SUB~q\,
	combout => \alu|WideNor0~0_combout\);

-- Location: LABCELL_X6_Y20_N18
\alu|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Equal0~0_combout\ = ( !\alu|Add0~13_sumout\ & ( (!\alu|Add0~1_sumout\ & (!\alu|Add0~9_sumout\ & !\alu|Add0~5_sumout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_Add0~1_sumout\,
	datab => \alu|ALT_INV_Add0~9_sumout\,
	datac => \alu|ALT_INV_Add0~5_sumout\,
	dataf => \alu|ALT_INV_Add0~13_sumout\,
	combout => \alu|Equal0~0_combout\);

-- Location: FF_X6_Y20_N50
\alu_in[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(7),
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[0][7]~q\);

-- Location: LABCELL_X6_Y20_N21
\alu_in[1][7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu_in[1][7]~feeder_combout\ = wb(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_wb(7),
	combout => \alu_in[1][7]~feeder_combout\);

-- Location: LABCELL_X5_Y20_N18
\mem|mem~52\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~52_combout\ = ( \mem|mem~32_combout\ & ( \mem|mem~27_combout\ & ( (!\mem|mem_rtl_0_bypass\(31)) # ((\mem|mem_rtl_0_bypass\(32) & ((!\mem|mem~28_combout\) # (!\mem|mem~26_combout\)))) ) ) ) # ( !\mem|mem~32_combout\ & ( \mem|mem~27_combout\ & ( 
-- (!\mem|mem_rtl_0_bypass\(31) & ((!\mem|mem_rtl_0_bypass\(32)) # ((\mem|mem~28_combout\ & \mem|mem~26_combout\)))) ) ) ) # ( \mem|mem~32_combout\ & ( !\mem|mem~27_combout\ & ( (!\mem|mem_rtl_0_bypass\(31)) # (\mem|mem_rtl_0_bypass\(32)) ) ) ) # ( 
-- !\mem|mem~32_combout\ & ( !\mem|mem~27_combout\ & ( (!\mem|mem_rtl_0_bypass\(31) & !\mem|mem_rtl_0_bypass\(32)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000000000110011001111111111001100000001001100110011111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~28_combout\,
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(31),
	datac => \mem|ALT_INV_mem~26_combout\,
	datad => \mem|ALT_INV_mem_rtl_0_bypass\(32),
	datae => \mem|ALT_INV_mem~32_combout\,
	dataf => \mem|ALT_INV_mem~27_combout\,
	combout => \mem|mem~52_combout\);

-- Location: FF_X6_Y20_N23
\alu_in[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \alu_in[1][7]~feeder_combout\,
	asdata => \mem|mem~52_combout\,
	sload => \Equal0~0_combout\,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[1][7]~q\);

-- Location: LABCELL_X5_Y21_N54
\alu_in[1][6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu_in[1][6]~feeder_combout\ = ( wb(6) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(6),
	combout => \alu_in[1][6]~feeder_combout\);

-- Location: FF_X5_Y21_N56
\alu_in[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \alu_in[1][6]~feeder_combout\,
	asdata => \mem|mem~51_combout\,
	sload => \Equal0~0_combout\,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[1][6]~q\);

-- Location: FF_X6_Y20_N53
\alu_in[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(6),
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[0][6]~q\);

-- Location: LABCELL_X6_Y20_N51
\alu|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Add0~25_sumout\ = SUM(( \alu_in[0][6]~q\ ) + ( !\alu_op.ADD~q\ $ (\alu_in[1][6]~q\) ) + ( \alu|Add0~22\ ))
-- \alu|Add0~26\ = CARRY(( \alu_in[0][6]~q\ ) + ( !\alu_op.ADD~q\ $ (\alu_in[1][6]~q\) ) + ( \alu|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001111000011110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_alu_op.ADD~q\,
	datac => \ALT_INV_alu_in[1][6]~q\,
	datad => \ALT_INV_alu_in[0][6]~q\,
	cin => \alu|Add0~22\,
	sumout => \alu|Add0~25_sumout\,
	cout => \alu|Add0~26\);

-- Location: LABCELL_X6_Y20_N54
\alu|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Add0~29_sumout\ = SUM(( !\alu_op.ADD~q\ $ (\alu_in[1][7]~q\) ) + ( \alu_in[0][7]~q\ ) + ( \alu|Add0~26\ ))
-- \alu|Add0~30\ = CARRY(( !\alu_op.ADD~q\ $ (\alu_in[1][7]~q\) ) + ( \alu_in[0][7]~q\ ) + ( \alu|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000001100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_in[0][7]~q\,
	datab => \ALT_INV_alu_op.ADD~q\,
	datac => \ALT_INV_alu_in[1][7]~q\,
	cin => \alu|Add0~26\,
	sumout => \alu|Add0~29_sumout\,
	cout => \alu|Add0~30\);

-- Location: LABCELL_X6_Y20_N57
\alu|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Add0~37_sumout\ = SUM(( !\alu_op.ADD~q\ $ (\alu_in[1][7]~q\) ) + ( \alu_in[0][7]~q\ ) + ( \alu|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000001100110000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_in[0][7]~q\,
	datab => \ALT_INV_alu_op.ADD~q\,
	datad => \ALT_INV_alu_in[1][7]~q\,
	cin => \alu|Add0~30\,
	sumout => \alu|Add0~37_sumout\);

-- Location: LABCELL_X6_Y20_N24
\alu|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Equal0~1_combout\ = ( !\alu|Add0~37_sumout\ & ( !\alu|Add0~17_sumout\ & ( (!\alu|Add0~25_sumout\ & (!\alu|Add0~21_sumout\ & (\alu|Equal0~0_combout\ & !\alu|Add0~29_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_Add0~25_sumout\,
	datab => \alu|ALT_INV_Add0~21_sumout\,
	datac => \alu|ALT_INV_Equal0~0_combout\,
	datad => \alu|ALT_INV_Add0~29_sumout\,
	datae => \alu|ALT_INV_Add0~37_sumout\,
	dataf => \alu|ALT_INV_Add0~17_sumout\,
	combout => \alu|Equal0~1_combout\);

-- Location: LABCELL_X6_Y20_N9
\alu|zero\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|zero~combout\ = (!\alu|WideNor0~0_combout\ & (\alu|Equal0~1_combout\)) # (\alu|WideNor0~0_combout\ & ((\alu|zero~combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101001011111000010100101111100001010010111110000101001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_WideNor0~0_combout\,
	datac => \alu|ALT_INV_Equal0~1_combout\,
	datad => \alu|ALT_INV_zero~combout\,
	combout => \alu|zero~combout\);

-- Location: LABCELL_X5_Y20_N12
\alu|signal_bit\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|signal_bit~combout\ = ( \alu|Add0~37_sumout\ & ( (!\alu|WideNor0~0_combout\) # (\alu|signal_bit~combout\) ) ) # ( !\alu|Add0~37_sumout\ & ( (\alu|signal_bit~combout\ & \alu|WideNor0~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111111111000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \alu|ALT_INV_signal_bit~combout\,
	datad => \alu|ALT_INV_WideNor0~0_combout\,
	dataf => \alu|ALT_INV_Add0~37_sumout\,
	combout => \alu|signal_bit~combout\);

-- Location: LABCELL_X5_Y20_N24
\Selector3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = ( !\ControlUnit:opcode.JGR~q\ & ( (!\ControlUnit:opcode.JEQ~q\ & (\WideNor0~0_combout\ & (((\Equal0~0_combout\ & !\ControlUnit:opcode.JMP~q\))))) # (\ControlUnit:opcode.JEQ~q\ & (((!\alu|zero~combout\)))) ) ) # ( 
-- \ControlUnit:opcode.JGR~q\ & ( (((!\alu|signal_bit~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000110001011100111100001111000000001100000011001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_WideNor0~0_combout\,
	datab => \alu|ALT_INV_zero~combout\,
	datac => \alu|ALT_INV_signal_bit~combout\,
	datad => \ALT_INV_Equal0~0_combout\,
	datae => \ALT_INV_ControlUnit:opcode.JGR~q\,
	dataf => \ALT_INV_ControlUnit:opcode.JMP~q\,
	datag => \ALT_INV_ControlUnit:opcode.JEQ~q\,
	combout => \Selector3~2_combout\);

-- Location: MLABCELL_X4_Y20_N27
\Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = ( \mem|mem~46_combout\ & ( (!\Selector3~0_combout\ & (((\ControlUnit:pc[1]~q\)))) # (\Selector3~0_combout\ & ((!\Selector3~2_combout\) # ((\Add0~5_sumout\)))) ) ) # ( !\mem|mem~46_combout\ & ( (!\Selector3~0_combout\ & 
-- (((\ControlUnit:pc[1]~q\)))) # (\Selector3~0_combout\ & (\Selector3~2_combout\ & ((\Add0~5_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000011011000010100001101101001110010111110100111001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector3~0_combout\,
	datab => \ALT_INV_Selector3~2_combout\,
	datac => \ALT_INV_ControlUnit:pc[1]~q\,
	datad => \ALT_INV_Add0~5_sumout\,
	dataf => \mem|ALT_INV_mem~46_combout\,
	combout => \Selector6~0_combout\);

-- Location: FF_X4_Y20_N29
\ControlUnit:pc[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector6~0_combout\,
	asdata => \Add0~5_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_ControlUnit:next_state.execute~q\,
	ena => \Selector31~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:pc[1]~q\);

-- Location: FF_X2_Y20_N26
\ControlUnit:pc[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:pc[2]~feeder_combout\,
	asdata => \Add0~9_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_ControlUnit:next_state.execute~q\,
	ena => \Selector31~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:pc[2]~q\);

-- Location: LABCELL_X2_Y20_N51
\Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = ( \mem|mem~48_combout\ & ( (!\Selector3~0_combout\ & (\ControlUnit:pc[2]~q\)) # (\Selector3~0_combout\ & (((!\Selector3~2_combout\) # (\Add0~9_sumout\)))) ) ) # ( !\mem|mem~48_combout\ & ( (!\Selector3~0_combout\ & 
-- (\ControlUnit:pc[2]~q\)) # (\Selector3~0_combout\ & (((\Selector3~2_combout\ & \Add0~9_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000011010101010000001101010101110011110101010111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:pc[2]~q\,
	datab => \ALT_INV_Selector3~2_combout\,
	datac => \ALT_INV_Add0~9_sumout\,
	datad => \ALT_INV_Selector3~0_combout\,
	dataf => \mem|ALT_INV_mem~48_combout\,
	combout => \Selector5~0_combout\);

-- Location: LABCELL_X2_Y20_N36
\Selector34~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector34~0_combout\ = ( \Selector31~1_combout\ & ( \alu|Selector5~3_combout\ & ( (!\Selector31~0_combout\ & (\Selector5~0_combout\)) # (\Selector31~0_combout\ & ((\Add0~9_sumout\))) ) ) ) # ( !\Selector31~1_combout\ & ( \alu|Selector5~3_combout\ & ( 
-- (\ControlUnit:pc[2]~q\ & \Selector31~0_combout\) ) ) ) # ( \Selector31~1_combout\ & ( !\alu|Selector5~3_combout\ & ( (!\Selector31~0_combout\ & (\Selector5~0_combout\)) # (\Selector31~0_combout\ & ((\Add0~9_sumout\))) ) ) ) # ( !\Selector31~1_combout\ & ( 
-- !\alu|Selector5~3_combout\ & ( (!\Selector31~0_combout\) # (\ControlUnit:pc[2]~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100001111010101010011001100000000000011110101010100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector5~0_combout\,
	datab => \ALT_INV_Add0~9_sumout\,
	datac => \ALT_INV_ControlUnit:pc[2]~q\,
	datad => \ALT_INV_Selector31~0_combout\,
	datae => \ALT_INV_Selector31~1_combout\,
	dataf => \alu|ALT_INV_Selector5~3_combout\,
	combout => \Selector34~0_combout\);

-- Location: FF_X2_Y20_N38
\address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector34~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(2));

-- Location: LABCELL_X7_Y20_N48
\mem|mem~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~53_combout\ = ( !address(4) & ( (!address(3) & (!address(6) & (!address(7) & !address(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_address(3),
	datab => ALT_INV_address(6),
	datac => ALT_INV_address(7),
	datad => ALT_INV_address(5),
	dataf => ALT_INV_address(4),
	combout => \mem|mem~53_combout\);

-- Location: LABCELL_X7_Y20_N42
\mem|mem~54\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~54_combout\ = ( \mem|mem~53_combout\ & ( (\mem_write~q\ & (!address(2) & (!address(0) & !address(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001000000000000000100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_mem_write~q\,
	datab => ALT_INV_address(2),
	datac => ALT_INV_address(0),
	datad => ALT_INV_address(1),
	dataf => \mem|ALT_INV_mem~53_combout\,
	combout => \mem|mem~54_combout\);

-- Location: FF_X4_Y21_N49
\mem|mem~21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(3),
	sload => VCC,
	ena => \mem|mem~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem~21_q\);

-- Location: MLABCELL_X4_Y21_N24
\mem|mem~40\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~40_combout\ = ( \mem|mem_rtl_0_bypass\(24) & ( (!\mem|mem~27_combout\) # ((!\mem|mem~26_combout\) # (!\mem|mem~28_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111001111111111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \mem|ALT_INV_mem~27_combout\,
	datac => \mem|ALT_INV_mem~26_combout\,
	datad => \mem|ALT_INV_mem~28_combout\,
	dataf => \mem|ALT_INV_mem_rtl_0_bypass\(24),
	combout => \mem|mem~40_combout\);

-- Location: MLABCELL_X4_Y21_N42
\Selector14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = ( \Selector17~0_combout\ & ( \mem|mem_rtl_0|auto_generated|ram_block1a3\ & ( (!\mem|mem~40_combout\ & (((\mem|mem_rtl_0_bypass\(23))))) # (\mem|mem~40_combout\ & (((\mem|mem~21_q\)) # (\mem|mem~17DUPLICATE_q\))) ) ) ) # ( 
-- \Selector17~0_combout\ & ( !\mem|mem_rtl_0|auto_generated|ram_block1a3\ & ( (!\mem|mem~40_combout\ & (((\mem|mem_rtl_0_bypass\(23))))) # (\mem|mem~40_combout\ & (!\mem|mem~17DUPLICATE_q\ & (\mem|mem~21_q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110010001000000000000000000000111101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~17DUPLICATE_q\,
	datab => \mem|ALT_INV_mem~21_q\,
	datac => \mem|ALT_INV_mem_rtl_0_bypass\(23),
	datad => \mem|ALT_INV_mem~40_combout\,
	datae => \ALT_INV_Selector17~0_combout\,
	dataf => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a3\,
	combout => \Selector14~0_combout\);

-- Location: LABCELL_X6_Y21_N48
\Selector14~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector14~1_combout\ = ( \Selector14~0_combout\ & ( \ControlUnit:opcode.MOV~q\ ) ) # ( !\Selector14~0_combout\ & ( \ControlUnit:opcode.MOV~q\ & ( !\alu|Selector4~2_combout\ ) ) ) # ( \Selector14~0_combout\ & ( !\ControlUnit:opcode.MOV~q\ ) ) # ( 
-- !\Selector14~0_combout\ & ( !\ControlUnit:opcode.MOV~q\ & ( (!\ControlUnit:opcode.DIN~q\ & (!\next_state~1_combout\ & (!\alu|Selector4~2_combout\))) # (\ControlUnit:opcode.DIN~q\ & (((\input[3]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010001111111111111111111111001100110011001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_next_state~1_combout\,
	datab => \alu|ALT_INV_Selector4~2_combout\,
	datac => \ALT_INV_ControlUnit:opcode.DIN~q\,
	datad => \ALT_INV_input[3]~input_o\,
	datae => \ALT_INV_Selector14~0_combout\,
	dataf => \ALT_INV_ControlUnit:opcode.MOV~q\,
	combout => \Selector14~1_combout\);

-- Location: FF_X6_Y21_N50
\wb[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector14~1_combout\,
	ena => \wb[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => wb(3));

-- Location: LABCELL_X5_Y21_N30
\alu_in[1][3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu_in[1][3]~feeder_combout\ = wb(3)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_wb(3),
	combout => \alu_in[1][3]~feeder_combout\);

-- Location: FF_X5_Y21_N32
\alu_in[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \alu_in[1][3]~feeder_combout\,
	asdata => \mem|mem~50_combout\,
	sload => \Equal0~0_combout\,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_in[1][3]~q\);

-- Location: LABCELL_X5_Y19_N21
\alu|Selector4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector4~0_combout\ = ( \alu_in[0][3]~q\ & ( \alu_op.LAND~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_op.LAND~q\,
	dataf => \ALT_INV_alu_in[0][3]~q\,
	combout => \alu|Selector4~0_combout\);

-- Location: LABCELL_X7_Y20_N21
\alu|Selector4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector4~1_combout\ = ( \alu_op.LNOT~q\ & ( (!\alu_in[0][3]~q\) # (\alu_op.LOR~q\) ) ) # ( !\alu_op.LNOT~q\ & ( (\alu_op.LOR~q\ & \alu_in[0][3]~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010111111111010101011111111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_op.LOR~q\,
	datad => \ALT_INV_alu_in[0][3]~q\,
	dataf => \ALT_INV_alu_op.LNOT~q\,
	combout => \alu|Selector4~1_combout\);

-- Location: LABCELL_X5_Y20_N6
\alu|Selector4~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector4~2_combout\ = ( \alu|WideNor0~0_combout\ & ( \alu|Add0~13_sumout\ & ( (!\alu|Selector4~1_combout\ & ((!\alu_in[1][3]~q\) # ((\alu|Selector5~1_combout\ & !\alu|Selector4~0_combout\)))) ) ) ) # ( \alu|WideNor0~0_combout\ & ( 
-- !\alu|Add0~13_sumout\ & ( (!\alu|Selector4~1_combout\ & ((!\alu_in[1][3]~q\) # ((\alu|Selector5~1_combout\ & !\alu|Selector4~0_combout\)))) ) ) ) # ( !\alu|WideNor0~0_combout\ & ( !\alu|Add0~13_sumout\ & ( (!\alu|Selector4~1_combout\ & 
-- ((!\alu_in[1][3]~q\) # ((\alu|Selector5~1_combout\ & !\alu|Selector4~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101000000000101110100000000000000000000000001011101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_in[1][3]~q\,
	datab => \alu|ALT_INV_Selector5~1_combout\,
	datac => \alu|ALT_INV_Selector4~0_combout\,
	datad => \alu|ALT_INV_Selector4~1_combout\,
	datae => \alu|ALT_INV_WideNor0~0_combout\,
	dataf => \alu|ALT_INV_Add0~13_sumout\,
	combout => \alu|Selector4~2_combout\);

-- Location: MLABCELL_X4_Y21_N0
\Selector33~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector33~0_combout\ = ( \ControlUnit:pc[3]~q\ & ( \Selector4~0_combout\ & ( (!\Selector31~0_combout\ & ((!\alu|Selector4~2_combout\) # ((\Selector31~1_combout\)))) # (\Selector31~0_combout\ & (((!\Selector31~1_combout\) # (\Add0~13_sumout\)))) ) ) ) # 
-- ( !\ControlUnit:pc[3]~q\ & ( \Selector4~0_combout\ & ( (!\Selector31~0_combout\ & ((!\alu|Selector4~2_combout\) # ((\Selector31~1_combout\)))) # (\Selector31~0_combout\ & (((\Selector31~1_combout\ & \Add0~13_sumout\)))) ) ) ) # ( \ControlUnit:pc[3]~q\ & ( 
-- !\Selector4~0_combout\ & ( (!\Selector31~0_combout\ & (!\alu|Selector4~2_combout\ & (!\Selector31~1_combout\))) # (\Selector31~0_combout\ & (((!\Selector31~1_combout\) # (\Add0~13_sumout\)))) ) ) ) # ( !\ControlUnit:pc[3]~q\ & ( !\Selector4~0_combout\ & ( 
-- (!\Selector31~0_combout\ & (!\alu|Selector4~2_combout\ & (!\Selector31~1_combout\))) # (\Selector31~0_combout\ & (((\Selector31~1_combout\ & \Add0~13_sumout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000101110100001101010110001010100011111101101011011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector31~0_combout\,
	datab => \alu|ALT_INV_Selector4~2_combout\,
	datac => \ALT_INV_Selector31~1_combout\,
	datad => \ALT_INV_Add0~13_sumout\,
	datae => \ALT_INV_ControlUnit:pc[3]~q\,
	dataf => \ALT_INV_Selector4~0_combout\,
	combout => \Selector33~0_combout\);

-- Location: FF_X2_Y20_N43
\mem|mem_rtl_0_bypass[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector33~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(8));

-- Location: FF_X2_Y20_N14
\mem|mem_rtl_0_bypass[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => address(4),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(9));

-- Location: FF_X2_Y20_N32
\mem|mem_rtl_0_bypass[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => address(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(7));

-- Location: FF_X4_Y21_N46
\mem|mem_rtl_0_bypass[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector32~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(10));

-- Location: FF_X2_Y20_N34
\mem|mem_rtl_0_bypass[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => address(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(5));

-- Location: FF_X2_Y20_N41
\mem|mem_rtl_0_bypass[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector34~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(6));

-- Location: LABCELL_X2_Y20_N45
\mem|mem~28\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~28_combout\ = ( \mem|mem_rtl_0_bypass\(5) & ( \mem|mem_rtl_0_bypass\(6) & ( (!\mem|mem_rtl_0_bypass\(8) & (!\mem|mem_rtl_0_bypass\(7) & (!\mem|mem_rtl_0_bypass\(9) $ (\mem|mem_rtl_0_bypass\(10))))) # (\mem|mem_rtl_0_bypass\(8) & 
-- (\mem|mem_rtl_0_bypass\(7) & (!\mem|mem_rtl_0_bypass\(9) $ (\mem|mem_rtl_0_bypass\(10))))) ) ) ) # ( !\mem|mem_rtl_0_bypass\(5) & ( !\mem|mem_rtl_0_bypass\(6) & ( (!\mem|mem_rtl_0_bypass\(8) & (!\mem|mem_rtl_0_bypass\(7) & (!\mem|mem_rtl_0_bypass\(9) $ 
-- (\mem|mem_rtl_0_bypass\(10))))) # (\mem|mem_rtl_0_bypass\(8) & (\mem|mem_rtl_0_bypass\(7) & (!\mem|mem_rtl_0_bypass\(9) $ (\mem|mem_rtl_0_bypass\(10))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000010000100001000000000000000000000000000000001000010000100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem_rtl_0_bypass\(8),
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(9),
	datac => \mem|ALT_INV_mem_rtl_0_bypass\(7),
	datad => \mem|ALT_INV_mem_rtl_0_bypass\(10),
	datae => \mem|ALT_INV_mem_rtl_0_bypass\(5),
	dataf => \mem|ALT_INV_mem_rtl_0_bypass\(6),
	combout => \mem|mem~28_combout\);

-- Location: LABCELL_X5_Y19_N24
\mem|mem~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~33_combout\ = (\mem|mem_rtl_0_bypass\(32) & ((!\mem|mem~27_combout\) # ((!\mem|mem~26_combout\) # (!\mem|mem~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001110000011110000111000001111000011100000111100001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~27_combout\,
	datab => \mem|ALT_INV_mem~26_combout\,
	datac => \mem|ALT_INV_mem_rtl_0_bypass\(32),
	datad => \mem|ALT_INV_mem~28_combout\,
	combout => \mem|mem~33_combout\);

-- Location: LABCELL_X6_Y19_N42
\ControlUnit:opcode.NOP~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.NOP~0_combout\ = ( \mem|mem~32_combout\ & ( \mem|mem~30_combout\ & ( (!\mem|mem~33_combout\ & (!\mem|mem~31_combout\ & (\mem|mem_rtl_0_bypass\(29) & \mem|mem_rtl_0_bypass\(31)))) ) ) ) # ( !\mem|mem~32_combout\ & ( \mem|mem~30_combout\ 
-- & ( (!\mem|mem~31_combout\ & (\mem|mem_rtl_0_bypass\(29) & ((\mem|mem_rtl_0_bypass\(31)) # (\mem|mem~33_combout\)))) ) ) ) # ( \mem|mem~32_combout\ & ( !\mem|mem~30_combout\ & ( (!\mem|mem~33_combout\ & (\mem|mem_rtl_0_bypass\(31) & 
-- ((\mem|mem_rtl_0_bypass\(29)) # (\mem|mem~31_combout\)))) ) ) ) # ( !\mem|mem~32_combout\ & ( !\mem|mem~30_combout\ & ( (!\mem|mem~33_combout\ & (\mem|mem_rtl_0_bypass\(31) & ((\mem|mem_rtl_0_bypass\(29)) # (\mem|mem~31_combout\)))) # 
-- (\mem|mem~33_combout\ & (((\mem|mem_rtl_0_bypass\(29))) # (\mem|mem~31_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010100111111000000000010101000000100000011000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~33_combout\,
	datab => \mem|ALT_INV_mem~31_combout\,
	datac => \mem|ALT_INV_mem_rtl_0_bypass\(29),
	datad => \mem|ALT_INV_mem_rtl_0_bypass\(31),
	datae => \mem|ALT_INV_mem~32_combout\,
	dataf => \mem|ALT_INV_mem~30_combout\,
	combout => \ControlUnit:opcode.NOP~0_combout\);

-- Location: LABCELL_X5_Y19_N39
\ControlUnit:opcode.ADD~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.ADD~0_combout\ = ( \ControlUnit:opcode.ADD~q\ & ( \ControlUnit:opcode.NOP~0_combout\ & ( (((!\mem|mem~35_combout\ & \mem|mem~37_combout\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\)) # (\rst~input_o\) ) ) ) # ( 
-- !\ControlUnit:opcode.ADD~q\ & ( \ControlUnit:opcode.NOP~0_combout\ & ( (!\rst~input_o\ & (!\ControlUnit:next_state.fetch~DUPLICATE_q\ & (!\mem|mem~35_combout\ & \mem|mem~37_combout\))) ) ) ) # ( \ControlUnit:opcode.ADD~q\ & ( 
-- !\ControlUnit:opcode.NOP~0_combout\ & ( (\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000011101110111011100000000100000000111011111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datac => \mem|ALT_INV_mem~35_combout\,
	datad => \mem|ALT_INV_mem~37_combout\,
	datae => \ALT_INV_ControlUnit:opcode.ADD~q\,
	dataf => \ALT_INV_ControlUnit:opcode.NOP~0_combout\,
	combout => \ControlUnit:opcode.ADD~0_combout\);

-- Location: FF_X5_Y19_N41
\ControlUnit:opcode.ADD\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.ADD~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.ADD~q\);

-- Location: FF_X6_Y20_N5
\alu_op.ADD\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ControlUnit:opcode.ADD~q\,
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_op.ADD~q\);

-- Location: LABCELL_X7_Y20_N0
\alu|Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector1~1_combout\ = ( \alu_op.LNOT~q\ & ( (!\alu_in[0][6]~q\) # (\alu_op.LOR~q\) ) ) # ( !\alu_op.LNOT~q\ & ( (\alu_in[0][6]~q\ & \alu_op.LOR~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_alu_in[0][6]~q\,
	datad => \ALT_INV_alu_op.LOR~q\,
	dataf => \ALT_INV_alu_op.LNOT~q\,
	combout => \alu|Selector1~1_combout\);

-- Location: LABCELL_X7_Y20_N30
\alu|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector1~0_combout\ = (\alu_in[0][6]~q\ & \alu_op.LAND~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_alu_in[0][6]~q\,
	datad => \ALT_INV_alu_op.LAND~q\,
	combout => \alu|Selector1~0_combout\);

-- Location: LABCELL_X6_Y20_N12
\alu|Selector1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector1~2_combout\ = ( \alu|Selector1~0_combout\ & ( \alu|WideNor0~0_combout\ & ( (!\alu_in[1][6]~q\ & !\alu|Selector1~1_combout\) ) ) ) # ( !\alu|Selector1~0_combout\ & ( \alu|WideNor0~0_combout\ & ( (!\alu|Selector1~1_combout\ & 
-- ((!\alu_in[1][6]~q\) # (\alu|Selector5~1_combout\))) ) ) ) # ( \alu|Selector1~0_combout\ & ( !\alu|WideNor0~0_combout\ & ( (!\alu|Add0~25_sumout\ & (!\alu_in[1][6]~q\ & !\alu|Selector1~1_combout\)) ) ) ) # ( !\alu|Selector1~0_combout\ & ( 
-- !\alu|WideNor0~0_combout\ & ( (!\alu|Add0~25_sumout\ & (!\alu|Selector1~1_combout\ & ((!\alu_in[1][6]~q\) # (\alu|Selector5~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010100000100000001000000011000000111100001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_Add0~25_sumout\,
	datab => \ALT_INV_alu_in[1][6]~q\,
	datac => \alu|ALT_INV_Selector1~1_combout\,
	datad => \alu|ALT_INV_Selector5~1_combout\,
	datae => \alu|ALT_INV_Selector1~0_combout\,
	dataf => \alu|ALT_INV_WideNor0~0_combout\,
	combout => \alu|Selector1~2_combout\);

-- Location: MLABCELL_X9_Y20_N12
\Selector11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = ( \mem|mem~31_combout\ & ( \mem|mem_rtl_0|auto_generated|ram_block1a6\ & ( (\Selector17~0_combout\ & ((!\mem|mem~24_q\) # (\mem|mem~17DUPLICATE_q\))) ) ) ) # ( !\mem|mem~31_combout\ & ( \mem|mem_rtl_0|auto_generated|ram_block1a6\ 
-- & ( (!\mem|mem_rtl_0_bypass\(29) & \Selector17~0_combout\) ) ) ) # ( \mem|mem~31_combout\ & ( !\mem|mem_rtl_0|auto_generated|ram_block1a6\ & ( (!\mem|mem~17DUPLICATE_q\ & (!\mem|mem~24_q\ & \Selector17~0_combout\)) ) ) ) # ( !\mem|mem~31_combout\ & ( 
-- !\mem|mem_rtl_0|auto_generated|ram_block1a6\ & ( (!\mem|mem_rtl_0_bypass\(29) & \Selector17~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001010000000000000110011000000000011110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~17DUPLICATE_q\,
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(29),
	datac => \mem|ALT_INV_mem~24_q\,
	datad => \ALT_INV_Selector17~0_combout\,
	datae => \mem|ALT_INV_mem~31_combout\,
	dataf => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a6\,
	combout => \Selector11~0_combout\);

-- Location: IOIBUF_X0_Y19_N21
\input[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(6),
	o => \input[6]~input_o\);

-- Location: MLABCELL_X9_Y20_N57
\Selector11~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector11~1_combout\ = ( \ControlUnit:opcode.MOV~q\ & ( \next_state~1_combout\ & ( (!\alu|Selector1~2_combout\) # (\Selector11~0_combout\) ) ) ) # ( !\ControlUnit:opcode.MOV~q\ & ( \next_state~1_combout\ & ( ((\ControlUnit:opcode.DIN~q\ & 
-- \input[6]~input_o\)) # (\Selector11~0_combout\) ) ) ) # ( \ControlUnit:opcode.MOV~q\ & ( !\next_state~1_combout\ & ( (!\alu|Selector1~2_combout\) # (\Selector11~0_combout\) ) ) ) # ( !\ControlUnit:opcode.MOV~q\ & ( !\next_state~1_combout\ & ( 
-- ((!\ControlUnit:opcode.DIN~q\ & (!\alu|Selector1~2_combout\)) # (\ControlUnit:opcode.DIN~q\ & ((\input[6]~input_o\)))) # (\Selector11~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000111110111111101011111010111100001111001111111010111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_Selector1~2_combout\,
	datab => \ALT_INV_ControlUnit:opcode.DIN~q\,
	datac => \ALT_INV_Selector11~0_combout\,
	datad => \ALT_INV_input[6]~input_o\,
	datae => \ALT_INV_ControlUnit:opcode.MOV~q\,
	dataf => \ALT_INV_next_state~1_combout\,
	combout => \Selector11~1_combout\);

-- Location: FF_X9_Y20_N59
\wb[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector11~1_combout\,
	ena => \wb[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => wb(6));

-- Location: MLABCELL_X9_Y20_N39
\mem|mem_rtl_0_bypass[29]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem_rtl_0_bypass[29]~1_combout\ = ( !wb(6) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(6),
	combout => \mem|mem_rtl_0_bypass[29]~1_combout\);

-- Location: FF_X9_Y20_N41
\mem|mem_rtl_0_bypass[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem_rtl_0_bypass[29]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(29));

-- Location: LABCELL_X5_Y19_N0
\RotateRight0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \RotateRight0~0_combout\ = ( \mem|mem~30_combout\ & ( \mem|mem~32_combout\ & ( (!\mem|mem_rtl_0_bypass\(29) & ((!\mem|mem_rtl_0_bypass\(31)) # ((\mem|mem~33_combout\)))) # (\mem|mem_rtl_0_bypass\(29) & (\mem|mem~31_combout\ & 
-- ((!\mem|mem_rtl_0_bypass\(31)) # (\mem|mem~33_combout\)))) ) ) ) # ( !\mem|mem~30_combout\ & ( \mem|mem~32_combout\ & ( (!\mem|mem_rtl_0_bypass\(29) & (!\mem|mem~31_combout\ & ((!\mem|mem_rtl_0_bypass\(31)) # (\mem|mem~33_combout\)))) ) ) ) # ( 
-- \mem|mem~30_combout\ & ( !\mem|mem~32_combout\ & ( (!\mem|mem_rtl_0_bypass\(31) & (!\mem|mem~33_combout\ & ((!\mem|mem_rtl_0_bypass\(29)) # (\mem|mem~31_combout\)))) ) ) ) # ( !\mem|mem~30_combout\ & ( !\mem|mem~32_combout\ & ( 
-- (!\mem|mem_rtl_0_bypass\(29) & (!\mem|mem_rtl_0_bypass\(31) & (!\mem|mem~33_combout\ & !\mem|mem~31_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000001100000010001010000000001000101011001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem_rtl_0_bypass\(29),
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(31),
	datac => \mem|ALT_INV_mem~33_combout\,
	datad => \mem|ALT_INV_mem~31_combout\,
	datae => \mem|ALT_INV_mem~30_combout\,
	dataf => \mem|ALT_INV_mem~32_combout\,
	combout => \RotateRight0~0_combout\);

-- Location: LABCELL_X5_Y21_N42
\ControlUnit:opcode.DIN~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.DIN~0_combout\ = ( \ControlUnit:opcode.DIN~q\ & ( \mem|mem~37_combout\ & ( (\rst~input_o\) # (\ControlUnit:next_state.fetch~DUPLICATE_q\) ) ) ) # ( \ControlUnit:opcode.DIN~q\ & ( !\mem|mem~37_combout\ & ( (((!\mem|mem~35_combout\ & 
-- \RotateRight0~0_combout\)) # (\rst~input_o\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\) ) ) ) # ( !\ControlUnit:opcode.DIN~q\ & ( !\mem|mem~37_combout\ & ( (!\mem|mem~35_combout\ & (\RotateRight0~0_combout\ & 
-- (!\ControlUnit:next_state.fetch~DUPLICATE_q\ & !\rst~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000000000001011111111111100000000000000000000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~35_combout\,
	datab => \ALT_INV_RotateRight0~0_combout\,
	datac => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datad => \ALT_INV_rst~input_o\,
	datae => \ALT_INV_ControlUnit:opcode.DIN~q\,
	dataf => \mem|ALT_INV_mem~37_combout\,
	combout => \ControlUnit:opcode.DIN~0_combout\);

-- Location: FF_X5_Y21_N44
\ControlUnit:opcode.DIN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.DIN~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.DIN~q\);

-- Location: LABCELL_X1_Y21_N54
\Selector18~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector18~1_combout\ = ( !\ControlUnit:next_state.write_back~q\ & ( \ControlUnit:next_state.execute~q\ & ( ((!\Selector18~0_combout\) # ((\ControlUnit:opcode.HALT~q\) # (\next_state~1_combout\))) # (\ControlUnit:opcode.DIN~q\) ) ) ) # ( 
-- !\ControlUnit:next_state.write_back~q\ & ( !\ControlUnit:next_state.execute~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011011111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.DIN~q\,
	datab => \ALT_INV_Selector18~0_combout\,
	datac => \ALT_INV_next_state~1_combout\,
	datad => \ALT_INV_ControlUnit:opcode.HALT~q\,
	datae => \ALT_INV_ControlUnit:next_state.write_back~q\,
	dataf => \ALT_INV_ControlUnit:next_state.execute~q\,
	combout => \Selector18~1_combout\);

-- Location: FF_X1_Y21_N55
\ControlUnit:next_state.fetch~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector18~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:next_state.fetch~DUPLICATE_q\);

-- Location: LABCELL_X6_Y19_N24
\ControlUnit:opcode.LAND~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.LAND~0_combout\ = ( \ControlUnit:opcode.LAND~q\ & ( \RotateRight0~2_combout\ & ( (((!\mem|mem~35_combout\ & !\mem|mem~37_combout\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\)) # (\rst~input_o\) ) ) ) # ( 
-- !\ControlUnit:opcode.LAND~q\ & ( \RotateRight0~2_combout\ & ( (!\rst~input_o\ & (!\mem|mem~35_combout\ & (!\ControlUnit:next_state.fetch~DUPLICATE_q\ & !\mem|mem~37_combout\))) ) ) ) # ( \ControlUnit:opcode.LAND~q\ & ( !\RotateRight0~2_combout\ & ( 
-- (\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010111110101111110000000000000001101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \mem|ALT_INV_mem~35_combout\,
	datac => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datad => \mem|ALT_INV_mem~37_combout\,
	datae => \ALT_INV_ControlUnit:opcode.LAND~q\,
	dataf => \ALT_INV_RotateRight0~2_combout\,
	combout => \ControlUnit:opcode.LAND~0_combout\);

-- Location: FF_X6_Y19_N26
\ControlUnit:opcode.LAND\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.LAND~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.LAND~q\);

-- Location: FF_X5_Y19_N26
\alu_op.LAND\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ControlUnit:opcode.LAND~q\,
	sload => VCC,
	ena => \alu_op.HALT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_op.LAND~q\);

-- Location: LABCELL_X7_Y20_N45
\alu|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector0~0_combout\ = ( \alu_in[0][7]~q\ & ( \alu_op.LAND~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_alu_op.LAND~q\,
	dataf => \ALT_INV_alu_in[0][7]~q\,
	combout => \alu|Selector0~0_combout\);

-- Location: LABCELL_X7_Y20_N51
\alu|Selector0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector0~1_combout\ = ( \alu_op.LNOT~q\ & ( (!\alu_in[0][7]~q\) # (\alu_op.LOR~q\) ) ) # ( !\alu_op.LNOT~q\ & ( (\alu_in[0][7]~q\ & \alu_op.LOR~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_alu_in[0][7]~q\,
	datad => \ALT_INV_alu_op.LOR~q\,
	dataf => \ALT_INV_alu_op.LNOT~q\,
	combout => \alu|Selector0~1_combout\);

-- Location: LABCELL_X6_Y20_N0
\alu|Selector0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector0~2_combout\ = ( \alu_in[1][7]~q\ & ( \alu|WideNor0~0_combout\ & ( (!\alu|Selector0~0_combout\ & (!\alu|Selector0~1_combout\ & \alu|Selector5~1_combout\)) ) ) ) # ( !\alu_in[1][7]~q\ & ( \alu|WideNor0~0_combout\ & ( !\alu|Selector0~1_combout\ 
-- ) ) ) # ( \alu_in[1][7]~q\ & ( !\alu|WideNor0~0_combout\ & ( (!\alu|Selector0~0_combout\ & (!\alu|Add0~29_sumout\ & (!\alu|Selector0~1_combout\ & \alu|Selector5~1_combout\))) ) ) ) # ( !\alu_in[1][7]~q\ & ( !\alu|WideNor0~0_combout\ & ( 
-- (!\alu|Add0~29_sumout\ & !\alu|Selector0~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000000000001000000011110000111100000000000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_Selector0~0_combout\,
	datab => \alu|ALT_INV_Add0~29_sumout\,
	datac => \alu|ALT_INV_Selector0~1_combout\,
	datad => \alu|ALT_INV_Selector5~1_combout\,
	datae => \ALT_INV_alu_in[1][7]~q\,
	dataf => \alu|ALT_INV_WideNor0~0_combout\,
	combout => \alu|Selector0~2_combout\);

-- Location: LABCELL_X5_Y20_N54
\Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = ( \mem|mem~52_combout\ & ( (!\Selector3~0_combout\ & (((\ControlUnit:pc[7]~q\)))) # (\Selector3~0_combout\ & ((!\Selector3~2_combout\) # ((\Add0~29_sumout\)))) ) ) # ( !\mem|mem~52_combout\ & ( (!\Selector3~0_combout\ & 
-- (((\ControlUnit:pc[7]~q\)))) # (\Selector3~0_combout\ & (\Selector3~2_combout\ & ((\Add0~29_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000011011000010100001101101001110010111110100111001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector3~0_combout\,
	datab => \ALT_INV_Selector3~2_combout\,
	datac => \ALT_INV_ControlUnit:pc[7]~q\,
	datad => \ALT_INV_Add0~29_sumout\,
	dataf => \mem|ALT_INV_mem~52_combout\,
	combout => \Selector0~0_combout\);

-- Location: FF_X5_Y20_N56
\ControlUnit:pc[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector0~0_combout\,
	asdata => \Add0~29_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_ControlUnit:next_state.execute~q\,
	ena => \Selector31~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:pc[7]~q\);

-- Location: LABCELL_X5_Y20_N51
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( \ControlUnit:pc[7]~q\ ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_ControlUnit:pc[7]~q\,
	cin => \Add0~26\,
	sumout => \Add0~29_sumout\);

-- Location: LABCELL_X5_Y20_N0
\Selector29~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector29~0_combout\ = ( \ControlUnit:pc[7]~q\ & ( \Selector0~0_combout\ & ( (!\Selector31~1_combout\ & ((!\alu|Selector0~2_combout\) # ((\Selector31~0_combout\)))) # (\Selector31~1_combout\ & (((!\Selector31~0_combout\) # (\Add0~29_sumout\)))) ) ) ) # 
-- ( !\ControlUnit:pc[7]~q\ & ( \Selector0~0_combout\ & ( (!\Selector31~1_combout\ & (!\alu|Selector0~2_combout\ & ((!\Selector31~0_combout\)))) # (\Selector31~1_combout\ & (((!\Selector31~0_combout\) # (\Add0~29_sumout\)))) ) ) ) # ( \ControlUnit:pc[7]~q\ & 
-- ( !\Selector0~0_combout\ & ( (!\Selector31~1_combout\ & ((!\alu|Selector0~2_combout\) # ((\Selector31~0_combout\)))) # (\Selector31~1_combout\ & (((\Add0~29_sumout\ & \Selector31~0_combout\)))) ) ) ) # ( !\ControlUnit:pc[7]~q\ & ( !\Selector0~0_combout\ & 
-- ( (!\Selector31~1_combout\ & (!\alu|Selector0~2_combout\ & ((!\Selector31~0_combout\)))) # (\Selector31~1_combout\ & (((\Add0~29_sumout\ & \Selector31~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000011101000001111001110101111000000111010111111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_Selector0~2_combout\,
	datab => \ALT_INV_Add0~29_sumout\,
	datac => \ALT_INV_Selector31~1_combout\,
	datad => \ALT_INV_Selector31~0_combout\,
	datae => \ALT_INV_ControlUnit:pc[7]~q\,
	dataf => \ALT_INV_Selector0~0_combout\,
	combout => \Selector29~0_combout\);

-- Location: FF_X5_Y20_N2
\address[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector29~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(7));

-- Location: FF_X2_Y20_N50
\mem|mem_rtl_0_bypass[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => address(7),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(15));

-- Location: FF_X2_Y20_N10
\mem|mem_rtl_0_bypass[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector30~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(14));

-- Location: FF_X5_Y20_N22
\mem|mem_rtl_0_bypass[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector29~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(16));

-- Location: FF_X2_Y20_N5
\mem|mem_rtl_0_bypass[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => address(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(13));

-- Location: FF_X4_Y20_N58
\mem|mem_rtl_0_bypass[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector31~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(12));

-- Location: FF_X2_Y20_N22
\mem|mem_rtl_0_bypass[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => address(5),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(11));

-- Location: LABCELL_X2_Y20_N33
\mem|mem~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~26_combout\ = ( \mem|mem_rtl_0_bypass\(12) & ( \mem|mem_rtl_0_bypass\(11) & ( (!\mem|mem_rtl_0_bypass\(15) & (!\mem|mem_rtl_0_bypass\(16) & (!\mem|mem_rtl_0_bypass\(14) $ (\mem|mem_rtl_0_bypass\(13))))) # (\mem|mem_rtl_0_bypass\(15) & 
-- (\mem|mem_rtl_0_bypass\(16) & (!\mem|mem_rtl_0_bypass\(14) $ (\mem|mem_rtl_0_bypass\(13))))) ) ) ) # ( !\mem|mem_rtl_0_bypass\(12) & ( !\mem|mem_rtl_0_bypass\(11) & ( (!\mem|mem_rtl_0_bypass\(15) & (!\mem|mem_rtl_0_bypass\(16) & 
-- (!\mem|mem_rtl_0_bypass\(14) $ (\mem|mem_rtl_0_bypass\(13))))) # (\mem|mem_rtl_0_bypass\(15) & (\mem|mem_rtl_0_bypass\(16) & (!\mem|mem_rtl_0_bypass\(14) $ (\mem|mem_rtl_0_bypass\(13))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000010000100001000000000000000000000000000000001000010000100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem_rtl_0_bypass\(15),
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(14),
	datac => \mem|ALT_INV_mem_rtl_0_bypass\(16),
	datad => \mem|ALT_INV_mem_rtl_0_bypass\(13),
	datae => \mem|ALT_INV_mem_rtl_0_bypass\(12),
	dataf => \mem|ALT_INV_mem_rtl_0_bypass\(11),
	combout => \mem|mem~26_combout\);

-- Location: MLABCELL_X4_Y21_N30
\mem|mem~36\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~36_combout\ = ( \mem|mem~22_q\ & ( \mem|mem_rtl_0|auto_generated|ram_block1a4\ ) ) # ( !\mem|mem~22_q\ & ( \mem|mem_rtl_0|auto_generated|ram_block1a4\ & ( \mem|mem~17DUPLICATE_q\ ) ) ) # ( \mem|mem~22_q\ & ( 
-- !\mem|mem_rtl_0|auto_generated|ram_block1a4\ & ( !\mem|mem~17DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000001111000011111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \mem|ALT_INV_mem~17DUPLICATE_q\,
	datae => \mem|ALT_INV_mem~22_q\,
	dataf => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a4\,
	combout => \mem|mem~36_combout\);

-- Location: MLABCELL_X4_Y21_N54
\mem|mem~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~37_combout\ = ( \mem|mem_rtl_0_bypass\(25) & ( \mem|mem~36_combout\ ) ) # ( !\mem|mem_rtl_0_bypass\(25) & ( \mem|mem~36_combout\ & ( (\mem|mem_rtl_0_bypass\(26) & ((!\mem|mem~26_combout\) # ((!\mem|mem~27_combout\) # (!\mem|mem~28_combout\)))) ) 
-- ) ) # ( \mem|mem_rtl_0_bypass\(25) & ( !\mem|mem~36_combout\ & ( (!\mem|mem_rtl_0_bypass\(26)) # ((\mem|mem~26_combout\ & (\mem|mem~27_combout\ & \mem|mem~28_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000100000000111111101111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~26_combout\,
	datab => \mem|ALT_INV_mem~27_combout\,
	datac => \mem|ALT_INV_mem~28_combout\,
	datad => \mem|ALT_INV_mem_rtl_0_bypass\(26),
	datae => \mem|ALT_INV_mem_rtl_0_bypass\(25),
	dataf => \mem|ALT_INV_mem~36_combout\,
	combout => \mem|mem~37_combout\);

-- Location: LABCELL_X5_Y21_N51
\ControlUnit:opcode.JGR~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.JGR~0_combout\ = ( \ControlUnit:opcode.JGR~q\ & ( \RotateRight0~1_combout\ & ( (((\mem|mem~37_combout\ & !\mem|mem~35_combout\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\)) # (\rst~input_o\) ) ) ) # ( !\ControlUnit:opcode.JGR~q\ & 
-- ( \RotateRight0~1_combout\ & ( (\mem|mem~37_combout\ & (!\rst~input_o\ & (!\ControlUnit:next_state.fetch~DUPLICATE_q\ & !\mem|mem~35_combout\))) ) ) ) # ( \ControlUnit:opcode.JGR~q\ & ( !\RotateRight0~1_combout\ & ( 
-- (\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001111110011111101000000000000000111111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem~37_combout\,
	datab => \ALT_INV_rst~input_o\,
	datac => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datad => \mem|ALT_INV_mem~35_combout\,
	datae => \ALT_INV_ControlUnit:opcode.JGR~q\,
	dataf => \ALT_INV_RotateRight0~1_combout\,
	combout => \ControlUnit:opcode.JGR~0_combout\);

-- Location: FF_X5_Y21_N53
\ControlUnit:opcode.JGR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.JGR~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.JGR~q\);

-- Location: LABCELL_X5_Y21_N57
\Selector3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = ( \WideNor0~0_combout\ & ( (((\ControlUnit:opcode.JEQ~q\) # (\Equal0~0_combout\)) # (\ControlUnit:opcode.JMP~q\)) # (\ControlUnit:opcode.JGR~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001111111111111110111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.JGR~q\,
	datab => \ALT_INV_ControlUnit:opcode.JMP~q\,
	datac => \ALT_INV_Equal0~0_combout\,
	datad => \ALT_INV_ControlUnit:opcode.JEQ~q\,
	dataf => \ALT_INV_WideNor0~0_combout\,
	combout => \Selector3~0_combout\);

-- Location: MLABCELL_X4_Y20_N24
\Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = ( \mem|mem~44_combout\ & ( (!\Selector3~0_combout\ & (((\ControlUnit:pc[0]~q\)))) # (\Selector3~0_combout\ & ((!\Selector3~2_combout\) # ((\Add0~1_sumout\)))) ) ) # ( !\mem|mem~44_combout\ & ( (!\Selector3~0_combout\ & 
-- (((\ControlUnit:pc[0]~q\)))) # (\Selector3~0_combout\ & (\Selector3~2_combout\ & ((\Add0~1_sumout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000011011000010100001101101001110010111110100111001011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Selector3~0_combout\,
	datab => \ALT_INV_Selector3~2_combout\,
	datac => \ALT_INV_ControlUnit:pc[0]~q\,
	datad => \ALT_INV_Add0~1_sumout\,
	dataf => \mem|ALT_INV_mem~44_combout\,
	combout => \Selector7~0_combout\);

-- Location: FF_X4_Y20_N26
\ControlUnit:pc[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector7~0_combout\,
	asdata => \Add0~1_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_ControlUnit:next_state.execute~q\,
	ena => \Selector31~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:pc[0]~q\);

-- Location: LABCELL_X6_Y19_N57
\alu|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector7~0_combout\ = ( \alu_in[1][0]~q\ & ( (!\alu_op.LOR~q\ & ((!\alu_in[0][0]~q\ & ((!\alu_op.LNOT~q\))) # (\alu_in[0][0]~q\ & (!\alu_op.LAND~q\)))) ) ) # ( !\alu_in[1][0]~q\ & ( (!\alu_in[0][0]~q\ & ((!\alu_op.LNOT~q\))) # (\alu_in[0][0]~q\ & 
-- (!\alu_op.LOR~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111000100010111011100010001010101000001000001010100000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_alu_op.LOR~q\,
	datab => \ALT_INV_alu_in[0][0]~q\,
	datac => \ALT_INV_alu_op.LAND~q\,
	datad => \ALT_INV_alu_op.LNOT~q\,
	dataf => \ALT_INV_alu_in[1][0]~q\,
	combout => \alu|Selector7~0_combout\);

-- Location: LABCELL_X6_Y20_N6
\alu|Selector7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \alu|Selector7~1_combout\ = ( \alu|Selector7~0_combout\ & ( (!\alu|WideNor0~0_combout\ & (!\alu|Add0~1_sumout\ & ((!\alu_in[1][0]~q\) # (!\alu|WideNor0~combout\)))) # (\alu|WideNor0~0_combout\ & ((!\alu_in[1][0]~q\) # ((!\alu|WideNor0~combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110101110001001111010111000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \alu|ALT_INV_WideNor0~0_combout\,
	datab => \ALT_INV_alu_in[1][0]~q\,
	datac => \alu|ALT_INV_Add0~1_sumout\,
	datad => \alu|ALT_INV_WideNor0~combout\,
	dataf => \alu|ALT_INV_Selector7~0_combout\,
	combout => \alu|Selector7~1_combout\);

-- Location: MLABCELL_X4_Y20_N18
\Selector36~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector36~0_combout\ = ( \Selector31~0_combout\ & ( \alu|Selector7~1_combout\ & ( (!\Selector31~1_combout\ & (\ControlUnit:pc[0]~q\)) # (\Selector31~1_combout\ & ((\Add0~1_sumout\))) ) ) ) # ( !\Selector31~0_combout\ & ( \alu|Selector7~1_combout\ & ( 
-- (\Selector31~1_combout\ & \Selector7~0_combout\) ) ) ) # ( \Selector31~0_combout\ & ( !\alu|Selector7~1_combout\ & ( (!\Selector31~1_combout\ & (\ControlUnit:pc[0]~q\)) # (\Selector31~1_combout\ & ((\Add0~1_sumout\))) ) ) ) # ( !\Selector31~0_combout\ & ( 
-- !\alu|Selector7~1_combout\ & ( (!\Selector31~1_combout\) # (\Selector7~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100111111001111010001000111011100000011000000110100010001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:pc[0]~q\,
	datab => \ALT_INV_Selector31~1_combout\,
	datac => \ALT_INV_Selector7~0_combout\,
	datad => \ALT_INV_Add0~1_sumout\,
	datae => \ALT_INV_Selector31~0_combout\,
	dataf => \alu|ALT_INV_Selector7~1_combout\,
	combout => \Selector36~0_combout\);

-- Location: FF_X4_Y20_N23
\mem|mem_rtl_0_bypass[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector36~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(2));

-- Location: FF_X4_Y20_N7
\mem|mem_rtl_0_bypass[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Selector35~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(4));

-- Location: FF_X4_Y20_N17
\mem|mem_rtl_0_bypass[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => address(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(3));

-- Location: FF_X4_Y20_N5
\mem|mem_rtl_0_bypass[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => address(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(1));

-- Location: FF_X4_Y20_N53
\mem|mem_rtl_0_bypass[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \mem_write~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(0));

-- Location: MLABCELL_X4_Y20_N45
\mem|mem~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~27_combout\ = ( \mem|mem_rtl_0_bypass\(0) & ( (!\mem|mem_rtl_0_bypass\(2) & (!\mem|mem_rtl_0_bypass\(1) & (!\mem|mem_rtl_0_bypass\(4) $ (\mem|mem_rtl_0_bypass\(3))))) # (\mem|mem_rtl_0_bypass\(2) & (\mem|mem_rtl_0_bypass\(1) & 
-- (!\mem|mem_rtl_0_bypass\(4) $ (\mem|mem_rtl_0_bypass\(3))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010000010010000011000001001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem_rtl_0_bypass\(2),
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(4),
	datac => \mem|ALT_INV_mem_rtl_0_bypass\(3),
	datad => \mem|ALT_INV_mem_rtl_0_bypass\(1),
	dataf => \mem|ALT_INV_mem_rtl_0_bypass\(0),
	combout => \mem|mem~27_combout\);

-- Location: MLABCELL_X4_Y20_N42
\mem|mem~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~34_combout\ = ( \mem|mem~17DUPLICATE_q\ & ( \mem|mem_rtl_0|auto_generated|ram_block1a5\ ) ) # ( !\mem|mem~17DUPLICATE_q\ & ( \mem|mem~23_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a5\,
	datad => \mem|ALT_INV_mem~23_q\,
	dataf => \mem|ALT_INV_mem~17DUPLICATE_q\,
	combout => \mem|mem~34_combout\);

-- Location: MLABCELL_X4_Y20_N48
\mem|mem~35\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~35_combout\ = ( \mem|mem_rtl_0_bypass\(27) & ( \mem|mem~34_combout\ ) ) # ( !\mem|mem_rtl_0_bypass\(27) & ( \mem|mem~34_combout\ & ( (\mem|mem_rtl_0_bypass\(28) & ((!\mem|mem~27_combout\) # ((!\mem|mem~28_combout\) # (!\mem|mem~26_combout\)))) ) 
-- ) ) # ( \mem|mem_rtl_0_bypass\(27) & ( !\mem|mem~34_combout\ & ( (!\mem|mem_rtl_0_bypass\(28)) # ((\mem|mem~27_combout\ & (\mem|mem~28_combout\ & \mem|mem~26_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101101010101010101001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|ALT_INV_mem_rtl_0_bypass\(28),
	datab => \mem|ALT_INV_mem~27_combout\,
	datac => \mem|ALT_INV_mem~28_combout\,
	datad => \mem|ALT_INV_mem~26_combout\,
	datae => \mem|ALT_INV_mem_rtl_0_bypass\(27),
	dataf => \mem|ALT_INV_mem~34_combout\,
	combout => \mem|mem~35_combout\);

-- Location: LABCELL_X6_Y19_N48
\ControlUnit:opcode.STORE~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ControlUnit:opcode.STORE~0_combout\ = ( \ControlUnit:opcode.STORE~q\ & ( \RotateRight0~1_combout\ & ( (((\mem|mem~35_combout\ & \mem|mem~37_combout\)) # (\ControlUnit:next_state.fetch~DUPLICATE_q\)) # (\rst~input_o\) ) ) ) # ( 
-- !\ControlUnit:opcode.STORE~q\ & ( \RotateRight0~1_combout\ & ( (!\rst~input_o\ & (\mem|mem~35_combout\ & (!\ControlUnit:next_state.fetch~DUPLICATE_q\ & \mem|mem~37_combout\))) ) ) ) # ( \ControlUnit:opcode.STORE~q\ & ( !\RotateRight0~1_combout\ & ( 
-- (\ControlUnit:next_state.fetch~DUPLICATE_q\) # (\rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010111110101111100000000001000000101111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \mem|ALT_INV_mem~35_combout\,
	datac => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	datad => \mem|ALT_INV_mem~37_combout\,
	datae => \ALT_INV_ControlUnit:opcode.STORE~q\,
	dataf => \ALT_INV_RotateRight0~1_combout\,
	combout => \ControlUnit:opcode.STORE~0_combout\);

-- Location: FF_X6_Y19_N50
\ControlUnit:opcode.STORE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ControlUnit:opcode.STORE~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ControlUnit:opcode.STORE~q\);

-- Location: MLABCELL_X4_Y19_N51
\next_state~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \next_state~1_combout\ = (\ControlUnit:opcode.LOAD~q\) # (\ControlUnit:opcode.STORE~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.STORE~q\,
	datab => \ALT_INV_ControlUnit:opcode.LOAD~q\,
	combout => \next_state~1_combout\);

-- Location: IOIBUF_X0_Y19_N55
\input[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(0),
	o => \input[0]~input_o\);

-- Location: FF_X4_Y19_N17
\mem|mem_rtl_0_bypass[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \mem|mem_rtl_0_bypass[17]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem_rtl_0_bypass\(17));

-- Location: FF_X4_Y19_N47
\mem|mem~18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \mem|mem~55_combout\,
	sload => VCC,
	ena => \mem|mem~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \mem|mem~18_q\);

-- Location: MLABCELL_X4_Y19_N42
\mem|mem~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \mem|mem~29_combout\ = ( \mem|mem~28_combout\ & ( \mem|mem~27_combout\ & ( (\mem|mem_rtl_0_bypass\(18) & !\mem|mem~26_combout\) ) ) ) # ( !\mem|mem~28_combout\ & ( \mem|mem~27_combout\ & ( \mem|mem_rtl_0_bypass\(18) ) ) ) # ( \mem|mem~28_combout\ & ( 
-- !\mem|mem~27_combout\ & ( \mem|mem_rtl_0_bypass\(18) ) ) ) # ( !\mem|mem~28_combout\ & ( !\mem|mem~27_combout\ & ( \mem|mem_rtl_0_bypass\(18) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(18),
	datad => \mem|ALT_INV_mem~26_combout\,
	datae => \mem|ALT_INV_mem~28_combout\,
	dataf => \mem|ALT_INV_mem~27_combout\,
	combout => \mem|mem~29_combout\);

-- Location: MLABCELL_X4_Y19_N24
\Selector17~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector17~1_combout\ = ( \mem|mem~18_q\ & ( \mem|mem~29_combout\ & ( (\mem|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\ & (\Selector17~0_combout\ & \mem|mem~17DUPLICATE_q\)) ) ) ) # ( !\mem|mem~18_q\ & ( \mem|mem~29_combout\ & ( 
-- (\Selector17~0_combout\ & ((!\mem|mem~17DUPLICATE_q\) # (\mem|mem_rtl_0|auto_generated|ram_block1a0~portbdataout\))) ) ) ) # ( \mem|mem~18_q\ & ( !\mem|mem~29_combout\ & ( (!\mem|mem_rtl_0_bypass\(17) & \Selector17~0_combout\) ) ) ) # ( !\mem|mem~18_q\ & 
-- ( !\mem|mem~29_combout\ & ( (!\mem|mem_rtl_0_bypass\(17) & \Selector17~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000001111000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \mem|mem_rtl_0|auto_generated|ALT_INV_ram_block1a0~portbdataout\,
	datab => \mem|ALT_INV_mem_rtl_0_bypass\(17),
	datac => \ALT_INV_Selector17~0_combout\,
	datad => \mem|ALT_INV_mem~17DUPLICATE_q\,
	datae => \mem|ALT_INV_mem~18_q\,
	dataf => \mem|ALT_INV_mem~29_combout\,
	combout => \Selector17~1_combout\);

-- Location: MLABCELL_X4_Y19_N36
\Selector17~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector17~2_combout\ = ( \input[0]~input_o\ & ( \Selector17~1_combout\ ) ) # ( !\input[0]~input_o\ & ( \Selector17~1_combout\ ) ) # ( \input[0]~input_o\ & ( !\Selector17~1_combout\ & ( (!\ControlUnit:opcode.MOV~q\ & (((!\next_state~1_combout\ & 
-- !\alu|Selector7~1_combout\)) # (\ControlUnit:opcode.DIN~q\))) # (\ControlUnit:opcode.MOV~q\ & (((!\alu|Selector7~1_combout\)))) ) ) ) # ( !\input[0]~input_o\ & ( !\Selector17~1_combout\ & ( (!\alu|Selector7~1_combout\ & (((!\next_state~1_combout\ & 
-- !\ControlUnit:opcode.DIN~q\)) # (\ControlUnit:opcode.MOV~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000011110000101100111111000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_next_state~1_combout\,
	datab => \ALT_INV_ControlUnit:opcode.DIN~q\,
	datac => \alu|ALT_INV_Selector7~1_combout\,
	datad => \ALT_INV_ControlUnit:opcode.MOV~q\,
	datae => \ALT_INV_input[0]~input_o\,
	dataf => \ALT_INV_Selector17~1_combout\,
	combout => \Selector17~2_combout\);

-- Location: FF_X4_Y19_N38
\wb[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector17~2_combout\,
	ena => \wb[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => wb(0));

-- Location: LABCELL_X6_Y21_N39
\output[0]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \output[0]~reg0feeder_combout\ = ( wb(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_wb(0),
	combout => \output[0]~reg0feeder_combout\);

-- Location: LABCELL_X5_Y21_N15
\output[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \output[0]~0_combout\ = (\ControlUnit:opcode.DOUT~q\ & \ControlUnit:next_state.execute~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ControlUnit:opcode.DOUT~q\,
	datac => \ALT_INV_ControlUnit:next_state.execute~q\,
	combout => \output[0]~0_combout\);

-- Location: FF_X6_Y21_N40
\output[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \output[0]~reg0feeder_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \output[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[0]~reg0_q\);

-- Location: FF_X6_Y19_N47
\output[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(1),
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \output[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[1]~reg0_q\);

-- Location: FF_X6_Y20_N56
\output[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(2),
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \output[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[2]~reg0_q\);

-- Location: FF_X5_Y20_N25
\output[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(3),
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \output[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[3]~reg0_q\);

-- Location: FF_X6_Y20_N41
\output[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(4),
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \output[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[4]~reg0_q\);

-- Location: FF_X6_Y20_N16
\output[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(5),
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \output[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[5]~reg0_q\);

-- Location: FF_X6_Y21_N47
\output[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(6),
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \output[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[6]~reg0_q\);

-- Location: FF_X6_Y20_N13
\output[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => wb(7),
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \output[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \output[7]~reg0_q\);

-- Location: LABCELL_X1_Y21_N42
\Selector37~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Selector37~0_combout\ = ( \waiting~reg0_q\ & ( \ControlUnit:next_state.fetch~DUPLICATE_q\ & ( (\ControlUnit:next_state.execute~q\) # (\ControlUnit:next_state.memory_access~q\) ) ) ) # ( !\waiting~reg0_q\ & ( \ControlUnit:next_state.fetch~DUPLICATE_q\ & ( 
-- (\ControlUnit:opcode.DIN~q\ & \ControlUnit:next_state.execute~q\) ) ) ) # ( \waiting~reg0_q\ & ( !\ControlUnit:next_state.fetch~DUPLICATE_q\ ) ) # ( !\waiting~reg0_q\ & ( !\ControlUnit:next_state.fetch~DUPLICATE_q\ & ( (\ControlUnit:opcode.DIN~q\ & 
-- \ControlUnit:next_state.execute~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111111111111111100000000000011110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ControlUnit:next_state.memory_access~q\,
	datac => \ALT_INV_ControlUnit:opcode.DIN~q\,
	datad => \ALT_INV_ControlUnit:next_state.execute~q\,
	datae => \ALT_INV_waiting~reg0_q\,
	dataf => \ALT_INV_ControlUnit:next_state.fetch~DUPLICATE_q\,
	combout => \Selector37~0_combout\);

-- Location: FF_X1_Y21_N43
\waiting~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Selector37~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \waiting~reg0_q\);

-- Location: MLABCELL_X13_Y22_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


