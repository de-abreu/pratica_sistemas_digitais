library ieee;
use ieee.std_logic_1164.all;
use work.vector_array_type.all;

entity rotating_display is
    port(
        clk, rst : in  STD_LOGIC := '0';
        D        : out vector_array
    );
end entity rotating_display;

architecture Behaviour of rotating_display is
begin
    logic: process(clk, rst)
        constant assigned_values: vector_array := (
            "0000",
            "0001",
            "1111",
            "1110"
        );
        variable counter : INTEGER range 0 to 3 := 0;
    begin
        if rst = '1' then
            counter := 0;
        elsif rising_edge(clk) then
            for i in D'range loop
                D(i) <= assigned_values((counter + i) rem 4);
            end loop;
            counter := (counter + 1) rem 4;
        end if;
    end process logic;
end architecture Behaviour;
