#include "Flash.h"

/*---------function headers----------*/

//IIC pin configuration
//Change these functions if pin configuration is changed.
void	I2C_SDA_WR(unsigned char v);
int		I2C_SDA_RD(void);
void	I2C_SCK_WR(unsigned char v);
void 	I2C_DIR(unsigned char v);	//0 : input, 1:output
// End of IIC pin configuration

int 	 	I2C_Start(void);
void	 	I2C_Stop(void);
void	 	I2C_Ack(void);
void		I2C_Nack(void);
int   		I2C_Send_Byte( unsigned char);
unsigned char I2C_Receive_Byte(void);



/*----------------------------------------------------------
 *  函数名称： I2C_SDA_WR
 *  函数描述： 对EEROM SDA口进行写操作
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 ----------------------------------------------------------*/ 
void I2C_SDA_WR(unsigned char v)
{
	  //IOWR(PIO_IO_BASE,1,0x3);
	  IOWR(PIO_SDA_24_BASE, 1, 1);
	  
		if( v )
	  {
		   //iic_reg = iic_reg | 0x1;
	     IOWR(PIO_SDA_24_BASE,0,1);
	  }
		else
	  {
	     //iic_reg = iic_reg & (~0x1);
	     IOWR(PIO_SDA_24_BASE,0,0); 
	  }
}


/*-----------------------------------------------------------
 *  函数名称： I2C_SDA_RD
 *  函数描述： 对EEROM SDA口进行读操作
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -----------------------------------------------------------*/ 
int I2C_SDA_RD(void)
{
	unsigned int temp;

	IOWR(PIO_SDA_24_BASE,1,0x0);
	temp = IORD(PIO_SDA_24_BASE,0);
	if( temp & 0x1 )
		return 1;
	else
		return 0;
}


/*------------------------------------------------------------
 *  函数名称： I2C_SCK_WR
 *  函数描述： 对EEROM SCK口进行写操作
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -------------------------------------------------------------*/ 
void I2C_SCK_WR(unsigned char v)
{
	  if( v )
	  {
	     //iic_reg = iic_reg | 0x2;
	     IOWR(PIO_SCL_24_BASE,0,1);
	  }
	  else
	  {
	     //iic_reg = iic_reg & (~0x2);
	     IOWR(PIO_SCL_24_BASE,0,0); 
	  }
}


/*---------------------------------------------------------------
 *  函数名称： I2C_DIR
 *  函数描述： 对于SDA口的方向进行设定，0为输入，1为输出
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 --------------------------------------------------------------*/ 
void I2C_DIR(unsigned char v)	//0 : input, 1:output
{
		if( v )
			IOWR(PIO_SDA_24_BASE, 1, 1);

		else
			IOWR(PIO_SDA_24_BASE, 1, 0);

}



/*--------------------------------------------------------------
 *  函数名称： I2C_Start
 *  函数描述： I2C通讯起始函数，在SCK高电平的时候将SDA由高电平置低，则可作为给EEROM的起始信号
 *             与EEROM开始进行通讯
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 --------------------------------------------------------------*/ 
int I2C_Start(void)
{
	IOWR(PIO_SCL_24_BASE,0,0);
	IOWR(PIO_SDA_24_BASE,0,0);
	I2C_DIR(1);
	
	delay(90);
	I2C_SDA_WR(1);
	delay(90);
	I2C_SCK_WR(1);
	delay(90);
	
	I2C_SDA_WR(0);
	delay(90);
	I2C_SCK_WR(0);
	delay(90);

	return 1;
}



/*---------------------------------------------------------------------------------
 *  函数名称： I2C_Stop
 *  函数描述： 向EEROM发送停止信号，表示通讯停止。在SCK高电平时，将SDA置低则EEROM将
 *             停止数据传输
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 ---------------------------------------------------------------------------------*/ 
void  I2C_Stop(void)
{
	 delay(90);
	 I2C_SDA_WR(0);
	 delay(90);
	 I2C_SCK_WR(1);
	 delay(90);
	 I2C_SDA_WR(1);
	 delay(90);
}



