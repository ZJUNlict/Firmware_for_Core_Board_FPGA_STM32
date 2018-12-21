/* system.h
 *
 * Machine generated for a CPU named "cpu_0" as defined in:
 * c:\SMALL_V16_sim_db_YT\software\SmallSizeV14_sim_syslib\..\..\SMALL14_CPU.ptf
 *
 * Generated: 2017-03-30 02:43:49.428
 *
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/*

DO NOT MODIFY THIS FILE

   Changing this file will have subtle consequences
   which will almost certainly lead to a nonfunctioning
   system. If you do modify this file, be aware that your
   changes will be overwritten and lost when this file
   is generated again.

DO NOT MODIFY THIS FILE

*/

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2003 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
*                                                                             *
******************************************************************************/

/*
 * system configuration
 *
 */

#define ALT_SYSTEM_NAME "SMALL14_CPU"
#define ALT_CPU_NAME "cpu_0"
#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_DEVICE_FAMILY "CYCLONEIII"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN_BASE 0x01002280
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_PRESENT
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT_BASE 0x01002280
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_PRESENT
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDERR_BASE 0x01002280
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_PRESENT
#define ALT_CPU_FREQ 50000000
#define ALT_IRQ_BASE NULL
#define ALT_LEGACY_INTERRUPT_API_PRESENT

/*
 * processor configuration
 *
 */

#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_BIG_ENDIAN 0
#define NIOS2_INTERRUPT_CONTROLLER_ID 0

#define NIOS2_ICACHE_SIZE 2048
#define NIOS2_DCACHE_SIZE 1024
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_FLUSHDA_SUPPORTED

#define NIOS2_EXCEPTION_ADDR 0x00800020
#define NIOS2_RESET_ADDR 0x01001800
#define NIOS2_BREAK_ADDR 0x01001020

#define NIOS2_HAS_DEBUG_STUB

#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0

/*
 * A define for each class of peripheral
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_EPCS_FLASH_CONTROLLER
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID
#define __ADGETNEW2
#define __PWM_2
#define __SHOOT_TIMER
#define __MOTOR

/*
 * jtag_uart_0 configuration
 *
 */

#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_BASE 0x01002280
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_IRQ 0
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_READ_CHAR_STREAM ""
#define JTAG_UART_0_SHOWASCII 1
#define JTAG_UART_0_RELATIVEPATH 0
#define JTAG_UART_0_READ_LE 0
#define JTAG_UART_0_WRITE_LE 0
#define JTAG_UART_0_ALTERA_SHOW_UNRELEASED_JTAG_UART_FEATURES 0
#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart

/*
 * sdram_0 configuration
 *
 */

#define SDRAM_0_NAME "/dev/sdram_0"
#define SDRAM_0_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_0_BASE 0x00800000
#define SDRAM_0_SPAN 8388608
#define SDRAM_0_REGISTER_DATA_IN 1
#define SDRAM_0_SIM_MODEL_BASE 1
#define SDRAM_0_SDRAM_DATA_WIDTH 16
#define SDRAM_0_SDRAM_ADDR_WIDTH 12
#define SDRAM_0_SDRAM_ROW_WIDTH 12
#define SDRAM_0_SDRAM_COL_WIDTH 8
#define SDRAM_0_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_0_SDRAM_NUM_BANKS 4
#define SDRAM_0_REFRESH_PERIOD 15.625
#define SDRAM_0_POWERUP_DELAY 100.0
#define SDRAM_0_CAS_LATENCY 3
#define SDRAM_0_T_RFC 70.0
#define SDRAM_0_T_RP 20.0
#define SDRAM_0_T_MRD 3
#define SDRAM_0_T_RCD 20.0
#define SDRAM_0_T_AC 5.5
#define SDRAM_0_T_WR 14.0
#define SDRAM_0_INIT_REFRESH_COMMANDS 2
#define SDRAM_0_INIT_NOP_DELAY 0.0
#define SDRAM_0_SHARED_DATA 0
#define SDRAM_0_SDRAM_BANK_WIDTH 2
#define SDRAM_0_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_0_STARVATION_INDICATOR 0
#define SDRAM_0_IS_INITIALIZED 1
#define ALT_MODULE_CLASS_sdram_0 altera_avalon_new_sdram_controller

