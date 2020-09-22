SECTION .data
	i dq 10
	ergebnis dq 1

SECTION .text
	global main

main:
	mov rcx, qword[i]
	mov rax, qword[ergebnis]

l1:
	dec rcx
	cmp rcx, 0
	je l2

	imul rcx ; rdx:rax = rax * rcx


	jmp l1


l2:

	mov qword [i], rcx	  ; i zurueckschreiben
	mov qword [ergebnis], rax ; ergebnis zurueckschreiben



