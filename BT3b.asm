
_hexToDec:
;BT3b.c,12 :: 		unsigned short hexToDec(char hex) {
;BT3b.c,13 :: 		if (hex >= '0' && hex <= '9') {
	CLR C
	MOV A, FARG_hexToDec_hex+0
	SUBB A, #48
	JC L_hexToDec2
	SETB C
	MOV A, FARG_hexToDec_hex+0
	SUBB A, #57
	JNC L_hexToDec2
L__hexToDec47:
;BT3b.c,14 :: 		return hex - '0';
	CLR C
	MOV A, FARG_hexToDec_hex+0
	SUBB A, #48
	MOV R0, A
	RET
;BT3b.c,15 :: 		} else if (hex >= 'A' && hex <= 'F') {
L_hexToDec2:
	CLR C
	MOV A, FARG_hexToDec_hex+0
	SUBB A, #65
	JC L_hexToDec6
	SETB C
	MOV A, FARG_hexToDec_hex+0
	SUBB A, #70
	JNC L_hexToDec6
L__hexToDec46:
;BT3b.c,16 :: 		return hex - 'A' + 10;
	CLR C
	MOV A, FARG_hexToDec_hex+0
	SUBB A, #65
	MOV R1, A
	MOV R0, #10
	MOV A, R1
	ADD A, R0
	MOV R0, A
	RET
;BT3b.c,17 :: 		}
L_hexToDec6:
;BT3b.c,18 :: 		return 0;
	MOV R0, #0
;BT3b.c,19 :: 		}
	RET
; end of _hexToDec

_decToHex:
;BT3b.c,20 :: 		char decToHex(unsigned short dec) {
;BT3b.c,21 :: 		if (dec >= 0 && dec <= 9) {
	CLR C
	MOV A, FARG_decToHex_dec+0
	SUBB A, #0
	JC L_decToHex9
	SETB C
	MOV A, FARG_decToHex_dec+0
	SUBB A, #9
	JNC L_decToHex9
L__decToHex49:
;BT3b.c,22 :: 		return dec + '0';
	MOV A, FARG_decToHex_dec+0
	ADD A, #48
	MOV R0, A
	RET
;BT3b.c,23 :: 		} else if (dec >= 10 && dec <= 15) {
L_decToHex9:
	CLR C
	MOV A, FARG_decToHex_dec+0
	SUBB A, #10
	JC L_decToHex13
	SETB C
	MOV A, FARG_decToHex_dec+0
	SUBB A, #15
	JNC L_decToHex13
L__decToHex48:
;BT3b.c,24 :: 		return dec - 10 + 'A';
	CLR C
	MOV A, FARG_decToHex_dec+0
	SUBB A, #10
	MOV R1, A
	MOV R0, #65
	MOV A, R1
	ADD A, R0
	MOV R0, A
	RET
;BT3b.c,25 :: 		}
L_decToHex13:
;BT3b.c,26 :: 		return '0';
	MOV R0, #48
;BT3b.c,27 :: 		}
	RET
; end of _decToHex

_main:
	MOV SP+0, #128
