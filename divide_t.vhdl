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

		0   => x"C0", -- in a
		1   => x"C4", -- in b
		2   => x"EB", -- mov r 0
		3   => x"00", -- 0
		4   => x"34", -- cmp b a (loop_start)
		5   => x"90", -- jgr loop_end
		6   => x"11", -- 17
		7   => x"BB", -- store r 255
		8   => x"FF", -- 255
		9   => x"21", -- sub a b
		10  => x"E2", -- mov a r
		11  => x"AB", -- load r 255
		12  => x"FF", -- 255
		13  => x"1B", -- add r 1
		14  => x"01", -- 1
		15  => x"70", -- jmp loop_start
		16  => x"04", -- 4
		17  => x"D8", -- out r (loop_end)
		18  => x"F0", -- wait
        others => x"00"
    );
end package body divide_t;
