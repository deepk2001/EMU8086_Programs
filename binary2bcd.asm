data segment
bin equ 101000111b
result dw ?
data ends

code segment
assume cs:code, ds:data

start:
mov ax,data
mov ds,ax
mov bx,bin     ;move binary number into bx
mov ax,0h      ;set ax to 0
mov cx,0h      ;set cx to 0

again0:
cmp bx,0h      ;compare bx to 0h
jz endprg      ;if zero flag is high goto endprg
dec bx         ;else decrement bx by 1
mov al,cl      ;mov cl value into al
add al,01h     ;al=al+01h
daa            ;make decimal adjustment after addition on al
mov cl,al      ;mov al to cl
mov al,ch      ;mov ch to al
adc al,00h     ;add with carry al=al+0h
daa            ;decimal adjuct after addition on al
mov ch,al      ;move al into ch
jmp again0     ;jump to again0

endprg:
mov result,cx    ;move cx into result 
mov ah,4ch       ;terminate program
int 21h
code ends
end start