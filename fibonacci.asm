%include "inttostr.asm"
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

fib:
    mov r9, rax      ; number of terms to calculate
    mov r14, 0       ; initialize the first two terms
    mov r15, 1
    mov rax, r14
    call print_num   ; print the first term
    dec r9          ; decrement the number of terms to calculate
    jz end           ; if the number of terms is 0, end
    mov rax, r15
    call print_num   ; print the second term
    dec r9          ; decrement the number of terms to calculate
    jz end
calculate:
    add r14, r15     ; calculate the next term
    mov r13, r15    ; shift the terms for the next calculation
    mov r15, r14
    mov rax, r14
    call print_num   ; print the calculated term
    mov r14, r13
    dec r9           ; decrement the number of terms to calculate
    jnz calculate    ; repeat the calculation if terms remain
    call end


print_num:
    call prntint
    ret

end:
    mov rax, 60
    mov rdi, 0
    syscall
