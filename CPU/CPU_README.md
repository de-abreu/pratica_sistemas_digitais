# Relatório: Projeto de uma CPU de 8-bits

## Autores

| Nome                       | nUSP     |
|:-------------------------- |:-------- |
| Guilherme de Abreu Barreto | 12543033 |
| João Vitor Naldoni         | 13748102 |
| Jorge Salhani              | 8927418  |

## Resumo

O presente documento descreve o projeto de um processador com 8 bits de endereçamento, denominado **Mefisto**. Iniciamos por definir as instruções de máquina que este comporta, seus componentes e arquitetura, assim como as decisões de projeto tomadas na formulação destes. No mais, ao final fornecemos as instruções necessárias para o uso de seu montador para a criação de novos programas para o processador e a realização da simulação de sua operação fazendo uso de um montador escrito em Python, o simulador [GHDL](http://ghdl.free.fr/) e a interface [GTKWave](https://github.com/gtkwave/gtkwave), programas estes prontamente disponíveis para instalação em uma variedade de distribuições Linux.

## Sumário

1. Instruções de máquina

   1. Entradas e Saídas
   2. Formato de instrução
   3. Instruções implementadas
   4. Endereçamento dos registradores

2. Arquitetura da CPU

   1. Componentes
   2. Unidade de Controle e diagrama esquemático do circuíto
   3. Unidade Lógico-Aritmética
   4. Banco de registadores e Memória Primária

3. Instruções de Uso

   1. Gerando programas com o montador
   2. Carregando programas na memória, e gerando um testbench para teste da CPU
   3. Compilando os arquivos para simulação com GHDL
   4. Uso da interface GTKWave para avaliação do teste da CPU

## Instruções de máquina

### Entradas e saídas

Encontram-se especificadas as seguintes entradas e saídas para a CPU Mefisto:

```vhdl
entity CentralProcessingUnit is
    port (
        input         : in  std_logic_vector(inst_r);
        clk, set, rst : in  std_logic;
        output        : out std_logic_vector(inst_r);
        waiting       : out std_logic
    );
end entity CentralProcessingUnit;
```

Os nomes dos sinais seguem convenções vistas em circuitos elétricos. Os principais diferenciais é a definição de `inst_r` como sendo a largura de instrução de 8-bits, e o uso de um output "waiting" para indicar que a CPU está aguardando o input do usuário, a ser digitado em `input` e confirmado com `set`.

### Formato de instrução

Mefisto faz uso de um único formato de instrução fixado como:

| func    | rs0 | rs1/Imm |
|:------- |:--- |:------- |
| 7 6 5 4 | 3 2 | 1 0     |

Sendo:

- **func**: A funcionalidade a ser executada;
- **rs0**: Endereço do registrador utilizado como primeiro operador;
- **rs1**: Endereço do registrador, ou indicação de valor imediato `11`, a ser utilizado como segundo operador.
- **7 à 0:** Os índices de cada bit da instrução.

Na descrição das instruções, utilizamos um par de dígitos hexadecimais, por exemplo: `x"C0", -- DIN A`

### Instruções implementadas

Mefisto implementa 16 funções, as quais são listadas a seguir. Quando estas podem, ou devem, comportar um valor imediato, estas estão seguidas de `> Imm` para identificar a presença deste na posição de memória seguinte àquela em que a instrução foi lida.

No mais, Mefisto possui apenas 3 registradores, denominados A, B e R. Estes são indicados, respectivamente, com os pares de bits `00`, `01` e `10`. Nem todas as instruções fazem uso de um ou dois operadores, nestes casos fica indicado nas instruções abaixo com `X` quando os bits não são utilizados.

#### NOP

**Exemplo:** `NOP`

**Formato:** `0 | X | X > Imm`

**Descrição:** Sem operação; isto é, descarta um ciclo de execução.

#### ADD

**Exemplo:** `ADD A B`

**Formato:** `1 | rs0 | rs1 > Imm`

**Descrição:** Soma dois valores, ativa flags correspondentes, e atribui o resultado ao registrador `R`.

#### SUB

**Exemplo:** `SUB R 1`

**Formato:** `2 | rs0 | rs1 > Imm`

**Descrição:** Subtrai de `rs0` o valor `rs1/Imm`, ativa flags correspondentes, e atribui o resultado ao registrador `R`.

#### CMP

**Exemplo:** `CMP A 0`

**Formato:** `3 | rs0 | rs1 > Imm`

**Descrição:** Subtrai de `rs0` o valor `rs1/Imm`, ativa flags correspondentes, e descarta o resultado. Utilizado para comparar se o primeiro valor é maior ou igual ao segundo.

#### AND

**Exemplo:** `AND A B`

**Formato:** `4 | rs0 | rs1 > Imm`

**Descrição:** Aplica a operação E lógico entre dois valores, ativa flags correspondentes e atribui o resultado ao registrador `R`.

#### OR

**Exemplo:** `OR R B`

**Formato:** `5 | rs0 | rs1 > Imm`

**Descrição:** Aplica a operação OU lógico entre dois valores, ativa flags correspondentes e atribui o resultado ao registrador `R`.

#### NOT

**Exemplo:** `NOT A`

**Formato:** `6 | rs0 | X`

**Descrição:** Aplica a operação de negação lógica a um valor armazenado, ativa flags correspondentes e atribui o resultado ao registrador `R`.

#### JMP

**Exemplo:** `JMP LOOP_START`

**Formato:** `7 | X | X > Imm`

**Descrição:** Atribui ao Program Counter o valor associado a *label* descrita.

#### JEQ

**Exemplo:** `JEQ LOOP_END`

**Formato:** `8 | X | X > Imm`

**Descrição:** Atribui ao Program Counter o valor associado a *label* descrita, se o resultado da última operação lógica ou aritmética for 0.

#### JGR

**Exemplo:** `JGR LOOP_END`

**Formato:** `9 | X | X > Imm`

**Descrição:** Atribui ao Program Counter o valor associado a *label* descrita, se na última operação aritmética `rs0` for maior que `rs1`.

#### LOAD

**Exemplo:** `LOAD A 255`

**Formato:** `A | rs0 | X > Imm`

**Descrição:** Atribui ao registador `rs0` o conteúdo armazenado na memória na posição indicada por um índice de 0 à 255.

#### STORE

**Exemplo:** `STORE B 255`

**Formato:** `B | rs0 | X > Imm`

**Descrição:** Atribui à memória na posição indicada por um índice de 0 a 255 o conteúdo armazenado no registrador `rs0`.

#### IN

**Exemplo:** `IN A`

**Formato:** `C | rs0 | X`

**Descrição:** Atribui ao registrador `rs0` o conteúdo em `input` quando feita a confirmação de que o valor está seguro com `set`.

#### OUT

**Exemplo:** `OUT R`

**Formato:** `D | rs0 | X`

**Descrição:** Envia a `output` o conteúdo armazenado em `rs0`.

#### MOV

**Exemplo:** `MOV A R`

**Formato:** `E | rs0 | rs1 > Imm`

**Descrição:** Atribui à `rs0` o valor em `rs1`.

#### HALT

**Exemplo:** `HALT`

**Formato:** `F | X | X`

**Descrição:** Interrompe a execuçã odo programa até que seja emitido um sinal `rst`.

## Endereço dos registradores

As seguintes combinações de registradores e valores imediatos são possíveis:

| Hex| Opção |
| :--- | :--- |
| 0 | A A |
| 1 | A B |
| 2 | A R |
| 3 | A Imm |
| 4 | B A |
| 5 | B B |
| 6 | B R |
| 7 | B Imm |
| 8 | R A |
| 9 | R B |
| A | R R |
| B | R Imm |

## Arquitetura da CPU


### Componentes

Mefisto integra uma Unidade de Controle (UC), uma Unidade Lógico-Aritmética (ULA), um banco de registradores e uma memória primária. Além de alguns registradores auxiliares.

### Unidade de Controle e diagrama esquemático do circuíto

A UC é responsável por controlar o fluxo de dados de acordo com as instruções lidas e realizar a passagem entre os diferentes estágios de execução da CPU. Esta está descrita enquanto um processo no arquivo [CPU.vhdl](./CPU.vhdl). Os estágios de execução implementados em Mefisto são:

- **Fetch (Buscar):** Atribui ao registrador de instrução o valor na memória apontado pelo Program Counter, e incrementa este último; Direciona as porções de bits relevantes a função a UC e relevantes aos registradores ao banco de registradores.

- **Execute (Executar):** A depender da função a ser executada, aqui são realizados:
    - Desvio condicional do PC;
    - Operacionalização da ULA;
    - Emissão do conteúdo de um registrador à saída;
    - Determinação do próximo estágio de execução;

- **Memory Access (Acesso à Memória):** No caso de instruções do tipo LOAD ou STORE, operacionaliza a Memória para leitura ou escrita.

- **Write back (Armazenar Resultado):** Escreve o resultado da operação ao banco de registradores, quando aplicável, e retoma o endereçamento da memória para o Program Counter.

O seguinte diagrama esquematiza estas etapas de execução e os componentes envolvidos em cada uma destas:

![Pipeline de execução da CPU](./images/CPU Pipeline.png)

### Unidade Lógico-Aritmética

A ULA está descrita no arquivo [ALU.vhdl](./ALU.vhdl). Esta implementa as funcionalidades de soma, subtração, algumas operações lógicas e a opção para se repassar inalterado um valor imediato recebido. Esta também emite sinais indicativos de um resultado nulo (`zero`), positivo ou negativo (`signal_bit`).

### Banco de registradores e Memória primária

Estes encontram-se descritos, respectivamente, nos arquivos [registers.vhdl](./registers.vhdl) e [memory.vhdl](./memory.vhdl). A implementação destes é bastante similar. As principais diferenças entre estes é:

- O primeiro tem capacidade de armazenamento muito menor (4 palavras) que o segundo (256 palavras).

- O primeiro faz acesso a duas palavras simultaneamente, enquanto o segundo acessa apenas uma.

- O primeiro possui acesso assíncrono e o segundo síncrono.

A implementação da memória foi feita de maneira a comportar as mesmas entradas e saídas vistas para a memória RAM em Bloco (BRAM) das placas FPGA.

## Instruções de Uso

Antes de prosseguir nas etapas seguintes faz-se necessária a instalação das ferramentas `python`, `ghdl` e `gtkwave`. Recomenda-se obtê-las por meio do gerenciador de pacotes recomendado pela sua distribuição Linux. Também recomenda-se um editor de

### Gerando programas como
