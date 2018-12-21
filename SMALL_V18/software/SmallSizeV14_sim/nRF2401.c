#include "nRF2401.h"

static unsigned int nRF2401_reg_io = 0;
static unsigned int nRF2401_reg_out = 0;
extern robot_t g_robot;
nRF2401 nRF2401_dev;
unsigned char g_2401_address_flag=0;
char receive_flag;


/*---------function headers----------*/
void Init2401Tx( RFConfig  );
void Init2401Rx( RFConfig  );
void Tra_Rf_Write( unsigned char b );
unsigned char Tra_Rf_Read( void );

int Tra_ReceivePacket( nRF2401 *dev );
unsigned char Tra_TransmitPacket( unsigned char *p_read,unsigned int data_len,RFConfig tconf);


void SetCLK1Dir(unsigned char val);  // 0 for input , 1 for output
void SetCLK1(unsigned char val);

void SetDATADir(unsigned char val);  // 0 for input , 1 for output
void Set_DATA(unsigned char val);
unsigned char GetDATA(void);
unsigned char GetDR1(void);

void set_config_mode(void);
void end_config_mode(void);
void set_a_bit_to(char txrx); 
void set_a_bit_receive(void);
void set_a_bit_trans(void);



/*-----------------------------------------------------------------
 *  函数名称： init_nRF2401_dev_rx
 *  函数描述： 2401模块的接收模式初始化
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 *  备注:      配置字的设定参照<<PTR4000>>文档
 -----------------------------------------------------------------*/ 
int init_nRF2401_dev_rx()
{
	//TODO :: Add initial nRF2401 device code here
	unsigned char temp;
	
	nRF2401_dev.RFconf.addr_count = NRF2401_ADDR_COUNT;
	nRF2401_dev.RFconf.buf[0] = PACKET_LEN * 8;
	nRF2401_dev.RFconf.buf[1] = PACKET_LEN * 8;

	nRF2401_dev.RFconf.buf[2] = NRF2401_CAR_4;
	nRF2401_dev.RFconf.buf[3] = NRF2401_CAR_3;
	nRF2401_dev.RFconf.buf[4] = NRF2401_CAR_2;
	nRF2401_dev.RFconf.buf[5] = NRF2401_CAR_1;
	nRF2401_dev.RFconf.buf[6] = NRF2401_CAR_0;

	nRF2401_dev.RFconf.buf[7] = NRF2401_ADDR1_4;
	nRF2401_dev.RFconf.buf[8] = NRF2401_ADDR1_3;
	nRF2401_dev.RFconf.buf[9] = NRF2401_ADDR1_2;
	nRF2401_dev.RFconf.buf[10] = NRF2401_ADDR1_1;
	nRF2401_dev.RFconf.buf[11] = NRF2401_ADDR1_0;

	temp = 0;
	
	temp = temp | (0x03);   //16bit CRC enable

	temp = temp + ((NRF2401_ADDR_COUNT * 8) << 2);
	nRF2401_dev.RFconf.buf[12] = temp;

	temp = g_robot.frq;
   
	temp = (temp << 1) + 1;//

	
	nRF2401_dev.RFconf.buf[14] = temp; // set nRF2401's RF frequency, and tx mode

	nRF2401_reg_io = 0;
	nRF2401_reg_out = 0;
	IOWR(PIO_NF2401_INOUT_BASE,1,1);

	Init2401Rx(nRF2401_dev.RFconf);

	return 0;
}


/*-----------------------------------------------------------------
 *  函数名称： init_nRF2401_dev_tx
 *  函数描述： 2401模块的发射模式初始化
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 *  备注:      配置字的设定参照<<PTR4000>>文档
 -----------------------------------------------------------------*/ 
int init_nRF2401_dev_tx()
{
	//TODO :: Add initial nRF2401 device code here
	unsigned char temp;
	
	nRF2401_dev.RFconf.addr_count = NRF2401_ADDR_COUNT;
	nRF2401_dev.RFconf.buf[0] = (PACKET_LEN_UP) * 8;
	nRF2401_dev.RFconf.buf[1] = (PACKET_LEN_UP) * 8;

	nRF2401_dev.RFconf.buf[2] = NRF2401_CAR_4;
	nRF2401_dev.RFconf.buf[3] = NRF2401_CAR_3;
	nRF2401_dev.RFconf.buf[4] = NRF2401_CAR_2;
	nRF2401_dev.RFconf.buf[5] = NRF2401_CAR_1;
	nRF2401_dev.RFconf.buf[6] = NRF2401_CAR_0;

	nRF2401_dev.RFconf.buf[7] = NRF2401_ADDR1_4;
	nRF2401_dev.RFconf.buf[8] = NRF2401_ADDR1_3;
	nRF2401_dev.RFconf.buf[9] = NRF2401_ADDR1_2;
	nRF2401_dev.RFconf.buf[10] = NRF2401_ADDR1_1;
	nRF2401_dev.RFconf.buf[11] = NRF2401_ADDR1_0;

	temp = 0;

	temp = temp | (0x03);   //16bit CRC enable

	temp = temp + ((NRF2401_ADDR_COUNT * 8) << 2);
	nRF2401_dev.RFconf.buf[12] = temp;

	temp = g_robot.frq; //+ 2; 
    
	temp = (temp << 1) + 0;       


	nRF2401_dev.RFconf.buf[14] = temp; // set nRF2401's RF frequency, and tx mode

	nRF2401_reg_io = 0;
  	nRF2401_reg_out = 0;

  	Init2401Tx(nRF2401_dev.RFconf);

	return 0;
}


