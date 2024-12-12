
_Display_Temperature:
;BT5a.c,11 :: 		void Display_Temperature(unsigned int temp2write) {
;BT5a.c,15 :: 		if (temp2write & 0x8000) {
	MOV A, FARG_Display_Temperature_temp2write+0
	ANL A, #0
	MOV R0, A
	MOV A, FARG_Display_Temperature_temp2write+1
	ANL A, #128
	MOV R1, A
	MOV A, R0
	ORL A, R1
	JZ L_Display_Temperature0
;BT5a.c,16 :: 		text[0] = '-';
	MOV R0, _text+0
	MOV @R0, #45
;BT5a.c,17 :: 		temp2write = ~temp2write + 1;
	XRL FARG_Display_Temperature_temp2write+0, #255
	XRL FARG_Display_Temperature_temp2write+1, #255
	MOV A, #1
	ADD A, FARG_Display_Temperature_temp2write+0
	MOV FARG_Display_Temperature_temp2write+0, A
	MOV A, #0
	ADDC A, FARG_Display_Temperature_temp2write+1
	MOV FARG_Display_Temperature_temp2write+1, A
;BT5a.c,18 :: 		}
L_Display_Temperature0:
;BT5a.c,19 :: 		temp_whole = temp2write >> RES_SHIFT;
	MOV R2, #1
	MOV A, FARG_Display_Temperature_temp2write+1
	MOV R0, FARG_Display_Temperature_temp2write+0
	INC R2
	SJMP L__Display_Temperature6
L__Display_Temperature7:
	CLR C
	RRC A
	XCH A, R0
	RRC A
	XCH A, R0
L__Display_Temperature6:
	DJNZ R2, L__Display_Temperature7
	MOV R1, A
	MOV Display_Temperature_temp_whole_L0+0, 0
;BT5a.c,20 :: 		if (temp_whole/100)
	MOV B+0, #100
	MOV A, R0
	DIV AB
	MOV R0, A
	JZ L_Display_Temperature1
;BT5a.c,21 :: 		text[0] = temp_whole/100 + 48;
	MOV R0, _text+0
	MOV B+0, #100
	MOV A, Display_Temperature_temp_whole_L0+0
	DIV AB
	MOV R1, A
	ADD A, #48
	MOV R1, A
	MOV @R0, 1
	SJMP L_Display_Temperature2
L_Display_Temperature1:
;BT5a.c,23 :: 		text[0] = '0';
	MOV R0, _text+0
	MOV @R0, #48
L_Display_Temperature2:
;BT5a.c,24 :: 		text[1] = (temp_whole/10)%10 + 48; // Extract tens digit
	MOV A, _text+0
	ADD A, #1
	MOV R0, A
	MOV B+0, #10
	MOV A, Display_Temperature_temp_whole_L0+0
	DIV AB
	MOV R1, A
	MOV B+0, #10
	MOV A, R1
	DIV AB
	MOV A, B+0
	MOV R1, A
	ADD A, #48
	MOV R1, A
	MOV @R0, 1
;BT5a.c,25 :: 		text[2] = temp_whole%10 + 48; // Extract ones digit
	MOV A, _text+0
	ADD A, #2
	MOV R0, A
	MOV B+0, #10
	MOV A, Display_Temperature_temp_whole_L0+0
	DIV AB
	MOV A, B+0
	MOV R1, A
	ADD A, #48
	MOV R1, A
	MOV @R0, 1
;BT5a.c,26 :: 		temp_fraction = temp2write << (4-RES_SHIFT);
	MOV R2, #3
	MOV R1, FARG_Display_Temperature_temp2write+1
	MOV A, FARG_Display_Temperature_temp2write+0
	INC R2
	SJMP L__Display_Temperature8
L__Display_Temperature9:
	CLR C
	RLC A
	XCH A, R1
	RLC A
	XCH A, R1
L__Display_Temperature8:
	DJNZ R2, L__Display_Temperature9
	MOV R0, A
	MOV Display_Temperature_temp_fraction_L0+0, 0
	MOV Display_Temperature_temp_fraction_L0+1, 1
;BT5a.c,27 :: 		temp_fraction &= 0x000F;
	ANL 0, #15
	ANL 1, #0
	MOV Display_Temperature_temp_fraction_L0+0, 0
	MOV Display_Temperature_temp_fraction_L0+1, 1
;BT5a.c,28 :: 		temp_fraction *= 625;
	MOV R4, #113
	MOV R5, #2
	LCALL _Mul_16x16+0
	MOV Display_Temperature_temp_fraction_L0+0, 0
	MOV Display_Temperature_temp_fraction_L0+1, 1
;BT5a.c,29 :: 		text[4] = temp_fraction/1000 + 48; // Extract thousands digit
	PUSH 0
	MOV A, _text+0
	ADD A, #4
	MOV R0, A
	MOV FLOC__Display_Temperature+0, 0
	POP 0
	MOV R4, #232
	MOV R5, #3
	LCALL _Div_16x16_U+0
	MOV A, #48
	ADD A, R0
	MOV R1, A
	MOV R0, FLOC__Display_Temperature+0
	MOV @R0, 1
;BT5a.c,30 :: 		text[5] = (temp_fraction/100)%10 + 48; // Extract hundreds digit
	MOV A, _text+0
	ADD A, #5
	MOV R0, A
	MOV FLOC__Display_Temperature+0, 0
	MOV R4, #100
	MOV R5, #0
	MOV R0, Display_Temperature_temp_fraction_L0+0
	MOV R1, Display_Temperature_temp_fraction_L0+1
	LCALL _Div_16x16_U+0
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV A, #48
	ADD A, R0
	MOV R1, A
	MOV R0, FLOC__Display_Temperature+0
	MOV @R0, 1
;BT5a.c,31 :: 		text[6] = (temp_fraction/10)%10 + 48; // Extract tens digit
	MOV A, _text+0
	ADD A, #6
	MOV R0, A
	MOV FLOC__Display_Temperature+0, 0
	MOV R4, #10
	MOV R5, #0
	MOV R0, Display_Temperature_temp_fraction_L0+0
	MOV R1, Display_Temperature_temp_fraction_L0+1
	LCALL _Div_16x16_U+0
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV A, #48
	ADD A, R0
	MOV R1, A
	MOV R0, FLOC__Display_Temperature+0
	MOV @R0, 1
;BT5a.c,32 :: 		text[7] = temp_fraction%10 + 48; // Extract ones digit
	MOV A, _text+0
	ADD A, #7
	MOV R0, A
	MOV FLOC__Display_Temperature+0, 0
	MOV R4, #10
	MOV R5, #0
	MOV R0, Display_Temperature_temp_fraction_L0+0
	MOV R1, Display_Temperature_temp_fraction_L0+1
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV A, #48
	ADD A, R0
	MOV R1, A
	MOV R0, FLOC__Display_Temperature+0
	MOV @R0, 1
;BT5a.c,33 :: 		Lcd_Out(2, 5, text);
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #5
	MOV FARG_LCD_Out_text+0, _text+0
	LCALL _LCD_Out+0
;BT5a.c,34 :: 		}
	RET