/*----------------------------------------------------------------------------
 *  函数名称： I2C_Ack
 *  函数描述： 向EEROM发送信号，表示处于接收EEROM应答的状态中，等待EEROM的应答
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 ----------------------------------------------------------------------------*/ 
void I2C_Ack(void)
{
	 delay(90);
	 I2C_SDA_WR(0);
	 delay(90);
	 I2C_SCK_WR(1);
	 delay(90);
	 I2C_SCK_WR(0);
	 delay(90);
}


/*-------------------------------------------------------------------
 *  函数名称： I2C_Nack
 *  函数描述： 向EEROM发送信号，表示不再接收应答信号，即读取数据完毕
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -------------------------------------------------------------------*/ 
void I2C_Nack(void)
{
	 delay(90);
	 I2C_SDA_WR(1);
	 delay(90);
	 I2C_SCK_WR(1);
	 delay(90);
	 I2C_SCK_WR(0);
	 delay(90);
}



/*-------------------------------------------------------------------
 *  函数名称： I2C_Send_Byte
 *  函数描述： 向EEROM发送一个字节
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -------------------------------------------------------------------*/ 
int I2C_Send_Byte( unsigned char d)
{
	 unsigned char i = 8;
	 int bit_ack;
	 while( i-- )
	 {
		 delay(90);
	 	 if ( d &0x80 )   
	  		I2C_SDA_WR(1);
		  else
		  	I2C_SDA_WR(0);
		 delay(90);
		 I2C_SCK_WR(1);
		 delay(90);
		 I2C_SCK_WR(0);
		 d = d << 1;
	 }
	 delay(90);
	 I2C_SDA_WR(1);
	 I2C_DIR(0);
	 delay(90);

	 I2C_SCK_WR(1);
	 delay(90);
	 bit_ack = I2C_SDA_RD();
	 I2C_SCK_WR(0);

	 delay(90);
	 I2C_DIR(1);

	 return bit_ack;
}




/*--------------------------------------------------------
 *  函数名称： I2C_Receive_Byte
 *  函数描述： 从EEROM中读取一个字节
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 -------------------------------------------------------*/ 
unsigned char I2C_Receive_Byte(void)
{
	 unsigned char i = 8, d=0;
	 delay(90);
	 I2C_SDA_WR(1);
	 I2C_DIR(0);
	 I2C_SCK_WR(0);

	 while ( i--)
	 {
		  d = d << 1;
		 delay(90);
		  I2C_SCK_WR(1);
		  if ( I2C_SDA_RD() ) d++;
		 delay(90);
		 I2C_SCK_WR(0);
	 }
	 return d;
}



/*------------------------------------------------------------------
 *  函数名称： flash_set
 *  函数描述： 将控制器中某地址上的一段数据写入到EEROM的一段地址里了
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 ------------------------------------------------------------------*/ 
int flash_set(unsigned short addr,unsigned char *data,unsigned int len)
{
	if( data == NULL )
		return -1;
	
	while(len--) {
		IOWR( TIMER_WATCHDOG_BASE, 2, 0x1234 );

		I2C_Start();
		I2C_Send_Byte( 0xa0 + addr / 256 *2);  /* 24C08  USE */
		
		I2C_Send_Byte(addr %256 );
		I2C_Send_Byte( *(unsigned char*)data );
		I2C_Stop();  
		delay(36000);				/* waiting for write cycle to be completed */
		data++;
		addr++;
	 }

	 return 0;
}



/*----------------------------------------------------------------------
 *  函数名称： flash_get
 *  函数描述： 从EEROM的某一地址开始读一段数据，储存到控制器的一段地址中
 *  
 *
 *
 *  作者：     不详
 *  修改日期： 2011-9-15
 ----------------------------------------------------------------------*/ 
int flash_get(unsigned short addr,unsigned char *data,unsigned int len)
{
	if( data == NULL )
		return -1;

	 while(len--) {
	 	IOWR( TIMER_WATCHDOG_BASE, 2, 0x1234 );

		I2C_Start();
		I2C_Send_Byte( 0xa0 + addr / 256 *2 );  /* 24C08 USE */

		I2C_Send_Byte( addr % 256 );
		I2C_Start();
		I2C_Send_Byte( 0xa1 + addr /256 *2 );

		*data = I2C_Receive_Byte();
		I2C_Nack();
		I2C_Stop();
		delay(36000);
		data++;
		addr++;
	 }

	 return 0;
}


