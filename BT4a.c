// B?ng mã LED 7 do?n cho các ch? s? t? 0 d?n 9
unsigned char so[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};

// Khai báo các bi?n d? phân tích gi? và phút
unsigned char gio, phut;
unsigned char chuc, dvi;
int i;

// Ð?nh nghia tr?ng thái sáng/t?t
#define sang 0
#define tat 1

// Ð?nh nghia các chân di?u khi?n LED 7 do?n (P2.0 d?n P2.3)
sbit led1 at P2.B0;  // LED 1 (Hàng gi?)
sbit led2 at P2.B1;  // LED 2 (Ðon v? gi?)
sbit led3 at P2.B2;  // LED 3 (Hàng phút)
sbit led4 at P2.B3;  // LED 4 (Ðon v? phút)

// Khai báo c?ng LED 7 do?n (P0)
#define LED_PORT P0

// Hàm t?o d? tr?
void delay(int time) {
    while(time--);  // Ði?u ch?nh d? tr? theo yêu c?u
}

void main() {
    gio = 11;  // Gi? ban d?u
    phut = 0;  // Phút ban d?u

    // Vòng l?p chính
    while(1) {
        // Hi?n th? gi? và phút liên t?c
        for(i = 0; i < 166; i++) {  // M?i giây du?c hi?n th? trong vòng l?p này
            // Hi?n th? gi?
            chuc = gio / 10;       // Hàng ch?c c?a gi?
            dvi = gio % 10;        // Ðon v? c?a gi?
            LED_PORT = so[chuc];   // Hi?n th? hàng ch?c gi?
            led1 = sang;           // B?t LED 1 (Hàng gi?)
            delay(1);              // Ð? tr?
            led1 = tat;            // T?t LED 1

            LED_PORT = so[dvi];    // Hi?n th? don v? gi?
            led2 = sang;           // B?t LED 2 (Ðon v? gi?)
            delay(1);              // Ð? tr?
            led2 = tat;            // T?t LED 2

            // Hi?n th? phút
            chuc = phut / 10;      // Hàng ch?c c?a phút
            dvi = phut % 10;       // Ðon v? c?a phút
            LED_PORT = so[chuc];   // Hi?n th? hàng ch?c phút
            led3 = sang;           // B?t LED 3 (Hàng phút)
            delay(1);              // Ð? tr?
            led3 = tat;            // T?t LED 3

            LED_PORT = so[dvi];    // Hi?n th? don v? phút
            led4 = sang;           // B?t LED 4 (Ðon v? phút)
            delay(1);              // Ð? tr?
            led4 = tat;            // T?t LED 4
        }

        // C?p nh?t phút
        phut++;
        if(phut == 60) {  // Khi phút d?t 60, reset và tang gi?
            phut = 0;
            gio++;
            if(gio == 24) {  // Khi gi? d?t 24, reset v? 0
                gio = 0;
            }
        }
    }
}
