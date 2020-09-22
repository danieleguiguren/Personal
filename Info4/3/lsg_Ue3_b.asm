SECTION .data
	;nur Symbole, wie main z.B

	x dq 3
	ergebnis dq 0 ;dq=define quadword (Speicherplatz reservieren (4 Woerten von 16 bit))

SECTION .text
	global main

main:
	; 3*x^3 + 4x-5
	mov rax, qword [x]
	imul rax ; rdx:rax=rax*rax

	mov rbx, 3
	imul rbx ; rdx:rax = rax*rbx

	mov rbx, qword [x]
	imul rbx, rbx, 4 ; rbx=rbx*4

	mov  rcx, -5

	add rax, rbx
	add rax, rcx

	mov qword [ergebnis], rax ;qword, da in Assembler keine Pointerarithmetik(Assemble weiss nicht, wie gross Speichertelle ist)

	;in C z.B
	;int ergebnis_value = 0;
	;int *ergebnis = &ergebnis_value;
	;*ergebnis=15;

	;Verlassen des Programms
	mov rax, 60
	mov rdi, 0 ;Rueckgabewert
	syscall






