/*
 * epcs_flash_controller_0 configuration
 *
 */

#define EPCS_FLASH_CONTROLLER_0_NAME "/dev/epcs_flash_controller_0"
#define EPCS_FLASH_CONTROLLER_0_TYPE "altera_avalon_epcs_flash_controller"
#define EPCS_FLASH_CONTROLLER_0_BASE 0x01001800
#define EPCS_FLASH_CONTROLLER_0_SPAN 2048
#define EPCS_FLASH_CONTROLLER_0_IRQ 1
#define EPCS_FLASH_CONTROLLER_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define EPCS_FLASH_CONTROLLER_0_DATABITS 8
#define EPCS_FLASH_CONTROLLER_0_TARGETCLOCK 20
#define EPCS_FLASH_CONTROLLER_0_CLOCKUNITS "MHz"
#define EPCS_FLASH_CONTROLLER_0_CLOCKMULT 1000000
#define EPCS_FLASH_CONTROLLER_0_NUMSLAVES 1
#define EPCS_FLASH_CONTROLLER_0_ISMASTER 1
#define EPCS_FLASH_CONTROLLER_0_CLOCKPOLARITY 0
#define EPCS_FLASH_CONTROLLER_0_CLOCKPHASE 0
#define EPCS_FLASH_CONTROLLER_0_LSBFIRST 0
#define EPCS_FLASH_CONTROLLER_0_EXTRADELAY 0
#define EPCS_FLASH_CONTROLLER_0_TARGETSSDELAY 100
#define EPCS_FLASH_CONTROLLER_0_DELAYUNITS "us"
#define EPCS_FLASH_CONTROLLER_0_DELAYMULT "1e-006"
#define EPCS_FLASH_CONTROLLER_0_PREFIX "epcs_"
#define EPCS_FLASH_CONTROLLER_0_REGISTER_OFFSET 0x400
#define EPCS_FLASH_CONTROLLER_0_IGNORE_LEGACY_CHECK 1
#define EPCS_FLASH_CONTROLLER_0_USE_ASMI_ATOM 0
#define EPCS_FLASH_CONTROLLER_0_CLOCKUNIT "kHz"
#define EPCS_FLASH_CONTROLLER_0_DELAYUNIT "us"
#define EPCS_FLASH_CONTROLLER_0_DISABLEAVALONFLOWCONTROL 0
#define EPCS_FLASH_CONTROLLER_0_INSERT_SYNC 0
#define EPCS_FLASH_CONTROLLER_0_SYNC_REG_DEPTH 2
#define ALT_MODULE_CLASS_epcs_flash_controller_0 altera_avalon_epcs_flash_controller

/*
 * timer_0 configuration
 *
 */

#define TIMER_0_NAME "/dev/timer_0"
#define TIMER_0_TYPE "altera_avalon_timer"
#define TIMER_0_BASE 0x01002000
#define TIMER_0_SPAN 32
#define TIMER_0_IRQ 2
#define TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_0_ALWAYS_RUN 0
#define TIMER_0_FIXED_PERIOD 0
#define TIMER_0_SNAPSHOT 1
#define TIMER_0_PERIOD 1
#define TIMER_0_PERIOD_UNITS "ms"
#define TIMER_0_RESET_OUTPUT 0
#define TIMER_0_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_0_LOAD_VALUE 49999
#define TIMER_0_COUNTER_SIZE 32
#define TIMER_0_MULT 0.0010
#define TIMER_0_TICKS_PER_SEC 1000
#define TIMER_0_FREQ 50000000
#define ALT_MODULE_CLASS_timer_0 altera_avalon_timer

/*
 * timer_watchdog configuration
 *
 */

