.model small
.stack 64

.data
    numList dw 12, 45, 7, 89, 22

.code
main PROC near 
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    mov CX, 5
    lea SI, numList
    mov DX, numList
    
    searching:
        cmp [SI], DX
        jle skip
        mov DX, [SI]
        
    skip:
        add SI, 2
        loop searching
        
    mov AX, 4C00h
    int 21h  
    
main ENDP






