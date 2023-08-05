data SEGMENT
    msg DB "Siddu$"
data ENDS 

code SEGMENT
    ASSUME CS:Code,ds:data  
    
start: MOV AX,data
       MOV DS,AX
       
       MOV BX,SEG msg
       MOV DS,BX
       MOV DX,OFFSET msg
       MOV AH,9
       INT 21h
       MOV AX,4C00h
       INT 21h
code ENDS
     END start