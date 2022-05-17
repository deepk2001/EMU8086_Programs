DATA SEGMENT 
    NUM DW 2301H,0019H
    ANS DW 2 DUP<0>
DATA ENDS
CODE SEGMENT
    ASSUME CS: CODE, DS: DATA
    START:
    MOV AX,DATA    ;move data into ax
    MOV DS, AX     ;move ax data to ds
    MOV AX, NUM    ;move first word of num
    MOV CX,0H      ;set cx to 0 for borrow
    SUB AX,NUM+2   ;ax=ax-[num+2] (second word of num)
    JNC DOWN       ; check if carry flag is zero if yes jump to down
    INC CX         ;else increment x for borrow
DOWN:
MOV ANS,AX         ;shift ax to ans
MOV ANS+2,CX       ;mov overflow to ans+2 to account for sign change 
MOV AH,4CH
INT 21H            ;terminate program
CODE ENDS
END START

;19BCE2301 Deep Hiren Kotecha






