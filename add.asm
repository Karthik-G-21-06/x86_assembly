   %include "inttostr.asm"
   %include "convtoint.asm"
    SYS_EXIT  equ 60
    SYS_READ  equ 0
    SYS_WRITE equ 1
    STDOUT    equ 1
    STDIN     equ 0
segment .data 

    msg db "Please enter a digit: ", 
    len equ $- msg 

    msg2 db "Please enter a second digit: ",
    len2 equ $- msg2 

    msg3 db "The sum is: "
    len3 equ $- msg3

segment .bss

    number1 resb 1024

segment .text 

    global _start
 _start: 
    ;input 1
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
    mov rdi, number1
    mov rax, 0
    call makeint
    mov r12, rax

    ;input 2
    mov rax, SYS_WRITE         
    mov rdi, STDOUT
    mov rsi, msg2
    mov rdx, len2       
    syscall
    
    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, number1
    mov rdx, 7
    syscall

    mov rdi, number1
    mov rax, 0
    call makeint
   
    add rax, r12
    call prntint

exit:
    mov rax,60
    mov rdi, 0
    syscall

