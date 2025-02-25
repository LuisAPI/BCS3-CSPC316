.model small    ;directive
.stack 100h     ;directive
.code


mov ah,02h    ;to request to display a character
mov dl,65
int 21h

mov dl,42h
int 21h

mov dl,10
int 21h

mov dl,13
int 21h

mov dl,67
int 21h


mov ah,01h    ;request to ask input
int 21h
mov bh,al


mov ah,02h    ;gotoxy
mov dl,5
mov dh,8
mov bh,0
int 10h

call hline
call hline
call hline
call hline
call hline


mov ah,02h    ;gotoxy
mov dl,7
mov dh,10
mov bh,0
int 10h

mov ah,02h
mov dl,bh
int 21h

mov ah,4ch
int 21h

hline:
mov ah,02h
mov dl,196
int 21h
ret

end