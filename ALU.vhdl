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
        variable logic_r : std_logic_vector(inst_r);
    begin
        case operation is
            when ADD | SUB | CMP => -- Arithmetic operation
                int_a := to_integer(unsigned(ops(0)));
                int_b := to_integer(unsigned(ops(1)));
                int_r := int_a + int_b when operation = ADD else int_a - int_b;

                -- Assign flags
                overflow <= '1' when int_r > addressable_mem'high else '0';
                zero <= '1' when int_r = 0 else '0';
                if int_r > 0 then
                    signal_bit <= '0';
                else
                    int_r := int_r + addressable_mem'high + 1;
                    signal_bit <= '1';
                end if;
                result <= std_logic_vector(to_unsigned(int_r, result'length));
            when LAND | LOR | LNOT =>
                with operation select
                    logic_r := ops(0) and ops(1) when LAND,
                               ops(0) or ops(1) when LOR,
                               not ops(0) when others;
                zero <= '1' when logic_r = (logic_r'range => '0') else '0';
                result <= logic_r;
            when others => -- MOV, STORE, LOAD
                result <= ops(1);
        end case;
    end process calculate;
end architecture Behaviour;
