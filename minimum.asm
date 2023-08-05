data SEGMENT
    n1 DW 5235h
    n2 DW 3234h
    m1 DB "First number is small$"
    m2 DB "Second number is small$"
data ENDS

code SEGMENT
    ASSUME CS:code, ds:data

start:
     MOV AX, data
     MOV DS, AX
     MOV AX, n1
     SUB AX, n2
     MOV AH, 9
     JNS x
     LEA DX, m1
     JMP over
     
   x: 
      LEA DX, m2
   over:
      INT 21h
      MOV AX, 4c00h
      INT 21h 
      
code ENDS
     END start
      