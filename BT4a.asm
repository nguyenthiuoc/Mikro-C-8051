
_delay:
;BT4a.c,23 :: 		void delay(int time) {
;BT4a.c,24 :: 		while(time--);  // �i?u ch?nh d? tr? theo y�u c?u
L_delay0:
	MOV R0, FARG_delay_time+0
	MOV R1, FARG_delay_time+1
	CLR C
	MOV A, FARG_delay_time+0
	SUBB A, #1
	MOV FARG_delay_time+0, A
	MOV A, FARG_delay_time+1
	SUBB A, #0
	MOV FARG_delay_time+1, A
	MOV A, R0
	ORL A, R1
	JZ L_delay1
	SJMP L_delay0
L_delay1:
;BT4a.c,25 :: 		}
	RET
; end of _delay

_main:
	MOV SP+0, #128
;BT4a.c,27 :: 		void main() {
;BT4a.c,28 :: 		gio = 11;  // Gi? ban d?u
	MOV _gio+0, #11
;BT4a.c,29 :: 		phut = 0;  // Ph�t ban d?u
	MOV _phut+0, #0
;BT4a.c,32 :: 		while(1) {
L_main2:
;BT4a.c,34 :: 		for(i = 0; i < 166; i++) {  // M?i gi�y du?c hi?n th? trong v�ng l?p n�y
	MOV _i+0, #0
	MOV _i+1, #0
L_main4:
	CLR C
	MOV A, _i+0
	SUBB A, #166
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, _i+1
	XRL A, #128
	SUBB A, R0
	JC #3
	LJMP L_main5
;BT4a.c,36 :: 		chuc = gio / 10;       // H�ng ch?c c?a gi?
	MOV B+0, #10
	MOV A, _gio+0
	DIV AB
	MOV R0, A
	MOV _chuc+0, 0
;BT4a.c,37 :: 		dvi = gio % 10;        // �on v? c?a gi?
	MOV B+0, #10
	MOV A, _gio+0
	DIV AB
	MOV A, B+0
	MOV R0, A
	MOV _dvi+0, 0
;BT4a.c,38 :: 		LED_PORT = so[chuc];   // Hi?n th? h�ng ch?c gi?
	MOV A, #_so+0
	ADD A, _chuc+0
	MOV R0, A
	MOV P0+0, @R0
;BT4a.c,39 :: 		led1 = sang;           // B?t LED 1 (H�ng gi?)
	CLR P2+0
;BT4a.c,40 :: 		delay(1);              // �? tr?
	MOV FARG_delay_time+0, #1
	MOV FARG_delay_time+1, #0
	LCALL _delay+0
;BT4a.c,41 :: 		led1 = tat;            // T?t LED 1
	SETB P2+0
;BT4a.c,43 :: 		LED_PORT = so[dvi];    // Hi?n th? don v? gi?
	MOV A, #_so+0
	ADD A, _dvi+0
	MOV R0, A
	MOV P0+0, @R0
;BT4a.c,44 :: 		led2 = sang;           // B?t LED 2 (�on v? gi?)
	CLR P2+0
;BT4a.c,45 :: 		delay(1);              // �? tr?
	MOV FARG_delay_time+0, #1
	MOV FARG_delay_time+1, #0
	LCALL _delay+0
;BT4a.c,46 :: 		led2 = tat;            // T?t LED 2
	SETB P2+0
;BT4a.c,49 :: 		chuc = phut / 10;      // H�ng ch?c c?a ph�t
	MOV B+0, #10
	MOV A, _phut+0
	DIV AB
	MOV R0, A
	MOV _chuc+0, 0
;BT4a.c,50 :: 		dvi = phut % 10;       // �on v? c?a ph�t
	MOV B+0, #10
	MOV A, _phut+0
	DIV AB
	MOV A, B+0
	MOV R0, A
	MOV _dvi+0, 0
;BT4a.c,51 :: 		LED_PORT = so[chuc];   // Hi?n th? h�ng ch?c ph�t
	MOV A, #_so+0
	ADD A, _chuc+0
	MOV R0, A
	MOV P0+0, @R0
;BT4a.c,52 :: 		led3 = sang;           // B?t LED 3 (H�ng ph�t)
	CLR P2+0
;BT4a.c,53 :: 		delay(1);              // �? tr?
	MOV FARG_delay_time+0, #1
	MOV FARG_delay_time+1, #0
	LCALL _delay+0
;BT4a.c,54 :: 		led3 = tat;            // T?t LED 3
	SETB P2+0
;BT4a.c,56 :: 		LED_PORT = so[dvi];    // Hi?n th? don v? ph�t
	MOV A, #_so+0
	ADD A, _dvi+0
	MOV R0, A
	MOV P0+0, @R0
;BT4a.c,57 :: 		led4 = sang;           // B?t LED 4 (�on v? ph�t)
	CLR P2+0
;BT4a.c,58 :: 		delay(1);              // �? tr?
	MOV FARG_delay_time+0, #1
	MOV FARG_delay_time+1, #0
	LCALL _delay+0
;BT4a.c,59 :: 		led4 = tat;            // T?t LED 4
	SETB P2+0
;BT4a.c,34 :: 		for(i = 0; i < 166; i++) {  // M?i gi�y du?c hi?n th? trong v�ng l?p n�y
	MOV A, #1
	ADD A, _i+0
	MOV _i+0, A
	MOV A, #0
	ADDC A, _i+1
	MOV _i+1, A
;BT4a.c,60 :: 		}
	LJMP L_main4
L_main5:
;BT4a.c,63 :: 		phut++;
	INC _phut+0
;BT4a.c,64 :: 		if(phut == 60) {  // Khi ph�t d?t 60, reset v� tang gi?
	MOV A, _phut+0
	XRL A, #60
	JNZ L_main7
;BT4a.c,65 :: 		phut = 0;
	MOV _phut+0, #0
;BT4a.c,66 :: 		gio++;
	INC _gio+0
;BT4a.c,67 :: 		if(gio == 24) {  // Khi gi? d?t 24, reset v? 0
	MOV A, _gio+0
	XRL A, #24
	JNZ L_main8
;BT4a.c,68 :: 		gio = 0;
	MOV _gio+0, #0
;BT4a.c,69 :: 		}
L_main8:
;BT4a.c,70 :: 		}
L_main7:
;BT4a.c,71 :: 		}
	LJMP L_main2
;BT4a.c,72 :: 		}
	SJMP #254
; end of _main
