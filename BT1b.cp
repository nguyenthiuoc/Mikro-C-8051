#line 1 "D:/Mikro 8051/New folder/BT1b.c"
unsigned char code chuB[]={ 0X7E, 0X66, 0X66, 0X7E, 0X66, 0X66, 0X7E, 0X00};
unsigned char code chuE[]={ 0X7E, 0X60, 0X60, 0X7E, 0X60, 0X60, 0X7E, 0X00};
unsigned char code chuN[]={ 0X83, 0XC3, 0XE3, 0XF3, 0XDB, 0XCF, 0XC7, 0XC3};

unsigned char code QuetB[]={0xFE,0xFD,0xFB,0xF7,0xEF,0xDF,0xBF,0x7F};
unsigned char code QuetE[]={0xFE,0xFD,0xFB,0xF7,0xEF,0xDF,0xBF,0x7F};
unsigned char code QuetN[]={0xFE,0xFD,0xFB,0xF7,0xEF,0xDF,0xBF,0x7F};

void Fn_DELAY (unsigned int_vrui_Time)
{
while(int_vrui_Time--);
}

void main()
{
 unsigned char i, j;

 while(1)
 {
 for(j = 0; j < 200; j++)
 {
 for(i = 0; i < 8; i++)
 {
 P3 = ChuB[i];
 P2 = QuetB[i];
 Fn_DELAY(50);
 P3 = 0X00;
 Fn_DELAY(10);
 }
 }
 for(j = 0; j < 200; j++)
 {
 for(i = 0; i < 8; i++)
 {
 P3 = ChuE[i];
 P2 = QuetE[i];
 Fn_DELAY(50);
 P3 = 0X00;
 Fn_DELAY(10);
 }
 }
 for(j = 0; j < 200; j++)
 {
 for(i = 0; i < 8; i++)
 {
 P3 = ChuN[i];
 P2 = QuetN[i];
 Fn_DELAY(50);
 P3 = 0X00;
 Fn_DELAY(10);
 }
 }
 }
 }