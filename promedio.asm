org 100h
mCalificacion macro n
    mov ah,1
    int 21h
    sub al,30h
    mov ah,0
    mul a
    mov n1,ax
    mov ax,n1

    mov ah,1
    int 21h
    sub al,30h
    mov ah,0
    mul b
    add n1,ax
    mov ax,n1
    
    mov ah,1
    int 21h 
    sub al,30h
    mov ah,0
    add n1,ax
    mov ax,n1 
    mCalificacion endm
mTotalClif macro n1
    mov ah,01h
    int 21h
    sub al,30h
    mov n1,al
    mTotalClif endm
mMen macro mensa
    mov ah,09h
    lea dx,mensa
    int 21h
    mMen endm
mSalto macro
    mov ah,09h
    lea dx,men
    int 21h
    mSalto endm
.stack
.data 
  Nombre db 13,10," Vazquez Munoz Angel Francisco$"
  men  db 13,10,"Calcular el promedio de calificaciones$"
  men2 db 13,10,"Total de materias? $"
  men3 db 13,10,"Calificacion= $"
  men4 db 13,10,"Promedio= $"
  n1 dw ?
  n2 db ?
  sum dw 0
  res db 0
  
  a dw 100
  b dw 10
.code
mMen Nombre
mMen men
mMen men2
mTotalClif n2


xor cx,cx
mov cl,1
Ciclo:
mMen men3
mCalificacion n1

mov ax,n1
add ax,sum
mov sum,ax

cmp cl,n2        
je Imprime
inc cl
jmp Ciclo

Imprime:
mSalto
mMen men4

xor cx,cx


mov ax,sum
div n2
mov res,al

xor ax,ax

mov al,res
mov sum,ax
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




