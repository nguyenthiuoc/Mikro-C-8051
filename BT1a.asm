
_main:
	MOV SP+0, #128
;BT1a.c,1 :: 		void main() {
;BT1a.c,4 :: 		P0 = 0xFF;
	MOV P0+0, #255
;BT1a.c,5 :: 		P1 = 0xFF;
	MOV P1+0, #255
;BT1a.c,6 :: 		P2 = 0xFF;
	MOV P2+0, #255
;BT1a.c,7 :: 		P3 = 0xFF;
	MOV P3+0, #255
;BT1a.c,9 :: 		while (1) {
L_main0:
;BT1a.c,10 :: 		for (i = 0; i < 9; i++) {
	MOV main_i_L0+0, #0
L_main2:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #9
	JNC L_main3
;BT1a.c,11 :: 		P0 = ~(1 << i);
	MOV R1, main_i_L0+0
	MOV A, #1
	INC R1
	SJMP L__main14
L__main15:
	CLR C
	RLC A
L__main14:
	DJNZ R1, L__main15
	MOV R0, A
	XRL A, #255
	MOV P0+0, A
;BT1a.c,12 :: 		Delay_ms(200);
	MOV R5, 2
	MOV R6, 69
	MOV R7, 61
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;BT1a.c,10 :: 		for (i = 0; i < 9; i++) {
	INC main_i_L0+0
;BT1a.c,13 :: 		}
	SJMP L_main2
L_main3:
;BT1a.c,15 :: 		for (i = 0; i < 9; i++) {
	MOV main_i_L0+0, #0
L_main5:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #9
	JNC L_main6
;BT1a.c,16 :: 		P1 = ~(1 << i);
	MOV R1, main_i_L0+0
	MOV A, #1
	INC R1
	SJMP L__main16
L__main17:
	CLR C
	RLC A
L__main16:
	DJNZ R1, L__main17
	MOV R0, A
	XRL A, #255
	MOV P1+0, A
;BT1a.c,17 :: 		Delay_ms(200);
	MOV R5, 2
	MOV R6, 69
	MOV R7, 61
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;BT1a.c,15 :: 		for (i = 0; i < 9; i++) {
	INC main_i_L0+0
;BT1a.c,18 :: 		}
	SJMP L_main5
L_main6:
;BT1a.c,20 :: 		for (i = 0; i < 9; i++) {
	MOV main_i_L0+0, #0
L_main8:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #9
	JNC L_main9
;BT1a.c,21 :: 		P2 = ~(1 << i);
	MOV R1, main_i_L0+0
	MOV A, #1
	INC R1
	SJMP L__main18
L__main19:
	CLR C
	RLC A
L__main18:
	DJNZ R1, L__main19
	MOV R0, A
	XRL A, #255
	MOV P2+0, A
;BT1a.c,22 :: 		Delay_ms(200);
	MOV R5, 2
	MOV R6, 69
	MOV R7, 61
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;BT1a.c,20 :: 		for (i = 0; i < 9; i++) {
	INC main_i_L0+0
;BT1a.c,23 :: 		}
	SJMP L_main8
L_main9:
;BT1a.c,25 :: 		for (i = 0; i < 9; i++) {
	MOV main_i_L0+0, #0
L_main11:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #9
	JNC L_main12
;BT1a.c,26 :: 		P3 = ~(1 << i);
	MOV R1, main_i_L0+0
	MOV A, #1
	INC R1
	SJMP L__main20
L__main21:
	CLR C
	RLC A
L__main20:
	DJNZ R1, L__main21
	MOV R0, A
	XRL A, #255
	MOV P3+0, A
;BT1a.c,27 :: 		Delay_ms(200);
	MOV R5, 2
	MOV R6, 69
	MOV R7, 61
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;BT1a.c,25 :: 		for (i = 0; i < 9; i++) {
	INC main_i_L0+0
;BT1a.c,28 :: 		}
	SJMP L_main11
L_main12:
;BT1a.c,29 :: 		}
	LJMP L_main0
;BT1a.c,30 :: 		}
	SJMP #254
; end of _main
