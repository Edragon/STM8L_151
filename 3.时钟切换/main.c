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
****函数备注：系统上电默认时钟为HSI/8=2M，根据LED闪烁频率来判断时钟源切换是否成功
              采用方法的是手动切换时钟源
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
    uint8_t i;  
   
    GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//初始化LED接口，带上拉推挽输出低
    
    
    
    //以下为HSI为系统时钟 16M
    CLK_HSICmd(ENABLE);//开始内部高频RC 16M
    CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);//HSI为系统时钟
    CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//不分频，即1分频，16M
    
    for(i=0;i<10;i++)//翻转LED
    {
       GPIO_ToggleBits(LED1_PORT, (GPIO_Pin_TypeDef)LED1_PINS);
       Delay(0xFFFF);
    }
    
    CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_8);//8分频，2M
    
    for(i=0;i<10;i++)//翻转LED
    {
       GPIO_ToggleBits(LED1_PORT, (GPIO_Pin_TypeDef)LED1_PINS);
       Delay(0xFFFF);
    }
    
    //以下为HSE为系统时钟    16M
    CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSE);//系统主时钟为HSE
    
    while(CLK_GetFlagStatus(CLK_FLAG_HSERDY)==RESET);//等待HSE准备就绪
    CLK_SYSCLKSourceSwitchCmd(ENABLE);//使能切换
    
    if(CLK_GetSYSCLKSource()==CLK_SYSCLKSource_HSE)//如果切换成功
    {
       CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_2);//2分频,8M
       for(i=0;i<10;i++)
       {
          GPIO_ToggleBits(LED1_PORT, LED1_PINS);
          Delay(0xFFFF);
        }
    }
    
    //以下为LSE为系统时钟    32768
    CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSE);//系统主时钟为LSE
    
    while(CLK_GetFlagStatus(CLK_FLAG_LSERDY)==RESET);//等待LSE准备就绪
    CLK_SYSCLKSourceSwitchCmd(ENABLE);//使能切换
    
    if(CLK_GetSYSCLKSource()==CLK_SYSCLKSource_LSE)//如果切换成功
    {
       CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//
       for(i=0;i<2;i++)
       {
          GPIO_ToggleBits(LED1_PORT, LED1_PINS);
          Delay(0x0FFF);
        }
    }
    
    
    //以下为LSI做系统时钟 32K
    while(1)
    {
        CLK_LSICmd (ENABLE);    //使能LSI
        CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);//LSI为系统时钟
        while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY)==RESET);//等待LSI准备就绪
        CLK_SYSCLKSourceSwitchCmd (ENABLE);//使能切换
        if(CLK_GetSYSCLKSource()==CLK_SYSCLKSource_LSI)//如果切换成功
       {
          
          CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//不分频  
          for(i=0;i<2;i++)
          {
             GPIO_ToggleBits(LED1_PORT, (GPIO_Pin_TypeDef)LED1_PINS);
             Delay(0x0FFF);
          }  
       }
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
