Description of webserver example for:
FREERTOS + LWIP using Stellaris LM3S6965.

The project create 4 tasks as follow.

1 -	xTaskCreate( lcd,"lcd", 1000, NULL, 3, NULL);
It writes to lcd into LM3S6965 evb kit.

2 -	xTaskCreate( uart0Thread,"uart0", 1000, NULL, 3, NULL);
It writes a test message using uart0.

3 -	xTaskCreate( uart1Thread,"uart1", 1000, NULL, 3, NULL);
It writes a test message using uart1.

4 -	xTaskCreate( ethernetThread,"ethernet", 1000, NULL, 3, NULL);
It Initialise ethernet driver and configure ip,mask and gateway statically.


When cpu comes on, you can see debug messages from lwip into terminal attached to serial 1 of cpu.
This code has static configuration of IP,MASK and GW address, as follow:
IP = 192.168.0.100
Mask= 255.255.255.0
GW = 192.168.0.1

It prints the below messages into lcd.

	RIT128x96x4StringDraw("FreeRTOS-5.1.1ok  ", 0, LINHA0, 15);
	RIT128x96x4StringDraw("LWIP comp00  1.3.0", 0, LINHA1, 15);
	RIT128x96x4StringDraw("Lwip Source from Wella   ", 0, LINHA2, 15);

If you have an evb board for LM3S6965 it can write the main.bin and see the results,
if not you can compile it with make in the directory: FreeRtosLwipExemplo1/Demo/apps/RTOSDemo


enjoy it.
