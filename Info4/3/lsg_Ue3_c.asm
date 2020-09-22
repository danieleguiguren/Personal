SECTION .data
	;nur Symbole, wie main z.B

	x dq 3
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
	imul rax ; rdx:rax=rax*rax

	mov rbx, qword [rsi+0]
	imul rbx ; rdx:rax = rax*rbx

	mov rbx, qword [x]
	imul rbx, qword [rsi+8]

	mov  rcx, qword [rsi+16]

	add rax, rbx
	add rax, rcx

	mov qword [ergebnis], rax ;qword, da in Assembler keine Pointerarithmetik(Assemble weiss nicht, wie gross Speichertelle ist)

	;Ausgabe(optional!)
	sub rsp, 8
	mov rdi, dword output_str
	mov rsi, qword [ergebnis]
	call printf


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






























