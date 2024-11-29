library ieee;
use ieee.std_logic_1164.all;

entity clock_delayer is
    generic (count: natural);
    port (
        clk, rst : in std_logic;
        sclk     : out std_logic
    );
end entity clock_delayer;

architecture Behaviour of clock_delayer is
begin
    delay: process(clk, rst)
        variable tmp : std_logic;
        variable i: integer := count;
    begin
        if rst = '1' then
            i := count;
            tmp := '0';
        elsif rising_edge(clk) then
            if count = 0 then
                tmp := not tmp;
                i := count;
            else
                i := i - 1;
            end if;
        end if;
        sclk <= tmp;
    end process delay;



end architecture Behaviour;
