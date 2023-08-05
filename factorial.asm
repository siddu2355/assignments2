data SEGMENT
    num DW 03h
    m1 DB "Factorial of $"
    m2 DB " is: $"
data ENDS


code SEGMENT
    ASSUME CS:code, DS:data
start:
      MOV AX, data
      MOV DS, AX
      MOV AX, num 
      MOV CX, num
      next:
          SUB num, 1
          MUL num
          CMP num, 1
          jnz next
      MOV BL, AL
      LEA DX, m1
      MOV AH, 9
      INT 21h
      MOV AH, 2
      MOV DX, CX
      ADD DX, 48
      INT 21h
      LEA DX, m2
      MOV AH, 9
      INT 21h
      MOV DL, BL
      ADD DL, 48
      MOV AH, 2
      INT 21h 
      MOV AX, 4c00h
      INT 21h
      
      
code ENDS
     END start