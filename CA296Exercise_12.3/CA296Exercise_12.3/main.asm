

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

EXTERNDEF swap:near

;
; Data & Code
;

.data
x			DWORD	5
y			DWORD	1,-2,3,-4,5
z			DWORD	3
e			DWORD	2

.code
	main:nop

		invoke version
		invoke writeArray, offset y, x
		push x
		push e
		push z
		push offset y
		call swap
		invoke ExitProcess,0

	end main