#define TIMER_WATCHDOG_NAME "/dev/timer_watchdog"
#define TIMER_WATCHDOG_TYPE "altera_avalon_timer"
#define TIMER_WATCHDOG_BASE 0x01002020
#define TIMER_WATCHDOG_SPAN 32
#define TIMER_WATCHDOG_IRQ 3
#define TIMER_WATCHDOG_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_WATCHDOG_ALWAYS_RUN 1
#define TIMER_WATCHDOG_FIXED_PERIOD 1
#define TIMER_WATCHDOG_SNAPSHOT 0
#define TIMER_WATCHDOG_PERIOD 100
#define TIMER_WATCHDOG_PERIOD_UNITS "ms"
#define TIMER_WATCHDOG_RESET_OUTPUT 1
#define TIMER_WATCHDOG_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_WATCHDOG_LOAD_VALUE 4999999
#define TIMER_WATCHDOG_COUNTER_SIZE 32
#define TIMER_WATCHDOG_MULT 0.0010
#define TIMER_WATCHDOG_TICKS_PER_SEC 10
#define TIMER_WATCHDOG_FREQ 50000000
#define ALT_MODULE_CLASS_timer_watchdog altera_avalon_timer

/*
 * pio_buzzer configuration
 *
 */

#define PIO_BUZZER_NAME "/dev/pio_buzzer"
#define PIO_BUZZER_TYPE "altera_avalon_pio"
#define PIO_BUZZER_BASE 0x01002120
#define PIO_BUZZER_SPAN 16
#define PIO_BUZZER_DO_TEST_BENCH_WIRING 0
#define PIO_BUZZER_DRIVEN_SIM_VALUE 0
#define PIO_BUZZER_HAS_TRI 0
#define PIO_BUZZER_HAS_OUT 1
#define PIO_BUZZER_HAS_IN 0
#define PIO_BUZZER_CAPTURE 0
#define PIO_BUZZER_DATA_WIDTH 1
#define PIO_BUZZER_RESET_VALUE 0
#define PIO_BUZZER_EDGE_TYPE "NONE"
#define PIO_BUZZER_IRQ_TYPE "NONE"
#define PIO_BUZZER_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_BUZZER_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_BUZZER_FREQ 50000000
#define ALT_MODULE_CLASS_pio_buzzer altera_avalon_pio

/*
 * pio_infra configuration
 *
 */

#define PIO_INFRA_NAME "/dev/pio_infra"
#define PIO_INFRA_TYPE "altera_avalon_pio"
#define PIO_INFRA_BASE 0x01002130
#define PIO_INFRA_SPAN 16
#define PIO_INFRA_IRQ 4
#define PIO_INFRA_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PIO_INFRA_DO_TEST_BENCH_WIRING 0
#define PIO_INFRA_DRIVEN_SIM_VALUE 0
#define PIO_INFRA_HAS_TRI 0
#define PIO_INFRA_HAS_OUT 0
#define PIO_INFRA_HAS_IN 1
#define PIO_INFRA_CAPTURE 1
#define PIO_INFRA_DATA_WIDTH 1
#define PIO_INFRA_RESET_VALUE 0
#define PIO_INFRA_EDGE_TYPE "FALLING"
#define PIO_INFRA_IRQ_TYPE "EDGE"
#define PIO_INFRA_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_INFRA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_INFRA_FREQ 50000000
#define ALT_MODULE_CLASS_pio_infra altera_avalon_pio

/*
 * pio_led configuration
 *
 */

#define PIO_LED_NAME "/dev/pio_led"
#define PIO_LED_TYPE "altera_avalon_pio"
#define PIO_LED_BASE 0x01002140
#define PIO_LED_SPAN 16
#define PIO_LED_DO_TEST_BENCH_WIRING 0
#define PIO_LED_DRIVEN_SIM_VALUE 0
#define PIO_LED_HAS_TRI 0
#define PIO_LED_HAS_OUT 1
#define PIO_LED_HAS_IN 0
#define PIO_LED_CAPTURE 0
#define PIO_LED_DATA_WIDTH 2
#define PIO_LED_RESET_VALUE 0
#define PIO_LED_EDGE_TYPE "NONE"
#define PIO_LED_IRQ_TYPE "NONE"
#define PIO_LED_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_LED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_LED_FREQ 50000000
#define ALT_MODULE_CLASS_pio_led altera_avalon_pio

