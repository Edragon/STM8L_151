/*******************************************************************************
****STM8L15X����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
#include "flash.h"
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

uint8_t i=0;
unsigned short FlashID;
#define countof(a) (sizeof(a) / sizeof(*(a)))
#define  BufferSize (countof(SendBuf))
unsigned char SendBuf[]="STM8L SPI����25X16 ʵ�飡\r\n";
unsigned char RecBuf[BufferSize];
uint8_t HexTable[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
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
****��ڲ�������Ҫ���͵��ֽ�
****���ڲ�������
****������ע��USART�����ֽں���
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
void Send_Dat(u8 dat)
{
   while(( USART_GetFlagStatus(USART1,USART_FLAG_TXE)==RESET));
   USART_SendData8(USART1,dat);
}
/*******************************************************************************
****��ڲ�������Ҫ���͵�ʮ������
****���ڲ�������
****������ע��USART����HEX����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
void Send_Hex(unsigned char dat)
{
   Send_Dat('0');
   Send_Dat('x');
   Send_Dat(HexTable[dat>>4]);
   Send_Dat(HexTable[dat&0x0f]);
   Send_Dat(' ');
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
****������ע������ͨ��Ӳ��SPI���ַ���д��W25X16��Ȼ���ٽ����������ͨ��USART���ͳ���
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
  CLK_PeripheralClockConfig (CLK_Peripheral_SPI1,ENABLE);//����SPIʱ��
	
	USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Rx|USART_Mode_Tx);//����USART����9600��8N1������/����
  USART_SendStr("STM8L SPI��д����:\r\n");
  
	//��ʼ��SPI��3���ܽ�
	GPIO_Init(GPIOB, GPIO_Pin_5, GPIO_Mode_Out_PP_High_Fast);
	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_Out_PP_High_Fast);
	GPIO_Init(GPIOB, GPIO_Pin_7, GPIO_Mode_In_PU_No_IT);
	
  SPI_Flash_Init();//SPI��ʼ��
  USART_SendStr("���ڶ�ȡоƬID\r\n");
  FlashID=SPI_FLASH_ReadID();//��ȡW25X16оƬID
  USART_SendStr("оƬIDΪ:");
  Send_Hex(FlashID>>8);
  Send_Hex(FlashID&0xff);
	USART_SendStr("\r\n");

  
  SPI_FLASH_WriteEnable();
  USART_SendStr("��ʼ��������оƬ......\r\n");
  SPI_Flash_EraseChip();
  SPI_FLASH_BlockErase(0);
  USART_SendStr("оƬ������ϣ�\r\n");

  USART_SendStr("��ʼд������\r\n");
 
  SPI_FLASH_BufferWrite(SendBuf, 0, BufferSize);
  //SPI_FLASH_PageWrite(SendBuf, 10, BufferSize);
  //SPI_FLASH_PageWrite("2020", 0, 4);
  USART_SendStr("д��������ϣ�\r\n");
  
  USART_SendStr("��ʼ��������\r\n");
  SPI_FLASH_BufferRead(RecBuf, 0,BufferSize);
  USART_SendStr("����������ϣ�\r\n");
  
  USART_SendStr(RecBuf);//������������ͨ��USART����
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
