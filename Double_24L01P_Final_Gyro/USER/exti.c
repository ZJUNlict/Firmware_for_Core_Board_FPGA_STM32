#include "exti.h"
#include "delay.h" 
#include "led.h" 
#include "key.h"
#include "NRF24L01.h"
#include "Comm.h"

extern uint8_t tmp_buf[32];

//外部中断15服务程序
//当24L01的IRQ引脚拉低时，接收到数据包
void EXTI15_10_IRQHandler(void)
{
	int i;
	i = NRF24L01_RxPacket( tmp_buf );
	if( 27 == i )
	{
		LED1 = ~LED1;
		do_comm();//24L01通信处理总函数
	}
	EXTI_ClearITPendingBit(EXTI_Line15); //清除LINE0上的中断标志位 
}	

//外部中断初始化程序
void EXTIX_Init(void)
{
	NVIC_InitTypeDef   NVIC_InitStructure;
	EXTI_InitTypeDef   EXTI_InitStructure;
 
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);//使能SYSCFG时钟
 
	SYSCFG_EXTILineConfig(EXTI_PortSourceGPIOE, EXTI_PinSource15);
	
  /* 配置EXTI_Line15 */
  EXTI_InitStructure.EXTI_Line = EXTI_Line15;//LINE15
  EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;//中断事件
  EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling; //下降沿触发
  EXTI_InitStructure.EXTI_LineCmd = ENABLE;//使能LINE0
  EXTI_Init(&EXTI_InitStructure);//配置
 
	NVIC_InitStructure.NVIC_IRQChannel = EXTI15_10_IRQn;//外部中断0
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x00;//抢占优先级0
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x02;//子优先级2
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;//使能外部中断通道
  NVIC_Init(&NVIC_InitStructure);//配置
}
