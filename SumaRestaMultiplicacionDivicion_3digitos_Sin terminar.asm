
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack
.data 
mensaje db 13,10,"tres cifras$"
  sumaMensaje  db 13,10, "suma = $"
  Resta        db 13,10,"Resta= $"
  mult         db 13,10,"Multiplicacion= $"
  salto db 13,10, "$"
  mensaje1 db 13,10,"Numero 1: $"
  mensaje2 db 13,10,"Numero 2: $ "
  n1 dw 0
  n2 dw 0
  mdl dw 0
  a db 100
  b db 10
  .code

mov ax,@data
mov ds,ax 

mov ah, 09h
lea dx,mensaje
int 21h

mov ah, 09h
lea dx, mensaje1
int 21h
         
;numero uno         
mov ah,1
int 21h
sub al,30h
mul a
add n1,ax
mov ax,n1

mov ah,1
int 21h
sub al,30h
mul b
add n1,ax
mov ax,n1

mov ah,1
int 21h 
sub al,30h
mov ah,0
add n1,ax
mov ax,n1 

;numero dos


mov ah, 09h
lea dx, mensaje2
int 21h   

mov ah,1
int 21h
sub al,30h
mul a
add n2,ax


mov ah,1
int 21h
sub al,30h
mul b
add n2,ax


mov ah,1
int 21h 
sub al,30h
mov ah,0
add n2,ax

;suma 


mov ah, 09h
lea dx,salto
int 21h 

mov ah, 09h
lea dx, sumaMensaje
int 21h

;realizar operacion para desglozar numeros 

mov ax,n2
add ax,n1

xor cx,cx   ;Limpia el registro  cx=0   o   ch=0  cl=0  
mov bx,10

valorsum:
xor dx,dx
div bx 
push dx
inc cx
test ax,ax ;Esta vacio el registro?
jnz valorsum

mostrarsum:
pop dx
add dl,30h
mov ah,02h
int 21h
loop mostrarsum 

;*****resta******************
mov ah, 09h
lea dx,salto
int 21h 

mov ah, 09h
lea dx, Resta
int 21h

;realizar operacion para desglozar numeros 

mov ax,n1
sub ax,n2
mov n1,ax

xor cx,cx   ;Limpia el registro  cx=0   o   ch=0  cl=0  
mov bx,10

valor:
xor dx,dx
div bx 
push dx
inc cx
test ax,ax ;Esta vacio el registro?
jnz valor

mostra:
pop dx
add dl,30h
mov ah,02h
int 21h
loop mostra


;*****mult******************
mov ah, 09h
lea dx,salto
int 21h 

mov ah, 09h
lea dx, mult
int 21h


ret




