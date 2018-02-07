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

EXTERNDEF max:near

.code
	max:nop
		push ebp
		mov ebp, esp

		mov ebx, [ebp+8]
		cmp ebx, [ebp+12]
		jg l1

		mov eax, [ebp+12]
		jmp done

		l1:
		mov eax, [ebp+8]

		done:

		mov esp,ebp
		pop ebp
		ret 8

	end max
