.model small
.stack 100h

.data
    message db 10, 13, 'Enter an alphabet: $'
    prompt db 10, 13, 'Enter two numbers: $'
    result db 10, 13, 'Sum: $'
    alpha db ?

.code
    mov ax, @data
    mov ds, ax
    
    ; Print message and read input alphabet
    mov ah, 9
    lea dx, message
    int 21h
    
    mov ah, 1
    int 21h
    mov bl, al
    
    ; Check if lowercase letter
    cmp bl, 'a'
    jl not_lowercase
    cmp bl, 'z'
    jg not_lowercase
    
    ; Prompt for two numbers
    mov ah, 9
    lea dx, prompt
    int 21h
    
    ; Read first number
    mov ah, 1
    int 21h
    sub al, '0'
    mov bh, al
    
    ; Read second number
    mov ah, 1
    int 21h
    sub al, '0'
    add bh, al
    
    ; Display the sum
    mov ah, 9
    lea dx, result
    int 21h
    
    ; Convert sum to ASCII and display
    add bh, '0'
    mov dl, bh
    mov ah, 2
    int 21h
    
    jmp exit
    
not_lowercase:
    ; Display error message
    mov ah, 9
    lea dx, message
    int 21h
    
exit:
    mov ah, 4Ch
    int 21h
end
