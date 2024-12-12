#line 1 "D:/Mikro 8051/New folder/BT5a.c"
sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;
sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;
sbit OW_Bit at P1_2_bit;
const unsigned short TEMP_RESOLUTION = 9;
char *text = ".0";
unsigned temp;
void Display_Temperature(unsigned int temp2write) {
const unsigned short RES_SHIFT = TEMP_RESOLUTION - 8;
char temp_whole;
unsigned int temp_fraction;
if (temp2write & 0x8000) {
text[0] = '-';
temp2write = ~temp2write + 1;
}
temp_whole = temp2write >> RES_SHIFT;
if (temp_whole/100)
text[0] = temp_whole/100 + 48;
else
text[0] = '0';
text[1] = (temp_whole/10)%10 + 48;
text[2] = temp_whole%10 + 48;
temp_fraction = temp2write << (4-RES_SHIFT);
temp_fraction &= 0x000F;
temp_fraction *= 625;
text[4] = temp_fraction/1000 + 48;
text[5] = (temp_fraction/100)%10 + 48;
text[6] = (temp_fraction/10)%10 + 48;
text[7] = temp_fraction%10 + 48;
Lcd_Out(2, 5, text);
}
void main() {
Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1, 1, " NHIET DO : ");
Lcd_Out(2, 1, " 26 do F");
delay_ms(2000);
Lcd_Chr(2,13,223);
Lcd_Chr(2,14,'F');
do {
Display_Temperature(temp);
P3=0XFF;
Delay_ms(500);
} while (1);
}
