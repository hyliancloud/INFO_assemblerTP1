; Author : MARTI Emilie
; Created on : 10/10/2018
; Objective : Read one integer from input and display the number of occurrencies of 1 in its binary form.

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
msg1 : db "Enter a number please : ", 0
space : db " ", 0
newline : db 10, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
_int : resd 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global main
main:

; a = x (on stocke un input)
; while a != 0
; b = a -1 
; a = a and b
; c++
; end
	; take user input
	mov eax, msg1
	call print_string
	
	call read_int
	mov [_int], eax

	; ecx will be my counter
	mov ecx, 0

for:
	mov eax, [_int]
	; exit for loop if eax, which contains the updated _int, equals 0
	cmp eax, 0
	je end_for

	sub eax, 1
	mov ebx, eax

	and [_int], ebx
	add ecx, 1
	jmp for
end_for:

	; print counter value
	mov eax, ecx
	call print_int

	; print an \n-like character
	mov eax, newline
	call print_string

    ; end of programm
    mov ebx, 0
    mov eax, 1
    int 0x80