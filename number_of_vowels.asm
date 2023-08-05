data SEGMENT
    m DB "number of vowels: $"
    m1 DB "Hi hello namaste$"
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
start:
     MOV AX, data
     MOV DS, AX
     LEA SI, m1
     DEC SI
     MOV CL, 17
     MOV AL, -1
     count:
          INC AL
     x: 
       DEC CL
       CMP CL, 0
       JZ over
       INC SI
       MOV DL, BYTE PTR[SI]
       CMP DL, 'a'
       JZ count
       CMP DL, 'e'
       JZ count
       CMP DL, 'i'
       JZ count
       CMP DL, 'o'
       JZ count
       CMP DL, 'u'
       JZ count
       CMP CL, 0
       JNZ x
     over:
         MOV BL, AL
         LEA DX, m
         MOV AH, 9
         INT 21H
         MOV DL, BL
         ADD DL, 48
         MOV AH, 2
         INT 21H 
         MOV AH, 4ch
         INT 21h
code ENDS
     END start