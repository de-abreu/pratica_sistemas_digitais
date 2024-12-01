PROGRAM ?= "program.asm"
TESTBENCH ?= $(basename $($PROGRAM)).vhdl
TIME ?= "4us"
ENTITY = $(basename $(TESTBENCH))
WAVE = $(basename $($PROGRAM)).ghw

.PHONY: all
all: $(PROGRAM) $(TESTBENCH)
	python assembler.py $(PROGRAM)
	ghdl -a --std=08 *_t.vhdl registers.vhdl memory.vhdl ALU.vhdl CPU.vhdl $(TESTBENCH)
	ghdl -e --std=08 $(ENTITY)
	ghdl -r --std=08 $(ENTITY) --wave=$(WAVE) --stop-time=$(TIME)
	gtkwave $(WAVE)

