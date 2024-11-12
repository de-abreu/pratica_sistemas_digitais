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
    signal mem : vector_array(0 to 2**8 - 1)(7 downto 0) :=
    -- Sum test
    -- (
    --     0 => x"C0",
    --     1 => x"C4",
    --     2 => x"11",
    --     3 => x"D8",
    --     4 => x"F0",
    --     others => x"00"
    -- );
    -- Multiplication test
    (
        0  => x"E3",
        1  => x"05",
        2  => x"E7",
        3  => x"07",
        4  => x"EB",
        5  => x"00",
        6  => x"37",
        7  => x"00",
        8  => x"80",
        9  => x"10",
        10 => x"18",
        11 => x"AB",
        12 => x"FF",
        13 => x"27",
        14 => x"01",
        15 => x"E6",
        16 => x"73",
        17 => x"00",
        18 => x"D8",
        19 => x"F0",
        others => x"00"
    );
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
