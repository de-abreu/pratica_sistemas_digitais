library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.arrays_t.all;
use work.instructions_t.all;

entity Registers is
        port (
            rs        : in  vector_array(0 to 1)(reg_r);
            rd        : in  std_logic_vector(reg_r);
            clk, wren : in  std_logic;
            wdata     : in  std_logic_vector(inst_r);
            ops       : out vector_array(0 to 1)(inst_r)
        );
end entity Registers;

architecture Behaviour of Registers is
    signal regs : vector_array(addressable_reg)(inst_r);
begin
    ops(0) <= regs(to_integer(unsigned(rs(0))));
    ops(1) <= regs(to_integer(unsigned(rs(1))));

    write: process(clk)
        variable sel : addressable_reg;
    begin
        sel := to_integer(unsigned(rd));
        regs(sel) <= wdata when falling_edge(clk) and wren = '1' else regs(sel);
    end process write;
end architecture Behaviour;
