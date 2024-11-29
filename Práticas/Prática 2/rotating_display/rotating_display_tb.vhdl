library ieee;
use ieee.std_logic_1164.all;
use work.vector_array_type.all;


entity rotating_display_tb is
end entity rotating_display_tb;

architecture Behaviour of rotating_display_tb is

    -- Component declaration for the UUT
    component rotating_display
        port (
            clk, rst : in  std_logic;
            D        : out vector_array
        );
    end component;

    -- Signals to connect to the UUT
    signal clk   : std_logic := '0';
    signal rst   : std_logic := '0';
    signal D     : vector_array;

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: rotating_display
        port map (
            clk => clk,
            rst => rst,
            D => D
        );

    -- Clock process definitions
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset the design
        rst <= '1';
        wait for 20 ns;
        rst <= '0';

        -- Observe the outputs for several clock cycles
        wait for 100 ns;

        -- End simulation
        wait;
    end process;

end architecture Behaviour;
