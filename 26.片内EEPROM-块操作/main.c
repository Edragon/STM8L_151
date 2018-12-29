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

#define BLOCK_OPERATION    0    //��ĺ���
uint8_t GBuffer[FLASH_BLOCK_SIZE];
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
****������ע:����/д/��ָ����ַ��EEPROM��ͨ��������Ĵ��ڲ鿴�����������Ƿ�Ϊ0F
             Ƭ��EEPROM��ַΪ0x1000-0x13ff
             Ƭ��FLASH��ʼ��ַΪ0x8000,0x8000-0x807fΪ��λ���ж�������
             Ƭ��EEPROM��Ϊ0-7�飬ע���Ķ�д����RAM�����еģ����õĿ⺯��Ҳ�Ǽ�
             ����ؼ����ˣ�Ҫ��stm8l15X.h ͷ�ļ��н�#define RAM_EXECUTION  (1) ��
             ע��ȥ���ſ��ԣ�
             �����ȶ�ָ���Ŀ�д�����ݣ�Ȼ���ֽڶ���У�飬У������ LED����˸������
             LEDϨ��
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
	uint32_t add = 0, startadd = 0, stopadd = 0;
  uint8_t newval = 0xAA;
  uint8_t i = 0;
	
	
  GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_High_Slow);//��ʼ��LED�˿�
  GPIO_Init(KEY1_PORT,KEY1_PINS,GPIO_Mode_In_PU_No_IT);//��ʼ��KEY�˿ڣ����������룬�����ж�
  
  _fctcpy('F');
  FLASH_DeInit();
  FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);//��׼���ʱ��
 
  //����EEPROMд����
  FLASH_Unlock(FLASH_MemType_Data);
  while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)//�ȴ��������
  {}
  
  //��RAM�е�д�뻺������ֵ
  for (i = 0; i < FLASH_BLOCK_SIZE; i++)
  {
    GBuffer[i] = newval;
  }
  //BLOCKд��RAM������
  FLASH_ProgramBlock(BLOCK_OPERATION,FLASH_MemType_Data, FLASH_ProgramMode_Standard, GBuffer);
 while (FLASH_GetFlagStatus(FLASH_FLAG_HVOFF) == RESET)
  {}	  
  //У��д�������
  startadd = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS + ((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
  stopadd = startadd + (uint16_t)FLASH_BLOCK_SIZE;
  for (add = startadd; add < stopadd; add++)
      {
        if (FLASH_ReadByte(add) != newval)
        {
          GPIO_SetBits(LED1_PORT, LED1_PINS);//����д����Ϩ��LED
        while (1)
        {
          
        }
        }
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
