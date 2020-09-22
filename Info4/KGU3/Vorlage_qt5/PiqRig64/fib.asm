SECTION .data

erg DQ  0
n DQ 8

SECTION .text

global fib
global main

fib: 
	push rbp
	mov rbp, rsp

	push rbx

	mov rdx, rdi
	cmp rdx, 1
	ja rekursiv

rekursiv:
	


main:
	push rbp
	mov rpb, rsp

	mov rdi, QWORD [n]
	call fib
	
