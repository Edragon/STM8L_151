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
****函数说明：主函数
****入口参数:无
****出口参数:无
****函数备注: 要实现最低功耗CPU的IO口要输出确定的电平；例程除了按键与LED接口其他IO全部输出低；
              还需要使用超低功耗指令；
              
              程序运行效果-LED被点亮后被HALT挂起，按键中断会唤醒，唤醒时LED被熄灭；中断结束，
              LED重新点亮，重新进入HALT，
              
              实测此例程
              HALT：唤醒源-外部中断和RESET，CPU停止，外设停止，最低功耗大约350-400na左右
              具体请参阅AN3147
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
		PWR_FastWakeUpCmd(ENABLE);  //快速唤醒使能
     //IO口复位后IO被设置为浮动输入，要实现低功耗所有IO要输出低电平
    GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    
    
    GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO初始化
    GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，GPD4带上拉带中断输入
    
    
    //设置外部中断，用于将CPU从Halt低功耗模式唤醒
    EXTI_DeInit (); //恢复中断的所有设置 
    EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//外部中断4，下降沿触发，中断处理函数在stm8l15x_it.c文件里面，向量号12
    enableInterrupts();//使能中断
    
    //PWR_UltraLowPowerCmd(ENABLE);//超低功耗
		
		//如果单片机没有进入休眠的话，下面的代码将LED端口不断的翻转，LED会闪烁，但是实际现象是LED一直
		//是点亮状态，说明单片机通过Halt指令已经进入休眠状态
    while(1)
    {
        Delay(0xFFFF);
        GPIO_ResetBits (GPIOC,GPIO_Pin_4);
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