/*----------------------------------------------------------------------------
 *  函数名称： get_nRF2401_packet
 *  函数描述： 从2401中获取一包数据， 与Tra_ReceivePacket功能完全相同
 *             直接调用了Tra_ReceivePacket函数，这样是为了与send_nRF2401_packet
 *             形式上统一
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 ----------------------------------------------------------------------------*/ 
int get_nRF2401_packet(nRF2401 *dev)
{
	//TODO :: Add get a packet from nRF2401 device code here

	return (Tra_ReceivePacket(dev));
}



/*-----------------------------------------------------------------
 *  函数名称： send_nRF2401_packet
 *  函数描述： 向2401模块发送一包数据，使其发送。函数中先将2401设置
 *             成为发送模式，再向2401发送数据使其发射数据
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
int send_nRF2401_packet(nRF2401 *dev)
{
	//TODO :: Add send a packet to nRF2401 device code here
	unsigned char r;
	set_a_bit_trans();

	r = Tra_TransmitPacket(dev->buf.buf,dev->buf.pos,dev->RFconf);

	receive_flag=0;
	return r;
}


/*-----------------------------------------------------------------
 *  函数名称：Init2401Tx( RFConfig tconf )
 *  函数描述：NRF2401发送端初始化
 *
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
-----------------------------------------------------------------*/ 
void Init2401Tx( RFConfig tconf )
{
	unsigned char i;

	SetPowerUp(1);
	SetCE( 0 );
	SetCS( 1 );
	delay(1);
	for( i = 0; i < tconf.n; i++ )
	{
		Tra_Rf_Write( tconf.buf[i] );
	}
	SetCS( 0 );
 	SetCE( 1 );
	delay(1);
}


/*-----------------------------------------------------------------
 *  函数名称：Init2401Rx( RFConfig rconf )
 *  函数描述：NRF2401接受端初始化
 *
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
-----------------------------------------------------------------*/ 
void Init2401Rx( RFConfig rconf )
{
	unsigned char i;

	SetPowerUp(1);
	SetCE( 0 );
	SetCS( 1 );
	delay(1);


	for( i = 0; i < rconf.n; i++ )
	{
		Tra_Rf_Write( rconf.buf[i] );
	}

	SetCS( 0 );
	SetCE( 1 );
	delay(1);

}


/*-----------------------------------------------------------------
 *  函数名称：void Tra_Rf_Write( unsigned char b )
 *  函数描述：向射频单元写数据//写一个字节
 *
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
-----------------------------------------------------------------*/ 
void Tra_Rf_Write( unsigned char b )
{
	unsigned char i;
	alt_irq_context context;

	SetCLK1Dir(1);
	SetDATADir(1);
	for( i = 0; i < 8; i++ )
	{
		context =  alt_irq_disable_all (); // We must make the transfer that don't be interrupted
    	SetCLK1( 0 );
		if( ( b & 0x80 ) == 0x00 )
			Set_DATA( 0 );
		else
			Set_DATA( 1 );
		b <<= 1;
		SetCLK1( 1 );
   		alt_irq_enable_all(context);
	}
	SetCLK1( 0 );
}


/*-------------------------------------------------------------------
 *	函数名：unsigned char Tra_Rf_Read(void)
 *	输入：无
 *	输出：接收数据
 *	功能描述：从射频端口读数据，//读一个字节
---------------------------------------------------------------------*/
unsigned char Tra_Rf_Read( void )
{
	unsigned char b;
	unsigned char i;
	unsigned temp;
  	alt_irq_context context;

	SetCLK1Dir(1);
	SetDATADir(0);
	b = 0;
	context =  alt_irq_disable_all ();	
	for( i = 0; i < 8; i++ )
	{	
    	b <<= 1;
		SetCLK1( 0 );
		SetCLK1( 1 );
		temp = GetDATA();
		if( temp == 1 )
		b += 0x01;
	}
	alt_irq_enable_all(context);
	SetCLK1( 0 );
	return b;
}



