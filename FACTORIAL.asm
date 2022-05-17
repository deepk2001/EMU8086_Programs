DATA SEGMENT
    NUM DW 0005H
    ANS DW ?
DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:MOV AX,DATA
    MOV DS,AX
    MOV AX,01H           ;Set Ax to 1
    MOV CX,NUM           ;Set Counter to Num
    UP: MUL CX           ;Ax=Ax*Cx
    LOOP UP              ;Loop UP section till Cx not equal to zero (Cx=Cx-1)
    MOV ANS ,AX          ;Save answer in Ans from Ax
    MOV AH,4CH
    INT 21H
CODE ENDS
END START

                                                                          





