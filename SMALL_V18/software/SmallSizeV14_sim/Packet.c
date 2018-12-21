#include "Packet.h"

char packet_flag;
extern robot_t g_robot;
extern unsigned char g_power;
extern int ADvalue;
extern unsigned int g_comm_overflow;			//收到自己的数据，通讯溢出清零。
extern char g_comm_overflow_flag;
extern int max_shot_strength_set;
extern char shooter;
extern int dribbler_speed_max_set;
extern unsigned char last_beep;




/*-----------------------------------------------------------------------------
 *  函数名称： stop_mode_packet
 *  函数描述： 接收到stop标志位，进行另一种协议的回包
 *-------------参见协议0.3比赛暂停时分帧返回包格式-----------*
 *  作者：     不详
 *  修改者:	李宁璨
 *  修改日期： 2012-12-3
 -------------------------------------------------------------------------------*/ 
int stop_mode_packet(char *q)
{
	q[0]=0xff;
	q[1]=0x01;
	q[2]=g_robot.num&0x0f;
	g_power=(IORD(ADGETNEW2_0_BASE,0)&0x00ff);
	if(g_power==0xFF)
	{
		g_power=0xFE;
	}
	q[3]=g_power;
	ADvalue=(IORD(ADGETNEW2_0_BASE,1)&0x00ff);
	if(ADvalue==0xFF)
	{
		ADvalue=0xFE;
	}
	q[4]=ADvalue;
	q[5]=(is_infra_broken()<<7);//这里只做了红外标志一位，别的还有待添加
	packet_flag=1;
	return 0;
}


/*-----------------------------------------------------------------------------
 *  函数名称： packet
 *  函数描述： 打包函数，将所需返回上位机的信息打包，
 		并检测是否有状态变化(平射、挑射、红外有一种变化)，
 		当发生状态变化时，置位上传标志 packet_flag
 *-------------参见协议0.2比赛时分帧返回包格式-----------*
 *  作者：     不详
 *  修改者:	  李川
 *  修改日期： 2014-5-22
 -------------------------------------------------------------------------------*/ 
int packet(char *q)
{
	static int last_infra = 0;
	static int now_infra = 0;

	static int to_shoot = 0;
	static int to_chip = 0;

	static int finish_shoot = 0;
	static int finish_chip = 0;

	static int m = 0;
	static int n = 5;

    now_infra=is_ball_detected();
	
	if(shooter==0x02)
	{
	    to_shoot = 1;
		shooter = 0x00;
	}
        
	if(shooter==0x01)
	{
		to_chip=1;
    	shooter = 0x00;
	}
	
    if(now_infra == 0)
    {
        if(to_shoot == 1)
        {
            finish_shoot = 1;
            to_shoot = 0;
			n=0;
			m++;
			packet_flag = 1;
        }
		
        if(to_chip == 1)
        {
            finish_chip = 1;
            to_chip = 0;
			n=0;
			m++;
			packet_flag = 1;
        }    
    }
    
	if(n >= 5)   	
	{
		if(finish_shoot == 1)
			finish_shoot = 0;
		
		if(finish_chip == 1)
			finish_chip = 0;
		
		if((last_infra != now_infra))
		{
			n=1;
			m++;
			packet_flag = 1;
		}
		else
			packet_flag = 0;
	}			
	else
	{
		n++;
		packet_flag=1;
	}

	if(m==127)
	{	
		m=0;
	}

	q[0]=0xff;
    q[1]=0x02;
    q[2]=g_robot.num&0x0F;
	q[3]=(now_infra<<6)+(finish_shoot<<5)+(finish_chip<<4);
	q[4]=m;
	q[5]=n;

	last_infra = now_infra;

	return 0;

}



/*-----------------------------------------------------------------------------
 *  函数名称： get_packet_type
 *  函数描述：获取包的模式，便于之后解包
 *  作者：     不详
 *  修改者:	李宁璨
 *  修改日期： 2012-12-3
 -------------------------------------------------------------------------------*/ 
