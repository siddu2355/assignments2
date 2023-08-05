code SEGMENT
    ASSUME CS:code   
    
start: MOV CX,10  

next: MOV AH,2
      MOV AL,CL
      ADD AL,48
      sub AL, 1
      MOV DL,AL
      INT 21h
      LOOP next
      MOV AX,4C00h
      INT 21h
code ENDS
     END start
