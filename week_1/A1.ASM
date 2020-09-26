.model small
.data
a dw 1234
b dw 2345
c dw ?
.code
    mov ax,@data
    mov ds,ax

    mov ax,a
    add ax,b
    mov c,ax

    mov ax,4ch
    int 21h
    end
