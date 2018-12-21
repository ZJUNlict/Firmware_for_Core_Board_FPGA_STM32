#ifndef __SPI_H
#define __SPI_H

#include "sys.h"
#include "delay.h"
#include "robot.h"

#define SPI_SCK_PIN_                  GPIO_Pin_0
#define SPI_SCK_GPIO_PORT_               GPIOE
#define SPI_MOSI_PIN_                    GPIO_Pin_1
#define SPI_MOSI_GPIO_PORT_              GPIOE
#define SPI_MISO_PIN_                    GPIO_Pin_7
#define SPI_MISO_GPIO_PORT_              GPIOD
#define SPI_CS_PIN_                      GPIO_Pin_5
#define SPI_CS_GPIO_PORT_                GPIOD
#define SPI_MOSI_PIN_2_                    GPIO_Pin_4
#define SPI_MOSI_GPIO_PORT_2_              GPIOD
#define SPI_MOSI_PIN_3                    GPIO_Pin_5
#define SPI_MOSI_GPIO_PORT_3              GPIOA
#define SPI_MOSI_PIN_4                    GPIO_Pin_0
#define SPI_MOSI_GPIO_PORT_4              GPIOB
#define SPI_MOSI_PIN_5                    GPIO_Pin_1
#define SPI_MOSI_GPIO_PORT_5              GPIOB
#define SPI_MOSI_PIN_6                    GPIO_Pin_2
#define SPI_MOSI_GPIO_PORT_6              GPIOB

#define MOSI_H  GPIO_SetBits(SPI_MOSI_GPIO_PORT_,SPI_MOSI_PIN_)  
#define MOSI_L  GPIO_ResetBits(SPI_MOSI_GPIO_PORT_,SPI_MOSI_PIN_)  
#define MOSI_H_2  GPIO_SetBits(SPI_MOSI_GPIO_PORT_2_,SPI_MOSI_PIN_2_)  
#define MOSI_L_2  GPIO_ResetBits(SPI_MOSI_GPIO_PORT_2_,SPI_MOSI_PIN_2_)  
#define SCK_H		GPIO_SetBits(SPI_SCK_GPIO_PORT_,SPI_SCK_PIN_)   
#define SCK_L		GPIO_ResetBits(SPI_SCK_GPIO_PORT_,SPI_SCK_PIN_)  
#define MISO_IN GPIO_ReadInputDataBit(SPI_MISO_GPIO_PORT_, SPI_MISO_PIN_) 
#define CS_H		GPIO_SetBits(SPI_CS_GPIO_PORT_, SPI_CS_PIN_)
#define CS_L		GPIO_ResetBits(SPI_CS_GPIO_PORT_, SPI_CS_PIN_)
 
#define MISO_H  GPIO_SetBits(SPI_MISO_GPIO_PORT_,SPI_MISO_PIN_)  
#define MISO_L  GPIO_ResetBits(SPI_MISO_GPIO_PORT_,SPI_MISO_PIN_)  
#define SCK_IN	GPIO_ReadInputDataBit(SPI_SCK_GPIO_PORT_,SPI_SCK_PIN_)  
#define MOSI_IN GPIO_ReadInputDataBit(SPI_MOSI_GPIO_PORT_, SPI_MOSI_PIN_) 
#define CS_IN		GPIO_ReadInputDataBit(SPI_CS_GPIO_PORT_, SPI_CS_PIN_)


void SPI_Master_Init(void);
uint8_t SPI_Master_ReadWrite_Byte(char data_out,char data_addr);		 
		 	 		 
#endif
