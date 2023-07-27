.MODEL SMALL        
.STACK 100h         
.DATA              
.CODE
MAIN PROC           
    MOV AH, 2     
    MOV BL, 'o'     
    MOV CL, 'e'     
    MOV DL, 3       

    CMP DL, 1       
    JE O      
    
    CMP DL, 3       
    JE O      
    
    CMP DL, 2       
    JE E      
    
    CMP DL, 4       
    JE E      
    
    JMP EXIT      

    O:
    MOV DL, BL      
    INT 21h         
    JMP EXIT      

    E:
    MOV DL, CL      
    INT 21h         

    EXIT:
    MOV AH, 4CH     
    INT 21h         
    MAIN ENDP           
END MAIN            