FILES := $(wildcard *.vhdl)
FLAGS := "--std=08"
ENTITY := "testbench"
TIME := "2us"
WAVE := "wave.ghw"

all:
	ghdl -a $(FLAGS) $(FILES)
	ghdl -e $(FLAGS) $(ENTITY)
	ghdl -r $(FLAGS) $(ENTITY) --wave=$(WAVE) --stop-time=$(TIME)
	gtkwave wave.ghw

