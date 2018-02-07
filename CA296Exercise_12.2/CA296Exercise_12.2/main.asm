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

EXTERNDEF counts:near

;
; Data & Code
;

.data
x			DWORD	7
lst			DWORD	20,-5,21,0,22,-8,23
z			DWORD	0
msg			BYTE	'%d %d %d',10,0

.code
	main:nop

		invoke version
		push x
		push offset lst
		call counts
		mov ebx,[eax + 4]
		mov ecx,[eax + 8]
		mov eax, [eax]
		invoke crt_printf, addr msg, eax, ebx, ecx
		invoke ExitProcess,0

	end main
