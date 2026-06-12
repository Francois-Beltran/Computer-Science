.model small
.stack 64
.data
    msg_input db "Enter String: "
    msgInputLength equ $ - msg_input
    
    ;PARA_LIST LABEL BYTE
    MAX_LEN DB 11  
    ACT_LEN DB ? 
    KB_DATA DB 11 DUP(' ')
    
    msg_output db "Result: "
    msgOutputLength equ $ - msg_output
    
    resultOutput db 10 dup(' ')
    resultOutputLength equ $ - resultOutput  

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX

    call setVideoScr
    lea BP, msg_input
    mov DX, 0000H
    mov CX, msgInputLength
    call printString
    
    lea DX, MAX_LEN
    call inputString
    
    lea BP, msg_output
    mov DX, 0100H
    mov CX, msgOutputLength
    mov BX, DX
    add BX, CX
    push BX
    call printString
    
    pop BX
    xor CX, CX
    mov CL, ACT_LEN
    mov DX, BX
    lea SI, KB_DATA
    lea DI, resultOutput
    
    rep movsb
    
    mov CL, ACT_LEN
    lea SI, resultOutput
    
    lowp:
        mov AL, [SI]
        cmp AL, 61H
        jb continue
        
        cmp AL, 7AH
        ja continue
        
        changeCase:
            sub AL, 20H
            mov [SI], AL
            
        continue:
            inc SI
     loop lowp
     
     lea BP, resultOutput
     mov CX, resultOutputLength
     call printString
        
    mov AX, 4C00H
    int 21H
main endp

setVideoScr proc near
    mov AX, 0003H
    int 10H
    ret
setVideoScr endp

printString proc near
    mov AH, 13H
    mov AL, 1
    mov BH, 00H
    mov BL, 07H
    int 10H
    ret
printString endp

inputString proc near
    mov AH, 0AH
    int 21H
    ret
inputString endp