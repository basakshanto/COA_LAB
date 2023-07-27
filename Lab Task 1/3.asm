.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AX, 0CH
    MOV BX, 2CH   
    
    CMP AX, BX
    JE T1
    JG E1

    T1:
        MOV AX, 0
        JMP EXIT
    E1:
        CMP BX, CX
        JE T2
        JG E2
    T2:
        MOV BX, 0
        JMP EXIT
    E2:
        MOV CX, 0
        JMP EXIT
    
    EXIT: 
        MOV AH, 4CH 
        INT 21H     
    MAIN ENDP
END MAIN