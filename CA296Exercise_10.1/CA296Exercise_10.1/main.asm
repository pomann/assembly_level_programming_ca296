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


;
; Data & Code
;

EXTERNDEF multiple:near

.data
x			DWORD	0

.code
	main:nop

		invoke version
		l1:
		push x
		call multiple
		invoke writeInteger, eax
		inc x
		cmp x, 20
		jne l1
		invoke ExitProcess,0

	end main
