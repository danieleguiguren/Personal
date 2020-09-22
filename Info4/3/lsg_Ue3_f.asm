SECTION .data

k_a dq 1, 2
k_b dq 3, 4
ergebnis dq 0, 0

SECTION .text
	global main
main:

mov rax, qword [k_a]
imul rax, qword [k_b]

mov rbx, qword [k_a + 8]
imul rbx, qword [k_b + 8]
imul rbx, -1

mov qword[ergebnis], rax
add qword[ergebnis], rbx

mov rbx, qword[k_a]
imul rbx, qword[k_b+8]
add qword[ergebnis+8], rbx

mov rbx, qword[k_a+8]
imul rbx, qword[k_b]
add qword[ergebnis+8], rbx





