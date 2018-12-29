/*******************************************************************************
****STM8L15X例程
****版权信息：无锡市纳诺物联网科技有限公司 http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
//定义LED、按键端口
#define LED1_PORT  GPIOC     
#define LED1_PINS  GPIO_Pin_4//绿色LED
#define LED2_PORT  GPIOB
#define LED2_PINS  GPIO_Pin_0//红色LED
#define LED3_PORT  GPIOD
#define LED3_PINS  GPIO_Pin_2//蓝色LED
#define KEY1_PORT  GPIOD
#define KEY1_PINS  GPIO_Pin_4//KEY1
#define KEY2_PORT  GPIOA
#define KEY2_PINS  GPIO_Pin_2//KEY2
#define KEY3_PORT  GPIOB
#define KEY3_PINS  GPIO_Pin_3//KEY3

uint8_t val= 0x00;
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：不精确延时函数
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
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
****函数说明：主函数
****入口参数:无
****出口参数:无
****函数备注:擦除/写/读指定地址的FLASH，通过计算机的串口查看读出的数据是否为0F
             片内EEPROM地址为0x1000-0x13ff
             片内FLASH开始地址为0x8000,0x8000-0x807f为复位和中断向量表
             例子选的flash地址为0x9f40
             先将四个字节写入，然后一个字节一个字节的读出验证，如果都是和写入的
             数据相同，则最后LED会闪烁，否则LED是灭的。
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD             
********************************************************************************/
void main(void)
{
	uint32_t start_add = 0x9f40;
  uint32_t add = 0x0;
  uint32_t new_val = 0x01234567;
  uint8_t sub_test_count = 0x0;
  GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);//初始化LED端口
  GPIO_Init(KEY1_PORT,KEY1_PINS,GPIO_Mode_In_PU_No_IT);//初始化KEY端口，带上拉输入，不带中断
  
  
  FLASH_DeInit();
  FLASH_SetProgrammingTime(FLASH_ProgramTime_Standard);//标准编程时间
  FLASH_Unlock(FLASH_MemType_Program);//先解锁FLASH区域，注意参数
  
  FLASH_ProgramWord(start_add, new_val);
  val = FLASH_ReadByte(start_add);
  add = start_add;
  
  if (val != BYTE_3(new_val))
    {
        GPIO_SetBits(LED1_PORT, LED1_PINS);//如果有错误就熄灭LED
        while (1)
        {
        }
    }
    
    add += 1;
    val = FLASH_ReadByte(add);
    if (val != BYTE_2(new_val))
    {
        GPIO_SetBits(LED1_PORT, LED1_PINS);//如果有错误就熄灭LED
        while (1)
        {
        }
    }
    
    add += 1;
    val = FLASH_ReadByte(add);
    if (val != BYTE_1(new_val))
    {
        GPIO_SetBits(LED1_PORT, LED1_PINS);//如果有错误就熄灭LED
        while (1)
        {
        }
    }
    
    
    add += 1;
    val = FLASH_ReadByte(add);
    if (val != BYTE_0(new_val))
    {
        GPIO_SetBits(LED1_PORT, LED1_PINS);//如果有错误就熄灭LED
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
            GPIO_SetBits(LED1_PORT, LED1_PINS);//如果有错误就熄灭LED
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
