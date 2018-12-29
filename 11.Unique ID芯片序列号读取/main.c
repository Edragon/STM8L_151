/*******************************************************************************
****STM8L15X����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
#include "stdio.h"
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
#define KEY3_PINS  GPIO_Pin_3

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
****��ڲ�������Ҫ���͵�16������
****���ڲ�������
****������ע��96λΨһID
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
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
****��ڲ�������
****���ڲ�������
****������ע����������RXD-UT TXD-UR����ñ�̽ӣ�ͨ��USB�����Ӽ�����뿪���壬��
              ������Ĵ��ڵ���������������ò��������Խ��յ������巢�͵��ַ�����ʽ��
              оƬID���ݡ�ʹ��ǰ��������Ȱ�װCH340������
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
    u8 ChipID[12];  
    unsigned char str[50];
	  
		//��ʼ��USART��2����--TXD-RXD
    GPIO_Init(GPIOC,GPIO_Pin_3,GPIO_Mode_Out_PP_High_Fast);//TXD
    GPIO_Init(GPIOC,GPIO_Pin_2,GPIO_Mode_In_PU_No_IT);//RXD
  
    CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//����USARTʱ��
    USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Tx);//USART��ʼ����9600��8N1
    USART_Cmd (USART1,ENABLE);//ʹ��USART
    USART_SendStr("����Ƕ��ʽ\r\n"); //�����ַ�����ĩβ����
    Get_ChipID(ChipID);//��ȡоƬID
    sprintf(str,"оƬID:%X%X-%X%X-%X%X-%X%X-%X%X-%X%X\r\n",ChipID[0],ChipID[1],ChipID[2],ChipID[3],ChipID[4],ChipID[5],ChipID[6],ChipID[7],ChipID[8],ChipID[9],ChipID[10],ChipID[11]);
		USART_SendStr(str);//���
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
