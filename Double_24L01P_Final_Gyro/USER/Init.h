#ifndef __Init_H
#define __Init_H

#include "sys.h"
#include "delay.h"

#include "led.h"
#include "lcd.h"
#include "spi.h"
#include "key.h"  
#include "NRF24L01.h"
#include "robot.h"
#include "packet.h"
#include "string.h"
#include "Comm.h"
#include "timer.h"
#include "exti.h"
#include "fsmc.h"
#include "bsp_debug_usart.h"
#include "exti.h"
#include "mpu6050.h"
#include "inv_mpu.h"
#include "inv_mpu_dmp_motion_driver.h"

void Init_all(void);

#endif
