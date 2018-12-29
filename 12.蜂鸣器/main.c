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

uint32_t frq=0;//LSI频率
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
/**
  * @brief  Compute the frequency of the LSI clock expressed in Hertz.
  * @note   The timer clock must be a high speed clock: HSI or HSE
  * @note   It is recommended to use the maximum clock frequency, that is 10 MHz,
  *         to obtain a more precise result.
  * @param  TIM2_TimerClockFreq The TIM2 clock frequency expressed in Hertz.
  * @retval LSI Clock Frequency value.
  */
uint32_t TIM2_ComputeLsiClockFreq(uint32_t TIM2_TimerClockFreq)
{
  uint32_t LSIClockFreq;
  uint16_t ICValue1, ICValue2;

  /* Capture only every 8 events!!! */
  TIM2_ICInit(TIM2_Channel_1, TIM2_ICPolarity_Rising, TIM2_ICSelection_DirectTI, TIM2_ICPSC_DIV8, 0x0);

  /* Enable CC1 interrupt */
  TIM2_ITConfig(TIM2_IT_CC1, ENABLE);

  /* Enable TIM2 */
  TIM2_Cmd(ENABLE);

  TIM2->SR1 = 0x00;
  TIM2->SR2 = 0x00;

  /* Clear CC1 Flag*/
  TIM2_ClearFlag(TIM2_FLAG_CC1);

  /* wait a capture on cc1 */
  while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
  {}
  /* Get CCR1 value*/
  ICValue1 = TIM2_GetCapture1();
  TIM2_ClearFlag(TIM2_FLAG_CC1);

  /* wait a capture on cc1 */
  while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
  {}
  /* Get CCR1 value*/
  ICValue2 = TIM2_GetCapture1();
  TIM2_ClearFlag(TIM2_FLAG_CC1);

  /* Disable IC1 input capture */
  TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
  /* Reset CCMR1 register */
  TIM2->CCMR1 = 0x00;
  /* Disable TIM2 */
  TIM2_Cmd(DISABLE);

  /* Compute LSI clock frequency */
  LSIClockFreq = (8 * TIM2_TimerClockFreq) / (ICValue2 - ICValue1);
  return LSIClockFreq;
}
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：蜂鸣器，P8跳线，烧程序的时候需要断开，烧完程序再短接。因为SWIM管脚
             和蜂鸣器管脚是复用的。
             使用LSI做蜂鸣器时钟源需要先校准LSI
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
    CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, ENABLE);//开启蜂鸣器时钟门控
    CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);//需要TIM2输入捕获测量LSI频率，所以TIM2时钟门控也开启
    
    BEEP_DeInit();//初始化蜂鸣器相关寄存器
    BEEP_Cmd(DISABLE); //蜂鸣器配置前需禁能
    
    CLK_BEEPClockConfig(CLK_BEEPCLKSource_LSI);//选择时钟源
    BEEP_LSClockToTIMConnectCmd(ENABLE);//LSI芯片内部连接至TIM2，以便测量LSI频率
    frq=TIM2_ComputeLsiClockFreq(2000000);//TIM2输入捕获测量LSI频率 
    BEEP_LSClockToTIMConnectCmd(DISABLE);//LSI芯片内部连接至TIM2，以便测量LSI频率  
    
    BEEP_LSICalibrationConfig(frq);//校准LSI
        
    BEEP_Init(BEEP_Frequency_1KHz);//设置鸣叫频率
    BEEP_Cmd(ENABLE);
  
  while (1)
  {  
    
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
