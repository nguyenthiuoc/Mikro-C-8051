char so[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90}; // B?ng mã 0-9
unsigned char nghin, tram, chuc, donVi;
int dem;
char i;

// Ð?nh nghia tr?ng thái sáng/t?t
#define sang 0
#define tat 1

// Ð?nh nghia chân di?u khi?n LED
sbit led1 at P2.B0;
sbit led2 at P2.B1;
sbit led3 at P2.B2;
sbit led4 at P2.B3;

// Hàm t?o d? tr?
void delay_ms(unsigned int time) {
    unsigned int i, j;
    for (i = 0; i < time; i++)
        for (j = 0; j < 120; j++); // Ði?u ch?nh n?u t?n s? th?ch anh khác
}

void main() {
    // T?t t?t c? LED ban d?u
    led1 = tat;
    led2 = tat;
    led3 = tat;
    led4 = tat;

    // Ð?m ngu?c t? 6789 v? 0
    for (dem = 6789; dem >= 0; dem--) {
        // Phân tích s? hàng nghìn, tram, ch?c, don v?
        nghin = dem / 1000;
        tram = (dem % 1000) / 100;
        chuc = (dem % 100) / 10;
        donVi = dem % 10;

        // Quét t?ng LED 7 do?n
        for (i = 0; i < 4; i++) {
            // LED 1: Hi?n th? hàng nghìn
            led1 = sang;
            P0 = so[nghin];
            delay_ms(1000);
            led1 = tat;

            // LED 2: Hi?n th? hàng tram
            led2 = sang;
            P0 = so[tram];
            delay_ms(1000);
            led2 = tat;

            // LED 3: Hi?n th? hàng ch?c
            led3 = sang;
            P0 = so[chuc];
            delay_ms(1000);
            led3 = tat;

            // LED 4: Hi?n th? hàng don v?
            led4 = sang;
            P0 = so[donVi];
            delay_ms(1000);
            led4 = tat;
        }

        // Khi giá tr? là 0, thoát vòng l?p
        if (dem == 0) {
            break;
        }
    }

    // D?ng h?n chuong trình
    while (1) {
        // T?t t?t c? LED
        led1 = tat;
        led2 = tat;
        led3 = tat;
        led4 = tat;

        // Chuong trình d?ng t?i dây
    }
}