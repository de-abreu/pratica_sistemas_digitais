library ieee;
use ieee.std_logic_1164.all;
use work.array_t.all;
use work.instructions_t.all;

package multiply_t is
    subtype program is vector_array(addressable_mem)(inst_r);
    constant multiply : program;
end package multiply_t;

package body multiply_t is
    constant multiply : program :=
    (

		0 => x"C0", -- IN A
		1 => x"C4", -- IN B
		2 => x"EB", -- MOV R 0
		3 => x"00", -- 0
		4 => x"37", -- CMP B 0  (loop_start)
		5 => x"00", -- 0
		6 => x"80", -- JEQ LOOP_END
		7 => x"12", -- 18
		8 => x"18", -- ADD R A
		9 => x"BB", -- STORE R 255
		10 => x"FF", -- 255
		11 => x"27", -- SUB B 1
		12 => x"01", -- 1
		13 => x"E6", -- MOV B R
		14 => x"AB", -- LOAD R 255
		15 => x"FF", -- 255
		16 => x"70", -- JMP LOOP_START
		17 => x"04", -- 4
		18 => x"D8", -- OUT R  (loop_end)
		19 => x"F0", -- WAIT
        others => x"00"
    );
end package body multiply_t;
