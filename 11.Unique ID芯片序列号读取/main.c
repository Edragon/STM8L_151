/*******************************************************************************
****STM8L15X例程
****版权信息：无锡市纳诺物联网科技有限公司 http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
#include "stdio.h"
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
#define KEY3_PINS  GPIO_Pin_3

uint8_t HexTable[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
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
****入口参数：需要发送的16进制数
****出口参数：无
****函数备注：96位唯一ID
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
********************************************************************************/
void Get_ChipID(u8 *ChipID)
{
	ChipID[0] = *(__IO u8 *)(0X4926); 
	ChipID[1] = *(__IO u8 *)(0X4927); 
	ChipID[2] = *(__IO u8 *)(0X4928);
	ChipID[3] = *(__IO u8 *)(0X4929);
	ChipID[4] = *(__IO u8 *)(0X492A); 
	ChipID[5] = *(__IO u8 *)(0X492B); 
	ChipID[6] = *(__IO u8 *)(0X492C);
	ChipID[7] = *(__IO u8 *)(0X492D); 
	ChipID[8] = *(__IO u8 *)(0X492E); 
	ChipID[9] = *(__IO u8 *)(0X492F);
	ChipID[10] = *(__IO u8 *)(0X4930); 
	ChipID[11] = *(__IO u8 *)(0X4931); 
}
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：开发板上RXD-UT TXD-UR跳线帽短接，通过USB线连接计算机与开发板，打开
              计算机的串口调试助手软件，设置参数，可以接收到开发板发送的字符串格式的
              芯片ID数据。使用前计算机需先安装CH340驱动。
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
    u8 ChipID[12];  
    unsigned char str[50];
	  
		//初始化USART的2个脚--TXD-RXD
    GPIO_Init(GPIOC,GPIO_Pin_3,GPIO_Mode_Out_PP_High_Fast);//TXD
    GPIO_Init(GPIOC,GPIO_Pin_2,GPIO_Mode_In_PU_No_IT);//RXD
  
    CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//开启USART时钟
    USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Tx);//USART初始化，9600，8N1
    USART_Cmd (USART1,ENABLE);//使能USART
    USART_SendStr("蓝旗嵌入式\r\n"); //发送字符串，末尾换行
    Get_ChipID(ChipID);//获取芯片ID
    sprintf(str,"芯片ID:%X%X-%X%X-%X%X-%X%X-%X%X-%X%X\r\n",ChipID[0],ChipID[1],ChipID[2],ChipID[3],ChipID[4],ChipID[5],ChipID[6],ChipID[7],ChipID[8],ChipID[9],ChipID[10],ChipID[11]);
		USART_SendStr(str);//输出
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
