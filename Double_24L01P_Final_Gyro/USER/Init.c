#include "Init.h"

void Init_all(void)
{
//	 g_robot.current_state.robot_speed_x = 0;
//	 g_robot.current_state.robot_speed_y = 0;
//	 g_robot.current_state.robot_speed_r = 0;
	SPI_Master_Init();

	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	delay_init(168);

	LED_Init();
	TIM3_Int_Init(100-1,840-1);	//定时器时钟84M，分频系数8400，84M/8400=10Khz的计数频率，计数5000次为500ms
	EXTIX_Init();       //初始化外部中断输入
	
/*接收模式的24L01初始化*/	
  NRF24L01_1_GPIO_Init();
	NRF24L01_check( );			
	RF24L01_Init( );
	RF24L01_Set_Mode( MODE_RX );

/*发送模式的24L01初始化*/		
//  NRF24L01_2_GPIO_Init();
//	NRF24L01_check_2( );			
//	RF24L01_Init_2( );
//	RF24L01_Set_Mode_2( MODE_TX );
	robot_init();
}

