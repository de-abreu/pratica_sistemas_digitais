library ieee;
use ieee.std_logic_1164.all;

entity counter_4bit_tb is
end entity counter_4bit_tb;

architecture Behaviour of counter_4bit_tb is
    constant clk_period : time := 10 ns;
    constant bits : natural := 4;
    signal enable, clk, clear : std_logic := '0';
    signal count : std_logic_vector(bits - 1 downto 0);

    component counter is
        generic (bits : natural);
        port (
            enable, clk, clear : in std_logic;
            count : out std_logic_vector(bits - 1 downto 0)
        );
    end component counter;
begin
    c : counter
        generic map (bits => bits)
        port map (
            enable => enable,
            clk => clk,
            clear => clear,
            count => count
     );

    clk_proc: process
    begin
        wait for clk_period / 2;
        clk <= not clk;
    end process clk_proc;

    test_proc : process
    begin
        wait for clk_period * 2;
        clear <= '1';
        enable <= '1';
        wait for clk_period * 20;
        enable <= '0';
        wait for clk_period * 2;
        clear <= '0';
        wait;
    end process test_proc;
end architecture Behaviour;
