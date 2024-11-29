; An example of a program, that divides the first input for the second one.

IN A
IN B
MOV R 0
STORE R 255
LOOP_START:
    MOV R A
    SUB R B
    MOV A R
    LOAD R 255
    ADD R 1
    STORE R 255
    MOV R A
    CMP R B
    JGR LOOP_START
LOAD R 255
DOUT R
WAIT
