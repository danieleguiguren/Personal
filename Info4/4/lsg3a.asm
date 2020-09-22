SECTION .data
	a dq 0
	b dq 7

SECTION .text
	global main

main:
	mov rax, qword[a] ; alten Wert von a sichern
	inc qword [a]

	cmp rax, 0
	je l1

	mov qword[b],0
	jmp l2

l1:
	mov qword [b], 1


l2: ;Fahre Programm fort


	;exit(0)
	mov rax, 60
	mov rdi, 0
	syscall
