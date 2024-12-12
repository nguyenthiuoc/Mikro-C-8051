
_main:
	MOV SP+0, #128
;BT3a.c,12 :: 		void main() {
;BT3a.c,13 :: 		Keypad_Init(); // Initialize Keypad
	LCALL _Keypad_Init+0
;BT3a.c,14 :: 		Lcd_Init(); // Initialize LCD
	LCALL _Lcd_Init+0
;BT3a.c,15 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;BT3a.c,16 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOV FARG_Lcd_Cmd_out_char+0, #12
	LCALL _Lcd_Cmd+0
;BT3a.c,17 :: 		Lcd_Out(1, 1, "Bin : "); // Write message text on LCD
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr1_BT3a+0
	LCALL _LCD_Out+0
;BT3a.c,18 :: 		Lcd_Out(2, 1, "Hex: ");
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr2_BT3a+0
	LCALL _LCD_Out+0
;BT3a.c,19 :: 		do {
L_main0:
;BT3a.c,20 :: 		kp = 0; // Reset key code variable
	MOV _kp+0, #0
;BT3a.c,21 :: 		do
L_main3:
;BT3a.c,22 :: 		kp = Keypad_Key_Click(); // Store key code in kp variable
	LCALL _Keypad_Key_Click+0
	MOV _kp+0, 0
;BT3a.c,23 :: 		while (!kp);
	MOV A, R0
	JZ L_main3
;BT3a.c,24 :: 		switch (kp) {
	SJMP L_main6
;BT3a.c,25 :: 		case 1:
L_main8:
;BT3a.c,26 :: 		kp = 49;
	MOV _kp+0, #49
;BT3a.c,27 :: 		bin[i]=1;
	MOV A, #_bin+0
	ADD A, _i+0
	MOV R0, A
	MOV @R0, #1
;BT3a.c,28 :: 		i++;
	INC _i+0
;BT3a.c,29 :: 		break; // 1
	LJMP L_main7
;BT3a.c,30 :: 		case 14:
L_main9:
;BT3a.c,31 :: 		kp = 48;
	MOV _kp+0, #48
;BT3a.c,32 :: 		bin[i]=0;
	MOV A, #_bin+0
	ADD A, _i+0
	MOV R0, A
	MOV @R0, #0
;BT3a.c,33 :: 		i++;
	INC _i+0
;BT3a.c,34 :: 		; break; // 0
	SJMP L_main7
;BT3a.c,35 :: 		case 15:
L_main10:
;BT3a.c,36 :: 		i=0;
	MOV _i+0, #0
;BT3a.c,37 :: 		cot=8;
	MOV _cot+0, #8
;BT3a.c,38 :: 		break; // #
	SJMP L_main7
;BT3a.c,39 :: 		case 16:
L_main11:
;BT3a.c,40 :: 		Dec=bin[0]*8+bin[1]*4+bin[2]*2+bin[3]*1;
	MOV R0, #3
	MOV A, _bin+0
	INC R0
	SJMP L__main31
L__main32:
	CLR C
	RLC A
L__main31:
	DJNZ R0, L__main32
	MOV _Dec+0, A
	MOV R1, #2
	MOV A, _bin+1
	INC R1
	SJMP L__main33
L__main34:
	CLR C
	RLC A
L__main33:
	DJNZ R1, L__main34
	MOV R0, A
	MOV A, _Dec+0
	ADD A, R0
	MOV _Dec+0, A
	MOV R1, #1
	MOV A, _bin+2
	INC R1
	SJMP L__main35
L__main36:
	CLR C
	RLC A
L__main35:
	DJNZ R1, L__main36
	MOV R0, A
	MOV A, _Dec+0
	ADD A, R0
	MOV _Dec+0, A
	MOV R0, _bin+3
	MOV A, _Dec+0
	ADD A, R0
	MOV _Dec+0, A
;BT3a.c,41 :: 		flag=1;
	MOV _flag+0, #1
;BT3a.c,42 :: 		break; // D
	SJMP L_main7
;BT3a.c,43 :: 		}
L_main6:
	MOV A, _kp+0
	XRL A, #1
	JZ L_main8
	MOV A, _kp+0
	XRL A, #14
	JZ L_main9
	MOV A, _kp+0
	XRL A, #15
	JZ L_main10
	MOV A, _kp+0
	XRL A, #16
	JZ L_main11
L_main7:
;BT3a.c,44 :: 		if(flag==1){
	MOV A, _flag+0
	XRL A, #1
	JZ #3
	LJMP L_main12
;BT3a.c,45 :: 		switch (Dec) {
	SJMP L_main13
;BT3a.c,46 :: 		case 0:
L_main15:
;BT3a.c,47 :: 		Hex = 48;
	MOV _Hex+0, #48
;BT3a.c,48 :: 		break; // 0
	LJMP L_main14
;BT3a.c,49 :: 		case 1:
L_main16:
;BT3a.c,50 :: 		Hex = 49;
	MOV _Hex+0, #49
;BT3a.c,51 :: 		break; // 1
	LJMP L_main14
;BT3a.c,52 :: 		case 2:
L_main17:
;BT3a.c,53 :: 		Hex = 50;
	MOV _Hex+0, #50
;BT3a.c,54 :: 		break; // 2
	LJMP L_main14
;BT3a.c,55 :: 		case 3:
L_main18:
;BT3a.c,56 :: 		Hex = 51;
	MOV _Hex+0, #51
;BT3a.c,57 :: 		break; // 3
	LJMP L_main14
;BT3a.c,58 :: 		case 4:
L_main19:
;BT3a.c,59 :: 		Hex = 52;
	MOV _Hex+0, #52
;BT3a.c,60 :: 		break; // 4
	LJMP L_main14
;BT3a.c,61 :: 		case 5:
L_main20:
;BT3a.c,62 :: 		Hex = 53;
	MOV _Hex+0, #53
;BT3a.c,63 :: 		break; // 5
	LJMP L_main14
;BT3a.c,64 :: 		case 6:
L_main21:
;BT3a.c,65 :: 		Hex = 54;
	MOV _Hex+0, #54
;BT3a.c,66 :: 		break; // 6
	LJMP L_main14
;BT3a.c,67 :: 		case 7:
L_main22:
;BT3a.c,68 :: 		Hex = 55;
	MOV _Hex+0, #55
;BT3a.c,69 :: 		break; // 7
	LJMP L_main14
;BT3a.c,70 :: 		case 8:
L_main23:
;BT3a.c,71 :: 		Hex = 56;
	MOV _Hex+0, #56
;BT3a.c,72 :: 		break; // 8
	LJMP L_main14
;BT3a.c,73 :: 		case 9:
L_main24:
;BT3a.c,74 :: 		Hex = 57;
	MOV _Hex+0, #57
;BT3a.c,75 :: 		break; // 9
	LJMP L_main14
;BT3a.c,76 :: 		case 10:
L_main25:
;BT3a.c,77 :: 		Hex = 65;
	MOV _Hex+0, #65
;BT3a.c,78 :: 		break; // A
	LJMP L_main14
;BT3a.c,79 :: 		case 11:
L_main26:
;BT3a.c,80 :: 		Hex = 66;
	MOV _Hex+0, #66
;BT3a.c,81 :: 		break; // B
	LJMP L_main14
;BT3a.c,82 :: 		case 12:
L_main27:
;BT3a.c,83 :: 		Hex = 67;
	MOV _Hex+0, #67
;BT3a.c,84 :: 		break; // C
	LJMP L_main14
;BT3a.c,85 :: 		case 13:
L_main28:
;BT3a.c,86 :: 		Hex = 68;
	MOV _Hex+0, #68
;BT3a.c,87 :: 		break; // D
	LJMP L_main14
;BT3a.c,88 :: 		case 14:
L_main29:
;BT3a.c,89 :: 		Hex = 69;
	MOV _Hex+0, #69
;BT3a.c,90 :: 		break; // E
	LJMP L_main14
;BT3a.c,91 :: 		case 15:
L_main30:
;BT3a.c,92 :: 		Hex = 70;
	MOV _Hex+0, #70
;BT3a.c,93 :: 		break; // F
	LJMP L_main14
;BT3a.c,94 :: 		}
L_main13:
	MOV A, _Dec+0
	JZ L_main15
	MOV A, _Dec+0
	XRL A, #1
	JZ L_main16
	MOV A, _Dec+0
	XRL A, #2
	JZ L_main17
	MOV A, _Dec+0
	XRL A, #3
	JZ L_main18
	MOV A, _Dec+0
	XRL A, #4
	JZ L_main19
	MOV A, _Dec+0
	XRL A, #5
	JZ L_main20
	MOV A, _Dec+0
	XRL A, #6
	JZ L_main21
	MOV A, _Dec+0
	XRL A, #7
	JZ L_main22
	MOV A, _Dec+0
	XRL A, #8
	JZ L_main23
	MOV A, _Dec+0
	XRL A, #9
	JNZ #3
	LJMP L_main24
	MOV A, _Dec+0
	XRL A, #10
	JNZ #3
	LJMP L_main25
	MOV A, _Dec+0
	XRL A, #11
	JNZ #3
	LJMP L_main26
	MOV A, _Dec+0
	XRL A, #12
	JNZ #3
	LJMP L_main27
	MOV A, _Dec+0
	XRL A, #13
	JNZ #3
	LJMP L_main28
	MOV A, _Dec+0
	XRL A, #14
	JNZ #3
	LJMP L_main29
	MOV A, _Dec+0
	XRL A, #15
	JNZ #3
	LJMP L_main30
L_main14:
;BT3a.c,95 :: 		}
L_main12:
;BT3a.c,96 :: 		Lcd_Chr(2, 7, Hex);
	MOV FARG_Lcd_Chr_row+0, #2
	MOV FARG_Lcd_Chr_column+0, #7
	MOV FARG_Lcd_Chr_out_char+0, _Hex+0
	LCALL _Lcd_Chr+0
;BT3a.c,97 :: 		cot++;
	INC _cot+0
;BT3a.c,98 :: 		Lcd_Chr(1, cot, kp);
	MOV FARG_Lcd_Chr_row+0, #1
	MOV FARG_Lcd_Chr_column+0, _cot+0
	MOV FARG_Lcd_Chr_out_char+0, _kp+0
	LCALL _Lcd_Chr+0
;BT3a.c,99 :: 		} while (1);
	LJMP L_main0
;BT3a.c,100 :: 		}
	SJMP #254
; end of _main
