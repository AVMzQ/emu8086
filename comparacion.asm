
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack
.data
    nom     db "Vazquez Munoz Angel Francisco$"       
    numero1 db 0
    numero2 db 0
    men1 db 13,10, "Ingrese el primer numero: $"
    men2 db 13,10, "Ingrese el segundo numero: $"
    mensaje1 db 13,10,"NUMEROS IGUALES$"
    mensaje2 db 13,10,"NUMERO 1 MAYOR$"
    mensaje3 db 13,10,"NUMERO 2 MAYOR$"
.code

    
    inicio:
    mov ax,@data
    mov ds,ax
    
    mov ah, 09h
    lea dx,nom
    int 21h
    ;
    mov ah,09h      
    lea dx,men1 
    int 21h         
    
    mov ah,01h ;Funcion de Entrada de caracteres con eco, permite visualizar el cursor
    int 21h                                                             
    
    sub al,30h ;Restar 30h al caracter ingresado
    mov numero1,al
        
    mov ah,09h      
    lea dx,men2 
    int 21h         
    
    mov ah,01 ;Cursor en espera de captura de caracter
    int 21h
    
    sub al,30h
    mov numero2,al
    
    ;
    mov ah,numero1
    cmp ah,numero2 
    
    jc mayorNum2
    jz iguales
    jnz mayorNum1        

iguales:
    mov ah,09h
    lea dx,mensaje1;
    int 21h
.exit

mayorNum1:
    mov ah,09h
    lea dx,mensaje2;
    int 21h
.exit
     
mayorNum2:
    mov ah,09h
    lea dx,mensaje3;
    int 21h
.exit

ret




