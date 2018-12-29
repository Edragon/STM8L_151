#ifndef _DS18B20_H_
#define _DS18B20_H_
//#include "stm8l15x_clk.h"
#define DQ_PORT		GPIOD//设置DQ引脚
#define DQ_PIN		GPIO_Pin_4
#define SET_OP_1WIRE 	GPIO_SetBits(DQ_PORT, DQ_PIN)
#define CLR_OP_1WIRE 	GPIO_ResetBits(DQ_PORT, DQ_PIN)
#define SET_DIR_1WIRE	GPIO_Init(DQ_PORT,DQ_PIN,GPIO_Mode_Out_PP_Low_Fast);
#define CLR_DIR_1WIRE 	GPIO_Init(DQ_PORT,DQ_PIN,GPIO_Mode_In_FL_No_IT);
#define CHECK_IP_1WIRE  GPIO_ReadInputDataBit(DQ_PORT, DQ_PIN)
extern void delay_10us(u16 n_10us);
extern void delay_ms(u16 n_ms);
unsigned char init_1820(void);
unsigned int gettemp(void);    //读取温度值
#endif 