#include "Comm.h"
#include "packet.h"
#include "robot.h"
#include "delay.h"

packet_type_t type;  
extern u8 packet_flag;
extern uint8_t tmp_buf[PACKET_LENGTH];
u8 g_comm[32] = {0};
robot_t g_robot;

int do_comm()
{
	u8 i=0;
	for(i=0;i<PACKET_LENGTH;i++)
	{
		g_comm[i] = tmp_buf[i];
	}
//	do_comm_up();
	do_packet_process(g_comm,PACKET_LENGTH);
	return 0;
}

int do_comm_up()
{
	int i;
	char data[7]={0,0,0,0,0,0,0};
	u8 cnt = 0;
	int temp;
	
//	NRF24L01_TX_Mode();
	if((((g_comm[3]&0x8)>>3)==1)||(((g_comm[7]&0x8)>>3)==1)||(((g_comm[11]&0x8)>>3)==1))
	{
			temp=0;
      packet_flag=0;
            
			if(g_robot.num > 8)
			{
				if(((g_comm[1]&0x0f)&(0x01<<(g_robot.num-9)))==0)
				{   
				  temp=-1;
				}
			}
			else
			{
				if(((g_comm[2]&0xff)&(0x01<<(g_robot.num-1)))==0)	
				{ 
				  temp=-1;
				}
			}
		
			if(temp!=-1)
			{
          temp=0;
		      if(g_robot.num < 9)
			    {
				    for(i=0;i<(g_robot.num-1);i++)
						{
							if(g_comm[2]&(0x01<<i))
								temp++;
						}
			    }
          else
			    {
			      for(i=0;i<8;i++)
				    {
				        if(g_comm[2]&(0x01<<i))
									temp++; 
				    }
				    for(i=0;i<(g_robot.num-9);i++)
				    {
				        if((g_comm[1]&0x0f)&(0x01<<i))
									temp++;
			      }
           }
			}
		
			if((temp!=-1)&&(((g_comm[3+4*temp]&0x8)>>3)==1))
			{
				stop_mode_packet(data);

				if(packet_flag==1)
				{   
					tmp_buf[0]=data[0];
					tmp_buf[1]=data[1];
					tmp_buf[2]=data[2]; 
					tmp_buf[3]=data[3];
					tmp_buf[4]=data[4];
					tmp_buf[5]=data[5]; 
//					memset(&nRF2401_dev.buf.buf[6], 0, sizeof(unsigned char) * (PACKET_LEN_UP - 6));
					for(cnt = 6;cnt<33;cnt++)
					tmp_buf[cnt] = 0;
					delay_ms(100);
//					NRF24L01_1_TxPacket(tmp_buf, 6 );
				}
			}
			else;
	}
	else
	{
				packet(data);
		    if(packet_flag == 1)
				{
				tmp_buf[0]=0xFF;	            
				tmp_buf[1]=0x02;	                
				tmp_buf[2]=data[2]; 
				tmp_buf[3]=data[3];
				tmp_buf[4]=data[4];
				tmp_buf[5]=data[5]; 
//				memset(&nRF2401_dev.buf.buf[6], 0, sizeof(unsigned char) * (PACKET_LEN_UP - 6));	
				for(cnt = 6;cnt<33;cnt++)
					tmp_buf[cnt] = 0;
				delay_ms(100);
//				NRF24L01_1_TxPacket(tmp_buf, 6 );
				}
	}
	return 0;
}


int do_packet_process(u8 *data, int len)
{
	type = get_packet_type(data, len);

//	if(type == Legacy_Protocol&& (g_robot.mode == NORMAL_MODE))
	{
		packet_robot_t packet;		// packet变量的作用域一直到把速度值发给fpga为止
		
		memset( &packet, 0, sizeof( packet ) );
		
		if( decode_packet_robot( &packet, data, len ) < 0 )
		{
			//g_comm.packet_error++;
			return -1;
		}
		
		on_robot_command( &packet );
	}
	return 0;
}

