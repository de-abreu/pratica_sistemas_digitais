# Relatório: Projeto de uma CPU de 8-bits

## Autores

| Nome                       | nUSP     |
|:-------------------------- |:-------- |
| Guilherme de Abreu Barreto | 12543033 |
| João Vitor Naldoni         | 13748102 |
| Jorge Salhani              | 8927418  |

## Resumo

O presente documento descreve o projeto de um processador com 8 bits de endereçamento, denominado **Mefisto**. Iniciamos por definir as instruções de máquina que este comporta, seus componentes e arquitetura, assim como as decisões de projeto tomadas na formulação destes. No mais, ao final fornecemos as instruções necessárias para o uso de seu montador para a criação de novos programas para o processador e a realização da simulação de sua operação fazendo uso do simulador [GHDL](http://ghdl.free.fr/) e a interface [GTKWave](https://github.com/gtkwave/gtkwave).

## Sumário

1. Instruções de máquina
    1. Formato de instrução
    2. Instruções implementadas
    3. Endereçamento dos registradores

2. Arquitetura da CPU
    1. Diagrama esquemático do circuíto
    2. Componentes
    3. Unidade de Controle

3. Instruções de Uso
    1. Gerando programas com o montador
    2. Simulador e interface GTKWave

## Formato de instrução e instruções implementadas

Mefisto faz uso de um único formato de instrução fixado como:

| func    | rs0 | rs1/Imm |
|:------- |:--- |:------- |
| 7 6 5 4 | 3 2 | 1 0     |

Sendo:

- **func**: A funcionalidade a ser executada;
- **rs0**: Endereço do registrador utilizado como primeiro operador;
- **rs1**: Endereço do registrador, ou indicação de valor imediato `11`, a ser utilizado como segundo operador.

Mefisto possui apenas 3 registradores, denominados A, B e R. Estes são indicados, respectivamente, com os pares de bits `00`, `01` e `10`. Nem todas as instruções fazem uso de um ou dois operadores, nestes casos fica indicado nas instruções abaixo com `X` quando os bits não são utilizados.

### Instruções implementadas

#### NOP

**Instrução:** `0 | X | X`

**Descrição:** Sem operação, isto é, descarta um ciclo de execução.

#### ADD

**Instrução:** `1 | rs0 | rs1/Imm`

**Descrição:** Soma dois valores, ativa flags correspondentes, e atribui o resultado ao registrador `R`.

#### SUB

**Instrução:** `2 | rs0 | rs1/Imm`

**Exemplo:** 

**Descrição:** Subtrai de `rs0` o valor `rs1/Imm`, ativa flags correspondentes, e atribui o resultado ao registrador `R`.

#### CMP

**Instrução:** `3 | rs0 | rs1/Imm`

**Descrição:** Subtrai de `rs0` o valor `rs1/Imm` e ativa flags correspondentes. Serve para comparar se o primeiro valor é maior ou igual ao segundo.

#### LAND

**Instrução:** `4 | rs0 | rs1/Imm`

**Descrição:** Aplica a operação E lógico entre dois valores, ativa flags correspondentes e atribui o resultado ao registrador `R`.

#### LOR

**Instrução:** `5 | rs0 | rs1/Imm`

**Descrição:** Aplica a operação OU lógico entre dois valores, ativa flags correspondentes e atribui o resultado ao registrador `R`.

#### LNOT

**Instrução:** `6 | rs0 | X`

**Descrição:** Aplica a operação de negação lógica a um valor, ativa flags correspondentes e atribui o resultado ao registrador `R`.

#### JUMP


**Instrução:** `7 | rs0 | X`

**Descrição:** Aplica a operação de negação lógica a um valor, ativa flags correspondentes e atribui o resultado ao registrador `R`.

#
