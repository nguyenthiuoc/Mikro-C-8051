
_External_ISR:
	PUSH PSW+0
	PUSH 224
	PUSH B+0
	PUSH 130
	PUSH 131
;bt6.c,9 :: 		void External_ISR()org 0x0003 ilevel 0 {
;bt6.c,10 :: 		EA_bit = 0;
	CLR EA_bit+0
;bt6.c,11 :: 		tmp=  1;
	SETB C
	MOV A, _tmp+0
	MOV #224, C
	MOV _tmp+0, A
;bt6.c,12 :: 		EA_bit = 1;
	SETB EA_bit+0
;bt6.c,13 :: 		}
	POP 131
	POP 130
	POP B+0
	POP 224
	POP PSW+0
	RETI
; end of _External_ISR

_main:
	MOV SP+0, #128
;bt6.c,14 :: 		void main() {
;bt6.c,15 :: 		unsigned int j=0;
;bt6.c,16 :: 		tmp=0;
	CLR C
	MOV A, _tmp+0
	MOV #224, C
	MOV _tmp+0, A
;bt6.c,17 :: 		P0 = 0xFF;
	MOV P0+0, #255
;bt6.c,18 :: 		P3 = 0xFF;
	MOV P3+0, #255
;bt6.c,19 :: 		IE = 0x81;
	MOV IE+0, #129
;bt6.c,20 :: 		Lcd_Init();
	LCALL _Lcd_Init+0
;bt6.c,21 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;bt6.c,22 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOV FARG_Lcd_Cmd_out_char+0, #12
	LCALL _Lcd_Cmd+0
;bt6.c,23 :: 		Lcd_Out(1, 1, " HO VA TEN : ");
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr2_bt6+0
	LCALL _LCD_Out+0
;bt6.c,24 :: 		Lcd_Out(2, 1, " UOC ");
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr3_bt6+0
	LCALL _LCD_Out+0
;bt6.c,25 :: 		delay_ms(2000);
	MOV R5, 13
	MOV R6, 171
	MOV R7, 124
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;bt6.c,26 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;bt6.c,27 :: 		Lcd_Out(1, 1, "SO LAN BAM NUT : ");
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr4_bt6+0
	LCALL _LCD_Out+0
;bt6.c,28 :: 		while(1){
L_main0:
;bt6.c,29 :: 		if(tmp)
	MOV A, _tmp+0
	JNB 224, L_main2
	NOP
;bt6.c,31 :: 		cnt=cnt+1;
	MOV A, #1
	ADD A, _cnt+0
	MOV _cnt+0, A
	MOV A, #0
	ADDC A, _cnt+1
	MOV _cnt+1, A
;bt6.c,32 :: 		tmp=0;
	CLR C
	MOV A, _tmp+0
	MOV #224, C
	MOV _tmp+0, A
;bt6.c,33 :: 		}
L_main2:
;bt6.c,34 :: 		P0=cnt;
	MOV P0+0, _cnt+0
;bt6.c,35 :: 		text[0] =  cnt/1000    + 48;
	MOV R0, _text+0
	MOV FLOC__main+0, 0
	MOV R4, #232
	MOV R5, #3
	MOV R0, _cnt+0
	MOV R1, _cnt+1
	LCALL _Div_16x16_U+0
	MOV A, #48
	ADD A, R0
	MOV R1, A
	MOV R0, FLOC__main+0
	MOV @R0, 1
;bt6.c,36 :: 		text[1] = (cnt/100)%10 + 48;
	MOV A, _text+0
	ADD A, #1
	MOV R0, A
	MOV FLOC__main+0, 0
	MOV R4, #100
	MOV R5, #0
	MOV R0, _cnt+0
	MOV R1, _cnt+1
	LCALL _Div_16x16_U+0
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV A, #48
	ADD A, R0
	MOV R1, A
	MOV R0, FLOC__main+0
	MOV @R0, 1
;bt6.c,37 :: 		text[2] = (cnt/10)%10  + 48;
	MOV A, _text+0
	ADD A, #2
	MOV R0, A
	MOV FLOC__main+0, 0
	MOV R4, #10
	MOV R5, #0
	MOV R0, _cnt+0
	MOV R1, _cnt+1
	LCALL _Div_16x16_U+0
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV A, #48
	ADD A, R0
	MOV R1, A
	MOV R0, FLOC__main+0
	MOV @R0, 1
;bt6.c,38 :: 		text[3] =  cnt%10      + 48;
	MOV A, _text+0
	ADD A, #3
	MOV R0, A
	MOV FLOC__main+0, 0
	MOV R4, #10
	MOV R5, #0
	MOV R0, _cnt+0
	MOV R1, _cnt+1
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV A, #48
	ADD A, R0
	MOV R1, A
	MOV R0, FLOC__main+0
	MOV @R0, 1
;bt6.c,39 :: 		Lcd_Out(2, 6, text);
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #6
	MOV FARG_LCD_Out_text+0, _text+0
	LCALL _LCD_Out+0
;bt6.c,40 :: 		delay_ms(1000);
	MOV R5, 7
	MOV R6, 86
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;bt6.c,41 :: 		}
	LJMP L_main0
;bt6.c,42 :: 		}
	SJMP #254
; end of _main
