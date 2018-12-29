/*******************************************************************************
****STM8L15X例程
****版权信息：无锡市纳诺物联网科技有限公司 http://lenchimcu.taobao.com
*******************************************************************************/
#include "stm8l15x.h"
#include "1621.h"
#include "dht11.h"
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

unsigned char DHTData[4];//={0,0,0,0};
unsigned char Temp;
unsigned char Humi;
unsigned char Ht1621Tab[]={0x00,0x00,0x00,0x00};
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
****入口参数：需要发送的字符串
****出口参数：无
****函数备注：USART发送函数
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
void USART_SendStr(unsigned char *Str) 
{
        while(*Str!=0)//不为结束
        {
            USART_SendData8(USART1,*Str);     //发送数据 
            while(!USART_GetFlagStatus (USART1,USART_FLAG_TXE));//等待发送完毕
            Str++;//下一个数据
        }
}
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：DHT11测量温度、湿度，并将温度、湿度滚动在段码液晶上显示，DHT11
              接PD4
****版权信息：无锡市纳诺物联网科技有限公司 NANOIOE CO.LTD 
*******************************************************************************/
int main( void )
{
	  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	  Ht1621_Init();        //上电初始化LCD 
	  Delay(100);           //延时一段时间
   
    while (1)
    {
       while(!DHT11_Start());
     
       while(!Get_data(DHTData));
       Delay(0xFFFF);
       Delay(0xFFFF); 
       Delay(0xFFFF); 
       Delay(0xFFFF);
       Temp=(DHTData[2]>>4)*16+(DHTData[2]&0x0f);
       Humi=(DHTData[0]>>4)*16+(DHTData[0]&0x0f);
       data_convertor(Temp*100);//在液晶上显示温度
       Display();//显示
       Display_lcd_dot();//显示小数点
       //以下延时为了在屏幕上观察到
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       data_convertor(Humi*100);//在液晶上显示湿度
       Display();//显示
       Display_lcd_dot();//显示小数点
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);
       Delay(0xFFFF);   
    }
}


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
