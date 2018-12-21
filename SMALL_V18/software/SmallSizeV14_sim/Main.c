#include "Main.h"

/*************** Globals ****************/
int dribbler_speed_max_set;
int wheel_reduction_ratio_x_set;//3; /*减速比*/     // X.YZ
int wheel_reduction_ratio_yz_set;//28; /*减速比*/   //X.YZ
int max_shot_strength_set;
unsigned char startpoint;
unsigned char steplength;




/************** system info ***************/
robot_t g_robot;



/************** Global Flag **************/
extern char g_powermon_flag;
extern char heart_beat_flag;
extern char g_updata_shooter_flag;
extern char forcestop_counter;
extern unsigned char offline_test_check_flag;
extern packet_type_t type;

unsigned char last_beep = 0;

/*---------function headers----------*/
int init_struct();
void init_e2prom(void);
void init_parameter();
int init_motor();
int init_other();
int init_timer();
int initialize();
int do_run();
void single_e2prom_set(int num,unsigned char param);




/*-----------------------------------------------------------------
 *  函数名称： main
 *  函数描述： 主函数，包含一个初始化，以及一个不会跳出的循环
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 

int main()
{
  initialize();
  #ifdef _Config_mod_
	  g_robot.mode = _Config_mod_;
  #endif
  #ifdef _Config_num_
	  g_robot.num = _Config_num_;
  #endif

  do_run();

}

/*-----------------------------------------------------------------
 *  函数名称： initialize
 *  函数描述： 各个部分的初始化
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
int initialize()
{

	alt_irq_context context;
  
  	context =  alt_irq_disable_all ();		//关闭所有中断
	beep_off(0);							//关闭报警铃声
    init_struct();
	init_e2prom();							//初始化EEROM中的参数
	init_parameter();						//初始化电机的参数
	init_motor();							//电机初始速度设置为0
  	init_pca9557();							//读取拨码盘的数值
	init_other();							//初始化其余模块
	init_comm();							//初始化通讯模块
	init_led();								//初始化led灯
	init_timer();							//初始化定时器
	alt_irq_enable_all(context);			//开启所有中断
  
  	return 0;
}

/*------------------------------------------------------------------------
 *  函数名称： init_struct
 *  函数描述： 为系统结构体g_system以及g_robot开辟一段空间
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -------------------------------------------------------------------------*/ 
int init_struct()
{

	/* robot info initialize*/
	memset( &g_robot, 0, sizeof( g_robot ) );	
	
	return 0;
}

/*--------------------------------------------------------------------------
 *  函数名称： init_e2prom
 *  函数描述： 向EEROM中写入一些全局变量的值
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 ---------------------------------------------------------------------------*/ 
void init_e2prom(void) 
{
	static unsigned char data_in[16]; 
  
    flash_get(0,data_in,1); 
    if(data_in[0]!=0xBB)                                //保证只初始化一次
    {
        data_in[0]=0xBB;                                //初始化标志
        data_in[1]=MOTOR_KP;                            //轮子P 参数
        data_in[2]=MOTOR_KI;                            //轮子I 参数
        data_in[3]=MOTOR_KP;                            //轮子P 参数
        data_in[4]=MOTOR_KI;                            //轮子I 参数
        data_in[5]=MOTOR_KP;                            //轮子P 参数
        data_in[6]=MOTOR_KI;                            //轮子I 参数
        data_in[7]=MOTOR_KP;                            //轮子P 参数
        data_in[8]=MOTOR_KI;                            //轮子I 参数
        data_in[9]=D_WHEEL_REDUCTION_RATIO_X;           //减速比X
        data_in[10]=D_WHEEL_REDUCTION_RATIO_YZ;         //减速比YZ
        data_in[11]=D_MAX_DRIBBLER;                     //控球档位最大占空比
        data_in[12]=V_MAX_DRIBBLER;                     //控球电机转速的阈值
        data_in[13]=MAX_SHOT_STRENGTH;					//最大射门力度
		data_in[14]=STR_9557_SET;
		data_in[15]=STEP_9557_SET;
        flash_set(0,data_in,16);                        //初始数据配置到24C08中
    }
 
}

