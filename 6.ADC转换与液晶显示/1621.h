#include "stm8l15x.h"


//HT1621ָ��
#define  BIAS     0x52             //0b1000 0101 0010  1/3duty 4com 
#define  SYSDIS   0X00             //0b1000 0000 0000  ����ϵͳ������LCDƫѹ������ 
#define  SYSEN    0X02             //0b1000 0000 0010 ��ϵͳ���� 
#define  LCDOFF   0X04             //0b1000 0000 0100  ��LCDƫѹ 
#define  LCDON    0X06             //0b1000 0000 0110  ��LCDƫѹ 
#define  XTAL     0x28             //0b1000 0010 1000 �ⲿ��ʱ�� 
#define  RC256    0X30             //0b1000 0011 0000  �ڲ�ʱ�� 
#define  WDTDIS1  0X0A            //0b1000 0000 1010  ��ֹ���Ź� 

//ģ��ӿڶ���
#define Ht1621_CS_PORT (GPIOD)
#define Ht1621_CS_PIN  (GPIO_Pin_0)

#define Ht1621_WR_PORT (GPIOD)
#define Ht1621_WR_PIN  (GPIO_Pin_1)

#define Ht1621_DAT_PORT (GPIOD)
#define Ht1621_DAT_PIN  (GPIO_Pin_2)

#define Ht1621_GND_PORT (GPIOD)
#define Ht1621_GND_PIN  (GPIO_Pin_3)

#define Ht1621_VCC_PORT (GPIOB)
#define Ht1621_VCC_PIN  (GPIO_Pin_0)

extern void Ht1621Wr_Data(unsigned char Data,unsigned char cnt) ;
extern void Ht1621WrCmd(unsigned char Cmd) ;
extern void Ht1621WrOneData(unsigned char Addr,unsigned char Data);
extern void Ht1621WrAllData(unsigned char Addr,unsigned char *p,unsigned char cnt);
extern void Ht1621_Init(void) ;
extern void Display(void) ;
extern void Display_lcd_dot(void) ;
extern void data_convertor(unsigned long adc_value) ;