

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

.data
y			DWORD	3 dup(0)

.code
	counts:nop
		push ebp
		mov ebp, esp

		mov edx, [ebp + 12]
		mov ebx, [ebp + 8]
		l0:
		mov ecx, [ebx]
		mov eax, 0
		cmp ecx, 0
		je zero
		jg posi
		mov eax, offset y
		inc DWORD ptr[eax]
		jmp l1

		zero:
		mov eax, offset y
		add eax, 4
		inc DWORD ptr[eax]
		jmp l1

		posi:
		mov eax, offset y
		add eax, 8
		inc DWORD ptr[eax]

		l1:
		add ebx, 4
		dec edx
		cmp edx, 0
		jne l0

		mov eax, offset y
		mov esp, ebp
		pop ebp
		ret 8
	end counts