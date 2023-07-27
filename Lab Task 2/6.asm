.MODEL SMALL
.STACK 100h
.DATA
mg2 DB ?
mg1 DB 'Enter anything: $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LOOPP:
    MOV AH, 9
    LEA DX, mg1
    INT 21h
        
    MOV AH, 1
    INT 21h
    MOV mg2, AL 
    
    CMP mg2, 0DH
    JE exit
    
    MOV AH, 2 
    MOV DL, mg2 
    INT 21h 
    
    JMP LOOPP
    exit:
    MOV AH, 4CH 
    INT 21h     
    MAIN ENDP
END MAIN