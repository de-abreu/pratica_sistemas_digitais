#!/usr/bin/python

from sys import argv, exit
from os.path import splitext, basename

"""
Assembler for the Mephisto CPU assembly language. Generates vhdl files describing the program read and the primary memory loaded with it.

Usage: python compiler.py <program>.asm
"""

if len(argv) != 2:
    print("Usage: python compiler.py <program>.asm")
    exit(1)

program_name = splitext(basename(argv[1]))[0]
instruction_list = [""] * 256
label_dict = {}
count = line = 0


def formatInst(address: int, data: int, inst: str, prev_inst: str) -> str:
    return (
        f'\t\t{address:<3} => x"{format(data, "02X")}", -- {inst} {prev_inst}'.rstrip()
    )


def fetchReg(line: int, args: str, index: int) -> int:
    REGISTERS = ["a", "b", "r"]
    try:
        return REGISTERS.index(args.split()[index])
    except IndexError:
        print(f"Missing target register at line {line}: {instruction}")
    except ValueError:
        print(f"Invalid register defined at line {line} : {instruction}")
    exit(1)


def fetchLabel(line: int, args: str) -> str:
    try:
        return args.split()[0]
    except IndexError:
        print(f"Missing target label at line {line}: {instruction}")
    exit(1)


with open(argv[1], "r") as program:
    FUNCTIONS = [
        "nop",
        "add",
        "sub",
        "cmp",
        "and",
        "or",
        "not",
        "jmp",
        "jeq",
        "jgr",
        "load",
        "store",
        "in",
        "out",
        "mov",
        "wait",
    ]
    lines = program.readlines()

    for i in range(len(lines)):
        instruction = lines[i].strip()
        func, _, args = instruction.lower().partition(" ")
        match func:
            # A blank line or a comment
            case "" | ";":
                continue

            # A label
            case label if label[-1] == ":":
                instruction_list[count] = f"({instruction.split(":")[0]})"
                label = label[:-1]
                entry = label_dict.get(label, [count, []])
                entry[0] = count
                label_dict[label] = entry
                continue

            # A function that take no arguments
            case "nop" | "wait":
                instruction_list[count] = formatInst(
                    count,
                    16 * FUNCTIONS.index(func),
                    instruction,
                    instruction_list[count],
                )

            # A function that takes a label as an argument
            case "jmp" | "jeq" | "jgr":
                instruction_list[count] = formatInst(
                    count,
                    16 * FUNCTIONS.index(func),
                    instruction,
                    instruction_list[count],
                )
                count += 1
                line += 1
                label = fetchLabel(i, args)
                entry = label_dict.get(label, [None, []])
                entry[1].append(count)
                label_dict[label] = entry

            # Functions that take a single register as an argument
            case "not" | "in" | "out":
                rs0 = fetchReg(i, args, 0)
                instruction_list[count] = formatInst(
                    count,
                    16 * FUNCTIONS.index(func) + 4 * rs0,
                    instruction,
                    instruction_list[count],
                )

            # Functions that a register and another register or immediate value as arguments
            case "add" | "sub" | "cmp" | "and" | "or" | "load" | "store" | "mov":
                rs0 = fetchReg(i, args, 0)
                try:
                    rs1 = args.split()[1]
                    if rs1.isnumeric():
                        instruction_list[count] = formatInst(
                            count,
                            16 * FUNCTIONS.index(func) + 4 * rs0 + 3,
                            instruction,
                            instruction_list[count],
                        )
                        count += 1
                        instruction_list[count] = formatInst(
                            count, int(rs1), str(rs1), ""
                        )
                    else:
                        instruction_list[count] = formatInst(
                            count,
                            16 * FUNCTIONS.index(func) + 4 * rs0 + fetchReg(i, args, 1),
                            instruction,
                            instruction_list[count],
                        )
                except IndexError:
                    print(f"Missing argument at line {i}: {instruction}")
                    exit(1)

            case _:
                print(f'Invalid operation "{func}" at line {i}: {instruction}')
                exit(1)

        count += 1

    # Assign after every jump instruction the location of the label it was assigned to.
    for _, values in label_dict.items():
        for source in values[1]:
            instruction_list[source] = formatInst(source, values[0], str(values[0]), "")

with open("memory.vhdl", "w") as memory:
    contents = f"""library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.array_t.all;
use work.instructions_t.all;
use work.{program_name}_t.all;

entity Memory is
    port (
        address, data : in std_logic_vector(7 downto 0);
        clock, wren : in std_logic;
        q : out std_logic_vector(7 downto 0)
         );
end entity Memory;

architecture Behaviour of Memory is
    signal mem : program := {program_name};

    --Division program
    signal index : addressable_mem;
    begin
        index <= to_integer(unsigned(address));
        q <= mem(index);

        memory_access: process(clock)
        begin
            if rising_edge(clock) and wren = '1' then
                mem(index) <= data;
            end if;
        end process memory_access;
end architecture Behaviour;
"""
    memory.write(contents)

with open(f"{program_name}_t.vhdl", "w") as package:
    contents = f"""library ieee;
use ieee.std_logic_1164.all;
use work.array_t.all;
use work.instructions_t.all;

package {program_name}_t is
    subtype program is vector_array(addressable_mem)(inst_r);
    constant {program_name} : program;
end package {program_name}_t;

package body {program_name}_t is
    constant {program_name} : program :=
    (
"""
    for instruction in instruction_list:
        if not instruction:
            contents += "\n"
            break
        contents += f"\n{instruction}"
    contents += f"""        others => x"00"
    );
end package body {program_name}_t;
"""
    package.write(contents)
