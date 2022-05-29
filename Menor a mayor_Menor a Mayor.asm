
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 
.data
    Nom db "Vazquez Munoz Angel Francisco$"
    mes db "Ingrese el numero: $"
    mes2 db "Menor a mayor $"
    mes3 db "Mayor a menor $"
    v1 dw 0
    v2 dw 0
    v3 dw 0
    a db 100
    b db 10  
.code
    numero proc far
        mov ax,@data
        mov ds,ax
        
        mov dh,00
        call cursor
        lea dx,Nom
        call imprimir
        
        mov dh,01 
        call cursor
        lea dx,mes
        call imprimir
        ;Capturar numero
        mov ah,01h
        int 21h
        sub al,30h
        mul a
        add v1,ax
        mov ax,v1

        mov ah,01h
        int 21h
        sub al,30h
        mul b
        add v1,ax
        mov ax,v1

        mov ah,1
        int 21h 
        sub al,30h
        mov ah,0
        add v1,ax
        mov ax,v1
        ;---------  
        
        mov dh,02
        call cursor
        lea dx,mes
        call imprimir
        ;Campturar numero
        mov ah,1
        int 21h
        sub al,30h
        mul a
        add v2,ax
        mov ax,v2

        mov ah,1
        int 21h
        sub al,30h
        mul b
        add v2,ax
        mov ax,v2

        mov ah,1
        int 21h 
        sub al,30h
        mov ah,0
        add v2,ax
        mov ax,v2
        ;---------
        
        
        mov dh,03
        call cursor
        lea dx,mes
        call imprimir
        ;Capturar numero
        mov ah,1
        int 21h
        sub al,30h
        mul a
        add v3,ax
        mov ax,v3

        mov ah,1
        int 21h
        sub al,30h
        mul b
        add v3,ax
        mov ax,v3

        mov ah,1
        int 21h 
        sub al,30h
        mov ah,0
        add v3,ax
        mov ax,v3
        
;----------Ordenar-----

        ordenar:
            mov ax,v1
            mov bx,v2
        primero:
            cmp ax,bx
            ja segundo
            jmp tercero
        segundo:
            xchg ax,v2
            mov bx,v2
        tercero:
            cmp ax,v3
            ja cuatro
            jmp cinco
        cuatro:
            xchg ax,v3
        cinco:
            mov v1,ax
            mov ax,v2
            cmp ax,v3
            jb siga
            xchg ax,v3
            mov v2,ax
          siga:
          
;-------Imprimir numeros Menor a mayor
            mov dh,06
            call cursor
            lea dx,mes2
            call imprimir
            
            mov dh,07
            call cursor
            mov ax,v1
            call CapNum2
            
            mov dh,08
            call cursor
            mov ax,v2
            call CapNum2
            
            mov dh,09
            call cursor
            mov ax,v3
            call CapNum2
            
;------Imprimir numeros Mayor a menor
            mov dh,10
            call cursor
            lea dx,mes3
            call imprimir
            
            mov dh,11
            call cursor
            mov ax,v3
            call CapNum2
            
            mov dh,12
            call cursor
            mov ax,v2
            call CapNum2
            
            mov dh,13
            call cursor
            mov ax,v1
            call CapNum2
            
          ;end  
          terminar:
            mov ax,4c00h
            int 21h
    numero endp
    
    
    
;-----Ubicar cursor
    cursor proc near
         mov ah,02h
         mov bh,00h
         mov dl,02
         int 10h
        ret
    cursor endp
    
;-----Mostrar pantalla
    imprimir proc near
        mov ah,09h
        int 21h
        ret
    imprimir endp

    
;-----Mostrar numero Menor a mayor
    CapNum2 proc near
     xor cx,cx
     mov bx,10
     
     valor:
     xor dx,dx
     div bx
     push dx
     inc cx
     test ax,ax
     jnz valor
     
     Mostrar:
     pop dx
     add dl,30h
     mov ah,02h
     int 21h
     loop Mostrar
     
    CapNum2 endp

ret




 ;datos alrevez

ret




