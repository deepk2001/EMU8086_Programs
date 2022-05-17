data segment
         d1 db 12
    data ends
code segment
    assume cs:code,ds:data
    start:
    mov ah,1h
    int 21h 
    
    mov dl,al
    mov ah,2h
    int 21h 
    mov bl,d1
    mul bl
    mov d1,al
    mov ah,4ch  
    int 21h
    code ends
end start
    