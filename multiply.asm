data SEGMENT
    n     DB 03h
    val   DB 12h, 0A5h, 0FFh, 34h, 98h
    S_val DB 2 dup(0)
data ENDS

code SEGMENT
          ASSUME cs:code, ds:data
    start:MOV    AX, data
          MOV    DS, AX
          MOV    CX, 5
          MOV    BL, n
          LEA    SI, val
          LEA    DI, S_val
    next: MOV    AL, BYTE PTR[SI]
          MuL    BL
          MOV    WORD PTR[DI], AX
          INC    SI
          ADD    DI, 2
          LOOP   next
          mov dl,al
          mov ah,2 
          int 21h
          MOV    AX, 4C00h
          INT    21h
cODE ENDS
     END start