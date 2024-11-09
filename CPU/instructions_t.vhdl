library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

package instructions_t is

    -- Instruction format
    -- | func    | rs0 | rs1 |
    -- | 7 6 5 4 | 3 2 | 1 0 |

    -- Lengths and address to indicate immediate values
    constant inst_l : integer := 8;
    constant reg_l  : integer := 2;
    -- Whenever rs2 assumes this value, load operator b with the next value stored in memory
    constant imm : std_logic_vector(1 downto 0) := "11";

    -- Ranges
    subtype inst_r is natural range 7 downto 0;
    subtype func_r is natural range 7 downto 4;
    subtype rs0_r  is natural range 3 downto 2;
    subtype rs1_r  is natural range 1 downto 0;
    subtype addressable is natural range 0 to 2 ** inst_l - 1;
    alias reg_r is rs1_r;

    -- Function enumeration
    type func is (
        NOP,
        ADD, SUB, CMP,   -- Arithmetic
        LAND, LOR, LNOT, -- Logic
        JMP, JEQ, JGR,   -- Jump
        LOAD, STORE,     -- Memory access
        DIN, DOUT,       -- I/O
        MOV, HALT
    );

    -- Function encoding
    attribute syn_encoding: string;
    attribute syn_encoding of func: type is "0000 0001 0010 0011 0100 0101 0110 0111 1000 1001 1010 1011 1100 1101 1110, 1111";

    -- Conversion from std_logic_vector
    pure function to_func(vec : std_logic_vector(3 downto 0)) return func;
end package instructions_t;

package body instructions_t is
    pure function to_func(vec : std_logic_vector(3 downto 0)) return func is
    begin
        return func'val(to_integer(unsigned(vec)));
    end function to_func;
end package body instructions_t;
