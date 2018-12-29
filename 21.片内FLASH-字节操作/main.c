/*******************************************************************************
****STM8L15X����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
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
****����˵����������
****��ڲ���:��
****���ڲ���:��
****������ע:����/д/��ָ����ַ��FLASH��ͨ��������Ĵ��ڲ鿴�����������Ƿ�Ϊ0F
             Ƭ��EEPROM��ַΪ0x1000-0x13ff
             Ƭ��FLASH��ʼ��ַΪ0x8000,0x8000-0x807fΪ��λ���ж�������
             ���̽�0x0fд��9f40��λ�ã�Ȼ�������ͨ��UART���ͳ����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
	u8 r_byte;
	GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//����������������͵�ƽ
	GPIO_Init(KEY1_PORT,KEY1_PINS,GPIO_Mode_In_PU_No_IT);//��ʼ��KEY�˿ڣ����������룬�����ж�
 
  CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//����USARTʱ��
  USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Tx|USART_Mode_Rx);//����USART����9600��8N1������/����
  USART_ITConfig (USART1,USART_IT_RXNE,ENABLE);//ʹ�ܽ����ж�
  USART_Cmd (USART1,ENABLE);//ʹ��USART
  enableInterrupts(); 
    
  FLASH_DeInit();
  FLASH_Unlock(FLASH_MemType_Program);//�Ƚ�����ע�����
  FLASH_EraseByte(0x9f40);         //�ٲ���
  FLASH_ProgramByte(0x9f40,0x0f);  //д���ݣ���һ������Ϊ��ַ���ڶ�������Ϊд������ݣ�9f40ΪƬ��flash���򿿽��м��λ��
  
  r_byte = FLASH_ReadByte(0x9f40);//��ָ����ַ������
  USART_SendData8 (USART1,r_byte);//ͨ��UART���ͣ�16����
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
