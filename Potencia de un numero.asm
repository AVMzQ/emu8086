org 100h
mNum macro n
    mov ah,1
    int 21h 
    sub al,30h
    mov ah,0
    add n,ax
    mov ax,n
    mNum endm
mPoten macro n1
    mov ah,01h
    int 21h
    sub al,30h
    mov n1,al
    mPoten endm
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
.stack
.data 
  Nombre db 13,10," Vazquez Munoz Angel Francisco$"
  men  db 13,10,"Calcular la potencia de un numero$"
  men2 db 13,10,"Numero? $"
  men3 db 13,10,"Potencia? $"
  men4 db 13,10,"Resultado= $"
  salto db " $"
  n1 dw ?
  n2 db ?
  res dw ?
  
.code
mMen men
mMen men2
mNum n1

mMen men3
mPoten n2

;Operacion
xor cx,cx

mov cl,2
xor ax,ax
mov ax,n1

Ciclo:
mul n1
mov res,ax

cmp cl,n2
je Imprime
inc cl
jmp Ciclo
Imprime:
mSalto
mMen men4

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




