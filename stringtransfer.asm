DATA SEGMENT
STR1 DB 'VIT$'
LEN EQU $-STR1
STR2 DB 20 DUP(0)
DATA ENDS
CODE SEGMENT

ASSUME CS:CODE,DS:DATA,ES:DATA
START: MOV AX,DATA
MOV DS,AX
MOV ES,AX
LEA SI,STR1   ;set Source Index as Effective address of String entered
LEA DI,STR2   ;set Destination Index as Effective address of Output
MOV CX,LEN    ;Move String Length Equivalent into cx
CLD           ;reset direction flag to 0
REP MOVSB     ;repeat process till zero and transfer bytes one at a
              ;time from Source Index to Destination Index and increment both indexes. 
MOV AH,4CH    ;terminate process if cx=0
INT 21H
CODE ENDS
END START