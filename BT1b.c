unsigned char code chuU[] = {0xC3, 0xC3, 0xC3, 0xC3, 0xC3, 0xC3, 0x7E, 0x00};

unsigned char code chuO[] = {0x3C, 0x66, 0xC3, 0xC3, 0xC3, 0x66, 0x3C, 0x00};

unsigned char code chuC[] = {0x3E, 0x60, 0xC0, 0xC0, 0xC0, 0x60, 0x3E, 0x00};


unsigned char code QuetU[]={0xFE,0xFD,0xFB,0xF7,0xEF,0xDF,0xBF,0x7F};
unsigned char code QuetO[]={0xFE,0xFD,0xFB,0xF7,0xEF,0xDF,0xBF,0x7F};
unsigned char code QuetC[]={0xFE,0xFD,0xFB,0xF7,0xEF,0xDF,0xBF,0x7F};

/* Ham Delay */
void Fn_DELAY (unsigned int int_vrui_Time)
{
    while(int_vrui_Time--);
}

void main() // tao chuong trinh chinh
{
    unsigned char i, j;

    while(1)
    {
        for(j = 0; j < 200; j++)
        {
            for(i = 0; i < 8; i++)
            {
                P3 = chuU[i];
                P2 = QuetU[i];
                Fn_DELAY(50);
                P3 = 0X00;
                Fn_DELAY(10);
            }
        }
        for(j = 0; j < 200; j++)
        {
            for(i = 0; i < 8; i++)
            {
                P3 = chuO[i];
                P2 = QuetO[i];
                Fn_DELAY(50);
                P3 = 0X00;
                Fn_DELAY(10);
            }
        }
        for(j = 0; j < 200; j++)
        {
            for(i = 0; i < 8; i++)
            {
                P3 = chuC[i];
                P2 = QuetC[i];
                Fn_DELAY(50);
                P3 = 0X00;
                Fn_DELAY(10);
            }
        }
    }
}