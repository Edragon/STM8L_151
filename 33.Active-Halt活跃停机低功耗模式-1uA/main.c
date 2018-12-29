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
****������ע��RTC���ú���
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
void RTC_Config(void)
{
       //ʹ���ⲿ�����ڲ����پ���
			 // CLK_LSEConfig(CLK_LSE_ON); 
			  CLK_LSICmd(ENABLE);
        while (CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == RESET);//�ȴ�����׼������
        CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);//RTCʱ�ӷ�Ƶ
        
        RTC_WakeUpCmd(DISABLE);//��Ҫ�ȹر�RTC����
        CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);//RTCʱ���ſ�ʹ�ܣ�RTC���ܲſ���ʹ��
        RTC_WakeUpClockConfig(RTC_WakeUpClock_RTCCLK_Div16);//38K/16=2375HZ t=0.421ms
        
        Delay(0xffff);//��ʱ�ȴ�������Ч��һ��Ҫ��
    
        RTC_ITConfig(RTC_IT_WUT, ENABLE);//���Ѷ�ʱ���ж�ʹ��
        RTC_SetWakeUpCounter(1000); //�޸Ĵ�ֵ�ɸı份�ѵ�ʱ����
        RTC_WakeUpCmd(ENABLE);//RTC����ʹ��

        //ITC_SetSoftwarePriority(RTC_IRQn, ITC_PriorityLevel_3);//���ȼ�
        
}
/*******************************************************************************
****����˵����������
****��ڲ���:��
****���ڲ���:��
****������ע: Ҫʵ����͹���CPU��IO��Ҫ���ȷ���ĵ�ƽ�����̳��˰�����LED�ӿ�����IOȫ������ͣ�
              ����Ҫʹ�ó��͹���ָ�
                            
              ʵ�������
              ACTIVE-HALT��������/CPU/���������ֹͣ��LSI/LSE���У�BEEP/IWDG/RTC/LCD��һ������
              ʹ��֮�󼴿�ͨ��Haltָ������Ծͣ���͹���ģʽ
              
              ʵ�������Լ1.1ua
              RTC�жϻ��ѣ�LED��һ��Ƶ����˸
              ���������AN3147
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
		PWR_FastWakeUpCmd(ENABLE);  //���ٻ���ʹ��
		
		RTC_Config();//����RTC
		
     //IO�ڸ�λ��IO������Ϊ�������룬Ҫʵ�ֵ͹�������IOҪ����͵�ƽ
    GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    
    GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO��ʼ��
    
    PWR_UltraLowPowerCmd(ENABLE);//���͹���
		enableInterrupts();//ʹ���ж�
		
    while(1)
    {
        halt();//����͹�������ģʽ
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
