#ifndef _MISC_H_
#define _MISC_H_

#include <altera_avalon_pio_regs.h>
#include <io.h>
#include <unistd.h>
#include "system.h"
#include "Config.h"
#include "Robot.h"



/* ir detector */
int is_ball_detected();
int is_infra_broken();

/* power monitor */
int is_cap_low();
int do_power_monitor();



/* on-board LED */
#define LED_BALL_DETECTOR 0
#define LED_HEART 1 
#define LED_RGB_PWM_PERIOD 10000

#define ROTATE_MODE_PARAM_OVERFLOW_ERR 1
#define NO_ACKNOWLEGE_9557_ERR 2
#define DRIBBLE_MODE_PARAM_OVERFLOW_ERR 3
#define ROBOT_MODE_ERR 4
#define DO_9557_COMM_ERR 5

/* power monitor and capitor monitor */
#define DelayTime1  200     //tsu
#define DelayTime  500    //clk=50k?


int init_led();
int led_on( int channel );
int led_off( int channel );


/* on-board Beep */
#define BEEP_POWER 0
int beep_on( int channel );
int beep_off( int channel );

/* misc */
void record_err(int err_no);
int heart_beat();
void delay(int us);
#endif

