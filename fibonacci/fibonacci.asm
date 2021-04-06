; Program to compute a factorial of a given input

extern  _printf, _scanf, _exit

global  _main

section .data
    msg1 db "Enter a number to print in Fibonacci: ", 0
    msg2 db "%d", 0xa, 0

    debg db "n = %d", 0xa, 0

    scn  db "%d", 0
section .bss
    num  resd 1
section .text
    _fibonacci:
        push edx           ; save edx
        push ebp           ; save ebp
        mov ebp, esp       ; set base of stack frame
        sub esp, 4         ; make room for local variables

        mov edx, [ebp + 12]; edx = n
        cmp edx, 1
        je .one            ; if(n == 1), return 1
        cmp edx, 0
        je .zero           ; if(n == 0), return 0

.rec    sub edx, 1
        push edx
        call _fibonacci    ; fibonacci(n-1)
        add esp, 4
        mov [ebp - 4], eax ; move return value into local variable

        sub edx, 1
        push edx
        call _fibonacci    ; fibonacci(n-2)
        add esp, 4

        add eax, [ebp - 4] ; eax = fibonacci(n-2) + fibonacci(n-1)

        jmp .end           ; return eax

.one    mov eax, 1
        jmp .end           ; return 1

.zero   mov eax, 0         ; return 0

.end    add esp, 4
        pop ebp            ; restore ebp
        pop edx            ; restore edx
        ret                ; return from subroutine

    _main:
        mov ebp, esp

        push msg1
        call _printf
        add esp, 4

        push num
        push scn
        call _scanf
        add esp, 8

        push dword [num]
        call _fibonacci
        add esp, 4

        push eax
        push msg2
        call _printf
        add esp, 8

        push 2
        call _exit
