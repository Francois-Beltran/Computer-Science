.model small
.stack 64
.data
    sourceStr db "Assembly is fun!"
    destinStr db "----------------$"
    vowels db "AEIOUaeiou"

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea SI, sourceStr
    lea DI, destinStr
    mov CX, 16
        lowp:
            push CX
            push DI
            lea DI, vowels
            mov CX, 10 
            lodsb
            cld
        
            repne scasb
            pop DI
            pop CX
            je change
        
            remain:
                stosb
                jmp continue
            change:
                mov AL, '*'
                stosb
        continue:
        loop lowp
            
    call setVideoScr
    call printStr
            
    mov AX, 4C00H
    int 21H
main endp

setVideoScr proc near
    mov AX, 0003H
    int 10H
    ret
setVideoScr endp

printStr proc near
    mov AH, 09H
    lea DX, destinStr
    int 21H
    ret
printStr endp