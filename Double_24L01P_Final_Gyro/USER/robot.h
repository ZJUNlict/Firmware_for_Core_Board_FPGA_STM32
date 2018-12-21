#ifndef _ROBOT_H_
#define _ROBOT_H_

#include "packet.h"
#define CHANNEL_NUM 4
#define WHEEL_CENTER_OFFSET 0.082 
#define D_WHEEL_ANGLE_FRONT 58
#define D_WHEEL_ANGLE_BACK 135
#define PI 3.14159

#define MAX_ACC max_acc()
#define NORMAL_MODE 0
//#define OFFLINE_TEST_MODE 1
//#define CHECK_FRQ_MODE 2
//#define SHOOT_CHIP_MODE 3
//#define SET9557_ERROR_MODE 7
//#define SET_FRQ_E2PROM_MODE 8

#define DEFAULT_MOVE 0
#define DEFAULT_DRIBBLER 1
#define DEFAULT_SHOOT 2
#define HOST_MOVE 5
#define HOST_DRIBBLER 6
#define HOST_SHOOT 7

#define SHOOT 0
#define CHIP 1

#define ENABLE_SHOOTER 

typedef struct _pid_
{
    long Kc;
    long Ki;
    long Kd;

} pid_tt;

typedef struct _wheel_
{
	pid_tt	pid;
	int		speed;
	int		set;
} wheel_t;

typedef struct _ball_action_
{
    unsigned int dribbler;
    unsigned int strength;
    unsigned int shoot_chip_choose;
}ball;

typedef struct _action_
{
    int mode;//mode = 0指令未被激活，mode = 1移动指令,mode = 2吸球指令, mode = 3射门指令
    double robot_speed_x;//m/s
    double robot_speed_y;//m/s
    double robot_speed_r;//m/s
    int start_ms_counter;
    int end_ms_counter;
    ball its_ball_action;
}its_action_t;

typedef struct _state_
{
    int shoot_off_timer;
    double robot_speed_x;
    double robot_speed_y;
    double robot_speed_r;
    unsigned int dribbler;
    unsigned int strength;
    unsigned int shoot_chip_choose;
    int ADvalue;
    int g_power;
    int task[3];
}state;

typedef struct _robot_t{
	state current_state;
	int num; /* robot num load from circuit configuration switch */
	int mode;
	int frq;
	wheel_t wheels[ CHANNEL_NUM ];
	float kv2n;
  wheel_t dribbler;
	float sin_angle[CHANNEL_NUM];
	float cos_angle[CHANNEL_NUM];
//	double tempspeed_x;
//  double tempspeed_y;
	its_action_t its_action[16];
}robot_t;

//extern robot_t g_robot;

void robot_init(void);
int set_dribbler( int priority, int strength );
int do_move( int speed_x, int speed_y, int speed_rot );
long V2N( float vel );
//int set_shooter( int channel, int value );
int do_acc_handle_move(int speed_x,int speed_y,int speed_rot);


//int do_shoot( int shoot, int chip );
//int do_chip( int shoot, int chip );
int on_robot_command( packet_robot_t *packet );
double max_acc(void);

int do_shoot_or_chip( int shoot, int chip );
int set_shooter( int channel, int value );

#endif
