/*******************************************************************************
****STM8L15X����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
//����LED�������˿�
#define LED1_PORT  GPIOC
#define LED1_PINS  GPIO_Pin_4
#define LED2_PORT  GPIOB
#define LED2_PINS  GPIO_Pin_4
#define LED3_PORT  GPIOB
#define LED3_PINS  GPIO_Pin_2
#define KEY1_PORT  GPIOD
#define KEY1_PINS  GPIO_Pin_4
#define KEY2_PORT  GPIOA
#define KEY2_PINS  GPIO_Pin_2
#define KEY3_PORT  GPIOB
#define KEY3_PINS  GPIO_Pin_3
/*******************************************************************************
****����˵����������
****��ڲ���:��
****���ڲ���:��
****������ע:��������
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
  /* Infinite loop */
  while (1)
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
