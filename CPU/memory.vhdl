library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.arrays_t.all;

entity Memory is
    port (
        address, data : in std_logic_vector(7 downto 0);
        clock, wren : in std_logic;
        q : out std_logic_vector(7 downto 0)
         );
end entity Memory;

architecture Behaviour of Memory is
    signal mem : vector_array(0 to 2**8 - 1)(7 downto 0);
    begin
        memory_access: process(clock)
            variable index : integer;
        begin
            if rising_edge(clock) then
                index := to_integer(unsigned(address));
                if wren = '1' then
                    mem(index) <= data;
                end if;
                q <= mem(index);
            end if;
        end process memory_access;
end architecture Behaviour;
