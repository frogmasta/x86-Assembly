; Program to compute a + b where a and b are floats

global  _main
extern  _printf, _scanf, _exit

section .data
    msg1 db   "Enter two numbers a b: ", 0
    msg2 db   "a + b = %f", 0xa, 0

    scn  db   "%f %f", 0
section .bss
    num1 resd 1
    num2 resd 1

section .text
   _main:
        mov ebp, esp

        push msg1
        call _printf
        add esp, 4

        push num2
        push num1
        push scn
        call _scanf
        add esp, 12

        fld dword [num1]
        fld dword [num2]
        fadd

        sub esp, 8
        fstp qword [esp]
        push msg2
        call _printf
        add esp, 12

        push 2
        call _exit
