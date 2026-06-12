.model small
.stack 64
.data
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov BL, 65
    mov CX, 10
    call setVideoScr
    mov DX, 00H
    lowp:
    push CX
    call setCursorPos
    call printChar
    add DH, 1
    add DL, 2
    inc BL
    pop CX
    loop lowp
    
    mov AX, 4C00H
    int 21H
main endp

setVideoScr proc near
    mov AH, 00H
    mov AL, 03H
    int 10H
    ret
setVideoScr endp

setCursorPos proc near
    mov AH, 02H
    int 10H
    ret
setCursorPos endp

printChar proc near
    mov AH, 0AH
    mov AL, BL
    mov CX, 1
    int 10H
    ret
printChar endp