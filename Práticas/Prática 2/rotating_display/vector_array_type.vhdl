library ieee;
use ieee.std_logic_1164.all;

package vector_array_type is
    type vector_array is array (0 to 3) of STD_LOGIC_VECTOR(3 downto 0);
end package vector_array_type;
