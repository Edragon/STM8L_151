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
****函数备注：PVD-Power Voltage Detector,系统供电电压监测，监测VDD电压，如果VDD电压
              低于设定的阈值，则会进行相应处理。
              例程中，如果VDD电压高于阈值，则LED熄灭；如果VDD电压低于阈值，LED被点亮。
              例程采用两种方式：中断方式或查询PVD状态方式，两者不要同时使用，否则
              实验现象不明显
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
	GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);//初始化LED端口
  GPIO_SetBits (LED1_PORT,LED1_PINS);

  
  PWR_DeInit();//初始化
  PWR_PVDLevelConfig (PWR_PVDLevel_3V05);//阈值为3.05V
  PWR_PVDCmd(ENABLE);//PVD使能
  
  //注释掉的部分为PVD中断方式，如果VDD电压低于阈值，则进入PVD中断，PVD中断向量号5
  //PWR_PVDITConfig(ENABLE);//PVD中断使能
  //enableInterrupts();//使能中断
 
  while (1)
  {    //以下为查询方式判断PVD状态
       if(PWR_GetFlagStatus(PWR_FLAG_PVDOF)==RESET)//读取PVD状态，如果VDD电压高于阈值，则熄灭LED
       {
         GPIO_SetBits (LED1_PORT,LED1_PINS);
         Delay(0xffff);
       }
       else                                       //如果VDD电压低于阈值，则点亮LED
       {
         GPIO_ResetBits (LED1_PORT,LED1_PINS);
         Delay(0xffff);
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
