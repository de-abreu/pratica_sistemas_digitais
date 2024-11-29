library ieee;
use ieee.std_logic_1164.all;
use work.state_t.all;

entity segment_counter_one_hot is
    port (
        input, clk, rst : in  std_logic := '0';
        output          : out std_logic;
        s               : out state
     );
end entity segment_counter_one_hot;

architecture Behaviour of segment_counter_one_hot is
    signal tmp : state;
begin
    s <= tmp;
    counter: process(clk, rst)
    begin
        if rising_edge(clk) then
            if rst = '0' then
                tmp <= A;
                output <= '0';
            else
                case tmp is
                    when A =>
                        tmp <= B when input = '0' else F;
                    when B =>
                        tmp <= C when input = '0' else F;
                    when C =>
                        tmp <= D when input = '0' else F;
                    when D =>
                        if input = '0' then
                            tmp <= E;
                            output <= '1';
                        else
                            tmp <= F;
                        end if;
                    when E =>
                        if input = '1' then
                            tmp <= F;
                            output <= '0';
                        end if;
                    when F =>
                        tmp <= B when input = '0' else G;
                    when G =>
                        tmp <= B when input = '0' else H;
                    when H =>
                        if input = '0' then
                            tmp <= B;
                        else
                            tmp <= I;
                            output <= '1';
                        end if;
                    when others =>
                        if input = '0' then
                            tmp <= B;
                            output <= '0';
                        end if;
                end case;
            end if;
        end if;
    end process counter;
end architecture Behaviour;
