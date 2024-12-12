#line 1 "D:/Mikro 8051/New folder/BT3.c"





unsigned short kp, cnt, oldstate = 0;
char txt[6];


char keypadPort at P0;



sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;

sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;


void main() {
 cnt = 0;
 Keypad_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1, 1, "Key  :");
 Lcd_Out(2, 1, "Times:");

 do {
 kp = 0;


 do {
 kp = Keypad_Key_Click();
 } while (!kp);


 switch (kp) {
 case 1: kp = '1'; break;
 case 2: kp = '2'; break;
 case 3: kp = '3'; break;
 case 4: kp = 'A'; break;
 case 5: kp = '4'; break;
 case 6: kp = '5'; break;
 case 7: kp = '6'; break;
 case 8: kp = 'B'; break;
 case 9: kp = '7'; break;
 case 10: kp = '8'; break;
 case 11: kp = '9'; break;
 case 12: kp = 'C'; break;
 case 13: kp = '*'; break;
 case 14: kp = '0'; break;
 case 15: kp = '#'; break;
 case 16: kp = 'D'; break;
 }


 if (kp != oldstate) {
 cnt = 1;
 oldstate = kp;
 } else {
 cnt++;
 }


 Lcd_Chr(1, 10, kp);


 if (cnt == 255) {
 cnt = 0;
 Lcd_Out(2, 10, "   ");
 }


 WordToStr(cnt, txt);
 Lcd_Out(2, 10, txt);

 } while (1);
}
