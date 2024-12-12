//design by : Template code
// version: 1.0
//date: 01/03/2023
//description: ON/OFF led
void main() {
do {
P0 = 0x00;
P1 = 0x00;
P2 = 0x00;
P3 = 0x00;
// Turn ON diodes on PORT0
// Turn ON diodes on PORT1
// Turn ON diodes on PORT2
// Turn ON diodes on PORT3
Delay_ms(100);   // 1 second delay
P0 = 0xFF;
P1 = 0xFF;
P2 = 0xFF;
P3 = 0xFF;
// Turn OFF diodes on PORT0
// Turn OFF diodes on PORT1
// Turn OFF diodes on PORT2
// Turn OFF diodes on PORT3
Delay_ms(100);   // 1 second delay
} while(1);
// Endless loop
}