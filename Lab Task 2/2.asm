.MODEL SMALL        
.STACK 100h         
.DATA              
.CODE              
MAIN PROC           
    MOV AH, 2     
    MOV BL, 'b'     
    MOV DL, 2       
    MOV CL, 1       

    CMP DL, 3       
    JGE EXIT      
    
    CMP CL, 3       
    JGE EXIT      
    
    MOV DL, BL      
    INT 21h         
    
    EXIT:
    MOV AH, 4CH     
    INT 21h         
MAIN ENDP           
END MAIN            