/*
 * pio_nF2401_in configuration
 *
 */

#define PIO_NF2401_IN_NAME "/dev/pio_nF2401_in"
#define PIO_NF2401_IN_TYPE "altera_avalon_pio"
#define PIO_NF2401_IN_BASE 0x01002150
#define PIO_NF2401_IN_SPAN 16
#define PIO_NF2401_IN_IRQ 5
#define PIO_NF2401_IN_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PIO_NF2401_IN_DO_TEST_BENCH_WIRING 0
#define PIO_NF2401_IN_DRIVEN_SIM_VALUE 0
#define PIO_NF2401_IN_HAS_TRI 0
#define PIO_NF2401_IN_HAS_OUT 0
#define PIO_NF2401_IN_HAS_IN 1
#define PIO_NF2401_IN_CAPTURE 1
#define PIO_NF2401_IN_DATA_WIDTH 1
#define PIO_NF2401_IN_RESET_VALUE 0
#define PIO_NF2401_IN_EDGE_TYPE "RISING"
#define PIO_NF2401_IN_IRQ_TYPE "EDGE"
#define PIO_NF2401_IN_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_NF2401_IN_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_NF2401_IN_FREQ 50000000
#define ALT_MODULE_CLASS_pio_nF2401_in altera_avalon_pio

/*
 * pio_nF2401_inout configuration
 *
 */

#define PIO_NF2401_INOUT_NAME "/dev/pio_nF2401_inout"
#define PIO_NF2401_INOUT_TYPE "altera_avalon_pio"
#define PIO_NF2401_INOUT_BASE 0x01002160
#define PIO_NF2401_INOUT_SPAN 16
#define PIO_NF2401_INOUT_DO_TEST_BENCH_WIRING 0
#define PIO_NF2401_INOUT_DRIVEN_SIM_VALUE 0
#define PIO_NF2401_INOUT_HAS_TRI 1
#define PIO_NF2401_INOUT_HAS_OUT 0
#define PIO_NF2401_INOUT_HAS_IN 0
#define PIO_NF2401_INOUT_CAPTURE 0
#define PIO_NF2401_INOUT_DATA_WIDTH 3
#define PIO_NF2401_INOUT_RESET_VALUE 0
#define PIO_NF2401_INOUT_EDGE_TYPE "NONE"
#define PIO_NF2401_INOUT_IRQ_TYPE "NONE"
#define PIO_NF2401_INOUT_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_NF2401_INOUT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_NF2401_INOUT_FREQ 50000000
#define ALT_MODULE_CLASS_pio_nF2401_inout altera_avalon_pio

/*
 * pio_nF2401_out configuration
 *
 */

#define PIO_NF2401_OUT_NAME "/dev/pio_nF2401_out"
#define PIO_NF2401_OUT_TYPE "altera_avalon_pio"
#define PIO_NF2401_OUT_BASE 0x01002170
#define PIO_NF2401_OUT_SPAN 16
#define PIO_NF2401_OUT_DO_TEST_BENCH_WIRING 0
#define PIO_NF2401_OUT_DRIVEN_SIM_VALUE 0
#define PIO_NF2401_OUT_HAS_TRI 0
#define PIO_NF2401_OUT_HAS_OUT 1
#define PIO_NF2401_OUT_HAS_IN 0
#define PIO_NF2401_OUT_CAPTURE 0
#define PIO_NF2401_OUT_DATA_WIDTH 3
#define PIO_NF2401_OUT_RESET_VALUE 0
#define PIO_NF2401_OUT_EDGE_TYPE "NONE"
#define PIO_NF2401_OUT_IRQ_TYPE "NONE"
#define PIO_NF2401_OUT_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_NF2401_OUT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_NF2401_OUT_FREQ 50000000
#define ALT_MODULE_CLASS_pio_nF2401_out altera_avalon_pio

/*
 * sysid configuration
 *
 */

