library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
    port (
        d, clk: in std_logic;
        q, notQ : out std_logic
    );
end entity d_latch;

architecture Structural of d_latch is
    component sr_latch is
        port (
            set, rst, clk :  in STD_LOGIC;
            q, notQ       :  out STD_LOGIC
        );
    end component sr_latch;
begin
    latch : sr_latch
    port map (
        set => d,
        rst => not d,
        clk => clk,
        q => q,
        notQ => notQ
    );
end architecture Structural;
