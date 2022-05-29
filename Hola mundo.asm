
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack
.data
    mes db "Vazquez Munoz Angel Francisco, Hola mundo $"
.code
    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea dx, mes
    int 21h
    
    mov ax,4c00h
    int 21h

ret




