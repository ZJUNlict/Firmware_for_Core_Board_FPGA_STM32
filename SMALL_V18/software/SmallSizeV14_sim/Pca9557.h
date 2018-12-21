#ifndef _PCA9557_H_
#define _PCA9557_H_

#include <altera_avalon_pio_regs.h>
#include "system.h"
#include "Config.h"
#include "Robot.h"
#include "Misc.h"
#include "Flash.h"



#define CMD_WRITE_PORT9557 1
#define CMD_WRITE_POLARITY9557 2
#define CMD_WRITE_CONFIG9557 3

#define FREE_FRQ_SET
#define MAN_SET_STARTPOINT 0
#define MAN_SET_STEPLENGTH 4

int	init_pca9557();

#endif

