// B?ng m� LED 7 do?n cho c�c ch? s? t? 0 d?n 9
unsigned char so[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};

// Khai b�o c�c bi?n d? ph�n t�ch gi? v� ph�t
unsigned char gio, phut;
unsigned char chuc, dvi;
int i;

// �?nh nghia tr?ng th�i s�ng/t?t
#define sang 0
#define tat 1

// �?nh nghia c�c ch�n di?u khi?n LED 7 do?n (P2.0 d?n P2.3)
sbit led1 at P2.B0;  // LED 1 (H�ng gi?)
sbit led2 at P2.B1;  // LED 2 (�on v? gi?)
sbit led3 at P2.B2;  // LED 3 (H�ng ph�t)
sbit led4 at P2.B3;  // LED 4 (�on v? ph�t)

// Khai b�o c?ng LED 7 do?n (P0)
#define LED_PORT P0

// H�m t?o d? tr?
void delay(int time) {
    while(time--);  // �i?u ch?nh d? tr? theo y�u c?u
}

void main() {
    gio = 11;  // Gi? ban d?u
    phut = 0;  // Ph�t ban d?u

    // V�ng l?p ch�nh
    while(1) {
        // Hi?n th? gi? v� ph�t li�n t?c
        for(i = 0; i < 166; i++) {  // M?i gi�y du?c hi?n th? trong v�ng l?p n�y
            // Hi?n th? gi?
            chuc = gio / 10;       // H�ng ch?c c?a gi?
            dvi = gio % 10;        // �on v? c?a gi?
            LED_PORT = so[chuc];   // Hi?n th? h�ng ch?c gi?
            led1 = sang;           // B?t LED 1 (H�ng gi?)
            delay(1);              // �? tr?
            led1 = tat;            // T?t LED 1

            LED_PORT = so[dvi];    // Hi?n th? don v? gi?
            led2 = sang;           // B?t LED 2 (�on v? gi?)
            delay(1);              // �? tr?
            led2 = tat;            // T?t LED 2

            // Hi?n th? ph�t
            chuc = phut / 10;      // H�ng ch?c c?a ph�t
            dvi = phut % 10;       // �on v? c?a ph�t
            LED_PORT = so[chuc];   // Hi?n th? h�ng ch?c ph�t
            led3 = sang;           // B?t LED 3 (H�ng ph�t)
            delay(1);              // �? tr?
            led3 = tat;            // T?t LED 3

            LED_PORT = so[dvi];    // Hi?n th? don v? ph�t
            led4 = sang;           // B?t LED 4 (�on v? ph�t)
            delay(1);              // �? tr?
            led4 = tat;            // T?t LED 4
        }

        // C?p nh?t ph�t
        phut++;
        if(phut == 60) {  // Khi ph�t d?t 60, reset v� tang gi?
            phut = 0;
            gio++;
            if(gio == 24) {  // Khi gi? d?t 24, reset v? 0
                gio = 0;
            }
        }
    }
}
