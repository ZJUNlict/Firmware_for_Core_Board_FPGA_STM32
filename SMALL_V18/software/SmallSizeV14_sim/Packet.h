#ifndef _PACKET_H_
#define _PACKET_H_

#include "Config.h"
#include "My.h"
#include "Robot.h"
#include "Misc.h"


#define DEBUG_FUNCTION_Normal 	            0
#define DEBUG_FUNCTION_Set_9557_error       7


typedef enum _packet_type_
{
	PACKET_NONE = -1,
	PACKET_Normal = 0,
	PACKET_DEBUG_Check_Frq = 2,
	PACKET_DEBUG_Set_9557_error = 7
} packet_type_t;

typedef struct _packet_robot_
{
	int robot_num;
	
	int dribbler;
	int shoot;
	int chip;
	int speed_x;
	int speed_y;
	int speed_rot;
	
} packet_robot_t;

int stop_mode_packet(char *q);
int packet(char *q);
packet_type_t get_packet_type( unsigned char* data, int len );
int decode_packet_robot( packet_robot_t *packet, unsigned char *data, int len );



#endif

