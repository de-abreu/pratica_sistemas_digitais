library ieee;
use ieee.std_logic_1164.all;

entity segment_counter_one_hot is
    port (
        input, clk, rst : in  std_logic := '0';
        output          : out std_logic
     );
end entity segment_counter_one_hot;

architecture Behaviour of segment_counter_one_hot is
    type state_t is (A, B, C, D, E, F, G, H, I);
    attribute enum_encoding: string;
    attribute enum_encoding of state_t: type is "000000001 000000010 000000100 000010000 000100000 001000000 010000000 100000000";
begin
    counter: process(clk, rst)
        variable state : state_t := A;
    begin
        if rst = '1' then
            state := A;
            output <= '0';
        elsif rising_edge(clk) then
            case state is
                when A =>
                    state := B when input = '0' else F;
                when B =>
                    state := C when input = '0' else F;
                when C =>
                    state := D when input = '0' else F;
                when D =>
                    if input = '0' then
                        state := E;
                        output <= '1';
                    else
                        state := F;
                    end if;
                when E =>
                    if input = '1' then
                        state := F;
                        output <= '0';
                    end if;
                when F =>
                    state := B when input = '0' else G;
                when G =>
                    state := B when input = '0' else H;
                when H =>
                    if input = '0' then
                        state := B;
                    else
                        state := I;
                        output <= '1';
                    end if;
                when others =>
                    if input = '0' then
                        state := B;
                        output <= '0';
                    end if;
            end case;
        end if;
    end process counter;
end architecture Behaviour;
