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
****������ע������Һ����ʾADCת����ĵ�ѹֵ������ʹ�õ���ADC1��CH8��Ҳ����PD6��
              �����ڰ����������2��ģ��������һ���ǹ��������10K�ĵ����ѹ����һ����
							NTC���������10K�߾��ܵ����ѹ�����ԵĽ���ǽ�����������10K����ķ�ѹֵ
							��ʾ�ڶ���Һ���ϡ��ı���������Ϸ��Ĺ���ǿ�ȣ�Һ������ʾ�ĵ�ѹֵ��ı�
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
    u16 u16_adc1_value;//ADC�������ֵ   
	  u16 VoltageValue;  //��ѹת�����ֵ
	
	  GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);
   
		Ht1621_Init();        //�ϵ��ʼ��LCD 
    Delay(100);           //��ʱһ��ʱ�� 
   // Ht1621WrAllData(0,Ht1621Tab,16);// ����
 
    CLK_PeripheralClockConfig (CLK_Peripheral_ADC1,ENABLE);//����ADC/USARTʱ��
    ADC_Init (ADC1,ADC_ConversionMode_Single,ADC_Resolution_12Bit,ADC_Prescaler_1);//ADC1��ʼ��������ת��/12λ/ADCʱ��1��Ƶ
    ADC_Cmd(ADC1,ENABLE);//ADC1ʹ��
    ADC_ChannelCmd (ADC1,ADC_Channel_8,ENABLE);//ADCͨ��8��PD6
    
    Delay(100);           //��ʱһ��ʱ�� 
    while (1)
    {
        Delay(5000);  
        Delay(5000); 
        Delay(5000); 
        Delay(5000); 
        ADC_SoftwareStartConv (ADC1);//ADC1�������
        while(!ADC_GetFlagStatus (ADC1,ADC_FLAG_EOC));//�ȴ�ת������
        ADC_ClearFlag (ADC1,ADC_FLAG_EOC);//�����־
        Delay(5000);  
        Delay(5000); 
        Delay(5000); 
        Delay(5000); 
        u16_adc1_value=ADC_GetConversionValue (ADC1);//��ȡת��ֵ
        VoltageValue=u16_adc1_value*3300UL/4095UL;//��ѹת��
        
				//�ڶ���Һ���Ͻ�����ʾ
        data_convertor(VoltageValue);//ת��Ϊ�ܹ���ʾ����ֵ
        Display();//��ʾ��ֵ
        Display_lcd_dot();//��ʾС����
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
