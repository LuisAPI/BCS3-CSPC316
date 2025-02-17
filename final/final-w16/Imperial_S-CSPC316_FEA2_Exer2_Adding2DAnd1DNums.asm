.model small
.stack 100h
.data
    n1 db 'Enter a two-digit number: $'
    n2 db 10,13,'Enter a one-digit number: $'
    n3 db 10,13,'Sum is: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, n1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    
    sub al, 30h
    mov bh, al
    
    mov ah, 01h
    int 21h
    
    sub al, 30h
    mov bl, al      ; bh:bl - First number
    
    lea dx, n2
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    
    sub al, 30h
    ;mov ch, al
    
    ;mov ah, 01h
    ;int 21h
    
    ;sub al, 30h
    mov cl, al      ; ch:cl - Second number
    
    add bl, cl
    
    mov al, bl
    mov ah, 00h
    aaa
    
    mov cl, al      ; n3 - Last digit
    mov bl, ah
    
    add bl, bh
    ;add bl, ch
    
    mov al, bl
    mov ah, 00h
    aaa
    
    mov bx, ax
    
    mov dx, offset n3
    mov ah, 09h
    int 21h
    
    mov dl, bh
    add dl, 30h
    mov ah, 02h
    int 21h
    
    mov dl, bl
    add dl, 30h
    mov ah, 02h
    int 21h
    
    mov dl, cl
    add dl, 30h
    mov ah, 02h
    int 21h

main endp
end
    