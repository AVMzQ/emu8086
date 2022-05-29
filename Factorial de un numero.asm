org 100h
mNum2 macro n
    mov ah,01h
    int 21h
    sub al,30h
    mov n,al
    mNum2 endm
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
  men  db 13,10, "Calcular el factorial de? $"
  men2 db 13,10,"Resultado= $"
  salto db " $"
  n1 dw 1
  n2 db ?
  a dw ?
.code
mMen Nombre
mMen men
;Numero factorial
mNum2 n2
;Operacion
mov cl,2
xor ax,ax
mov ax,n1
Ciclo: 
mul cx
mov a,ax

cmp cl,n2
je Imprime
inc cx
jmp Ciclo
Imprime:
mSalto    
mMen men2

xor cx,cx

mov ax,a
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





