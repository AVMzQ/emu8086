
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.model small
.stack
.data
    nom     db "Vazquez Munoz Angel Francisco$"
    numero1 db 0
    numero2 db 0
    resta   db 0
    mensaje1 db 13,10, "Ingrese el primer numero: $"
    mensaje2 db 13,10, "Ingrese el segundo numero: $"
    
    mensaje3 db 13,10, "resta= $"
    
      
.code
   inicio:
    mov ax,@data 
    mov ds,ax    
    
    mov ah,09h
    lea dx,nom
    int 21h
    
    mov ah,09h      
    lea dx,mensaje1 
    int 21h         
    
    mov ah,01h ;Funcion de Entrada de caracteres con eco, permite visualizar el cursor
    int 21h                                                             
    
    sub al,30h ;Restar 30h al caracter ingresado
    mov numero1,al
        
    mov ah,09h      
    lea dx,mensaje2 
    int 21h         
    
    mov ah,01 ;Cursor en espera de captura de caracter
    int 21h
    
    sub al,30h
    mov numero2,al
    
   
    
    mov al,numero1
    sub al,numero2
    mov resta,al
     
    mov ah,09
    lea dx,mensaje3
    int 21h
     
    mov dl, resta
    add dl,30h
     
    mov ah,02
    int 21h
    
       
            
    mov ax,4c00h       ;Funcion para terminar el codigo
    int 21h 
   end inicio
  

ret




