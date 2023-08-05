data segment
    n1 DD 12345678h
    n2 DW 1234h  
    remainder DW ?
    quotient DW ?
    
data ends

code segment
    ASSUME CS:code, DS:data
start:
     MOV AX, data
     MOV DS, AX
     MOV DX, n1
     MOV AX, n1+2
     DIV n2
     MOV remainder, DX
     MOV quotient, AX
     MOV AH, 4ch
     INT 21h
code ENDS
     END start 