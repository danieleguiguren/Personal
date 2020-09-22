;---------------------------------------------------------------------------------------------
; File: ConvertToBlackWhite.asm
;
; Demo application for the exercise course "Grundgebiete der Informatik 4"
;
; Copyright (c) 2006-2013 Chair for Operating Systems, RWTH Aachen University
; Copyright (c) 2014-2015 Institute for Automation of Complex Power Systems,
     ;                    E.ON Energy Research Center, RWTH Aachen University
;
; All rights reserved.
;---------------------------------------------------------------------------------------------

;; Konvertiere Bild in eine Schwarzweiss-Darstellung
global ConvertToBlackWhite

ConvertToBlackWhite:
	push rbp
	mov rbp, rsp

	sub rsp, 8 ; statt der lokalen Variable waere auch ein Register moeglich

	;
	; rette Register
	;
	push rbx

	;
	; Diese Schleife soll nun in Assembler implementiert werden:
	; for(long i=0; i<4*width*height; i+=4)
	; {
	;   Y = Grauwert des Pixels
	;	  bitmap[i] = bitmap[i+1] = bitmap[i+2] = (BYTE) Y;
	; }
	;   Grauwert = Luminanz des YCbCr Systems (auch YUV genannt)
	; 	Konvertierung RGB nach YUV nach CCIR601 (fuer Videos):
	;    Y = ( 0.257 * R + 0.504 * G + 0.098 * B + 16  ; 16 < Y < 235
	;    Y = ( (  66 * R +   129 * G +    25 * B + 128) >> 8) +  16 ; (Festkomma)
	;    Transformation nach JFIF (JPEG), hier besser, da ganzer Farbraum genutzt
	;    Y = 0.299 * R + 0.587 * G + 0.114 * B        ; 0 <= Y <= 255
	;    Y =(   76 * R +   150 * G +    29 * B)  >> 8 ; (Festkomma)
	;	Festkomma statt float ist schneller, moeglich ist Nutzung von
	;    "menschenlesbaren" Festkommazahlen wie x*0.299 = x*299/1000
	;
	;    Lieber sind dem Rechner allerdings Festkommazahlen auf binaer-Basis
	;    x*0.299 = x * (0.299*256) / 256 = x * 76 / 256
	;    da x / 256 = x >> 8
	; also definieren wir uns:

	R2Y equ 76
	G2Y equ 150
	B2Y equ 29

;;
;; STUDENTENCODE HIER EINFUEGEN
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Initialisierung
  ; RDI - Startadresse "bitmap"
  ; RSI - "width"
  ; RDX - "height"
  imul rdx, rsi ; rdx ist nun gleich "height * width"
  imul rdx, 4 ; rdx ist nun gleich Laenge der Daten "height * width * "4 (4, da ABGR 4 Bytes lang)
  mov [rbp-8], rdx ; lokale Variable auf "height * width * 4" setzen
  xor rcx, rcx ; Laufzaehler zu null setzen
  xor rbx, rbx ; rbx zu null setzen
 
 ; Beginn der for-Schleife
anfang:
  cmp rcx, [rbp-8] ; Laufzaehler mit Laenge der Daten vergleichen
  jge ende ; Ende der Daten erreicht

  ; Luminanz berechnen
  mov rax, R2Y
  mov bl, BYTE [rdi+rcx] ; [Startadresse + Offset], in bl nun R-Wert von aktuellem Pixel
  imul rax, rbx ; rax ist nun gleich "76 * R"

  mov rdx, G2Y
  mov bl, BYTE [rdi+rcx+1] ; in bl nun G-Wert von aktuellem Pixel
  imul rdx, rbx ; rdx ist nun gleich "150 * G"
  add rax, rdx ; rax ist nun gleich "76 * R + 150 * G"

  mov rdx, B2Y
  mov bl, BYTE [rdi+rcx+2] ; in bl nun B-Wert von aktuellem Pixel
  imul rdx, rbx ; rdx ist nun gleich "29 * B"
  add rax, rdx ; rax ist nun gleich "76 * R + 150 * G + 29 * B"

  shr rax, 8 ; rax durch 256 teilen, somit Y berechnet

  ; Grauwert in aktuellem Pixel eintragen
  mov [rdi+rcx], al; R-Wert
  mov [rdi+rcx+1], al; G-Wert
  mov [rdi+rcx+2], al; B-Wert

  inc rcx ; Laufzaehler inkrementieren
  jmp anfang
ende:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;
	; restauriere Register
	;
	pop rbx

	add rsp, 8 ; lokale Variable wegraeumen
	pop rbp
	ret ; return
