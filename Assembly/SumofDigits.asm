.model small
.stack 64

.data
 
    num dw 103
.code

mov AX,@data
mov ES,AX
mov DS,AX

mov BX,00
mov AX,num
mov CX, 10

check:
mov DX,00
div CX
add BX, DX
cmp AX, 00
je exit
jmp check

exit:

mov AX, 4C00H
int 21H