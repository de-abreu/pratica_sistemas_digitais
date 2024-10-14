library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circuit is
    generic ( bound : natural range 0 to 15 );
    port (
        clk : in std_logic;
        display: out std_logic_vector(0 to 6)
    );
end entity circuit;

architecture Structural of circuit is
    signal count : std_logic_vector(3 downto 0) := (others => '0');
    signal clear : std_logic := '1';
    component counter is
        generic (bits : natural);
        port (
            enable, clk, clear : in std_logic;
            count : out std_logic_vector(bits - 1 downto 0)
        );
    end component counter;

    component hex_display is
        port (
            input       : in  std_logic_vector(3 downto 0);
            hex_mapping : out std_logic_vector(0 to 6)
         );
    end component hex_display;
begin
    c : counter
        generic map (bits => 4)
        port map (
            clk => clk,
            enable => '1',
            clear => not clear,
            count => count
        );
    d : hex_display
        port map (
            input => count,
            hex_mapping => display
        );

    reset_count: process(clk)
    begin
        if rising_edge(clk) and to_integer(unsigned(count)) = bound then
            clear <= '1';
        elsif clear = '1' then
            clear <= '0';
        end if;
    end process reset_count;
end architecture Structural;
