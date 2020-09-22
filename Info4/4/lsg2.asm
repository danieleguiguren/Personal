SECTION .data
	n dd 50 ;32 bit
	ergebnis dq 0
	output_str db "Fibonacci-Zahl n: %u", 10, "ergebnis: %llu", 10, 0

SECTION .text
	global main
	extern printf

main:
	mov eax, 0 ; LSB fib(0)
	mov edx, 0 ; MSB fib(0)
	mov esi, 1 ; LSB fib(1)
	mov edi, 0 ; MSB fib(1)
	mov ecx, 0 ; Zaehler = 0

schleife:
	cmp ecx, dword [n]
	je fertig

	xchg eax, esi
	xchg edx, edi
	add eax, esi ; eax <- eax + esi
	adc edx, edi ; edx <- edx + edi + CF
	jc fehler

	inc ecx ; Zaehler++
	jmp schleife

fehler:
	mov eax, 0 ; Fehlerbehandlung
	mov edx, 0

fertig:
	mov dword [ergebnis], eax ; LSB
	mov dword [ergebnis+4], edx ; MSB hinten sind, wegen Little-Endian

	; Ausgabe
	sub rsp, 24 ; Stack muss fuer call 16-byte aligned sein
	mov rdi, qword output_str
	mov rsi, qword[n]
	mov rdx, qword[ergebnis]
	call printf

	; exit(0)
	mov rax, 60
	mov rdi, 0
	syscall
