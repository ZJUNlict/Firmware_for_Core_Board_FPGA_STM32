#include "Task.h"
#include "robot.h"
#include "string.h"
#include "spi.h"
#include "math.h"

#define SHOOT_INTERVAL 500
extern robot_t g_robot;

/*task_create函数：
1.过上位机发来的指令决定下位机执行什么动作，time为该指令执行的时间
2.mode为0时说明指令未被激活，mode = 1输出移动指令， mode = 2输出吸球指令， mode = 3 输出射门指令
3.指令号越大说明优先级越高，同mode的指令只会被执行优先级最高的那个
4.正常动作如果执行时间超过上位机发包间隔，则会被下一个数据包冲掉，因此持续执行的指令time就设为100（足够大）即可
5.对于指令中未涉及的操作，不会改变当前状态直至超时（如在车移动时未发射门指令，则射门指令不会被更改，直至超时）
*/
void task_create(unsigned char mode, 
                double speed_x, double speed_y, double speed_r, 
                unsigned int dribbler, unsigned int strength, unsigned int chip_shoot_choose, 
                int start_ms_counter, int end_ms_counter, int task_priority)
{
   switch(mode)
   {
        case 1:
            g_robot.its_action[task_priority].mode = mode;
            g_robot.its_action[task_priority].robot_speed_x = speed_x / 100.0;
            g_robot.its_action[task_priority].robot_speed_y = speed_y / 100.0;//单位从cm/s转换成m/s
            g_robot.its_action[task_priority].robot_speed_r = speed_r * WHEEL_CENTER_OFFSET;//单位是rad/s
            g_robot.its_action[task_priority].start_ms_counter = start_ms_counter;
            g_robot.its_action[task_priority].end_ms_counter = end_ms_counter;
            return;
        case 2:
            g_robot.its_action[task_priority].mode = mode;
            g_robot.its_action[task_priority].its_ball_action.dribbler = dribbler; 
            g_robot.its_action[task_priority].start_ms_counter = start_ms_counter;
            g_robot.its_action[task_priority].end_ms_counter = end_ms_counter;
            return;
        case 3:
            g_robot.its_action[task_priority].mode = mode;
            g_robot.its_action[task_priority].its_ball_action.strength = strength;
            g_robot.its_action[task_priority].its_ball_action.shoot_chip_choose = chip_shoot_choose;
            g_robot.its_action[task_priority].start_ms_counter = start_ms_counter;
            g_robot.its_action[task_priority].end_ms_counter = end_ms_counter;
            return;
        default:
            return;
   }
}

