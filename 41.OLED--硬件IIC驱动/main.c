/*******************************************************************************
****STM8L15X例程
****版权信息：无锡市纳诺物联网科技有限公司 http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
#include "OLED_I2C.h"
//定义LED、按键端口
#define LED1_GPIO_PORT  GPIOC
#define LED1_GPIO_PINS  GPIO_Pin_4

/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：延时函数
****版权信息：蓝旗嵌入式系统
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
****入口参数：无
****出口参数：无
****函数备注：STM8L单片机驱动OLED液晶屏幕
****版权信息：蓝旗嵌入式系统
*******************************************************************************/
int main( void )
{
    unsigned char i;
    extern const unsigned char BMP1[];  
    GPIO_Init(LED1_GPIO_PORT, LED1_GPIO_PINS, GPIO_Mode_Out_PP_Low_Slow);//初始化LED1接口
    CLK_PeripheralClockConfig (CLK_Peripheral_I2C1,ENABLE);//开启IIC1时钟门控
    I2C_Configuration();
    
    Delay(0xFFFF);//需要延时一会
    OLED_Init(); 
  
 
    while(1)
    {
       
      OLED_Fill(0xFF);//全屏点亮
      OLED_Fill(0x00);//全屏灭
      for(i=0;i<5;i++)
      {
				OLED_ShowCN(22+i*16,0,i);//测试显示中文
      }
      OLED_ShowStr(0,3,"WuXI NANO IOE Co.,Ltd",1);//测试6*8字符
      OLED_ShowStr(4,4,"LENCHIMCU.TAOBAO.COM",1);
      Delay(0xFFFF);//延时，便于观察实验现象
      Delay(0xFFFF);//延时，便于观察实验现象
      Delay(0xFFFF);//延时，便于观察实验现象
      Delay(0xFFFF);//延时，便于观察实验现象
      OLED_CLS();//清屏
      OLED_OFF();//测试OLED休眠
      OLED_ON();//测试OLED休眠后唤醒
      OLED_DrawBMP(0,0,128,8,(unsigned char *)BMP1);//测试BMP位图显示
      GPIO_ToggleBits(LED1_GPIO_PORT, LED1_GPIO_PINS);//翻转LED1接口电平，实现LED1闪烁
      Delay(0xFFFF);//延时，便于观察实验现象
      Delay(0xFFFF);//延时，便于观察实验现象
      Delay(0xFFFF);//延时，便于观察实验现象
      Delay(0xFFFF);//延时，便于观察实验现象
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
