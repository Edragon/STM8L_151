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

#define RELOAD_VALUE   255
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
****函数备注：独立看门狗配置函数
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
static void IWDG_Config(void)
{
  //使能IWDG
  IWDG_Enable();
  //解除写保护  
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  //LSI驱动IWDG，LSI 256分频=38000/256
  IWDG_SetPrescaler(IWDG_Prescaler_256);
  
  /* IWDG timeout = (RELOAD_VALUE + 1) * Prescaler / LSI 
                  = (255 + 1) * 256 / 38 000 
                  = 1723.63 ms */
  IWDG_SetReload((uint8_t)RELOAD_VALUE);
  
  /* Reload IWDG counter */
  IWDG_ReloadCounter();
}
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：主函数，软件独立看门狗
              按键触发中断，中断服务程序里面调用软件中断TRAP，TRAP里面是while(1),
              这样就不会喂狗，从而导致IWDG计数器计数到0，引发复位。复位后程序判断
              复位标志是不是IWDG引起的复位，如果是，则点亮LED。
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{  
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  
  GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_High_Slow);//初始化LED端口

  GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，上拉输入，带中断

  EXTI_DeInit (); //恢复中断的所有设置 
  EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//外部中断4，下降沿触发，向量号12
  
  enableInterrupts();//使能中断
  
  
  if(RST_GetFlagStatus(RST_FLAG_IWDGF) != RESET)//判断IWDG复位有没有发生
     {     
        GPIO_ResetBits(LED1_PORT, LED1_PINS);//点亮LED
        //清掉复位标志
        RST_ClearFlag(RST_FLAG_IWDGF);
      }
  else                                         //如果不是IWDG引起的复位
     {
        GPIO_SetBits(LED1_PORT, LED1_PINS);
      }
  
    //配置IWDG
  IWDG_Config();
  
  while (1)
  {  
    IWDG_ReloadCounter(); //喂狗
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
