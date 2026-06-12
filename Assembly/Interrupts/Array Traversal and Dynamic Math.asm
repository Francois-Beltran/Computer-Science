.model small
.stack 64
.data
    grades db 75, 82, 99, 64, 97
    gradesLength EQU $ - grades

.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    xor AX, AX
    lea SI, grades
    mov CX, gradesLength
    
    lowp:
        lodsb
        add AL, 5
        cmp AL, 100
        ja max
        
        mov [SI-1], AL
        jmp continue
        
        max:
            mov AL, 100
            mov [SI-1], AL
    continue:
        loop lowp
        
    mov AX, 4C00H
    int 21H
main endp