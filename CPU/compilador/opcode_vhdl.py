import re

memory_template = """
library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;
use work.array_t.all;
use work.instructions_t.all;
use work.programs_t.all;

entity Memory is
    port (
        address, data : in std_logic_vector(7 downto 0);
        clock, wren : in std_logic;
        q : out std_logic_vector(7 downto 0)
         );
end entity Memory;

architecture Behaviour of Memory is
    signal mem : program := multiply;

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

template_t = """
library ieee;
use ieee.std_logic_1164.all;
use work.array_t.all;
use work.instructions_t.all;

package template_t is
    subtype program is vector_array(addressable_mem)(inst_r);
    constant template : program;
end package template_t;

package body template_t is
    constant template : program :=
    --hexcode_placeholder;
end package body template_t;
"""

map_hexdigit_opcode = {
  "IN": "C",
  "MOV": "E",
  "CMP": "3",
  "JEQ": "8",
  "ADD": "1",
  "STORE": "B",
  "SUB": "2",
  "LOAD": "A",
  "JMP": "7",
  "OUT": "D",
  "WAIT": "F0",
}

map_hexdigit_operand = {
  'A': '0',
  'B': '4',
  'R': 'B',
  'R , A': '8',
  'A , R': '',
  'R , B': '',
  'B , R': '6',
  'A ,': '',
  'R ,': 'B',
  'B ,': '7',
}

def join_label_next_line(lines):
  """
  juntar rótulo com a próxima linha

  LOOP_START :
  IN A
  CMP A , R

  para

  LOOP_START : IN A
  CMP A , R
  
  """
  i = 0
  result = []
  while i < len(lines):
      line = lines[i]
      if ":" in line and i + 1 < len(lines):
          concatenated_line = line + " " + lines[i + 1].strip()
          result.append(concatenated_line)
          i += 2
      else:
          result.append(line)
          i += 1
  return "\n".join(result)

def add_arg_new_lines(lines):
  """
  Adicionar nova linha abaixo caso opcode receba um dígito (numérico)

  IN A
  STORE 255

  para

  IN A
  STORE 255
  255

  """
  result = []

  for line in lines:
      result.append(line)
      tokens = line.split()
      if tokens:
          last_token = tokens[-1]
          if last_token.isdigit():
              result.append(last_token)
          elif last_token not in {"A", "B", "R"}:
              result.append(last_token)

  return "\n".join(result)

def convert_labels_to_line_position(lines):
  """
  Reconhecer a linha de cada comando que pode ser referenciado e 
  adiciona-la como próxima linha

  IN A
  LOOP_START : CMP A , 255
  255
  JMP LOOP_START

  reconhecer o mapeamento linha: label

  {2: LOOP_START}

  para

  IN A
  LOOP_START : CMP A , 255
  255
  JMP LOOP_START
  2

  """
  labels_positions = {}
  for i, line in enumerate(lines):
    splited = line.split()
    if len(splited) > 0:
      if splited[0] not in map_hexdigit_opcode and not splited[0].isdigit():
        is_line_labeled = list(filter(lambda x : ':' in x, splited))
        if len(is_line_labeled) > 0:
          labels_positions.update({i-1: splited[0]})

  lines_no_empty = list(filter(lambda x : x, lines))
  result = []
  for i, line in enumerate(lines_no_empty):
    tokens = line.split(' ')
    # print(tokens)
    if len(tokens) == 1 and tokens[0] in labels_positions.values():
      for k,v in labels_positions.items():
        if tokens[0] == v:
          result.append(str(k))
    else:
      result.append(line)

  return "\n".join(result)

def remove_label_from_lines(lines):
  """
  Remover label das linhas

  LOOP_START : CMP A, 255
  255
  IN B

  para

  CMP A, 255
  255
  IN B

  """
  return re.sub(r".* : ", "", lines, flags=re.MULTILINE)

def build_program_count_hex_code(lines):
    """
    Traduzir cada opcode, argumentos e números para sua versão hex

    IN A
    IN B
    MOV R , 0
    LOOP_START :
    CMP B , 0

    para

    {
      0: x"C0" --IN A,
      1: x"C4" --IN B,
      2: x"EB" --MOV R , 0,
      3: x"00" --0,
      4: x"37" --CMP B , 0,
    }

    """
    result = {}

    for id, line in enumerate(lines):
      line_txt = ''
      parts = line.split(' ', 1)
      if not parts:
          continue

      opcode = parts[0]  # First part of the line is the opcode
      if opcode in map_hexdigit_opcode:
        line_txt += map_hexdigit_opcode[opcode]
      if opcode.isdigit():
        line_txt += hex(int(opcode)).replace('0x', '').zfill(2).upper()

      if len(parts) > 1:
        str_args = re.sub(r' \d+', '', parts[1])
        if str_args in map_hexdigit_operand:
          line_txt += map_hexdigit_operand[str_args]
        else:
          line_txt += '0'

      result.update({id: f'x"{line_txt}" --{line}'})


    result.pop(id)
    result.update({'others': 'x"00"'})


    return result

def dict_to_text_as_vhdl_array(input_dict):
    """
    Converter dicionário de linha de comando para array compatível com vhdl

    {
      0: x"C0" --IN A,
      1: x"C4" --IN B,
      2: x"EB" --MOV R , 0,
      3: x"00" --0,
      4: x"37" --CMP B , 0,
    }

    para

    (
      0 => x"C0" --IN A,
      1 => x"C4" --IN B,
      2 => x"EB" --MOV R , 0,
      3 => x"00" --0,
      4 => x"37" --CMP B , 0,
    )

    """
    result_lines = []
    for key, value in input_dict.items():
        # Format each line as desired
        result_lines.append(f"  {key} => {value},")
    # Combine lines into the final text
    result_text = "(\n" + "\n".join(result_lines) + "\n)"
    return result_text

def pipeline_compile_instructions_to_hexcode(instructions_code):
  """
  Construção de pipeline de funções para converter opcode (txt) para opcode hex (vhdl)

  IN A
  IN B
  MOV R , 0
  LOOP_START :
  CMP B , 0

  para

  (
    0 => x"C0" --IN A,
    1 => x"C4" --IN B,
    2 => x"EB" --MOV R , 0,
    3 => x"00" --0,
    4 => x"37" --CMP B , 0,
  )

  """
  instruction_lines = instructions_code.split('\n')
  txt_label_shift = join_label_next_line(instruction_lines)

  txt_label_shift_lines = txt_label_shift.split('\n')
  txt_arg_new = add_arg_new_lines(txt_label_shift_lines)

  txt_arg_new_lines = txt_arg_new.split('\n')
  txt_label_line_pos = convert_labels_to_line_position(txt_arg_new_lines)

  txt_final = remove_label_from_lines(txt_label_line_pos)
  txt_final_hex = build_program_count_hex_code(txt_final.split('\n'))

  txt_final_format_vhdl = dict_to_text_as_vhdl_array(txt_final_hex)

  return txt_final_format_vhdl

def build_program_memory_file(program_name, template):
  mem_file = open(f'{program_name}_memory', 'w')
  mem_content = template.replace("multiply", program_name)
  mem_file.write(mem_content)
  return mem_content

def build_instrucoes_t_file(program_name, instructions, template):
  instruc_file = open(f'{program_name}_instructions', 'w')
  hexmap_vhdl_instructions = pipeline_compile_instructions_to_hexcode(instructions) #mapear_opcode_hexcode(template):
  instructions_t_content = template.replace(
     "template_t", f'{program_name}_t').replace(
        'template', program_name).replace(
           "--hexcode_placeholder", hexmap_vhdl_instructions
           )
  instruc_file.write(instructions_t_content)
  return instructions_t_content


program_name = input("Nome do programa: ")
file_instructions_path = input('Caminho do arquivo (txt) de instruções: ')

file_instructions = open(file_instructions_path)

program_instructions = ''.join(file_instructions.readlines())

mem_file_txt = build_program_memory_file(program_name, memory_template)
# print(mem_file_txt)

instructions_t_file_txt = build_instrucoes_t_file(program_name, program_instructions, template_t)
# print(instructions_t_file_txt)