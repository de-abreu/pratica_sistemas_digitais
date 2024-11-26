library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.instructions_t.all;

entity ArithmeticLogicUnit is
    port (
        ops                             : in  word_array(0 to 1);
        operation                       : in  func;
        result                          : out std_logic_vector(inst_r);
        zero, signal_bit, overflow      : out std_logic
    );
end entity ArithmeticLogicUnit;

architecture Behaviour of ArithmeticLogicUnit is
begin
    calculate : process (ops, operation)
        variable int_a, int_b, int_r : integer;
        variable logic_r : std_logic_vector(inst_r);
    begin
        case operation is
            when ADD | SUB | CMP => -- Arithmetic operation
                int_a := to_integer(signed(ops(0)));
                int_b := to_integer(signed(ops(1)));
                if operation = ADD then
                    int_r := int_a + int_b;
                else
                    int_r := int_a - int_b;
                end if;

                -- Assign flags
                if int_r > 2 ** (inst_l - 1) - 1 then
                    overflow <= '1';
                else
                    overflow <= '0';
                end if;

                if int_r = 0 then
                    zero <= '1';
                else
                    zero <= '0';
                end if;

                if int_r < 0 then
                    signal_bit <= '1';
                else
                    signal_bit <= '0';
                end if;
                result <= std_logic_vector(to_signed(int_r, result'length));
            when LAND | LOR | LNOT =>
                case operation is
                    when LAND =>
                        logic_r := ops(0) and ops(1);
                    when LOR =>
                        logic_r := ops(0) or ops(1);
                    when others =>
                        logic_r := not ops(0);
                end case;
                zero <= '1' when logic_r = (logic_r'range => '0') else '0';
                result <= logic_r;
            when others => -- MOV, STORE, LOAD
                result <= ops(1);
        end case;
    end process calculate;
end architecture Behaviour;
