.model small                                                                                     
.stack 64

.data
    word db 'N', 'A', 'T'

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea SI, word
    
    call setVideo
    mov DH, 00H
    mov DL, 00H
    call setCursorPos
    mov CL, 03
    lowp:
    push CX
    mov AL, [SI]
    inc SI 
    call displayChar
    inc DL
    call setCursorPos
    pop CX
    loop lowp
    
    mov AX, 4C00H
    int 21H
main endp

setVideo proc near
    mov AH, 00H
    mov AL, 03H
    int 10H
   
    ret
setVideo endp

setCursorPos proc near
    mov AH, 02H
    int 10H
    
    ret
setCursorPos endp

scrollscr proc near
    mov AH, 06H
    mov AL, 00H
    mov BH, 10H
    mov CX, 0000H
    mov DX, 174FH
    int 10H
    
    ret
scrollscr endp

displayChar proc near
    mov AH, 09H
    mov BL, 0FH
    mov CX, 1H
    int 10H
    
    ret
displayChar endp

