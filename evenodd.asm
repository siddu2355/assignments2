data SEGMENT
    n DW 32h
    m1 DB "The number is even$"
    m2 DB "The number is odd$"
    divisor DB 2h
    rem DB DUP(0)
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
start:
      MOV AX, data
      MOV DS, AX
      MOV AX, n
      DIV divisor
      MOV rem, AH 
      CMP rem , 0h
      MOV AH, 9
      jnz x
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
         