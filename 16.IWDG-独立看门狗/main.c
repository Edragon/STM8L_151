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

#define RELOAD_VALUE   255
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
****������ע���������Ź����ú���
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
static void IWDG_Config(void)
{
  //ʹ��IWDG
  IWDG_Enable();
  //���д����  
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  //LSI����IWDG��LSI 256��Ƶ=38000/256
  IWDG_SetPrescaler(IWDG_Prescaler_256);
  
  /* IWDG timeout = (RELOAD_VALUE + 1) * Prescaler / LSI 
                  = (255 + 1) * 256 / 38 000 
                  = 1723.63 ms */
  IWDG_SetReload((uint8_t)RELOAD_VALUE);
  
  /* Reload IWDG counter */
  IWDG_ReloadCounter();
}
/*******************************************************************************
****��ڲ�������
****���ڲ�������
****������ע��������������������Ź�
              ���������жϣ��жϷ�����������������ж�TRAP��TRAP������while(1),
              �����Ͳ���ι�����Ӷ�����IWDG������������0��������λ����λ������ж�
              ��λ��־�ǲ���IWDG����ĸ�λ������ǣ������LED��
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{  
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  
  GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_High_Slow);//��ʼ��LED�˿�

  GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//��ʼ���������������룬���ж�

  EXTI_DeInit (); //�ָ��жϵ��������� 
  EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//�ⲿ�ж�4���½��ش�����������12
  
  enableInterrupts();//ʹ���ж�
  
  
  if(RST_GetFlagStatus(RST_FLAG_IWDGF) != RESET)//�ж�IWDG��λ��û�з���
     {     
        GPIO_ResetBits(LED1_PORT, LED1_PINS);//����LED
        //�����λ��־
        RST_ClearFlag(RST_FLAG_IWDGF);
      }
  else                                         //�������IWDG����ĸ�λ
     {
        GPIO_SetBits(LED1_PORT, LED1_PINS);
      }
  
    //����IWDG
  IWDG_Config();
  
  while (1)
  {  
    IWDG_ReloadCounter(); //ι��
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
