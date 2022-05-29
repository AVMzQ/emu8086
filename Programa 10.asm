imprime macro cadena
mov ah,09
mov dx,offset cadena
int 21h
endm

.model small
.stack
.data
N db 'Vazquez Munoz Angel Francisco$'
mensaje1 db 0ah,0dh, 'Menu', '$'
mensaje2 db 0ah,0dh, '1.- Crear Archivo', '$'
mensaje3 db 0ah,0dh, '2.- Abrir Archivo', '$'
mensaje4 db 0ah,0dh, '3.- Modificar archivo', '$'
mensaje5 db 0ah,0dh, '4.- Eliminar archivo', '$'
mensaje6 db 0ah,0dh, '5.- Salir', '$'
mensaje7 db 0ah,0dh, 'Seleccione una opcion: ', '$'
mensajeEliminar db 0ah,0dh, 'Archivo eliminado con exito', '$'
mensajeCrear db 0ah,0dh, 'Archivo creado con exito', '$'
mensajeEscrito db 0ah,0dh, 'Archivo escrito con exito', '$'
mensajeNombre db 0ah,0dh, 'Nombre del archivo: ', '$'
cadena db 'Cadena a Escribir en el archivo','$'
archivo db 'prueba2.txt',0
vec db 50 dup('$')

handle db 0
saltoLinea db 10,13,'$'

.code
inicio:
mov ax,@data
mov ds,ax
Imprime N
menu:
imprime mensaje1
imprime mensaje2
imprime mensaje3
imprime mensaje4
imprime mensaje5
imprime mensaje6
imprime mensaje7

mov ah,0dh
int 21h

mov ah,01h
int 21h

cmp al,31h
je crear
cmp al,32h
je abrir
cmp al,33h
je pedir
cmp al,34h
je eliminar
cmp al,35h
je salir

crear:


mov ah,3ch   
mov cx,0h    
mov dx,offset archivo
int 21h
jc salir
imprime mensajeCrear
mov bx,ax
mov ah,3eh   
int 21h 
imprime saltoLinea
jmp menu

abrir: 


mov ah,3dh
mov al,0h
mov dx,offset archivo
int 21h

mov bx,ax


mov ah,3fh
mov cx,50
mov dx,offset vec
int 21h
mov ah,09h
int 21h


mov ah,3eh
int 21h
imprime saltoLinea
jmp menu

pedir:
mov ah,01h
int 21h 
mov vec[si],al
inc si
cmp al,0dh

ja pedir
jb pedir

editar: 


mov ah,3dh
mov al,1h
mov dx,offset archivo
int 21h
jc salir  


mov bx,ax
mov cx,si
mov dx,offset vec
mov ah,40h
int 21h
mov handle,bl
mov bx,ax
imprime mensajeEscrito
mov ax,bx
cmp cx,ax

jne salir
mov ah,3eh
mov bl,handle
int 21h 
imprime saltoLinea
jmp menu

eliminar:  


mov ah,3eh
int 21h 


mov ah,41h
mov dx,offset archivo
int 21h

jc salir
imprime mensajeEliminar

salir:
mov ah,04ch
int 21h
end


ret




