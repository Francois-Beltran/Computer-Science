.model small
.stack 64

.data
    list db 10H, 20H, 30H, 20H, 40H, 20H, 50H
    target db 20H
    replacement db 0FFH

.code
main proc near
    
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea SI, list
    mov CX, 7
    mov DX, 0
    mov BH, target
    mov BL, replacement
    
    checking:
        cmp [SI], BH
        jne skip
        mov [SI], BL
        inc DX
    
    skip:
        inc SI
    loop checking
    
            
    mov AX, 4C00H
    int 21H         
main endp