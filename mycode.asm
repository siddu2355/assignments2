data SEGMENT
    arr1 DW 1234h,1235h,1236h,1237h, 1238h
    arr2 DW 5 DUP(0)
data ENDS


code SEGMENT
    ASSUME CS:code, DS:data
start:
      MOV AX, data
      MOV DS, AX
      LEA SI, arr1
      LEA SI, arr2
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
      MOV AX, 4c00h
      INT 21h
      
      
code ENDS
     END start