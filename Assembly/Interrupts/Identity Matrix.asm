.model small
.stack 64
.data
    MATRIX      db  1, 0, 0, 0, 1, 0, 0, 0, 1
                
    MSG_VALID   db  'VALID IDENTITY'
    V_LEN       equ $-MSG_VALID
    
    MSG_INVALID db  'INVALID MATRIX'
    I_LEN       equ $-MSG_INVALID
    
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
                              
    xor CX, CX
    mov CL, 9
    lea SI, MATRIX
    xor AX, AX 
    xor DX, DX
    
    lowp:
    lodsb
    cmp DL, 0
    je checkfor1
    cmp DL, 4
    je checkfor1
    cmp DL, 8
    je checkfor1
    
    cmp AL, 0
    jne invalid
    jmp continue
        
    checkfor1:
        cmp AL, 1
        jne invalid
        jmp continue
         
    continue:
    inc DL
    loop lowp
    
    push DX
     
    mov BH, 2FH
    call clearScr
    
    call setCursorPos
    mov BL, 2FH 
    lea BP, MSG_VALID
    mov CX, V_LEN
    call printStr
    jmp exit
    
    invalid:
    
    push DX
    mov BH, 4FH
    call clearScr
    
    call setCursorPos
    mov BL, 4FH
    lea BP, MSG_INVALID
    mov CX, I_LEN
    call printStr
    
    
    exit:
    
    pop DX

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
    mov DX, 0C1EH
    int 10H
    ret
setCursorPos endp 

clearScr proc near
    mov AH, 06H
    mov AL, 00H
    mov CX, 0000H
    mov DX, 184FH
    int 10H
    ret
clearScr endp

printStr proc near
    mov AH, 13H
    mov AL, 1
    mov BH, 00H
    int 10H
    ret
printStr endp