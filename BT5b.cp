#line 1 "D:/Mikro 8051/New folder/BT5b.c"




sbit DS18B20_PIN= P1^0;
unsigned char code7seg[10]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
unsigned char int_part, decimal_part;
unsigned char chuc,Dv;
void Delay_ms(long time)
{
 time=time*25;
 while(time--){;}
}
void T0_Delay_us(unsigned int t)
{
 unsigned int load_value;
 load_value=65536-t;
 TH0=load_value>>8;
 TL0=load_value&0x00FF;
 TR0=1;
 while(!TF0);
 TR0=0;
 TF0=0;
}
unsigned char DS18B20_Reset()
{
 unsigned char result;
 DS18B20_PIN=0;
 T0_Delay_us(480);
 DS18B20_PIN=1;
 T0_Delay_us(70);
 result=DS18B20_PIN;
 T0_Delay_us(410);
 return result;
}
void DS18B20_Write1()
{
 DS18B20_PIN=0;
 T0_Delay_us(6);

 DS18B20_PIN=1;
 T0_Delay_us(64);
}
void DS18B20_Write0()
{
 DS18B20_PIN=0;
 T0_Delay_us(60);
 DS18B20_PIN=1;
 T0_Delay_us(10);
}

void DS18B20_Write_Bit(unsigned char b)
{
 if(b==1)
 {
 DS18B20_Write1();
 }
 else
 {
 DS18B20_Write0();
 }
}
unsigned char DS18B20_Read_Bit()
{
 unsigned char result;
 DS18B20_PIN=0;
 T0_Delay_us(6);

 DS18B20_PIN=1;
 T0_Delay_us(9);
 result= DS18B20_PIN;
 T0_Delay_us(55);
 return result;
}
void DS18B20_Write_Byte(unsigned char b)
{
 unsigned char i =8;

 while(i--)
 {
 DS18B20_Write_Bit(b & 0x01);
 b>>=1;
 }
}
unsigned DS18B20_Read_Byte()
{
 unsigned char i =8, result=0;
 while(i--)
 {
 result >>=1;
 result|= (DS18B20_Read_Bit()<<7);
 }
 return result;
}
void main()
{
 unsigned int temp;
 TMOD|= 0x01;

 while(1)
 {
 while (DS18B20_Reset());
 DS18B20_Write_Byte( 0xCC );
 DS18B20_Write_Byte( 0x44 );
 Delay_ms(750);
 while(DS18B20_Reset());
 DS18B20_Write_Byte( 0xCC );
 DS18B20_Write_Byte( 0xBE );
 temp= DS18B20_Read_Byte();
 temp= (DS18B20_Read_Byte()<<8)|temp;
 int_part=temp>>4;
 chuc= int_part/10;
 Dv= int_part%10;
 decimal_part=temp&0x000F;
 decimal_part=decimal_part*10/16;
 P0=code7seg[chuc];
 P2=code7seg[Dv];
 P3=code7seg[decimal_part];
 }
}
