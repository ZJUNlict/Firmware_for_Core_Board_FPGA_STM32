#ifndef _NRF2401_H_
#define _NRF2401_H_

#include <io.h>
#include <unistd.h>
#include "system.h"
#include "sys/alt_irq.h"
#include "Config.h"
#include "Robot.h"
#include "Misc.h"


// default config for nRF2401
#define DATA_LEN 0x10
#define ADDR_INDEX_CH1  10               // Index to address bytes of CH1 in RFConfig.buf
#define ADDR_INDEX_CH2  5               // Index to address bytes of CH2 in RFConfig.buf
#define ADDR_COUNT  5               // Number of address bytes in RFConfig.buf
#define ADDR_LEN		16								// Length of address (in bit) (ADDR is 0~15)
#define DATA_LEN1    DATA_LEN						//data length of channel 1 
#define DATA_LEN2    DATA_LEN						//data length of channel 2 
#define ADDR_CH1		0x10,0x71,0x45,0x98,0x00	//Default address of CH1
#define ADDR_CH2		0x00,0x10,0x13,0x21,0x88	//Default address of CH2
#define	CRC_ENABLE	1													//CRC Enable, 1 for enable , 0 for disable
#define	CRC_LEN			1													//CRC LEN, 1 for 16bits, 0 for 8 bits
#define RX2_EN      0               //RX2_EN , 1 for enable two channels receive
#define CM          1               //Communication mode, 1 for ShockBurst mode, 0 for direct mode. We MUST use 1 in this code 
#define RF_DATA_RATE   0             //RF data rate, 1 for 1Mbps , 0 for 250Kbps
#define XO_F        3               //XTAL Frequency, 0 for 4 MHz, 1 for 8 MHz, 2 for 12 MHz, 3 for 16 MHz, 4 for 20 MHz
#define RF_PWR      3               //Transfer RF output Power, 3 for 0 dBm, 2 for -5 dBm, 1 for -10 dBm, 0 for -20 dBm
#define	RF_CH			1		//RF Frequency Channel, (0 ~ 127), But above 83 is not allowed in some countries.  
#define	MODE_CH1		0			//Set Mode of CH1, 0 for transmit , 1 for receive

#define NRF2401_RX          1
#define NRF2401_TX          0

typedef struct _nRF2401_buf
{
	int len;
	int pos;
	unsigned char buf[256];
} nRF2401_buf;

//≈‰÷√◊÷
typedef struct _RFConfig
{
	unsigned char n;
	unsigned char addr_count;
	unsigned char buf[15];
} RFConfig;

typedef struct _nRF2401_reg_base
{
	unsigned int CS_RegBaseAddr;
	unsigned int DATA_RegBaseAddr;
	unsigned int DR1_RegBaseAddr;
	unsigned int CLK1_RegBaseAddr;
	unsigned int PWR_RegBaseAddr;
	unsigned int CE_RegBaseAddr;
} nRF2401_reg_base;

//typedef struct {} nRF2401;

typedef struct nRF2401
{
	int (*init_dev)(struct nRF2401 *);
	int (*get_packet)(struct nRF2401 *);
	int (*send_packet)(struct nRF2401 *);
	nRF2401_buf buf;
	RFConfig RFconf;
	unsigned int packet_error;
}nRF2401;


int init_nRF2401_dev_rx();
int init_nRF2401_dev_tx();

int get_nRF2401_packet(nRF2401 *dev);
int send_nRF2401_packet(nRF2401 *dev);

void SetCE(unsigned char val);
void SetCS(unsigned char val);
void SetPowerUp(unsigned char val);

void set_a_bit_receive(void);
void set_receive_flag();
void rst_nRF2401();

#endif