packet_type_t get_packet_type( unsigned char* data, int len )
{
	/* check run-time mode */
	volatile unsigned char temp;
	temp = data[1];
	temp = temp & 0xF0;
	temp = temp >> 4;
	
	switch(temp){
		case DEBUG_FUNCTION_Normal:                  	//比赛模式
			return PACKET_Normal;

		case DEBUG_FUNCTION_Set_9557_error:
			return PACKET_DEBUG_Set_9557_error; 

		default:
			return PACKET_NONE;                    	//错误数据包
	}
}

/*-----------------------------------------------------------------------------
 *  函数名称： decode_packet_robot
 *  函数描述： 给对应车号的小车传递运动参数
 *  作者：     不详
 *  修改者:	李宁璨
 *  修改日期： 2012-11-24
 -------------------------------------------------------------------------------*/ 
int decode_packet_robot( packet_robot_t *packet, unsigned char *data, int len )
{
	unsigned short temp = 0;
	unsigned char  i=0;  
  
	if( packet == NULL || data == NULL)
		return -1; 

    if(g_robot.num > 8)
    {
	    if(((data[1]&0x0f)&(0x01<<(g_robot.num-9)))==0)
	    {
		    return  -1;  	
	    }
    }
    else
    {
 	    if(((data[2]&0xff)&(0x01<<(g_robot.num-1)))==0)  //判断数据区是否有自己的数据
	    { 
	      	return  -1;  	
	    }
    }

    g_comm_overflow = 0;			//收到自己的数据，通讯溢出清零。
    g_comm_overflow_flag = 0;
    temp=0;
  
    if(g_robot.num < 9)
    {
	    for(i=0;i<(g_robot.num-1);i++)
	  	{
	  	    if(data[2]&(0x01<<i))
		    temp++;
		 }
    }
    else
    {
 	    for(i=0;i<8;i++)
	  	{
	  	 	if(data[2]&(0x01<<i))
		 	temp++;	
		}
        for(i=0;i<(g_robot.num-9);i++)
    	{
        	if((data[1]&0x0f)&(0x01<<i))
        	temp++;
     	}
  	}
  	i=temp*4+3;                           //数据起始处
	
 
  	packet->robot_num = g_robot.num;


	switch (temp)
	{
	   	case 0:
		{	
			temp=data[ i ];
			packet->dribbler = ((( temp >> 4 ) & 0x03));	
			packet->dribbler = ( ( temp & 0x80) ? (-packet->dribbler) : packet->dribbler);
			temp= data[ i+15 ];
			if( ( data[ i ] >> 6 ) & 0x1 )//挑射
			{
	        	if(temp == 127 )
					packet->chip = max_shot_strength_set;
			    else
					packet->chip= temp;
	
			}

			else//平射
			{   	
				if(temp == 127 )
					packet->shoot = max_shot_strength_set;
				else
					packet->shoot= temp;
			}					
			
			temp = data[ i+1 ];
			packet->speed_x = temp & 0x7F;
			unsigned short high_value_x = (unsigned short)data[15];
			high_value_x = ((unsigned short)(high_value_x & 0xc0)) << 1;
			packet->speed_x = packet->speed_x+high_value_x;
			temp = data[ i+1 ];
			packet->speed_x = ( ( temp & 0x80 ) ? ( -packet->speed_x ) : packet->speed_x );
				 
			temp = data[ i+2 ];
			packet->speed_y = temp & 0x7F;
			unsigned short high_value_y = (unsigned short)data[15];
			high_value_y = ((unsigned short)(high_value_y & 0x30)) << 3;
			packet->speed_y = packet->speed_y+high_value_y;
			temp = data[ i+2 ];
			packet->speed_y = ( ( temp & 0x80 ) ? ( -packet->speed_y ) : packet->speed_y );
				 
			temp = data[i+3];
			packet->speed_rot = temp & 0x7F;
			unsigned short high_value_r = (unsigned short)data[15];
		 	high_value_r = ((unsigned short)(high_value_r & 0x0c)) << 5;
			packet->speed_rot = packet->speed_rot+high_value_r;

			temp = data[ i+3 ];
			packet->speed_rot = ( ( temp & 0x80 ) ? ( -packet->speed_rot ) : packet->speed_rot );
			   
		}break;



	   	case 1:
		{
			temp=data[ i ];
			packet->dribbler = ((( temp >> 4 ) & 0x03));
			packet->dribbler = ( ( temp & 0x80) ? (-packet->dribbler) : packet->dribbler);
			temp= data[ i+12 ];
			if( ( data[ i ] >> 6 ) & 0x1 )//tiao she
			{
	    		if(temp == 127 )
					packet->chip = max_shot_strength_set;
				else
					packet->chip= temp;
	
			}

			else//ping she
			{
				if(temp == 127 )
					packet->shoot = max_shot_strength_set;
				else
					packet->shoot= temp;

			}

			temp = data[ i+1 ];
			packet->speed_x = temp & 0x7F;
			temp = (data[16]&0xc0)<<1;
			packet->speed_x = packet->speed_x+temp;
			temp = data[ i+1 ];
			packet->speed_x = ( ( temp & 0x80 ) ? ( -packet->speed_x ) : packet->speed_x );
				 
			temp = data[ i+2 ];
			packet->speed_y = temp & 0x7F;
			temp = (data[16]&0x30)<<3;
			packet->speed_y = packet->speed_y+temp;
			temp = data[ i+2 ];
			packet->speed_y = ( ( temp & 0x80 ) ? ( -packet->speed_y ) : packet->speed_y );
				 
			temp = data[i+3];
			packet->speed_rot = temp & 0x7F;
			temp = (data[16]&0x0c)<<5;
			packet->speed_rot = packet->speed_rot+temp;
			temp = data[ i+3 ];
			packet->speed_rot = ( ( temp & 0x80 ) ? ( -packet->speed_rot ) : packet->speed_rot );			 
		}break;


		case 2:
		{
			temp=data[ i ];
			packet->dribbler = ((( temp >> 4 ) & 0x03));
			packet->dribbler = ( ( temp & 0x80) ? (-packet->dribbler) : packet->dribbler);
			temp= data[ i+9 ];
			if( ( data[ i ] >> 6 ) & 0x1 )//tiao she
			{
	          	if(temp == 127 )
					packet->chip = max_shot_strength_set;
				else
					packet->chip= temp;
	
			}
			else//ping she
			{   
				if(temp == 127 )
					packet->shoot = max_shot_strength_set;
				else
					packet->shoot= temp;

			}
			
			temp = data[ i+1 ];
			packet->speed_x = temp & 0x7F;
			temp = (data[17]&0xc0)<<1;
			packet->speed_x = packet->speed_x+temp;
			temp = data[ i+1 ];
			packet->speed_x = ( ( temp & 0x80 ) ? ( -packet->speed_x ) : packet->speed_x );
			   
			temp = data[ i+2 ];
			packet->speed_y = temp & 0x7F;
			temp = (data[17]&0x30)<<3;
			packet->speed_y = packet->speed_y+temp;
			temp = data[ i+2 ];
			packet->speed_y = ( ( temp & 0x80 ) ? ( -packet->speed_y ) : packet->speed_y );
			   
			temp = data[i+3];
			packet->speed_rot = temp & 0x7F;
			temp = (data[17]&0x0c)<<5;
			packet->speed_rot = packet->speed_rot+temp;
			temp = data[ i+3 ];
			packet->speed_rot = ( ( temp & 0x80 ) ? ( -packet->speed_rot ) : packet->speed_rot );
	
	
		}break;


		default: 

		break;

	}

/*	if(packet->shoot == max_shot_strength_set || packet->shoot >= 120) last_beep = 1; //浪射	*/
	
	return 0;
}


