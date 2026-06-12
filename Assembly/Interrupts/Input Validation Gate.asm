.model small
.stack 64
.data
    msgInput db "Enter a Lowercase Letter: "
    msgInputLength equ $ - msgInput
    
    msgError db "Invalid Input!"
    msgErrorLength equ $ - msgError

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX 
    
    call setVideoScr
    xor DX, DX
    lea BP, msgInput
    mov CX, msgInputLength
    mov BL, 07H
    call printString
    
    call receiveInput
    
    cmp AL, 61H
    jb invalid
    
    cmp AL, 7AH
    ja invalid
    
    xor AH, AH
    push AX
    
    mov DH, 02H
    mov DL, 00H
    call setCursorPos
    
    pop AX
    call printChar
    jmp exit
    
    invalid:
        lea BP, msgError
        mov CX, msgErrorLength
        mov DX, 0200H 
        mov BL, 04H
        call printString
        
    exit:
    
    
    mov AX, 4C00H
    int 21H
main endp

setVideoScr proc near
    mov AX, 0003H
    int 10H
    ret
setVideoScr endp

setCursorPos proc near
    mov AH, 02H
    mov BH, 00H
    int 10H
    ret
setCursorPos endp

printString proc near
    mov AH, 13H
    mov AL, 1
    mov BH, 00H
    int 10H
    ret
printString endp

printChar proc near
    mov AH, 09H
    mov BH, 00H
    mov BL, 0AH
    mov CX, 1
    int 10H
    ret
printChar endp

receiveInput proc near
    mov AH, 01H
    int 21H
    ret
receiveInput endp