#define SYSID_NAME "/dev/sysid"
#define SYSID_TYPE "altera_avalon_sysid"
#define SYSID_BASE 0x01002288
#define SYSID_SPAN 8
#define SYSID_ID 453840924u
#define SYSID_TIMESTAMP 1458912687u
#define SYSID_REGENERATE_VALUES 0
#define ALT_MODULE_CLASS_sysid altera_avalon_sysid

/*
 * pio_scl_24 configuration
 *
 */

#define PIO_SCL_24_NAME "/dev/pio_scl_24"
#define PIO_SCL_24_TYPE "altera_avalon_pio"
#define PIO_SCL_24_BASE 0x01002180
#define PIO_SCL_24_SPAN 16
#define PIO_SCL_24_DO_TEST_BENCH_WIRING 0
#define PIO_SCL_24_DRIVEN_SIM_VALUE 0
#define PIO_SCL_24_HAS_TRI 0
#define PIO_SCL_24_HAS_OUT 1
#define PIO_SCL_24_HAS_IN 0
#define PIO_SCL_24_CAPTURE 0
#define PIO_SCL_24_DATA_WIDTH 1
#define PIO_SCL_24_RESET_VALUE 0
#define PIO_SCL_24_EDGE_TYPE "NONE"
#define PIO_SCL_24_IRQ_TYPE "NONE"
#define PIO_SCL_24_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_SCL_24_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_SCL_24_FREQ 50000000
#define ALT_MODULE_CLASS_pio_scl_24 altera_avalon_pio

/*
 * pio_sda_24 configuration
 *
 */

#define PIO_SDA_24_NAME "/dev/pio_sda_24"
#define PIO_SDA_24_TYPE "altera_avalon_pio"
#define PIO_SDA_24_BASE 0x01002190
#define PIO_SDA_24_SPAN 16
#define PIO_SDA_24_DO_TEST_BENCH_WIRING 0
#define PIO_SDA_24_DRIVEN_SIM_VALUE 0
#define PIO_SDA_24_HAS_TRI 1
#define PIO_SDA_24_HAS_OUT 0
#define PIO_SDA_24_HAS_IN 0
#define PIO_SDA_24_CAPTURE 0
#define PIO_SDA_24_DATA_WIDTH 1
#define PIO_SDA_24_RESET_VALUE 0
#define PIO_SDA_24_EDGE_TYPE "NONE"
#define PIO_SDA_24_IRQ_TYPE "NONE"
#define PIO_SDA_24_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_SDA_24_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_SDA_24_FREQ 50000000
#define ALT_MODULE_CLASS_pio_sda_24 altera_avalon_pio

/*
 * pio_shoot_off configuration
 *
 */

#define PIO_SHOOT_OFF_NAME "/dev/pio_shoot_off"
#define PIO_SHOOT_OFF_TYPE "altera_avalon_pio"
#define PIO_SHOOT_OFF_BASE 0x010021e0
#define PIO_SHOOT_OFF_SPAN 16
#define PIO_SHOOT_OFF_DO_TEST_BENCH_WIRING 0
#define PIO_SHOOT_OFF_DRIVEN_SIM_VALUE 0
#define PIO_SHOOT_OFF_HAS_TRI 0
#define PIO_SHOOT_OFF_HAS_OUT 0
#define PIO_SHOOT_OFF_HAS_IN 1
#define PIO_SHOOT_OFF_CAPTURE 0
#define PIO_SHOOT_OFF_DATA_WIDTH 1
#define PIO_SHOOT_OFF_RESET_VALUE 0
#define PIO_SHOOT_OFF_EDGE_TYPE "NONE"
#define PIO_SHOOT_OFF_IRQ_TYPE "NONE"
#define PIO_SHOOT_OFF_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_SHOOT_OFF_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_SHOOT_OFF_FREQ 50000000
#define ALT_MODULE_CLASS_pio_shoot_off altera_avalon_pio

/*
 * pio_scl_9557 configuration
 *
 */

