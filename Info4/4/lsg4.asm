SECTION .data
	testvalue dq 832041
	n dd 50 ;32 bit
	ergebnis dq 0
	output_str db "Fibonacci-Zahl Testvalue %u", 10, "ergebnis: %llu", 10, 0

SECTION .text
	global main
	extern printf

main:

	mov rax, 0 ; f(1)
	mov rsi, 1 ; f(0)
	mov rcx, 0 ; Zaehler = 0

schleife:
	cmp rax, qword [testvalue]
	je fertig
	cmp rax, qword [testvalue]
	ja nicht

	xchg rax, rsi
	add rax, rsi ; eax <- eax + esi
	jc fehler

	inc rcx ; Zaehler++
	jmp schleife

fehler:
	mov eax, 0 ; Fehlerbehandlung
	mov edx, 0
nicht:
	mov rcx, 0
	mov qword[testvalue], 0

fertig:
	mov qword [ergebnis], rcx ;
	; Ausgabe
	sub rsp, 8 ; Stack muss fuer call 16-byte aligned sein
	mov rdi, qword output_str
	mov rsi, qword[testvalue]
	mov rdx, qword[ergebnis]
	call printf

	; exit(0)
	mov rax, 60
	mov rdi, 0
	syscall
