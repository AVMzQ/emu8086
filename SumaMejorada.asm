
org 100h
.model small
.stack
.data
    numero1 db 0
    numero2 db 0
    unidad db 0
    decena db 0
    mensaje1 db 13,10, "Ingrese el primer numero: $"
    mensaje2 db 13,10, "Ingrese el segundo numero: $"
    mensaje3 db 13,10, "SUMA= $"
    
      
.code
   inicio:
    mov ax,@data 
    mov ds,ax    

   
    mov ah,09h      
    lea dx,mensaje1 
    int 21h         
    
    mov ah,01h ;Funcion de Entrada de caracteres con eco
    int 21h                               
    
    sub al,30h ;
    mov numero1,al
        
    mov ah,09h      
    lea dx,mensaje2 
    int 21h         
    
    mov ah,01
    int 21h
    
    sub al,30h
    mov numero2,al
       
    mov ah,0   
    mov al,numero1
    add al,numero2
    aaa
    mov unidad,al
    mov decena,ah
        
    mov ah,09
    lea dx,mensaje3
    int 21h
        
    ;suma
    mov dl,decena
    add dl,30h 
    
     mov ah,02
    int 21h
    
    mov dl,unidad
    add dl,30h
    
    mov ah,02
    int 21h   
            
    mov ax,4c00h       ;Funci?n para terminar el c?digo
    int 21h 
   end inicio
ret




