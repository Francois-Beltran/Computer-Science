.model small
.stack 64
.data

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    xor DX, DX
    call setVideoScr
    lowp:
        call receiveInput
        cmp AH, 48H
        je UP
        cmp AH, 50H
        je DOWN
        cmp AH, 4BH
        je LEFT
        cmp AH, 4DH
        je RIGHT
        cmp AL, 1BH
        je exit
        jne continue
        
        UP:
            call clearScr
            mov AL, 56H
            mov DH, 0
            mov DL, 40
            jmp print
            
        DOWN:
            call clearScr
            mov AL, 44H
            mov DH, 24
            mov DL, 40
            jmp print
            
        LEFT:
            call clearScr
            mov AL, 4CH
            mov DH, 12
            mov DL, 0
            jmp print
            
        RIGHT:
            call clearScr
            mov AL, 52H
            mov DH, 12
            mov DL, 79
    
    print:
        call setCursorPos    
        call printChar
    
    continue:
        jmp lowp
    
    exit:
        call clearScr
    
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

clearScr proc near
    mov AH, 06H
    mov AL, 00H
    mov BH, 07H
    mov CX, 0000H
    mov DX, 184FH 
    int 10H
    ret
clearScr endp

printChar proc near
    mov AH, 0AH
    mov BH, 00H
    mov CX, 1
    int 10H
    ret
printChar endp

receiveInput proc near
    mov AH, 00H
    int 16H
    ret
receiveInput endp
    