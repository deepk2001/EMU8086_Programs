
DATA SEGMENT
    NUM DB 38H,-19H
    QUO DB ?
DATA ENDS
CODE SEGMENT 
    ASSUME CS:CODE,DS:DATA
    START: MOV AX,DATA
    MOV DS,AX           ;Move Data into Ds
    LEA SI,NUM          ;Move Effective address of num into Source index
    MOV AL,[SI]         ;Move First 16 bits into AL
    MOV BL,[SI+1]       ;Move other Sixteen bits into AL
    IDIV BL             ;al=al/bl idiv makes it concious of Sign
    MOV QUO,AL          ;move quotient into Quo
    MOV QUO+2,DL        ;move Remainder into Quo+2
    MOV AH,4CH
    INT 21H             ;terminate program
CODE ENDS
END START





