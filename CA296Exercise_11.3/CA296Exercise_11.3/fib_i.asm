;
; CA296 Console Template
; Version 1
;

;
; Preamble
;

.586
.model flat,stdcall
.stack 4096
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

includelib p:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib

EXTERNDEF fib_i:near

.code
	fib_i:nop
		push ebp
		mov ebp, esp

		mov edx, [ebp+8] ; counter
		mov eax, 0
		mov ebx, 1
		l0:
		cmp eax, ebx
		jg l1

		add eax, ebx
		dec edx
		cmp edx, 0
		jne l0
		mov eax,ebx
		jmp done


		l1:
		add ebx,eax

		l2:
		dec edx
		cmp edx, 0
		jne l0

		done:
		mov esp, ebp
		pop ebp
		ret 4

	end fib_i
