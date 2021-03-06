# include <stdio.h>
# include <stdint.h>
# include "altera_avalon_pio_regs.h"
# include "system.h"
# include "sys/alt_stdio.h"
# include "alt_types.h"
# include "altera_avalon_uart.h"
# include <string.h>
#include <math.h>

uint32_t isKthBitSet(int n, int k)
{
    if (n & (1 << (k - 1)))
        return 1;
    else
        return 0;
}



int main()
{

	alt_u32 *pBuf;
	alt_u32 lenght = 60000000;
	pBuf = (alt_u32 *)MEM_IF_LPDDR2_EMIF_0_BASE;
	pBuf = malloc(lenght * sizeof(alt_u32));
	if(!pBuf)
	{
		printf("Malloc fail\r\n");
		return 0;
	}

	altera_avalon_uart_state* sp_UART_0;
	sp_UART_0->base = UART_0_BASE;


	char rx_buffer[8] = "";
	int mem_count = 0;
	int data_0 = 0;
	int data_1 = 0;
	int data_2 = 0;
	int data_3 = 0;
	int i = 0;
	int number = 0;
	int number_rec = 0;
	int number_old = 0;

//Putting defualt filter values
	IOWR_8DIRECT(0x10011000, 3, 0);
	IOWR_8DIRECT(0x10011000, 3, 0);
	IOWR_8DIRECT(0x10011000, 3, 0);
	IOWR_8DIRECT(0x10011000, 3, 0);
	IOWR_8DIRECT(0x10011000, 3, 1);
	IOWR_8DIRECT(0x10011000, 3, 0);
	IOWR_8DIRECT(0x10011000, 3, 0);
	IOWR_8DIRECT(0x10011000, 3, 0);
	IOWR_8DIRECT(0x10011000, 3, 0);





	printf("Hello from Emils Kursa Darbs!\n");
	printf("Switch 1 : Send picture to fpga\n");
	printf("Switch 2 : Send filter to fpga\n");
	printf("Switch 3 : Send 0 to 7 picture to screen\n");
	printf("Switch 4 : Send 8 to 15 picture to screen\n");
	printf("Switch 5 : Send 16 to 23 picture to screen\n");
	printf("Switch 6 : Clear screen\n");
	printf("Switch 7 : Send original picture to screen\n");
	usleep(100000);
	while(1)
	{

		number_rec = IORD_ALTERA_AVALON_PIO_DATA(SW_PIO_BASE);
		IOWR_ALTERA_AVALON_PIO_DATA(LED_PIO_BASE, number_rec);
		if (number_rec == number_old)
		{
			number = 0;
		} else {
			number = number_rec;
		}
		number_old = number_rec;
		if(isKthBitSet(number,1))
		{
			mem_count = 0;
			printf("Puting zeros at the start of memory\n");
			for(i = 0;i < 1280;i++)
			{
				pBuf[mem_count] = 0;
				mem_count = mem_count+1;
			}


			printf("Waiting for UART data\n");
			for(i = 0;i < 307200;i++)
			{

				altera_avalon_uart_read(sp_UART_0, rx_buffer, sizeof(rx_buffer),0);

				pBuf[mem_count] = (int)rx_buffer[0] - 48;
				mem_count = mem_count+1;

			}

			printf("Done reciving Uart data\n");
			printf("Puting zeros at the end of memory\n");
			for(i = 0;i < 1280;i++)
			{
				pBuf[mem_count] = 0;
				mem_count = mem_count+1;
			}
		}

		if(isKthBitSet(number,2))
		{
			printf("New Filter start\n");
			printf("Waiting for 9 values from uart\n");
			for(i = 0;i < 10;i++)
			{

				altera_avalon_uart_read(sp_UART_0, rx_buffer, sizeof(rx_buffer),0);

				temp  = (int)rx_buffer[0] - 48;
				IOWR_8DIRECT(0x10011000, 3, temp);
			}
			printf("Recived 9 values\n");
			printf("New filter end\n");
		}

		if(isKthBitSet(number,3))
		{
			printf("Sending 0 to 7 picture to screen\n");
			IOWR_ALTERA_AVALON_PIO_DATA(RESET_CNT_BASE,0);
			usleep(100000);
			IOWR_ALTERA_AVALON_PIO_DATA(RESET_CNT_BASE,1);

			IOWR_ALTERA_AVALON_PIO_DATA(START_BIT_BASE,1);

			for(i = 0;i < 307200;i++)
			{
				IOWR_8DIRECT(0x10011000, 0, pBuf[i]);
				IOWR_8DIRECT(0x10011000, 1, pBuf[i+640]);
				IOWR_8DIRECT(0x10011000, 2, pBuf[i+1280]);
				data_2 = IORD_8DIRECT(0x10011000,4);


				IOWR_ALTERA_AVALON_PIO_DATA(WRITE_EN_BASE, 1);
				IOWR_ALTERA_AVALON_PIO_DATA(DATA_OUT_BASE, data_2);
				usleep(1);
				IOWR_ALTERA_AVALON_PIO_DATA(WRITE_EN_BASE, 0);

			}
			IOWR_ALTERA_AVALON_PIO_DATA(START_BIT_BASE,0);
			printf("Done sending picture\n");
		}

		if(isKthBitSet(number,4))
		{
			printf("Sending 8 to 15 picture to screen\n");
			IOWR_ALTERA_AVALON_PIO_DATA(RESET_CNT_BASE,0);
			usleep(100000);
			IOWR_ALTERA_AVALON_PIO_DATA(RESET_CNT_BASE,1);

			IOWR_ALTERA_AVALON_PIO_DATA(START_BIT_BASE,1);

			for(i = 0;i < 307200;i++)
			{
				IOWR_8DIRECT(0x10011000, 0, pBuf[i]);
				IOWR_8DIRECT(0x10011000, 1, pBuf[i+640]);
				IOWR_8DIRECT(0x10011000, 2, pBuf[i+1280]);
				data_1 = IORD_8DIRECT(0x10011000,5);


				IOWR_ALTERA_AVALON_PIO_DATA(WRITE_EN_BASE, 1);
				IOWR_ALTERA_AVALON_PIO_DATA(DATA_OUT_BASE, data_1);
				usleep(1);
				IOWR_ALTERA_AVALON_PIO_DATA(WRITE_EN_BASE, 0);

			}
			IOWR_ALTERA_AVALON_PIO_DATA(START_BIT_BASE,0);
			printf("Done sending picture\n");
		}
		if(isKthBitSet(number,5))
				{
					printf("Sending 16 to 23 picture to screen\n");
					IOWR_ALTERA_AVALON_PIO_DATA(RESET_CNT_BASE,0);
					usleep(100000);
					IOWR_ALTERA_AVALON_PIO_DATA(RESET_CNT_BASE,1);

					IOWR_ALTERA_AVALON_PIO_DATA(START_BIT_BASE,1);

					for(i = 0;i < 307200;i++)
					{
						IOWR_8DIRECT(0x10011000, 0, pBuf[i]);
						IOWR_8DIRECT(0x10011000, 1, pBuf[i+640]);
						IOWR_8DIRECT(0x10011000, 2, pBuf[i+1280]);
						data_2 = IORD_8DIRECT(0x10011000,6);


						IOWR_ALTERA_AVALON_PIO_DATA(WRITE_EN_BASE, 1);
						IOWR_ALTERA_AVALON_PIO_DATA(DATA_OUT_BASE, data_2);
						usleep(1);
						IOWR_ALTERA_AVALON_PIO_DATA(WRITE_EN_BASE, 0);

					}
					IOWR_ALTERA_AVALON_PIO_DATA(START_BIT_BASE,0);
					printf("Done sending picture\n");
				}

		if(isKthBitSet(number,6))
		{
			printf("clearing display\n");
			IOWR_ALTERA_AVALON_PIO_DATA(RESET_CNT_BASE,0);
			usleep(100000);
			IOWR_ALTERA_AVALON_PIO_DATA(RESET_CNT_BASE,1);

			IOWR_ALTERA_AVALON_PIO_DATA(START_BIT_BASE,1);

			for(i = 0;i < 307200;i++)
			{


				IOWR_ALTERA_AVALON_PIO_DATA(WRITE_EN_BASE, 1);
				IOWR_ALTERA_AVALON_PIO_DATA(DATA_OUT_BASE, 0);
				usleep(1);
				IOWR_ALTERA_AVALON_PIO_DATA(WRITE_EN_BASE, 0);

			}
			IOWR_ALTERA_AVALON_PIO_DATA(START_BIT_BASE,0);
			printf("Done clearing display\n");
		}
		if(isKthBitSet(number,7))
		{
			printf("Original Picture\n");
			IOWR_ALTERA_AVALON_PIO_DATA(RESET_CNT_BASE,0);
			usleep(100000);
			IOWR_ALTERA_AVALON_PIO_DATA(RESET_CNT_BASE,1);

			IOWR_ALTERA_AVALON_PIO_DATA(START_BIT_BASE,1);

			for(i = 0;i < 307200;i++)
			{


				IOWR_ALTERA_AVALON_PIO_DATA(WRITE_EN_BASE, 1);
				IOWR_ALTERA_AVALON_PIO_DATA(DATA_OUT_BASE, pBuf[i+1280]);
				usleep(1);
				IOWR_ALTERA_AVALON_PIO_DATA(WRITE_EN_BASE, 0);

			}
			IOWR_ALTERA_AVALON_PIO_DATA(START_BIT_BASE,0);
			printf("Done sending original picture\n");
		}


	}


  return 0;
}
