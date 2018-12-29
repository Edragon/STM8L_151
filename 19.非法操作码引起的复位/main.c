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
****函数备注：主函数，非法操作码引起复位
              按键触发中断，中断服务程序里面跳转到一个指定的地址，这个地址里面
              存放了一个非法操作码，从而引发复位。复位后程序判断复位标志是不是
              非法操作码引起的复位，如果是，则点亮LED。
              非法操作码0x05/0x0B/0x71/0x75 
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{  
  FlagStatus IllOpFlag = RESET;
  GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_High_Slow);//初始化LED端口
    
  GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，上拉输入，带中断
    
  
  EXTI_DeInit (); //恢复中断的所有设置 
  EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//外部中断4，下降沿触发，向量号12
  
  
  enableInterrupts();//使能中断
  
  FLASH_Unlock(FLASH_MemType_Program);
  IllOpFlag = RST_GetFlagStatus(RST_FLAG_ILLOPF);
   if(IllOpFlag)//判断非法操作码复位有没有发生
     {     
        GPIO_ResetBits(LED1_PORT, LED1_PINS);//点亮LED
        //清掉复位标志
        RST_ClearFlag(RST_FLAG_ILLOPF);
      }
     else                                         //如果不是非法操作码引起的复位
     {
        GPIO_SetBits(LED1_PORT, LED1_PINS);
      }
    
  FLASH_ProgramByte(0x9F00, 0x05);
  while (1)//等待中断
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
