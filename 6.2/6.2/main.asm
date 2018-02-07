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

.data
x			DWORD	10 DUP(0)
y			DWORD	0
count		DWORD	0

.code
	main:nop

		invoke version
		invoke fillWithRandomValues, offset x, 10, 50
		invoke writeArray, offset x, 10

		l1:
		mov eax, offset x
		add eax, y
		mov eax, [eax]
		add count, eax
		add y, 4
		cmp y, 40
		jne l1

		invoke writeInteger, count


		invoke ExitProcess,0

	end main
