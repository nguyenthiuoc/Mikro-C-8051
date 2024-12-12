unsigned short kp, cot=5, i,Dec,flag;
char bin[4];
char Hex1[6];
char Hex;
char keypadPort at P0;
sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;
sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;
void main() {
Keypad_Init(); // Initialize Keypad
Lcd_Init(); // Initialize LCD
Lcd_Cmd(_LCD_CLEAR); // Clear display
Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
Lcd_Out(1, 1, "Bin : "); // Write message text on LCD
Lcd_Out(2, 1, "Hex: ");
do {
kp = 0; // Reset key code variable
do
kp = Keypad_Key_Click(); // Store key code in kp variable
while (!kp);
switch (kp) {
       case 1:
            kp = 49;
            bin[i]=1;
            i++;
            break; // 1
       case 14:
            kp = 48;
            bin[i]=0;
            i++;
            ; break; // 0
       case 15:
            i=0;
            cot=8;
            break; // #
       case 16:
            Dec=bin[0]*8+bin[1]*4+bin[2]*2+bin[3]*1;
            flag=1;
            break; // D
       }
if(flag==1){
            switch (Dec) {
                   case 0:
                        Hex = 48;
                        break; // 0
                   case 1:
                        Hex = 49;
                        break; // 1
                   case 2:
                        Hex = 50;
                        break; // 2
                   case 3:
                        Hex = 51;
                        break; // 3
                   case 4:
                        Hex = 52;
                        break; // 4
                   case 5:
                        Hex = 53;
                        break; // 5
                   case 6:
                        Hex = 54;
                        break; // 6
                   case 7:
                        Hex = 55;
                        break; // 7
                   case 8:
                        Hex = 56;
                        break; // 8
                   case 9:
                        Hex = 57;
                        break; // 9
                   case 10:
                        Hex = 65;
                        break; // A
                   case 11:
                        Hex = 66;
                        break; // B
                   case 12:
                        Hex = 67;
                        break; // C
                   case 13:
                        Hex = 68;
                        break; // D
                   case 14:
                        Hex = 69;
                        break; // E
                   case 15:
                        Hex = 70;
                        break; // F
                   }
            }
Lcd_Chr(2, 7, Hex);
cot++;
Lcd_Chr(1, cot, kp);
} while (1);
}
