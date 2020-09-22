SECTION .data
	;nur Symbole, wie main z.B

	x dq 4
	ergebnis dq 0 ;dq=define quadword (Speicherplatz reservieren (4 Woerten von 16 bit))
	koeffizient dq 33,2,7

	output_str db "ergebnis: %i", 10, 0

SECTION .text
	global main
	extern printf

main:
	; koeffizient[0]*x^2 + koeffizient[1]*x^1 + koeffizient[2]*x^0

	mov rsi, koeffizient

	mov rax, qword [x]
	mov rbx, [rsi]

	imul rbx, rax ; rdx:rax=rax*rax

	add rbx, [rsi+8]

	imul rbx, rax

	add rbx, [rsi+16]

	mov qword [ergebnis], rbx ;qword, da in Assembler keine Pointerarithmetik(Assemble weiss nicht, wie gross Speichertelle ist)

	;Ausgabe(optional!)

	;push qword [ergebnis]
	;push qword output_str
	;call printf
	;add esp, 2*4

	;in C z.B
	;int ergebnis_value = 0;
	;int *ergebnis = &ergebnis_value;
	;
	;*ergebnis = 15;

	;char *output_str = "ergebnis: %d\n";
	;printf(output_str. *ergebnis);

	;Verlassen des Programms
	mov rax, 60
	mov rdi, 0 ;Rueckgabewert
	syscall






























