.model small
.stack
.data
m1 db 10, "Introduceti o valoare binara:", "$"
m2 db 10, "Programul dvs. a rulat cu succes !", "$"
m3 db 10, "Valoarea numarului dvs. binar in zecimal este: ", "$"
m4 db 10, "Valoarea introdusa nu e binara, va rugam mai incercati o data ! ", "$"

.code

main proc
    mov cx, 0 ; init pe contor
    mov bx, 10 ; pentru inmultirea cu 10

    mov ax, seg m1 ; afisam m1
    mov ds, ax
    mov ah, 09h
    lea dx, m1
    int 21h

citire:
    
    mov ax, 0; initializam ax
    mov ah,01h ; citim nr binar cu echo
    int 21h
    
    ;    cmp al,30h ; valideaza cifra 0
    ;je citire
    ;jl eject
    ;cmp al,31h ; valideaza cifra 1
    ;jg eject
    ;je citire
    
    cmp al, 13 ; iese din citire daca introducem enter
    je afisare
    
    mov ah, 0
    sub al, 30h ; ramanem cu valoarea numarului nostru binar 
    mov dx, 0 ; initializam data segment  
    mul bx ; inmultim cu zece numarul nostru
    mov dl, al ; punem valoarea in dl
    push dx
    inc cx ;    

afisare:
    pop bx
    add bl, 30h
    mov dl, bl
    mov ah, dl
    int 21h
    loop afisare
    
    
;eject:
    
;    mov ax, seg m4 ; afisam m4
;    mov ds, ax
;    mov ah, 09h
;    lea dx, m4
;    int 21h


    
iesire:
    mov ah, 4ch
    int 21h


main endp
end main