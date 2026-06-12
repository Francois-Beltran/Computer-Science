.model small
.stack 64
.data
    cipher_table db "zydxwvutsrqponmlkjihgfedcb" 
    msg_input    db "Enter a lowercase letter: "
    msg_inputLength EQU  $ - msg_input
    
    msg_output   db "Encrypted letter: "
    msg_outputLength equ $ - msg_output

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    call setVideoScr
    
    mov DX, 0000H
    lea BP, msg_input
    mov CX, msg_inputLength
    call printString
    
    call receiveInput
    sub AL, 'a'
    lea BX, cipher_table
    xlat
    
    push AX
    
    mov DX, 0100H
    lea BP, msg_output
    mov CX, msg_outputLength
    call printString
    
    pop AX
    call printChar
    
    mov AX, 4C00H
    int 21H
main endp

setVideoScr proc near
    mov AX, 0003H
    int 10H
    ret
setVideoScr endp

receiveInput proc near
    mov AH, 01H
    int 21H
    ret
receiveInput endp

printString proc near
    mov AH, 13H
    mov AL, 01
    mov BH, 00
    mov BL, 07H
    int 10H
    ret
printString endp

printChar proc near
    mov AH, 0AH
    mov BH, 00H
    mov CX, 1
    int 10H
    ret
printChar endp