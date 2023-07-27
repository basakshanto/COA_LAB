.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 0DH, 0AH, 'ENTER A BINARY NUMBER (UP TO 16 PRINTS): $'
HEXAA DB 0DH, 0AH, 'HEXA VALUE: $'
ERROR DB 0DH, 0AH, 'ERROR: ILLEGAL CHARACTER DETECTED.$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    JMP ENTER
    
    ERROR_FINDING:
    MOV AH, 9
    MOV DX, OFFSET ERROR
    INT 21H
    
    ENTER:
    MOV AH, 9
    MOV DX, OFFSET MSG1
    INT 21h

    XOR BX, BX
    MOV CX, 16

    MOV AH,1
    INT 21H
    
    WHILE:
    CMP AL, 0DH
    JE END
    
    CMP AL, '0'
    JL ERROR_FINDING
    
    CMP AL, '1'
    JG ERROR_FINDING

    AND AL, 0Fh
    SHL BX, 1
    OR BL,AL

    DEC CX
    JZ END
    INT 21H
    JMP WHILE
    
    END:
    MOV AH, 9
    MOV DX, OFFSET HEXAA
    INT 21H

    
    PRINT_HEX:
    MOV CX,4
    MOV AX,BX
    
    HEX:
    JCXZ EXIT
    ROL AX,4
    MOV DL,AL
    
    AND DL,0xF
    ADD DL,'0'
    CMP DL,'9'
    JBE PRINT
    ADD DL,7
    
    PRINT:            
    PUSH AX
    MOV AH,2
    INT 21H
    POP AX
    LOOP HEX
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN