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
    signal opcode_db : func;
    signal next_state_db : state;
    signal pc_db : addressable_mem;


    signal alu_op : func;
    signal rs : vector_array(0 to 1)(reg_r);
    signal ops, alu_in : vector_array(0 to 1)(inst_r);
    signal rd : std_logic_vector(reg_r);
    signal alu_out, ir, address, wdata : std_logic_vector(inst_r);
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
        variable opcode : func;
        variable next_state : state;
        variable pc : addressable_mem;
    begin
        if rst = '1' then
            output <= (others => '0');
            next_state := fetch;
            next_state_db <= next_state;
            pc := 0;
            pc_db <= pc;
            address <= (others => '0');
        elsif rising_edge(clk) then
            case next_state is

                -- Fetch next instruction at the memory address pointed at by PC
                when fetch =>
                    next_state := decode;
                    opcode := to_func(ir(func_r));
                    opcode_db<= opcode;
                    rs <= (ir(rs0_r), ir(rs1_r));
                    pc := (pc + 1) mod (addressable_mem'high + 1);
                    pc_db <= pc;
                    next_state_db <= next_state;

                -- Fetch values at the registers pointed at by rs
                when decode =>
                    next_state := execute;
                    address <= std_logic_vector(to_unsigned(pc, address'length));
                    next_state_db <= next_state;

                -- Execute instruction
                when execute =>
                    with opcode select
                        next_state := execute when HALT,
                                      fetch when NOP | CMP | JMP | JEQ | JGR | DOUT,
                                      memory_access when LOAD | STORE,
                                      write_back when others;
                    case opcode is
                        when NOP | HALT =>
                        when JMP =>
                            pc := to_integer(unsigned(ir));
                        when JEQ =>
                            pc := to_integer(unsigned(ir)) when zero = '1' else (pc + 1) mod (addressable_mem'high + 1);
                        when JGR =>
                            pc := to_integer(unsigned(ir)) when signal_bit = '1' else (pc + 1) mod (addressable_mem'high + 1);
                        when DIN =>
                            waiting <= '1';
                            next_state := write_back when set = '1' else execute;
                        when DOUT =>
                            output <= ops(0);
                        when others =>
                            alu_op <= opcode;
                            alu_in(0) <= ops(0);
                            if rs(1) = imm then
                                alu_in(1) <= ir;
                                pc := (pc + 1) mod (addressable_mem'high + 1);
                            else
                                alu_in(1) <= ops(1);
                            end if;
                    end case;
                    address <= std_logic_vector(to_unsigned(pc, address'length));
                    pc_db <= pc;
                    next_state_db <= next_state;

                -- Access memory to save or retrieve data
                when memory_access =>
                    next_state := write_back;
                    mem_write <= '1' when opcode = STORE else '0';
                    address <= alu_out;
                    next_state_db <= next_state;

                -- Reset control signals and write back result to a given register
                when others =>
                    next_state := fetch;
                    mem_write <= '0';
                    waiting <= '0';
                    with opcode select
                        rd <= rs(0) when LOAD | DIN | MOV,
                              rd when STORE,
                              "10" when others;
                    with opcode select
                        wdata <= ir when LOAD,
                                 input when DIN,
                                 wdata when STORE,
                                 alu_out when others;
                    address <= std_logic_vector(to_unsigned(pc, address'length));
                    next_state_db <= next_state;
            end case;
        end if;
    end process ControlUnit;
end architecture Structural;
