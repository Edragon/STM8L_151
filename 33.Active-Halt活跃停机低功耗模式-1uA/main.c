/*******************************************************************************
****STM8L15X例程
****版权信息：无锡市纳诺物联网科技有限公司 http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
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
****入口参数：无
****出口参数：无
****函数备注：RTC配置函数
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
void RTC_Config(void)
{
       //使能外部或者内部低速晶振
			 // CLK_LSEConfig(CLK_LSE_ON); 
			  CLK_LSICmd(ENABLE);
        while (CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == RESET);//等待晶振准备就绪
        CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);//RTC时钟分频
        
        RTC_WakeUpCmd(DISABLE);//需要先关闭RTC唤醒
        CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);//RTC时钟门控使能，RTC功能才可以使用
        RTC_WakeUpClockConfig(RTC_WakeUpClock_RTCCLK_Div16);//38K/16=2375HZ t=0.421ms
        
        Delay(0xffff);//延时等待配置生效，一定要加
    
        RTC_ITConfig(RTC_IT_WUT, ENABLE);//唤醒定时器中断使能
        RTC_SetWakeUpCounter(1000); //修改此值可改变唤醒的时间间隔
        RTC_WakeUpCmd(ENABLE);//RTC唤醒使能

        //ITC_SetSoftwarePriority(RTC_IRQn, ITC_PriorityLevel_3);//优先级
        
}
/*******************************************************************************
****函数说明：主函数
****入口参数:无
****出口参数:无
****函数备注: 要实现最低功耗CPU的IO口要输出确定的电平；例程除了按键与LED接口其他IO全部输出低；
              还需要使用超低功耗指令；
                            
              实测此例程
              ACTIVE-HALT：主振荡器/CPU/大多数外设停止；LSI/LSE运行；BEEP/IWDG/RTC/LCD的一个或多个
              使能之后即可通过Halt指令进入活跃停机低功耗模式
              
              实测电流大约1.1ua
              RTC中断唤醒，LED以一定频率闪烁
              具体请参阅AN3147
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
		PWR_FastWakeUpCmd(ENABLE);  //快速唤醒使能
		
		RTC_Config();//配置RTC
		
     //IO口复位后IO被设置为浮动输入，要实现低功耗所有IO要输出低电平
    GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    
    GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO初始化
    
    PWR_UltraLowPowerCmd(ENABLE);//超低功耗
		enableInterrupts();//使能中断
		
    while(1)
    {
        halt();//进入低功耗休眠模式
    }
}




#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
