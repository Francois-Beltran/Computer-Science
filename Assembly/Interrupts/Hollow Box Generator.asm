.model small
.stack 64
.data
    characs db 65
    color db 04H, 02H, 01H, 0EH, 07H
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov DX, 0A23H
    mov CX, 50
    lea SI, characs
    lea DI, color
    mov BL, [DI] 
    call setVideoScr
       
    lowp:
    push CX
    call setCursorPos
    mov AL, [SI]
    call printChar
    inc DL
    cmp DL, 2DH
    je reset
    
    jmp continue
    
    reset:     
    inc DH
    mov DL, 23H
    inc DI
    mov BL, [DI]
    
    continue:
    inc [SI]
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
    mov AH, 08H
    int 21H
    ret
receiveInput endp