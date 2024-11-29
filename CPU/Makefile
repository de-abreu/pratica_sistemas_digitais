PROGRAM ?= "program.asm"
TESTBENCH ?= "cpu_tb.vhdl"
TIME ?= "4us"
WAVE ?= "wave.ghw"
ENTITY = $(basename $(TESTBENCH))

.PHONY: all
all:
	python assembler.py $(PROGRAM)
	ghdl -a --std=08 *_t.vhdl registers.vhdl memory.vhdl ALU.vhdl CPU.vhdl $(TESTBENCH)
	ghdl -e --std=08 $(ENTITY)
	ghdl -r --std=08 $(ENTITY) --wave=$(WAVE) --stop-time=$(TIME)
	gtkwave $(WAVE)

