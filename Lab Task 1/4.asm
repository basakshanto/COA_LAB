.MODEL SMALL
.STACK 100H
.DATA
msg1 DB ' Enter Anything: $'
msg2 DB 0Dh, 0Ah, 'Do you wanna repeat the action? (Y/N): $'
msg3 DB 0Dh, 0Ah, 'Illegal Character. Please try again. $'
newline DB 0Dh, 0Ah, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    repeat:
    LEA DX, msg1
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    MOV BL, AL
   
    LEA DX, newline
    MOV AH, 9
    INT 21H
    MOV DL, BL
    MOV AH, 2
    INT 21H

    LEA DX, msg2
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    CMP AL, 'y'
    JE repeat
    CMP AL, 'Y'
    JE repeat

    CMP AL, 'n'
    JE EXIT
    CMP AL, 'N'
    JE EXIT

    LEA DX, msg3
    MOV AH, 9
    INT 21H
    JMP repeat
    
    EXIT:
    MOV AH, 4Ch
    INT 21H
    MAIN ENDP
END MAIN