/*-----------------------------------------------------------------
 *  函数名称： Tra_ReceivePacket
 *  函数描述： 从2401模块中读取一个包
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
int Tra_ReceivePacket( nRF2401 *dev)//读一个包
{
	//unsigned char i;
	//SetCE(0);
	 
	dev->buf.pos=0;
	while ( GetDR1() )
	{ 
	// led_on( 0 );     //加在这里做标记 看一看读2401需要多少时间。
		dev->buf.buf[dev->buf.pos] = Tra_Rf_Read();
		dev->buf.pos++;
		if (dev->buf.pos == dev->buf.len)  //Though buffer is full, we MUST read the rest data 
		{
			dev->packet_error++;
			while ( GetDR1())
			{
				Tra_Rf_Read();
			}
			return -1;
		}
	}
	SetCE( 1 );
  //led_off( 0 );
  	if(dev->buf.pos>0) return 1;
	else  return 0;
}



/*-----------------------------------------------------------------
 *  函数名称： Tra_TransmitPacket
 *  函数描述： 向2401模块发送一段数据
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
unsigned char Tra_TransmitPacket( unsigned char *p_read,unsigned int data_len,RFConfig tconf)
{
	unsigned char k;

	SetCE( 1 );
	for( k = 0; k < tconf.addr_count; k++ )
	{
		Tra_Rf_Write(tconf.buf[12-tconf.addr_count+ k]+0x11);
	}

	for( k = 0; k < data_len ; k++ )
	{
		Tra_Rf_Write( p_read[k] );
	}
	SetCE(0);

	return k;
}


/*-----------------------------------------------------------------
 *  函数名称： SetCE
 *  函数描述： 根据输入的值对CE进行设置
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
void SetCE(unsigned char val)
{
  	if (val == 0)
		nRF2401_reg_out = nRF2401_reg_out & (~0x2);
	else 
		nRF2401_reg_out = nRF2401_reg_out | 0x2;
	
 	 IOWR(PIO_NF2401_OUT_BASE,0,nRF2401_reg_out);
	delay(0);
}




/*-----------------------------------------------------------------
 *  函数名称： SetCS
 *  函数描述： 根据输入的值对CS进行设置
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
void SetCS(unsigned char val)
{
  	if (val == 0)
		nRF2401_reg_out = nRF2401_reg_out & (~0x1);
  	else 
		nRF2401_reg_out = nRF2401_reg_out | 0x1;

	IOWR(PIO_NF2401_OUT_BASE,0,nRF2401_reg_out);
	delay(0);

}


/*-----------------------------------------------------------------
 *  函数名称： SetPowerUp
 *  函数描述： 根据输入的值对PWR进行设置
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/
void SetPowerUp(unsigned char val)
{
  	if (val == 0) 
		nRF2401_reg_out = nRF2401_reg_out & (~0x4);
  	else 
		nRF2401_reg_out = nRF2401_reg_out | 0x4;

	IOWR(PIO_NF2401_OUT_BASE,0,nRF2401_reg_out);

}



/*-----------------------------------------------------------------
 *  函数名称： SetCLK1Dir
 *  函数描述： 根据输入的值对CLK1的方向进行设置
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/
void SetCLK1Dir(unsigned char val)  // 0 for input , 1 for output
{
	
	unsigned int temp;
  
  	temp = IORD(PIO_NF2401_INOUT_BASE,1);
  	if (val == 0) 
		temp = temp & (~0x2);
	else 
		temp = temp | 0x2;
  	IOWR(PIO_NF2401_INOUT_BASE,1,temp);
 }


/*-----------------------------------------------------------------
 *  函数名称： SetCLK1
 *  函数描述： 根据输入的值对CLK1进行设置
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
void SetCLK1(unsigned char val)
{
	
  	if (val == 0) 
		nRF2401_reg_io = nRF2401_reg_io & (~0x2);
  	else 
		nRF2401_reg_io = nRF2401_reg_io | 0x2;
  	IOWR(PIO_NF2401_INOUT_BASE,0,nRF2401_reg_io);
	delay(0);

}


/*-----------------------------------------------------------------
 *  函数名称： SetDATADir
 *  函数描述： 根据输入的值对DATA的方向进行设置
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
void SetDATADir(unsigned char val)  // 0 for input , 1 for output
{
	
  	unsigned int temp;
  
  	temp = IORD(PIO_NF2401_INOUT_BASE,1);
  	if (val == 0) temp = temp & (~0x1);
  	else temp = temp | 0x1;
  	IOWR(PIO_NF2401_INOUT_BASE,1,temp);

}



/*-----------------------------------------------------------------
 *  函数名称： Set_DATA
 *  函数描述： 根据输入的值对DATA的值进行设置
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
void Set_DATA(unsigned char val)
{

  	if (val == 0) 
		nRF2401_reg_io = nRF2401_reg_io & (~0x1);
  	else 
		nRF2401_reg_io = nRF2401_reg_io | 0x1;
  	IOWR(PIO_NF2401_INOUT_BASE,0,nRF2401_reg_io);
	delay(0);
}



/*-----------------------------------------------------------------
 *  函数名称： GetDATA
 *  函数描述： 读取DATA的数值
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
unsigned char GetDATA(void)
{
  	unsigned int temp;
  
  	temp = IORD(PIO_NF2401_INOUT_BASE,0);
  	temp = temp & 0x1;
  	if ( temp == 0 ) return 0;
  	else return 1; 
}



/*-----------------------------------------------------------------
 *  函数名称： GetDR1
 *  函数描述： 读取DR1的数值，一般用来判定2401是否收到数据
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
unsigned char GetDR1(void)
{
  	unsigned int temp;
  
  	temp = IORD(PIO_NF2401_IN_BASE,0);
  	temp = temp & 0x1;
  
  	if ( temp == 0 ) return 0;
  	else return 1; 
}



/*-----------------------------------------------------------------
 *  函数名称： set_config_mode
 *  函数描述： 将2401设置成为配置模式
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
void set_config_mode()
{
	SetCE( 0);
	SetCS( 1);
	usleep(10);
}


/*-----------------------------------------------------------------
 *  函数名称： end_config_mode
 *  函数描述： 停止配置模式，将2401设置成为收发模式
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------------*/ 
void end_config_mode()
{
	SetCS(0);
	SetCE(1);
	usleep(300);			//加了这里的延时与第一版一致，有用吗
}


