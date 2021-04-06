; Program to compute a + b where a and b are supplied by the user

global  _main
extern  _printf, _scanf, _sleep, _exit

section .data
   msg1  db "Enter a then b: ", 0
   msg2  db "a + b = %d", 0xa, 0
   msg3  db "Exiting program...", 0xa, 0

   scn   db "%d %d", 0

section .bss
   num1  resd 1
   num2  resd 1

section .text
   _main:
      mov ebp, esp

      push msg1
      call _printf     ; printf(msg)
      add esp, 4

      push num2
      push num1
      push scn
      call _scanf      ; scanf("%d %d", num1, num2);
      add esp, 12

      mov eax, [num1]
      add eax, [num2]  ; eax = num1 + num2

      push eax
      push msg2
      call _printf     ; printf(msg2, eax);
      add esp, 8

      push 2
      call _exit
