
_main:
	MOV SP+0, #128
;MyProject.c,5 :: 		void main() {
;MyProject.c,6 :: 		do {
L_main0:
;MyProject.c,7 :: 		P0 = 0x00;
	MOV P0+0, #0
;MyProject.c,8 :: 		P1 = 0x00;
	MOV P1+0, #0
;MyProject.c,9 :: 		P2 = 0x00;
	MOV P2+0, #0
;MyProject.c,10 :: 		P3 = 0x00;
	MOV P3+0, #0
;MyProject.c,15 :: 		Delay_ms(100);   // 1 second delay
	MOV R6, 163
	MOV R7, 30
	DJNZ R7, 
	DJNZ R6, 
	NOP
;MyProject.c,16 :: 		P0 = 0xFF;
	MOV P0+0, #255
;MyProject.c,17 :: 		P1 = 0xFF;
	MOV P1+0, #255
;MyProject.c,18 :: 		P2 = 0xFF;
	MOV P2+0, #255
;MyProject.c,19 :: 		P3 = 0xFF;
	MOV P3+0, #255
;MyProject.c,24 :: 		Delay_ms(100);   // 1 second delay
	MOV R6, 163
	MOV R7, 30
	DJNZ R7, 
	DJNZ R6, 
	NOP
;MyProject.c,25 :: 		} while(1);
	SJMP L_main0
;MyProject.c,27 :: 		}
	SJMP #254
; end of _main
