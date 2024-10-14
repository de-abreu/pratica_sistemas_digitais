library ieee;
use ieee.std_logic_1164.all;

entity counter is
    generic (bits : natural);
    port (
        enable, clk, clear : in std_logic;
        count : out std_logic_vector(bits - 1 downto 0)
    );
end entity counter;

architecture Structural of counter is
    signal t_in  : std_logic_vector(bits - 1 downto 0);
    signal t_out : std_logic_vector(bits - 1 downto 0);
    component tff is
        port (
            t, clk, rst : in std_logic;
            q, notQ     : out std_logic
        );
    end component tff;

begin
    t_in(0) <= enable;

    gen_t_in : for i in 1 to bits - 1 generate
        t_in(i) <= t_in(i - 1) and t_out(i - 1);
    end generate gen_t_in;

    gen_tff : for i in 0 to bits - 1 generate
        tff_inst : tff
            port map(
                t => t_in (i),
                clk => clk,
                rst => not clear,
                q => t_out(i)
            );
    end generate gen_tff;

    count <= t_out;
end architecture Structural;