#define PIO_SCL_9557_NAME "/dev/pio_scl_9557"
#define PIO_SCL_9557_TYPE "altera_avalon_pio"
#define PIO_SCL_9557_BASE 0x010021b0
#define PIO_SCL_9557_SPAN 16
#define PIO_SCL_9557_DO_TEST_BENCH_WIRING 0
#define PIO_SCL_9557_DRIVEN_SIM_VALUE 0
#define PIO_SCL_9557_HAS_TRI 0
#define PIO_SCL_9557_HAS_OUT 1
#define PIO_SCL_9557_HAS_IN 0
#define PIO_SCL_9557_CAPTURE 0
#define PIO_SCL_9557_DATA_WIDTH 1
#define PIO_SCL_9557_RESET_VALUE 0
#define PIO_SCL_9557_EDGE_TYPE "NONE"
#define PIO_SCL_9557_IRQ_TYPE "NONE"
#define PIO_SCL_9557_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_SCL_9557_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_SCL_9557_FREQ 50000000
#define ALT_MODULE_CLASS_pio_scl_9557 altera_avalon_pio

/*
 * pio_sda_9557 configuration
 *
 */

#define PIO_SDA_9557_NAME "/dev/pio_sda_9557"
#define PIO_SDA_9557_TYPE "altera_avalon_pio"
#define PIO_SDA_9557_BASE 0x010021c0
#define PIO_SDA_9557_SPAN 16
#define PIO_SDA_9557_DO_TEST_BENCH_WIRING 0
#define PIO_SDA_9557_DRIVEN_SIM_VALUE 0
#define PIO_SDA_9557_HAS_TRI 1
#define PIO_SDA_9557_HAS_OUT 0
#define PIO_SDA_9557_HAS_IN 0
#define PIO_SDA_9557_CAPTURE 0
#define PIO_SDA_9557_DATA_WIDTH 1
#define PIO_SDA_9557_RESET_VALUE 0
#define PIO_SDA_9557_EDGE_TYPE "NONE"
#define PIO_SDA_9557_IRQ_TYPE "NONE"
#define PIO_SDA_9557_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_SDA_9557_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_SDA_9557_FREQ 50000000
#define ALT_MODULE_CLASS_pio_sda_9557 altera_avalon_pio

/*
 * pio_reset_9557 configuration
 *
 */

#define PIO_RESET_9557_NAME "/dev/pio_reset_9557"
#define PIO_RESET_9557_TYPE "altera_avalon_pio"
#define PIO_RESET_9557_BASE 0x010021d0
#define PIO_RESET_9557_SPAN 16
#define PIO_RESET_9557_DO_TEST_BENCH_WIRING 0
#define PIO_RESET_9557_DRIVEN_SIM_VALUE 0
#define PIO_RESET_9557_HAS_TRI 0
#define PIO_RESET_9557_HAS_OUT 1
#define PIO_RESET_9557_HAS_IN 0
#define PIO_RESET_9557_CAPTURE 0
#define PIO_RESET_9557_DATA_WIDTH 1
#define PIO_RESET_9557_RESET_VALUE 0
#define PIO_RESET_9557_EDGE_TYPE "NONE"
#define PIO_RESET_9557_IRQ_TYPE "NONE"
#define PIO_RESET_9557_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_RESET_9557_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_RESET_9557_FREQ 50000000
#define ALT_MODULE_CLASS_pio_reset_9557 altera_avalon_pio

/*
 * adgetnew2_0 configuration
 *
 */

#define ADGETNEW2_0_NAME "/dev/adgetnew2_0"
#define ADGETNEW2_0_TYPE "adgetnew2"
#define ADGETNEW2_0_BASE 0x01002290
#define ADGETNEW2_0_SPAN 8
#define ALT_MODULE_CLASS_adgetnew2_0 adgetnew2

/*
 * PWM_2_infra_pwm configuration
 *
 */

#define PWM_2_INFRA_PWM_NAME "/dev/PWM_2_infra_pwm"
#define PWM_2_INFRA_PWM_TYPE "PWM_2"
#define PWM_2_INFRA_PWM_BASE 0x01002200
#define PWM_2_INFRA_PWM_SPAN 16
#define ALT_MODULE_CLASS_PWM_2_infra_pwm PWM_2

/*
 * shoot_timer_shoot configuration
 *
 */

