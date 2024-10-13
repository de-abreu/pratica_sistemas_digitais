library ieee;
use ieee.std_logic_1164.all;

entity master_slave_dff is
    port (
        d, clk  : in std_logic;
        q, notQ : out std_logic
    );
end entity master_slave_dff;

architecture Structural of master_slave_dff is
    signal q_m : STD_LOGIC;
    component d_latch is
        port (
            d, clk: in std_logic;
            q, notQ : out std_logic
        );
    end component d_latch;
begin
    master : d_latch
        port map (
            d => d,
            clk => not clk,
            q => q_m
        );

    slave : d_latch
        port map (
            d => q_m,
            clk => clk,
            q => q,
            notQ => notQ
        );
end architecture Structural;
