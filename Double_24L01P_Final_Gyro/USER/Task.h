#ifndef TASK_H_
#define TASK_H_

extern void task_create(unsigned char mode, double speed_x, double speed_y, double speed_r, unsigned int dribbler, unsigned int strength, unsigned int chip_shoot_choose, int start_ms_counter, int end_ms_counter, int task_priority);
extern void task_update();
extern void task_delete(int priority);
extern void task_delete_all();



#endif
