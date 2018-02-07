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

;
; Data & Code
;

.data
x			DWORD	8
y			DWORD	7

.code
	main:nop

		invoke version
		
		push y
		push x
		call max
		invoke writeInteger, eax

		invoke ExitProcess,0

	end main
