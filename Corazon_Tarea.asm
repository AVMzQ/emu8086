
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack
.data
    datos db "Vazquez Munoz Angel Francisco $"
    datos2 db "182310137 $"
.code

   
    
    ; 4fh = rojo
    ; 0= negro
    ; 7=blanco
    
       
    mov ax,@data 
    mov ds,ax
    
    mov ah,02h
    mov dh,01d
    mov dl,20d
    int 10h
    
    
    ;Fondo
    mov ax,0600h
    mov bh,70h
    mov ch,00h
    mov cl,00h
    mov dh,24d
    mov dl,79d
    int 10h
    
       
    mov ah,09h
    lea dx,datos
    int 21h
    
           
    mov ah,09h
    lea dx,datos2
    int 21h
    
              
            
   
    ;Contorno
    mov ax,0600h
    mov bh,07h
    mov ch,07d ;desplazamiento hacia abajo
    mov cl,35d ;desplazamiento ->
    mov dh,07d
    mov dl,38d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    mov ch,08d   ;desplazamiento hacia abajo
    mov cl,39d   ;desplazamiento ->
    mov dh,08d
    mov dl,39d
    int 10h 
         
    mov ax,0600h
    mov bh,07h
    mov ch,09d   ;desplazamiento hacia abajo
    mov cl,40d   ;desplazamiento ->
    mov dh,09d
    mov dl,40d
    int 10h
    
    ;mitad derecha
    mov ax,0600h
    mov bh,07h
    mov ch,08d   ;desplazamiento hacia abajo
    mov cl,41d   ;desplazamiento ->
    mov dh,08d
    mov dl,41d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,07d   ;desplazamiento hacia abajo
    mov cl,42d   ;desplazamiento ->
    mov dh,07d
    mov dl,45d
    int 10h 
    
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,08d   ;desplazamiento hacia abajo
    mov cl,46d   ;desplazamiento ->
    mov dh,08d
    mov dl,46d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,09d   ;desplazamiento hacia abajo
    mov cl,47d   ;desplazamiento ->
    mov dh,10d
    mov dl,47d
    int 10h    
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,11d   ;desplazamiento hacia abajo
    mov cl,46d   ;desplazamiento ->
    mov dh,11d
    mov dl,46d
    int 10h
        
    mov ax,0600h
    mov bh,07h
    
    mov ch,12d   ;desplazamiento hacia abajo
    mov cl,45d   ;desplazamiento ->
    mov dh,12d
    mov dl,45d
    int 10h            
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,13d   ;desplazamiento hacia abajo
    mov cl,44d   ;desplazamiento ->
    mov dh,13d
    mov dl,44d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,14d   ;desplazamiento hacia abajo
    mov cl,43d   ;desplazamiento ->
    mov dh,14d
    mov dl,43d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,15d   ;desplazamiento hacia abajo
    mov cl,42d   ;desplazamiento ->
    mov dh,15d
    mov dl,42d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,16d   ;desplazamiento hacia abajo
    mov cl,41d   ;desplazamiento ->
    mov dh,16d
    mov dl,41d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,17d   ;desplazamiento hacia abajo
    mov cl,40d   ;desplazamiento ->
    mov dh,17d
    mov dl,40d
    int 10h
    
    ;mitad izquierda  
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,16d   ;desplazamiento hacia abajo
    mov cl,39d   ;desplazamiento ->
    mov dh,16d
    mov dl,39d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,15d   ;desplazamiento hacia abajo
    mov cl,38d   ;desplazamiento ->
    mov dh,15d
    mov dl,38d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,14d   ;desplazamiento hacia abajo
    mov cl,37d   ;desplazamiento ->
    mov dh,14d
    mov dl,37d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,13d   ;desplazamiento hacia abajo
    mov cl,36d   ;desplazamiento ->
    mov dh,13d
    mov dl,36d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,12d   ;desplazamiento hacia abajo
    mov cl,35d   ;desplazamiento ->
    mov dh,12d
    mov dl,35d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,11d   ;desplazamiento hacia abajo
    mov cl,34d   ;desplazamiento ->
    mov dh,11d
    mov dl,34d
    int 10h
    
    mov ax,0600h
    mov bh,07h
    
    mov ch,09d   ;desplazamiento hacia abajo
    mov cl,33d   ;desplazamiento ->
    mov dh,10d
    mov dl,33d
    int 10h
    
     mov ax,0600h
    mov bh,07h
    
    mov ch,08d   ;desplazamiento hacia abajo
    mov cl,34d   ;desplazamiento ->
    mov dh,08d
    mov dl,34d
    int 10h
    
    
    ;color    primera mitad
    mov ax,0600h
    mov bh,4fh
    
    mov ch,08d   ;desplazamiento hacia abajo
    mov cl,35d   ;desplazamiento ->
    mov dh,08d
    mov dl,38d
    int 10h
     
    mov ax,0600h
    mov bh,4fh
    
    mov ch,09d   ;desplazamiento hacia abajo
    mov cl,34d   ;desplazamiento ->
    mov dh,09d
    mov dl,39d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,10d   ;desplazamiento hacia abajo
    mov cl,34d   ;desplazamiento ->
    mov dh,10d
    mov dl,40d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,11d   ;desplazamiento hacia abajo
    mov cl,35d   ;desplazamiento ->
    mov dh,11d
    mov dl,40d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,12d   ;desplazamiento hacia abajo
    mov cl,36d   ;desplazamiento ->
    mov dh,12d
    mov dl,40d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,13d   ;desplazamiento hacia abajo
    mov cl,37d   ;desplazamiento ->
    mov dh,13d
    mov dl,40d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,14d   ;desplazamiento hacia abajo
    mov cl,38d   ;desplazamiento ->
    mov dh,14d
    mov dl,40d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,15d   ;desplazamiento hacia abajo
    mov cl,39d   ;desplazamiento ->
    mov dh,15d
    mov dl,40d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,16d   ;desplazamiento hacia abajo
    mov cl,40d   ;desplazamiento ->
    mov dh,16d
    mov dl,40d
    int 10h
    
    ;8 Color segunda mitad
    mov ax,0600h
    mov bh,4fh
    
    mov ch,08d   ;desplazamiento hacia abajo
    mov cl,42d   ;desplazamiento ->
    mov dh,08d
    mov dl,45d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,09d   ;desplazamiento hacia abajo
    mov cl,41d   ;desplazamiento ->
    mov dh,09d
    mov dl,46d
    int 10h
    
     mov ax,0600h
    mov bh,4fh
    
    mov ch,10d   ;desplazamiento hacia abajo
    mov cl,41d   ;desplazamiento ->
    mov dh,10d
    mov dl,46d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,11d   ;desplazamiento hacia abajo
    mov cl,41d   ;desplazamiento ->
    mov dh,11d
    mov dl,45d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,12d   ;desplazamiento hacia abajo
    mov cl,41d   ;desplazamiento ->
    mov dh,12d
    mov dl,44d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,13d   ;desplazamiento hacia abajo
    mov cl,41d   ;desplazamiento ->
    mov dh,13d
    mov dl,43d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,14d   ;desplazamiento hacia abajo
    mov cl,41d   ;desplazamiento ->
    mov dh,14d
    mov dl,42d
    int 10h
    
    mov ax,0600h
    mov bh,4fh
    
    mov ch,15d   ;desplazamiento hacia abajo
    mov cl,41d   ;desplazamiento ->
    mov dh,15d
    mov dl,41d
    int 10h
    
    
    
    
    
    
    
    
    
     
    mov ax,4c00h
    int 21h

ret





ret




