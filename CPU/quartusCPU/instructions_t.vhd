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
    -- Whenever rs1 assumes this value, load operator b with the next value stored in memory
    constant imm : std_logic_vector(1 downto 0) := "11";

    -- Ranges
    subtype inst_r is natural range 7 downto 0;
    subtype func_r is natural range 7 downto 4;
    subtype rs0_r  is natural range 3 downto 2;
    subtype rs1_r  is natural range 1 downto 0;
    subtype addressable_mem is natural range 0 to 2 ** inst_l - 1;
    subtype addressable_reg is natural range 0 to 2 ** reg_l - 1;
    alias reg_r is rs1_r;

	 -- std_logic_vector arrays
	 type word_array is array (natural range <>) of STD_LOGIC_VECTOR(inst_r);
	 type reg_array is array (natural range <>) of STD_LOGIC_VECTOR(reg_r);

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

    -- Conversion from std_logic_vector
    pure function to_func(vec : std_logic_vector(3 downto 0)) return func;
    pure function incr(counter: addressable_mem) return addressable_mem;
end package instructions_t;

package body instructions_t is
    pure function to_func(vec : std_logic_vector(3 downto 0)) return func is
    begin
        return func'val(to_integer(unsigned(vec)));
    end function to_func;

    pure function incr(counter: addressable_mem) return addressable_mem is
    begin
        return (counter + 1) mod (addressable_mem'high + 1);
    end function incr;
end package body instructions_t;
