.MODEL SMALL
.STACK 100h
.DATA
char DB ?
mg1 DB 'Enter anything: $'  
newline db 0ah,0dh, '$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, mg1
    INT 21h
        
    MOV AH, 1
    INT 21h
    MOV char, AL 
    
    MOV CX, 30
    MOV BX, 0
    
    pl:
    MOV AH, 2
    MOV DL, char
    INT 21h
    INC BX
    
    CMP BX, 10
    JNE n
    
    MOV AH, 2
    MOV DL, newline
    INT 21h
    MOV BX, 0
    
    n:
    LOOP PRINT_LOOP 
    
    exit:
    MOV AH, 4CH
    INT 21h     
    MAIN ENDP
END MAIN