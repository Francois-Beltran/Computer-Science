.model small
.stack 64
.data
    source db "ABCDE"
    dest db "00000"

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea SI, source
    lea DI, dest
    mov CX, 5
    
    rep movsb
    
    call reverseString
    
    mov AX, 4C00H
    int 21H
main endp

reverseString proc near
    lea SI, dest
    mov CX, 2
    



reverseString endp