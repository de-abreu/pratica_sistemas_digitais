library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

entity converter is
    port (
        index         : in  std_logic_vector(2 downto 0);
        set, clk, rst : in  std_logic;
        led           : out std_logic
        );
end converter;

architecture Behaviour of converter is
    signal delay : integer range 0 to 4 := 0;

begin
    led <='0' when delay = 0 else '1';

    -- Logic to print morse (set the delay in which the light is on)
    print_morse: process(clk, rst, set)
        type vector_array is array (0 to 7) of STD_LOGIC_VECTOR(0 to 3);
        constant morse_table: vector_array := (
            "0100", -- A
            "1000", -- B
            "1010", -- C
            "1000", -- D
            "0000", -- E
            "0010", -- F
            "1100", -- G
            "0000"  -- H
        );

        type integer_array is array (0 to 7) of integer range 1 to 4;
        constant length: integer_array := (
            2, -- A
            4, -- B
            4, -- C
            3, -- D
            1, -- E
            4, -- F
            3, -- G
            4  -- H
        );
        constant IDLE : integer := 8;

        -- Variable used to store the current state of the machine. Values 0 though 7 implies printing a corresponding character, value 8 corresponds to the IDLE state.
        variable state : integer range 0 to 8 := 8;
        variable i : integer range 0 to 4 := 0;
    begin
        -- Asynchronous processes --
        -- Reset (to idle state)
        if rst = '1' then
            state := IDLE;
            delay <= 0;
        -- Set (transition to a given printing state)
        elsif rising_edge(set) then
            state := to_integer(unsigned(index));
            i := 0;
            delay <= 0;

        -- Synchronous processes : triggered whenever clk changes value
        elsif rising_edge(clk) and state /= IDLE then
            -- Check if there is a delay in place.
            if delay > 0 then
                delay <= delay - 1;
            -- Check if there are any characters left to print
            elsif i = length(state) then
                state := IDLE;
            -- Set the delay accordingly
            else
                delay <= 1 when morse_table(state)(i) = '0' else 3;
                i := i + 1;
            end if;
        end if;
    end process print_morse;
end Behaviour;
