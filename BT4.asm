
_delay_ms:
;BT4.c,17 :: 		void delay_ms(unsigned int time) {
;BT4.c,19 :: 		for (i = 0; i < time; i++)
	MOV delay_ms_i_L0+0, #0
	MOV delay_ms_i_L0+1, #0
L_delay_ms0:
	CLR C
	MOV A, delay_ms_i_L0+0
	SUBB A, FARG_delay_ms_time+0
	MOV A, delay_ms_i_L0+1
	SUBB A, FARG_delay_ms_time+1
	JNC L_delay_ms1
;BT4.c,20 :: 		for (j = 0; j < 120; j++); // Ði?u ch?nh n?u t?n s? th?ch anh khác
	MOV delay_ms_j_L0+0, #0
	MOV delay_ms_j_L0+1, #0
L_delay_ms3:
	CLR C
	MOV A, delay_ms_j_L0+0
	SUBB A, #120
	MOV A, delay_ms_j_L0+1
	SUBB A, #0
	JNC L_delay_ms4
	MOV A, #1
	ADD A, delay_ms_j_L0+0
	MOV delay_ms_j_L0+0, A
	MOV A, #0
	ADDC A, delay_ms_j_L0+1
	MOV delay_ms_j_L0+1, A
	SJMP L_delay_ms3
L_delay_ms4:
;BT4.c,19 :: 		for (i = 0; i < time; i++)
	MOV A, #1
	ADD A, delay_ms_i_L0+0
	MOV delay_ms_i_L0+0, A
	MOV A, #0
	ADDC A, delay_ms_i_L0+1
	MOV delay_ms_i_L0+1, A
;BT4.c,20 :: 		for (j = 0; j < 120; j++); // Ði?u ch?nh n?u t?n s? th?ch anh khác
	SJMP L_delay_ms0
L_delay_ms1:
;BT4.c,21 :: 		}
	RET
; end of _delay_ms

_main:
	MOV SP+0, #128
;BT4.c,23 :: 		void main() {
;BT4.c,25 :: 		led1 = tat;
	SETB P2+0
;BT4.c,26 :: 		led2 = tat;
	SETB P2+0
;BT4.c,27 :: 		led3 = tat;
	SETB P2+0
;BT4.c,28 :: 		led4 = tat;
	SETB P2+0
;BT4.c,31 :: 		for (dem = 6789; dem >= 0; dem--) {
	MOV _dem+0, #133
	MOV _dem+1, #26
L_main6:
	CLR C
	MOV A, _dem+0
	SUBB A, #0
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, _dem+1
	XRL A, #128
	SUBB A, R0
	JNC #3
	LJMP L_main7
;BT4.c,33 :: 		nghin = dem / 1000;
	MOV R4, #232
	MOV R5, #3
	MOV R0, _dem+0
	MOV R1, _dem+1
	LCALL _Div_16x16_S+0
	MOV _nghin+0, 0
;BT4.c,34 :: 		tram = (dem % 1000) / 100;
	MOV R4, #232
	MOV R5, #3
	MOV R0, _dem+0
	MOV R1, _dem+1
	LCALL _Div_16x16_S+0
	MOV R0, 4
	MOV R1, 5
	MOV R4, #100
	MOV R5, #0
	LCALL _Div_16x16_S+0
	MOV _tram+0, 0
;BT4.c,35 :: 		chuc = (dem % 100) / 10;
	MOV R4, #100
	MOV R5, #0
	MOV R0, _dem+0
	MOV R1, _dem+1
	LCALL _Div_16x16_S+0
	MOV R0, 4
	MOV R1, 5
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_S+0
	MOV _chuc+0, 0
;BT4.c,36 :: 		donVi = dem % 10;
	MOV R4, #10
	MOV R5, #0
	MOV R0, _dem+0
	MOV R1, _dem+1
	LCALL _Div_16x16_S+0
	MOV R0, 4
	MOV R1, 5
	MOV _donVi+0, 0
;BT4.c,39 :: 		for (i = 0; i < 4; i++) {
	MOV _i+0, #0
L_main9:
	CLR C
	MOV A, _i+0
	SUBB A, #4
	JNC L_main10
;BT4.c,41 :: 		led1 = sang;
	CLR P2+0
;BT4.c,42 :: 		P0 = so[nghin];
	MOV A, #_so+0
	ADD A, _nghin+0
	MOV R0, A
	MOV P0+0, @R0
;BT4.c,43 :: 		delay_ms(5);
	MOV R6, 9
	MOV R7, 25
	DJNZ R7, 
	DJNZ R6, 
	NOP
;BT4.c,44 :: 		led1 = tat;
	SETB P2+0
;BT4.c,47 :: 		led2 = sang;
	CLR P2+0
;BT4.c,48 :: 		P0 = so[tram];
	MOV A, #_so+0
	ADD A, _tram+0
	MOV R0, A
	MOV P0+0, @R0
;BT4.c,49 :: 		delay_ms(5);
	MOV R6, 9
	MOV R7, 25
	DJNZ R7, 
	DJNZ R6, 
	NOP
;BT4.c,50 :: 		led2 = tat;
	SETB P2+0
;BT4.c,53 :: 		led3 = sang;
	CLR P2+0
;BT4.c,54 :: 		P0 = so[chuc];
	MOV A, #_so+0
	ADD A, _chuc+0
	MOV R0, A
	MOV P0+0, @R0
;BT4.c,55 :: 		delay_ms(5);
	MOV R6, 9
	MOV R7, 25
	DJNZ R7, 
	DJNZ R6, 
	NOP
;BT4.c,56 :: 		led3 = tat;
	SETB P2+0
;BT4.c,59 :: 		led4 = sang;
	CLR P2+0
;BT4.c,60 :: 		P0 = so[donVi];
	MOV A, #_so+0
	ADD A, _donVi+0
	MOV R0, A
	MOV P0+0, @R0
;BT4.c,61 :: 		delay_ms(5);
	MOV R6, 9
	MOV R7, 25
	DJNZ R7, 
	DJNZ R6, 
	NOP
;BT4.c,62 :: 		led4 = tat;
	SETB P2+0
;BT4.c,39 :: 		for (i = 0; i < 4; i++) {
	INC _i+0
;BT4.c,63 :: 		}
	SJMP L_main9
L_main10:
;BT4.c,66 :: 		if (dem == 0) {
	MOV A, _dem+0
	ORL A, _dem+1
	JNZ L_main12
;BT4.c,67 :: 		break;
	SJMP L_main7
;BT4.c,68 :: 		}
L_main12:
;BT4.c,31 :: 		for (dem = 6789; dem >= 0; dem--) {
	CLR C
	MOV A, _dem+0
	SUBB A, #1
	MOV _dem+0, A
	MOV A, _dem+1
	SUBB A, #0
	MOV _dem+1, A
;BT4.c,69 :: 		}
	LJMP L_main6
L_main7:
;BT4.c,72 :: 		while (1) {
L_main13:
;BT4.c,74 :: 		led1 = tat;
	SETB P2+0
;BT4.c,75 :: 		led2 = tat;
	SETB P2+0
;BT4.c,76 :: 		led3 = tat;
	SETB P2+0
;BT4.c,77 :: 		led4 = tat;
	SETB P2+0
;BT4.c,80 :: 		}
	SJMP L_main13
;BT4.c,81 :: 		}
	SJMP #254
; end of _main
