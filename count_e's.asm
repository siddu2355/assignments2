data SEGMENT
    m DB "ee    eeeeee$"
    m1 DB "number of e's in the string ee    eeeeee: $"
    
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
start:
      MOV AX, data
      MOV DS, AX
      MOV BL, 0
      LEA SI, m
      SUB SI, 1
      MOV CX, 13
      next:
          SUB CX, 01
          CMP CX, 0
          JZ over
          ADD SI, 1
          CMP BYTE PTR[SI], 'e'
          JNZ next
          ADD BL, 1
          CMP CX, 0
          JNZ next
      over:
          MOV AH, 9
          LEA DI, m1
          MOV DX, DI
          INT 21h
          MOV AH, 2
          MOV DL, BL
          ADD DL, 48
          int 21h    
          mov ah, 4ch
          int 21h 


code ENDS
     END start
