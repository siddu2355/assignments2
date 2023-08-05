data SEGMENT
    num1 DW 0055h
    num2 DW 00ABh
    m DB "number of common bits: $"
    count DB 0
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
    
start:
     MOV AX, data
     MOV DS, AX
     MOV AX, num1
     MOV BX, num2
     MOV CL, 16
     JMP next
     one:
        MOV DL, 0
        JMP n2
     two:
        MOV DH, 0
        JMP comp 
     next:

         SHL AX, 1
         JNC one
         MOV DL, 1
         n2:
           SHL BX, 1
           JNC two
           MOV DH, 1
           comp:
                CMP DH, DL
                JNZ over
                INC count
                
     over:
         loop next
         LEA DX, m
         MOV AH, 9
         INT 21H
         MOV DL, count
         ADD DL, 48
         MOV AH, 2
         INT 21h
         MOV AH, 4ch
         INT 21H
code ENDS
     END start
