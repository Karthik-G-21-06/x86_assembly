section .bss
    digspace resb 100
    digspacepos resb 8

section .text

prntint:   
    call _printRAX
    ret

_printRAX:

    mov rcx, digspace
    mov rbx, 10
    mov [rcx], rbx
    inc rcx
    mov [digspacepos], rcx

_printRAXLoop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax
    add rdx, 48

    mov rcx, [digspacepos]
    mov [rcx], dl
    inc rcx
    mov [digspacepos], rcx

    pop rax
    cmp rax, 0
    jne _printRAXLoop

printRAXLoop2:
    mov rcx, [digspacepos]
    mov rax,1
    mov rdi,1
    mov rsi, rcx
    mov rdx, 1
    syscall

    mov rcx, [digspacepos]
    dec rcx
    mov [digspacepos], rcx
    cmp rcx, digspace
    
    jge printRAXLoop2
    
    ret
