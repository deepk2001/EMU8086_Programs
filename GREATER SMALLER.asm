DATA SEGMENT 
    ARR DW 0011H,0291H,0300H,0009H  
    BIG DW ?
    SMA DW ?
DATA ENDS 
CODE SEGMENT
    ASSUME CS:CODE, DS:DATA 
    START:
    MOV AX,DATA
    MOV DS,AX  
    MOV CX,01h       ;Set Cx to 1
    LEA SI,ARR       ;Assign Array into Source Index
    MOV AX,[SI]      ;Load First Array Number in Ax
    MOV BIG,AX       ;set BIG as AX (initial value)
    MOV SMA,AX       ;set SMA as AX (initial value)
    JMP COMPARE      ;Unconditional Jump to COMAPRE
      
    COMPARE:
    CMP CX,04H       ;Compare Counter to 4 (array Size)
    JE ENDPRG        ;If Equal Terminate Program
    INC CX           ;Increment Counter
    ADD SI,2         ;Increase Source index By 2 (for 16 bit data)
    MOV AX,[SI]      ;Move Next Element of Array into 
    CMP AX,BIG       ;Compare Ax and BIG (intial Value)
    JGE GREAT        ;If equal or Greater Jump to GREAT
    JL SMALL         ;If Lesser Jump to SMALL
    
    
    GREAT:
    MOV BIG,AX       ;Move Ax into BIG
    JMP COMPARE      ;Unconditional Jump to Compare
    
    SMALL:
    MOV SMA,AX       ;Move Ax into SMA
    JMP COMPARE      ;Unconditional Jump to Compare
    
    ENDPRG:
    MOV AH,4CH       ;Terminate Program
    INT 21H
CODE ENDS
END START
    

