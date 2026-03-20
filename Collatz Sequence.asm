.model small
.stack 64

.data
     var db 12
     count db 0
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
     
    mov AX, 00 
    mov AL, var
    mov CX, 1
    lea SI, count
    
    collatz:
    
        cmp AX, 1
        je exit
        inc CX
        test AX, 1
        jz even
        
    odd:    
        mov BX, 3
        mul BX
        inc AX
        jmp collatz
        
    even:
    
        shr AX, 1
        jmp collatz
        
        
    exit:
    
    mov [SI], CX
    
    mov AX, 4C00H
    int 21H
main endp