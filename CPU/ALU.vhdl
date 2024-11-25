library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.array_t.all;
use work.instructions_t.all;

entity ArithmeticLogicUnit is
    port (
        ops                             : in  vector_array(0 to 1)(inst_r);
        operation                       : in  func;
        result                          : out std_logic_vector(inst_r);
        zero, signal_bit, overflow      : out std_logic
    );
end entity ArithmeticLogicUnit;

architecture Behaviour of ArithmeticLogicUnit is
begin
    calculate : process (ops, operation)
        variable int_a, int_b, int_r : integer;
    begin
        case operation is
            when ADD | SUB | CMP => -- Arithmetic operation
                int_a := to_integer(signed(ops(0)));
                int_b := to_integer(signed(ops(1)));
                int_r := int_a + int_b when operation = ADD else int_a - int_b;

                -- Assign flags
                overflow <= '1' when int_r > 2 ** (inst_l - 1) - 1 else '0';
                zero <= '1' when int_r = 0 else '0';
                signal_bit <= '1' when int_r < 0 else '0';
                result <= std_logic_vector(to_signed(int_r, result'length));
            when LAND =>
                result <= ops(0) and ops(1);
            when LOR =>
                result <= ops(0) or ops(1);
            when LNOT =>
                result <= not ops(0);
            when others => -- MOV, STORE, LOAD
                result <= ops(1);
        end case;
    end process calculate;
end architecture Behaviour;
