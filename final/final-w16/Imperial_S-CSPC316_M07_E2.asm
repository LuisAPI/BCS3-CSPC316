.model small
.stack 100h
.data
    n1 db 'First Input:$'
    n2 db 10,13,'Second Input:$'
    n3 db 10,13,'Sum is:$'

.code

mov ax,@data
mov ds,ax

mov ah,09h      ;request to display string
mov dx,offset n1
int 21h

mov ah,01h
int 21h
sub al,30h
mov bh,al


mov ah,09h      ;request to display string
mov dx,offset n2
int 21h

mov ah,01h
int 21h
sub al,30h
mov bl,al

mov ax,0
mov al,bh
add al,bl
aaa
mov ch,ah   ;tens
mov cl,al   ;ones

mov ah,09h
mov dx,offset n3
int 21h
             

mov ah,02h
add ch,30h
mov dl,ch
int 21h
             
mov ah,02h
add cl,30h
mov dl,cl
int 21h


end                  