data SEGMENT
    m DB "abc$"
    
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
start:
      MOV AX, data
      MOV DS, AX
      LEA SI, m
      ADD SI, 2
      MOV CX, 03h
      next:
          MOV AH, 2
          MOV DL, BYTE PTR[SI]
          INT 21h
          SUB SI, 1
          SUB CX, 01
          CMP CX, 0
          JNZ next
      over:    
          mov ah, 4ch
          int 21h 


code ENDS
     END start