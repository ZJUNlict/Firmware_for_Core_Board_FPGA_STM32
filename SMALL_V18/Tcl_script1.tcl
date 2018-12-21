#Setup.tcl 
# Setup pin setting for EP3C25_3C16-V5 main board 
set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED" 
set_global_assignment -name ENABLE_INIT_DONE_OUTPUT OFF 
set_location_assignment PIN_149 -to clk                            
set_location_assignment PIN_90 -to reset                

#SDRAM
set_location_assignment PIN_37 -to sd_data\[0\] 
set_location_assignment PIN_38 -to sd_data\[1\]
set_location_assignment PIN_39 -to sd_data\[2\] 
set_location_assignment PIN_41 -to sd_data\[3\]
set_location_assignment PIN_43 -to sd_data\[4\] 
set_location_assignment PIN_44 -to sd_data\[5\]
set_location_assignment PIN_45 -to sd_data\[6\] 
set_location_assignment PIN_46 -to sd_data\[7\]
set_location_assignment PIN_69 -to sd_data\[8\] 
set_location_assignment PIN_70 -to sd_data\[9\]
set_location_assignment PIN_65 -to sd_data\[10\] 
set_location_assignment PIN_68 -to sd_data\[11\]
set_location_assignment PIN_63 -to sd_data\[12\] 
set_location_assignment PIN_64 -to sd_data\[13\]
set_location_assignment PIN_56 -to sd_data\[14\] 
set_location_assignment PIN_57 -to sd_data\[15\]

set_location_assignment PIN_94 -to sd_addr\[0\] 
set_location_assignment PIN_95 -to sd_addr\[1\]
set_location_assignment PIN_98 -to sd_addr\[2\] 
set_location_assignment PIN_99 -to sd_addr\[3\]
set_location_assignment PIN_84 -to sd_addr\[4\] 
set_location_assignment PIN_83 -to sd_addr\[5\]
set_location_assignment PIN_82 -to sd_addr\[6\] 
set_location_assignment PIN_81 -to sd_addr\[7\]
set_location_assignment PIN_78 -to sd_addr\[8\] 
set_location_assignment PIN_80 -to sd_addr\[9\]
set_location_assignment PIN_93 -to sd_addr\[10\] 
set_location_assignment PIN_73 -to sd_addr\[11\]

set_location_assignment PIN_88 -to sd_ba\[0\] 
set_location_assignment PIN_87 -to sd_ba\[1\]

set_location_assignment PIN_49 -to sd_dqm\[0\] 
set_location_assignment PIN_72 -to sd_dqm\[1\]

set_location_assignment PIN_55 -to sd_cs
set_location_assignment PIN_52 -to sd_ras
set_location_assignment PIN_51 -to sd_cas
set_location_assignment PIN_50 -to sd_we 
set_location_assignment PIN_76 -to sd_cke
set_location_assignment PIN_71 -to sd_clk

#epcs------------------------------------------
set_location_assignment PIN_23 -to epcs_dclk
set_location_assignment PIN_14 -to epcs_ce 
set_location_assignment PIN_12 -to epcs_do
set_location_assignment PIN_24 -to epcs_data

#AD TLC0834  -------------------------------------------------------

#AD_DO
set_location_assignment PIN_112 -to ad_dout
#AD_SARS
set_location_assignment PIN_114 -to ad_sars

#AD_CLK
set_location_assignment PIN_111 -to ad_clk_out
#AD_DI
set_location_assignment PIN_110 -to ad_din
#AD_/CS
set_location_assignment PIN_107 -to ad_cs

#Attack -------------------------------------------------------------

#SHOOT
set_location_assignment PIN_187 -to shoot_out


#CHIP

set_location_assignment PIN_186 -to chip_out

#SHOOT OFF
set_location_assignment PIN_89 -to shoot_off

#SHOOT_Manual
set_location_assignment PIN_119 -to shoot_manual
#CHIP_Manual
#set_location_assignment PIN_107 -to chip_manual

#DA TLV5620 ---------------------------------------------------------

#infra --------------------------------------------------------------

#INFRAIN
set_location_assignment PIN_201 -to infrain
#INFRA_Sig
set_location_assignment PIN_234 -to infra_pwm

#led ----------------------------------------------------------------

#LED1
set_location_assignment PIN_100 -to led\[0\]
#LED2
set_location_assignment PIN_103 -to led\[1\]
#BOARD_LED
set_location_assignment PIN_21 -to hull_fault1
set_location_assignment PIN_18 -to hull_fault2
set_location_assignment PIN_13 -to hull_fault3
set_location_assignment PIN_9 -to hull_fault4

