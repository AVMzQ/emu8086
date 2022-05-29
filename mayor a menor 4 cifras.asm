org 100h
mMen macro mensa
    mov ah,09h
    lea dx,mensa
    int 21h
    mMen endm
mSalto macro
    mov ah,09h
    lea dx,salto
    int 21h
    mSalto endm
mNum macro n
    mov ah,1
    int 21h
    sub al,30h
    mov ah,0
    mul a
    mov n,ax
    mov ax,n

    mov ah,1
    int 21h
    sub al,30h
    mov ah,0
    mul b
    add n,ax
    mov ax,n

    mov ah,1
    int 21h
    sub al,30h
    mov ah,0
    mul c
    add n,ax
    mov ax,n

    mov ah,1
    int 21h 
    sub al,30h
    mov ah,0
    add n,ax
    mov ax,n 
    mNum endm
mRes macro r
    mov ah,01h
    int 21h
    sub al,30h
    mov r,al
    mRes endm
.stack
.data 
  Nombre db 13,10," Vazquez Munoz Angel Francisco$"
  salto db 13,10,"$"
  men1  db "Mayor a menor/menor a mayor$"
  men2 db 13,10,"Ingresa el numero $"
  men3 db 13,10,"Mayor a menor $"
  men4 db 13,10,"Menor a mayor $"
  men5 db 13,10,"Menor a mayor (1) o Mayor a menor (2)?$"
  n1 dw 0
  n2 dw 0
  n3 dw 0
  n4 dw 0
  a dw 1000
  b dw 100
  c dw 10
  n db 3
  res db 0
.code
mMen Nombre
mSalto
mMen men1
;num1
mMen men2
mNum n1
;num2
mMen men2
mNum n2
;num3
mMen men2
mNum n3
;num4
mMen men2
mNum n4

mSalto
xor cx,cx 
;Inicio del ciclo
Ciclo:

uno:
mov ax,n1
mov bx,n2
cmp ax,bx
jae p
jb p1
p:
mov n1,ax
mov n2,bx
jmp dos
p1:
mov n2,ax
mov n1,bx
jmp dos
dos:
mov ax,n2
mov bx,n3
cmp ax,bx
jae p2
jb p3
p2:
mov n2,ax
mov n3,bx
jmp tres
p3:
mov n3,ax
mov n2,bx
jmp tres
tres:
mov ax,n3
mov bx,n4
cmp ax,bx
jae p4
jb p5
p4:
mov n3,ax
mov n4,bx
jmp com
p5:
mov n4,ax
mov n3,bx
jmp com
com:
cmp cl,n
ja  siga
inc cl
jmp Ciclo

siga:
;Imprimir numeros
;Menu menor o mayor
mSalto
mMen men5
mRes res
cmp res,1
je menor
jb siga
cmp res,2
je mayor
ja siga

menor:
mSalto
mov ax,n4
call Cap
mSalto
mov ax,n3
call Cap
mSalto
mov ax,n2
call Cap
mSalto
mov ax,n1
call Cap
.exit

mayor:
mMen men3
;
mSalto
mov ax,n1
call Cap
;
mSalto
mov ax,n2
call Cap
;
mSalto
mov ax,n3
call Cap
;
mSalto
xor ax,ax
mov ax,n4
call Cap
.exit

Cap proc near
     xor cx,cx
     xor bx,bx
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
     
Cap endp

ret