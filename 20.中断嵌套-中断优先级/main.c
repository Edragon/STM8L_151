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
****��ڲ�������
****���ڲ�������
****������ע���жϵ����ȼ�����ͨ����������������ȼ����ı䣬Ĭ�����ȼ���3
              ���̽��ⲿ�ж�1��������ȼ�����Ϊ1�������ȼ�3Ҫ�͡����Ե��ⲿ�ж�1
              ����������ʱ���ⲿ�ж�2/3�ǿ��Դ���ⲿ�ж�1�Ĵ������ȴ����ⲿ�ж�
              2/3���������֮���ٷ�����������ϵ��ⲿ�ж�1����Ϊ�ж�Ƕ�ס�
              ���ⲿ�ж�2/3�ȷ���������ʱ���ⲿ�ж�1���ܴ�����ǵĴ�����Ȼ��
              ��ͬ������ȼ����ⲿ�ж�2/3�໥֮��Ҳ���ܴ�ϡ�
              �ⲿ�ж�1����---���װ尴������ɫLED�������������Ϩ��
              �ⲿ�ж�2����---����չ�尴��2����ɫLED�������������Ϩ��
              �ⲿ�ж�3����---����չ�尴��3����ɫLED�������������Ϩ��
              �Ȱ��װ尴��1���ⲿ�ж�1��Ӧ����ɫLED���������жϴ����������ʱ�����
						  ��ɫLED��ûϨ��ʱ����չ��İ���2/3������չ���LED2/3��������LED2/3
              ��ʱһ��ʱ����Ϩ��Ȼ��װ�LED��ʱһ��ʱ����Ϩ����˵��������
              �ж�Ƕ�ס�
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
	GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_High_Slow);//��ʼ��LED�˿�
  GPIO_Init(LED2_PORT,LED2_PINS,GPIO_Mode_Out_PP_High_Slow);//��ʼ��LED�˿�
  GPIO_Init(LED3_PORT,LED3_PINS,GPIO_Mode_Out_PP_High_Slow);//��ʼ��LED�˿�
  
  GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//��ʼ���������������룬���ж�
  GPIO_Init(KEY2_PORT, KEY2_PINS, GPIO_Mode_In_PU_IT);//��ʼ���������������룬���ж�
  GPIO_Init(KEY3_PORT, KEY3_PINS, GPIO_Mode_In_PU_IT);//��ʼ���������������룬���ж�
  
  
  EXTI_DeInit (); //�ָ��жϵ��������� 
  EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//�ⲿ�ж�4���½��ش�����������12
  EXTI_SetPinSensitivity (EXTI_Pin_2,EXTI_Trigger_Falling);//�ⲿ�ж�2���½��ش�����������10
  EXTI_SetPinSensitivity (EXTI_Pin_3,EXTI_Trigger_Falling);//�ⲿ�ж�3���½��ش�����������11
  
  ITC_SetSoftwarePriority(EXTI4_IRQn,ITC_PriorityLevel_1);//�����ⲿ�ж�4��������ȼ�Ϊ1�����ⲿ�ж�2/3Ĭ�ϵ�3�����ȼ�Ҫ�͡�
    
  enableInterrupts();//ʹ���ж�
  
  while (1)//�ȴ��ж�
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
