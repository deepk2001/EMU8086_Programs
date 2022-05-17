DATA SEGMENT
    NUM DB 32H
    NUM2 DB 38H
    SUM DW ?
    DIF DW ?
    PRO DW ?
    QUO DB ?
DATA ENDS 

CODE SEGMENT
    ASSUME CS: CODE, DS:DATA
    START: MOV AX,DATA
    MOV DS,AX
    MOV AH,0
    MOV AL,NUM       
    ADD AL,NUM2       
    AAA              ;Addtion followed by Ascii Adjustment
    SUB AX,246
    MOV SUM,AX
    
    MOV AL,NUM2
    SUB AL,NUM       
    AAS              ;Subtraction followed by Ascii Adjustment
    MOV DIF,AX
    
    MOV AX,0H
    MOV AL,NUM
    MUL NUM2
    AAM              ;Multiplication followed by Ascii Adjustment
    SUB AX,6128
    MOV PRO,AX
    
    MOV AX,0000H
    MOV BX,0000H
    MOV AL,NUM
    MOV BL,NUM2      
    DIV BL   
    AAD              ;Division Followed By Ascii  Adjustment
    ADD AX,16
    MOV QUO,AL
CODE ENDS
END START