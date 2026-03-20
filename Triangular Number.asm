.model small
.stack 64

.data
     var dw 5
     trianglenum dw 0
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov AX,0
    lea SI, trianglenum
    mov CX, var
    
    triangle:
        add AX, CX
        
    loop triangle
    
    mov [SI],AX
 
    mov AX, 4C00H
    int 21H
main endp