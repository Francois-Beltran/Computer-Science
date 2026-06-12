.model small
.stack 64
.data
    msgInput db 'Enter Password: '
    msgInputLength equ $-msgInput
    
    invalidPass db 'Invalid Password!'
    invalidLength equ $-invalidPass
    
    retryPass db 'Retry: '
    retryLength equ $-retryPass
    
    success db 'Logged in!'
    successLength equ $-success
    
    sourceI db 'Password'
    
    maxLength db 9
    actualLength db ?
    string db 9 dup(0)
   
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX 
    
    call set_color
    
    mov CX, msgInputLength
    lea BX, msgInput
    call printString
    
    lea DX, maxLength
    call inputString
    
    mov DX, 0100H
    
    checking:
    lea SI, sourceI
    lea DI, string
    xor CX, CX
    mov CL, actualLength
    cld
    repe cmpsb
    jne retry
    jmp correct
    
    
    retry:
        
        lea BP, invalidPass
        mov CX, invalidLength
        mov DX, 0100H
        call printString
        
        lea BP, retryPass
        mov CX, retryLength
        mov DX, 0200H
        call printString
        
        lea DX, maxLength
        call inputString
        call clearScr
        jmp checking
        
        
    correct:
        call clearScr
        lea BP, success
        mov CX, successLength
        mov DX, 0000H
        call printString
    
    mov AX, 4C00H
    int 21H
main endp         

inputString proc near
    mov AH, 0AH
    int 21H
    ret
inputString endp

printString proc near
    mov AH, 13H
    mov AL, 1
    mov BH, 00H
    mov BL, 0EH
    int 10H
    ret
printString endp

set_color proc near
    mov ah, 09h
    mov al, ' '
    mov bh, 00H
    mov bl, 0EH
    mov cx, 2000
    int 10h
    
    ret
    
set_color endp

clearScr proc near
    mov AH, 07H
    mov AL, 00H
    mov BH, 0EH
    mov CX, 0000H
    mov DX, 184FH
    int 10H
    ret
clearScr endp 


    