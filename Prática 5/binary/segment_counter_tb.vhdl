library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture Behavioral of testbench is

    -- Component declaration for the segment_counter
    component segment_counter is
        generic (
            length : integer := 4
        );
        port (
            input, clk, rst : in std_logic := '0';
            output : out std_logic
        );
    end component;

    -- Signals for the testbench
    signal input  : std_logic := '0';
    signal clk    : std_logic := '0';
    signal rst    : std_logic := '0';
    signal output : std_logic;

    -- Clock period constant
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the segment_counter unit under test (UUT)
    uut : segment_counter
    generic map(
        length => 4
    )
    port map (
        input => input,
        clk => clk,
        rst => rst,
        output => output
    );

    -- Clock generation process
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- Test process to simulate different conditions
    test_process : process
    begin
        -- Initial reset
        rst <= '1';
        wait for clk_period * 2;
        rst <= '0';
        wait for clk_period * 2;

        -- Test 1: Segment shorter than 4 bits (3 bits of '0')
        input <= '0';
        wait for clk_period * 3;  -- 3 cycles of '0'
        input <= '1';  -- Change to break the segment
        assert output = '0' report "Failed: Output should be '0' for segment < 4 bits (0s)" severity error;
        wait for clk_period * 2;

        -- Test 2: Segment shorter than 4 bits (3 bits of '1')
        input <= '1';
        wait for clk_period * 3;  -- 3 cycles of '1'
        input <= '0';  -- Change to break the segment
        assert output = '0' report "Failed: Output should be '0' for segment < 4 bits (1s)" severity error;
        wait for clk_period * 2;

        -- Test 3: Segment exactly 4 bits (4 bits of '0')
        input <= '0';
        wait for clk_period * 4;  -- 4 cycles of '0'
        assert output = '1' report "Failed: Output should be '1' for segment = 4 bits (0s)" severity error;
        wait for clk_period * 2;

        -- Test 4: Segment exactly 4 bits (4 bits of '1')
        input <= '1';
        wait for clk_period * 4;  -- 4 cycles of '1'
        assert output = '1' report "Failed: Output should be '1' for segment = 4 bits (1s)" severity error;
        wait for clk_period * 2;

        -- Test 5: Reset test
        rst <= '1';
        wait for clk_period * 2;
        assert output = '0' report "Failed: Output should be '0' after reset" severity error;
        rst <= '0';
        wait for clk_period * 2;

        -- End of simulation
        report "All tests completed successfully" severity note;
        wait;
    end process;

end Behavioral;
