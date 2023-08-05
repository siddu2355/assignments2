data SEGMENT
    arr1 DW 01h, 02h, 03, 04h, 05h
    arr2 DW 5 DUP(0)
    m1 DB "after reversing the array: $"
    
data ENDS


code SEGMENT
    ASSUME CS:code, DS:data
start:
      MOV AX, data
      MOV DS, AX
      LEA SI, arr1
      LEA DI, arr2
      ADD SI, 8
      MOV CL, 5
      next:
      MOV AX, WORD PTR[SI]
      MOV WORD PTR[DI], AX
      SUB SI, 2
      ADD DI, 2
      SUB CL, 1
      CMP CL,0
      JNZ next
      MOV AH, 9
      LEA DX, m1
      INT 21h
      MOV CL, 5
      LEA DI, arr2
    x:
      MOV AH, 2
      MOV DX, WORD PTR[DI]
      ADD DX, 48
      INT 21h
      MOV AH, 2
      MOV DL, ","
      INT 21h
      ADD DI, 2
      SUB CL, 1
      CMP CL, 0
      JNZ x 
      MOV AX, 4c00h
      INT 21h
      
      
code ENDS
     END start