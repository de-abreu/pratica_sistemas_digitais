; An example of a program, that multiplies inputs provided.

IN A
IN B
MOV R 0
LOOP_START:
    CMP B 0
    JEQ LOOP_END
    ADD R A
    STORE R 255
    SUB B 1
    MOV B R
    LOAD R 255
    JMP LOOP_START
LOOP_END:
    OUT R
    WAIT
