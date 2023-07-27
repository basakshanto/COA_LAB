.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 0Dh,0Ah, "ENTER A CHARACTER: $"
HEXA DB 0Dh,0AH,"HEXA VALUE: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LOOPING:
    MOV AH,9
    MOV DX,OFFSET MSG1
    INT 21H
    
    MOV AH, 1
    INT 21H
    XOR AH, AH
    MOV BX, AX 
    
    CMP BL, 0Dh
    JE EXIT
    
    MOV AH, 9
    MOV DX, OFFSET HEXA
    INT 21H
    
    PRINT:
    MOV CX,4
    MOV AX,BX
    
    HEX:
    JCXZ LOOPING 
    ROL AX,4    
    MOV DL,AL
    AND DL,0xF
    ADD DL,'0'
    CMP DL,'9'   
    JBE digit  
    ADD DL,7
    digit:
    PUSH AX
    MOV AH,2
    INT 21h
    POP AX
    LOOP HEX  
    
    JMP LOOPING      
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN