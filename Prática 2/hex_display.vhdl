library ieee;
use ieee.std_logic_1164.all;

entity hex_display is
    port (
        input       : in  std_logic_vector(3 downto 0);
        hex_mapping : out std_logic_vector(0 to 6)
     );
end entity hex_display;

architecture data_flow of hex_display is
begin
    with input select
        hex_mapping <= "0000001" when "0000", -- 0
                       "1001111" when "0001", -- 1
                       "0010010" when "0010", -- 2
                       "0000110" when "0011", -- 3
                       "1001100" when "0100", -- 4
                       "0100100" when "0101", -- 5
                       "0100000" when "0110", -- 6
                       "0001111" when "0111", -- 7
                       "0000000" when "1000", -- 8
                       "0000100" when "1001", -- 9
                       "0001000" when "1010", -- 10 (A)
                       "1100000" when "1011", -- 11 (B)
                       "0110001" when "1100", -- 12 (C)
                       "1000010" when "1101", -- 13 (D)
                       "0110000" when "1110", -- 14 (E)
                       "0111000" when others; -- 15 (F)
end data_flow;
