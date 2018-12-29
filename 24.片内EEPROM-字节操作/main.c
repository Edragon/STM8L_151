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
****函数备注:擦除/写/读指定地址的EEPROM，通过计算机的串口查看读出的数据是否为0F
             片内EEPROM地址为0x1000-0x13ff
             片内FLASH开始地址为0x8000,0x8000-0x807f为复位和中断向量表
             例程将0x0f写入1000的位置，然后读出后通过UART发送出来
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
	u8 r_byte;
	GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//带上拉，推挽输出低电平
	GPIO_Init(KEY1_PORT,KEY1_PINS,GPIO_Mode_In_PU_No_IT);//初始化KEY端口，带上拉输入，不带中断
  
  CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//开启USART时钟
  USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Tx|USART_Mode_Rx);//设置USART参数9600，8N1，接收/发送
  USART_ITConfig (USART1,USART_IT_RXNE,ENABLE);//使能接收中断
  USART_Cmd (USART1,ENABLE);//使能USART
  enableInterrupts(); 
  
  
  
  FLASH_DeInit();
  FLASH_Unlock(FLASH_MemType_Data);//先解锁，注意参数
  FLASH_EraseByte(0x1000);         //再擦除
  FLASH_ProgramByte(0x1000,0x0f);  //写数据，第一个参数为地址，第二个参数为写入的数据，1000为片内EEPROM区域的起始位置
  
  r_byte = FLASH_ReadByte(0x1000);//读指定地址的数据
  USART_SendData8 (USART1,r_byte);//通过UART发送，16进制
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
