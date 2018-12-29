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

RTC_InitTypeDef   RTC_InitStr;
RTC_TimeTypeDef   RTC_TimeStr;
RTC_DateTypeDef   RTC_DateStr;
RTC_AlarmTypeDef  RTC_AlarmStr;
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
****函数备注: RTC初始化函数
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
void Calendar_Init(void)
{
  RTC_InitStr.RTC_HourFormat = RTC_HourFormat_24;
  RTC_InitStr.RTC_AsynchPrediv = 0x7f;
  RTC_InitStr.RTC_SynchPrediv = 0x0139;//调大 时间变慢，调小 时间变快
  RTC_Init(&RTC_InitStr);

  RTC_DateStructInit(&RTC_DateStr);
  RTC_DateStr.RTC_WeekDay = RTC_Weekday_Friday;
  RTC_DateStr.RTC_Date = 13;
  RTC_DateStr.RTC_Month = RTC_Month_May;
  RTC_DateStr.RTC_Year = 11;
  RTC_SetDate(RTC_Format_BIN, &RTC_DateStr);

  RTC_TimeStructInit(&RTC_TimeStr);
  RTC_TimeStr.RTC_Hours   = 01;
  RTC_TimeStr.RTC_Minutes = 00;
  RTC_TimeStr.RTC_Seconds = 00;
  RTC_SetTime(RTC_Format_BIN, &RTC_TimeStr);


  RTC_AlarmStructInit(&RTC_AlarmStr);
  RTC_AlarmStr.RTC_AlarmTime.RTC_Hours   = 01;
  RTC_AlarmStr.RTC_AlarmTime.RTC_Minutes = 01;
  RTC_AlarmStr.RTC_AlarmTime.RTC_Seconds = 00;
  RTC_AlarmStr.RTC_AlarmMask = RTC_AlarmMask_DateWeekDay;
  RTC_SetAlarm(RTC_Format_BIN, &RTC_AlarmStr);

  RTC_ITConfig(RTC_IT_ALRA, ENABLE);
  RTC_AlarmCmd(ENABLE);
}
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
    unsigned short temp1,temp2;
    CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);//RTC时钟使用LSE
    CLK_PeripheralClockConfig (CLK_Peripheral_RTC,ENABLE);//开启RTC时钟门控
    RTC_DeInit( ); //RTC初始化至初始状态
      
    Calendar_Init();
    
    Delay(100);           //延时一段时间 
    Ht1621_Init();        //上电初始化LCD
    Delay(100);           //延时一段时间 
		//Ht1621WrAllData(0,Ht1621Tab,16);// 清屏
  
    while (1)
    {
        RTC_GetTime(RTC_Format_BIN, &RTC_TimeStr);//获取目前时间
        temp1 = RTC_TimeStr.RTC_Seconds;//秒
        temp2=RTC_TimeStr.RTC_Minutes;  //分
        //以下为显示处理
        data_convertor(temp2*100+temp1);
        Display();//显示时间
        Display_lcd_dot();//显示符号
				Delay(0xffff);
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