;BT3b.c,28 :: 		void main() {
;BT3b.c,29 :: 		unsigned short firstNumber = 0, secondNumber = 0, sum, product;
	MOV main_firstNumber_L0+0, #0
	MOV main_secondNumber_L0+0, #0
	MOV main_inputCount_L0+0, #0
;BT3b.c,30 :: 		unsigned short inputCount = 0;
;BT3b.c,31 :: 		Keypad_Init(); // Initialize Keypad
	LCALL _Keypad_Init+0
;BT3b.c,32 :: 		Lcd_Init(); // Initialize LCD
	LCALL _Lcd_Init+0
;BT3b.c,33 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;BT3b.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOV FARG_Lcd_Cmd_out_char+0, #12
	LCALL _Lcd_Cmd+0
;BT3b.c,35 :: 		Lcd_Out(1, 1, "so1: "); // Write message text on LCD
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr1_BT3b+0
	LCALL _LCD_Out+0
;BT3b.c,36 :: 		Lcd_Out(2, 1, "So2: ");
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr2_BT3b+0
	LCALL _LCD_Out+0
;BT3b.c,37 :: 		do {
L_main14:
;BT3b.c,38 :: 		kp = 0; // Reset key code variable
	MOV _kp+0, #0
;BT3b.c,39 :: 		do
L_main17:
;BT3b.c,40 :: 		kp = Keypad_Key_Click(); // Store key code in kp variable
	LCALL _Keypad_Key_Click+0
	MOV _kp+0, 0
;BT3b.c,41 :: 		while (!kp);
	MOV A, R0
	JZ L_main17
;BT3b.c,42 :: 		switch (kp) {
	SJMP L_main20
;BT3b.c,43 :: 		case 1:
L_main22:
;BT3b.c,44 :: 		kp = '1';
	MOV _kp+0, #49
;BT3b.c,45 :: 		break; // 1
	LJMP L_main21
;BT3b.c,46 :: 		case 2:
L_main23:
;BT3b.c,47 :: 		kp = '2';
	MOV _kp+0, #50
;BT3b.c,48 :: 		break; // 2
	LJMP L_main21
;BT3b.c,49 :: 		case 3:
L_main24:
;BT3b.c,50 :: 		kp = '3';
	MOV _kp+0, #51
;BT3b.c,51 :: 		break; // 3
	LJMP L_main21
;BT3b.c,52 :: 		case 4:
L_main25:
;BT3b.c,53 :: 		kp = 'A';
	MOV _kp+0, #65
;BT3b.c,54 :: 		break; // A
	LJMP L_main21
;BT3b.c,55 :: 		case 5:
L_main26:
;BT3b.c,56 :: 		kp = '4';
	MOV _kp+0, #52
;BT3b.c,57 :: 		break; // 4
	LJMP L_main21
;BT3b.c,58 :: 		case 6:
L_main27:
;BT3b.c,59 :: 		kp = '5';
	MOV _kp+0, #53
;BT3b.c,60 :: 		break; // 5
	LJMP L_main21
;BT3b.c,61 :: 		case 7:
L_main28:
;BT3b.c,62 :: 		kp = '6';
	MOV _kp+0, #54
;BT3b.c,63 :: 		break; // 6
	LJMP L_main21
;BT3b.c,64 :: 		case 8:
L_main29:
;BT3b.c,65 :: 		kp = 'B';
	MOV _kp+0, #66
;BT3b.c,66 :: 		break; // B
	LJMP L_main21
;BT3b.c,67 :: 		case 9:
L_main30:
;BT3b.c,68 :: 		kp = '7';
	MOV _kp+0, #55
;BT3b.c,69 :: 		break; // 7
	LJMP L_main21
;BT3b.c,70 :: 		case 10:
L_main31:
;BT3b.c,71 :: 		kp = '8';
	MOV _kp+0, #56
;BT3b.c,72 :: 		break; // 8
	LJMP L_main21
;BT3b.c,73 :: 		case 11:
L_main32:
;BT3b.c,74 :: 		kp = '9';
	MOV _kp+0, #57
;BT3b.c,75 :: 		break; // 9
	LJMP L_main21
;BT3b.c,76 :: 		case 12:
L_main33:
;BT3b.c,77 :: 		kp = 'C';
	MOV _kp+0, #67
;BT3b.c,78 :: 		break; // C
	LJMP L_main21
;BT3b.c,79 :: 		case 13:
L_main34:
;BT3b.c,80 :: 		kp = '*';
	MOV _kp+0, #42
;BT3b.c,81 :: 		break; // *
	LJMP L_main21
;BT3b.c,82 :: 		case 14:
L_main35:
;BT3b.c,83 :: 		kp = '0';
	MOV _kp+0, #48
;BT3b.c,84 :: 		break; // 0
	LJMP L_main21
;BT3b.c,85 :: 		case 15:
L_main36:
;BT3b.c,86 :: 		kp = '#';
	MOV _kp+0, #35
;BT3b.c,87 :: 		break; // #
	LJMP L_main21
;BT3b.c,88 :: 		case 16:
L_main37:
;BT3b.c,89 :: 		kp = 'D';
	MOV _kp+0, #68
;BT3b.c,90 :: 		break; // D
	LJMP L_main21
;BT3b.c,91 :: 		}
L_main20:
	MOV A, _kp+0
	XRL A, #1
	JZ L_main22
	MOV A, _kp+0
	XRL A, #2
	JZ L_main23
	MOV A, _kp+0
	XRL A, #3
	JZ L_main24
	MOV A, _kp+0
	XRL A, #4
	JZ L_main25
	MOV A, _kp+0
	XRL A, #5
	JZ L_main26
	MOV A, _kp+0
	XRL A, #6
	JZ L_main27
	MOV A, _kp+0
	XRL A, #7
	JZ L_main28
	MOV A, _kp+0
	XRL A, #8
	JZ L_main29
	MOV A, _kp+0
	XRL A, #9
	JZ L_main30
	MOV A, _kp+0
	XRL A, #10
	JNZ #3
	LJMP L_main31
	MOV A, _kp+0
	XRL A, #11
	JNZ #3
	LJMP L_main32
	MOV A, _kp+0
	XRL A, #12
	JNZ #3
	LJMP L_main33
	MOV A, _kp+0
	XRL A, #13
	JNZ #3
	LJMP L_main34
	MOV A, _kp+0
	XRL A, #14
	JNZ #3
	LJMP L_main35
	MOV A, _kp+0
	XRL A, #15
	JNZ #3
	LJMP L_main36
	MOV A, _kp+0
	XRL A, #16
	JNZ #3
	LJMP L_main37
L_main21:
;BT3b.c,92 :: 		if (kp == '#') {
	MOV A, _kp+0
	XRL A, #35
	JNZ L_main38
;BT3b.c,93 :: 		inputCount++;
	INC main_inputCount_L0+0
;BT3b.c,94 :: 		cot = inputCount == 1 ? cot + 1 : cot;
	MOV A, main_inputCount_L0+0
	XRL A, #1
	JNZ L_main39
	MOV A, _cot+0
	ADD A, #1
	MOV R0, A
	CLR A
	MOV R1, A
	SJMP L_main40
L_main39:
	MOV R0, _cot+0
	CLR A
	MOV R1, A
L_main40:
	MOV _cot+0, 0
;BT3b.c,95 :: 		} else if (inputCount == 0) {
	SJMP L_main41
L_main38:
	MOV A, main_inputCount_L0+0
	JNZ L_main42
;BT3b.c,96 :: 		firstNumber *=16;
	MOV R0, #4
	MOV A, main_firstNumber_L0+0
	INC R0
	SJMP L__main50
L__main51:
	CLR C
	RLC A
L__main50:
	DJNZ R0, L__main51
	MOV main_firstNumber_L0+0, A
;BT3b.c,97 :: 		firstNumber += hexToDec(kp);
	MOV FARG_hexToDec_hex+0, _kp+0
	LCALL _hexToDec+0
	MOV A, main_firstNumber_L0+0
	ADD A, R0
	MOV main_firstNumber_L0+0, A
;BT3b.c,98 :: 		Lcd_Chr(1, cot++, kp);
	MOV FARG_Lcd_Chr_row+0, #1
	MOV FARG_Lcd_Chr_column+0, _cot+0
	MOV FARG_Lcd_Chr_out_char+0, _kp+0
	LCALL _Lcd_Chr+0
	INC _cot+0
;BT3b.c,99 :: 		} else if (inputCount ==1) {
	SJMP L_main43
L_main42:
	MOV A, main_inputCount_L0+0
	XRL A, #1
	JNZ L_main44
;BT3b.c,100 :: 		secondNumber *=16;
	MOV R0, #4
	MOV A, main_secondNumber_L0+0
	INC R0
	SJMP L__main52
L__main53:
	CLR C
	RLC A
L__main52:
	DJNZ R0, L__main53
	MOV main_secondNumber_L0+0, A
;BT3b.c,101 :: 		secondNumber += hexToDec(kp);
	MOV FARG_hexToDec_hex+0, _kp+0
	LCALL _hexToDec+0
	MOV A, main_secondNumber_L0+0
	ADD A, R0
	MOV main_secondNumber_L0+0, A
;BT3b.c,102 :: 		Lcd_Chr(2, cot++, kp);
	MOV FARG_Lcd_Chr_row+0, #2
	MOV FARG_Lcd_Chr_column+0, _cot+0
	MOV FARG_Lcd_Chr_out_char+0, _kp+0
	LCALL _Lcd_Chr+0
	INC _cot+0
;BT3b.c,103 :: 		}
L_main44:
L_main43:
L_main41:
;BT3b.c,104 :: 		if (inputCount ==2) {
	MOV A, main_inputCount_L0+0
	XRL A, #2
	JZ #3
	LJMP L_main45
;BT3b.c,105 :: 		sum = firstNumber + secondNumber;
	MOV A, main_firstNumber_L0+0
	ADD A, main_secondNumber_L0+0
	MOV main_sum_L0+0, A
;BT3b.c,106 :: 		product = firstNumber * secondNumber;
	MOV B+0, main_secondNumber_L0+0
	MOV A, main_firstNumber_L0+0
	MUL AB
	MOV R0, A
	MOV main_product_L0+0, 0
;BT3b.c,107 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;BT3b.c,108 :: 		Lcd_Out(1,1,"tong: ");
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr3_BT3b+0
	LCALL _LCD_Out+0
;BT3b.c,109 :: 		Lcd_Chr(1,6,decToHex(sum/16));
	MOV R0, #4
	MOV A, main_sum_L0+0
	INC R0
	SJMP L__main54
L__main55:
	CLR C
	RRC A
L__main54:
	DJNZ R0, L__main55
	MOV FARG_decToHex_dec+0, A
	LCALL _decToHex+0
	MOV FARG_Lcd_Chr_out_char+0, 0
	MOV FARG_Lcd_Chr_row+0, #1
	MOV FARG_Lcd_Chr_column+0, #6
	LCALL _Lcd_Chr+0
;BT3b.c,110 :: 		Lcd_Chr(1,7,decToHex(sum%16));
	MOV A, main_sum_L0+0
	ANL A, #15
	MOV FARG_decToHex_dec+0, A
	LCALL _decToHex+0
	MOV FARG_Lcd_Chr_out_char+0, 0
	MOV FARG_Lcd_Chr_row+0, #1
	MOV FARG_Lcd_Chr_column+0, #7
	LCALL _Lcd_Chr+0
;BT3b.c,111 :: 		Lcd_Out(2,1,"tich: ");
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr4_BT3b+0
	LCALL _LCD_Out+0
;BT3b.c,112 :: 		Lcd_Chr(2,10,decToHex(product/256));
	MOV FARG_decToHex_dec+0, 0
	LCALL _decToHex+0
	MOV FARG_Lcd_Chr_out_char+0, 0
	MOV FARG_Lcd_Chr_row+0, #2
	MOV FARG_Lcd_Chr_column+0, #10
	LCALL _Lcd_Chr+0
;BT3b.c,113 :: 		Lcd_Chr(2,11,decToHex((product%256)/16));
	MOV R4, #0
	MOV R5, #1
	MOV R0, main_product_L0+0
	CLR A
	MOV R1, A
	LCALL _Div_16x16_S+0
	MOV R0, 4
	MOV R1, 5
	MOV R4, #4
	MOV A, R1
	MOV R2, 0
	INC R4
	SJMP L__main56
L__main57:
	MOV C, #231
	RRC A
	XCH A, R2
	RRC A
	XCH A, R2
L__main56:
	DJNZ R4, L__main57
	MOV R3, A
	MOV FARG_decToHex_dec+0, 2
	LCALL _decToHex+0
	MOV FARG_Lcd_Chr_out_char+0, 0
	MOV FARG_Lcd_Chr_row+0, #2
	MOV FARG_Lcd_Chr_column+0, #11
	LCALL _Lcd_Chr+0
;BT3b.c,114 :: 		Lcd_Chr(2,12,decToHex(product%16));
	MOV A, main_product_L0+0
	ANL A, #15
	MOV FARG_decToHex_dec+0, A
	LCALL _decToHex+0
	MOV FARG_Lcd_Chr_out_char+0, 0
	MOV FARG_Lcd_Chr_row+0, #2
	MOV FARG_Lcd_Chr_column+0, #12
	LCALL _Lcd_Chr+0
;BT3b.c,115 :: 		}
L_main45:
;BT3b.c,116 :: 		} while (1);
	LJMP L_main14
;BT3b.c,117 :: 		}
	SJMP #254
; end of _main
