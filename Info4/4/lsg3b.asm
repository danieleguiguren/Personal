SECTION .data

	a resq 10 ; long a[10]
	output_str db "a[%u] = %u", 10, 0

SECTION .text
	global main
	extern printf

main:
	mov rcx, 0 ; i = 0
	mov rbx, a
l1:
	cmp rcx, 10
	jge  l2

	mov qword[rbx+8*rcx], rcx

	;Ausgabe
	push rcx
	mov rdi, qword output_str
	mov rsi, rcx
	mov rdx, qword [rbx+rcx*8]
	call printf

	pop rcx

	inc rcx
	jmp l1

l2:

	;exit(0)
	mov rax, 60
	mov rdi, 0
	syscall
