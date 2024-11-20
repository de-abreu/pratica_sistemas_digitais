library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;
use work.arrays_t.all;
use work.instructions_t.all;

entity CentralProcessingUnit is
    port (
        input         : in  std_logic_vector(inst_r);
        clk, set, rst : in  std_logic;
        output        : out std_logic_vector(inst_r);
        waiting       : out std_logic
    );
end entity CentralProcessingUnit;

architecture Structural of CentralProcessingUnit is
    type state is (fetch, decode, execute, memory_access, write_back);
    signal opcode : func;
    signal next_state : state;
    signal pc : addressable_mem;

    signal alu_op : func;
    signal rs : vector_array(0 to 1)(reg_r);
    signal ops, alu_in : vector_array(0 to 1)(inst_r);
    signal rd : std_logic_vector(reg_r);
    signal alu_out, address, ir, wdata : std_logic_vector(inst_r);
    signal mem_write, zero, signal_bit, overflow : std_logic;

    component Registers is
        port (
            rs        : in  vector_array(0 to 1)(reg_r);
            rd        : in  std_logic_vector(reg_r);
            wdata     : in  std_logic_vector(inst_r);
            ops       : out vector_array(0 to 1)(inst_r)
        );
    end component Registers;

    component Memory is
        port (
            address, data : in  std_logic_vector(inst_r);
            clock, wren   : in  std_logic;
            q             : out std_logic_vector(inst_r)
        );
    end component Memory;

    component ArithmeticLogicUnit is
        port (
            ops                        : in  vector_array(0 to 1)(inst_r);
            operation                  : in  func;
            result                     : out std_logic_vector(inst_r);
            zero, signal_bit, overflow : out std_logic
        );
    end component ArithmeticLogicUnit;

begin
    mem : Memory
        port map (
            address => address,
            clock   => clk,
            wren    => mem_write,
            data    => ops(0),
            q       => ir
        );

    regs : Registers
        port map (
            rs    => rs,
            rd    => rd,
            wdata => wdata,
            ops   => ops
        );

    alu : ArithmeticLogicUnit
        port map (
            ops        => alu_in,
            operation  => alu_op,
            result     => alu_out,
            zero       => zero,
            signal_bit => signal_bit,
            overflow   => overflow
        );

    ControlUnit: process(clk, rst)
        variable tmp : func;
    begin
        if rst = '1' then
            output <= (others => '0');
            next_state <= fetch;
            pc <= 0;
        elsif rising_edge(clk) then
            case next_state is

                -- Reset control signals and fetch next instruction at the memory address pointed at by PC
                when fetch =>
                    address <= std_logic_vector(to_unsigned(pc, address'length));
                    mem_write <= '0';
                    waiting <= '0';
                    next_state <= decode;

                -- Set target registers and offset program counter to fetch an immediate value if needed;
                when decode =>
                    tmp := to_func(ir(func_r));
                    address <= std_logic_vector(to_unsigned(pc, address'length));
                    opcode <= tmp;
                    rs <= (ir(rs0_r), ir(rs1_r));
                    pc <= (pc + 1) mod (addressable_mem'high + 1) when rs(1) = imm else pc;
                    with tmp select
                        next_state <= memory_access when LOAD | STORE,
                                      execute when others;

                -- Enable ALU and execute the instruction
                when execute =>
                    with opcode select
                        next_state <= execute when HALT,
                                      fetch when NOP | CMP | JMP | JEQ | JGR | DOUT,
                                      write_back when others;
                    case opcode is
                        when ADD | SUB | CMP | LAND | LOR | LNOT =>
                            alu_op <= opcode;
                            alu_in(0) <= ops(0);
                            alu_in(1) <= ir when rs(1) = imm else ops(1);
                        when JMP =>
                            pc <= to_integer(unsigned(ir));
                        when JEQ =>
                            pc <= to_integer(unsigned(ir)) when zero = '1' else (pc + 2) mod (addressable_mem'high + 2);
                        when JGR =>
                            pc <= to_integer(unsigned(ir)) when signal_bit = '1' else (pc + 2) mod (addressable_mem'high + 2);
                        when DIN =>
                            waiting <= '1';
                            next_state <= write_back when set = '1' else execute;
                        when DOUT =>
                            output <= ops(0);
                        when others =>
                    end case;
                when memory_access =>
                    address <= ir;
                    if opcode = STORE then
                        mem_write <= '1';
                        next_state <= fetch;
                    else -- LOAD
                        mem_write <= '0';
                        next_state <= write_back;
                    end if;
                when others => -- write_back
                    with opcode select
                        rd <= rs(0) when LOAD | DIN | MOV,
                              "10" when others;
                    with opcode select
                        wdata <= ir when LOAD,
                                 input when DIN,
                                 ops(1) when MOV,
                                 alu_out when others;
                    next_state <= fetch;
            end case;
        end if;
    end process ControlUnit;
end architecture Structural;
