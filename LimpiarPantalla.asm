
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack
.data
    ;Declaramos variables
    Nombre  db "Vazquez Munoz Angle Francisco $"
    mensaje db "******$"
.code
   
    mov ax,@data ;Mover el contenido de data al registro ax
    mov ds,ax    ;Mover el contenido de ax al segmento de datos ds 
    
    mov ah,09h
    lea dx, Nombre
    int 21h
    
    posicionCursor: 
     mov ah,02h
     mov dh,0Ch ;Desplazamiento vertical
     mov dl,27h ;Desplazamiento horizontal
     int 10h 
    
    mov ah,09h      ;Manda llamar la función 09h de 21h 
    lea dx,mensaje   ;Muestra mensaje mensaje 
    int 21h         ;Interrupción 21h
    
    ;limpiarPantalla: 
    mov ax,0600h
    mov bh,07h
    mov ch,00h
    mov cl,00h
    mov dh,19h
    mov dl,4fh
    int 10h                                              

    ;Terminar el programa
    mov ax,4c00h
    int 21h 

ret




