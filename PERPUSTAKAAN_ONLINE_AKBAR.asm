   .MODEL SMALL
.CODE
ORG 100H
JMP MULAI

nama    DB 0dh, 0ah, 0dh, 0ah, "masukan nama anda : ", '$'
id      DB 0dh, 0ah, "masukan kartu id anda : ", '$'
psn1    DB "PROGRAM PERPUSTAKAN ONLINE SEDERHANA", 0dh, 0ah, "---------------------------------------------", '$'
psn2    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Selamat datang diperpustakaan akbar zaqi...", '$'
psn3    DB 0dh, 0ah, "Buku yang tersedia saat ini : ", 0dh, 0ah
        DB "============================ " , 0dh, 0ah
        DB "=       1. Buku 1          = " , 0dh, 0ah
        DB "=       2. Buku 2          = " , 0dh, 0ah
        DB "=       3. Buku 3          = " , 0dh, 0ah
        DB "============================ ", 0dh, 0ah
        DB 0dh, 0ah, 'Buku apa yang ingin kamu baca? $'
psn4    DB 0dh, 0ah, 'Selamat membaca....$'
psn5    DB 0dh, 0ah, "Terima kasih telah berkunjung diperpustakaan akbar zaqi", '$'
psn6    DB 0dh, 0ah, "Ingin membaca buku lain? (Y/N)", '$'
eror   DB 0dh, 0ah, "Masukan kode dengan benar!", '$'  
msg1:    db 0dh, 0ah, 0dh, 0ah, "============ Buku 1 =============", 0dh, 0ah,0dh, 0ah,"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",0dh, 0ah, 0dh, 0ah, '$'
msg2:    db 0dh, 0ah, 0dh, 0ah, "============ Buku 2 =============", 0dh, 0ah,"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ",0dh, 0ah, 0dh, 0ah, '$'
msg3:    db 0dh, 0ah, 0dh, 0ah, "============ Buku 3 =============", 0dh, 0ah,"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ",0dh, 0ah, 0dh, 0ah, '$'  

tampung_nama db 30, ?, 30 dup(?)
tampung_id   db 30, ?, 30 dup(?)

MULAI:
lea dx, psn1
mov ah, 9
int 21h

lea dx, nama
mov ah, 9
int 21h

mov ah, 0ah
lea dx ,tampung_nama
INT 21h
push dx

lea dx, id
mov ah, 9
int 21h

mov ah, 0ah
lea dx, tampung_id 
INT 21h
push dx 

lea dx, psn2
mov ah, 9
int 21h

MULAI2:
lea dx, psn3
mov ah, 9
int 21h

proses:

mov ah, 01
int 21h

cmp al, '1'
je buku_1 

cmp al, '2'
je buku_2

cmp al, '3'
je buku_3

jne psn_eror

proses2: 

lea dx, psn6
mov ah, 9
int 21h
mov ah, 01
int 21h

cmp al, 'Y'
je baca_lagi

cmp al, 'N'
je baca_selesai

jne psn_eror 

buku_1:
    lea dx, psn4
    mov ah, 9
    int 21h
    mov dx, msg1
    mov ah, 9
    int 21h
    jmp proses2
    
buku_2:
    lea dx, psn4
    mov ah, 9
    int 21h
    mov dx, msg2
    mov ah, 9
    int 21h
    jmp proses2
  
buku_3:       
    lea dx, psn4
    mov ah, 9
    int 21h
    mov dx, msg3
    mov ah, 9
    int 21h
    jmp proses2
    
baca_lagi:
    jmp MULAI2

baca_selesai:
    lea dx, psn5
    mov ah, 9
    int 21h
    int 20h
    jmp EXIT

psn_eror:
    lea dx, eror  
    mov ah, 9
    int 21h
    int 20h
    jmp EXIT
    
EXIT:
RET
    
    
    
    


