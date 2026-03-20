.model small
.stack 64

.data
     fib db 10 dup(0)
     
.code
main proc near
    
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov CX, 8
    mov AX, 0
    lea SI, fib
    lea DI, fib+1
    mov [SI], 1
    mov [DI], 1
    
    
    fibloop:
        call calcNext
        
    loop fibloop
    
    
    mov AX, 4C00H
    int 21H
     
    
main endp

calcNext proc
    mov AL, [DI]
    add AL, [SI]
    
    inc DI
    inc SI
    
    mov [DI], AL
    ret
calcNext endp