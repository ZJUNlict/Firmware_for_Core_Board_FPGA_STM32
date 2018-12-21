#include "robot.h"
#include "math.h"
#include "spi.h"
#include <stdio.h>
#include "Task.h"

extern robot_t g_robot;

void robot_init(void)
{
	int i;
	float angle;
	float wheel_angle[ 4 ] = { 
		 D_WHEEL_ANGLE_FRONT,
		-D_WHEEL_ANGLE_FRONT,
		-D_WHEEL_ANGLE_BACK,
		 D_WHEEL_ANGLE_BACK
	};
	g_robot.kv2n = 74.038;
	g_robot.num = 1;
	g_robot.mode = NORMAL_MODE;	
	for(i = 0; i < 4; i++)
	{
	    angle = wheel_angle[ i ] / 180.0 * PI;
	    g_robot.sin_angle[ i ] = sin( angle ) ;
	    g_robot.cos_angle[ i ] = cos( angle ) ;
	}
}

int on_robot_command(packet_robot_t *packet )
{ 
	//if( g_robot.mode == NORMAL_MODE || g_robot.mode == NORMAL_MODE_512 || g_robot.mode == LabviewUpload_MODE )
	if(g_robot.mode == NORMAL_MODE)
	{		
//		set_dribbler(6, ((fabs((packet->dribbler)*8)<=64)&&(fabs((packet->dribbler)*8)>=0))?(fabs((packet->dribbler)*8)):0);
//		#ifdef ENABLE_SHOOTER
//		if(packet->shoot)
//		{
//				do_shoot_or_chip(packet->shoot, 0);
//		}
//		else if(packet->chip)
//		{
//				do_shoot_or_chip(0, packet->chip);
//		}    
//		#endif
		do_acc_handle_move(packet->speed_x, packet->speed_y, packet->speed_rot);
	}
	//else(g_robot.mode == NORMAL_MODE)
		
	return 0;
}

int do_acc_handle_move(int speed_x,int speed_y,int speed_rot)
{
    task_create(1,
                (double)speed_x, 
                (double)speed_y, 
                (double)((speed_rot/*+buchang(speed_x, speed_y, speed_rot)*/) * 0.025 ),
                 0, 
                 0, 
                 0, 
                 0, 
                 100,
                 HOST_MOVE             );
}

int do_move( int speed_x, int speed_y, int speed_rot )
{
	int i = 0;
	int speed_rbt;
//	char speed_dir;
	char speed_val;
	float speed[CHANNEL_NUM ] = { 0 };
	
	float vx = (float)(speed_x) / 100.0 ;
	float vy = (float)(speed_y)  / 100.0;
	float vz = (float)(speed_rot/*+buchang(speed_x, speed_y, speed_rot)*/) * 0.025 * WHEEL_CENTER_OFFSET;

	for( i = 0; i < 4; i++ )
	{
		/* trasnform wheel angle */
		speed[ i ] = ( g_robot.sin_angle[ i ] * vx + g_robot.cos_angle[ i ] * vy + vz );
	}

	/* change wheels' speed set point */
	for( i = 0; i < CHANNEL_NUM; i++ )
	{
		speed_val = 0;
		g_robot.wheels[ i ].set = V2N( speed[ i ] );
		speed_rbt = g_robot.wheels[ i ].set;
		if(speed_rbt<=127&&speed_rbt>=-128)
		{
				speed_val = (char)speed_rbt;
		}
		
		switch(i)
		{
			case 0: SPI_Master_ReadWrite_Byte(speed_val, 0x00);break;
	       
			case 1:	SPI_Master_ReadWrite_Byte(speed_val, 0x01);break;
	        
			case 2:	SPI_Master_ReadWrite_Byte(speed_val, 0x02);break;
	       
			case 3:	SPI_Master_ReadWrite_Byte(speed_val, 0x03);break;
	       
			default:break;
		}		
	}

	return 0;
}

//将轮子的速度单位从(m/s)转换到码盘的(格/PID周期)
long V2N( float vel )
{
	return vel * g_robot.kv2n;
}


double max_acc()
{
    if(g_robot.current_state.robot_speed_x<-0.5)return 35;
    else if(g_robot.current_state.robot_speed_x<-2)return 45;
    else return 26;
}

int set_dribbler(int priority, int strength )		//1?1/4  	2? 1/2    	3? 3/4
{
  task_create(2, 0, 0, 0, strength, 0, 0, 0, 100, priority);
	return 0;	
}

int set_shooter( int channel, int value )
{
        task_create(3, 
                    0, 
                    0, 
                    0, 
                    0, 
                    value*2500, 
                    channel,
                    0, 
                    100,  
                    HOST_SHOOT);//??????????

	return 0;	
}

int do_shoot_or_chip( int shoot, int chip )//?????????????,??????????????
{
    if(shoot)   set_shooter(SHOOT, shoot);
    else if(chip)   set_shooter(CHIP, chip);
	return 0;
}

