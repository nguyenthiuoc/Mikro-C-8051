
_Fn_DELAY:
;BT1b.c,13 :: 		void Fn_DELAY (unsigned int int_vrui_Time)
;BT1b.c,15 :: 		while(int_vrui_Time--);
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
;BT1b.c,16 :: 		}
	RET
; end of _Fn_DELAY

_main:
	MOV SP+0, #128
;BT1b.c,18 :: 		void main() // tao chuong trinh chinh
;BT1b.c,22 :: 		while(1)
L_main2:
;BT1b.c,24 :: 		for(j = 0; j < 200; j++)
	MOV main_j_L0+0, #0
L_main4:
	CLR C
	MOV A, main_j_L0+0
	SUBB A, #200
	JNC L_main5
;BT1b.c,26 :: 		for(i = 0; i < 8; i++)
	MOV main_i_L0+0, #0
L_main7:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #8
	JNC L_main8
;BT1b.c,28 :: 		P3 = chuU[i];
	MOV A, main_i_L0+0
	ADD A, #_chuU+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_chuU+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV P3+0, 0
;BT1b.c,29 :: 		P2 = QuetU[i];
	MOV A, main_i_L0+0
	ADD A, #_QuetU+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_QuetU+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV P2+0, 0
;BT1b.c,30 :: 		Fn_DELAY(50);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #50
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT1b.c,31 :: 		P3 = 0X00;
	MOV P3+0, #0
;BT1b.c,32 :: 		Fn_DELAY(10);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #10
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT1b.c,26 :: 		for(i = 0; i < 8; i++)
	INC main_i_L0+0
;BT1b.c,33 :: 		}
	SJMP L_main7
L_main8:
;BT1b.c,24 :: 		for(j = 0; j < 200; j++)
	INC main_j_L0+0
;BT1b.c,34 :: 		}
	SJMP L_main4
L_main5:
;BT1b.c,35 :: 		for(j = 0; j < 200; j++)
	MOV main_j_L0+0, #0
L_main10:
	CLR C
	MOV A, main_j_L0+0
	SUBB A, #200
	JNC L_main11
;BT1b.c,37 :: 		for(i = 0; i < 8; i++)
	MOV main_i_L0+0, #0
L_main13:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #8
	JNC L_main14
;BT1b.c,39 :: 		P3 = chuO[i];
	MOV A, main_i_L0+0
	ADD A, #_chuO+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_chuO+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV P3+0, 0
;BT1b.c,40 :: 		P2 = QuetO[i];
	MOV A, main_i_L0+0
	ADD A, #_QuetO+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_QuetO+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV P2+0, 0
;BT1b.c,41 :: 		Fn_DELAY(50);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #50
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT1b.c,42 :: 		P3 = 0X00;
	MOV P3+0, #0
;BT1b.c,43 :: 		Fn_DELAY(10);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #10
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT1b.c,37 :: 		for(i = 0; i < 8; i++)
	INC main_i_L0+0
;BT1b.c,44 :: 		}
	SJMP L_main13
L_main14:
;BT1b.c,35 :: 		for(j = 0; j < 200; j++)
	INC main_j_L0+0
;BT1b.c,45 :: 		}
	SJMP L_main10
L_main11:
;BT1b.c,46 :: 		for(j = 0; j < 200; j++)
	MOV main_j_L0+0, #0
L_main16:
	CLR C
	MOV A, main_j_L0+0
	SUBB A, #200
	JNC L_main17
;BT1b.c,48 :: 		for(i = 0; i < 8; i++)
	MOV main_i_L0+0, #0
L_main19:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #8
	JNC L_main20
;BT1b.c,50 :: 		P3 = chuC[i];
	MOV A, main_i_L0+0
	ADD A, #_chuC+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_chuC+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV P3+0, 0
;BT1b.c,51 :: 		P2 = QuetC[i];
	MOV A, main_i_L0+0
	ADD A, #_QuetC+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_QuetC+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV P2+0, 0
;BT1b.c,52 :: 		Fn_DELAY(50);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #50
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT1b.c,53 :: 		P3 = 0X00;
	MOV P3+0, #0
;BT1b.c,54 :: 		Fn_DELAY(10);
	MOV FARG_Fn_DELAY_int_vrui_Time+0, #10
	MOV FARG_Fn_DELAY_int_vrui_Time+1, #0
	LCALL _Fn_DELAY+0
;BT1b.c,48 :: 		for(i = 0; i < 8; i++)
	INC main_i_L0+0
;BT1b.c,55 :: 		}
	SJMP L_main19
L_main20:
;BT1b.c,46 :: 		for(j = 0; j < 200; j++)
	INC main_j_L0+0
;BT1b.c,56 :: 		}
	SJMP L_main16
L_main17:
;BT1b.c,57 :: 		}
	LJMP L_main2
;BT1b.c,58 :: 		}
	SJMP #254
; end of _main
