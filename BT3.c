// Design by : Template code
// Version   : 1.0
// Date      : 1/3/2023
// Description: Interface a 4x4 keypad with an LCD

unsigned short kp, cnt, oldstate = 0;
char txt[6];

// Keypad module connections
char keypadPort at P0;
// End Keypad module connections

// LCD module connections
sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;

sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;
// End LCD module connections

void main() {
  cnt = 0;                                 // Reset counter
  Keypad_Init();                           // Initialize Keypad
  Lcd_Init();                              // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);                     // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off

  Lcd_Out(1, 1, "Key  :");                 // Write message text on LCD
  Lcd_Out(2, 1, "Times:");

  do {
    kp = 0;                                // Reset key code variable

    // Wait for key to be pressed and released
    do {
      kp = Keypad_Key_Click();             // Get key click from the keypad
    } while (!kp);                         // Continue loop until a key is pressed

    // Convert keypad code to its ASCII value
    switch (kp) {
      case  1: kp = '1'; break;
      case  2: kp = '2'; break;
      case  3: kp = '3'; break;
      case  4: kp = 'A'; break;
      case  5: kp = '4'; break;
      case  6: kp = '5'; break;
      case  7: kp = '6'; break;
      case  8: kp = 'B'; break;
      case  9: kp = '7'; break;
      case 10: kp = '8'; break;
      case 11: kp = '9'; break;
      case 12: kp = 'C'; break;
      case 13: kp = '*'; break;
      case 14: kp = '0'; break;
      case 15: kp = '#'; break;
      case 16: kp = 'D'; break;
    }

    // Check if the current key is different from the previous one
    if (kp != oldstate) {
      cnt = 1;                              // Reset counter
      oldstate = kp;                        // Update previous state
    } else {
      cnt++;                                // Increment counter for the same key
    }

    // Display the key on LCD at position (1,10)
    Lcd_Chr(1, 10, kp);

    // Reset counter display if it reaches 255
    if (cnt == 255) {
      cnt = 0;
      Lcd_Out(2, 10, "   ");               // Clear previous counter display
    }

    // Convert counter value to string and display on LCD
    WordToStr(cnt, txt);
    Lcd_Out(2, 10, txt);

  } while (1);                              // Infinite loop
}
