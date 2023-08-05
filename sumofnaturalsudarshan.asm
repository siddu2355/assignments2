data SEGMENT
    sum DW 0h
    msg1 DB "Enter the number : $"
    msg2 DB "    The sum of numbers : $"
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
start:
        MOV AX,data
        MOV DS,AX
        MOV AH,9
        LEA DX,msg1
        INT 21h
        MOV AH,01h
        INT 21h   
        SUB AL,30h
        MOV CL,AL 
        MOV BX,0
        MOV AX,0
        next:INC AX
             ADD BX,AX
             LOOP next 
        MOV AH,9
        LEA DX,msg2
        INT 21h
        MOV sum,BX
        MOV AX,sum
        
        MOV CX,0
        MOV DX,0
        
        temp:
             CMP AX,0
             JE abcd
             MOV BX,10
             DIV BX
             PUSH DX
             INC CX
             MOV DX,0
             JMP temp
        abcd: 
             CMP CX,0
             JE exit
             POP DX
             ADD DX,48
             MOV Ah,02h
             INT 21h
             DEC CX
             JMP abcd
        exit:
        
        MOV AX,4C00h
        INT 21h
code ENDS 
     END start