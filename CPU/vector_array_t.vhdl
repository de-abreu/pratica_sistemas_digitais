library ieee;
use ieee.std_logic_1164.all;

package vector_array_t is
    constant array_len : integer := 2;
    constant vector_len : integer := 8;
    type vector_array is array (0 to array_len - 1) of
        STD_LOGIC_VECTOR(vector_len - 1 downto 0);
end package vector_array_t;
