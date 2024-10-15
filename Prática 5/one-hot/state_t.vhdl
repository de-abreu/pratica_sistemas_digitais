
package state_t is
    -- Enum type definition
    type state is (A, B, C, D, E, F, G, H, I);

    -- Enum type encoding
    attribute syn_encoding: string;
    attribute syn_encoding of state: type is "000000001 000000010 000000100 000010000 000100000 001000000 010000000 100000000";
end package state_t;
