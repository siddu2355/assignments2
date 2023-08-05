data SEGMENT
    n1 DW 1234h
    n2 DW 1264h
    mgss DB "Numbers are equal$"
    mgsf DB "Numbers are not equal$"
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
start:
      MOV AX, data
      MOV DS, AX
      MOV AX, n1
      CMP AX, n2
      MOV AH, 9
      JNZ noteq
      LEA DX,mgss
      JMP OVER
    noteq:
         LEA DX, mgsf
    over:
         InT 21h
         MOV AX,4c00h
         INT 21h
CODE ENDS
     END start