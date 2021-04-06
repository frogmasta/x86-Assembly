; Program to compute a factorial of a given input

extern  _printf, _scanf, _exit

global  _main

section .data
    msg  db "The sum of the array is %d.", 0xa, 0

    arr  dd 3, 4, 5, 6, 2, 1
    len  dd 6
section .bss
    ; Empty
section .text
; INPUT: dword array, dword length
; OUTPUT: dword in eax (sum)

    _array_sum:
        push ebp            ; save ebp
        mov ebp, esp

        mov eax, 0          ; eax = 0
        mov ebx, [ebp + 12] ; ebx = arr
        mov ecx, [ebp + 8]  ; ecx = length

.loop   cmp ecx, 0
        jle .end            ; if length <=0, return
        add eax, [ebx]      ; add current array number to eax
        add ebx, 4          ; increment ebx
        dec ecx             ; decrement ecx
        jmp .loop           ; loop

.end    pop ebp             ; restore edp
        ret
; main function

   _main:
        mov ebp, esp

        push arr
        push dword [len]
        call _array_sum
        add esp, 8

        push eax
        push msg
        call _printf
        add esp, 8

        push 2
        call _exit
