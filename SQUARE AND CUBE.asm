DATA SEGMENT
    NUM DW 0009H
    SQR DW ?
    CUB DW ?
    DATA ENDS 
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:
    MOV AX,DATA
    MOV DS,AX
    MOV AX,NUM      ;Move Num in Ax
    MUL AX          ;Ax=Ax*Ax -- Ax squared
    MOV SQR,AX      ;Save square value in SQR
    MOV BX,NUM      ;Move Num into Bx 
    MUL BX          ;Ax=Ax*Bx -- Ax Cubed
    MOV CUB,AX      ;save cube into CUB
    MOV AH,4CH
    INT 21H
    CODE ENDS
END START



