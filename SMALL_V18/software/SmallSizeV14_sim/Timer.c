#include "Timer.h"


#define HEARTBEAT_COUNTER_OVERFLOW TICKFREQ
#define COMM_COUNTER_OVERFLOW 500
#define POWERMON_COUNTER_OVERFLOW 1000
#define SHOOT_COUNTER_OVERFLOW 40
#define BUZZER_COUNTER_OVERFLOW 1000



unsigned int g_comm_overflow = 0;
char g_comm_overflow_flag = 0;
char heart_beat_flag = 0;
int heartbeat_counter = 0;
char g_powermon_flag = 0;
int powermon_counter = 0;
char forcestop_counter=0;
char g_comm_up_finish_flag = 0;
int g_comm_up_finish_count = 0;
char g_set_receive_mode_flag = 0;
char g_updata_shooter_flag = 0;
char g_read_shoot_flag = 0;
int  shoot_count = 0;
char g_buzzer_flag = 0;
int  g_buzzer_count = 0;

unsigned char offline_test_check_flag = 1;
int  offline_test_counter = 0;




/* do_timer interrupt handler should be configured to be triggerred every 1ms. */
void do_timer( void * context, alt_u32 id )
{
    
  // clear the irq flag
    IOWR(TIMER_0_BASE,0,0); 

	if(!offline_test_check_flag)
	{
		offline_test_counter ++;
		if(offline_test_counter > 100)
			offline_test_check_flag =1;
	}
	
#ifdef ENABLE_SHOOTER
		/* update motor encoders */
		g_updata_shooter_flag = 1;
				
#endif

#ifdef ENABLE_POWERMON
		/* to make the robot alive */
	  powermon_counter++;
	  if( powermon_counter >= POWERMON_COUNTER_OVERFLOW )
	  {
	    powermon_counter = 0;
	    g_powermon_flag=1;
		if(forcestop_counter<LOWPOWERTIME)forcestop_counter++;
	  }
#endif

#ifdef ENABLE_HEARTBEAT
		/* to make the robot alive */
	  heartbeat_counter++;
	  if( heartbeat_counter >= HEARTBEAT_COUNTER_OVERFLOW )
	  {
	    heartbeat_counter = 0;
	    heart_beat_flag=1;
	  }
#endif

#ifdef ENABLE_SHOOT_COUNT
	  shoot_count++;
	  if(shoot_count >= SHOOT_COUNTER_OVERFLOW)
	  {
	  	shoot_count = 0;
		g_read_shoot_flag = 1;
	  }
#endif
    
	if(g_comm_up_finish_flag)     
	{
		g_comm_up_finish_count++;
		if(g_comm_up_finish_count >= 3){
			g_comm_up_finish_flag = 0;
			g_comm_up_finish_count = 0;
			g_set_receive_mode_flag = 1; 
		}
	}

	if(g_comm_overflow > COMM_COUNTER_OVERFLOW)
	{
		g_comm_overflow_flag = 1;
		g_comm_overflow = 0;
	}
	else
	{
		g_comm_overflow++;
	}

	if(g_buzzer_flag > 0)
	{
		g_buzzer_count++;
		if(g_buzzer_count >= BUZZER_COUNTER_OVERFLOW)
		{
			g_buzzer_flag = 0;
			g_buzzer_count = 0;
		}
	}

		
}


