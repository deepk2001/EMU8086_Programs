DATA SEGMENT
    NUM1 DW 00H
    NUM2 DW 01H
    ANS DW ?
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:
    MOV AX,DATA           
    MOV DS,AX
    MOV CX,05H           ;Set counter to 5
    L1: MOV  AX,NUM1     ;Move Num1 into Ax (Ax=0)
    MOV BX, NUM2         ;Move Num2 into Bx (Bx=1)
    ADD AX,BX            ;Ax=Ax+Bx
    MOV NUM1,BX          ;Move Ax to Num1 
    MOV NUM2,AX          ;Move Bx to Num2
    LOOP L1              ;Loop back to L1 till Cx not equal to Zero
    MOV ANS,AX           ;Move Ax into Ans as nth term of Sequence
    MOV AH,4CH
    INT 21H
CODE ENDS
END START

    
    