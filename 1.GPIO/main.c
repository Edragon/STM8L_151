/*******************************************************************************
****STM8L15X����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
//����LED�������˿�
#define LED1_PORT  GPIOC     //��ɫLED
#define LED1_PINS  GPIO_Pin_4
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
****������ע:��������
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
    GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//����������������͵�ƽ
    while(1)
    {    
        GPIO_ToggleBits(LED1_PORT, LED1_PINS);//��תPC4��ƽ,LED��˸
        Delay(0xFFFF);
    }
}



/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
