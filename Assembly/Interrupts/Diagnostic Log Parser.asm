.model small
.stack 64
.data 
    PRIORITY_TBL  db  'I', 'W', 'E', 'C', 'F', 'S'  
    
    PROMPT        db  'Enter Log Code: '            
    PROMPT_LEN    equ $-PROMPT
    
    INPUT_MAX     db  9                             
    INPUT_LEN     db  ?                             
    INPUT_STR     db  9 dup(0)                      
    
    RESULT_MSG    db  'System Status: [ ]'
    RESULT_LEN    equ $-RESULT_MSG

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    call setVideoScr
    mov DX, 0205H
    call setCursorPos
 
    lea BP, PROMPT
    mov CX, PROMPT_LEN
    mov BL, 0FH   
    call outputStr
    
    call inputStr
    
    mov AL, 20H
    xor CX, CX
    mov CL, INPUT_LEN
    lea DI, INPUT_STR
    repne scasb
    je exit    
         
    mov AL, INPUT_STR[0]
    sub AL, 30H
    lea BX, PRIORITY_TBL
    xlat
    
    mov RESULT_MSG[16], AL
    
    call clearScr
    mov DX, 0C1EH
    call setCursorPos
    
    lea BP, RESULT_MSG
    mov CX, RESULT_LEN
    mov BL, 01EH
    call outputStr  
      
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

inputStr proc near
    mov AH, 0AH
    lea DX, INPUT_MAX
    int 21H
    ret
inputStr endp

outputStr proc near
    mov AH, 13H
    mov AL, 1
    mov BH, 00H
    int 10H
    ret
outputStr endp

clearScr proc near
    mov AH, 06H
    mov AL, 00H
    mov BH, 1EH
    mov CX, 0000H
    mov DX, 184FH
    int 10H
    ret
clearScr endp