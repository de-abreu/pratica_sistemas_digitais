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
    signal next_state : state;
    signal pc : addressable_mem;
    signal ir : func;
    signal ops : vector_array(0 to 1)(inst_r);
    signal rs : vector_array(0 to 1)(reg_r);
    signal rd : std_logic_vector(reg_r);
    signal alu_b, alu_out, address, data_out, wdata : std_logic_vector(inst_r);
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
    regs : Registers
        port map (
            rs    => (data_out(rs0_r), data_out(rs1_r)),
            rd    => rd,
            wdata => wdata,
            wren  => reg_write,
            ops   => ops
        );

    mem : Memory
        port map (
            address => address,
            clock   => clk,
            wren    => mem_write,
            data    => ops(1),
            q       => data_out
        );

    alu : ArithmeticLogicUnit
        port map (
            op_a      => ops(0),
            op_b      => alu_b,
            operation => ir,
            clk       => clk,
            result    => alu_out
        );

    ControlUnit: process(clk, rst)
        variable pc_bin : std_logic_vector(inst_r);
    begin
        pc_bin := std_logic_vector(to_unsigned(pc, address'length));
        if rst = '1' then
            output <= (others => '0');
            next_state <= fetch;
            pc <= 0;

        elsif rising_edge(clk) then
            case next_state is
                -- Reset control signals and fetch next instruction at the memory address pointed at by PC
                when fetch =>
                    reg_write <= '0';
                    mem_write <= '0';
                    waiting <= '0';
                    address <= pc_bin;
                    ir <= to_func(data_out(func_r));
                    pc <= pc + 1;
                    next_state <= decode;

                 -- Divert data flow, fetch immediate values
                when decode =>
                    if data_out(rs1_r) = imm then
                        address <= pc_bin;
                        alu_b <= data_out;
                        pc <= pc + 1;
                    else
                        alu_b <= ops(1);
                    end if;
                    next_state <= execute;
                -- Execute next instruction
                when others =>
                    case ir is
                        when ADD | SUB | LAND | LOR | LNOT | MOV =>
                            reg_write <= '1';
                            wdata <= alu_out;
                            rd <= data_out(rs0_r) when ir = MOV else "10";
                            next_state <= fetch;
                        when JMP =>
                            pc <= to_integer(unsigned(data_out));
                            next_state <= fetch;
                        when JEQ =>
                            pc <= to_integer(unsigned(data_out)) when zero = '1' else pc;
                            next_state <= fetch;
                        when JGR =>
                            pc <= to_integer(unsigned(data_out)) when signal_bit = '1' else pc;
                            next_state <= fetch;
                        when STORE =>
                            address <= alu_out;
                            mem_write <= '1';
                            next_state <= fetch;
                        when LOAD =>
                            address <= alu_out;
                            reg_write <= '1';
                            wdata <= data_out;
                            rd <= data_out(rs0_r);
                            next_state <= fetch;
                        when DIN =>
                            waiting <= '1';
                            if set = '1' then
                                reg_write <= '1';
                                wdata <= input;
                                rd <= data_out(rs0_r);
                                next_state <= fetch;
                            end if;
                        when DOUT =>
                            output <= alu_out;
                            next_state <= fetch;
                        when others => --HALT
                    end case;
                end case;
        end if;
    end process ControlUnit;
end architecture Structural;
