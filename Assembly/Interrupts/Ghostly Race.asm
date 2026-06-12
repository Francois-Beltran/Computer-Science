.model small
.stack 64
.data
    endText db "FINISH!"
    endTextLength equ $ - endText

.code 
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
  
    call setVideoScr
    xor DX, DX
    mov DX, 0500H
    call setCursorPos
    
    game_lowp:
    
        call printX
        inc DL
        call setCursorPos
        call getKey
        jz game_lowp
        
        cmp AL, 20H
        je exit
        
        call cleanBuffer
        jmp game_lowp
        
    exit:
    
    call printString
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

printX proc near
    mov AH, 09H
    mov AL, 'X'
    mov BH, 00H
    mov BL, 0EH
    mov CX, 1
    int 10H
    ret
printX endp

getKey proc near
    mov AH, 01H
    int 16H
    ret
getKey endp

clearScr proc near
    mov AH, 06H
    mov AL, 00H
    mov CX, 0000H
    mov DX, 184FH
    mov BH, 00H
    int 10H
    ret
clearScr endp

cleanBuffer proc near
    mov AH, 00H
    int 16H
    ret
cleanBuffer endp

printString proc near
    mov AH, 13H
    mov AL, 1
    lea BP, endText
    mov BH, 00H
    mov BL, 02H
    mov DX, 0100H
    mov CX, endTextLength
    int 10H
    ret
printString endp 