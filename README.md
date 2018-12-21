# Firmware_for_Core_Board_FPGA_STM32

ZJUNlict [Core Board (FPGA &amp; STM32)](https://github.com/ZJUNlict/Core_Board_FPGA_STM32)'s Firmware for the Robocup Soccer Small-Size League https://zjunlict.cn/ 

The firmware for the Cyclone III EP3C25 FPGA on this core board is designed using Altera (now Intel) [Quartus II 9.1](https://www.intel.com/content/www/us/en/programmable/downloads/software/quartus-ii-se/91.html) and [Nios II 9.1 IDE](https://www.intel.com/content/altera-www/global/en_us/index/downloads/software/nios-ii/91.html). The firmware for STM32F407 is designed using [Keil uVision 5](http://www2.keil.com/mdk5/uvision/). 

The main features are:
* Flexible Static Memory Controller communication between FPGA and STM32.
* FPGA Verilog programming handles BLDC driving, PWM generation and infrared detection. (Same as the [core board firmware](https://github.com/ZJUNlict/Firmware_for_Core_Board))
* STM32 handles radio communication and sensor fusion.

Other detailed information can be found in [ZJUNlict 2018 ETDP](https://zjunlict.cn/?page_id=54).

**Notice** : It's a testing board, the firmware is not well developed! (Certain functions are missing)