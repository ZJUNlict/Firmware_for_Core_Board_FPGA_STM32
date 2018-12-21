#ifndef _ROBOT_H_
#define _ROBOT_H_

#include "Config.h"

#define NORMAL_MODE 0
#define OFFLINE_TEST_MODE 1
#define CHECK_FRQ_MODE 2
#define SHOOT_CHIP_MODE 3
#define SET9557_ERROR_MODE 7
#define SET_FRQ_E2PROM_MODE 8


typedef struct _pid_
{
    /* parameters */
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

typedef struct _error_
{
	int name;
} err_t;

typedef struct _robot_
{
	int num; /* robot num load from circuit configuration switch */
	int mode;
	int frq;
	wheel_t wheels[ CHANNEL_NUM ];
	double kv2n;
	int shoot;
	int chip;
    wheel_t dribbler;
    err_t error[ERROR_NUM];
	double sin_angle[ CHANNEL_NUM];
	double cos_angle[ CHANNEL_NUM];
	int is_cap_low;
	int is_pow_low;
	int speed_x;
	int speed_y;
	double tempspeed_x;
    double tempspeed_y;//2017.4.3 forget how to change, remove it after Iran
} robot_t;

#endif

