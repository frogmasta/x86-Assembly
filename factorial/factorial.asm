; Program to compute a factorial of a given input

extern  _printf, _scanf, _exit

global  _main

section .data
    msg1 db   "Please enter a number: ", 0
    msg2 db   "The factorial of the given number is %d.", 0xa, 0
    msg3 db   "n: %d", 0xa, 0

    scn  db   "%d", 0
section .bss
    num1 resd 1

section .text
; INPUT: one dword
; OUTPUT: one dword in eax

; C-style
;int factorial(int n) {
;    if (n == 0) {
;        return 1;
;    }
;    return n * factorial(n-1);
;}

    _fact:
        push ebx
        push ebp
        mov ebp, esp        ; Caller stack build-up

        mov ebx, [ebp + 12] ; ebx = int n
        cmp ebx, 1
        jne .rec            ; if (n != 1) recursively call itself

        mov eax, 1
        jmp .end            ; return 1

.rec    sub ebx, 1          ; edx = n-1
        push ebx
        call _fact          ; call factorial(n-1)
        add esp, 4

        add ebx, 1          ; ebx = n
        mul ebx             ; eax = factorial(n-1) * n

.end    pop ebp
        pop ebx
        ret                 ; Caller stack teardown

; main function

   _main:
        mov ebp, esp

        push msg1
        call _printf
        add esp, 4

        push num1
        push scn
        call _scanf
        add esp, 12

        push dword [num1]
        call _fact
        add esp, 4

        push eax
        push msg2
        call _printf
        add esp, 8

        push 2
        call _exit