/*------------------------------------------------------------------------------
 *  函数名称： init_parameter
 *  函数描述： 现在是依靠宏定义对于电机的相关参数进行初始化，但是希望通过EEROM的
 *             读写进行设置
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 ------------------------------------------------------------------------------*/ 
void init_parameter()			
{ 
	static unsigned char data[15];//=(unsigned char*)malloc(15*sizeof(unsigned char));

		
	flash_get(1,data,15);//  remain to develop    
			
	IOWR_AVALONCONTROL_A(MOTOR_0_BASE, data[0]+data[1]);
	IOWR_AVALONCONTROL_B(MOTOR_0_BASE, data[0]);
	IOWR_AVALONCONTROL_Z_OPENLOOP(MOTOR_0_BASE, M_CLOSELOOP);
	IOWR_AVALONCONTROL_Z_BRUSHLESS(MOTOR_0_BASE, M_BLDC);
		    
	IOWR_AVALONCONTROL_A(MOTOR_1_BASE, data[2]+data[3]);
	IOWR_AVALONCONTROL_B(MOTOR_1_BASE, data[2]);
	IOWR_AVALONCONTROL_Z_OPENLOOP(MOTOR_1_BASE, M_CLOSELOOP);
	IOWR_AVALONCONTROL_Z_BRUSHLESS(MOTOR_1_BASE, M_BLDC);
		        
	IOWR_AVALONCONTROL_A(MOTOR_2_BASE, data[4]+data[5]);
	IOWR_AVALONCONTROL_B(MOTOR_2_BASE, data[4]);
	IOWR_AVALONCONTROL_Z_OPENLOOP(MOTOR_2_BASE, M_CLOSELOOP);
	IOWR_AVALONCONTROL_Z_BRUSHLESS(MOTOR_2_BASE, M_BLDC);
	        
	IOWR_AVALONCONTROL_A(MOTOR_3_BASE, data[6]+data[7]);
	IOWR_AVALONCONTROL_B(MOTOR_3_BASE, data[6]);
	IOWR_AVALONCONTROL_Z_OPENLOOP(MOTOR_3_BASE, M_CLOSELOOP);
	IOWR_AVALONCONTROL_Z_BRUSHLESS(MOTOR_3_BASE, M_BLDC);  

    IOWR_AVALONCONTROL_A(MOTOR_4_BASE, MOTOR_KP+MOTOR_KI);
    IOWR_AVALONCONTROL_B(MOTOR_4_BASE, MOTOR_KP);
    IOWR_AVALONCONTROL_Z_OPENLOOP(MOTOR_4_BASE, M_CLOSELOOP);
    IOWR_AVALONCONTROL_Z_BRUSHLESS(MOTOR_4_BASE,M_BLDC);    
 	wheel_reduction_ratio_x_set= data[8];
 	wheel_reduction_ratio_yz_set= data[9];
	//MAX_DRIBBLER_SET = data[10]*10;
	dribbler_speed_max_set = data[11]*10;

	if(data[12]<=150)
    {
    	max_shot_strength_set=data[12];
    }
    else 
    	max_shot_strength_set=150;
	startpoint = data[13];
	steplength = data[14];
}

/*-----------------------------------------------------------------
 *  函数名称： init_motor
 *  函数描述： 将电机速度初始化为0
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
int init_motor()
{
    IOWR_AVALONCONTROL_SET(MOTOR_0_BASE, 0);
    IOWR_AVALONCONTROL_SET(MOTOR_1_BASE, 0);
    IOWR_AVALONCONTROL_SET(MOTOR_2_BASE, 0);
    IOWR_AVALONCONTROL_SET(MOTOR_3_BASE, 0);   
    IOWR_AVALONCONTROL_SET(MOTOR_4_BASE, 0);          
  return 0;
}

/*-----------------------------------------------------------------
 *  函数名称： init_other
 *  函数描述： 初始化各个轮子的角度，控球模块，红外模块以及射门模块
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
int init_other()
{
	int i = 0; 

  	double wheel_angle[ 4 ] = { 
		 D_WHEEL_ANGLE_FRONT,
		-D_WHEEL_ANGLE_FRONT,
		-D_WHEEL_ANGLE_BACK,
		 D_WHEEL_ANGLE_BACK
	};

	/*------------------从轮子速度到码盘PID----------------------*/	
	g_robot.kv2n = ( (double)wheel_reduction_ratio_x_set + (double)wheel_reduction_ratio_yz_set * 0.01 ) * ( 4 * ENCODER_COUNTS_PER_TURN_SET) / 2 / PI / WHEEL_RADIUS / DO_PID_FRQ;

	
	/*-------------------g_robot.kv2n=74.038--------------------*/
	for( i = 0; i < 4; i++ )
	{
		/*---------------trasnform wheel angle---------------------*/
	    double angle = wheel_angle[ i ] / 180.0 * PI;

	    
	    g_robot.sin_angle[ i ] = sin( angle ) ;
	    g_robot.cos_angle[ i ] = cos( angle ) ;
	}
  
  	/*------------------init dribbler speed---------------------*/
  	g_robot.dribbler.set = 0;

	
  	/*--------------------init IR detector----------------------*/
  	IOWR(PWM_2_INFRA_PWM_BASE,0,0x0);   //start
  	IOWR(PWM_2_INFRA_PWM_BASE,1,(CLKFREQ / INFRA_FREQ));   //period
  	IOWR(PWM_2_INFRA_PWM_BASE,2,((CLKFREQ / INFRA_FREQ) * INFRA_DUTY));     //duty
  	IOWR(PWM_2_INFRA_PWM_BASE,3,0x0);				//counter
  	IOWR(PWM_2_INFRA_PWM_BASE,0,0x1); 

  	init_shooter(); 

	return 0;
}

