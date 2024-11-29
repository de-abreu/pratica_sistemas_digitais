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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/25/2024 11:39:16"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          CentralProcessingUnit
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY CentralProcessingUnit_vhd_vec_tst IS
END CentralProcessingUnit_vhd_vec_tst;
ARCHITECTURE CentralProcessingUnit_arch OF CentralProcessingUnit_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL input : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL output : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
SIGNAL set : STD_LOGIC;
SIGNAL waiting : STD_LOGIC;
COMPONENT CentralProcessingUnit
	PORT (
	clk : IN STD_LOGIC;
	input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	rst : IN STD_LOGIC;
	set : IN STD_LOGIC;
	waiting : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : CentralProcessingUnit
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	input => input,
	output => output,
	rst => rst,
	set => set,
	waiting => waiting
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- input[7]
t_prcs_input_7: PROCESS
BEGIN
	input(7) <= '0';
WAIT;
END PROCESS t_prcs_input_7;
-- input[6]
t_prcs_input_6: PROCESS
BEGIN
	input(6) <= '0';
WAIT;
END PROCESS t_prcs_input_6;
-- input[5]
t_prcs_input_5: PROCESS
BEGIN
	input(5) <= '0';
	WAIT FOR 10000 ps;
	input(5) <= '1';
	WAIT FOR 40000 ps;
	input(5) <= '0';
WAIT;
END PROCESS t_prcs_input_5;
-- input[4]
t_prcs_input_4: PROCESS
BEGIN
	input(4) <= '0';
WAIT;
END PROCESS t_prcs_input_4;
-- input[3]
t_prcs_input_3: PROCESS
BEGIN
	input(3) <= '0';
WAIT;
END PROCESS t_prcs_input_3;
-- input[2]
t_prcs_input_2: PROCESS
BEGIN
	input(2) <= '0';
	WAIT FOR 10000 ps;
	input(2) <= '1';
	WAIT FOR 40000 ps;
	input(2) <= '0';
	WAIT FOR 10000 ps;
	input(2) <= '1';
	WAIT FOR 60000 ps;
	input(2) <= '0';
WAIT;
END PROCESS t_prcs_input_2;
-- input[1]
t_prcs_input_1: PROCESS
BEGIN
	input(1) <= '0';
WAIT;
END PROCESS t_prcs_input_1;
-- input[0]
t_prcs_input_0: PROCESS
BEGIN
	input(0) <= '0';
	WAIT FOR 60000 ps;
	input(0) <= '1';
	WAIT FOR 60000 ps;
	input(0) <= '0';
WAIT;
END PROCESS t_prcs_input_0;

-- rst
t_prcs_rst: PROCESS
BEGIN
	rst <= '1';
	WAIT FOR 10000 ps;
	rst <= '0';
WAIT;
END PROCESS t_prcs_rst;

-- set
t_prcs_set: PROCESS
BEGIN
	set <= '0';
	WAIT FOR 10000 ps;
	set <= '1';
	WAIT FOR 30000 ps;
	set <= '0';
	WAIT FOR 20000 ps;
	set <= '1';
	WAIT FOR 40000 ps;
	set <= '0';
WAIT;
END PROCESS t_prcs_set;
END CentralProcessingUnit_arch;
