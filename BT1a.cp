#line 1 "D:/Mikro 8051/New folder/BT1a.c"
void main() {
 unsigned char i;

 P0 = 0xFF;
 P1 = 0xFF;
 P2 = 0xFF;
 P3 = 0xFF;

 while (1) {
 for (i = 0; i < 9; i++) {
 P0 = ~(1 << i);
 Delay_ms(200);
 }

 for (i = 0; i < 9; i++) {
 P1 = ~(1 << i);
 Delay_ms(200);
 }

 for (i = 0; i < 9; i++) {
 P2 = ~(1 << i);
 Delay_ms(200);
 }

 for (i = 0; i < 9; i++) {
 P3 = ~(1 << i);
 Delay_ms(200);
 }
 }
}
