#include "Misc.h"


extern int LOW_POWER_SET;
extern int HIGH_POWER_SET;

extern robot_t g_robot;
extern unsigned char last_beep;
unsigned char is_low_power_cnt;


int ADvalue;
int System_mode;
unsigned char reg_led = 0;
/* dribbler */

//initial the dribbler, variable freq is the frequence of DBPWM
unsigned int db_pwm_freq=0xffff;
unsigned char g_power = 0;


/*---------function headers----------*/
int is_power_low();



/*-----------------------------------------------------------------
 *  函数名称： is_ball_detected
 *  函数描述： 通过红外判定球是否在小车嘴里。检测红外对应引脚（pin138）的高低
 *			               电平，若电平为低，说明有球在嘴里，则函数返回1；若电平为高，
 *                               说明小车嘴里无球，则函数返回0.
 *  作者：  		  方立
 *  修改日期： 2012—11—29
 -----------------------------------------------------------------*/ 
int is_ball_detected()
{
  if( 0x0 == (IORD(PIO_INFRA_BASE,0) & 0x1))
    return 1;
  else
    return 0;
}


/*-----------------------------------------------------------------
 *  函数名称：is_infra_broken
 *  函数描述： 检测红外是否坏掉，原理就是检测红外是否一直被挡住
 *  
 *
 *
 *  作者：   李宁璨
 *  修改日期： 2012-12-5
 -----------------------------------------------------------------*/ 
 int is_infra_broken()
{	
	int n=0;
	int i;
	for(i=1;i<=5;i++)
		{	
			if(!(IORD(PIO_INFRA_BASE,0) & 0x1))
			{
				n++;
			}
			else n=0;
		}
	if(n==5)
		return 1;//坏了返回1
	else return 0;
}

/*-----------------------------------------------------------------
 *  函数名称： is_cap_low
 *  函数描述： 检测电容电压是否过低，若电容电压过低则返回1，
 *    				  若电容电压正常则返回0
 *
 *
 *  作者：    	 方立
 *  修改日期： 2012-12-4
 -----------------------------------------------------------------*/ 
int is_cap_low()
{
	   //ADvalue = Get_CapVoltage();
	ADvalue=(IORD(ADGETNEW2_0_BASE,1)&0x00ff);
	if(ADvalue <= CAP_POWER_LOW)
		return 1;
	else
	  	return 0;
}




/*-----------------------------------------------------------------
 *  函数名称： is_power_low
 *  函数描述： 检测电池电压是否过低，若低于报警电压，返回1，若低于
 *			   强制停止的电压，返回2，电压正常返回0
 *
 *  作者：    	   李川
 *  修改日期： 2012-11-29
 -----------------------------------------------------------------*/ 
int is_power_low()
{
  /* compare battery power AD value with low power threashold */
	static int powerarr[5]={0};
  	static int num=0;
	static int avepower;
	static int limpower=5;//,counter=0;   //the range of power is -2 ~ +2
	int i,u,d;
  	
   	g_power=(IORD(ADGETNEW2_0_BASE,0)&0x00ff);   //读电池电压
   	powerarr[num++]=g_power;
	if(num==5) num=0;

	u=d=0;
	if(powerarr[4])
	{
		for(i=1;i<5;i++)
		{
			if(powerarr[i] > powerarr[u]) u = i;
			if(powerarr[i] < powerarr[d]) d = i;			
		}
        
		if(powerarr[u] > avepower + limpower) powerarr[u] = avepower;
		if(powerarr[d] < avepower - limpower) powerarr[d] = avepower;
        
        avepower = powerarr[0];
		
        for(i=1;i<5;i++)
		{
			avepower = avepower + powerarr[i];
		}

		avepower = avepower / 5;
        //counter++;
        //printf("%d  %d\n",counter,avepower);

		if(avepower < (int)WARNING_POWER_D)
		{
  			if(avepower <= (int)FORCESTOP_POWER_D)
  			{
				return 2;
  			}
			return 1;
    	}
	}
	else avepower = (powerarr[0]+powerarr[1]+powerarr[2]+powerarr[3])/4;
    return 0;
}


/*-----------------------------------------------------------------
 *  函数名称： do_power_monitor
 *  函数描述： 对电池电压进行检测，如果长时间电压过低，就报警，并返回对应的标志
 *
 *  作者： 	李川
 *  修改日期： 2012-12-23
 -----------------------------------------------------------------*/ 
