library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.instructions_t.all;

entity Memory is
    port (
        address, data : in std_logic_vector(inst_r);
        clock, wren : in std_logic;
        q : out std_logic_vector(inst_r)
         );
end entity Memory;

architecture Behaviour of Memory is
    signal mem : word_array(addressable_mem) :=
    -- Multiplication program
    -- (
    --     0  => x"C0", -- DIN A
    --     1  => x"C4", -- DIN B
    --     2  => x"EB", -- MOV R Imm
    --     3  => x"00", -- 0
    --     4  => x"37", -- CMP B Imm
    --     5  => x"00", -- 0
    --     6  => x"80", -- JEQ Imm
    --     7  => x"12", -- 18
    --     8  => x"18", -- ADD R A
    --     9  => x"BB", -- STORE R Imm
    --     10 => x"FF", -- 255
    --     11 => x"27", -- SUB B Imm
    --     12 => x"01", -- 1
    --     13 => x"E6", -- MOV B R
    --     14 => x"AB", -- LOAD R Imm
    --     15 => x"FF", -- 255
    --     16 => x"70", -- JMP Imm
    --     17 => x"04", -- 4
    --     18 => x"D8", -- DOUT R
    --     19 => x"F0", -- HALT
    --     others => x"00"
    -- );

    --Division program
    (
        0  => x"C3", -- DIN A
        1  => x"C7", -- DIN B
        2  => x"EB", -- MOV R Imm
        3  => x"00", -- 0
        4  => x"BB", -- STORE R Imm
        5  => x"FF", -- 255
        6  => x"E8", -- MOV R A
        7  => x"29", -- SUB R B
        8  => x"E2", -- MOV A R
        9  => x"AB", -- LOAD R Imm
        10 => x"FF", -- 255
        11 => x"1B", -- ADD R Imm
        12 => x"01", -- 1
        13 => x"BB", -- STORE R Imm
        14 => x"FF", -- 255
        15 => x"E8", -- MOV R A
        16 => x"34", -- CMP R B
        17 => x"93", -- JGR Imm
        18 => x"06", -- 6
        19 => x"AB", -- LOAD R Imm
        20 => x"FF", -- 255
        21 => x"D8", -- DOUT R
        22 => x"F0", -- HALT
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