/*---------------------------------------------------------------------------------------------
 *  函数名称： set_a_bit_to
 *  函数描述： 2401的发送接收切换函数，根据输入的值确定切换为发送还是接收
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 *  备注:      当2401经过初始化的配置以后，通过改变一个字节就可以将2401于接收和发射模式之间转换
 *             具体转换方法以及协议，参阅<<PTR4000>>相关内容
 ---------------------------------------------------------------------------------------------*/ 
void set_a_bit_to(char txrx)  //耗时
{
	SetDATADir(1);
	set_config_mode();
	SetCLK1(0);
	Set_DATA( txrx);
	SetCLK1(1);
	SetCLK1(0);
	end_config_mode();
}



/*---------------------------------------------------------------------------------------------
 *  函数名称： set_a_bit_receive
 *  函数描述： 将2401切换成为接收模式
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 *  备注:      当2401经过初始化的配置以后，通过改变一个字节就可以将2401于接收和发射模式之间转换
 *             具体转换方法以及协议，参阅<<PTR4000>>相关内容
 ---------------------------------------------------------------------------------------------*/ 

void set_a_bit_receive()
{
	set_a_bit_to(NRF2401_RX);
	set_receive_flag();
}


/*----------------------------------------------------------------------------------------------
 *  函数名称： set_a_bit_trans
 *  函数描述： 将2401切换成为发射模式
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 *  备注:      当2401经过初始化的配置以后，通过改变一个字节就可以将2401于接收和发射模式之间转换
 *             具体转换方法以及协议，参阅<<PTR4000>>相关内容
 ----------------------------------------------------------------------------------------------*/ 

void set_a_bit_trans()
{
	set_a_bit_to(NRF2401_TX);
}



/*-----------------------------------------------------------
 *  函数名称： set_receive_flag
 *  函数描述： 将可接收标志位置位
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -------------------------------------------------------------*/ 
void set_receive_flag()
{
	receive_flag=1;
}


/*-----------------------------------------------------------
 *  函数名称： rst_nRF2401
 *  函数描述： 重启2401
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -------------------------------------------------------------*/ 
void rst_nRF2401()
{
	nRF2401_reg_io = 0;
  	nRF2401_reg_out = 0;
   	IOWR(PIO_NF2401_INOUT_BASE,1,1);

  	Init2401Tx(nRF2401_dev.RFconf);
}



/*-----------------------------------------------------------------
 *  函数名称： change_nRF2401_frq
 *  函数描述： 2401模块频点更改
 *  
 *
 *
 *  作者：     李川
 *  修改日期： 2013-4-7
 *  备注:      配置字的设定参照<<PTR4000>>文档
 -----------------------------------------------------------------*/ 
void change_nRF2401_frq(unsigned char frq)
{
    
	frq = (frq<< 1) + 1;       


	nRF2401_dev.RFconf.buf[14] = frq; // set nRF2401's RF frequency, and tx mode

	nRF2401_reg_io = 0;
  	nRF2401_reg_out = 0;
    IOWR(PIO_NF2401_INOUT_BASE,1,1);

  	Init2401Tx(nRF2401_dev.RFconf);
}

