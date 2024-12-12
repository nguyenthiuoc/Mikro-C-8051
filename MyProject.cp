#line 1 "D:/Mikro 8051/New folder/MyProject.c"




void main() {
do {
P0 = 0x00;
P1 = 0x00;
P2 = 0x00;
P3 = 0x00;




Delay_ms(100);
P0 = 0xFF;
P1 = 0xFF;
P2 = 0xFF;
P3 = 0xFF;




Delay_ms(100);
} while(1);

}
