.model small
.stack 64

.data
    array dw 12, 13, 14, 23, 24
    total dw 0

.code
main proc near
mov AX, @data
mov ES, AX
mov DS, AX

mov AX, 00
mov CX, 5
mov DX, 00
lea SI, array

acc:

    mov AX, [SI]
    add DX, AX
    add SI, 2
    
loop acc

lea SI, total
mov [SI], DX
    
mov AX, 4C00H
int 21H
main endp