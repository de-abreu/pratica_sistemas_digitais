library ieee;
use ieee.std_logic_1164.all;

entity FPGA_testbench is
    port (
        index         : in  std_logic_vector(2 downto 0);
        set, clk, rst : in  std_logic;
        led           : out std_logic
         );
end entity FPGA_testbench;

architecture Structural of FPGA_testbench is
    component clock_delayer is
        generic (count: natural);
        port (
            clk, rst : in std_logic;
            sclk     : out std_logic
        );
    end component clock_delayer;

    component converter is
        port (
            index         : in  std_logic_vector(2 downto 0);
            set, clk, rst : in  std_logic;
            led           : out std_logic
        );
    end component converter;

    signal sclk : std_logic;
begin
    d : clock_delayer
        generic map (count => 5000000)
        port map (
            clk => clk,
            rst => '0',
            sclk => sclk
        );

    c : converter
    port map (
        index => index,
        rst => rst,
        set => set,
        clk => sclk,
        led => led
        );
end architecture Structural ;
