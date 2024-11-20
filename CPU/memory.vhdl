library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.arrays_t.all;
use work.instructions_t.all;

entity Memory is
    port (
        address, data : in std_logic_vector(7 downto 0);
        clock, wren : in std_logic;
        q : out std_logic_vector(7 downto 0)
         );
end entity Memory;

architecture Behaviour of Memory is
    signal mem : vector_array(0 to 2**8 - 1)(7 downto 0) :=
    -- Sum test
    -- (
    --     0 => x"C0",
    --     1 => x"C4",
    --     2 => x"11",
    --     3 => x"D8",
    --     4 => x"F0",
    --     others => x"00"
    -- );
    -- Multiplication test
    (
        0  => x"E3", -- MOV A Imm
        1  => x"05", -- 5
        2  => x"E7", -- MOV B Imm
        3  => x"07", -- 7
        4  => x"EB", -- MOV R Imm
        5  => x"00", -- 0
        6  => x"37", -- CMP B Imm
        7  => x"00", -- 0
        8  => x"80", -- JEQ Imm
        9  => x"10", -- 16
        10 => x"18", -- ADD R A
        11 => x"BB", -- STORE R Imm
        12 => x"FF", -- 255
        13 => x"27", -- SUB B Imm
        14 => x"01", -- 1
        15 => x"E6", -- MOV B R
        16 => x"AB", -- LOAD R Imm
        17 => x"FF", -- 255
        18 => x"70", -- JMP Imm
        19 => x"06", -- 6
        20 => x"D8", -- DOUT R
        21 => x"F0", -- HALT
        others => x"00"
    );
    signal index : addressable_mem;
    begin
        index <= to_integer(unsigned(address));
        q <= mem(index);

        memory_access: process(clock)
        begin
            if rising_edge(clock) and wren = '1' then
                mem(index) <= data;
            end if;
        end process memory_access;
end architecture Behaviour;
