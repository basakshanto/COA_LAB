.MODEL SMALL
.STACK 100h
.DATA
char DB ?
mg1 DB 'Enter a number: $'
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

    TEST char, 1
    JZ eve
    MOV AH, 2
    MOV DL, 'o'
    INT 21h
    JMP exit
    
    eve:
    MOV AH, 2
    MOV DL, 'e'
    INT 21h    
    
    exit:
    MOV AH, 4CH
    INT 21h 
    
MAIN ENDP
END MAIN