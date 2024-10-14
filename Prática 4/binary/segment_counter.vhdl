library ieee;
use ieee.std_logic_1164.all;

entity segment_counter is
    generic (
        length : integer := 4
    );
    port (
        input, clk, rst : in std_logic := '0';
        output : out std_logic
    );
end entity segment_counter;

architecture Behaviour of segment_counter is
    type state_t is (IDLE, ST0, ST1);
    signal count : integer range 0 to length := 0;
begin
    output <= '1' when count = length else '0';

    counter: process(clk, rst)
        variable state : state_t := IDLE;
    begin
        if rst = '1' then
            state := IDLE;
            count <= 0;
        elsif rising_edge(clk) then
            case state is
                when ST0 =>
                    if input = '1' then
                        count <= 1;
                        state := ST1;
                    elsif count < length then
                        count <= count + 1;
                    end if;
                when ST1 =>
                    if input = '0' then
                        count <= 1;
                        state := ST0;
                    elsif count < length then
                        count <= count + 1;
                    end if;
                when others =>
                    count <= 1;
                    state := ST0 when input = '0' else ST1;
            end case;
        end if;
    end process counter;
end architecture Behaviour;
