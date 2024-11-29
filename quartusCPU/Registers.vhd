library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.instructions_t.all;

entity Registers is
        port (
            rs        : in  reg_array(0 to 1);
            rd        : in  std_logic_vector(reg_r);
            wdata     : in  std_logic_vector(inst_r);
            ops       : out word_array(0 to 1)
        );
end entity Registers;

architecture DataFlow of Registers is
    signal regs : word_array(addressable_reg);
begin
    ops(0) <= regs(to_integer(unsigned(rs(0))));
    ops(1) <= regs(to_integer(unsigned(rs(1))));
    regs(to_integer(unsigned(rd))) <= wdata;
end architecture DataFlow;
