library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.arrays_t.all;
use work.instructions_t.all;

entity Registers is
        port (
            rs        : in  vector_array(0 to 1)(reg_r);
            rd        : in  std_logic_vector(reg_r);
            wren      : in  std_logic;
            wdata     : in  std_logic_vector(inst_r);
            ops       : out vector_array(0 to 1)(inst_r)
        );
end entity Registers;

architecture DataFlow of Registers is
    signal regs : vector_array(addressable_reg)(inst_r);
    signal sel : addressable_reg;
begin
    ops(0) <= regs(to_integer(unsigned(rs(0))));
    ops(1) <= regs(to_integer(unsigned(rs(1))));
    sel <= to_integer(unsigned(rd));
    regs(sel) <= wdata when wren = '1' else regs(sel);
end architecture DataFlow;
