
SECTION .text
	global main

main:
	; 3*x^3 + 4x-5
	mov rax, 2
	imul rax ; rdx:rax=rax*rax

	mov rbx, 3
	imul rbx ; rdx:rax = rax*rbx(3)

	mov rbx, 2
	imul rbx, rbx, 4 ; rbx=rbx*4

	mov  rcx, -5

	add rax, rbx
	add rax, rcx

	;Verlassen des Programms
	mov rax, 60
	mov rdi, 0 ;Rueckgabewert 
	syscall






























