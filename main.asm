 .386                   
.model flat, stdcall
.stack 4096                   
option casemap :none                    

;Includes
include \masm32\include\windows.inc     
include \masm32\macros\macros.asm       
include \masm32\include\masm32.inc
include \masm32\include\gdi32.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\gdi32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

.data
    frase       db      "Alo Sergio", 0 ; Frase a ser invertida
    lenFrase    dd      10 ; Tamanho da frase

.code
_start:
    mov eax, offset frase 
    mov ebx, 0        
    mov ecx, lenFrase

; Realiza a troca de ponteiros da posicao ebx (0) com a posicao ecx (lenFrase) ate que ebx chegue a lenFrase / 2
fazTroca:
    dec ecx ; Decrementa o valor de ecx

    mov dh, byte ptr[eax + ebx] ; Move para dh o ponteiro (letra) indexado de ebx
    mov dl, byte ptr[eax + ecx] ; Move para dl o ponteiro (letra) indexado de ecx

    mov byte ptr[eax + ebx], dl ; Na posicao de ebx, coloca o valor (ponteiro) de dl, que no era o valor de ecx
    mov byte ptr[eax + ecx], dh ; Na posicao de ecx, coloca o valor (ponteiro) de dh, que era o valor de ebx

    inc ebx ; Incrementa ebx

    cmp ebx, 5 ; Ve se ebx eh menor que lenFrase / 2
    jne fazTroca ; Se for menor volta para o funcao, senao avanca
    print eax ; Printa eax, apos a troca de ponteiros
    end _start ; Finaliza funcao



