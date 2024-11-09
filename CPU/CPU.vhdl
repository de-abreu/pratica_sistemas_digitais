library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;
use work.arrays_t.all;
use work.instructions_t.all;

entity CentralProcessingUnit is
    port (
        input         : in  std_logic_vector(inst_r);
        output        : out std_logic_vector(inst_r);
        clk, set, rst : out std_logic
    );
end entity CentralProcessingUnit;

architecture Structural of CentralProcessingUnit is
    type state is (fetch, decode, execute);
    signal ir : func;
    signal rs, ops : vector_array(0 to 1)(reg_r);
    signal rd : std_logic_vector(reg_r);
    signal alu_b, alu_out, address, data_out, wdata : std_logic_vector(inst_r);
    signal alu_enable, mem_write, mem_to_reg, zero, signal_bit, overflow : std_logic;

    component Registers is
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
        port map (
            rs    => rs,
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

    ControlUnit: process(clk, rst)
        variable next_state : state := fetch;
        variable pc : addressable := 0;
    begin
        if rst = '1' then
            next_state := fetch;
            pc := 0;

        elsif rising_edge(clk) then

            -- Fetch next instruction at the memory address pointed at by PC
            if next_state = fetch then
                address <= std_logic_vector(to_unsigned(pc, address'length));
                ir <= to_func(data_out(func_r));
                pc := pc + 1;
                next_state := decode;

             -- Assign control signals, divert data flow, fetch immediate values
            elsif next_state = decode then

                -- Configure register bank
                rs(0) <= data_out(rs0_r);
                rs(1) <= data_out(rs1_r);
                with ir select
                    rd <= data_out(rs0_r) when LOAD | DIN | MOV,
                          "10"            when others;

                -- Configure ALU
                if data_out(rs1_r) /= imm then
                    alu_b <= ops(1);
                else
                    wait until rising_edge(clk);
                    address <= std_logic_vector(to_unsigned(pc, address'length));
                    alu_b <= data_out;
                    pc := pc + 1;
                end if;

                -- Configure Memory
                mem_write <= '1' when ir = STORE else '0';
                next_state := execute;

            -- Execute next instruction
            else
                case ir is
                    when ADD | SUB | LAND | LOR | LNOT | MOV =>
                        wdata <= alu_out;
                    when JMP =>
                        pc := to_integer(unsigned(data_out));
                    when JEQ =>
                        pc := to_integer(unsigned(data_out)) when zero = '1' else pc;
                    when JGR =>
                        pc := to_integer(unsigned(data_out)) when signal_bit = '1' else pc;
                    when STORE | LOAD =>
                        address <= alu_out;
                    when DIN =>
                        wait until rising_edge(set);
                        wdata <= input;
                    when DOUT =>
                        output <= alu_out;
                    when others => --HALT
                        wait;
                end case;
                next_state := fetch;
            end if;
        end if;
    end process ControlUnit;
end architecture Structural;
