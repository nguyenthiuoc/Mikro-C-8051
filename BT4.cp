#line 1 "D:/Mikro 8051/New folder/BT4.c"
char so[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
unsigned char nghin, tram, chuc, donVi;
int dem;
char i;






sbit led1 at P2.B0;
sbit led2 at P2.B1;
sbit led3 at P2.B2;
sbit led4 at P2.B3;


void delay_ms(unsigned int time) {
 unsigned int i, j;
 for (i = 0; i < time; i++)
 for (j = 0; j < 120; j++);
}

void main() {

 led1 =  1 ;
 led2 =  1 ;
 led3 =  1 ;
 led4 =  1 ;


 for (dem = 6789; dem >= 0; dem--) {

 nghin = dem / 1000;
 tram = (dem % 1000) / 100;
 chuc = (dem % 100) / 10;
 donVi = dem % 10;


 for (i = 0; i < 4; i++) {

 led1 =  0 ;
 P0 = so[nghin];
 delay_ms(5);
 led1 =  1 ;


 led2 =  0 ;
 P0 = so[tram];
 delay_ms(5);
 led2 =  1 ;


 led3 =  0 ;
 P0 = so[chuc];
 delay_ms(5);
 led3 =  1 ;


 led4 =  0 ;
 P0 = so[donVi];
 delay_ms(5);
 led4 =  1 ;
 }


 if (dem == 0) {
 break;
 }
 }


 while (1) {

 led1 =  1 ;
 led2 =  1 ;
 led3 =  1 ;
 led4 =  1 ;


 }
}
