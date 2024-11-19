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
    type state is (fetch, decode, execute);
    signal prev_state : state;
    signal pc : addressable_mem;
    signal opcode : func;
    signal rs : vector_array(0 to 1)(reg_r);
    signal ops : vector_array(0 to 1)(inst_r);
    signal rd : std_logic_vector(reg_r);
    signal alu_b, alu_out, address, ir, wdata : std_logic_vector(inst_r);
    signal mem_write, reg_write, output_enable, zero, signal_bit, overflow : std_logic;

    component Registers is
        port (
            rs    : in  vector_array(0 to 1)(reg_r);
            rd    : in  std_logic_vector(reg_r);
            wdata : in  std_logic_vector(inst_r);
            wren  : in  std_logic;
            ops   : out vector_array(0 to 1)(inst_r)
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
            op_a, op_b                 : in  std_logic_vector(inst_r);
            operation                  : in  func;
            clk                        : in  std_logic;
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
            data    => ops(1),
            q       => ir
        );

    regs : Registers
        port map (
            rs    => rs,
            rd    => rd,
            wdata => wdata,
            wren  => reg_write,
            ops   => ops
        );

    alu : ArithmeticLogicUnit
        port map (
            op_a      => ops(0),
            op_b      => alu_b,
            operation => opcode,
            clk       => clk,
            result    => alu_out
        );

    ControlUnit: process(clk, rst)
    begin
        if rst = '1' then
            output <= (others => '0');
            prev_state <= execute;
            pc <= 0;

        elsif rising_edge(clk) then
            address <= std_logic_vector(to_unsigned(pc, address'length));
            case prev_state is

                -- Reset control signals and fetch next instruction at the memory address pointed at by PC
                when execute =>
                    reg_write <= '0';
                    mem_write <= '0';
                    waiting <= '0';
                    opcode <= to_func(ir(func_r));
                    rs <= (ir(rs0_r), ir(rs1_r));
                    prev_state <= fetch;

                -- Identify function and fetch immediate values, if any;
                when fetch =>
                    with opcode select
                        rd <= rs(0) when LOAD | DIN | MOV,
                              "10" when others;
                    pc <= pc + 1 when rs(1) = imm else pc;
                    prev_state <= decode;

                -- Execute next instruction
                when others =>
                    alu_b <= ir when rs(1) = imm else ops(1);
                    case opcode is
                        when ADD | SUB | LAND | LOR | LNOT | MOV =>
                            reg_write <= '1';
                            wdata <= alu_out;
                        when JMP =>
                            pc <= to_integer(unsigned(ir));
                        when JEQ =>
                            pc <= to_integer(unsigned(ir)) when zero = '1' else pc;
                        when JGR =>
                            pc <= to_integer(unsigned(ir)) when signal_bit = '1' else pc;
                        when STORE =>
                            address <= alu_out;
                            mem_write <= '1';
                        when LOAD =>
                            address <= alu_out;
                            reg_write <= '1';
                            wdata <= ir;
                        when DIN =>
                            waiting <= '1';
                            if set = '1' then
                                reg_write <= '1';
                                wdata <= input;
                            end if;
                        when DOUT =>
                            output <= alu_out;
                        when others => --NOP or HALT
                    end case;
                    if not (opcode = HALT or (opcode = DIN and set = '0')) then
                        pc <= pc + 1;
                        prev_state <= execute;
                    end if;
            end case;
        end if;
    end process ControlUnit;
end architecture Structural;
