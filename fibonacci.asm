data SEGMENT
      term db 06h
      num1 db 00h
      num2 db 01h
      num3 db ?
data ENDS

Code SEGMENT
            ASSUME cs:Code, ds:data
      start:MOV    AX, data
            MOV    DS, AX
            MOV    CL, term
            SUB    CL, 2
      fibo: MOV    AL, num1
            ADD    AL, num2
            MOV    num3, AL
            MOV    AL, num2
            MOV    num1, AL
            MOV    AL, num3
            MOV    num2, AL
            LOOPNZ fibo
            MOV    AH, 2
            MOV    DL, num3
            ADD    DL ,48
            INT    21h
            MOV    AX, 4C00h
            INT    21h
Code ENDS
    END start
