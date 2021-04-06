; Program to compute a factorial of a given input

extern  _printf, _exit

global  _main

section .data
    ; definitions for "fizz" and "buzz"
    fizz db "fizz", 0
    buzz db "buzz", 0

    ; definitions for prts (print string format) and prti (print int format)
    prts db "%s", 0
    prti db "%d", 0
    newl db 0xa, 0

    ; to check if either fizz or buzz
    status dd 0

section .bss

section .text
    _prt_fizz:
        add dword [status], 1

        push fizz
        push prts
        call _printf
        add esp, 8

        ret

    _prt_buzz:
        add dword [status], 1

        push buzz
        push prts
        call _printf
        add esp, 8

        ret

    _prt_int:
        push ebp
        mov ebp, esp

        add dword [status], 1

        push dword [ebp + 8]
        push prti
        call _printf
        add esp, 8

        pop ebp
        ret

   _main:
        mov ebp, esp

        mov ecx, 0              ; ecx = 0 (loop counter -> 100)

.loop   mov dword [status], 0   ; clear status code
        inc ecx                 ; increment ecx

        push ecx                ; save ecx
        push newl
        call _printf            ; print newline
        add esp, 4
        pop ecx                 ; restore ecx

        cmp ecx, 100
        jg  .exit               ; check if looped 100 times

.fizz   mov eax, ecx
        mov edx, 0
        mov ebx, 3
        div ebx                 ; eax = result: edx = remainder
        cmp edx, 0
        jne .buzz               ; if remainder 0, print fizz

        push ecx                ; save ecx
        call _prt_fizz          ; print fizz
        pop ecx                 ; restore ecx

.buzz   mov eax, ecx
        mov edx, 0
        mov ebx, 5
        div ebx                 ; eax = result: edx = remainder
        cmp edx, 0
        jne .upt                ; if remainder 0, print buzz

        push ecx                ; save ecx
        call _prt_buzz          ; print buzz
        pop ecx                 ; restore ecx

.upt    cmp dword [status], 0
        jne .loop               ; check if fizz or buzz has been printed

        push ecx                ; save ecx
        call _prt_int           ; print ecx
        pop ecx                 ; restore ecx

        jmp .loop               ; loop onto next number

.exit   push 2
        call _exit              ; exit the program
