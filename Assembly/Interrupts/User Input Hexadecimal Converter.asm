.model small
.stack 64
.data
    raw_value db 2
    hex_table db "0123456789ABCDEF"

.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    call setVideoScr
    mov DX, 0000H
    call setCursorPos
    call inputChar
    sub AL, 30H
    cmp AL, 1
    je check
    
    lea BX, hex_table
    xlat
    
    mov DX, 0300H
    call setCursorPos
    call printChar
    jmp exit

    check:
        inc DL
        call setCursorPos
    
        call inputChar
        cmp AL, 0DH
        je as_is
        sub AL, 30H
        cmp AL, 0
        je prent
        cmp AL, 1
        je prent
        cmp AL, 2
        je prent
        cmp AL, 3
        je prent
        cmp AL, 4
        je prent
        cmp AL, 5
        je prent
        jmp exit
        
    prent:
    add AL, 10
    lea BX, hex_table
    xlat
    
    mov DX, 0300H
    call setCursorPos
    call printChar
    
    jmp exit
    
    as_is:
    mov AL, 01H
    lea BX, hex_table
    xlat
    
    mov DX, 0300H
    call setCursorPos
    call printChar
    
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

printChar proc near
    mov AH, 09H
    mov BH, 00H
    mov BL, 0FH
    mov CX, 1
    int 10H
    ret
printChar endp

inputChar proc near
    mov AH, 01H
    int 21H
    ret
inputChar endp