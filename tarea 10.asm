org 100h
    mLimpiarPantalla macro
        mov ax,0600h
        mov bh,07h
        mov ch,00h
        mov cl,00h
        mov dh,19h
        mov dl,4fh
        int 10h
    mLimpriarPantalla endm    
    mCursor macro
        mov ah,02h
        mov bh,00h
        mov dl,02
        int 10h
    mCursor endm
    mImp macro
        mov ah,09h
        int 21h
    mImp endm
    mResp macro
        mov ah,01h
        int 21h
        sub al,30h
        mov Res,al
    mResp endm
    mMenu macro
         mov ah,1
        cmp ah,Res
        je uno 
        mov ah,2
        cmp ah,Res
        je dos
        mov ah,3
        cmp ah,Res
        je tres
        mov ah,4
        cmp ah,Res
        je cuatro
        mov ah,5
        cmp ah,Res
        je cinco
        mov ah,6
        cmp ah,Res
        je seis
        mov ah,7
        cmp ah,Res
        je siete
        mov ah,8
        cmp ah,Res
        je ocho
        mov ah,9
        cmp ah,Res
        je nueve
    mMenu endm
    mSalto macro
       mov ah,09h
       lea dx,men
       int 21h
       mSalto endm
    mOperacion macro
        mov al,mult
        mul cx
        
        aam
        mov uni,al
        mov al,ah  
        aam
        mov cen,ah
        mov dece,al 
        ;
        mov ah,02h
        mov dl,cen
        add dl,30h
        int 21h
        
        mov dl,dece
        add dl,30h
        int 21h

        mov dl,uni
        add dl,30h
        int 21h
        mSalto
    mOperacion endm
.model small
.stack
.data
    nom db "Vazquez Munoz Angel Francisco$"
    mes db "Seleccione la tabla que guste$"
    m   db "Tablas$"
    m1  db "1:5$"
    m2  db "2:6$"
    m3  db "3:7$"
    m4  db "4:8$"
    m5  db "5:9$"
    m6  db "6:10$"
    m7  db "7:15$"
    m8  db "8:37$"
    m9  db "9:Salir$"
    Res     db 0
    mult    db 0
    men     db 13,10,'$'
    uni     db 0
    dece    db 0
    cen     db 0
.code
    mov ax,@data
    mov ds,ax
    
    mov dh,0
    mCursor
    lea dx,nom
    mImp  
    
    mov dh,1
    mCursor
    lea dx,mes
    mImp 
    
    mov dh,2
    mCursor
    lea dx,m
    mImp
    
    mov dh,3
    mCursor
    lea dx,m1
    mImp
    
    mov dh,4
    mCursor
    lea dx,m2
    mImp
    
    mov dh,5
    mCursor
    lea dx,m3
    mImp
    
    mov dh,6
    mCursor
    lea dx,m4
    mImp
    
    mov dh,7
    mCursor
    lea dx,m5
    mImp
    
    mov dh,8
    mCursor
    lea dx,m6
    mImp
    
    mov dh,9
    mCursor
    lea dx,m7
    mImp
    
    mov dh,10
    mCursor
    lea dx,m8
    mImp
    
    mov dh,11
    mCursor
    lea dx,m9
    mImp
    
    mSalto
    mResp
    mMenu
   ;Escoger opciones
      
    uno:
        mLimpiarPantalla
        add mult,5
        mov cl,1
        mSalto
        Ciclo:
        
        mOperacion
          
        cmp cx,10
        je r
        inc cx
        jmp Ciclo 
            
        r:
                
        .exit
    dos:
        mLimpiarPantalla
        add mult,6
        mov cl,1
        mSalto
        Ciclo1:
        
        mov al,mult
        mOperacion
          
        cmp cx,10
        je r1
        inc cx
        jmp Ciclo 
            
        r1:
                
        .exit
    .exit
    tres:
        mLimpiarPantalla
        add mult,7
        mov cl,1
        
        mSalto
        Ciclo2:
        
        mOperacion
          
        cmp cx,10
        je r2
        inc cx
        jmp Ciclo 
            
        r2:
                
        .exit
    .exit
    cuatro:
        mLimpiarPantalla
        add mult,8
        mov cl,1
        mSalto
        Ciclo3:
        
        mOperacion
          
        cmp cx,10
        je r3
        inc cx
        jmp Ciclo 
            
        r3:
                
        .exit
    .exit
    cinco:
        mLimpiarPantalla
        add mult,9
        mov cl,1
        mSalto
        Ciclo4:
        
        mOperacion
          
        cmp cx,10
        je r4
        inc cx
        jmp Ciclo 
            
        r4:
                
        .exit
    .exit
    seis:
        mLimpiarPantalla

        add mult,10
        mov cl,1
        mSalto
        Ciclo5:
        
        mOperacion
          
        cmp cx,10
        je r5
        inc cx
        jmp Ciclo 
            
        r5:      
        .exit
    .exit
    siete:
    ;Las variables cambian a dw
        mLimpiarPantalla
        
        add mult,15
        mov cl,1
        mSalto
        Ciclo6:
        
        mOperacion
          
        cmp cx,10
        je r6
        inc cx
        jmp Ciclo 
            
        r6:      
        .exit
    .exit
    ocho:
        mLimpiarPantalla
        add mult,037
        add cl,1
        mSalto
        Ciclo7:
        
        mOperacion
        
        
        mSalto
        cmp cx,6
        je r7
        inc cx
        jmp Ciclo7 
            
        r7:      
        .exit
    .exit
    nueve:
        mLimpiarPantalla
        mov ax,4c00h
        int 21h
    
    .exit
    
    
    terminar:
    mov ax,4c00h
    int 21h
    
