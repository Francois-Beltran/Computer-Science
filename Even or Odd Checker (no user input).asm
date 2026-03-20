.model small
.stack 64

.data
    word1 dw 0H   
     
.code           
    
    main proc near
        
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov AX, word1
    test AX, 1
    jz even
    mov BX, 0
    jmp exit
    
    
    even:
        mov bx, 1H
    
    exit:
    
    mov AX, 4C00H
    int 21H
    main endp