#nF2401 -------------------------------------------------------------

#C_DATA
set_location_assignment PIN_133 -to nF2401_inout\[0\]
#C_CLK1
set_location_assignment PIN_131 -to nF2401_inout\[1\] 
#C_CLK2
#set_location_assignment PIN_80 -to nF2401_inout\[2\] 

#C_DR1
set_location_assignment PIN_132 -to nF2401_in
#C_DR2
#set_location_assignment PIN_81 -to nF2401_in\[1\]
#C_DOUT2
#set_location_assignment PIN_79 -to nF2401_in\[2\]

#C_CS
set_location_assignment PIN_127 -to nF2401_out\[0\] 
#C_CE
set_location_assignment PIN_126 -to nF2401_out\[1\] 
#C_PWR
set_location_assignment PIN_128 -to nF2401_out\[2\] 

#Buzzer
set_location_assignment PIN_216 -to Buzzer

#IIC -------------------------------------------------
#IIC_data
set_location_assignment PIN_106 -to scl_24
#IIC_clk
set_location_assignment PIN_108 -to sda_24

#IIC_data
set_location_assignment PIN_118 -to scl_9557
#IIC_clk
set_location_assignment PIN_117 -to sda_9557
#IIC_reset
set_location_assignment PIN_120 -to reset_9557

#RS232------------------------------------------------
#txd
set_location_assignment PIN_196 -to txd
#rxd
set_location_assignment PIN_197 -to rxd

#motor_control----------------------------------------
set_location_assignment PIN_238 -to SA1
set_location_assignment PIN_236 -to SB1
set_location_assignment PIN_239 -to SC1
set_location_assignment PIN_214 -to OC1
set_location_assignment PIN_4 -to SigA1
set_location_assignment PIN_5 -to SigB1
set_location_assignment PIN_235 -to AT1
set_location_assignment PIN_233 -to BT1
set_location_assignment PIN_231 -to CT1
set_location_assignment PIN_237 -to AB1
set_location_assignment PIN_232 -to BB1
set_location_assignment PIN_230 -to CB1

set_location_assignment PIN_171 -to SA2
set_location_assignment PIN_176 -to SB2
set_location_assignment PIN_168 -to SC2
set_location_assignment PIN_169 -to OC2
set_location_assignment PIN_202 -to SigA2
set_location_assignment PIN_203 -to SigB2
set_location_assignment PIN_181 -to AT2
set_location_assignment PIN_182 -to BT2
set_location_assignment PIN_184 -to CT2
set_location_assignment PIN_177 -to AB2
set_location_assignment PIN_183 -to BB2
set_location_assignment PIN_185 -to CB2

set_location_assignment PIN_147 -to SA3
set_location_assignment PIN_148 -to SB3
set_location_assignment PIN_146 -to SC3
set_location_assignment PIN_167 -to OC3
set_location_assignment PIN_134 -to SigA3
set_location_assignment PIN_135 -to SigB3
set_location_assignment PIN_160 -to AT3
set_location_assignment PIN_139 -to BT3
set_location_assignment PIN_137 -to CT3
set_location_assignment PIN_162 -to AB3
set_location_assignment PIN_143 -to BB3
set_location_assignment PIN_142 -to CB3

set_location_assignment PIN_217 -to SA4
set_location_assignment PIN_240 -to SB4
set_location_assignment PIN_212 -to SC4
set_location_assignment PIN_210 -to OC4
set_location_assignment PIN_211 -to SigA4
set_location_assignment PIN_207 -to SigB4
set_location_assignment PIN_219 -to AT4
set_location_assignment PIN_221 -to BT4
set_location_assignment PIN_224 -to CT4
set_location_assignment PIN_223 -to AB4
set_location_assignment PIN_218 -to BB4
set_location_assignment PIN_226 -to CB4

set_location_assignment PIN_150 -to SA5
set_location_assignment PIN_151 -to SB5
set_location_assignment PIN_152 -to SC5
set_location_assignment PIN_173 -to OC5
set_location_assignment PIN_164 -to AT5
set_location_assignment PIN_161 -to BT5
set_location_assignment PIN_145 -to CT5
set_location_assignment PIN_166 -to AB5
set_location_assignment PIN_159 -to BB5
set_location_assignment PIN_144 -to CB5

#SPI----------------------------------
set_location_assignment PIN_194 -to gyro_reset
set_location_assignment PIN_195 -to spi0_cs
set_location_assignment PIN_188 -to spi0_clk
set_location_assignment PIN_189 -to spi0_mosi
set_location_assignment PIN_200 -to spi0_miso