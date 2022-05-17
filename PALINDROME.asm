DATA SEGMENT
MSG1 DB 10,13,'ENTER THE STRING: $'
MSG2 DB 10,13,'STRING IS PALINDROME$'
MSG3 DB 10,13,'STRING IS NOT PALINDROME$'
NEW DB 10,13,'$'
INST DB 20 DUP(0)
DATA ENDS
CODE SEGMENT              
ASSUME CS:CODE,DS:DATA
START:
MOV AX,DATA
MOV DS,AX
LEA DX,MSG1          ;Load String Prompt into the DX
MOV AH,09H           ;string offset interreupt
INT 21H
MOV BX,00            ;set bx = 0 bx keeps count of same characters in palindrome at the end it should be zero again
UP:
MOV AH,01H           ;Take input interrupt
INT 21H
CMP AL,0DH           ;compare al value to ODh to jump to take input
JE DOWN              ;if equal jump to down
MOV [INST+BX],AL     ;move address of inst into Al
INC BX               ;bx=bx+1
LOOP UP              ;Loop Up until equal pushes the process to Down
DOWN:
MOV DI,0             ;Set Destination index = 0
DEC BX               ;bx=bx-1
JNZ CHECK            ;if bx !=0 jump to check
CHECK:               
MOV AL,[INST+BX]     ;move the character from first side 
CMP AL,[INST+DI]     ;check it against character from second side 
JNE FAIL             ;if they are not equal for even one character set equal goto fail
INC DI               ;di=di+1
DEC BX               ;bx=bx-1
JNZ CHECK            ;if bx!=0 goto check
LEA DX,NEW           ;get effective address of new
MOV AH,09H           ;string offset interrupt
INT 21H              
LEA DX,MSG2          ;load effective address of msg2
MOV AH,09H           ;string offset interrupt
INT 21H
JMP FINISH           ;jump to finish
FAIL:
LEA DX,MSG3          ;offset message 3 address
MOV AH,09H           ; string offset interrupt
INT 21H
FINISH:
MOV AH,4CH           ;terminate program.
INT 21H
CODE ENDS
END START
END