library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;
use work.arrays_t.all;
use work.instructions_t.all;

entity CentralProcessingUnit is
    port (
        input         : in  std_logic_vector(inst_r);
        clk, set, rst : in  std_logic;
        output        : out std_logic_vector(inst_r)
    );
end entity CentralProcessingUnit;

architecture Structural of CentralProcessingUnit is
    type state is (fetch, decode, immediate, execute);
    signal ir : func;
    signal ops : vector_array(0 to 1)(inst_r);
    signal rd : std_logic_vector(reg_r);
    signal alu_b, alu_out, address, data_out, wdata : std_logic_vector(inst_r);
    signal input_enable, mem_write, zero, signal_bit, overflow : std_logic;

    component Registers is
        generic (width, count : integer);
        port (
            rs    : in  vector_array(0 to 1)(reg_r);
            rd    : in  std_logic_vector(reg_r);
            wdata : in  std_logic_vector(inst_r);
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
            op                         : in  func;
            clk                        : in  std_logic;
            result                     : out std_logic_vector(inst_r);
            zero, signal_bit, overflow : out std_logic
        );
    end component ArithmeticLogicUnit;

begin
    regs : Registers
        generic map (
            width => inst_l,
            count => 2 ** reg_l
        )
        port map (
            rs    => (data_out(rs0_r), data_out(rs1_r)),
            rd    => rd,
            wdata => wdata,
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
            op_a   => ops(0),
            op_b   => alu_b,
            op     => ir,
            clk    => clk,
            result => alu_out
        );

    confirm : process(set)
    begin
        input_enable <= '1';
    end process confirm;

    ControlUnit: process(clk, rst)
        variable next_state : state := fetch;
        variable pc : addressable := 0;
    begin
        if rst = '1' then
            next_state := fetch;
            pc := 0;

        elsif rising_edge(clk) then
            case next_state is
                when fetch => -- Fetch next instruction at the memory address pointed at by PC
                    mem_write <= '0';
                    address <= std_logic_vector(to_unsigned(pc, address'length));
                    ir <= to_func(data_out(func_r));
                    pc := pc + 1;
                    next_state := decode;

             -- Assign control signals, divert data flow, fetch immediate values
            when decode =>
                -- Reset the input_enable control signal
                input_enable <= '0';

                -- Configure register bank
                with ir select
                    rd <= data_out(rs0_r) when LOAD | DIN | MOV,
                          "10"            when others;

                -- Configure ALU and determine the next state
                if data_out(rs1_r) = imm then
                    next_state := immediate;
                else
                    alu_b <= ops(1);
                    next_state := execute;
                end if;
            when immediate =>
                address <= std_logic_vector(to_unsigned(pc, address'length));
                alu_b <= data_out;
                pc := pc + 1;
                next_state := execute;
            when others => -- Execute next instruction
                case ir is
                    when ADD | SUB | LAND | LOR | LNOT | MOV =>
                        wdata <= alu_out;
                        next_state := fetch;
                    when JMP =>
                        pc := to_integer(unsigned(data_out));
                        next_state := fetch;
                    when JEQ =>
                        pc := to_integer(unsigned(data_out)) when zero = '1' else pc;
                        next_state := fetch;
                    when JGR =>
                        pc := to_integer(unsigned(data_out)) when signal_bit = '1' else pc;
                        next_state := fetch;
                    when STORE =>
                        address <= alu_out;
                        mem_write <= '1';
                        next_state := fetch;
                    when LOAD =>
                        address <= alu_out;
                        wdata <= data_out;
                        next_state := fetch;
                    when DIN =>
                        if input_enable = '1' then
                            wdata <= input;
                            next_state := fetch;
                        end if;
                    when DOUT =>
                        output <= alu_out;
                        next_state := fetch;
                    when others => --HALT
                end case;
            end case;
        end if;
    end process ControlUnit;
end architecture Structural;
