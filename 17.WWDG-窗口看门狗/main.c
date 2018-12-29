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

#define WINDOW_VALUE        97
#define COUNTER_INIT       104
__IO FunctionalState NonAlowedRefresh = DISABLE;
__IO FunctionalState AllowedRefresh = ENABLE;
uint8_t Index;
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
****函数说明：独立看门狗配置函数
****入口参数:无
****出口参数:无
****函数备注:WWDG配置函数允许喂狗的窗口时间为43.008ms-251.9ms
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
********************************************************************************/
static void WWDG_Config(void) 
{
  /* WWDG configuration: WWDG is clocked by SYSCLK = 2MHz */
  /* WWDG timeout is equal to 251,9 ms */
  /* Watchdog Window = (COUNTER_INIT - 63) * 1 step
                     = 41 * (12288 / 2Mhz)
                     = 251,9 ms
  */
  /* Non Allowed Window = (COUNTER_INIT - WINDOW_VALUE) * 1 step
                        = (104 - 97) * 1 step
                        =  7 * 1 step 
                        =  7 * (12288 / 2Mhz) 
                        =  43.008 ms
   */
  /* So the non allowed window starts from 0.0 ms to 43.008 ms
  and the allowed window starts from 43.008 ms to 251,9 ms
  If refresh is done during non allowed window, a reset will occur.
  If refresh is done during allowed window, no reset will occur.
  If the WWDG down counter reaches 63, a reset will occur. */
  WWDG_Init(COUNTER_INIT, WINDOW_VALUE);
}
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：正常运行时，LED1闪烁-底板LED，程序在窗口时间范围内喂狗
             按下按键1-底板按键，程序不会喂狗，WWDG递减计数器从0x40递减到0X3F时会
             产生WWDG复位，系统复位后判断复位源，如果是WWDG复位则闪烁LED2-扩展板LED2
             按下按键2-扩展板按键2，程序会在WWDG递减计数器未递减到窗口值之前喂狗，
             产生WWDG复位，系统复位后判断复位源，如果是WWDG复位则闪烁LED2-扩展板LED2 
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{  
  GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);//初始化LED端口
  GPIO_Init(LED2_PORT,LED2_PINS,GPIO_Mode_Out_PP_Low_Slow);//初始化LED端口
   
  GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，上拉输入，带中断
  GPIO_Init(KEY2_PORT, KEY2_PINS, GPIO_Mode_In_PU_IT);//初始化按键，上拉输入，带中断 
  
  EXTI_DeInit (); //恢复中断的所有设置 
  EXTI_SetPinSensitivity (EXTI_Pin_2,EXTI_Trigger_Falling);//外部中断2，下降沿触发，向量号10
  EXTI_SetPinSensitivity (EXTI_Pin_3,EXTI_Trigger_Falling);//外部中断3，下降沿触发，向量号11
  
  enableInterrupts();//使能中断
  
  //判断复位源，如果是WWDG复位，则使LE2--扩展板的LED2闪烁几次
  if (RST_GetFlagStatus(RST_FLAG_WWDGF) != RESET)
  {
     for (Index = 7; Index != 0; Index--)
    {
      GPIO_ToggleBits(LED2_PORT,LED2_PINS);
      Delay(0x7FFF);
    }
    RST_ClearFlag(RST_FLAG_WWDGF);//清掉复位源标志
  }
  
  WWDG_Config();//WWDG配置
  
  
  while (1)//等待中断
  {
    //初始时，AllowedRefresh=ENABLE，则运行此段程序；按下按键1-底板按键，此值被修改为DISABLE，则此程序不运行，整个程序中不喂狗，则WWDG递减计数器小于0X40时会产生WWDG复位信号
    if (AllowedRefresh != DISABLE)
    {      
      while ((WWDG_GetCounter() & 0x7F) > WINDOW_VALUE);//等待WWDG递减计数器的值小于窗口值时再去喂狗，则不会引起复位
      WWDG_SetCounter(COUNTER_INIT);//喂狗
    }
    //初始时，NonAlowedRefresh=DISABLE，则不运行此程序；按下按键2-扩展板按键2，此值被修改为ENABLE，此程序立即运行，
    if (NonAlowedRefresh != DISABLE)
    {
      while ((WWDG_GetCounter() & 0x7F) < WINDOW_VALUE);//在大于窗口值
      WWDG_SetCounter(COUNTER_INIT);//喂狗
    }
   
    GPIO_ToggleBits(LED1_PORT,LED1_PINS);
    Delay(0x6FFF);
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
