library ieee;
use ieee.std_logic_1164.all;

package arrays_t is
    type vector_array is array (natural range <>) of STD_LOGIC_VECTOR;
    type bit_array is array (natural range <>) of STD_LOGIC;
end package arrays_t;