/*--------------------------------------------------------------------------
 *  函数名称： init_timer
 *  函数描述： 初始化定时器，将周期设定成为1ms，并为定时器注册中断
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 ---------------------------------------------------------------------------*/ 
int init_timer()
{
	unsigned long temp;
  
	temp = CLKFREQ / TICKFREQ; 					// calculate  the period 
  	IOWR( TIMER_0_BASE, 1, 0x8); 				// stop the timer
  	IOWR( TIMER_0_BASE, 0, 0); 					//clear the irq flag
  
  	//set the period reg
  	IOWR( TIMER_0_BASE, 2, ( temp & 0xffff ) ); 
  	IOWR( TIMER_0_BASE, 3, ( temp >> 16 ) );
  
  	// register the interrupt handler
  	alt_irq_register( TIMER_0_IRQ, ( void * )0, do_timer ); 
  
  	// start the timer, continuously running.
  	IOWR( TIMER_0_BASE, 1, 0x7 ); 

	return 0;
}


/*-----------------------------------------------------------------
 *  函数名称： do_run
 *  函数描述： 进入主循环，根据模式选择拨码盘的不同，选择不同模式
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
int do_run()		
{

	int spcount = 0;
	int slcount = 0;
	int start_beep_flag = 1;
	while( 1 )
	{
		                   
        if(start_beep_flag)
        {
        	int i;
			if(g_robot.mode <= 3)	i = g_robot.mode + 1;
			else if(g_robot.mode == 0xf)	i = 1;
			else i = 0;
			while(i != 0)
			{
				beep_on(0);
				usleep(100000);
				beep_off(0);
				usleep(100000);
				i--;
			}
			start_beep_flag = 0;
		}

/*浪射报警
		if(last_beep == 1)
		{
			static int flag = 0;

			flag++;
            if(flag > 50000)
                flag = -50000;
            
			if((flag >= 0 && flag <= 10000) || (flag >= 20000 && flag <= 30000))
			{
				beep_on(0);
			}
			else
			{
				beep_off(0);
			}
		}
*/

		if(g_powermon_flag)							//对电池电压进行检测
		{
			g_powermon_flag = 0;
			if(do_power_monitor()==2)
				if(forcestop_counter>=LOWPOWERTIME)
				{
					do_dribbler(0);
					do_move(0,0,0);
					do_shoot(0,0);
  					do_chip(0,0);
					while(!g_powermon_flag);
					continue;
				}
		}
		
		if(heart_beat_flag==1)						//进行心跳灯的明暗切换
		{
			heart_beat();
			heart_beat_flag=0;
		}
   
        
		
		switch(g_robot.mode)
		{
			case NORMAL_MODE :

				/* process message from comm device( rs232, wireless, etc. ) */
			
				do_comm();
                if(g_is_shoot_in_main_loop){
                    do_shoot(g_is_shoot_in_main_loop, 1);
                }
                if(g_is_chip_in_main_loop)
                    do_chip(1, g_is_chip_in_main_loop);
            
				is_comm_overflow();
				set_receive_mode();
				
				if(g_updata_shooter_flag)					//对射门完成之后的延时进行计时
				{
         
					update_shooter();
                
					g_updata_shooter_flag = 0;
				}

			break;
			
 			case OFFLINE_TEST_MODE:
				
			{
				unsigned char n_step,n_str;
				static unsigned char shootflag = SHOOT_DELAY;
				static unsigned char chipflag = SHOOT_DELAY;
				int tempf,tempn;
				
				
				if(offline_test_check_flag)
				{
					offline_test_check_flag = 0;
						
					tempf = (read_byte_9557(7, 0));  //frq,0 for start,1 for run,2 for drible,3 for shoot,4 for chip,5 for release power
					if(tempf >= 0)
			        {   
			        	n_str=((~tempf) & 0x3c) >> 2;
			        }
			        else
				    {   
				    	beep_on(0);usleep(100000);beep_off(0);usleep(100000);         //报错
				    }

					tempn = (read_byte_9557(0, 0));  //num
					if(tempn >= 0)
					{
						n_step = ((~tempn) & 0x3c) >>2;
					}
					else
					{
					    beep_on(0);usleep(100000);beep_off(0);usleep(100000);         //报错
		            }
					
					switch (n_step - OFFLINE_TEST_MODE)
					{
						case 0:

							do_dribbler(0);
				            do_chip(0, 0);
				            do_shoot(0, 0);
							do_acc_handle_move(0, 0, 0);

							break;

						case 1:
				            do_dribbler(0);
				            do_chip(0, 0);
				            do_shoot(0, 0);
                            
							if(n_str < 8)
								do_acc_handle_move(n_str * 10, 0, 0);
							else
								do_acc_handle_move((n_str - 16) * 10, 0, 0);
							break;

						case 2:
				            do_acc_handle_move(0, 0, 0);
				            do_chip(0, 0);
				            do_shoot(0, 0);
											
				            do_dribbler(n_str);
							break;

						case 3:
				            do_acc_handle_move(0, 0, 0);
				            do_dribbler(0);
				            do_shoot(0, 0);
							
							if(chipflag >= SHOOT_DELAY)
							{
								do_chip(0, n_str * 20);
								chipflag = 0;
							}
							else
								chipflag ++;
							break;

						case 4:
							do_acc_handle_move(0, 0, 0);
				            do_dribbler(0);
				            do_chip(0, 0);
                                                        
							if(shootflag >= SHOOT_DELAY)
							{
								do_shoot(n_str * 20 ,0);
								shootflag = 0;
							}
							else
								shootflag ++;
							break;
							
				 		case 5:
				            do_acc_handle_move(0, 0, 0);
				            do_dribbler(0);
				            do_chip(0, 0);
				                                                        
				            if(shootflag >= SHOOT_DELAY)
				            {
								set_shooter(0,n_str * 20 );
								shootflag = 0;
				            }
				            else
				               shootflag ++;
				            break;

						default:

							do_dribbler(0);
                            do_chip(0, 0);
                            do_shoot(0, 0);
							do_acc_handle_move(0, 0, 0);
							break;
                        
					}
				            
				} 			
			}
			
			break;

			case CHECK_FRQ_MODE :

				/* process message from comm device( rs232, wireless, etc. ) */

				type = PACKET_DEBUG_Check_Frq;
				
				do_comm();
				
				is_comm_overflow();
				set_receive_mode();
				
			break;

			case SHOOT_CHIP_MODE:

				led_off(1);
				delay(100000);
				led_on(1);		   
    			delay(100000);
   				led_off(1);
				delay(100000);
				led_on(1);		   
    			delay(100000);
   				led_off(1);
				
				while(1)
				{
					static unsigned char count_str=0;
					unsigned char strength_str_l,strength_str_u,mode_str;
					unsigned char checkflag=1;
					int temp;

					IOWR(PIO_INFRA_BASE, 2, 0x0);			//关闭红外中断。
					
					if ( is_ball_detected()==1 )
					{
						if(count_str<20)
							count_str++;
						if(checkflag)
                        {
                            g_robot.frq = (read_byte_9557(7, 0));  //frq,0 for shoot,1 for chip
                            if(g_robot.frq > 0)
                            {   
                                g_robot.frq = ~g_robot.frq;
                                mode_str=(g_robot.frq & 0x3c) >> 2;
                            }
                            else
                            {   
                                led_on(1);         //报错
                                delay(500000);
                                led_off(1);
                                delay(500000);
                                led_on(1);         
                                delay(500000);
                                led_off(1);
                                delay(500000);              
                            }
                            if(mode_str%2==1){
                                do_dribbler(2);
                            }
                            else
                                do_dribbler(0);
                        }
                        checkflag=0;
					}
					else
					{
					    count_str = 0;
						IOWR_AVALONCONTROL_SET(MOTOR_4_BASE, 0);
					}
					
					if(count_str==20)
					{
						g_robot.num = (read_byte_9557(0, 0));  //num
						if(g_robot.num>0)
						{
							temp = ~g_robot.num;
							g_robot.num = ~g_robot.num;
							strength_str_l = (temp & 0x3c) >>2;
							strength_str_u = ((g_robot.num & 0xc0) >> 6) + ((g_robot.num & 0x1) << 3) + ((g_robot.num & 0x2) << 1);
						}
						else
						{
			 				led_on(1);		   //报错
    						delay(500000);
   						 	led_off(1);
    						delay(500000);
			 				led_on(1);		   
    						delay(500000);
   						 	led_off(1);
    						delay(500000);
						}

						g_robot.frq = (read_byte_9557(7, 0));  //frq,0 for shoot,1 for chip
            			if(g_robot.frq > 0)
						{
							g_robot.frq = ~g_robot.frq;
							mode_str=(g_robot.frq & 0x3c) >> 2;
            			}
						else
						{	
			 				led_on(1);		   //报错
    						delay(500000);
   						 	led_off(1);
    						delay(500000);
			 				led_on(1);		   
    						delay(500000);
   						 	led_off(1);
    						delay(500000);				
						}

						IOWR_AVALONCONTROL_SET(MOTOR_4_BASE, 0);
						if(mode_str == 0 || mode_str == 2)
						{
							set_shooter(SHOOT, strength_str_u * 16 + strength_str_l);
							count_str = 0;
						}
						else if(mode_str == 1 || mode_str == 3)
						{
							set_shooter(CHIP, strength_str_u * 16 + strength_str_l);

							count_str = 0;
						}
						else
						{
							set_shooter(SHOOT, 0);
							set_shooter(CHIP, 0);
						}
					}	
					else
					{
						set_shooter(SHOOT, 0);
						set_shooter(CHIP, 0);
					}

					delay(100000);
				}
				break;


		    case SET9557_ERROR_MODE:
				
				while(1)
				{
                    int i;
                    
					beep_on(0);
					for(i=0; i<500000; i++) ;
					beep_off(0);
					for(i=0; i<1000000; i++) ;
				}
				
			break;
			
            case SET_FRQ_E2PROM_MODE:

			{
				int temph,templ,tempmode;				
				
				temph = read_byte_9557(7,0); 
				if(temph >= 0)
				{   
			    	temph=((~temph) & 0x3c) >> 2;
					
		       	}
				templ = read_byte_9557(0,0);
				if(templ >= 0)
				{
					templ = ~templ;
					templ = ((templ & 0xc0) >> 6) + ((templ & 0x1) << 3) + ((templ & 0x2) << 1);
					if(templ > 9) 	
					{
						templ = 9;
						beep_on(0);
						delay(500000);
						beep_off(0);
						delay(500000);
						beep_on(0);
						delay(500000);
						beep_off(0);
						delay(500000);
					}
				}
				tempmode = read_byte_9557(0,0);
                tempmode = ~tempmode;
                tempmode = (tempmode & 0x3c) >> 2;
				switch(tempmode)
				{
					case 7:
						startpoint = 0;
						steplength = 4;
						single_e2prom_set(13,startpoint);
						single_e2prom_set(14,steplength);
						break;
					case 9:
						spcount = 1;
						break;
					case 10:
						while(spcount)
						{	
							spcount = 0;
							startpoint = temph * 10 + templ;
							single_e2prom_set(14,startpoint);
						}
						break;
					case 11:
						slcount = 1;
						break;
					case 12:
						while(slcount)
						{
							slcount = 0;
							steplength = temph * 10 + templ;
							single_e2prom_set(15,steplength);
						}
						break;
					default:break;
				}
			}
				
			break;        	
		    default: 
				
				record_err(ROBOT_MODE_ERR);
				
			break;
                
		}
	}	

	return 0;
}


/*-----------------------------------------------------------------
 *  函数名称： single_e2prom_set
 *  函数描述： 通过传入参数对e2prom中特定位号的值进行设置
 *  
 *
 *
 *  作者：     金礼森
 *  修改日期： 2014-5-22
 -----------------------------------------------------------------*/ 
void single_e2prom_set(int num,unsigned char param)
 {
    static unsigned char data_out[25];
 	flash_get(0,data_out,16);
 	if(data_out[num] != param)
 	{
 		data_out[num] = param;
 		alt_irq_context context;
 		context =  alt_irq_disable_all ();
 		flash_set(0,data_out,16);
 		alt_irq_enable_all(context); 
 		beep_on(0);
 		int i = 0;
 		int j = 0;
 			for(i=0;i<10000;i++)
  		{
  			for(j=0;j<500;j++);
 		}
 		beep_off(0);
 							}
 }

