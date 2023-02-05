
section .text

makeint:
mov rax, 0
    call convert


convert:
     movzx rsi, byte[rdi]
     test rsi,rsi   ;check for null character '\0'
     je done
     cmp rsi, 10   ;checking for '\n'
     je done


     cmp rsi, 48   ;checking whether the entered vale is greater than or equal to 0
     jl error

     cmp rsi, 57   ;checking whether the entered vale is less than or equal to 9
     jg error
    
    ; converting the value to integer
     sub rsi, 48   
     imul rax,10
     add rax,rsi
 
     ;taking the next string

     inc rdi
     jmp convert

error :
    mov rax, -1

done :
    ret


