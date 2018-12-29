/*******************************************************************************
****STM8L15X例程
****版权信息：无锡市纳诺物联网科技有限公司 http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
#include "24c0x.h"
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

unsigned char WBuf[]={"STM8L IIC读写24C0X!\r\n"};
#define BufferSize  30
unsigned char RBuf[BufferSize];
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
****入口参数：需要发送的字符串
****出口参数：无
****函数备注：USART发送函数
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
void USART_SendStr(unsigned char *Str) 
{
        while(*Str!=0)//不为结束
        {
            USART_SendData8(USART1,*Str);     //发送数据 
            while(!USART_GetFlagStatus (USART1,USART_FLAG_TXE));//等待发送完毕
            Str++;//下一个数据
        }
}
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：程序通过硬件IIC将字符串写入AT24C02，然后再将其读出，并通过USART发送出来
              在计算机上通过串口调试助手可以验证读出的字符串如写入的字符串是否相同
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
	GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//初始化LED1接口
		//初始化USART的2个脚--TXD-RXD
	GPIO_Init(GPIOC,GPIO_Pin_3,GPIO_Mode_Out_PP_High_Fast);//TXD
	GPIO_Init(GPIOC,GPIO_Pin_2,GPIO_Mode_In_PU_No_IT);//RXD
	
	CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//开启USART1时钟
	CLK_PeripheralClockConfig (CLK_Peripheral_I2C1,ENABLE);//开启IIC1时钟
	
	USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Rx|USART_Mode_Tx);//设置USART参数9600，8N1，接收/发送
    
	 
  USART_SendStr("STM8L IIC读写测试:\r\n");
  
  InitIIC();//初始化IIC接口
  EEPROM_WriteData(WBuf,EEPROM_BASE_ADDRESS,BufferSize);//将字符串写入AT24C0X
  EEPROM_ReadData(RBuf,EEPROM_BASE_ADDRESS,BufferSize);//从AT24C0X读出数据
 
  USART_SendStr(RBuf);//将读出的数据通过USART发送出来
	
	while(1)
	{
		GPIO_ToggleBits(LED1_PORT, LED1_PINS);//翻转LED1接口电平，实现LED1闪烁
		Delay(0xFFFF);//延时，便于观察实验现象
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
