#include "packet.h"
#include "sys.h"
#include "robot.h"
#include "stdio.h"
#include "string.h"
#include "led.h"

#define max_shot_strength_set 150
extern robot_t g_robot;
u8 packet_flag;


int decode_packet_robot( packet_robot_t *packet, u8 *data, int len )
{
	unsigned short temp = 0;
	unsigned char  i=0;  
  int a = 0;
	unsigned short high_value_x;
	unsigned short high_value_y;
	unsigned short high_value_r;
	
	if( packet == NULL || data == NULL)
		return -1; 
	if(((data[1]&0xF0)>>4)==g_robot.num)
		a = 1;
	else if((data[1]&0x0F)==g_robot.num)
		a = 2;
	else if(((data[2]&0xF0)>>4)==g_robot.num)
		a = 3;
	else if((data[2]&0x0F)==g_robot.num)
		a = 4;
	if(a==0)
	{
		return -1;
	}
//    g_comm_overflow = 0;			//
//    g_comm_overflow_flag = 0;

	
  packet->robot_num = g_robot.num;
	i = a*4-1;
	
	switch (a)
	{
	 	case 1:
		{
			temp=data[ i ];
			packet->dribbler = ((( temp >> 4 ) & 0x03));	
			packet->dribbler = ( ( temp & 0x80) ? (-packet->dribbler) : packet->dribbler);
			temp= data[ i+20 ];
			if( ( data[ i ] >> 6 ) & 0x1 )
			{
	        if(temp == 127 )
					packet->chip = max_shot_strength_set;
			    else
					packet->chip= temp;
	
			}

			else
			{   	
				if(temp == 127 )
					packet->shoot = max_shot_strength_set;
				else
					packet->shoot= temp;
			}					
			
			temp = data[ i+1 ];
			packet->speed_x = temp & 0x7F;
			high_value_x = (unsigned short)data[19];
			high_value_x = ((unsigned short)(high_value_x & 0xc0)) << 1;
			packet->speed_x = packet->speed_x+high_value_x;
			temp = data[ i+1 ];
			packet->speed_x = ( ( temp & 0x80 ) ? ( -packet->speed_x ) : packet->speed_x );
				 
			temp = data[ i+2 ];
			packet->speed_y = temp & 0x7F;
		  high_value_y = (unsigned short)data[19];
			high_value_y = ((unsigned short)(high_value_y & 0x30)) << 3;
			packet->speed_y = packet->speed_y+high_value_y;
			temp = data[ i+2 ];
			packet->speed_y = ( ( temp & 0x80 ) ? ( -packet->speed_y ) : packet->speed_y );
				 
			temp = data[i+3];
			packet->speed_rot = temp & 0x7F;
			high_value_r = (unsigned short)data[19];
		 	high_value_r = ((unsigned short)(high_value_r & 0x0F)) << 7;
			packet->speed_rot = packet->speed_rot+high_value_r;
			temp = data[ i+3 ];
			packet->speed_rot = ( ( temp & 0x80 ) ? ( -packet->speed_rot ) : packet->speed_rot );
			   
		}break;



	  case 2:
		{
			temp=data[ i ];
			packet->dribbler = ((( temp >> 4 ) & 0x03));
			packet->dribbler = ( ( temp & 0x80) ? (-packet->dribbler) : packet->dribbler);
			temp= data[ i+17 ];
			if( ( data[ i ] >> 6 ) & 0x1 )
			{
	    		if(temp == 127 )
					packet->chip = max_shot_strength_set;
				else
					packet->chip= temp;
			}

			else
			{
				if(temp == 127 )
					packet->shoot = max_shot_strength_set;
				else
					packet->shoot= temp;
			}

			temp = data[ i+1 ];
			packet->speed_x = temp & 0x7F;
			temp = (data[20]&0xc0)<<1;
			packet->speed_x = packet->speed_x+temp;
			temp = data[ i+1 ];
			packet->speed_x = ( ( temp & 0x80 ) ? ( -packet->speed_x ) : packet->speed_x );
				 
			temp = data[ i+2 ];
			packet->speed_y = temp & 0x7F;
			temp = (data[20]&0x30)<<3;
			packet->speed_y = packet->speed_y+temp;
			temp = data[ i+2 ];
			packet->speed_y = ( ( temp & 0x80 ) ? ( -packet->speed_y ) : packet->speed_y );
				 
			temp = data[i+3];
			packet->speed_rot = temp & 0x7F;
			temp = (data[20]&0x0F)<<7;
			packet->speed_rot = packet->speed_rot+temp;
			temp = data[ i+3 ];
			packet->speed_rot = ( ( temp & 0x80 ) ? ( -packet->speed_rot ) : packet->speed_rot );			 
		}break;


		case 3:
		{
			temp=data[ i ];
			packet->dribbler = ((( temp >> 4 ) & 0x03));
			packet->dribbler = ( ( temp & 0x80) ? (-packet->dribbler) : packet->dribbler);
			temp= data[ i+14 ];
			if( ( data[ i ] >> 6 ) & 0x1 )
			{
	        if(temp == 127 )
					packet->chip = max_shot_strength_set;
					else
					packet->chip= temp;
			}
			else
			{   
				if(temp == 127 )
					packet->shoot = max_shot_strength_set;
				else
					packet->shoot= temp;
			}
			
			temp = data[ i+1 ];
			packet->speed_x = temp & 0x7F;
			temp = (data[21]&0xc0)<<1;
			packet->speed_x = packet->speed_x+temp;
			temp = data[ i+1 ];
			packet->speed_x = ( ( temp & 0x80 ) ? ( -packet->speed_x ) : packet->speed_x );
			   
			temp = data[ i+2 ];
			packet->speed_y = temp & 0x7F;
			temp = (data[21]&0x30)<<3;
			packet->speed_y = packet->speed_y+temp;
			temp = data[ i+2 ];
			packet->speed_y = ( ( temp & 0x80 ) ? ( -packet->speed_y ) : packet->speed_y );
			   
			temp = data[i+3];
			packet->speed_rot = temp & 0x7F;
			temp = (data[21]&0x0F)<<7;
			packet->speed_rot = packet->speed_rot+temp;
			temp = data[ i+3 ];
			packet->speed_rot = ( ( temp & 0x80 ) ? ( -packet->speed_rot ) : packet->speed_rot );
	
	
		}break;
		
		case 4:
		{
			temp=data[ i ];
			packet->dribbler = ((( temp >> 4 ) & 0x03));
			packet->dribbler = ( ( temp & 0x80) ? (-packet->dribbler) : packet->dribbler);
			temp= data[ i+11 ];
			if( ( data[ i ] >> 6 ) & 0x1 )
			{
	        if(temp == 127 )
					packet->chip = max_shot_strength_set;
					else
					packet->chip= temp;
			}
			else
			{   
				if(temp == 127 )
					packet->shoot = max_shot_strength_set;
				else
					packet->shoot= temp;
			}
			
			temp = data[ i+1 ];
			packet->speed_x = temp & 0x7F;
			temp = (data[22]&0xc0)<<1;
			packet->speed_x = packet->speed_x+temp;
			temp = data[ i+1 ];
			packet->speed_x = ( ( temp & 0x80 ) ? ( -packet->speed_x ) : packet->speed_x );
			   
			temp = data[ i+2 ];
			packet->speed_y = temp & 0x7F;
			temp = (data[22]&0x30)<<3;
			packet->speed_y = packet->speed_y+temp;
			temp = data[ i+2 ];
			packet->speed_y = ( ( temp & 0x80 ) ? ( -packet->speed_y ) : packet->speed_y );
			   
			temp = data[i+3];
			packet->speed_rot = temp & 0x7F;
			temp = (data[22]&0x0F)<<7;
			packet->speed_rot = packet->speed_rot+temp;
			temp = data[ i+3 ];
			packet->speed_rot = ( ( temp & 0x80 ) ? ( -packet->speed_rot ) : packet->speed_rot );
	
	
		}break;

		default: 
		break;

	}

/*	if(packet->shoot == max_shot_strength_set || packet->shoot >= 120) last_beep = 1; //??	*/
	
	return 0;
}

int packet(char *q)
{
		q[0]=0xff;
    q[1]=0x02;
    q[2]=g_robot.num&0x0F;
		q[3]=0x01;    //q[3]=(now_infra<<6)+(finish_shoot<<5)+(finish_chip<<4);
		q[4]=0x02;
		q[5]=0x03;
		packet_flag=1;
		return 0;
}

int stop_mode_packet(char *q)
{
	q[0]=0xff;
	q[1]=0x01;
	q[2]=g_robot.num&0x0f;
	q[3]=0x01;
	q[4]=0x02;
	q[5]=0x03;
	packet_flag=1;
	return 0;
}

packet_type_t get_packet_type( unsigned char* data, int len )
{
	/* check run-time mode */
	u8 temp;
	temp = data[0];
	temp = temp & 0xC0;
	temp = temp >> 6;
	switch(temp)
	{
		case 0: 
			return _2018_Protocol;
		
		case 1:
			return Legacy_Protocol;
		
		case 3:
			return Frequency_Test;

		default:
			return PACKET_NONE;                    	//
	}
}

