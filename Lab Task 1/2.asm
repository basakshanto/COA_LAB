.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH, 1 
    INT 21H         
    CMP AL, 'A' 
    JE CARRIAGE
    
    CMP AL, 'B' 
    JNE LF  
    
    JMP EXIT    
    LF: 
        MOV AH, 2 
        MOV DL, 0AH 
        INT 21H     
        JMP EXIT  
    
    CARRIAGE: 
        MOV AH, 2 
        MOV DL, 0DH 
        INT 21H     
        JMP EXIT   
    
    EXIT: 
        MOV AH, 4CH 
        INT 21H     
    MAIN ENDP
END MAIN