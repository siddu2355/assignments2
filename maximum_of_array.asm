data SEGMENT
    arr1 DW 06h, 05h, 08h, 04h, 07h
    m DB "maximum in the array is: $"
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
start:
      MOV AX, data                                           
      MOV DS, AX
      LEA SI, arr1
      MOV BX, WORD PTR[SI]
      MOV CL, 5
      next:
           SUB CL, 1
           ADD SI, 2
           CMP CL, 0
           JZ over          
           CMP BX, WORD PTR[SI]
           JNC next
           MOV BX,WORD PTR[SI]
           CMP CL, 0
           JNZ next
      over:     
      MOV AH, 9
      LEA DX, m
      INT 21h
      MOV DX, BX
      ADD DX, 48
      MOV AH, 2
      INT 21h   
      MOV AX, 4c00h
      INT 21h
      
      
code ENDS
     END start