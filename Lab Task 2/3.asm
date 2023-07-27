.MODEL SMALL        
.STACK 100h         
.DATA              
MG1 DB 'Enter anything: $'  
.CODE           
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9     
    LEA DX, MG1 
    INT 21H         

    MOV AH, 1     
    INT 21H         
    SUB AL, '0'     

    CMP AL, 1       
    JE SUM          

    CMP AL, 2       
    JE SUBB     

    CMP AL, 3       
    JE PRINT        
      
    JMP EXIT      

SUM:
    MOV AH, 2     
    MOV DL, '5'     
    INT 21H         
    JMP EXIT      

SUBB:
    MOV AH, 2     
    MOV DL, '1'     
    INT 21H         
    JMP EXIT      

PRINT:
    MOV AH, 2     
    MOV DL, AL      
    ADD DL, '0'     
    INT 21H         

EXIT:
    MOV AH, 4CH     
    INT 21H         
MAIN ENDP           
END MAIN            