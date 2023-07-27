.MODEL SMALL
.STACK 100H
.DATA
MSG1 db 0Dh,0Ah, "ENTER A CHARACTER: $"
BINARYY DB 0Dh,0AH,"BINARY VALUE: $"  
C_MSG db 0Dh, 0Ah,  'NUMBER OF 1 BITS: $'
COUNT db 0 
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
    MOV BL, AL 
    
    MOV AH, 9
    MOV DX, OFFSET BINARYY
    INT 21H
    MOV CX, 8
    
    PRINT:
    SHL BL, 1
    JC BIT
    MOV DL, '0'
    JMP CHARR 
    
    BIT:
    MOV DL, '1'
    INC COUNT 
    
    CHARR:
    MOV AH, 2
    INT 21h
    DEC CX
    JNZ PRINT 
    
    MOV DL, 0AH
    MOV AH, 2
    INT 21H

    MOV AH, 9
    MOV DX, OFFSET C_MSG
    INT 21H

    MOV DL , COUNT
    ADD DL, '0'

    MOV AH, 2
    INT 21H 
         
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN  
