#ifndef _COMM_H_
#define _COMM_H_

#include <string.h>
#include "Config.h"
#include "Robot.h"
#include "Misc.h"
#include "nRF2401.h"
#include "Packet.h"
#include "Action.h"


#define MAX_BUFFER_LEN 25
#define nRF2401_BUFFER_LEN 256

struct _comm_
{
	unsigned char buffer[ MAX_BUFFER_LEN ];
	unsigned char buffer_pos;

	unsigned char status;

	int packet_error; //count number of bad packet received

} g_comm;


int init_comm();
int do_comm();
int is_comm_overflow();
int set_receive_mode();



#endif
