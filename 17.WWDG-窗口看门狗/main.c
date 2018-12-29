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

#define WINDOW_VALUE        97
#define COUNTER_INIT       104
__IO FunctionalState NonAlowedRefresh = DISABLE;
__IO FunctionalState AllowedRefresh = ENABLE;
uint8_t Index;
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
****����˵�����������Ź����ú���
****��ڲ���:��
****���ڲ���:��
****������ע:WWDG���ú�������ι���Ĵ���ʱ��Ϊ43.008ms-251.9ms
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
********************************************************************************/
static void WWDG_Config(void) 
{
  /* WWDG configuration: WWDG is clocked by SYSCLK = 2MHz */
  /* WWDG timeout is equal to 251,9 ms */
  /* Watchdog Window = (COUNTER_INIT - 63) * 1 step
                     = 41 * (12288 / 2Mhz)
                     = 251,9 ms
  */
  /* Non Allowed Window = (COUNTER_INIT - WINDOW_VALUE) * 1 step
                        = (104 - 97) * 1 step
                        =  7 * 1 step 
                        =  7 * (12288 / 2Mhz) 
                        =  43.008 ms
   */
  /* So the non allowed window starts from 0.0 ms to 43.008 ms
  and the allowed window starts from 43.008 ms to 251,9 ms
  If refresh is done during non allowed window, a reset will occur.
  If refresh is done during allowed window, no reset will occur.
  If the WWDG down counter reaches 63, a reset will occur. */
  WWDG_Init(COUNTER_INIT, WINDOW_VALUE);
}
/*******************************************************************************
****��ڲ�������
****���ڲ�������
****������ע����������ʱ��LED1��˸-�װ�LED�������ڴ���ʱ�䷶Χ��ι��
             ���°���1-�װ尴�������򲻻�ι����WWDG�ݼ���������0x40�ݼ���0X3Fʱ��
             ����WWDG��λ��ϵͳ��λ���жϸ�λԴ�������WWDG��λ����˸LED2-��չ��LED2
             ���°���2-��չ�尴��2���������WWDG�ݼ�������δ�ݼ�������ֵ֮ǰι����
             ����WWDG��λ��ϵͳ��λ���жϸ�λԴ�������WWDG��λ����˸LED2-��չ��LED2 
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{  
  GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);//��ʼ��LED�˿�
  GPIO_Init(LED2_PORT,LED2_PINS,GPIO_Mode_Out_PP_Low_Slow);//��ʼ��LED�˿�
   
  GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//��ʼ���������������룬���ж�
  GPIO_Init(KEY2_PORT, KEY2_PINS, GPIO_Mode_In_PU_IT);//��ʼ���������������룬���ж� 
  
  EXTI_DeInit (); //�ָ��жϵ��������� 
  EXTI_SetPinSensitivity (EXTI_Pin_2,EXTI_Trigger_Falling);//�ⲿ�ж�2���½��ش�����������10
  EXTI_SetPinSensitivity (EXTI_Pin_3,EXTI_Trigger_Falling);//�ⲿ�ж�3���½��ش�����������11
  
  enableInterrupts();//ʹ���ж�
  
  //�жϸ�λԴ�������WWDG��λ����ʹLE2--��չ���LED2��˸����
  if (RST_GetFlagStatus(RST_FLAG_WWDGF) != RESET)
  {
     for (Index = 7; Index != 0; Index--)
    {
      GPIO_ToggleBits(LED2_PORT,LED2_PINS);
      Delay(0x7FFF);
    }
    RST_ClearFlag(RST_FLAG_WWDGF);//�����λԴ��־
  }
  
  WWDG_Config();//WWDG����
  
  
  while (1)//�ȴ��ж�
  {
    //��ʼʱ��AllowedRefresh=ENABLE�������д˶γ��򣻰��°���1-�װ尴������ֵ���޸�ΪDISABLE����˳������У����������в�ι������WWDG�ݼ�������С��0X40ʱ�����WWDG��λ�ź�
    if (AllowedRefresh != DISABLE)
    {      
      while ((WWDG_GetCounter() & 0x7F) > WINDOW_VALUE);//�ȴ�WWDG�ݼ���������ֵС�ڴ���ֵʱ��ȥι�����򲻻�����λ
      WWDG_SetCounter(COUNTER_INIT);//ι��
    }
    //��ʼʱ��NonAlowedRefresh=DISABLE�������д˳��򣻰��°���2-��չ�尴��2����ֵ���޸�ΪENABLE���˳����������У�
    if (NonAlowedRefresh != DISABLE)
    {
      while ((WWDG_GetCounter() & 0x7F) < WINDOW_VALUE);//�ڴ��ڴ���ֵ
      WWDG_SetCounter(COUNTER_INIT);//ι��
    }
   
    GPIO_ToggleBits(LED1_PORT,LED1_PINS);
    Delay(0x6FFF);
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
