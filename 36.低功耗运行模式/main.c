/*******************************************************************************
****STM8L15X例程
****版权信息：无锡市纳诺物联网科技有限公司 http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
int _fctcpy(char name);
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
****函数备注: 低功耗运行模式
              此模式CPU与选中的外设运行，代码运行在RAM，时钟为LSI或LSE；FLASH/EEPROM
              被关闭，主电压调节器需关闭；进入此模式前所有中断需屏蔽；此模式仅STM8L15X系列支持
              实测功耗3.4ua左右，低于手册标称值；
              此模式只能通过软件退出
              具体说明请参阅AN3147
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
		_fctcpy('F');
		CLK_Config();//切换LSI为主时钟
     //IO口复位后IO被设置为浮动输入，要实现低功耗所有IO要输出低电平
    GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    
    
    GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO初始化
    GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，GPD4带上拉带中断输入
    
    CLK_MainRegulatorCmd(DISABLE);//关闭电压调节器
    
    while(1)
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
