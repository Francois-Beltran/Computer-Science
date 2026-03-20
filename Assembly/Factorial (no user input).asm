.model small
.stack 64

.data
    result dw 0
.code         

main proc near
    
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov AX, 1
    mov CX, 4
    lea SI, result
    
    call calcFactorial
    
    mov [SI], AX
    
    mov AX, 4C00H
    int 21H
    
main endp

calcFactorial proc
    
    calc:
        jcxz exit
        mul CX          
    loop calc
    
    exit:
    ret


calcFactorial endp


        
