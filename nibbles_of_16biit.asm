data SEGMENT
    num DW 6969h
    m1 DB "4th nibble(Least significant nibble): $"
    m2 DB 0dh,0ah,"3rd nibble: $"
    m3 DB 0dh,0ah,"2nd nibble: $"
    m4 DB 0dh,0ah,"1st nibble(Most significant nibble): $"
    
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
start:
     MOV AX, data
     MOV DS, AX
     MOV AX, num
     MOV BL, AL
     AND AL, 0fh 
     MOV BH, AL
     LEA DX, m1
     MOV AH, 9
     INT 21H                
     MOV DL, BH
     ADD DL, 48
     MOV AH, 2
     INT 21H
     
     MOV AL, BL
     AND AL, 00f0h
     SHR AL, 4
     MOV BH, AL
     LEA DX, m2
     MOV AH, 9
     INT 21H
     MOV DL, BH
     ADD DL, 48
     MOV AH, 2
     INT 21H
     
     MOV AX, num
     MOV BL, AH
     MOV AL, AH
     AND AL, 0fh 
     MOV BH, AL
     LEA DX, m3
     MOV AH, 9
     INT 21H
     MOV DL, BH
     ADD DL, 48
     MOV AH, 2
     INT 21H
     
     MOV AL, BL
     AND AL, 00f0h
     SHR AL, 4
     MOV BH, AL
     LEA DX, m4
     MOV AH, 9
     INT 21H
     MOV DL, BH
     ADD DL, 48
     MOV AH, 2
     INT 21H

     MOV AH, 4ch 
     INT 21h
code ENDS
     END start 