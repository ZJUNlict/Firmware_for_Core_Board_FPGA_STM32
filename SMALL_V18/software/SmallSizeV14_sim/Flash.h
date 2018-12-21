#ifndef _FLASH_H_
#define _FLASH_H_

#include <io.h>
#include <stdio.h>
#include "system.h"
#include "My.h"
#include "Misc.h"


/* flash related */
#define FLASH_MAGIC_NUM	0x55AA
#define FLASH_SIZE 1024


int flash_set( unsigned short addr, unsigned char *data, unsigned int len );
int flash_get( unsigned short addr, unsigned char *data, unsigned int len );


#endif

