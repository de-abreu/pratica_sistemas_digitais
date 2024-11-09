library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.instructions_t.all;

entity ArithmeticLogicUnit is
    port (
        op_a, op_b                      : in  std_logic_vector(inst_r);
        operation                       : in  func;
        result                          : out std_logic_vector(inst_r);
        clk, zero, signal_bit, overflow : out std_logic
    );
end entity ArithmeticLogicUnit;

architecture Behaviour of ArithmeticLogicUnit is
begin
    calculate : process(clk)
        variable int_a, int_b, int_r : integer;
    begin
        case operation is
            when ADD | SUB | CMP => -- Arithmetic operation
                int_a := to_integer(signed(op_a));
                int_b := to_integer(signed(op_b));
                int_r := int_a + int_b when operation = ADD else int_a - int_b;

                -- Assign flags
                overflow <= '1' when int_r > 2 ** (inst_l - 1) - 1 else '0';
                zero <= '1' when int_r = 0 else '0';
                signal_bit <= '1' when int_r < 0 else '0';
                result <= std_logic_vector(to_signed(int_r, result'length));
            when LAND =>
                result <= op_a and op_b;
            when LOR =>
                result <= op_a or op_b;
            when LNOT =>
                result <= not op_a;
            when others =>
                result <= op_a;
        end case;
    end process calculate;
end architecture Behaviour;
