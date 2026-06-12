.model small
.stack 64
.data
    month db 'January$$'
          db 'February.'
          db 'March....'
          db 'April....'
          db 'May......'
          db 'June.....'
          db 'July.....'
          db 'August...'
          db 'September'
          db 'October..'
          db 'November.'
          db 'December.'
          
    msg db 'Enter Number: '
    msgLength equ $-msg
    
    multiplicator db 2
    
    input_max db 3
    input_length db ?
    input_str db 3 dup(0)
    
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    call setVideoScr
    
    mov DX, 0000H
    call setCursorPos 
    
    xor CX, CX
    mov CL, msgLength
    lea BP, msg
    call outputStr
    
    call inputStr
    xor AH, AH
    mov AL, input_str[0]
    sub AL, 30H
    mov CL, input_length
    cmp CL, 2
    je twoDigits
    jmp print
    
    twoDigits:
        mov CL, 10
        mul CL
        add AL, input_str[1] 
        sub AL, 30H
    print:
    dec AL
    mov CL, 9
    mul CL
    push AX
    lea BX, month
    
    xor CX, CX
    mov CL, 9
    mov DX, 0100H
    lea BP, month
    pop BP
    call outputStr
    
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
    lea DX, input_max
    int 21H
    ret
inputStr endp

outputStr proc near
    mov AH, 13H
    mov AL, 1
    mov BH, 00H
    mov BL, 0FH
    int 10H
    ret
outputStr endp