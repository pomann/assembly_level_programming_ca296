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

EXTERNDEF decrease:near
;
; Data & Code
;

.data
x			DWORD	0

.code
	decrease:nop
		push ebp
		mov ebp, esp

		invoke writeInteger, [ebp + 8]
		mov eax, [ebp + 8]
		dec eax
		

		mov esp, ebp
		pop ebp
		ret 4

	end decrease
