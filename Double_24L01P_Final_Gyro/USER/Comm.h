#ifndef _COMM_H_
#define _COMM_H_

#include <string.h>
#include "sys.h"
#define MAX_BUFFER_LEN 25
#define nRF2401_BUFFER_LEN 256

//struct _comm_
//{
//	unsigned char buffer[ MAX_BUFFER_LEN ];
//	unsigned char buffer_pos;

//	unsigned char status;

//	int packet_error; //count number of bad packet received

//} g_comm;

//extern motor_t motor[4];//

int init_comm(void);
int do_comm(void);			//无线通信总函数
int do_comm_up(void);			//回包给上位机
int do_packet_process(u8 *data, int len);		//解析数据包
int packet(char *q);
int stop_mode_packet(char *q);
//int is_comm_overflow();
//int set_receive_mode();

#endif
