.model small
.stack 64

.data
     byte db 1H, 2H, 3H, 4H, 5H, 6H, 0
     
.code
main proc near
    
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov CX, 3
    lea SI, byte
    lea DI, byte + 5
    reverse:
        mov AH, [SI]
        mov AL, [DI]
        
        mov [SI], AL
        mov [DI], AH
        
        inc SI
        dec DI  
    loop reverse
    
    mov AX, 4C00H
    int 21H
     
    
main endp