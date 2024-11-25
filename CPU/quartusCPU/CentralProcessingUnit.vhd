library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;
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
    type state is (fetch, execute, memory_access, write_back);

    -- Signals to interconnect components
    signal alu_op : func;
    signal rs : reg_array(0 to 1);
    signal ops, alu_in : word_array(0 to 1);
    signal rd : std_logic_vector(reg_r);
    signal alu_out, ir, address, wb : std_logic_vector(inst_r);
    signal mem_write, zero, signal_bit, overflow : std_logic;

    -- Component declarations
    component Registers is
        port (
            rs        : in  reg_array(0 to 1);
            rd        : in  std_logic_vector(reg_r);
            wdata     : in  std_logic_vector(inst_r);
            ops       : out word_array(0 to 1)
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
            ops                        : in  word_array(0 to 1);
            operation                  : in  func;
            result                     : out std_logic_vector(inst_r);
            zero, signal_bit, overflow : out std_logic
        );
    end component ArithmeticLogicUnit;

begin

    -- Component instantiating
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
            wdata => wb,
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
        variable opcode : func;
        variable next_state : state;
        variable pc : addressable_mem;
    begin
        if rst = '1' then
            output <= (others => '0');
            next_state := fetch;
            pc := 0;
            address <= std_logic_vector(to_unsigned(pc, address'length));
        elsif rising_edge(clk) then
            case next_state is

                -- Fetch next instruction at the memory address pointed at by PC
                when fetch =>
                    next_state := execute;
                    opcode := to_func(ir(func_r));
                    rs <= (ir(rs0_r), ir(rs1_r));
                    pc := incr(pc);
                    address <= std_logic_vector(to_unsigned(pc, address'length));

                -- Execute instruction
                when execute =>
                    case opcode is
                        when HALT | DIN =>
                            next_state := execute;
                        when NOP | CMP | JMP | JEQ | JGR | DOUT =>
                            next_state := fetch;
                        when LOAD | STORE =>
                            next_state := memory_access;
                        when others =>
                            next_state := write_back;
                    end case;
                    case opcode is
                        when NOP | HALT =>
                        when JMP =>
                            pc := to_integer(unsigned(ir));
                        when JEQ =>
                            if zero = '1' then
                                pc := to_integer(unsigned(ir));
                            else
                                pc := incr(pc);
                            end if;
                        when JGR =>
                            if signal_bit = '1' then
                                pc := to_integer(unsigned(ir));
                            else
                                pc := incr(pc);
                            end if;
                        when DIN =>
                            waiting <= '1';
                            if set = '1' then
                                next_state := write_back;
                            end if;
                        when DOUT =>
                            output <= ops(0);
                        when others =>
                            alu_op <= opcode;
                            alu_in(0) <= ops(0);
                            if rs(1) = imm then
                                alu_in(1) <= ir;
                                pc := incr(pc);
                            else
                                alu_in(1) <= ops(1);
                            end if;
                    end case;
                    address <= std_logic_vector(to_unsigned(pc, address'length));

                -- Access memory to save or retrieve data
                when memory_access =>
                    next_state := write_back;
                        if opcode = STORE then
                            mem_write <= '1';
                        else
                            mem_write <= '0';
                        end if;
                    address <= alu_out;

                -- Reset control signals and write back result to a given register, if any
                when others =>
                    next_state := fetch;
                    mem_write <= '0';
                    waiting <= '0';
                    case opcode is
                        when STORE =>
                        when LOAD =>
                            rd <= rs(0);
                            wb <= ir;
                        when DIN =>
                            rd <= rs(0);
                            wb <= input;
                        when MOV =>
                            rd <= rs(0);
                            wb <= alu_out;
                        when others =>
                            rd <= "10";
                            wb <= alu_out;
                    end case;
                    address <= std_logic_vector(to_unsigned(pc, address'length));
            end case;
        end if;
    end process ControlUnit;
end architecture Structural;
