library ieee;
use ieee.std_logic_1164.all;
use work.array_t.all;
use work.instructions_t.all;

package template_t is
    subtype program is vector_array(addressable_mem)(inst_r);
    constant template : program;
end package template_t;

package body template_t is
    constant template : program :=
    (
        0  => x"C0", -- DIN A
        1  => x"C4", -- DIN B
        2  => x"EB", -- MOV R Imm
        3  => x"00", -- 0
        4  => x"37", -- CMP B Imm
        5  => x"00", -- 0
        6  => x"80", -- JEQ Imm
        7  => x"12", -- 18
        8  => x"18", -- ADD R A
        9  => x"BB", -- STORE R Imm
        10 => x"FF", -- 255
        11 => x"27", -- SUB B Imm
        12 => x"01", -- 1
        13 => x"E6", -- MOV B R
        14 => x"AB", -- LOAD R Imm
        15 => x"FF", -- 255
        16 => x"70", -- JMP Imm
        17 => x"04", -- 4
        18 => x"D8", -- DOUT R
        19 => x"F0", -- HALT
        others => x"00"
    );
end package body template_t;
