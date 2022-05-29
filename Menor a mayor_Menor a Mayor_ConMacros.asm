org 100h
mCursor macro
    mov ah,02h
    mov bh,00h
    mov dl,02
    int 10h
mCursor endm

mImprimir macro
    mov ah,09h
    int 21h
mImprimir endm 

mOrdenar macro a,b,c
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
mOrdenar endm

mCapNum1 macro
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
mCapNum1 endm
mCapNum2 macro
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
mCapNum2 endm
mCapNum3 macro
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
mCapNum3 endm

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
        mov ax,@data
        mov ds,ax
        
        mov dh,00
        mCursor
        lea dx,Nom
        mImprimir
        
        mov dh,01 
        mCursor
        lea dx,mes
        mImprimir
        ;Capturar numero
        mCapNum1
        ;---------  
        mov dh,02
        mCursor
        lea dx,mes
        mImprimir
        ;Campturar numero
        mCapNum2
        ;---------
        mov dh,03
        mCursor
        lea dx,mes
        mImprimir
        ;Capturar numero
        mCapNum3
;----------Ordenar-----
        mOrdenar v1,v2,v3
          siga:
;-------Imprimir numeros Menor a mayor
            mov dh,06
            mCursor
            lea dx,mes2
            mImprimir
            
            mov dh,07
            mCursor
            mov ax,v1
            call CapNum2
            
            mov dh,08
            mCursor
            mov ax,v2
            call CapNum2
            
            mov dh,09
            mCursor
            mov ax,v3
            call CapNum2
            
;------Imprimir numeros Mayor a menor
            mov dh,10
            mCursor
            lea dx,mes3
            mImprimir
            
            mov dh,11
            mCursor
            mov ax,v3
            call CapNum2
            
            mov dh,12
            mCursor
            mov ax,v2
            call CapNum2
            
            mov dh,13
            mCursor
            mov ax,v1
            call CapNum2
            
          ;end  
          terminar:
            mov ax,4c00h
            int 21h
      
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



