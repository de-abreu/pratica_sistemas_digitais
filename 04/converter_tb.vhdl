library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

-- Test bench for the morse code converter
architecture sim of testbench is
    -- Signal declarations
    signal index: std_logic_vector(2 downto 0);
    signal set, clk, rst : std_logic;
    signal led : std_logic;

    component converter is
    port (
        index : in std_logic_vector(2 downto 0);
        set, clk, rst : in  std_logic;
        led           : out std_logic
     );
    end component;

    -- Constants for the clock period
    constant clk_period : time := 20 ns;

begin

    -- Instantiate the converter entity
    uut: converter
        port map (
            index => index,
            set => set,
            clk => clk,
            rst => rst,
            led => led
        );

    -- Clock generation process
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process clk_process;

    -- Test process
    stimulus_process: process
        variable idx: integer := 0;
    begin
        -- Initialize signals
        set <= '0';
        rst <= '0';
        index <= "000";
        wait for 10 ns;

        -- Test all possible values of index
        for idx in 0 to 7 loop
            set <= '1';
            index <= std_logic_vector(to_unsigned(idx, 3));
            wait for 5 ns;
            set<= '0';
            wait for 200 ns;  -- Let the code run its course
            report "Testing index: " & integer'image(idx);
        end loop;

        -- Now, interrupt with reset during the normal flow
        set <= '1';
        index <= "001";  -- Pick any value (e.g., index = B)
        wait for 5 ns;
        set <= '0';
        wait for 60 ns;  -- Let the converter start the process
        rst <= '1';      -- Apply reset
        wait for 40 ns;  -- Short wait
        rst <= '0';      -- Release reset
        wait for 200 ns; -- Let the simulation continue

        -- End simulation
        report "Test completed." severity note;
        wait;
    end process stimulus_process;

end sim;
