/*******************************************************************************
****STM8L15X����
****��Ȩ��Ϣ����������ŵ�������Ƽ����޹�˾ http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
#include "OLED_I2C.h"
//����LED�������˿�
#define LED1_GPIO_PORT  GPIOC
#define LED1_GPIO_PINS  GPIO_Pin_4

/*******************************************************************************
****��ڲ�������
****���ڲ�������
****������ע����ʱ����
****��Ȩ��Ϣ������Ƕ��ʽϵͳ
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
****������ע��STM8L��Ƭ������OLEDҺ����Ļ
****��Ȩ��Ϣ������Ƕ��ʽϵͳ
*******************************************************************************/
int main( void )
{
    unsigned char i;
    extern const unsigned char BMP1[];  
    GPIO_Init(LED1_GPIO_PORT, LED1_GPIO_PINS, GPIO_Mode_Out_PP_Low_Slow);//��ʼ��LED1�ӿ�
    CLK_PeripheralClockConfig (CLK_Peripheral_I2C1,ENABLE);//����IIC1ʱ���ſ�
    I2C_Configuration();
    
    Delay(0xFFFF);//��Ҫ��ʱһ��
    OLED_Init(); 
  
 
    while(1)
    {
       
      OLED_Fill(0xFF);//ȫ������
      OLED_Fill(0x00);//ȫ����
      for(i=0;i<5;i++)
      {
				OLED_ShowCN(22+i*16,0,i);//������ʾ����
      }
      OLED_ShowStr(0,3,"WuXI NANO IOE Co.,Ltd",1);//����6*8�ַ�
      OLED_ShowStr(4,4,"LENCHIMCU.TAOBAO.COM",1);
      Delay(0xFFFF);//��ʱ�����ڹ۲�ʵ������
      Delay(0xFFFF);//��ʱ�����ڹ۲�ʵ������
      Delay(0xFFFF);//��ʱ�����ڹ۲�ʵ������
      Delay(0xFFFF);//��ʱ�����ڹ۲�ʵ������
      OLED_CLS();//����
      OLED_OFF();//����OLED����
      OLED_ON();//����OLED���ߺ���
      OLED_DrawBMP(0,0,128,8,(unsigned char *)BMP1);//����BMPλͼ��ʾ
      GPIO_ToggleBits(LED1_GPIO_PORT, LED1_GPIO_PINS);//��תLED1�ӿڵ�ƽ��ʵ��LED1��˸
      Delay(0xFFFF);//��ʱ�����ڹ۲�ʵ������
      Delay(0xFFFF);//��ʱ�����ڹ۲�ʵ������
      Delay(0xFFFF);//��ʱ�����ڹ۲�ʵ������
      Delay(0xFFFF);//��ʱ�����ڹ۲�ʵ������
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
