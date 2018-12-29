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
****������ע��ϵͳ�ϵ�Ĭ��ʱ��ΪHSI/8=2M������LED��˸Ƶ�����ж�ʱ��Դ�л��Ƿ�ɹ�
              ���÷��������ֶ��л�ʱ��Դ
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
    uint8_t i;  
   
    GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//��ʼ��LED�ӿڣ����������������
    
    
    
    //����ΪHSIΪϵͳʱ�� 16M
    CLK_HSICmd(ENABLE);//��ʼ�ڲ���ƵRC 16M
    CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);//HSIΪϵͳʱ��
    CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//����Ƶ����1��Ƶ��16M
    
    for(i=0;i<10;i++)//��תLED
    {
       GPIO_ToggleBits(LED1_PORT, (GPIO_Pin_TypeDef)LED1_PINS);
       Delay(0xFFFF);
    }
    
    CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_8);//8��Ƶ��2M
    
    for(i=0;i<10;i++)//��תLED
    {
       GPIO_ToggleBits(LED1_PORT, (GPIO_Pin_TypeDef)LED1_PINS);
       Delay(0xFFFF);
    }
    
    //����ΪHSEΪϵͳʱ��    16M
    CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSE);//ϵͳ��ʱ��ΪHSE
    
    while(CLK_GetFlagStatus(CLK_FLAG_HSERDY)==RESET);//�ȴ�HSE׼������
    CLK_SYSCLKSourceSwitchCmd(ENABLE);//ʹ���л�
    
    if(CLK_GetSYSCLKSource()==CLK_SYSCLKSource_HSE)//����л��ɹ�
    {
       CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_2);//2��Ƶ,8M
       for(i=0;i<10;i++)
       {
          GPIO_ToggleBits(LED1_PORT, LED1_PINS);
          Delay(0xFFFF);
        }
    }
    
    //����ΪLSEΪϵͳʱ��    32768
    CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSE);//ϵͳ��ʱ��ΪLSE
    
    while(CLK_GetFlagStatus(CLK_FLAG_LSERDY)==RESET);//�ȴ�LSE׼������
    CLK_SYSCLKSourceSwitchCmd(ENABLE);//ʹ���л�
    
    if(CLK_GetSYSCLKSource()==CLK_SYSCLKSource_LSE)//����л��ɹ�
    {
       CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//
       for(i=0;i<2;i++)
       {
          GPIO_ToggleBits(LED1_PORT, LED1_PINS);
          Delay(0x0FFF);
        }
    }
    
    
    //����ΪLSI��ϵͳʱ�� 32K
    while(1)
    {
        CLK_LSICmd (ENABLE);    //ʹ��LSI
        CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);//LSIΪϵͳʱ��
        while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY)==RESET);//�ȴ�LSI׼������
        CLK_SYSCLKSourceSwitchCmd (ENABLE);//ʹ���л�
        if(CLK_GetSYSCLKSource()==CLK_SYSCLKSource_LSI)//����л��ɹ�
       {
          
          CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//����Ƶ  
          for(i=0;i<2;i++)
          {
             GPIO_ToggleBits(LED1_PORT, (GPIO_Pin_TypeDef)LED1_PINS);
             Delay(0x0FFF);
          }  
       }
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
