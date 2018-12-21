#include "spi.h"

extern robot_t g_robot;
void SPI_Master_Init(void)
{	
	GPIO_InitTypeDef GPIO_InitStructure;
	
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA,ENABLE);	
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE,ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF,ENABLE);
	
	GPIO_InitStructure.GPIO_Pin=SPI_SCK_PIN_;				
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;	
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_2MHz;		
	GPIO_Init(SPI_SCK_GPIO_PORT_,&GPIO_InitStructure);				

	GPIO_InitStructure.GPIO_Pin=SPI_MOSI_PIN_;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;	
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_2MHz;		
	GPIO_Init(SPI_MOSI_GPIO_PORT_,&GPIO_InitStructure);	
	
	GPIO_InitStructure.GPIO_Pin=SPI_MOSI_PIN_2_;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;	
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_2MHz;		
	GPIO_Init(SPI_MOSI_GPIO_PORT_2_,&GPIO_InitStructure);	
	
	GPIO_InitStructure.GPIO_Pin=SPI_CS_PIN_;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;	
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_2MHz;		
	GPIO_Init(SPI_CS_GPIO_PORT_,&GPIO_InitStructure);	
	
	GPIO_InitStructure.GPIO_Pin=SPI_MISO_PIN_;				
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_IN;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_DOWN;		
	GPIO_Init(SPI_MISO_GPIO_PORT_,&GPIO_InitStructure);		
	GPIO_ResetBits(SPI_MISO_GPIO_PORT_,SPI_MISO_PIN_);

}

//软件spi总线时序模拟
uint8_t SPI_Master_ReadWrite_Byte(char data_out,char data_addr)
{
	uint8_t data_in = 0;
	//uint8_t data_out = 0x0A;
	//uint8_t data_out_2 = 0x01;
	uint8_t cnt = 0;
	
	CS_L;
	delay_us(1);
		for(cnt = 0;cnt < 8;cnt++)
		{
		SCK_H;
		if(data_out&0x80)
			MOSI_H;
		else
			MOSI_L;
		if(data_addr & 0x80)
			MOSI_H_2;
		else 
			MOSI_L_2;
		data_out<<=1;
		data_addr<<=1;
		delay_us(1);
		SCK_L;//CPHA = 1
		delay_us(1);
		data_in<<=1;
		data_in+=MISO_IN;
		delay_us(1);
		}
		SCK_L;//CPOL = 0
		delay_us(1);
	
	CS_H;
	return data_in;
}

