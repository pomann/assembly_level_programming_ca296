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
max			DWORD	0

.code
	main:nop

		invoke version
		invoke fillWithRandomValues, offset x, 10, 100
		invoke writeArray, offset x, 10

		l0:
		cmp y, 40
		je done
		mov eax, offset x
		add eax, y
		mov eax, [eax]
		add y, 4
		cmp max, eax
		jl add1
		jge l0


		add1:
		mov max, eax
		jmp l0


		done:
		invoke writeInteger, max
		invoke ExitProcess,0

	end main
