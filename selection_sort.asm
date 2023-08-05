data SEGMENT
    arr1 DW 06h, 05h, 07h, 03h, 09h
    m1 DB "after sorting: $"
data ENDS


code SEGMENT
    ASSUME CS:code, DS:data
start:
      MOV AX, data
      MOV DS, AX
      LEA SI, arr1
      LEA DI, arr1
      MOV BX, WORD PTR[SI]
      MOV CL, 5
      MOV CH, 5
      next:
           SUB CL, 1
           ADD SI, 2
           CMP CL, 0
           JZ sort          
           CMP BX, WORD PTR[SI]
           JC next
           MOV DX, SI
           MOV BX,WORD  PTR[SI]
           CMP CL, 0
           JNZ next
      sort:
           MOV AX, WORD PTR[DI]
           MOV SI, DX
           MOV BX, WORD PTR[SI]
           MOV WORD PTR[SI], AX
           MOV WORD PTR[DI], BX
           ADD DI, 2
           MOV SI, DI
           MOV DX, DI
           MOV BX, WORD PTR[DI]
           SUB CH, 1
           MOV CL, CH  
           CMP CH, 0
           JNZ next
           
      over:
      LEA DI, arr1
      LEA DX, m1
      MOV AH, 9
      INT 21h
      MOV CL, 05
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