;--------------------------------------------------
        

ret




dd dl,30h
        int 21h

        mov dl,uni
        add dl,30h
        int 21h
          
        cmp cx,10
        je r4
        inc cx
        jmp Ciclo 
            
        r4:
                
        .exit
    .exit
    seis:
        mLimpiarPantalla

        add mult,10
        mov cl,1
        
        Ciclo5:
        mSalto
        mov al,mult
        mul cx
        
        aam
        mov uni,al
        mov al,ah  
        aam
        mov cen,ah
        mov dece,al 
        ;
        mov ah,02h
        mov dl,cen
        add dl,30h
        int 21h
        
        mov dl,dece
        add dl,30h
        int 21h

        mov dl,uni
        add dl,30h
        int 21h
          
        cmp cx,10
        je r5
        inc cx
        jmp Ciclo 
            
        r5:      
        .exit
    .exit
    siete:
    ;Las variables cambian a dw
        mLimpiarPantalla
        
        add mult,15
        mov cl,1
        
        Ciclo6:
        mSalto
        mov al,mult
        mul cx
        
        aam
        mov uni,al
        mov al,ah  
        aam
        mov cen,ah
        mov dece,al 
        ;
        mov ah,02h
        mov dl,cen
        add dl,30h
        int 21h
        
        mov dl,dece
        add dl,30h
        int 21h

        mov dl,uni
        add dl,30h
        int 21h
          
        cmp cx,10
        je r6
        inc cx
        jmp Ciclo 
            
        r6:      
        .exit
    .exit
    ocho:
        mLimpiarPantalla
        add mult2,37
        add cx,1
        Ciclo7:
        
        mov ax,mult2
        mul cx
        mov res1,ax
        
        
        AAM

        mov ax,bx
        mov ah,02h
        mov dx,bx
        add dl,30h
        int 21h
        
        ;Unidades
        mov dx,ax
        mov ah,02h
        mov dx,dx
        add dl,30h
        int 21h
        
        
        
        mSalto
        cmp cx,10
        je r7
        inc cx
        jmp Ciclo7 
            
        r7:      
        .exit
    .exit
    nueve:
        mLimpiarPantalla
        mov ax,4c00h
        int 21h
    
    .exit
    
    
    terminar:
    mov ax,4c00h
    int 21h
    
;--------------------------------------------------


        

ret




0h
    int 21h
    
;--------------------------------------------------


        

ret




