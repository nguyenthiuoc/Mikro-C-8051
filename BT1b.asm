
_Fn_DELAY:
;BT1b.c,9 :: 		void Fn_DELAY (unsigned int_vrui_Time)
;BT1b.c,11 :: 		while(int_vrui_Time--);
L_Fn_DELAY0:
	MOV R0, FARG_Fn_DELAY_int_vrui_Time+0
	MOV R1, FARG_Fn_DELAY_int_vrui_Time+1
	CLR C
	MOV A, FARG_Fn_DELAY_int_vrui_Time+0
	SUBB A, #1
	MOV FARG_Fn_DELAY_int_vrui_Time+0, A
	MOV A, FARG_Fn_DELAY_int_vrui_Time+1
	SUBB A, #0
	MOV FARG_Fn_DELAY_int_vrui_Time+1, A
	MOV A, R0
	ORL A, R1
	JZ L_Fn_DELAY1
	SJMP L_Fn_DELAY0
L_Fn_DELAY1:
;BT1b.c,12 :: 		}
	RET
; end of _Fn_DELAY

_main:
	MOV SP+0, #128
;BT1b.c,14 :: 		void main()// tao chuong trinh chinh
;BT1b.c,18 :: 		while(1)
L_main2:
;BT1b.c,20 :: 		for(j = 0; j < 200; j++)
	MOV main_j_L0+0, #0
L_main4:
	CLR C
	MOV A, main_j_L0+0
	SUBB A, #200
	JNC L_main5
;BT1b.c,22 :: 		for(i = 0; i < 8; i++)
	MOV main_i_L0+0, #0
L_main7:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #8
	JNC L_main8
;BT1b.c,24 :: 		P3 = ChuB[i];
	MOV A, main_i_L0+0
	ADD A, #_chuB+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_chuB+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV P3+0, 0
;BT1b.c,25 :: 		P2 = QuetB[i];
	MOV A, main_i_L0+0
	ADD A, #_QuetB+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_QuetB+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV P2+0, 0
;BT1b.c,26 :: 		Fn_DELAY(50);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #50
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT1b.c,27 :: 		P3 = 0X00;
	MOV P3+0, #0
;BT1b.c,28 :: 		Fn_DELAY(10);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #10
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT1b.c,22 :: 		for(i = 0; i < 8; i++)
	INC main_i_L0+0
;BT1b.c,29 :: 		}
	SJMP L_main7
L_main8:
;BT1b.c,20 :: 		for(j = 0; j < 200; j++)
	INC main_j_L0+0
;BT1b.c,30 :: 		}
	SJMP L_main4
L_main5:
;BT1b.c,31 :: 		for(j = 0; j < 200; j++)
	MOV main_j_L0+0, #0
L_main10:
	CLR C
	MOV A, main_j_L0+0
	SUBB A, #200
	JNC L_main11
;BT1b.c,33 :: 		for(i = 0; i < 8; i++)
	MOV main_i_L0+0, #0
L_main13:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #8
	JNC L_main14
;BT1b.c,35 :: 		P3 = ChuE[i];
	MOV A, main_i_L0+0
	ADD A, #_chuE+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_chuE+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV P3+0, 0
;BT1b.c,36 :: 		P2 = QuetE[i];
	MOV A, main_i_L0+0
	ADD A, #_QuetE+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_QuetE+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV P2+0, 0
;BT1b.c,37 :: 		Fn_DELAY(50);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #50
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT1b.c,38 :: 		P3 = 0X00;
	MOV P3+0, #0
;BT1b.c,39 :: 		Fn_DELAY(10);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #10
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT1b.c,33 :: 		for(i = 0; i < 8; i++)
	INC main_i_L0+0
;BT1b.c,40 :: 		}
	SJMP L_main13
L_main14:
;BT1b.c,31 :: 		for(j = 0; j < 200; j++)
	INC main_j_L0+0
;BT1b.c,41 :: 		}
	SJMP L_main10
L_main11:
;BT1b.c,42 :: 		for(j = 0; j < 200; j++)
	MOV main_j_L0+0, #0
L_main16:
	CLR C
	MOV A, main_j_L0+0
	SUBB A, #200
	JNC L_main17
;BT1b.c,44 :: 		for(i = 0; i < 8; i++)
	MOV main_i_L0+0, #0
L_main19:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #8
	JNC L_main20
;BT1b.c,46 :: 		P3 = ChuN[i];
	MOV A, main_i_L0+0
	ADD A, #_chuN+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_chuN+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV P3+0, 0
;BT1b.c,47 :: 		P2 = QuetN[i];
	MOV A, main_i_L0+0
	ADD A, #_QuetN+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_QuetN+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV P2+0, 0
;BT1b.c,48 :: 		Fn_DELAY(50);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #50
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT1b.c,49 :: 		P3 = 0X00;
	MOV P3+0, #0
;BT1b.c,50 :: 		Fn_DELAY(10);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #10
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT1b.c,44 :: 		for(i = 0; i < 8; i++)
	INC main_i_L0+0
;BT1b.c,51 :: 		}
	SJMP L_main19
L_main20:
;BT1b.c,42 :: 		for(j = 0; j < 200; j++)
	INC main_j_L0+0
;BT1b.c,52 :: 		}
	SJMP L_main16
L_main17:
;BT1b.c,53 :: 		}
	LJMP L_main2
;BT1b.c,54 :: 		}
	SJMP #254
; end of _main
