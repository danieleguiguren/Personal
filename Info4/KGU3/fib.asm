DEFAULT REL

extern printf				; externe Funktion printf deklarieren
SECTION .data
	erg DQ 0
	n DQ 8
	msg DB 'fib(%lld) ergibt %lld.',13,10,0

SECTION .text
; oeffentliche Funktionen deklarieren
	global fib
	global main

; Funktionen implementieren

; In dieser Aufgabe sollen Fibonacci-Zahlen berechnet werden. 
; Die Formel lautet hierfuer:
; fib(0) = 0
; fib(1) = 1
; fib(n) = fib(n-2) + fib(n-1) fuer n > 1
; Hierbei soll ein rekursiver Ansatz gewaehlt werden.

fib: 					; Beginn Definition der Funktion fib
	push rbp			; neuere Stackframe erzeugen
	mov rbp, rsp

	; Laut der C-Calling-Konvention muss nur das Register rbx
	; gesichert werden, wenn diese verwendet werden.
	push rbx

	mov rdx, rdi
	cmp rdx, 1
	ja rekursiv				
	cmp rdx, 0
	jne ret1
	mov rax, 0			; Rueckgabewert muss sich in eax befinden
	jmp ende
ret1:					; return fib(1) = 1
	mov rax, 1			; Rueckgabewert muss sich in eax befinden
	jmp ende

rekursiv:				; rekursive Berechnung von fib(i) mit i>1
	dec rdx
	push rdx			; Wert von (i-1) sichern
	mov rdi, rdx
	call fib

	pop rdx				; restautieren von (i-1)
	push rax			; Teilergebnis zwischenspeichern

	dec rdx 
	mov rdi, rdx
	call fib

	pop rbx				; restaurieren des 1. Teilergebnises
	add rax, rbx			; Summe mit 2. Teilergebnis bilden

ende:
	pop rbx				; alter Stack restaurieren
	mov rsp, rbp
	pop rbp       

	ret				; Funktion verlassen
	; Ende der Definition der Funktion fib

main:
	push rbp			; neuer Stackframe erzeugen               
	mov rbp, rsp


	mov rdi, QWORD [n]
	call fib
	mov QWORD [erg], rax		; Ergebnis bestimmen


	; Ergebnis mit printf ausgeben
	mov rdx, QWORD [erg]		; Ergebnis als (rechter) Parameter uebergeben
	mov rsi, QWORD [n]		; n als (mittleren) Parameter uebergeben
	mov rdi, msg			; Startadr. der String-Konstante als (linken) Parameter uebergeben
	call printf			

	pop rbp				; alten rbp restaurieren

	; Programm verlassen
	mov rax, 0
	ret