int do_power_monitor()
{
	char retflag;
	
	retflag=is_power_low();
    if( retflag )
	{ 
		if(is_low_power_cnt<5)
			is_low_power_cnt++;
		else
		{
			is_low_power_cnt=5;
		
#ifdef ENABLE_BEEP
			beep_on( BEEP_POWER );
#endif
			return retflag;
		}
	}
	else
	{
        is_low_power_cnt=0;		
		
#ifdef ENABLE_BEEP
		//if(last_beep == 0)	//浪射报警不关闭蜂鸣器
		beep_off( BEEP_POWER );
#endif
	}

	return 0;
}



/*-----------------------------------------------------------------
 *  函数名称： init_led
 *  函数描述： 初始化LED灯，让LED灯闪三下。对应的是心跳灯
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
int init_led()
{  
	led_on(1);
	led_on(0); 
	delay(100000);
	led_off(1);
	led_off(0);
	delay(100000);
	led_on(1);
	led_on(0); 
	delay(100000);
	led_off(1);
	led_off(0); 
	delay(100000);
	led_on(1);
	led_on(0); 
	return 0;

}


/*-----------------------------------------------------------------
 *  函数名称： led_off
 *  函数描述： 关闭led灯
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
int led_off( int channel )
{
  switch ( channel )
  {
    //LED 0
    case 0 : reg_led = reg_led | 0x1; break;
    //LED 1
    case 1 : reg_led = reg_led | 0x2; break;
    
    default  : return -1; break;
  }

  IOWR(PIO_LED_BASE,0,reg_led);

	return 0; 
}




/*-----------------------------------------------------------------
 *  函数名称： led_on
 *  函数描述： 开启led灯
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
int led_on( int channel )
{
  switch ( channel )
  {
    //LED 0
    case 0 : reg_led = reg_led & (~0x1); break;
    //LED 1
    case 1 : reg_led = reg_led & (~0x2); break;
    
    default  : return -1; break;
  }

  IOWR(PIO_LED_BASE,0,reg_led);  

  return 0;
}



/*-----------------------------------------------------------------
 *  函数名称： beep_on
 *  函数描述： 使得报警铃声响起
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
int beep_on( int channel )
{
	IOWR( PIO_BUZZER_BASE , 1 , 1);
  	IOWR( PIO_BUZZER_BASE , 0 , 1 );
  	return 0;
}


/*-----------------------------------------------------------------
 *  函数名称： beep_off
 *  函数描述： 使得报警器停止报警
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
int beep_off( int channel )
{
	IOWR( PIO_BUZZER_BASE , 1 , 1);
  	IOWR( PIO_BUZZER_BASE , 0 , 0);
  	return 0;
}



/*-----------------------------------------------------------------
 *  函数名称： record_err
 *  函数描述： 记录错误的信息
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
void record_err(int err_no)
{
	static int error_pos = 0;
	g_robot.error[error_pos].name = err_no;
	error_pos++;
	if(error_pos >= ERROR_NUM)
	{
		error_pos = 0;
	}
}



/*-----------------------------------------------------------------
 *  函数名称： heart_beat
 *  函数描述： 心跳灯执行函数，如果灯亮就变暗，如果灯暗就变亮
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
int heart_beat()
{
    static int is_led_on = 0;
  
    if( is_led_on )
    {
        led_off( 0 );    

        is_led_on = 0;
    }
    else
    {
  
        led_on( 0 );
        is_led_on = 1;
    }
  
	return 0;
}



/*-----------------------------------------------------------------
 *	函数名称： delay
 *	函数描述： 写了一个延时函数，因为不同的编译配置下延时的长短不同，所以用OP_NONE来区分一下优化级别
 *		       这里的优化参数指工程里两个文件夹的属性→build里的配置。需要设置成一致的。
 *			   另外在库属性的system library里需要只选择clean exit /reduced device drivers/small C library. 否则延时会有差别。
 *			   参数表示需要延时的时间，单位是us。最短延时为1us。
 *			   据不完全测试，误差在1us或者10%以下。
 *			   在不优化的情况下，短时间的延时不容易实现，大约有10us的误差。
 *			   需要精确计时最好用定时器。
 *	
 *
 *
 *	作者：	   不详
 *	修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 

void delay(int us)
{
	unsigned int i = 0;
	#ifdef OP_NONE 
		usleep(us);
	#else
		if(us == 0)
		{

		}
		else if(us == 1)
		{
			for(i=0;i<5;i++)
                		asm("nop");
		}
		else if(us < 5)
		{
			usleep(us-2);
		}
		else if(us < 11)
		{
			usleep(us-1);
		}
		else
		{
			usleep(us);
		}
	#endif 
}



