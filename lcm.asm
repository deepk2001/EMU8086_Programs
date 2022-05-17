DATA SEGMENT
  NUM DW 0019H,0031H
  LCM DW 2 DUP(0)
DATA ENDS
CODE SEGMENT
  ASSUME CS:CODE,DS:DATA
  START: MOV AX,DATA
  MOV DS,AX
  MOV DX,0H             ;Set DX as 0
  MOV AX,NUM            ;Set Num to ax
  MOV BX,NUM+2          ;set [Num+2] to bx
  UP: PUSH AX           ;UP section-> Push Value of Ax onto Stack
  PUSH DX               ;Push Value of DX onto Stack
  DIV BX                ;ax=ax/bx and Higher bytes go to Dx by default
  CMP DX,0              ;Compare new Value of Dx to Zero.
  JE EXIT               ;If Compare Statement declares equality jump to EXIT section
  POP DX                ;Else Restore original value of Dx from stack
  POP AX                ;restore original value of ax from stack
  ADD AX,NUM            ;Ax=ax+num == 2*num
  JNC DOWN              ;If no carry observed then jump to DOWN section
  INC DX                ;else increment Dx
  DOWN: JMP UP          ;Jump to UP section
  EXIT: POP LCM+2       ;Pop LCM+2 From second index from stack  (Originally Dx)
  POP LCM               ;Pop LCM   From Base of Stack (Originally Ax)
  MOV AH,4CH
  INT 21H               ;Terminate Program
CODE ENDS
END START