#define SHOOT_TIMER_SHOOT_NAME "/dev/shoot_timer_shoot"
#define SHOOT_TIMER_SHOOT_TYPE "shoot_timer"
#define SHOOT_TIMER_SHOOT_BASE 0x01002298
#define SHOOT_TIMER_SHOOT_SPAN 4
#define ALT_MODULE_CLASS_shoot_timer_shoot shoot_timer

/*
 * shoot_timer_chip configuration
 *
 */

#define SHOOT_TIMER_CHIP_NAME "/dev/shoot_timer_chip"
#define SHOOT_TIMER_CHIP_TYPE "shoot_timer"
#define SHOOT_TIMER_CHIP_BASE 0x0100229c
#define SHOOT_TIMER_CHIP_SPAN 4
#define ALT_MODULE_CLASS_shoot_timer_chip shoot_timer

/*
 * pio_hull_fault1 configuration
 *
 */

#define PIO_HULL_FAULT1_NAME "/dev/pio_hull_fault1"
#define PIO_HULL_FAULT1_TYPE "altera_avalon_pio"
#define PIO_HULL_FAULT1_BASE 0x01002210
#define PIO_HULL_FAULT1_SPAN 16
#define PIO_HULL_FAULT1_DO_TEST_BENCH_WIRING 0
#define PIO_HULL_FAULT1_DRIVEN_SIM_VALUE 0
#define PIO_HULL_FAULT1_HAS_TRI 0
#define PIO_HULL_FAULT1_HAS_OUT 0
#define PIO_HULL_FAULT1_HAS_IN 1
#define PIO_HULL_FAULT1_CAPTURE 0
#define PIO_HULL_FAULT1_DATA_WIDTH 1
#define PIO_HULL_FAULT1_RESET_VALUE 0
#define PIO_HULL_FAULT1_EDGE_TYPE "NONE"
#define PIO_HULL_FAULT1_IRQ_TYPE "NONE"
#define PIO_HULL_FAULT1_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_HULL_FAULT1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_HULL_FAULT1_FREQ 50000000
#define ALT_MODULE_CLASS_pio_hull_fault1 altera_avalon_pio

/*
 * pio_hull_fault2 configuration
 *
 */

#define PIO_HULL_FAULT2_NAME "/dev/pio_hull_fault2"
#define PIO_HULL_FAULT2_TYPE "altera_avalon_pio"
#define PIO_HULL_FAULT2_BASE 0x01002220
#define PIO_HULL_FAULT2_SPAN 16
#define PIO_HULL_FAULT2_DO_TEST_BENCH_WIRING 0
#define PIO_HULL_FAULT2_DRIVEN_SIM_VALUE 0
#define PIO_HULL_FAULT2_HAS_TRI 0
#define PIO_HULL_FAULT2_HAS_OUT 0
#define PIO_HULL_FAULT2_HAS_IN 1
#define PIO_HULL_FAULT2_CAPTURE 0
#define PIO_HULL_FAULT2_DATA_WIDTH 1
#define PIO_HULL_FAULT2_RESET_VALUE 0
#define PIO_HULL_FAULT2_EDGE_TYPE "NONE"
#define PIO_HULL_FAULT2_IRQ_TYPE "NONE"
#define PIO_HULL_FAULT2_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_HULL_FAULT2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_HULL_FAULT2_FREQ 50000000
#define ALT_MODULE_CLASS_pio_hull_fault2 altera_avalon_pio

/*
 * pio_hull_fault3 configuration
 *
 */

