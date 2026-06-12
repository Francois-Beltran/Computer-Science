.model small
.stack 64
.data
    INPUT_MAX db 21
    INPUT_LENGTH db ?
    INPUT_STRING db 21 dup(0)

.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    call inputStr
    lea BP, INPUT_STRING
    mov CL, INPUT_LENGTH
    call printStr
    
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
    mov DH, 00H
    mov DL, 00
    int 10H
    ret
setCursorPos endp

scrollScr proc near
    mov AH, 06H
    mov BH, 07H
    mov CX, 0000H
    mov DX, 184FH
    int 10H
    ret
scrollScr endp

printCharATT proc near
    mov AH, 09H
    mov AL, 'A'
    mov BH, 00H
    mov BL, 0FH
    mov CX, 1
    int 10H
    ret
printCharATT endp

printChar proc near
    mov AH, 0AH
    mov AL, 'B'
    mov BH, 00H
    mov CX, 1
    int 10H
    ret
printChar endp

printStr proc near
    mov AH, 13H
    mov BH, 00H
    mov BL, 07H
    mov DX, 0100H
    int 10H
    ret
printStr endp

inputCharEcho proc near
    mov AH, 01H
    int 21H
    ret
inputCharEcho endp

inputCharWOUTEcho proc near
    mov AH, 08H
    int 21H
    ret
inputCharWOUTEcho endp

inputStr proc near
    mov AH, 0AH
    lea DX, INPUT_MAX
    int 21H
    ret
inputStr endp  

getKeystroke proc near
    mov AH, 00H
    int 16H
    ret
getKeystroke endp

clearBuffer proc near
    mov AH, 01H
    int 16H
    ret
clearBuffer endp