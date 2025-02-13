.model small
.stack 100h
.data
    ; Prompts for inputs
    input1 db 'Input 1:$'
    input2 db 10,13,'Input 2:$'
    input3 db 10,13,'Input 3:$'
    input4 db 10,13,'Input 4:$'
    
    ; Output labels
    outputLabel db 10,13,'OUTPUT:$'
    newLine db 10,13,'$'  ; For a new line
    extraNewLine db 10,13,10,13,'$'  ; Two blank lines for spacing

    ; Spacing for alignment
    spaces db '                                      $'  ; 38 spaces

    ; Storage for inputs
    grid db '    $'  ; Placeholder for a 2x2 grid

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Get Input 1
    mov ah, 09h
    lea dx, input1
    int 21h
    
    mov ah, 01h       ; Request a single character input
    int 21h           ; Call DOS interrupt
    sub al, 30h       ; Convert ASCII to number
    mov grid[0], al   ; Store in grid row 1, column 1

    ; Get Input 2
    mov ah, 09h
    lea dx, input2
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, 30h       ; Convert ASCII to number
    mov grid[1], al   ; Store in grid row 1, column 2

    ; Get Input 3
    mov ah, 09h
    lea dx, input3
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, 30h       ; Convert ASCII to number
    mov grid[2], al   ; Store in grid row 2, column 1

    ; Get Input 4
    mov ah, 09h
    lea dx, input4
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, 30h       ; Convert ASCII to number
    mov grid[3], al   ; Store in grid row 2, column 2

    ; Display OUTPUT label with a line break
    mov ah, 09h
    lea dx, outputLabel
    int 21h
    mov ah, 09h
    lea dx, newLine
    int 21h

    ; Display Row 1
    mov ah, 02h
    mov dl, grid[0]
    add dl, 30h       ; Convert to ASCII
    int 21h

    ; Print spaces for alignment
    mov ah, 09h
    lea dx, spaces
    int 21h

    ; Print the second number in Row 1
    mov ah, 02h
    mov dl, grid[1]
    add dl, 30h       ; Convert to ASCII
    int 21h

    ; Add blank lines between rows
    mov ah, 09h
    lea dx, extraNewLine
    int 21h

    ; Display Row 2
    mov ah, 02h
    mov dl, grid[2]
    add dl, 30h       ; Convert to ASCII
    int 21h

    ; Print spaces for alignment
    mov ah, 09h
    lea dx, spaces
    int 21h

    ; Print the second number in Row 2
    mov ah, 02h
    mov dl, grid[3]
    add dl, 30h       ; Convert to ASCII
    int 21h

    ; End program
    mov ah, 4Ch
    int 21h
main endp
end main
