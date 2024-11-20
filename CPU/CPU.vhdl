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
    type state is (fetch, decode, execute, write_back);
    signal prev_state : state;
    signal pc : addressable_mem;
    signal opcode : func;
    signal rs : vector_array(0 to 1)(reg_r);
    signal ops : vector_array(0 to 1)(inst_r);
    signal rd : std_logic_vector(reg_r);
    signal alu_b, alu_out, address, ir, wdata : std_logic_vector(inst_r);
    signal mem_write, reg_write, alu_enable, output_enable, zero, signal_bit, overflow : std_logic;

    component Registers is
        port (
            rs        : in  vector_array(0 to 1)(reg_r);
            rd        : in  std_logic_vector(reg_r);
            wren      : in  std_logic;
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
            op_a, op_b                 : in  std_logic_vector(inst_r);
            operation                  : in  func;
            enable                     : in  std_logic;
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
            wren  => reg_write,
            wdata => wdata,
            ops   => ops
        );

    alu : ArithmeticLogicUnit
        port map (
            op_a      => ops(0),
            op_b      => alu_b,
            enable    => alu_enable,
            operation => opcode,
            result    => alu_out,
            zero      => zero,
            signal_bit => signal_bit,
            overflow  => overflow
        );

    ControlUnit: process(clk, rst)
    begin
        if rst = '1' then
            output <= (others => '0');
            prev_state <= write_back;
            pc <= 0;
        elsif rising_edge(clk) then
        address <= std_logic_vector(to_unsigned(pc, address'length));
            case prev_state is

                -- Reset control signals and fetch next instruction at the memory address pointed at by PC
                when write_back =>
                    alu_enable <= '0';
                    reg_write <= '0';
                    mem_write <= '0';
                    waiting <= '0';
                    opcode <= to_func(ir(func_r));
                    rs <= (ir(rs0_r), ir(rs1_r));
                    prev_state <= fetch;

                -- Decode function, and fetch an immediate value if needed;
                when fetch =>
                    with opcode select
                        rd <= rs(0) when LOAD | DIN | MOV,
                              "10" when others;
                    pc <= (pc + 1) mod (addressable_mem'high + 1) when rs(1) = imm else pc;
                    prev_state <= decode;

                -- Enable ALU and execute the instruction
                when decode =>
                    alu_enable <= '1';
                    alu_b <= ir when rs(1) = imm else ops(1);
                    if opcode = DIN then
                        waiting <= '1';
                    end if;
                    if not (opcode = HALT or (opcode = DIN and set = '0')) then
                        prev_state <= execute;
                    end if;
                when others =>
                    with opcode select
                        address <= alu_out when STORE | LOAD,
                                   address when others;
                    with opcode select
                        reg_write <= '1' when ADD | SUB | LAND | LOR | LNOT | MOV | LOAD | DIN,
                                     '0' when others;
                    mem_write <= '1' when opcode = STORE else '0';
                    with opcode select
                        wdata <= alu_out when ADD | SUB | LAND | LOR | LNOT | MOV,
                                 input when DIN,
                                 ir when LOAD,
                                 wdata when others;
                    if opcode = DOUT then
                        output <= alu_out;
                    end if;
                    case opcode is
                        when JMP =>
                            pc <= to_integer(unsigned(ir));
                        when JEQ =>
                            pc <= to_integer(unsigned(ir)) when zero = '1' else (pc + 2) mod (addressable_mem'high + 2);
                        when JGR =>
                            pc <= to_integer(unsigned(ir)) when signal_bit = '1' else (pc + 2) mod (addressable_mem'high + 2);
                        when others =>
                            pc <= (pc + 1) mod (addressable_mem'high + 1);
                    end case;
                    prev_state <= write_back;
            end case;
        end if;
    end process ControlUnit;
end architecture Structural;
