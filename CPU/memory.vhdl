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
    -- Multiplication program
    (
        0  => x"C3", -- DIN A
        1  => x"C7", -- DIN B
        2  => x"EB", -- MOV R Imm
        3  => x"00", -- 0
        4  => x"37", -- CMP B Imm
        5  => x"00", -- 0
        6  => x"80", -- JEQ Imm
        7  => x"12", -- 18
        8 => x"18", -- ADD R A
        9 => x"BB", -- STORE R Imm
        10 => x"FF", -- 255
        11 => x"27", -- SUB B Imm
        12 => x"01", -- 1
        13 => x"E6", -- MOV B R
        14 => x"AB", -- LOAD R Imm
        15 => x"FF", -- 255
        16 => x"70", -- JMP Imm
        17 => x"06", -- 4
        18 => x"D8", -- DOUT R
        19 => x"F0", -- HALT
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
