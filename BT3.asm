
_main:
	MOV SP+0, #128
;BT3.c,23 :: 		void main() {
;BT3.c,24 :: 		cnt = 0;                                 // Reset counter
	MOV _cnt+0, #0
;BT3.c,25 :: 		Keypad_Init();                           // Initialize Keypad
	LCALL _Keypad_Init+0
;BT3.c,26 :: 		Lcd_Init();                              // Initialize LCD
	LCALL _Lcd_Init+0
;BT3.c,27 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;BT3.c,28 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
	MOV FARG_Lcd_Cmd_out_char+0, #12
	LCALL _Lcd_Cmd+0
;BT3.c,30 :: 		Lcd_Out(1, 1, "Key  :");                 // Write message text on LCD
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr1_BT3+0
	LCALL _LCD_Out+0
;BT3.c,31 :: 		Lcd_Out(2, 1, "Times:");
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr2_BT3+0
	LCALL _LCD_Out+0
;BT3.c,33 :: 		do {
L_main0:
;BT3.c,34 :: 		kp = 0;                                // Reset key code variable
	MOV _kp+0, #0
;BT3.c,37 :: 		do {
L_main3:
;BT3.c,38 :: 		kp = Keypad_Key_Click();             // Get key click from the keypad
	LCALL _Keypad_Key_Click+0
	MOV _kp+0, 0
;BT3.c,39 :: 		} while (!kp);                         // Continue loop until a key is pressed
	MOV A, R0
	JZ L_main3
;BT3.c,42 :: 		switch (kp) {
	SJMP L_main6
;BT3.c,43 :: 		case  1: kp = '1'; break;
L_main8:
	MOV _kp+0, #49
	LJMP L_main7
;BT3.c,44 :: 		case  2: kp = '2'; break;
L_main9:
	MOV _kp+0, #50
	LJMP L_main7
;BT3.c,45 :: 		case  3: kp = '3'; break;
L_main10:
	MOV _kp+0, #51
	LJMP L_main7
;BT3.c,46 :: 		case  4: kp = 'A'; break;
L_main11:
	MOV _kp+0, #65
	LJMP L_main7
;BT3.c,47 :: 		case  5: kp = '4'; break;
L_main12:
	MOV _kp+0, #52
	LJMP L_main7
;BT3.c,48 :: 		case  6: kp = '5'; break;
L_main13:
	MOV _kp+0, #53
	LJMP L_main7
;BT3.c,49 :: 		case  7: kp = '6'; break;
L_main14:
	MOV _kp+0, #54
	LJMP L_main7
;BT3.c,50 :: 		case  8: kp = 'B'; break;
L_main15:
	MOV _kp+0, #66
	LJMP L_main7
;BT3.c,51 :: 		case  9: kp = '7'; break;
L_main16:
	MOV _kp+0, #55
	LJMP L_main7
;BT3.c,52 :: 		case 10: kp = '8'; break;
L_main17:
	MOV _kp+0, #56
	LJMP L_main7
;BT3.c,53 :: 		case 11: kp = '9'; break;
L_main18:
	MOV _kp+0, #57
	LJMP L_main7
;BT3.c,54 :: 		case 12: kp = 'C'; break;
L_main19:
	MOV _kp+0, #67
	LJMP L_main7
;BT3.c,55 :: 		case 13: kp = '*'; break;
L_main20:
	MOV _kp+0, #42
	LJMP L_main7
;BT3.c,56 :: 		case 14: kp = '0'; break;
L_main21:
	MOV _kp+0, #48
	LJMP L_main7
;BT3.c,57 :: 		case 15: kp = '#'; break;
L_main22:
	MOV _kp+0, #35
	LJMP L_main7
;BT3.c,58 :: 		case 16: kp = 'D'; break;
L_main23:
	MOV _kp+0, #68
	LJMP L_main7
;BT3.c,59 :: 		}
L_main6:
	MOV A, _kp+0
	XRL A, #1
	JZ L_main8
	MOV A, _kp+0
	XRL A, #2
	JZ L_main9
	MOV A, _kp+0
	XRL A, #3
	JZ L_main10
	MOV A, _kp+0
	XRL A, #4
	JZ L_main11
	MOV A, _kp+0
	XRL A, #5
	JZ L_main12
	MOV A, _kp+0
	XRL A, #6
	JZ L_main13
	MOV A, _kp+0
	XRL A, #7
	JZ L_main14
	MOV A, _kp+0
	XRL A, #8
	JZ L_main15
	MOV A, _kp+0
	XRL A, #9
	JZ L_main16
	MOV A, _kp+0
	XRL A, #10
	JNZ #3
	LJMP L_main17
	MOV A, _kp+0
	XRL A, #11
	JNZ #3
	LJMP L_main18
	MOV A, _kp+0
	XRL A, #12
	JNZ #3
	LJMP L_main19
	MOV A, _kp+0
	XRL A, #13
	JNZ #3
	LJMP L_main20
	MOV A, _kp+0
	XRL A, #14
	JNZ #3
	LJMP L_main21
	MOV A, _kp+0
	XRL A, #15
	JNZ #3
	LJMP L_main22
	MOV A, _kp+0
	XRL A, #16
	JNZ #3
	LJMP L_main23
L_main7:
;BT3.c,62 :: 		if (kp != oldstate) {
	MOV A, _kp+0
	XRL A, _oldstate+0
	JZ L_main24
;BT3.c,63 :: 		cnt = 1;                              // Reset counter
	MOV _cnt+0, #1
;BT3.c,64 :: 		oldstate = kp;                        // Update previous state
	MOV _oldstate+0, _kp+0
;BT3.c,65 :: 		} else {
	SJMP L_main25
L_main24:
;BT3.c,66 :: 		cnt++;                                // Increment counter for the same key
	INC _cnt+0
;BT3.c,67 :: 		}
L_main25:
;BT3.c,70 :: 		Lcd_Chr(1, 10, kp);
	MOV FARG_Lcd_Chr_row+0, #1
	MOV FARG_Lcd_Chr_column+0, #10
	MOV FARG_Lcd_Chr_out_char+0, _kp+0
	LCALL _Lcd_Chr+0
;BT3.c,73 :: 		if (cnt == 255) {
	MOV A, _cnt+0
	XRL A, #255
	JNZ L_main26
;BT3.c,74 :: 		cnt = 0;
	MOV _cnt+0, #0
;BT3.c,75 :: 		Lcd_Out(2, 10, "   ");               // Clear previous counter display
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #10
	MOV FARG_LCD_Out_text+0, #?lstr3_BT3+0
	LCALL _LCD_Out+0
;BT3.c,76 :: 		}
L_main26:
;BT3.c,79 :: 		WordToStr(cnt, txt);
	MOV FARG_WordToStr_input+0, _cnt+0
	CLR A
	MOV FARG_WordToStr_input+1, A
	MOV FARG_WordToStr_output+0, #_txt+0
	LCALL _WordToStr+0
;BT3.c,80 :: 		Lcd_Out(2, 10, txt);
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #10
	MOV FARG_LCD_Out_text+0, #_txt+0
	LCALL _LCD_Out+0
;BT3.c,82 :: 		} while (1);                              // Infinite loop
	LJMP L_main0
;BT3.c,83 :: 		}
	SJMP #254
; end of _main
