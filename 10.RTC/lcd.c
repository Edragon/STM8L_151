
#include "stm8l15x.h"
#include "./lcd.h"

uint8_t LCD_DisBuffer[4];//显示缓冲区     
//码值表                           /* 0     1        2       3      4   */
__CONST uint16_t  NumberMap[10] = {0x3132, 0x2020, 0x3212, 0x3222, 0x2320,
                                   /*  5      6       7       8      9   */
                                   0x1322, 0x1332, 0x3020, 0x3332, 0x3322};
//数值  BAGFCEDP  码值    
//0     11011110  3132
//1     10001000  2020
//2     11100110  3212
//3     11101010  3222

unsigned int tmp,n1, n2, n3, n4;

void InitLCD(void)
{
    CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);//LCD驱动时钟门控使能
    CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);//配置RTC LSI或LSE
    LCD_DeInit( );//LCD相关寄存器恢复初值
    LCD_Init(LCD_Prescaler_4, LCD_Divider_16,//LCD驱动初始化，LCD刷新频率
              LCD_Duty_1_4, LCD_Bias_1_3,//1/4DUTY 1/3BIAS，看屏幕参数
              LCD_VoltageSource_External);//选择LCD驱动电源，外部或内部

    LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0x00); //SEG0-7，STM8L152K4T6没有
    LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFF); //SEG8-SEG15，STM8L参考手册228页
    LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0x00); //以下SEG均没选用
    LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0x00);
    LCD_PortMaskConfig(LCD_PortMaskRegister_4, 0x00); 
    LCD_PortMaskConfig(LCD_PortMaskRegister_5, 0x00);
    LCD_ContrastConfig(LCD_Contrast_3V3);//配置对比度
    LCD_DeadTimeConfig(LCD_DeadTime_0); //设置死区时间
    LCD_PulseOnDurationConfig(LCD_PulseOnDuration_5);// 配置LCD脉冲持续时间
    //LCD_HighDriveCmd(ENABLE);
    LCD_Cmd(ENABLE);
}

/*******************************************************************************
****函数名称:
****函数功能:数据转换函数
****版本:V1.0
****日期:14-2-2014
****入口参数:adc_value-需要转换的数值
****出口参数:
****说明:
********************************************************************************/
void data_convertor(unsigned long adc_value) 
{  
    tmp=adc_value;         //adc 
    n4=tmp/1000;
    tmp=tmp%1000;
    n3=tmp/100;
    tmp=tmp%100;	
    n2=tmp/10;
    tmp=tmp%10;		
    n1=tmp; 
 }
void Display(void)
{    //对显示缓冲区操作，要结合液晶说明书 
      LCD_DisBuffer[0]=(((NumberMap[n4] &0xf000)>>12)<<0)|(((NumberMap[n3] &0xf000)>>12)<<2)|(((NumberMap[n2] &0xf000)>>12)<<4)|(((NumberMap[n1] &0xf000)>>12)<<6);//COM0,SEG15-SEG8
      LCD_DisBuffer[1]=(((NumberMap[n4] &0x0f00)>>8)<<0)|(((NumberMap[n3] &0x0f00)>>8)<<2)|(((NumberMap[n2] &0x0f00)>>8)<<4)|(((NumberMap[n1] &0x0f00)>>8)<<6);    //COM1
      LCD_DisBuffer[2]=(((NumberMap[n4] &0x00f0)>>4)<<0)|(((NumberMap[n3] &0x00f0)>>4)<<2)|(((NumberMap[n2] &0x00f0)>>4)<<4)|(((NumberMap[n1] &0x00f0)>>4)<<6);    //COM2
      LCD_DisBuffer[3]=(((NumberMap[n4] &0x000f)>>0)<<0)|(((NumberMap[n3] &0x000f)>>0)<<2)|(((NumberMap[n2] &0x000f)>>0)<<4)|(((NumberMap[n1] &0x000f)>>0)<<6);    //COM3
      
      //根据STM8L参考手册 228-229页说明和液晶接口原理图
      LCD_WriteRAM(LCD_RAMRegister_1,LCD_DisBuffer[0]);  //SEG8-SEG15对应寄存器RAM1，COM0
      
      LCD_WriteRAM(LCD_RAMRegister_4,LCD_DisBuffer[1]<<4);//COM1，SEG8-SEG11对应RAM4高四位
      LCD_WriteRAM(LCD_RAMRegister_5,LCD_DisBuffer[1]>>4);//COM1，SEG12-SEG15对应RAM5低四位
      
      LCD_WriteRAM(LCD_RAMRegister_8,LCD_DisBuffer[2]); //COM2，SEG8-SEG15对应RAM8
   
      LCD_WriteRAM(LCD_RAMRegister_11,LCD_DisBuffer[3]<<4);//COM3，SEG8-SEG11对应RAM11高四位
      LCD_WriteRAM(LCD_RAMRegister_12,LCD_DisBuffer[3]>>4);//COM3，SEG12-SEG15对应RAM12低四位
    
    
}
void Display_lcd_dot(void) 
{ 
    LCD_WriteRAM(LCD_RAMRegister_11,(LCD_DisBuffer[3]<<4)|0x40);//2P,COM3，SEG10对应RAM的第7位，所以要与0X40相或
   // LCD_WriteRAM(LCD_RAMRegister_12,LCD_DisBuffer[3]>>4|0x04; //4P
    //LCD_WriteRAM(LCD_RAMRegister_12,LCD_DisBuffer[3]>>4|0x01;//3P
}