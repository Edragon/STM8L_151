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
****函数备注：STM8L151/2带ADC内部基准电压VREFINT，当芯片电源在工作范围内波动时，这个内部
              基准电压保持不变，一般为1.224V。该基准电压可以有专门的测量通道，可以
              获取其采样值。注意：VREFINT不是ADC的参考电压，参考电压还是VDD，一定不要混淆。
              具体可以看一下http://www.51hei.com/bbs/dpj-41009-1.html，利用此原理可以监控VDD.
              段码液晶会显示内部参考电压的电压值
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
	u16 u16_adc1_value;   
  u16 VoltageValue;
  
	Ht1621_Init();        //上电初始化LCD 
	Delay(100);           //延时一段时间 
	//Ht1621WrAllData(0,Ht1621Tab,16);// 清屏
	
  CLK_PeripheralClockConfig (CLK_Peripheral_ADC1,ENABLE);//开启ADC时钟
  ADC_Init (ADC1,ADC_ConversionMode_Single,ADC_Resolution_12Bit,ADC_Prescaler_1);//ADC1，单次采样，12位，1分频
  
  ADC_SamplingTimeConfig(ADC1,ADC_Group_FastChannels,ADC_SamplingTime_384Cycles);//采样周期设置
  ADC_VrefintCmd(ENABLE);//内部基准电压使能
  ADC_ChannelCmd (ADC1,ADC_Channel_Vrefint,ENABLE);//使能内部基准电压测量通道
  
  ADC_Cmd(ADC1,ENABLE);//ADC1使能
  
  
  while (1)
  {
       ADC_SoftwareStartConv (ADC1);//开启软件转换
             
       while(!ADC_GetFlagStatus (ADC1,ADC_FLAG_EOC));//等待转换结束
       ADC_ClearFlag (ADC1,ADC_FLAG_EOC);//清除相关标识
       
       u16_adc1_value=ADC_GetConversionValue (ADC1);//获取转换值
       VoltageValue=u16_adc1_value*3300UL/4095UL;
      
        data_convertor(VoltageValue);
        Display();
        Display_lcd_dot();
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
