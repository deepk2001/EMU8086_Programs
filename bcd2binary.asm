DATA SEGMENT
BCD DW 27H
BIN DW ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START: MOV AX,DATA
MOV DS,AX
MOV AX,BCD      ;Move valid BCD into Ax
AND AX,07H      ;perform And operation between BCD number and 07H
MOV BX,AX       ;Move the result into And
MOV AX,BCD      ;Reload BCD value into Ax
AND AX,0F0H     ;perform And operation on Ax with 070H
MOV CX,0AH      ;Move 10 into Cx
MUL CX          ;ax=ax*cx
ADD AX,BX       ;ax=ax+bx
MOV BIN,AX      ;Move Ax value into BIN variable
MOV AH,4CH
INT 21H         ;Terminate Program
CODE ENDS
END START



