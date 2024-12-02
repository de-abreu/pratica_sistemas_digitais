; An example of a program, that divides the first input for the second one.

in a
in b
mov r 0
loop_start:
    cmp b a
    jgr loop_end
    store r 255
    sub a b
    mov a r
    load r 255
    add r 1
    jmp loop_start
loop_end:
    out r
    wait
