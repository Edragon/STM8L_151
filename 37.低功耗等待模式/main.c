/*******************************************************************************
****STM8L15X����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"

int _fctcpy(char name);
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
****������ע��ʱ�����ú�������
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
void CLK_Config(void)
{
  /* Select LSI as system clock source */
  CLK_SYSCLKSourceSwitchCmd(ENABLE);//ʹ��ʱ���л�
  CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);//ѡ���ڲ�����ʱ����Ϊʱ��Դ
  /* system clock prescaler: 1*/
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//����ϵͳʱ�ӷ�Ƶ
  while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_LSI);//�ȴ�ʱ���ȶ�
}
/*******************************************************************************
****����˵����������
****��ڲ���: ��
****���ڲ���: ��
****������ע: �͹��ĵȴ�ģʽ����ģʽ���ڵ͹�������ģʽ�Ļ�����ͨ��WFEָ����룬ͨ��
              ָ�����¼����ѣ�WFI����ʵ�ִ�ģʽ��
              ��ģʽ������Լ3.5ua
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
		_fctcpy('F');
		CLK_Config();//�л�LSIΪ��ʱ��
		
		CLK_HSICmd(DISABLE);//�ر�HSI�����в�ʹ�õ����裬ADC�ڴ�ģʽ����Ч���ر������ж�Դ
     //IO�ڸ�λ��IO������Ϊ�������룬Ҫʵ�ֵ͹�������IOҪ����͵�ƽ
    GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    
    
    //GPIO_Init(LED_GPIO_PORT, LED_GPIO_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO��ʼ��
    //GPIO_Init(KEY_GPIO_PORT, KEY_GPIO_PINS, GPIO_Mode_In_PU_IT);//��ʼ��������GPB6��������
    //EXTI_SetPinSensitivity(EXTI_Pin_6,EXTI_Trigger_Falling);
   // enableInterrupts();//ʹ���ж�  
    WFE_DeInit ();
    WFE_WakeUpSourceEventCmd (WFE_Source_EXTI_EV4,ENABLE);
    
   
    CLK_MainRegulatorCmd(DISABLE);//�رյ�ѹ������
    
    while(1)
    {
			/*CLK_MainRegulatorCmd(ENABLE);//�رյ�ѹ������ 
       Delay(0x0fFF);
       EXTI_ClearITPendingBit (EXTI_IT_Pin6);
       GPIO_ToggleBits(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
       Delay(0x0fFF);*/
       wfe();
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