; end of _Display_Temperature

_main:
	MOV SP+0, #128
;BT5a.c,35 :: 		void main() {
;BT5a.c,36 :: 		Lcd_Init(); // Initialize LCD
	LCALL _Lcd_Init+0
;BT5a.c,37 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear LCD
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;BT5a.c,38 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOV FARG_Lcd_Cmd_out_char+0, #12
	LCALL _Lcd_Cmd+0
;BT5a.c,39 :: 		Lcd_Out(1, 1, " NHIET DO : ");
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr2_BT5a+0
	LCALL _LCD_Out+0
;BT5a.c,40 :: 		Lcd_Out(2, 1, " 26 do F");
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr3_BT5a+0
	LCALL _LCD_Out+0
;BT5a.c,41 :: 		delay_ms(2000);
	MOV R5, 13
	MOV R6, 171
	MOV R7, 124
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;BT5a.c,42 :: 		Lcd_Chr(2,13,223); // different LCD displays have different char code for
	MOV FARG_Lcd_Chr_row+0, #2
	MOV FARG_Lcd_Chr_column+0, #13
	MOV FARG_Lcd_Chr_out_char+0, #223
	LCALL _Lcd_Chr+0
;BT5a.c,43 :: 		Lcd_Chr(2,14,'F');
	MOV FARG_Lcd_Chr_row+0, #2
	MOV FARG_Lcd_Chr_column+0, #14
	MOV FARG_Lcd_Chr_out_char+0, #70
	LCALL _Lcd_Chr+0
;BT5a.c,44 :: 		do {
L_main3:
;BT5a.c,45 :: 		Display_Temperature(temp);
	MOV FARG_Display_Temperature_temp2write+0, _temp+0
	MOV FARG_Display_Temperature_temp2write+1, _temp+1
	LCALL _Display_Temperature+0
;BT5a.c,46 :: 		P3=0XFF;
	MOV P3+0, #255
;BT5a.c,47 :: 		Delay_ms(500);
	MOV R5, 4
	MOV R6, 43
	MOV R7, 157
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;BT5a.c,48 :: 		} while (1);
	SJMP L_main3
;BT5a.c,49 :: 		}
	SJMP #254
; end of _main
