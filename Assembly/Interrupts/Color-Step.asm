.model small
.stack 64
.data

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov DX, 0C28H
    call setVideoScr
    mov BL, 07H
    call setCursorPos
    call printChar
    
    lowp:
    call receiveInput
    cmp AL, 2BH
    je plus
    cmp AL, 2DH
    je minus
    cmp AL, 1BH
    je exit
    
    jmp lowp
    
    minus:
    cmp DH, 00H
    je lowp
    dec DH
    dec DL
    jmp setup
    
    plus:
    cmp DH, 18H
    je lowp  
    inc DH
    inc DL
    
    setup:
    call setCursorPos
    
    cmp DH, 12
    mov BL, 07H
    je print
    
    cmp DH, 13
    jge green
    
    mov BL, 04H
    jmp print
    
    green:
    mov BL, 02H
    
    print: 
    call printChar
    jmp lowp
    
    exit:
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
    mov AL, 65
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

