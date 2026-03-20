.model small
.stack 64

.data
    word dw 121
    ispalindrome db 0
     
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov AX, 00
    mov DX, 00
    mov BX, 00
    mov AX, word
    mov CX, 10
    push AX
    
    check:
    mov DX, 00
    div CX
    xchg AX,BX
    mov SI, DX
    mul CX
    add AX,SI
    xchg AX,BX
    cmp AX, 00
    jne check
    
    compare:
    pop AX
    cmp AX, BX
    jne exit
    
    flag:
    inc ispalindrome
    
    exit:
    

    mov AX, 4C00H
    int 21H
main endp