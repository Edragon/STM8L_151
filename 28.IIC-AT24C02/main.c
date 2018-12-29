/*******************************************************************************
****STM8L15X����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
#include "24c0x.h"
//����LED�������˿�
#define LED1_PORT  GPIOC     
#define LED1_PINS  GPIO_Pin_4//��ɫLED
#define LED2_PORT  GPIOB
#define LED2_PINS  GPIO_Pin_0//��ɫLED
#define LED3_PORT  GPIOD
#define LED3_PINS  GPIO_Pin_2//��ɫLED
#define KEY1_PORT  GPIOD
#define KEY1_PINS  GPIO_Pin_4//KEY1
#define KEY2_PORT  GPIOA
#define KEY2_PINS  GPIO_Pin_2//KEY2
#define KEY3_PORT  GPIOB
#define KEY3_PINS  GPIO_Pin_3//KEY3

unsigned char WBuf[]={"STM8L IIC��д24C0X!\r\n"};
#define BufferSize  30
unsigned char RBuf[BufferSize];
/*******************************************************************************
****��ڲ�������
****���ڲ�������
****������ע������ȷ��ʱ����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
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
****��ڲ�������Ҫ���͵��ַ���
****���ڲ�������
****������ע��USART���ͺ���
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
void USART_SendStr(unsigned char *Str) 
{
        while(*Str!=0)//��Ϊ����
        {
            USART_SendData8(USART1,*Str);     //�������� 
            while(!USART_GetFlagStatus (USART1,USART_FLAG_TXE));//�ȴ��������
            Str++;//��һ������
        }
}
/*******************************************************************************
****��ڲ�������
****���ڲ�������
****������ע������ͨ��Ӳ��IIC���ַ���д��AT24C02��Ȼ���ٽ����������ͨ��USART���ͳ���
              �ڼ������ͨ�����ڵ������ֿ�����֤�������ַ�����д����ַ����Ƿ���ͬ
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
	GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//��ʼ��LED1�ӿ�
		//��ʼ��USART��2����--TXD-RXD
	GPIO_Init(GPIOC,GPIO_Pin_3,GPIO_Mode_Out_PP_High_Fast);//TXD
	GPIO_Init(GPIOC,GPIO_Pin_2,GPIO_Mode_In_PU_No_IT);//RXD
	
	CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//����USART1ʱ��
	CLK_PeripheralClockConfig (CLK_Peripheral_I2C1,ENABLE);//����IIC1ʱ��
	
	USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Rx|USART_Mode_Tx);//����USART����9600��8N1������/����
    
	 
  USART_SendStr("STM8L IIC��д����:\r\n");
  
  InitIIC();//��ʼ��IIC�ӿ�
  EEPROM_WriteData(WBuf,EEPROM_BASE_ADDRESS,BufferSize);//���ַ���д��AT24C0X
  EEPROM_ReadData(RBuf,EEPROM_BASE_ADDRESS,BufferSize);//��AT24C0X��������
 
  USART_SendStr(RBuf);//������������ͨ��USART���ͳ���
	
	while(1)
	{
		GPIO_ToggleBits(LED1_PORT, LED1_PINS);//��תLED1�ӿڵ�ƽ��ʵ��LED1��˸
		Delay(0xFFFF);//��ʱ�����ڹ۲�ʵ������
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
