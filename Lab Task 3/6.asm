.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV DX, 5
    MOV AH, 1
    INT 21H
    AND AL, 0FH
    
    MOV CL, AL
    SHL DX, CL
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H 
MAIN ENDP
END MAIN