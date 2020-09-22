DEFAULT REL 
SECTION .data
i DD 40
j DD 45
k DD 10 

SECTION .text
global main
main:
cmp dword[i], 42
jle naechste 
mov dword[k], 0
jmp ende

naechste:
cmp dword[j],42
jle letzte
mov dword[k],1
jmp ende

letzte:
mov dword[k],2

ende:
mov rax,0

ret
