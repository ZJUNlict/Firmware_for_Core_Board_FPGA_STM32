#ifndef MY_H_
#define MY_H_

#define IOWR_AVALONCONTROL_A(base, data)       IOWR(base, 0, data)
#define IOWR_AVALONCONTROL_B(base, data)       IOWR(base, 1, data)
#define IOWR_AVALONCONTROL_SET(base, data)       IOWR(base, 2, data)
#define IOWR_AVALONCONTROL_Z_OPENLOOP(base, data)       IOWR(base, 3, data)
#define IOWR_AVALONCONTROL_Z_BRUSHLESS(base, data)       IOWR(base, 4, data)
#define M_BLDC 1
#define M_BDC 0
#define M_OPENLOOP 1
#define M_CLOSELOOP 0
#define IOWR_MOTOR_OPENLOOP(base) IOWR_AVALONCONTROL_Z_OPENLOOP(base, M_OPENLOOP)
#define IOWR_MOTOR_CLOSELOOP(base) IOWR_AVALONCONTROL_Z_OPENLOOP(base, M_CLOSELOOP)

#define IOWR_PIO_SET(base, data)       IOWR(base, 0, data)
#define IOWR_PIO_LOOPDECIDE(base,data)         IOWR(base,0,data)

#define IORD_DRIBBLER_SPEED()                    IORD(MOTOR_4_BASE,0)

#define PI 3.14159

#endif /*MY_H_*/
