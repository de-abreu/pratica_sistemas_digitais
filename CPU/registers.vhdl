library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.arrays_t.all;

entity Registers is
        generic (width, count : integer);
        port (
            rs    : in vector_array(0 to 1)(count - 1 downto 0);
            rd    : in  std_logic_vector(count - 1 downto 0);
            wdata : in  std_logic_vector(width - 1 downto 0);
            ops   : out vector_array(0 to 1)(width - 1 downto 0)
        );
end entity Registers;

architecture DataFlow of Registers is
    signal regs : vector_array(0 to count - 1)(width - 1 downto 0);
    begin
        ops(0) <= regs(to_integer(unsigned(rs(0))));
        ops(1) <= regs(to_integer(unsigned(rs(1))));
        regs(to_integer(unsigned(rd))) <= wdata;
end architecture DataFlow;
