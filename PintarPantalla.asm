
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack
.data
    ;Declaramos variables
    mensaje db "BANDERA DE ITALIA","$"
.code
   
    mov ax,@data ;Mover el contenido de data al registro ax
    mov ds,ax    ;Mover el contenido de ax al segmento de datos ds 
                                                 
    MOV AH,06H
    MOV BH,3FH
    MOV CX,0000H
    MOV DX,1916H
    INT 10H    
            
    MOV AH,06H
    MOV BH,7FH
    MOV CX,0017H
    MOV DX,1932H
    INT 10H 
    
    MOV AH,06H
    MOV BH,4FH
    MOV CX,0033H
    MOV DX,1949H
    INT 10H       
    
      
    mov ah,09h      ;Manda llamar la función 09h de 21h 
    lea dx,mensaje   ;Muestra mensaje mensaje 
    int 21h         ;Interrupción 21h
           
    ;Terminar el programa
    mov ax,4c00h
    int 21h 

ret




