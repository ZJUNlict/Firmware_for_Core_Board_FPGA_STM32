#ifndef _TIMER_H
#define _TIMER_H
#include "sys.h"

void TIM3_Int_Init(u16 arr,u16 psc);
void do_timer(void);


#endif
