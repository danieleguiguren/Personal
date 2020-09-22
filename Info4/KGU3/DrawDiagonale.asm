;---------------------------------------------------------------------------------------------
; File: DrawDiagonale.asm
;
; Demo application for the exercise course "Grundgebiete der Informatik 4"
;
; Copyright (c) 2006-2013 Chair for Operating Systems, RWTH Aachen University
; Copyright (c) 2014-2015 Institute for Automation of Complex Power Systems,
;                         E.ON Energy Research Center, RWTH Aachen University
;
; All rights reserved.
;---------------------------------------------------------------------------------------------

DIAG_RED equ 0
DIAG_GREEN equ 0
DIAG_BLUE equ 0

;; Zeichne Diagonale
global DrawDiagonale

DrawDiagonale:
	push rbp
	mov rbp, rsp

	;
	; rette Register
	;
	push rbx

	;
	; Diese Schleife soll nun in Assembler implementiert werden:
	;
	; bei i=0 => bitmap[Startadr.] bis bitmap[Startadr.+2] wird auf 0 gesetzt
	; for(long i=0; i<height; i++) i=Zeile und Spalte, da diagonal
	; {
	;	i. Zeile u. i. Spalte waere offset = i*width + i,
	;	aber das ist nur fuer quadratische Bilder die Diagnole!
	;	fuer rechteckige Bilder, also i.Allg., muss das Verhaeltnis von
	;	Breite zu Hoehe (=width/height) beruecksichtigt werden!
	;	offset = i*width + i*width/height;
	;	offset *= 4;
	;	bitmap[offset +0] = DIAG_RED;
	;	bitmap[offset +1] = DIAG_GREEN;
	;	bitmap[offset +2] = DIAG_BLUE;
	; }

;;
;; STUDENTENCODE HIER EINFUEGEN
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Intialisierung
	; RDI - Startadresse "bitmap"
	; RSI - "width"
	; RDX - "height"
	mov rbx, rdi ; rbx zeigt auf Startadr. von "bitmap"
	mov r8, rdx ; r8 enthaelt height
	xor rcx, rcx ; Laufzaehler zu null setzen
	xor rax, rax ; rax zu null setzen

	; pruefen, ob "height" ungleich null ist, ggf. Abbruch um spaeter Division durch null zu vermeiden
	; "width" gleich null ist hingegen unkritisch
	cmp r8, 0
	je ende ; Abbruch der Funktion

	; Beginn der for-Schleife
	; Parameter sind vom Typ int = signed => signed jump-Befehle nutzen!
anfang:
	cmp rcx, r8 ; Laufzaehler mit Anzahl der Zeilen vergleichen
	jge ende ; letzte Zeile wurde ueberschritten

	; aktuelles (Diagonal-)Pixel entsprechend auf Wert setzen
	mov BYTE [rbx+rax], DIAG_RED
	mov BYTE [rbx+rax+1], DIAG_GREEN
	mov BYTE [rbx+rax+2], DIAG_BLUE

	; neuen Offset berechnen
	; "Laufvariable * width" wegen Rundungsfehlern jedes mal neu berechnen!
	mov rdi, rcx ; in rdi rechnen
	imul rdi, rsi ; rdi ist nun gleich "Laufvariable * width"
	mov rax, rdi ; Zwischenergebnis in rax speichern

	xor rdx, rdx ; rdx wegen nachfolgender Division zu null setzen
	idiv r8 ; rax ist nun gleich "Laufvariable * width / height"

	add rax, rdi ; rax ist nun gleich "Laufvariable * width + Laufvariable * width / height"

	imul rax, 4 ; rax ist nun der Offset zum anzupassenden Pixel hin

	inc rcx ; Laufzaehler inkrementieren
	jmp anfang
ende:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;
	; restauriere Register
	;
	pop rbx

	pop rbp
	ret ; return
