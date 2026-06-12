.model small
.stack 64
.data
    matrix db 13 dup('$')
    transposedMatrix db 13 dup('$')
    
    msgInput db 'Input: '
    msgInputLength equ $-msgInput
    
    msgOutput db 'Matrix: '
    msgOutputLength equ $-msgOutput
    
    resultOutput db 'Transposed Matrix: '
    resultOutputLength equ $-resultOutput
    
    row db 4
    column db 3
    
.code
main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    call setVideoScr
    
    lea BP, msgInput
    mov CX, msgInputLength
    mov DX, 0000H
    call printString
    
    mov CX, 12
    lea DI, matrix
    lowp:
        call inputChar
        stosb
    loop lowp
    
    lea BP, msgOutput
    mov CX, msgOutputLength
    mov DX, 0100H
    call printString
    
    mov DX, 0200H
    lea SI, matrix
    printMatrix:
        cmp SI, 4
        je change_row
        cmp SI, 8
        je change_row
        
        print:
        call setCursorPos
        lodsb
        cmp AL, '$'
        je continue
        call printChar
        inc DL
        call setCursorPos
        mov AL, ','
        call printChar
        inc DL
        
        jmp printMatrix
        
        change_row:
            inc DH
            xor DL, DL
            jmp print
            
    continue:
        lea BP, resultOutput
        mov CX, resultOutputLength
        inc DH
        xor DL, DL 
        call printString        
        
    lea SI, matrix
    lea DI, transposedMatrix    
    call transposeMatrix
    
    mov SI, 1
    call transposeMatrix
    
    mov SI, 2
    call transposeMatrix
    
    mov SI, 3
    call transposeMatrix
    
    inc DH
    xor DL, DL
    lea SI, transposedMatrix
    printTransMatrix:
        xor AX, AX
        lodsb
        push AX
        cmp AL, '$'
        je exit
        cmp DL, 6
        je reset
        
        abc:
        call setCursorPos 
        
        pop AX
        call printChar
        inc DL
        call setCursorPos
        mov AL, ','
        call printChar
        inc DL
        
        jmp printTransMatrix
        
        reset:
            xor DL, DL
            inc DH
            jmp abc 
         
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

inputChar proc near
    mov AH, 01H
    int 21H
    ret
inputChar endp

printString proc near
    mov AH, 13H
    mov AL, 1
    mov BH, 00H
    mov BL, 0FH
    int 10H
    ret
printString endp

printChar proc near
    mov AH, 09H
    mov BH, 00H
    mov BL, 0EH
    mov CX, 1
    int 10H
    ret
printChar endp

transposeMatrix proc near
    mov CX, 3
    trans:
        mov AL, [SI]
        mov [DI], AL
        add SI, 4
        inc DI
    loop trans
    
    ret
transposeMatrix endp
    
    
    

