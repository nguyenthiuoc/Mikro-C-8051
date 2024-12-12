#line 1 "D:/Mikro 8051/New folder/BT4a.c"

unsigned char so[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};


unsigned char gio, phut;
unsigned char chuc, dvi;
int i;






sbit led1 at P2.B0;
sbit led2 at P2.B1;
sbit led3 at P2.B2;
sbit led4 at P2.B3;





void delay(int time) {
 while(time--);
}

void main() {
 gio = 11;
 phut = 0;


 while(1) {

 for(i = 0; i < 166; i++) {

 chuc = gio / 10;
 dvi = gio % 10;
  P0  = so[chuc];
 led1 =  0 ;
 delay(1);
 led1 =  1 ;

  P0  = so[dvi];
 led2 =  0 ;
 delay(1);
 led2 =  1 ;


 chuc = phut / 10;
 dvi = phut % 10;
  P0  = so[chuc];
 led3 =  0 ;
 delay(1);
 led3 =  1 ;

  P0  = so[dvi];
 led4 =  0 ;
 delay(1);
 led4 =  1 ;
 }


 phut++;
 if(phut == 60) {
 phut = 0;
 gio++;
 if(gio == 24) {
 gio = 0;
 }
 }
 }
}
