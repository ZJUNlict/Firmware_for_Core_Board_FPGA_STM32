#include "Init.h"
#include "fsmc.h"
uint8_t tmp_buf[32]={0};
//u8 tmp_buf_tx[27] = {0x40,0x12,0x34,0x30,0x08,0x00,0x02,0x40,0x00,0x08,0x02,0x60,0x00,0x08,0x00,0x50,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x32,0x32,0x32};
//u8 tmp_buf_tx_1[27] = {0x40,0x12,0x34,0x30,0x50,0x00,0x02,0x40,0x00,0x08,0x02,0x60,0x00,0x08,0x00,0x50,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x32,0x32,0x32};
//u8 tmp_buf_tx_2[27] = {0x40,0x12,0x34,0x30,0x00,0x00,0x00,0x40,0x00,0x08,0x02,0x60,0x00,0x08,0x00,0x50,0x00,0x08,0x00,0x00,0x00,0x00,0x00,0x00,0x32,0x32,0x32};
//uint8_t g_RF24L01RxBuffer[ 32 ] = { 0 }; 
//extern robot_t g_robot;




int main(void)
{ 
	//uint32_t temp;
	//uint8_t i = 0;
	//Init_all();
	//SPI_Master_Init();
	//经测试，通过IRQ引脚的低电平中断来接收数据包的丢包率大大降低
	
		delay_init(168);
//	int i;
		LED_Init();

    //初始化外部SRAM  
		
    FSMC_SRAM_Init();
		LED0 =1;
		delay_ms(2000);


	while(1)
	/*指针方式访问SRAM*/
	{	
		delay_ms(16);
		//LED0 = ~LED0;
	  *( uint16_t*) (Bank1_SRAM4_ADDR +0) = (int16_t)5;//1号电机
		delay_ms(1);
		*( uint16_t*) (Bank1_SRAM4_ADDR +2) = (int16_t)(-5);//2
		delay_ms(1);
		*( uint16_t*) (Bank1_SRAM4_ADDR +4) = (int16_t)(-5);//3
		delay_ms(1);
    *( uint16_t*) (Bank1_SRAM4_ADDR +6) = (int16_t)5;//4

	 }
	
   


	

	
}

/*
  //电机和spi总线的测试程序
	delay_init(168);
	uart_init(9600);
	LED_Init();
	SPI_Master_Init();
	while(1)
	{
		LED0=!LED0;
		LED1=!LED1;
		SPI_Master_ReadWrite_Byte(0x05,0x00);
		SPI_Master_ReadWrite_Byte(0x05,0x01);
		SPI_Master_ReadWrite_Byte(0x05,0x02);
		SPI_Master_ReadWrite_Byte(0x05,0x03);
		SPI_Master_ReadWrite_Byte(0x05,0x04);
		delay_ms(1000);
	}
*/

/*
	//24L01测试程序
	if(NRF24L01_TxPacket_2( (uint8_t *)tmp_buf_tx_1, 27 )==TX_OK)
	{
		LED0 = 0;
		delay_ms(2000);
	}
	if(NRF24L01_TxPacket_2( (uint8_t *)tmp_buf_tx_2, 27 )==TX_OK)
	{
		LED0 = 1;
		delay_ms(1000);
	}
	while(1)	
	{
		i = NRF24L01_RxPacket( tmp_buf );
		if( 27 == i )
		{
			LED1 = ~LED1;
			do_comm();
		}
	}

	while( 1 )
	{
		if(NRF24L01_TxPacket( (uint8_t *)tmp_buf_tx, 27 )==TX_OK)
			LED1 = ~LED1;
		delay_ms(5000);
	}
	LED1 = 0;	
	LED0 = 0;
	while(1)	
	{
		if(NRF24L01_TxPacket_2( (uint8_t *)tmp_buf_tx, 27 )==TX_OK)
			LED0=!LED0;
//		delay_ms(15);
//		if(NRF24L01_RxPacket(tmp_buf) == 27)
//		{
//				LED1 = ~LED1;
//				do_comm();
//		}
		delay_ms(1000);
	}
*/
