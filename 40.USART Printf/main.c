/*******************************************************************************
******************��������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD *****************
*************************http://lenchimcu.taobao.com****************************
********************************************************************************
****���̼��:STM8L152K4������ӳ�亯��
*******************************************************************************/
#include "stm8l15x.h"
#include "stdio.h"        //����C�⺯��
//����LED�밴���ӿ�
#define LED_GPIO_PORT  GPIOC
#define LED_GPIO_PINS  GPIO_Pin_4
#define KEY_GPIO_PORT  GPIOD
#define KEY_GPIO_PINS  GPIO_Pin_4
//������Ҫ���
#define PUTCHAR_PROTOTYPE int putchar (int c)
#define GETCHAR_PROTOTYPE int getchar (void)

PUTCHAR_PROTOTYPE
{  
  USART_SendData8(USART1,c);
  while (USART_GetFlagStatus(USART1,USART_FLAG_TXE) == RESET);

  return (c);
}

/*******************************************************************************
****��ڲ�������
****���ڲ�������
****������ע����������RXD-UT TXD-UR����ñ�̽ӣ�ͨ��USB�����Ӽ�����뿪���壬��
              ������Ĵ��ڵ���������������ò��������Խ��յ������巢�͵��ַ�����ʽ��
              ���ݡ�ʹ��ǰ��������Ȱ�װCH340������
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
    CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//����USARTʱ��
    USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Tx);//USART��ʼ����9600��8N1
    USART_Cmd (USART1,ENABLE);//ʹ��USART
    
    u8 aa=200;//��㶨��һ������
    printf("����Ƕ��ʽUSART_Printf\r\n"); //�����ַ�����ĩβ����
    printf("b= %d\r\n",aa);//���ͱ���
    while(1)
    {
        
    }
    
}

/*******************************************************************************
***********��������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD *************************
*************************http://lenchimcu.taobao.com****************************
*******************************************************************************/
