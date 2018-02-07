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
min			DWORD	11
loc			DWORD	0
cwi			DWORD	0
low1		DWORD	-11
hi			DWORD	0


.code
	main:nop

		invoke version
		invoke fillWithRandomValues, offset x, 10, 10
		invoke writeArray, offset x, 10

		l0:
		cmp y, 40
		je l2
		mov eax, offset x
		add eax, y
		mov eax, [eax]
		add y, 4
		cmp low1, eax
		jge l0


		cmp min, eax
		jl l0

		l1:
		mov min, eax
		pop loc
		jmp l0

		l2:
		cmp min, 11
		je l3
		invoke writeInteger, min
		l3:
		inc cwi
		mov y, 0
		mov eax, min
		mov low1, eax
		mov min, 11
		cmp cwi, 10
		jne l0

		done:
		mov eax, 4
		mov ebx, x[8]
		mov x[eax], ebx
		invoke writeArray, offset x, 10
		invoke ExitProcess,0

	end main
