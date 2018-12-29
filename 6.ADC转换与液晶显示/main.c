/*******************************************************************************
****STM8L15X例程
****版权信息：无锡市纳诺物联网科技有限公司 http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
#include "1621.h"
//定义LED、按键端口
#define LED1_PORT  GPIOC     
#define LED1_PINS  GPIO_Pin_4//绿色LED
#define LED2_PORT  GPIOB
#define LED2_PINS  GPIO_Pin_0//红色LED
#define LED3_PORT  GPIOD
#define LED3_PINS  GPIO_Pin_2//蓝色LED
#define KEY1_PORT  GPIOD
#define KEY1_PINS  GPIO_Pin_4//KEY1
#define KEY2_PORT  GPIOA
#define KEY2_PINS  GPIO_Pin_2//KEY2
#define KEY3_PORT  GPIOB
#define KEY3_PINS  GPIO_Pin_3//KEY3
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：不精确延时函数
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
void Delay(__IO uint16_t nCount)
{
    /* Decrement nCount value */
    while (nCount != 0)
    {
        nCount--;
    }
}
/*******************************************************************************
****入口参数：需要发送的字符串
****出口参数：无
****函数备注：USART发送函数
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
void USART_SendStr(unsigned char *Str) 
{
        while(*Str!=0)//不为结束
        {
            USART_SendData8(USART1,*Str);     //发送数据 
            while(!USART_GetFlagStatus (USART1,USART_FLAG_TXE));//等待发送完毕
            Str++;//下一个数据
        }
}
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：段码液晶显示ADC转换后的电压值，例程使用的是ADC1的CH8，也就是PD6，
              我们在板子上设计了2个模拟器件，一个是光敏电阻和10K的电阻分压，另一个是
							NTC热敏电阻和10K高精密电阻分压，测试的结果是将光敏电阻与10K电阻的分压值
							显示在段码液晶上。改变光敏电阻上方的光线强度，液晶上显示的电压值会改变
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
    u16 u16_adc1_value;//ADC采样后的值   
	  u16 VoltageValue;  //电压转换后的值
	
	  GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);
   
		Ht1621_Init();        //上电初始化LCD 
    Delay(100);           //延时一段时间 
   // Ht1621WrAllData(0,Ht1621Tab,16);// 清屏
 
    CLK_PeripheralClockConfig (CLK_Peripheral_ADC1,ENABLE);//开启ADC/USART时钟
    ADC_Init (ADC1,ADC_ConversionMode_Single,ADC_Resolution_12Bit,ADC_Prescaler_1);//ADC1初始化，单次转换/12位/ADC时钟1分频
    ADC_Cmd(ADC1,ENABLE);//ADC1使能
    ADC_ChannelCmd (ADC1,ADC_Channel_8,ENABLE);//ADC通道8，PD6
    
    Delay(100);           //延时一段时间 
    while (1)
    {
        Delay(5000);  
        Delay(5000); 
        Delay(5000); 
        Delay(5000); 
        ADC_SoftwareStartConv (ADC1);//ADC1软件触发
        while(!ADC_GetFlagStatus (ADC1,ADC_FLAG_EOC));//等待转换结束
        ADC_ClearFlag (ADC1,ADC_FLAG_EOC);//清除标志
        Delay(5000);  
        Delay(5000); 
        Delay(5000); 
        Delay(5000); 
        u16_adc1_value=ADC_GetConversionValue (ADC1);//获取转换值
        VoltageValue=u16_adc1_value*3300UL/4095UL;//电压转换
        
				//在段码液晶上进行显示
        data_convertor(VoltageValue);//转换为能够显示的数值
        Display();//显示数值
        Display_lcd_dot();//显示小数点
        Delay(5000);  
        Delay(5000); 
        Delay(5000); 
        Delay(5000); 
        Delay(5000);  
        Delay(5000); 
        Delay(5000); 
        Delay(5000); 
    }
   
   
}


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
