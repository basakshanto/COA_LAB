.MODEL SMALL
.STACK 100h
.DATA
char DB ? 
mg1 DB 'Enter anything: $'
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

    PL:
    MOV AH, 2 
    MOV DL, char 
    INT 21h 
    LOOP PL 
    
    EXIT:
    MOV AH, 4CH 
    INT 21h 
    MAIN ENDP
END MAIN