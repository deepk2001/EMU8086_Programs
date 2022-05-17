DATA SEGMENT 
    NUM1 DW  0019H,2301H
    NUM2 DW  2301H,0019H
    ANS DW 4 DUP<0>
    DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:MOV AX,DATA ;move data into ax register
    MOV DS,AX     ;move ax data to ds(data)
    MOV DL,00H    ;set dl to 0 for overflow
    MOV AX,NUM1   ;Move num1 into ax
    SUB AX,NUM2   ;ax=ax-num2
    MOV ANS,AX    ;move ax value into ans variable
    MOV AX,NUM1+2 ;mov the second num1 value to a
    SBB AX,NUM2+2 ;ax=ax-([num2+2])
    MOV ANS+2,AX  ;mov ax value to ans ahead
    JNC DOWN      ;jump to end if no carry
    INC DL        ; if carry -> dl++
    DOWN: MOV BYTE PTR ANS+4,DL  ; mov dl value to ans+4 to account for overflow
    MOV AH,4CH
    INT 21H      ;terminate program (back to Os)
    CODE ENDS
END START
    
    ;code property of Deep Kotecha 19BCE2301




