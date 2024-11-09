library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.arrays_t.all;
use work.instructions_t.all;

entity Registers is
        port (
            rs    : in vector_array(0 to 1)(reg_r);
            rd    : in  std_logic_vector(reg_r);
            wdata : in  std_logic_vector(inst_r);
            ops   : out vector_array(0 to 1)(inst_r)
        );
end entity Registers;

architecture DataFlow of Registers is
    signal rd_index : natural range 0 to 2 ** reg_l - 2;
    signal regs : vector_array(0 to 2 ** reg_l - 2)(inst_r);
    begin
        rd_index  <= to_integer(unsigned(rd));
        ops(0) <= regs(to_integer(unsigned(rs(0))));
        ops(1) <= regs(to_integer(unsigned(rs(1))));
        regs(rd_index) <= wdata;
end architecture DataFlow;
