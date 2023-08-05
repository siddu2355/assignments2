data SEGMENT
    a DW 02h
    b DW 04h
    c DW DUP(0)
    m DB "The GCD is: $"
    
data ENDS


code SEGMENT
    ASSUME CS:code, DS:data
start:
      MOV AX, data
      MOV DS, AX
      MOV AH, 9
      LEA DX, m
      INT 21H
      MOV CX, 1
      MOV DX, 1 
      MOV AX, a
      CMP AX, b
      MOV BX, b
      JC next
      MOV BX, a
      next:
          INC CX
          MOV c, CX
          CMP BX, c
          JZ over 
          MOV AX, a
          DIV CL
          CMP AH, 0
          JNZ next
          MOV AX, b
          DIV CL
          CMP AH, 0
          JNZ next
          MOV DX, CX      
      over:
          MOV AH, 2
          ADD DX, 48
          INT 21h     
          MOV AX, 4c00h
          INT 21h
      
      
code ENDS
     END start