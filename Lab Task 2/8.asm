.MODEL SMALL
.STACK 100h
.DATA
MG1 DB 'Enter anything: $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, 2
    
    CMP AL, 2
    JLE EEEE
    CMP AL, 9
    JGE EEEE

    MOV AH, 9
    LEA DX, MG1
    INT 21h
    
    MOV AH, 1
    INT 21h
    MOV DL, AL
    MOV AH, 2
    INT 21h
    
    JMP EXIT
    
    EEEE:
    MOV AH, 1
    INT 21h
    CMP AL, 'a'
    JL N
    CMP AL, 'z'
    JG UPP
    JMP C

    UPP:
    CMP AL, 'A'
    JL N
    CMP AL, 'Z'
    JG N
    JMP C
    
    C:
    MOV AH, 02H
    MOV DL, 'c'
    INT 21h
    
    JMP EXIT    
    
    N:
    MOV AH, 02H
    MOV DL, 'n'
    INT 21h    
    
    EXIT:
    MOV AH, 4CH
    INT 21h    
    MAIN ENDP
END MAIN