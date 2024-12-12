
_Fn_DELAY:
;BT2.c,9 :: 		void Fn_DELAY (unsigned int_vrui_Time)
;BT2.c,11 :: 		while(int_vrui_Time--);
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
;BT2.c,12 :: 		}
	RET
; end of _Fn_DELAY

_main:
	MOV SP+0, #128
;BT2.c,14 :: 		void main()// tao chuong trinh chinh
;BT2.c,18 :: 		while(1)
L_main2:
;BT2.c,20 :: 		for(j = 0; j < 200; j++)
	MOV main_j_L0+0, #0
L_main4:
	CLR C
	MOV A, main_j_L0+0
	SUBB A, #200
	JNC L_main5
;BT2.c,22 :: 		for(i = 0; i < 8; i++)
	MOV main_i_L0+0, #0
L_main7:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #8
	JNC L_main8
;BT2.c,24 :: 		P3 = ChuB[i];
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
;BT2.c,25 :: 		P2 = QuetB[i];
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
;BT2.c,26 :: 		Fn_DELAY(50);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #50
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT2.c,27 :: 		P3 = 0X00;
	MOV P3+0, #0
;BT2.c,28 :: 		Fn_DELAY(10);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #10
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT2.c,22 :: 		for(i = 0; i < 8; i++)
	INC main_i_L0+0
;BT2.c,29 :: 		}
	SJMP L_main7
L_main8:
;BT2.c,20 :: 		for(j = 0; j < 200; j++)
	INC main_j_L0+0
;BT2.c,30 :: 		}
	SJMP L_main4
L_main5:
;BT2.c,31 :: 		for(j = 0; j < 200; j++)
	MOV main_j_L0+0, #0
L_main10:
	CLR C
	MOV A, main_j_L0+0
	SUBB A, #200
	JNC L_main11
;BT2.c,33 :: 		for(i = 0; i < 8; i++)
	MOV main_i_L0+0, #0
L_main13:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #8
	JNC L_main14
;BT2.c,35 :: 		P3 = ChuE[i];
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
;BT2.c,36 :: 		P2 = QuetE[i];
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
;BT2.c,37 :: 		Fn_DELAY(50);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #50
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT2.c,38 :: 		P3 = 0X00;
	MOV P3+0, #0
;BT2.c,39 :: 		Fn_DELAY(10);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #10
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT2.c,33 :: 		for(i = 0; i < 8; i++)
	INC main_i_L0+0
;BT2.c,40 :: 		}
	SJMP L_main13
L_main14:
;BT2.c,31 :: 		for(j = 0; j < 200; j++)
	INC main_j_L0+0
;BT2.c,41 :: 		}
	SJMP L_main10
L_main11:
;BT2.c,42 :: 		for(j = 0; j < 200; j++)
	MOV main_j_L0+0, #0
L_main16:
	CLR C
	MOV A, main_j_L0+0
	SUBB A, #200
	JNC L_main17
;BT2.c,44 :: 		for(i = 0; i < 8; i++)
	MOV main_i_L0+0, #0
L_main19:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #8
	JNC L_main20
;BT2.c,46 :: 		P3 = ChuN[i];
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
;BT2.c,47 :: 		P2 = QuetN[i];
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
;BT2.c,48 :: 		Fn_DELAY(50);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #50
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT2.c,49 :: 		P3 = 0X00;
	MOV P3+0, #0
;BT2.c,50 :: 		Fn_DELAY(10);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #10
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT2.c,44 :: 		for(i = 0; i < 8; i++)
	INC main_i_L0+0
;BT2.c,51 :: 		}
	SJMP L_main19
L_main20:
;BT2.c,42 :: 		for(j = 0; j < 200; j++)
	INC main_j_L0+0
;BT2.c,52 :: 		}
	SJMP L_main16
L_main17:
;BT2.c,53 :: 		}
	LJMP L_main2
;BT2.c,54 :: 		}
	SJMP #254
; end of _main
