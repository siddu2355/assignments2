data SEGMENT
    sum DW DUP(0) 
    m db "The sum of first nine numbers: $"
    m1 db " (ASCII of - is 45)$" 
    n DW 09h
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
    
start:
      MOV AX, data
      MOV DS, AX
      MOV CX, n
      next:
          ADC sum, CX
          MOV AX, sum
      loop next
      MOV AH, 9
      LEA DX, m
      INT 21h
      MOV DX, sum
      MOV AH, 2
      INT 21h
      LEA DX, m1
      MOV AH, 9
      INT 21H
      MOV AX, 4c00h
      INT 21h
code ENDS 
     END start