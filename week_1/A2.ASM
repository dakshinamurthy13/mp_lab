.model small
.data
a db 01
b db 02
c db 03
d db 04
.code
        mov ax,@data
        mov ds,ax

        mov al,a
        add al,b
        add al,c
        add al,d
        mov a,al

        mov ah,4ch
        int 21h
        end
