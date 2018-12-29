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

uint8_t val= 0x00;
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
****������ע:����/д/��ָ����ַ��FLASH��ͨ��������Ĵ��ڲ鿴�����������Ƿ�Ϊ0F
             Ƭ��EEPROM��ַΪ0x1000-0x13ff
             Ƭ��FLASH��ʼ��ַΪ0x8000,0x8000-0x807fΪ��λ���ж�������
             ����ѡ��flash��ַΪ0x9f40
             �Ƚ��ĸ��ֽ�д�룬Ȼ��һ���ֽ�һ���ֽڵĶ�����֤��������Ǻ�д���
             ������ͬ�������LED����˸������LED����ġ�
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
	uint32_t start_add = 0x9f40;
  uint32_t add = 0x0;
  uint32_t new_val = 0x01234567;
  uint8_t sub_test_count = 0x0;
  GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);//��ʼ��LED�˿�
  GPIO_Init(KEY1_PORT,KEY1_PINS,GPIO_Mode_In_PU_No_IT);//��ʼ��KEY�˿ڣ����������룬�����ж�
  
  
  FLASH_DeInit();
  FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);//��׼���ʱ��
  FLASH_Unlock(FLASH_MemType_Program);//�Ƚ���FLASH����ע�����
  
  FLASH_ProgramWord(start_add, new_val);
  val = FLASH_ReadByte(start_add);
  add = start_add;
  
  if (val != BYTE_3(new_val))
    {
        GPIO_SetBits(LED1_PORT, LED1_PINS);//����д����Ϩ��LED
        while (1)
        {
        }
    }
    
    add += 1;
    val = FLASH_ReadByte(add);
    if (val != BYTE_2(new_val))
    {
        GPIO_SetBits(LED1_PORT, LED1_PINS);//����д����Ϩ��LED
        while (1)
        {
        }
    }
    
    add += 1;
    val = FLASH_ReadByte(add);
    if (val != BYTE_1(new_val))
    {
        GPIO_SetBits(LED1_PORT, LED1_PINS);//����д����Ϩ��LED
        while (1)
        {
        }
    }
    
    
    add += 1;
    val = FLASH_ReadByte(add);
    if (val != BYTE_0(new_val))
    {
        GPIO_SetBits(LED1_PORT, LED1_PINS);//����д����Ϩ��LED
        while (1)
        {
        }
    }
    
    add = start_add;
    for (sub_test_count = 0; sub_test_count < 4; sub_test_count++)
    {
        FLASH_EraseByte(add);
        add += 1;
    }
    
    add = start_add;
    for (sub_test_count = 0; sub_test_count < 4; sub_test_count++)
    {
        val = FLASH_ReadByte(add);
        if (val != 0x00)
        {
            GPIO_SetBits(LED1_PORT, LED1_PINS);//����д����Ϩ��LED
            while (1)
            {
            }
        }
        add += 1;
    }
  while (1)
  {
       GPIO_ToggleBits(LED1_PORT, LED1_PINS);
       Delay(0xFFFF);
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
