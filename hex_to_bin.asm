data SEGMENT
    n DW 2355h
    m DB "The Binary number: $" 
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
start:
      MOV AX, data
      MOV DS, AX
      MOV BX, n
      MOV CX, 16
      LEA DX, m
      MOV AH, 9
      INT 21H
      JMP next
      one:  
          MOV DX, 49
          MOV AH, 2
          INT 21H
          JMP over 
      next:
           SHL BX, 1
           JC one
           MOV DX, 48
           MOV AH, 2
           INT 21H
           
      over:
          loop next
          MOV AH, 4ch
          INT 21H
           
           
code ENDS
     END start