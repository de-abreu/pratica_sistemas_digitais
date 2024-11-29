library ieee;
use ieee.std_logic_1164.all;

entity tff is
    port (
        t, clk, rst : in  std_logic;
        q, notQ     : out std_logic
    );
end entity tff;

architecture Behaviour of tff is
    signal memory : std_logic;
begin
    toggle: process(clk, rst)
    begin
        if rst = '1' then
            memory <= '0';
        elsif rising_edge(clk) and t = '1' then
            memory <= not memory;
        end if;
    end process toggle;
    q <= memory;
    notQ <= not memory;
end architecture Behaviour;
