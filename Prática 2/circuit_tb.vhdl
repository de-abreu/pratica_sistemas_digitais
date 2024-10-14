library ieee;
use ieee.std_logic_1164.all;

entity circuit_tb is
end entity circuit_tb;

architecture Behaviour of circuit_tb is
    signal clk : std_logic := '0';
    signal display : std_logic_vector(0 to 6);
    constant clk_period : time := 1 sec;
    component circuit is
        generic ( bound : natural range 0 to 15 );
        port (
            clk : in std_logic;
            display: out std_logic_vector(0 to 6)
        );
    end component circuit;
begin
    c : circuit
        generic map (bound => 9)
        port map (
            clk => clk,
            display => display
        );

    clk_proc: process
    begin
        wait for clk_period / 2;
        clk <= not clk;
    end process clk_proc;
end architecture Behaviour;
