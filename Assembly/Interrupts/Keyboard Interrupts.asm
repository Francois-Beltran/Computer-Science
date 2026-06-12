.model small
.stack 64

.data

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov DL, 0FFH
    mov DH, 00H
    
    call setVideoscr
        
    lowp:
    inc DL
    call setCursorpos
    call readKeyboard
    cmp AL, 03H
    je exit
    call printChar
    cmp DL, 79
    je reset
    jmp continue
    
    reset:
    mov DL, 0FFH
    inc DH
    
    continue:
    jmp lowp
    
    exit:
     
    mov AX, 4C00H
    int 21H
main endp

setVideoscr proc near
    
    mov AH, 00H
    mov AL, 03H
    int 10H
    
    ret
    
setVideoscr endp

readKeyboard proc near
    
    mov AH, 08H
    int 21H
    
    ret
    
readKeyboard endp

printChar proc near
    
    mov AH, 09H
    mov BH, 00H
    mov BL, 27H
    mov CX, 1
    int 10H
    
    ret
    
printChar endp

setCursorpos proc near
    
    mov AH, 02H
    mov BH, 00H
    int 10H

    ret
setCursorpos endp
