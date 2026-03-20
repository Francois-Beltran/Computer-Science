.model small
.stack 64

.data
     dividend dw 15
     divisor dw 7
     count dw 0
     remainder dw 0 
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov AX, 00
    mov BX, 00
    mov AX, dividend
    mov BX, divisor
    mov CX, 00
    cmp BX, 0
    je exit
    
    division:
    
        cmp BX, AX
        jg done:
    
        sub AX, BX
        inc CX
        jmp division
        
    done:
    
        mov count, CX
        mov remainder, AX
    
    exit:

    mov AX, 4C00H
    int 21H
main endp