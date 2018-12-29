/*******************************************************************************
****STM8L15X����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
#include "1621.h"
#include "dht11.h"
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

unsigned char DHTData[4];//={0,0,0,0};
unsigned char Temp;
unsigned char Humi;
unsigned char Ht1621Tab[]={0x00,0x00,0x00,0x00};
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
****������ע��DHT11�����¶ȡ�ʪ�ȣ������¶ȡ�ʪ�ȹ����ڶ���Һ������ʾ��DHT11
              ��PD4
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
	  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	  Ht1621_Init();        //�ϵ��ʼ��LCD 
	  Delay(100);           //��ʱһ��ʱ��
   
    while (1)
    {
       while(!DHT11_Start());
     
       while(!Get_data(DHTData));
       Delay(0xFFFF);
       Delay(0xFFFF); 
       Delay(0xFFFF); 
       Delay(0xFFFF);
       Temp=(DHTData[2]>>4)*16+(DHTData[2]&0x0f);
       Humi=(DHTData[0]>>4)*16+(DHTData[0]&0x0f);
       data_convertor(Temp*100);//��Һ������ʾ�¶�
       Display();//��ʾ
       Display_lcd_dot();//��ʾС����
       //������ʱΪ������Ļ�Ϲ۲쵽
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       data_convertor(Humi*100);//��Һ������ʾʪ��
       Display();//��ʾ
       Display_lcd_dot();//��ʾС����
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);   
    }
}


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
