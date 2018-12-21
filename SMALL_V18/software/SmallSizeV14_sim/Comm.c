#include "Comm.h"

packet_type_t type;                         //数据包类型
unsigned char packet_cnt=0;                 //收包数计数器  
unsigned char check_frq_start=0;
unsigned int check_frq_counter1=0;
unsigned int check_frq_counter2=0;

extern robot_t g_robot;
extern char packet_flag;
extern nRF2401 nRF2401_dev;
extern char receive_flag;
extern char g_set_receive_mode_flag;
extern char g_comm_up_finish_flag;
extern char g_comm_overflow_flag;

RFConfig g_default_nRF2401_conf = {
	15,
	ADDR_COUNT,
	DATA_LEN2*8,            			//Length of data payload section TX channel 2
	DATA_LEN1*8,                     	//Length of data payload section TX channel 1
	ADDR_CH2 ,                    		//Up to 5 byte address for TX channel 2
	ADDR_CH1 ,                       	//Up to 5 byte address for TX channel 1
	(((ADDR_LEN) << 2) + ((CRC_LEN) << 1) + (CRC_ENABLE)),   
	//Number of address bits (both TX channels),8 or 16 bit CRC,Enable on-chip CRC generation/checking
	//0x4f,                               //Enable two channel receive mode,Communication mode (Direct or ShockBurst?),RF data rate (1Mbps requires 16MHz crystal),Crystal frequency,RF output power
	(((RX2_EN) << 7) + ((CM) << 6) + ((RF_DATA_RATE) << 5) + ((XO_F) << 2) + (RF_PWR)) ,
	(((RF_CH) << 1) + 1)      			//Frequency channel,RX or TX operation

};


/*---------function headers----------*/
int do_comm_up();
int do_packet_process( unsigned char *data, int len );


/*----------------------------------------------------------------------------------------
 *  函数名称： init_comm
 *  函数描述： 通信模块初始化函数，初始化中首先将通信模块初始化为接受模式，并将初
 *             始化2401_dev的各个成员
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 *  备注:      关于2401初始化配置字各个位如何定义，参阅<<PTR4000>>关于配置字相关方面的介绍
 -----------------------------------------------------------------------------------------*/ 

int init_comm()
{
	//uchar *transfer_buf;

	//transfer_buf = (uchar *)malloc( sizeof(uchar) * nRF2401_BUFFER_LEN);

	//nRF2401_dev.buf.buf = transfer_buf;
	nRF2401_dev.buf.len = nRF2401_BUFFER_LEN;
	nRF2401_dev.buf.pos = 0;
	nRF2401_dev.get_packet = get_nRF2401_packet;
	nRF2401_dev.send_packet = send_nRF2401_packet;
	nRF2401_dev.init_dev = init_nRF2401_dev_rx;
	nRF2401_dev.packet_error = 0;
	nRF2401_dev.RFconf = g_default_nRF2401_conf;//后面在init_nRF2401_dev_rx中又重新写了一遍RFconf的值，有重复
	SetPowerUp(1);
	SetCE( 0 );
	SetCS( 1 );
	delay(1000);
	init_nRF2401_dev_rx();  

	set_receive_flag();

	return 0;
}


/*--------------------------------------------------------------------------------------------
 *  函数名称： do_comm
 *  函数描述： 通讯接受函数，首先判定是否收到通讯包，如果收到，将通讯包拷贝至g_comm.buffer中，
 *             进行解包，并上传一次数据
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 ---------------------------------------------------------------------------------------------*/ 

int do_comm()
{
	if(receive_flag==1){   
		if( ( nRF2401_dev.get_packet( &nRF2401_dev ) ) > 0 )//函数 nRF2401_dev.get_packet,如果收到包该函数将返回一个大于0的数据长度
		{

			receive_flag=0;  
			memcpy( g_comm.buffer, nRF2401_dev.buf.buf, nRF2401_dev.buf.pos );

			g_comm.buffer_pos = (unsigned char)nRF2401_dev.buf.pos;
                          
			do_comm_up();

			do_packet_process( g_comm.buffer, g_comm.buffer_pos ); 

			if(packet_cnt>254)
				packet_cnt = 0;
			else
				packet_cnt++;

		}
	}           //abao
	return 0;

}


/*-----------------------------------------------------------------------------
 *  函数名称： do_comm_up
 *  函数描述： 上传执行函数，根据全局变量type的数值来决定运用何种模式进行上传
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -------------------------------------------------------------------------------*/ 

