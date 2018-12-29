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
****������ע: Ҫʵ����͹���CPU��IO��Ҫ���ȷ���ĵ�ƽ�����̳��˰�����LED�ӿ�����IOȫ������ͣ�
              ����Ҫʹ�ó��͹���ָ�
              
              ��������Ч��-LED��������HALT���𣬰����жϻỽ�ѣ�����ʱLED��Ϩ���жϽ�����
              LED���µ��������½���HALT��
              
              ʵ�������
              HALT������Դ-�ⲿ�жϺ�RESET��CPUֹͣ������ֹͣ����͹��Ĵ�Լ350-400na����
              ���������AN3147
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
		PWR_FastWakeUpCmd(ENABLE);  //���ٻ���ʹ��
     //IO�ڸ�λ��IO������Ϊ�������룬Ҫʵ�ֵ͹�������IOҪ����͵�ƽ
    GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
    
    
    GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO��ʼ��
    GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//��ʼ��������GPD4���������ж�����
    
    
    //�����ⲿ�жϣ����ڽ�CPU��Halt�͹���ģʽ����
    EXTI_DeInit (); //�ָ��жϵ��������� 
    EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//�ⲿ�ж�4���½��ش������жϴ�������stm8l15x_it.c�ļ����棬������12
    enableInterrupts();//ʹ���ж�
    
    //PWR_UltraLowPowerCmd(ENABLE);//���͹���
		
		//�����Ƭ��û�н������ߵĻ�������Ĵ��뽫LED�˿ڲ��ϵķ�ת��LED����˸������ʵ��������LEDһֱ
		//�ǵ���״̬��˵����Ƭ��ͨ��Haltָ���Ѿ���������״̬
    while(1)
    {
        Delay(0xFFFF);
        GPIO_ResetBits (GPIOC,GPIO_Pin_4);
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
