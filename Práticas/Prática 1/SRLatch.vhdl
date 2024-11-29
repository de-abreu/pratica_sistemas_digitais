library ieee;
use ieee.std_logic_1164.all;

entity sr_latch is
    port (
        set, rst, clk : in STD_LOGIC;
        q, notQ : out STD_LOGIC
    );
end entity sr_latch;

architecture data_flow of sr_latch is
    signal q_tmp, notQ_tmp : STD_LOGIC;
begin
    q_tmp <= notQ_tmp nor rst and clk;
    notQ_tmp <= q_tmp nor set and clk;
    q <= q_tmp;
    notQ <= notQ_tmp;
end architecture data_flow;
