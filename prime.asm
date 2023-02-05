   %include "convtoint.asm"
    SYS_EXIT  equ 60
    SYS_READ  equ 0
    SYS_WRITE equ 1
    STDOUT    equ 1
    STDIN     equ 0
section .data

    msg db "Please enter a digit: ", 
    len equ $- msg 

    primeo db "number is prime ",
    len2 equ $- primeo

    notprime db "number is not prime "
    len3 equ $- notprime   

section .bss
    number1 resb 1024
section .text
    global _start

_start:

input:
    mov rax, SYS_WRITE         
    mov rdi, STDOUT
    mov rsi, msg
    mov rdx, len        
    syscall 

    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, number1
    mov rdx, 7
    syscall
    
    mov rax, 0
    mov rdi, number1
    call makeint
     
    mov r9, rax         ; move the number to check into ebx
    mov r10, 2          ;start to check whether 
    mov r12, 0          ;for flag method
check:
    mov r11, r9
    mov rax, r10
    cmp rax, r11        ; compare number with counter
    jge printprime       ; if number > counter, it's not prime
    mov rdx, 0          ; clear edx for div instruction
    div r11             ; divide number by counter, quotient in eax, remainder in edx
    cmp rdx, 0          ; check if there's a remainder
    jz printnot_prime   ; if remainder is 0, it's not prime
    add r10, 1          ; increment counter
    jmp check           ; and check again


printnot_prime:
    mov rax, SYS_WRITE         
    mov rdi, STDOUT
    mov rsi, notprime
    mov rdx, len3
    syscall
    jmp exit

printprime:
    mov rax, SYS_WRITE         
    mov rdi, STDOUT
    mov rsi, primeo
    mov rdx, len2        
    syscall


exit:
    mov rax, 60
    xor rdi, rdi
    syscall