int do_comm_up()
{
	short temp;
	int i;

	nRF2401_dev.buf.pos = PACKET_LEN_UP;

    static char data[7]={0,0,0,0,0,0,0};           //2011国内赛以前是依靠每次分配空间来进行data分配，现在直接给一段数组空间，每次更新

	/*----------------------------通常模式下的数据上传--------------------------------*/

	if(type==PACKET_Normal)                      //比赛时数据上传
	{
		  
			  /* ---------参见协议3.0比赛暂停时分帧返回包格式-----------*/
		if((((g_comm.buffer[3]&0x8)>>3)==1)||(((g_comm.buffer[7]&0x8)>>3)==1)||(((g_comm.buffer[11]&0x8)>>3)==1))//判断stop标志//test-lnc
		{
			temp=0;
            packet_flag=0;
            
			if(g_robot.num > 8)
			{
				if(((g_comm.buffer[1]&0x0f)&(0x01<<(g_robot.num-9)))==0)
				{   
				  temp=-1;
				}
			}
			else
			{
				if(((g_comm.buffer[2]&0xff)&(0x01<<(g_robot.num-1)))==0)	//判断包中三个车号里是否有自己的
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
						if(g_comm.buffer[2]&(0x01<<i))
							temp++;
					}
			    }
                else
			    {
			        for(i=0;i<8;i++)
				    {
				        if(g_comm.buffer[2]&(0x01<<i))
						    temp++; 
				    }
				    for(i=0;i<(g_robot.num-9);i++)
				    {
				        if((g_comm.buffer[1]&0x0f)&(0x01<<i))
					       temp++;
			        }
                }//将自己的车号在三辆中排序
			}
		
			if((temp!=-1)&&(((g_comm.buffer[3+4*temp]&0x8)>>3)==1))
			{
				stop_mode_packet(data);

				if(packet_flag==1)
				{   
					nRF2401_dev.buf.buf[0]=data[0];
					nRF2401_dev.buf.buf[1]=data[1];
					nRF2401_dev.buf.buf[2]=data[2]; 
					nRF2401_dev.buf.buf[3]=data[3];
					nRF2401_dev.buf.buf[4]=data[4];
					nRF2401_dev.buf.buf[5]=data[5]; 
					memset(&nRF2401_dev.buf.buf[6], 0, sizeof(unsigned char) * (PACKET_LEN_UP - 6));//后面的都赋值0
										  
					nRF2401_dev.send_packet( &nRF2401_dev );
				}
			}
			else 
			{
				//delay(1500);
				//set_a_bit_receive();
				//g_comm_up_finish_flag = 1;
			}
		}


			/*--------------参见协议0.2比赛时分帧返回包格式----------------------*/
		else
		{
			packet(data);
		    if(packet_flag == 1)
			{
				nRF2401_dev.buf.buf[0]=0xFF;	            
				nRF2401_dev.buf.buf[1]=0x02;	                
				nRF2401_dev.buf.buf[2]=data[2]; 
				nRF2401_dev.buf.buf[3]=data[3];
				nRF2401_dev.buf.buf[4]=data[4];
				nRF2401_dev.buf.buf[5]=data[5];
				memset(&nRF2401_dev.buf.buf[6], 0, sizeof(unsigned char) * (PACKET_LEN_UP - 6));			
				nRF2401_dev.send_packet( &nRF2401_dev );
			}
		}
	}
	
	/*----------------------------------频点测试模式上传-----------------------------------*/
	/*--------------------考虑到兼容与时序问题，将解包与上传均做在上传中-------------------*/
	else if(type==PACKET_DEBUG_Check_Frq)
	{
	    if(g_comm.buffer[0]==0xFF && g_comm.buffer[1]==0xCF)
		{
			if(g_comm.buffer[2]==0x0A && g_comm.buffer[3]==0x0B && g_comm.buffer[4]==0x0C)
			{
				check_frq_start=1;
				check_frq_counter1=0;
				check_frq_counter2=0;
				{
					int temp;
					
					nRF2401_dev.buf.buf[0]=0xFF; 
					nRF2401_dev.buf.buf[1]=0xCF;
					nRF2401_dev.buf.buf[2]=0xAA;
					nRF2401_dev.buf.buf[3]=0xAA;
					nRF2401_dev.buf.buf[4]=0xAA;
					memset(&nRF2401_dev.buf.buf[5], 0, sizeof(unsigned char) * (PACKET_LEN_UP - 5));			
					nRF2401_dev.send_packet( &nRF2401_dev );

					temp = g_comm.buffer[5];

					if(temp<=7)
						temp= (temp<<2);
					else
						temp=(temp<<2)+58;
					if(g_robot.frq != temp)
					{
						delay(1000);
                        g_robot.frq = temp;
						change_nRF2401_frq(g_robot.frq);
					}
				}
			}
			else if(check_frq_start == 1 && g_comm.buffer[2]==0xBB && g_comm.buffer[3]==0xBB && g_comm.buffer[4]==0xBB)
			{
				static int comm_count;

				check_frq_counter1++;

				/*count the right packet */
				comm_count++;
				if(comm_count<15)
				{
					led_on(1);
				}
				else 
				{
					led_off(1);
				}
				if(comm_count>30)
					comm_count=0;
				
			}
			else if(check_frq_start == 1 && g_comm.buffer[2]==0xAA && g_comm.buffer[3]==0xAA && g_comm.buffer[4]==0xAA)
			{
				check_frq_counter2++;
				nRF2401_dev.buf.buf[0] = 0xFF;
				nRF2401_dev.buf.buf[1] = 0xA7;
				nRF2401_dev.buf.buf[2] = 0x99;
				nRF2401_dev.buf.buf[3] = 0x88;
				nRF2401_dev.buf.buf[4] = 0x77;
				memset(&nRF2401_dev.buf.buf[5],0,sizeof(unsigned char) * 20);
				nRF2401_dev.send_packet( &nRF2401_dev );
			}
			else if(check_frq_start == 1 && g_comm.buffer[2]==0x0D && g_comm.buffer[3]==0x0E && g_comm.buffer[4]==0x0F)
			{
				unsigned int temp1;
				unsigned int temp2;
				unsigned int i1;
				unsigned int i2;
				unsigned char num;

				temp1=check_frq_counter1;
				i1=0;
				do{
					num=temp1%10;
					temp1=temp1/10;
					nRF2401_dev.buf.buf[2+i1]=num;
					i1++;
				}while(temp1 != 0);
				
				temp2=check_frq_counter2;
				i2=0;
				do{
					num=temp2%10;
					temp2=temp2/10;
					nRF2401_dev.buf.buf[3+i1+i2]=num;
					i2++;
				}while(temp2 != 0);
				
				nRF2401_dev.buf.buf[0]=0xFF; 
				nRF2401_dev.buf.buf[1]=0xCF;
				nRF2401_dev.buf.buf[2+i1]=0xDD;
				nRF2401_dev.buf.buf[3+i1+i2]=0xEE;
				memset(&nRF2401_dev.buf.buf[4+i1+i2], 0xa, sizeof(unsigned char) * (PACKET_LEN_UP - 4 - i1-i2));			
				nRF2401_dev.send_packet( &nRF2401_dev );


			}
			else if(check_frq_start == 1 && g_comm.buffer[2]==0xFF && g_comm.buffer[3]==0xFF && g_comm.buffer[4]==0xFF)
			{
				check_frq_start=0;
			}
		}
		g_comm_overflow_flag = 0;
	}
	
	g_comm_up_finish_flag = 1;//
	return 0;
}


