section .data
   userMsg db "Please enter a number: "
   lenmsg equ $-userMsg
   usermsg2 db "Please enter a number: "
   lenmsg2 equ $-usermsg2
   disp db 'you have entered:'
    lenDisp equ $-disp

section .bss
    num resb 5

section .text
    global _start
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, userMsg
    mov edx, lenmsg
    int 0x80

    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 5
    int 0x80

    mov eax, 4
    mov ebx, 2
    mov ecx, disp
    mov edx, lenDisp
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 0x80


    mov eax, 1
    mov ebx, 0
    int 0x80
