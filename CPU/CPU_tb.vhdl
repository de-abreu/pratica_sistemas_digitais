library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.arrays_t.all;
use work.instructions_t.all;

entity cpu_tb is
end entity cpu_tb;

architecture Behaviour of cpu_tb is
    -- Signals for connecting to the CPU
    signal input, output  : std_logic_vector(inst_r);
    signal clk, set, rst  : std_logic := '0';
    signal waiting        : std_logic;
    constant period       : time := 10 ns;

    -- CPU component declaration
    component CentralProcessingUnit
        port (
            input         : in std_logic_vector(inst_r);
            clk, set, rst : in std_logic;
            output        : out std_logic_vector(inst_r);
            waiting       : out std_logic
        );
    end component CentralProcessingUnit;
begin

    -- Instantiate Unit Under Test
    uut : CentralProcessingUnit
        port map (
            input => input,
            output => output,
            clk => clk,
            set => set,
            rst => rst,
            waiting => waiting
        );

    clk_process : process
    begin
        wait for period / 2;
        clk <= not clk;
    end process clk_process;

    stimulation: process
    begin

        -- Reset the CPU
        rst <= '1';
        wait for period;
        rst <= '0';

        -- Send input
        input <= x"05";
        set <= '1';
        wait for 3 * period;
        set <= '0';
        wait for period;
        input <= x"07";
        set <= '1';
        wait for 3 * period;
        set <= '0';

        -- Wait for the CPU to finish executing
        wait for 100 * period;

        -- Check if output is correct
        assert (output /= x"23") report "Multiplication failed: expected 35, got "
        &integer'image(to_integer(unsigned(output))) severity error;

        -- End simulation
        wait;
    end process stimulation;
end architecture Behaviour;
