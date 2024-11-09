library ieee;
use ieee.std_logic_1164.all;

entity Memory is
    generic (height, width : integer);
    port (
        enable, read, write, clk : in std_logic;
        address  : in  std_logic_vector(width - 1 downto 0);
        data_in  : in  std_logic_vector(width - 1 downto 0);
        data_out : out std_logic_vector(width - 1 downto 0)
         );
end entity Memory;

architecture Behaviour of Memory is
    type vector_array is array (0 to height - 1) of std_logic_vector(width - 1 downto 0);
    variable mem : vector_array;

    begin
        access_memory: process(clk)
            variable index : integer;
        begin
            if rising_edge(clk) and enable then
                index := to
                if write = '1' then

            end if;
        end process access_memory;

end entity Memory;
