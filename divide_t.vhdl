library ieee;
use ieee.std_logic_1164.all;
use work.array_t.all;
use work.instructions_t.all;

package divide_t is
    subtype program is vector_array(addressable_mem)(inst_r);
    constant divide : program;
end package divide_t;

package body divide_t is
    constant divide : program :=
    (

		0   => x"C0", -- IN A
		1   => x"C4", -- IN B
		2   => x"EB", -- MOV R 0
		3   => x"00", -- 0
		4   => x"BB", -- STORE R 255
		5   => x"FF", -- 255
		6   => x"E8", -- MOV R A (LOOP_START)
		7   => x"29", -- SUB R B
		8   => x"E2", -- MOV A R
		9   => x"AB", -- LOAD R 255
		10  => x"FF", -- 255
		11  => x"1B", -- ADD R 1
		12  => x"01", -- 1
		13  => x"BB", -- STORE R 255
		14  => x"FF", -- 255
		15  => x"E8", -- MOV R A
		16  => x"39", -- CMP R B
		17  => x"90", -- JGR LOOP_START
		18  => x"06", -- 6
		19  => x"AB", -- LOAD R 255
		20  => x"FF", -- 255
		21  => x"D8", -- OUT R
		22  => x"F0", -- WAIT
        others => x"00"
    );
end package body divide_t;
