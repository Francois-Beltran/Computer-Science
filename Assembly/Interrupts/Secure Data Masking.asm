.model small
.stack 64
.data
    CIPHER_TABLE  db  'XYZABCDEFGHIJKLMNOPQRSTUVW' 
    
    USER_INPUT    db  8 dup(?)       ; To store the 8 characters from the keyboard
    PROCESSED_STR db  8 dup(?)       ; To store the final masked/translated bytes
    BACKUP_STR    db  8 dup(?)       ; To store the final replicated string

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea DI, USER_INPUT
    mov CX, 8
    
    inputLoop:
        call inputChar
        stosb
    loop inputLoop
    
    filter:
        mov CX, 8
        lea DI, USER_INPUT
        mov AL, 20H
        repne scasb
        je error
       
    mov CX, 8
    lea SI, USER_INPUT
    lea DI, PROCESSED_STR
    lea BX, CIPHER_TABLE    
    processing:
        xor AX, AX
        lodsb
        cmp AL, 41H 
        jb caseB
        cmp AL, 5AH
        ja caseB
        
        caseA:
            sub AL, 41H
            xlat
            stosb
            jmp continue
        
        caseB:
            mov AL, '*'
            stosb
            
    continue:
        
    loop processing
    
    duplicate:
        lea SI, PROCESSED_STR
        lea DI, BACKUP_STR
        mov CX, 8
        rep movsb
        
    success:
        mov DX, 1111H
        jmp exit
    
    error:
        mov DX, 0EEEEH
            
    exit:
    
    mov AX, 4C00H
    int 21H
main endp

inputChar proc near
    mov AH, 01H
    int 21H
    ret
inputChar endp



