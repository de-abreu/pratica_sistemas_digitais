#!/usr/bin/python

from sys import argv, exit
from os.path import splitext, basename
import re

"""
Assembler for the Mefisto CPU assembly language. Generates vhdl files describing the program read and the primary memory loaded with it.

Usage: python compiler.py <program>.asm
"""

if len(argv) != 2:
    print("Usage: python compiler.py <program>.asm")
    exit(1)

program_name = splitext(basename(argv[1]))[0]
instruction_list = [""] * 256
label_dict = {}
count = 0


def formatInst(count: int, hex_str: str, inst: str, prev_inst: str) -> str:
    return f'\t\t{count} => x"{hex_str}", -- {inst} {prev_inst}'.rstrip()


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
    REGISTERS = ["a", "b", "r"]

    while instruction := program.readline().strip():
        func, _, args = instruction.lower().partition(" ")
        match func:
            # A comment
            case ";":
                continue

            # A label
            case string if re.search(r":$", string):
                label = func[:-1]
                instruction_list[count] = f" ({label})"
                entry = label_dict.get(label, [None, []])
                entry[0] = count
                label_dict[label] = entry
                continue

            # Functions that take no arguments
            case "nop" | "wait":
                instruction_list[count] = formatInst(
                    count,
                    format(16 * FUNCTIONS.index(func), "02X"),
                    instruction,
                    instruction_list[count],
                )

            # Functions that take a label as an argument
            case "jmp" | "jeq" | "jgr":
                instruction_list[count] = formatInst(
                    count,
                    format(16 * FUNCTIONS.index(func), "02X"),
                    instruction,
                    instruction_list[count],
                )
                count += 1
                label = args.split()[0]
                entry = label_dict.get(label, [None, []])
                entry[1].append(count)
                label_dict[label] = entry

            # Functions that take a single register as an argument
            case "not" | "in" | "out":
                rs0 = args.split()[0]
                instruction_list[count] = formatInst(
                    count,
                    format(
                        16 * FUNCTIONS.index(func) + 4 * REGISTERS.index(rs0), "02X"
                    ),
                    instruction,
                    instruction_list[count],
                )

            # Functions that a register and another register or immediate value as arguments
            case _:
                rs0, rs1 = args.split()[:2]
                if rs1.isnumeric():
                    instruction_list[count] = formatInst(
                        count,
                        format(
                            16 * FUNCTIONS.index(func) + 4 * REGISTERS.index(rs0) + 3,
                            "02X",
                        ),
                        instruction,
                        instruction_list[count],
                    )
                    count += 1
                    instruction_list[count] = formatInst(
                        count, format(int(rs1), "02X"), str(rs1), ""
                    )
                else:
                    instruction_list[count] = formatInst(
                        count,
                        format(
                            16 * FUNCTIONS.index(func)
                            + 4 * REGISTERS.index(rs0)
                            + REGISTERS.index(rs1),
                            "02X",
                        ),
                        instruction,
                        instruction_list[count],
                    )
        count += 1

    # Assign after every jump instruction position the location of the label it was assigned to.
    for _, values in label_dict.items():
        for source in values[1]:
            instruction_list[source] = formatInst(
                source, format(values[0], "02X"), str(values[0]), ""
            )

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
