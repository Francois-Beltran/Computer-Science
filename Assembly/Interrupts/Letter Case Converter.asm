.model small
.stack 64
.data
    msgInput db "Enter Uppercase: "
    msgInputLength equ $ - msgInput
    
    msgOutput db "Lowercase: "
    msgOutputLength equ $ - msgOutput
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    call setVideoScr
    mov CX, msgInputLength
    mov DX, 0000H
    lea BP, msgInput
    call printString
    call receiveInput
    
    add AL, 20H
    xor AH, AH
    push AX
    
    mov CX, msgOutputLength
    mov DX, 0100H
    lea BP, msgOutput
    call printString
    xor AX, AX
    pop AX
    call printChar
    
    
    mov AX, 4C00H
    int 21H
main endp

setVideoScr proc near
    mov AX, 0003H
    int 10H
    ret
setVIdeoScr endp

receiveInput proc near
    mov AH, 01H
    int 21H
    ret
receiveInput endp

printChar proc near
    mov AH, 0AH
    mov BH, 00H
    mov CX, 1
    int 10H
    ret
printChar endp

printString proc near
    mov AH, 13H
    mov AL, 1
    mov BH, 00H
    mov BL, 07H
    int 10H
    ret
printString endp