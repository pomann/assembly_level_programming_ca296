

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

.code
	swap:nop
		push ebp
		mov ebp,esp

		mov eax, 4
		mov ebx, [ebp + 12]
		mul ebx
		mov ecx, eax   
		mov eax, 4
		mov ebx, [ebp + 16]
		mul ebx
		mov edx, eax	
		mov ebx, [ebp + 8]
		mov eax, [ebp + 8]
		add ebx, edx
		add eax, ecx
		mov edx, [eax]  ; index 1
		mov ecx, [ebx]  ; index 2
		cmp ecx, edx
		jl done
		mov [ebx], edx
		mov [eax], ecx
		mov eax, [ebp + 20]
		invoke writeArray, [ebp + 8], eax
		done:
		mov esp,ebp
		pop ebp
		ret 16

	end
