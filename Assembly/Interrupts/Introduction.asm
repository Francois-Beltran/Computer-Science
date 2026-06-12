.model small
.stack 64

.data

.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    call setVideoMode
    ;call scrollSrc
    mov DH, 0CH
    mov DL, 28H
    call setCursorPos
    mov AL, 01H
    call displayChar
    mov DH, 0CH
    mov DL, 2DH
    call setCursorPos  
    mov AL, 'A'
    call displayChar
    
    mov AX, 4C00H
    int 21H
main endp

setVideoMode proc near
    mov AH, 00H
    mov AL, 03H
    int 10H
    
    ret
setVideoMode endp

scrollSrc proc near
    mov AH, 06H
    mov AL, 00H
    mov BH, 17H
    mov CX, 0000H
    mov DX, 1800H
    int 10H
    
    ret
scrollsrc endp

setCursorPos proc near
    mov AH, 02H
    mov BH, 00H
    
    int 10H
    
    ret
setCursorPos endp

displayChar proc near
    mov AH, 09H
    mov BH, 00H
    mov BL, 16H
    mov CX, 5
    int 10H
    
    ret
displayChar endp