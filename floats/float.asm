; Program to compute sqrt(a) where a is given by the user

global  _main
extern  _printf, _scanf, _sqrt, _exit

section .data
    msg1 db   "Enter a number: ", 0
    msg2 db   "sqrt(num) = %f", 0xa, 0

    scn  db   "%f", 0
section .bss
    num  resd 1

section .text
   _main:
        mov ebp, esp

        push msg1
        call _printf
        add esp, 4

        push num
        push scn
        call _scanf
        add esp, 8

        fld dword [num]
        sub esp, 8
        fstp qword [esp]
        call _sqrt
        add esp, 8

        sub esp, 8
        fstp qword [esp]
        push msg2
        call _printf
        add esp, 12

        push 2
        call _exit
