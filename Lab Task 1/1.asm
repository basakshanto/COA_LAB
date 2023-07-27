.MODEL SMALL
.STACK 100H
.DATA
.CODE 

MAIN PROC
    MOV AL, 'A' 
    
    CMP AL, 'A'
    JLE ELS     
    
    MOV CL, '5'
    JMP PR 
    JMP EXIT
    
ELS:
    MOV CL, '6'
    JMP PR
    JMP EXIT
PR:
    MOV AH, 2 
    ADD DL, CL
    INT 21H     
    
EXIT:
    MOV AH,4CH 
    INT 21H
    MAIN ENDP
END MAIN