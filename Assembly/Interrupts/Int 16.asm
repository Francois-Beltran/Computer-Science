.model small
.stack 64
.data
    character db 0

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov DX, 00H
    mov CX, 10
    call setVideoScr
    call receiveInput
    mov character, AL
    call setColor
    cmp AH, 20H
    je red
    
    mov BL, 02H
    jmp lowp
    
    red:
        mov BL, 04H
    
    lowp:
    push CX
    call setCursorPos 
    

    continue:
        mov AL, character
        call printChar
        inc DH
        inc DL
        pop CX
        loop lowp
    
    call receiveInput
    
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
    mov BH, 00H
    int 10H
    ret
setCursorPos endp

printChar proc near
    mov AH, 09H
    mov BH, 00H
    mov CX, 1
    int 10H
    ret
printChar endp

receiveInput proc near
    mov AH, 07H
    int 21H
    ret
receiveInput endp

setColor proc near
    mov AH, 00H
    int 16H
    ret
setColor endp