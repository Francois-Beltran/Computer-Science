.model small
.stack 64

.data

.code
    
    main proc near
        
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov AX, 5H
    mov BX, 3H
    mov CX, 2H
    
    first_check:
        cmp AX, BX
        jl ax_smaller
        
    second_check:
        cmp BX, CX
        jl bx_smaller
    
    cx_smaller:
        mov DX, 300H
        jmp done    
        
    ax_smaller:
        mov DX, 100H
        jmp done
        
    bx_smaller:
        mov DX, 200H
        jmp done
     
    done:    
     
    mov AX, 4C00H
    int 21H
    
    main endp
    
        
    
    