/*
说明：
	1.在中断中每隔一段时间执行一次task_update函数，进行任务规划(定时器中断)
	2.不用检测是否有可用指令，因为有三个优先级最低的默认指令，如果没有其他指令就会执行默认指令，使机器人停止
	3.如果还没到指令的启动时间，就忽略此指令，寻找下一个优先级更低的指令
	4.红外检测应该在中断中执行
	5.目前吸球电机是反向吸球，所以指令里带有负号
	6.目前吸球电机转速最高支持4W转
*/
void task_update()
{
   
     int temp, mode_temp = 0;
     //从3模式开始筛找最高优先级的指令并执行
     for(mode_temp = 3; mode_temp >0; mode_temp--)
     {
        for(temp = 15;temp >=0; temp--) 
        {
            if(g_robot.its_action[temp].start_ms_counter > 0)
            {
                g_robot.its_action[temp].start_ms_counter--;
                continue;
            }
            if(g_robot.its_action[temp].mode == mode_temp)
            {
                if(mode_temp == 3)
                {
                    
//                    if((g_robot.current_state.shoot_off_timer == 0)&&
//                       (IORD(PIO_SHOOT_OFF_BASE, 0))&&
//                       (is_ball_detected()))
//                    {
//                        switch ( g_robot.its_action[temp].its_ball_action.shoot_chip_choose )
//                        {
//                            // channel 0 is shoot , high is active , 
//                            case SHOOT : 
//                                IOWR(SHOOT_TIMER_SHOOT_BASE, 0, g_robot.its_action[temp].its_ball_action.strength);    //change the shoot time function
//                                g_robot.its_action[temp].end_ms_counter = 0;
//                                g_robot.current_state.shoot_off_timer = SHOOT_INTERVAL;
//                            break;
//                            // channel 1 is chip ,  high is active , 
//                            case CHIP :
//                                IOWR(SHOOT_TIMER_CHIP_BASE, 0, g_robot.its_action[temp].its_ball_action.strength);
//                                g_robot.its_action[temp].end_ms_counter = 0; 
//                                g_robot.current_state.shoot_off_timer = SHOOT_INTERVAL;
//                            break;
//                            // default
//                            default :
//                                IOWR(SHOOT_TIMER_SHOOT_BASE,0,0x0);
//                                IOWR(SHOOT_TIMER_CHIP_BASE,0,0x0);
//                            break;
//                         }
//                    }
//                    g_robot.current_state.task[2] = temp;
//                    break;
                }
                else if(mode_temp == 2)
                {
                   
//                    IOWR_AVALONCONTROL_SET(MOTOR_4_BASE, -g_robot.its_action[temp].its_ball_action.dribbler);
										SPI_Master_ReadWrite_Byte(g_robot.its_action[temp].its_ball_action.dribbler, 0x04);
                    g_robot.current_state.task[1] = temp;

                    break;
                }
                else if(mode_temp == 1)
                {
                   
                    {
                        int i; 
                       
                             if (sqrt((g_robot.its_action[temp].robot_speed_x - g_robot.current_state.robot_speed_x) * (g_robot.its_action[temp].robot_speed_x - g_robot.current_state.robot_speed_x) 
                                    + (g_robot.its_action[temp].robot_speed_y - g_robot.current_state.robot_speed_y) * (g_robot.its_action[temp].robot_speed_y - g_robot.current_state.robot_speed_y)) > 0.01)
                            {
                                g_robot.current_state.robot_speed_x += 0.01 * (g_robot.its_action[temp].robot_speed_x - g_robot.current_state.robot_speed_x)
                                                                         / sqrt((g_robot.its_action[temp].robot_speed_x - g_robot.current_state.robot_speed_x) 
                                                                                * (g_robot.its_action[temp].robot_speed_x - g_robot.current_state.robot_speed_x) 
                                                                                + (g_robot.its_action[temp].robot_speed_y - g_robot.current_state.robot_speed_y) 
                                                                                * (g_robot.its_action[temp].robot_speed_y - g_robot.current_state.robot_speed_y));
                                g_robot.current_state.robot_speed_y += 0.01 * (g_robot.its_action[temp].robot_speed_y - g_robot.current_state.robot_speed_y) 
                                                                         / sqrt((g_robot.its_action[temp].robot_speed_x - g_robot.current_state.robot_speed_x) 
                                                                                * (g_robot.its_action[temp].robot_speed_x - g_robot.current_state.robot_speed_x) 
                                                                                + (g_robot.its_action[temp].robot_speed_y - g_robot.current_state.robot_speed_y) 
                                                                                * (g_robot.its_action[temp].robot_speed_y - g_robot.current_state.robot_speed_y));
                                g_robot.current_state.robot_speed_r += 0.01 * g_robot.its_action[temp].robot_speed_r
                                                                         / sqrt((g_robot.its_action[temp].robot_speed_x - g_robot.current_state.robot_speed_x) 
                                                                                * (g_robot.its_action[temp].robot_speed_x - g_robot.current_state.robot_speed_x) 
                                                                                + (g_robot.its_action[temp].robot_speed_y - g_robot.current_state.robot_speed_y) 
                                                                                * (g_robot.its_action[temp].robot_speed_y - g_robot.current_state.robot_speed_y));
                            }
                            else
                                {
                                    g_robot.current_state.robot_speed_x = g_robot.its_action[temp].robot_speed_x;
                                    g_robot.current_state.robot_speed_y = g_robot.its_action[temp].robot_speed_y;
                                    g_robot.current_state.robot_speed_r = g_robot.its_action[temp].robot_speed_r;
                                }

                        /* change wheels' speed set point */
                        for( i = 0; i < CHANNEL_NUM; i++ )
                        {
                            g_robot.wheels[ i ].set =V2N(g_robot.sin_angle[ i ] * g_robot.current_state.robot_speed_x
                                                        + g_robot.cos_angle[ i ] * g_robot.current_state.robot_speed_y
                                                        + g_robot.current_state.robot_speed_r);
                        }
                        for( i = 0; i < CHANNEL_NUM; i++ )
                        {
                            switch(i)
                            {
                                case 0: SPI_Master_ReadWrite_Byte(g_robot.wheels[ i ].set, 0x00); break;                      
                                case 1: SPI_Master_ReadWrite_Byte(g_robot.wheels[ i ].set, 0x01); break;                  
                                case 2: SPI_Master_ReadWrite_Byte(g_robot.wheels[ i ].set, 0x02); break;                  
                                case 3: SPI_Master_ReadWrite_Byte(g_robot.wheels[ i ].set, 0x03); break;                        
                                default:break;
                            }       
                        }   
                        
                     }
                     g_robot.current_state.task[0] = temp;
                     break;
                }
								else if(mode_temp == 0)
								{
									int i;
									for( i = 0; i < CHANNEL_NUM+1; i++ )
									{
											switch(i)
											{
													case 0: SPI_Master_ReadWrite_Byte(0, 0x00); break;                      
													case 1: SPI_Master_ReadWrite_Byte(0, 0x01); break;                  
													case 2: SPI_Master_ReadWrite_Byte(0, 0x02); break;                  
													case 3: SPI_Master_ReadWrite_Byte(0, 0x03); break; 
													case 4: SPI_Master_ReadWrite_Byte(0, 0x04); break;
													default:break;
											}       
									}   
									
								}
                
            }//g_robot.its_action[temp].mode == mode_temp
            
        }//for(temp = 15;temp >=0;temp--)
        
     }//for(mode_temp = 3;mode_temp >0;mode_temp--)
     for(temp = 15;temp >2; temp--)
     {
        if(g_robot.its_action[temp].end_ms_counter <= 0)
        {
            task_delete(temp);
        }
        else
            g_robot.its_action[temp].end_ms_counter--;
     }
 

}//task_update

void task_delete(int priority)
{
    //memset(&g_robot.its_action[priority], 0, sizeof(g_robot.its_action[priority]));//priority????????
    
    g_robot.its_action[priority].mode = 0;
}

void task_delete_all()
{
    memset(&g_robot.its_action[3], 0, 13*sizeof(g_robot.its_action[0]));
}
