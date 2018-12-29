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
****函数备注：时钟配置函数函数
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
void CLK_Config(void)
{
  /* Select LSI as system clock source */
  CLK_SYSCLKSourceSwitchCmd(ENABLE);//使能时钟切换
  CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);//选择内部低速时钟作为时钟源
  /* system clock prescaler: 1*/
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//设置系统时钟分频
  while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_LSI);//等待时钟稳定
}
/*******************************************************************************
****函数说明：主函数
****入口参数: 无
****出口参数: 无
****函数备注: 等待模式有两种WFI/WFE，分别指等待中断/等待事件，等待模式CPU停止，但是
              外设和中断控制器会继续工作；进入等待模式后，中断总开关自动打开；
              时钟尽量频率低；GPIO尽量输出低电平；
              实测电流大约200ua左右
              WFE等待的事件如果是中断，则不会进入中断响应函数
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
		CLK_Config();//切换LSI为主时钟
     //IO口复位后IO被设置为浮动输入，要实现低功耗所有IO要输出低电平
    GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    
    
    GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO初始化
    GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，GPD4带上拉带中断输入
    
    EXTI_SetPinSensitivity(EXTI_Pin_4,EXTI_Trigger_Falling);//外部中断4下降沿触发
    
    WFE_DeInit ();
    WFE_WakeUpSourceEventCmd (WFE_Source_EXTI_EV4,ENABLE);//指定外部中断4为等待的事件，WFE时不进入中断响应函数
    
		//如果低功耗模式不进入的话，则下面的程序会将LED的亮灭状态不断的翻转，如果进入了WFE低功耗模式，则指定的事件-按键4中断
		//发生之后LED的亮灭状态才会翻转
    while(1)
    {
        EXTI_ClearITPendingBit (EXTI_IT_Pin4);//清中断标志
        GPIO_ToggleBits(LED1_PORT, (GPIO_Pin_TypeDef)LED1_PINS);//翻转LED端口电平
        Delay(0x00FF);
        
        wfe();//进入WFE模式
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
