/*******************************************************************************
******************无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD *****************
*************************http://lenchimcu.taobao.com****************************
********************************************************************************
****例程简介:STM8L152K4串口重映射函数
*******************************************************************************/
#include "stm8l15x.h"
#include "stdio.h"        //包含C库函数
//定义LED与按键接口
#define LED_GPIO_PORT  GPIOC
#define LED_GPIO_PINS  GPIO_Pin_4
#define KEY_GPIO_PORT  GPIOD
#define KEY_GPIO_PINS  GPIO_Pin_4
//以下需要添加
#define PUTCHAR_PROTOTYPE int putchar (int c)
#define GETCHAR_PROTOTYPE int getchar (void)

PUTCHAR_PROTOTYPE
{  
  USART_SendData8(USART1,c);
  while (USART_GetFlagStatus(USART1,USART_FLAG_TXE) == RESET);

  return (c);
}

/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：开发板上RXD-UT TXD-UR跳线帽短接，通过USB线连接计算机与开发板，打开
              计算机的串口调试助手软件，设置参数，可以接收到开发板发送的字符串格式的
              数据。使用前计算机需先安装CH340驱动。
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
    CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//开启USART时钟
    USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Tx);//USART初始化，9600，8N1
    USART_Cmd (USART1,ENABLE);//使能USART
    
    u8 aa=200;//随便定义一个变量
    printf("蓝旗嵌入式USART_Printf\r\n"); //发送字符串，末尾换行
    printf("b= %d\r\n",aa);//发送变量
    while(1)
    {
        
    }
    
}

/*******************************************************************************
***********无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD *************************
*************************http://lenchimcu.taobao.com****************************
*******************************************************************************/
