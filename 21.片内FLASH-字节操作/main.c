/*******************************************************************************
****STM8L15XÀı³Ì
****°æÈ¨ĞÅÏ¢£ºÎŞÎıÊĞÄÉÅµÎïÁªÍø¿Æ¼¼ÓĞÏŞ¹«Ë¾ http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
//¶¨ÒåLED¡¢°´¼ü¶Ë¿Ú
#define LED1_PORT  GPIOC     
#define LED1_PINS  GPIO_Pin_4//ÂÌÉ«LED
#define LED2_PORT  GPIOB
#define LED2_PINS  GPIO_Pin_0//ºìÉ«LED
#define LED3_PORT  GPIOD
#define LED3_PINS  GPIO_Pin_2//À¶É«LED
#define KEY1_PORT  GPIOD
#define KEY1_PINS  GPIO_Pin_4//KEY1
#define KEY2_PORT  GPIOA
#define KEY2_PINS  GPIO_Pin_2//KEY2
#define KEY3_PORT  GPIOB
#define KEY3_PINS  GPIO_Pin_3//KEY3
/*******************************************************************************
****Èë¿Ú²ÎÊı£ºÎŞ
****³ö¿Ú²ÎÊı£ºÎŞ
****º¯Êı±¸×¢£º²»¾«È·ÑÓÊ±º¯Êı
****°æÈ¨ĞÅÏ¢£ºÎŞÎıÊĞÄÉÅµÎïÁªÍø¿Æ¼¼ÓĞÏŞ¹«Ë¾ NANOIOE CO.LTD 
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
****º¯ÊıËµÃ÷£ºÖ÷º¯Êı
****Èë¿Ú²ÎÊı:ÎŞ
****³ö¿Ú²ÎÊı:ÎŞ
****º¯Êı±¸×¢:²Á³ı/Ğ´/¶ÁÖ¸¶¨µØÖ·µÄFLASH£¬Í¨¹ı¼ÆËã»úµÄ´®¿Ú²é¿´¶Á³öµÄÊı¾İÊÇ·ñÎª0F
             Æ¬ÄÚEEPROMµØÖ·Îª0x1000-0x13ff
             Æ¬ÄÚFLASH¿ªÊ¼µØÖ·Îª0x8000,0x8000-0x807fÎª¸´Î»ºÍÖĞ¶ÏÏòÁ¿±í
             Àı³Ì½«0x0fĞ´Èë9f40µÄÎ»ÖÃ£¬È»ºó¶Á³öºóÍ¨¹ıUART·¢ËÍ³öÀ´¬
****°æÈ¨ĞÅÏ¢£ºÎŞÎıÊĞÄÉÅµÎïÁªÍø¿Æ¼¼ÓĞÏŞ¹«Ë¾ NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
	u8 r_byte;
	GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//´øÉÏÀ­£¬ÍÆÍìÊä³öµÍµçÆ½
	GPIO_Init(KEY1_PORT,KEY1_PINS,GPIO_Mode_In_PU_No_IT);//³õÊ¼»¯KEY¶Ë¿Ú£¬´øÉÏÀ­ÊäÈë£¬²»´øÖĞ¶Ï
 
  CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//¿ªÆôUSARTÊ±ÖÓ
  USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Tx|USART_Mode_Rx);//ÉèÖÃUSART²ÎÊı9600£¬8N1£¬½ÓÊÕ/·¢ËÍ
  USART_ITConfig (USART1,USART_IT_RXNE,ENABLE);//Ê¹ÄÜ½ÓÊÕÖĞ¶Ï
  USART_Cmd (USART1,ENABLE);//Ê¹ÄÜUSART
  enableInterrupts(); 
    
  FLASH_DeInit();
  FLASH_Unlock(FLASH_MemType_Program);//ÏÈ½âËø£¬×¢Òâ²ÎÊı
  FLASH_EraseByte(0x9f40);         //ÔÙ²Á³ı
  FLASH_ProgramByte(0x9f40,0x0f);  //Ğ´Êı¾İ£¬µÚÒ»¸ö²ÎÊıÎªµØÖ·£¬µÚ¶ş¸ö²ÎÊıÎªĞ´ÈëµÄÊı¾İ£¬9f40ÎªÆ¬ÄÚflashÇøÓò¿¿½üÖĞ¼äµÄÎ»ÖÃ
  
  r_byte = FLASH_ReadByte(0x9f40);//¶ÁÖ¸¶¨µØÖ·µÄÊı¾İ
  USART_SendData8 (USART1,r_byte);//Í¨¹ıUART·¢ËÍ£¬16½øÖÆ
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
