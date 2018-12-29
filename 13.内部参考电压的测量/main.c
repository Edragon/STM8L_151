/*******************************************************************************
****STM8L15X����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
#include "1621.h"
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
****������ע��STM8L151/2��ADC�ڲ���׼��ѹVREFINT����оƬ��Դ�ڹ�����Χ�ڲ���ʱ������ڲ�
              ��׼��ѹ���ֲ��䣬һ��Ϊ1.224V���û�׼��ѹ������ר�ŵĲ���ͨ��������
              ��ȡ�����ֵ��ע�⣺VREFINT����ADC�Ĳο���ѹ���ο���ѹ����VDD��һ����Ҫ������
              ������Կ�һ��http://www.51hei.com/bbs/dpj-41009-1.html�����ô�ԭ����Լ��VDD.
              ����Һ������ʾ�ڲ��ο���ѹ�ĵ�ѹֵ
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
	u16 u16_adc1_value;   
  u16 VoltageValue;
  
	Ht1621_Init();        //�ϵ��ʼ��LCD 
	Delay(100);           //��ʱһ��ʱ�� 
	//Ht1621WrAllData(0,Ht1621Tab,16);// ����
	
  CLK_PeripheralClockConfig (CLK_Peripheral_ADC1,ENABLE);//����ADCʱ��
  ADC_Init (ADC1,ADC_ConversionMode_Single,ADC_Resolution_12Bit,ADC_Prescaler_1);//ADC1�����β�����12λ��1��Ƶ
  
  ADC_SamplingTimeConfig(ADC1,ADC_Group_FastChannels,ADC_SamplingTime_384Cycles);//������������
  ADC_VrefintCmd(ENABLE);//�ڲ���׼��ѹʹ��
  ADC_ChannelCmd (ADC1,ADC_Channel_Vrefint,ENABLE);//ʹ���ڲ���׼��ѹ����ͨ��
  
  ADC_Cmd(ADC1,ENABLE);//ADC1ʹ��
  
  
  while (1)
  {
       ADC_SoftwareStartConv (ADC1);//�������ת��
             
       while(!ADC_GetFlagStatus (ADC1,ADC_FLAG_EOC));//�ȴ�ת������
       ADC_ClearFlag (ADC1,ADC_FLAG_EOC);//�����ر�ʶ
       
       u16_adc1_value=ADC_GetConversionValue (ADC1);//��ȡת��ֵ
       VoltageValue=u16_adc1_value*3300UL/4095UL;
      
        data_convertor(VoltageValue);
        Display();
        Display_lcd_dot();
        Delay(5000);  
        Delay(5000); 
        Delay(5000); 
        Delay(5000); 
        Delay(5000);  
        Delay(5000); 
        Delay(5000); 
        Delay(5000);
  }
}



/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
