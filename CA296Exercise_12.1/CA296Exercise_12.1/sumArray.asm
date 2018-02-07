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

EXTERNDEF sumArray:near


.code
	sumArray:nop
		push ebp
		mov ebp,esp

		mov ebx, [ebp + 12]
		mov edx, [ebp + 8]
		mov ecx, 0
		mov eax, 0
		l1:
		cmp ebx, 0
		je done
		add eax, [edx]
		add edx, 4
		dec ebx
		jmp l1
		done:
		mov esp,ebp
		pop ebp
		ret 8

	end sumArray
