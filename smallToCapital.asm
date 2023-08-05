code Segment
    assume cs:code

start: MOV AH,1
       int 21h
       MOV AH,2
       SUB AL,20h
       MOV DL,AL
       INT 21h
       MOV AX,4c00h
       INT 21h 
       
code   ENDS
       END start
       