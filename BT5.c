sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;
sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;

sbit OW_Bit at P1_2_bit; // Chân k?t n?i DQ c?a DS18S20
sbit OW_Direction at P1_2_Direction; // Ð?t chân d? li?u DQ

char text[16]; // Chu?i d? hi?n th? nhi?t d?
unsigned int temp; // Bi?n luu nhi?t d? d?c du?c

// Hàm hi?n th? nhi?t d? lên LCD
void Display_Temperature(unsigned int temp2write) {
    char temp_whole;
    char temp_fraction;

    if (temp2write & 0x8000) { // Ki?m tra s? âm
        text[0] = '-';
        temp2write = ~temp2write + 1;
    } else {
        text[0] = ' ';
    }

    temp_whole = temp2write >> 1;           // L?y ph?n nguyên (9-bit, d?ch ph?i 1)
    temp_fraction = (temp2write & 0x01) * 5; // L?y ph?n th?p phân: 0.5°C n?u bit th?p = 1

    text[1] = (temp_whole / 10) + '0'; // Hàng ch?c
    text[2] = (temp_whole % 10) + '0'; // Hàng don v?
    text[3] = '.';                     // D?u ch?m
    text[4] = temp_fraction + '0';     // Ph?n th?p phân
    text[5] = 223;                     // Ký hi?u d? (°)
    text[6] = 'C';                     // Ðon v? Celsius
    text[7] = '\0';                    // K?t thúc chu?i

    Lcd_Out(2, 1, text);               // Hi?n th? chu?i lên LCD
}

// Hàm d?c nhi?t d? t? DS18S20
unsigned int Read_DS18S20() {
    unsigned int temp;

    Ow_Reset(&OW_Bit);                 // Reset DS18S20
    Ow_Write(&OW_Bit, 0xCC);           // Skip ROM
    Ow_Write(&OW_Bit, 0x44);           // Start temperature conversion
    Delay_ms(750);                     // Ð?i chuy?n d?i

    Ow_Reset(&OW_Bit);                 // Reset DS18S20
    Ow_Write(&OW_Bit, 0xCC);           // Skip ROM
    Ow_Write(&OW_Bit, 0xBE);           // Read Scratchpad

    temp = Ow_Read(&OW_Bit);           // Byte th?p
    temp |= Ow_Read(&OW_Bit) << 8;     // Byte cao
    return temp;
}

// Hàm chính
void main() {
    Lcd_Init();                        // Kh?i t?o LCD
    Lcd_Cmd(_LCD_CLEAR);               // Xóa LCD
    Lcd_Cmd(_LCD_CURSOR_OFF);          // T?t con tr?
    Lcd_Out(1, 1, "NHIET DO:");        // Hi?n th? tiêu d?

    while (1) {
        temp = Read_DS18S20();         // Ð?c nhi?t d? t? DS18S20
        Display_Temperature(temp);     // Hi?n th? nhi?t d? lên LCD
        Delay_ms(500);                 // Delay ng?n
    }
}