/*-----------------------------------------------------------------------------------------
 *  函数名称： do_packet_process
 *  函数描述： 对接收到的数据data进行解包，根据不同的模式有不同的解包方式，对应有不同的解包函数
 *             具体的解包函数均位于Packet.c中
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -------------------------------------------------------------------------------------------*/ 
int do_packet_process( unsigned char *data, int len )
{   


	type = get_packet_type( data, len );
	
	
    /*----------------------------通常模式下的数据解包--------------------------------*/
	/*-----------------------参见协议0.1比赛时通讯包格式-----------------------------*/
	if(type == PACKET_Normal&& (g_robot.mode == NORMAL_MODE))
	{
		/* parse robot command */
		packet_robot_t packet;
		
		memset( &packet, 0, sizeof( packet ) );

		if( decode_packet_robot( &packet, data, len ) < 0 )
		{
			/* parse error */
			g_comm.packet_error++;

			return -1;
		}
		
		/* execute the command */
		on_robot_command( &packet );
	}
	
	return 0;

}


/*-----------------------------------------------------------------------------------------
 *  函数名称： is_comm_overflow
 *  函数描述： 通讯超时，什么都不做
 *
 *
 *  作者：     lyc
 *  修改日期： 2016-3-19
 -------------------------------------------------------------------------------------------*/ 

int is_comm_overflow()
{
	if(g_comm_overflow_flag)					//通讯超时，什么都不做。
	{
		g_comm_up_finish_flag = 1; 		//防止通讯中断，置位设置通讯为接收模块标志位
		do_dribbler(0);
		do_move(0,0,0);
		do_shoot(0,0);
		do_chip(0,0);
		
		#ifdef ENABLE_2401_RESTART
			rst_nRF2401();
		#else
			set_a_bit_receive(); 
		#endif
		
		g_comm_overflow_flag = 0;
	}

	return 0;
}


/*-----------------------------------------------------------------------------------------
 *  函数名称： comm_overflow
 *  函数描述： 将通讯设置为接收模式，并置位可接受标志位
 *
 *
 *  作者：     lyc
 *  修改日期： 2016-3-19
 -------------------------------------------------------------------------------------------*/ 
int set_receive_mode()
{
	if(g_set_receive_mode_flag == 1)
	{				
		set_a_bit_receive();
		g_set_receive_mode_flag = 0;
	}
	
	return 0;
}

