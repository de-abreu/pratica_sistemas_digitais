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

architecture Behaviour of CentralProcessingUnit is
    type state is (fetch, decode, execute);
    signal ir : func;
    signal rs, ops : vector_array(0 to 1)(reg_r);
    signal rd : std_logic_vector(reg_r);
    signal alu_b, alu_out, address, data_in, data_out, wdata : std_logic_vector(inst_r);
    signal input_enable, reg_write, mem_write, mem_to_reg, zero, signal_bit, overflow : std_logic;

    component Registers is
        port (
            rs    : in  vector_array(0 to 1)(reg_r);
            rd    : in  std_logic_vector(reg_r);
            wren  : in  std_logic;
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
            result                     : out std_logic_vector(inst_r);
            zero, signal_bit, overflow : out std_logic
        );
    end component ArithmeticLogicUnit;

begin
    regs : Registers
        port map (
            rs    => rs,
            rd    => rd,
            wren  => reg_write,
            wdata => wdata,
            ops   => ops
        );

    mem : Memory
        port map (
            address => address,
            clock   => clk,
            wren    => mem_write,
            data    => data_in,
            q       => data_out
        );

    alu : ArithmeticLogicUnit
        port map (
            op_a   => ops(0),
            op_b   => alu_b,
            op     => ir,
            result => alu_out
        );

    ControlUnit: process(clk, rst)
        variable next_state : state := fetch;
        variable pc : addressable := 0;
    begin
        if rst = '1' then
            pc := 0;
            next_state := fetch;
        elsif rising_edge(clk) then
             -- Fetch next instruction at the memory address pointed at by PC
            if next_state = fetch then
                address <= std_logic_vector(to_unsigned(pc, address'length));
                ir <= to_func(data_out(func_r));
                next_state := decode;
             -- Assign control signals, divert data flow, fetch immediate values
            elsif next_state = decode then
                case ir is
                    when LOAD | DIN | MOV =>
                        rd <= data_out

                if ir = LOAD or ir =
                rs(0) <= data_out(rs1_r);
                rs(1) <= data_out(rs2_r);
                if data_out(rs2_r) /= imm then
                    alu_b <= ops(1);
                else
                    pc := pc + 1;
                    wait until rising_edge(clk);
                    address <= std_logic_vector(to_unsigned(pc, address'length));
                    alu_b <= data_out;
                end if;
                with ir select
                    wdata <= input    when DIN,
                             data_out when LOAD,
                             alu_out  when others;
                input_enable <= '1' when ir = DIN else '0';
                with ir select
                    reg_write <= '1' when ADD | SUB | LAND | LOR | LNOT | LOAD | DIN | MOV,
                                 '0' when others;
                mem_write <= '1' when ir = STORE else '0';
                rd <= data_out(rs1_r) when ir = MOV else "10";
                next_state := execute;
            elsif ir = HALT then wait; -- Halt program if it has reached its end
            else -- Otherwise execute next instruction
                if func'pos(ir) <= func'pos(JMP) and func'pos(ir) >= func'pos(JGR) then
                    pc := ops(0) when ir = JMP or (ir = JEQ and zero = '1') or (ir = JGR and signal_bit = '1') else '1';
                elsif ir = STORE or LOAD then
                    address <= alu_b;
                    if ir = STORE then
                        data_in <= ops(1);
                    else
                        rd <=
                elsif ir = LOAD





                next_state := fetch;
            end if;
        end if;
    end process ControlUnit;
end architecture Behaviour;


