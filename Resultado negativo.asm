
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
  men1 db  "Resultado negativo$"
  men2 db 13,10, "Ingrese numero $"
  negati db 13,10,"-$"
  n1 dw 0
  n2 dw 0
  a dw 1000
  b dw 100 
  c dw 10
  res dw 0 
.code
mMen Nombre
mSalto
mMen men1
mSalto
mMen men2
mNum n1
mMen men2
mNum n2
mSalto

mov ax,n1
mov bx,n2



cmp ax,bx
ja pos
jb negativo

pos:
sub ax,n2
mov res,ax
xor cx,cx
mov ax,res
mov bx,10

valor1:
xor dx,dx   
div bx 
push dx
inc cx
test ax,ax
jnz valor1

mostrar1:
pop dx
add dl,30h
mov ah,02h
int 21h
loop mostrar1
.exit 
;-------------------------------------------------
negativo:
sub ax,n2
mov res,ax
Neg res
mMen negati
xor cx,cx
mov ax,res
mov bx,10

valor:
xor dx,dx   
div bx 
push dx
inc cx
test ax,ax
jnz valor

mostrar:
pop dx
add dl,30h
mov ah,02h
int 21h
loop mostrar
.exit

ret        