#define PIO_HULL_FAULT3_NAME "/dev/pio_hull_fault3"
#define PIO_HULL_FAULT3_TYPE "altera_avalon_pio"
#define PIO_HULL_FAULT3_BASE 0x01002230
#define PIO_HULL_FAULT3_SPAN 16
#define PIO_HULL_FAULT3_DO_TEST_BENCH_WIRING 0
#define PIO_HULL_FAULT3_DRIVEN_SIM_VALUE 0
#define PIO_HULL_FAULT3_HAS_TRI 0
#define PIO_HULL_FAULT3_HAS_OUT 0
#define PIO_HULL_FAULT3_HAS_IN 1
#define PIO_HULL_FAULT3_CAPTURE 0
#define PIO_HULL_FAULT3_DATA_WIDTH 1
#define PIO_HULL_FAULT3_RESET_VALUE 0
#define PIO_HULL_FAULT3_EDGE_TYPE "NONE"
#define PIO_HULL_FAULT3_IRQ_TYPE "NONE"
#define PIO_HULL_FAULT3_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_HULL_FAULT3_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_HULL_FAULT3_FREQ 50000000
#define ALT_MODULE_CLASS_pio_hull_fault3 altera_avalon_pio

/*
 * pio_hull_fault4 configuration
 *
 */

#define PIO_HULL_FAULT4_NAME "/dev/pio_hull_fault4"
#define PIO_HULL_FAULT4_TYPE "altera_avalon_pio"
#define PIO_HULL_FAULT4_BASE 0x01002240
#define PIO_HULL_FAULT4_SPAN 16
#define PIO_HULL_FAULT4_DO_TEST_BENCH_WIRING 0
#define PIO_HULL_FAULT4_DRIVEN_SIM_VALUE 0
#define PIO_HULL_FAULT4_HAS_TRI 0
#define PIO_HULL_FAULT4_HAS_OUT 0
#define PIO_HULL_FAULT4_HAS_IN 1
#define PIO_HULL_FAULT4_CAPTURE 0
#define PIO_HULL_FAULT4_DATA_WIDTH 1
#define PIO_HULL_FAULT4_RESET_VALUE 0
#define PIO_HULL_FAULT4_EDGE_TYPE "NONE"
#define PIO_HULL_FAULT4_IRQ_TYPE "NONE"
#define PIO_HULL_FAULT4_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_HULL_FAULT4_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_HULL_FAULT4_FREQ 50000000
#define ALT_MODULE_CLASS_pio_hull_fault4 altera_avalon_pio

/*
 * motor_0 configuration
 *
 */

#define MOTOR_0_NAME "/dev/motor_0"
#define MOTOR_0_TYPE "motor"
#define MOTOR_0_BASE 0x01002080
#define MOTOR_0_SPAN 32
#define ALT_MODULE_CLASS_motor_0 motor

/*
 * motor_1 configuration
 *
 */

#define MOTOR_1_NAME "/dev/motor_1"
#define MOTOR_1_TYPE "motor"
#define MOTOR_1_BASE 0x010020a0
#define MOTOR_1_SPAN 32
#define ALT_MODULE_CLASS_motor_1 motor

/*
 * motor_2 configuration
 *
 */

#define MOTOR_2_NAME "/dev/motor_2"
#define MOTOR_2_TYPE "motor"
#define MOTOR_2_BASE 0x010020c0
#define MOTOR_2_SPAN 32
#define ALT_MODULE_CLASS_motor_2 motor

/*
 * motor_3 configuration
 *
 */

#define MOTOR_3_NAME "/dev/motor_3"
#define MOTOR_3_TYPE "motor"
#define MOTOR_3_BASE 0x010020e0
#define MOTOR_3_SPAN 32
#define ALT_MODULE_CLASS_motor_3 motor

/*
 * motor_4 configuration
 *
 */

#define MOTOR_4_NAME "/dev/motor_4"
#define MOTOR_4_TYPE "motor"
#define MOTOR_4_BASE 0x01002100
#define MOTOR_4_SPAN 32
#define ALT_MODULE_CLASS_motor_4 motor

/*
 * system library configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER_0
#define ALT_TIMESTAMP_CLK none

/*
 * Devices associated with code sections.
 *
 */

#define ALT_TEXT_DEVICE       SDRAM_0
#define ALT_RODATA_DEVICE     SDRAM_0
#define ALT_RWDATA_DEVICE     SDRAM_0
#define ALT_EXCEPTIONS_DEVICE SDRAM_0
#define ALT_RESET_DEVICE      EPCS_FLASH_CONTROLLER_0


#endif /* __SYSTEM_H_ */
