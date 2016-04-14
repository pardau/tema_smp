;mov ax, 102Ah
;out 1, ax
;mov ax, 0000h
;in  ax, 

org 100h
;curata ecranul
mov ax,0600h 
mov bh,07
mov cx,0000 ;incepand cu randul 00 si coloana 00
mov dx,184fh ;pana la randul 18h si coloana 4fh
int 10h ;intrerupere pentru curatarea ecranului
mov ah,00 
mov al,13h ;mod=13(CGA High resolution)
int 10h ;intrerupere pentru schimbare video

    ; Deseneaza brad  
    

include 'emu8086.inc'  

START: 
CALL PTHIS
DB 13, 10, 'introduceti numarul de brazi de afisat(1/2) ', 0
CALL scan_num
mov AX, CX
CMP AX, 0
JE exit
cmp ax, 1      
je un_brad 



exit:

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS

       



;BRAD2
;linie stanga verticala trunchi
mov cx,55
mov dx,120
treLTV2: mov ah,0ch
mov al,06h
int 10h
dec dx
cmp dx,80
jnz treLTV2 

mov dl, 07h ;in dl se incarca tipul sunetului (bell tone)
mov ah, 2  ;in ah se incarca numarul functiei
int 21h  

; linie verticala dreapta trunchi
mov cx,71
mov dx,120
treRTV2: mov ah,0ch
mov al,06h
int 10h
dec dx
cmp dx,80
jnz treRTV2    

mov dl, 07h ;in dl se incarca tipul sunetului (bell tone)
mov ah, 2  ;in ah se incarca numarul functiei
int 21h


mov dx,80
mov bx,101
DrwTree2: ;deseneaza frunzele cu 3 comenzi jmp
mov cx,126
sub cx,bx ;pastreaza liniile simetrice
GrTree2: mov ah,0ch
mov al,02h ;seteaza culoarea frunzelor
int 10h
inc cx
cmp cx,bx
jnz GrTree2
cmp bx,65 ;cand bx ajunge la o valoare prestabilita
jle break1 ;iese din ciclu
sub dx,3 ;muta linia verde mai sus
sub bx,2 ;ingusteaza la fiecare trecere liniile

jmp DrwTree2
break1:   

mov dl, 07h ;in dl se incarca tipul sunetului (bell tone)
mov ah, 2  ;in ah se incarca numarul functiei
int 21h 

;gata brad  



un_brad:
;linie stanga verticala trunchi
mov cx,155
mov dx,120
treLTV3: mov ah,0ch
mov al,06h
int 10h
dec dx
cmp dx,80
jnz treLTV3 

mov dl, 07h ;in dl se incarca tipul sunetului (bell tone)
mov ah, 2  ;in ah se incarca numarul functiei
int 21h  

; linie verticala dreapta trunchi
mov cx,171
mov dx,120
treRTV3: mov ah,0ch
mov al,06h
int 10h
dec dx
cmp dx,80
jnz treRTV3    

mov dl, 07h ;in dl se incarca tipul sunetului (bell tone)
mov ah, 2  ;in ah se incarca numarul functiei
int 21h


mov dx,80
mov bx,201
DrwTree3: ;deseneaza frunzele cu 3 comenzi jmp
mov cx,326
sub cx,bx ;pastreaza liniile simetrice
GrTree3: mov ah,0ch
mov al,02h ;seteaza culoarea frunzelor
int 10h
inc cx
cmp cx,bx
jnz GrTree3
cmp bx,165 ;cand bx ajunge la o valoare prestabilita
jle break2 ;iese din ciclu
sub dx,3 ;muta linia verde mai sus
sub bx,2 ;ingusteaza la fiecare trecere liniile

jmp DrwTree3
break2:   

mov dl, 07h ;in dl se incarca tipul sunetului (bell tone)
mov ah, 2  ;in ah se incarca numarul functiei
int 21h 

;gata brad3


