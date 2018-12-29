
#include "include.h"

//定义LED端口
#define LED_PORT  GPIOC
#define LED_PINS  GPIO_Pin_4
#define KEY_PORT  GPIOD
#define KEY_PINS  GPIO_Pin_4

//定义发送缓冲区和接收缓冲区
u8 RfTxBuffer[RADIO_MAX_PACKET_LENGTH] = {0};
u8 RfRxBuffer[RADIO_MAX_PACKET_LENGTH] = {0};

u8 ChannelNumber=0;//通道号
u8 bRF_IT_Status=0;//中断状态
u8 Send_Ok=0;      //发送完成标识
u8 ucPackLgth;//接收到的数据长度
u8 rssi=0;    //信号强度
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：不精确延时函数
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
****函数备注：点亮LED
****版权信息：蓝旗嵌入式系统
*******************************************************************************/
void LED_ON(void)
{
   GPIO_ResetBits(LED_PORT,LED_PINS);
}
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：熄灭LED
****版权信息：蓝旗嵌入式系统
*******************************************************************************/
void LED_OFF(void)
{
  GPIO_SetBits(LED_PORT,LED_PINS);
}

/*******************************************************************************
****函数说明：主函数
****入口参数:无
****出口参数:无
****函数备注:按键S2，发送数据，本板子的LED被点亮，按键弹起后本板子LED会熄灭；
             接收到发送方发送的数据LED D2会闪烁一次
********************************************************************************/
void main(void)
{
    u8 KEY_FLAG=0;//按键按下与否标识
    
    GPIO_Init(LED_PORT,LED_PINS,GPIO_Mode_Out_PP_Low_Slow);//初始化LED端口
    GPIO_Init(KEY_PORT,KEY_PINS,GPIO_Mode_In_PU_No_IT);    //初始化按键端口，带上拉无中断
    LED_OFF();                                             //关闭LED
  
    MCU_PinInit();//单片机与模块的接口初始化
    vRadio_Init();//模块初始化,默认空中速率9600
    //vRadio_Set_Rate(4);//可以设置空中速率，收发双方空中速率需要相同
    vRadio_StartRX(ChannelNumber,6);//接收模式	
     
    while(1)
    {    
        if((KEY_FLAG!=1)&&(GPIO_ReadInputDataBit(KEY_PORT,KEY_PINS)==0))
        {
            Delay(5000);
            if(GPIO_ReadInputDataBit(KEY_PORT,KEY_PINS)==0)   //按键软件防抖
            {
                KEY_FLAG=1;
                LED_ON();
                RfTxBuffer[0]=0xF0;
                RfTxBuffer[1]=0x2D;
                RfTxBuffer[2]=0xD4;
                RfTxBuffer[3]=0xA5;
                RfTxBuffer[4]=0x01;
                RfTxBuffer[5]=0x22;
                RfTxBuffer[6]=0xD4;
                RfTxBuffer[7]=0xA5;
                RfTxBuffer[8]=0x12;
                RfTxBuffer[9]=0x22;
                if(Send_Ok==0)
                {
                    vRadio_StartTx_Variable_Packet(ChannelNumber, &RfTxBuffer[0],6);
                  
                    Send_Ok=1;
          
                }
              }
          }
            //如果按键弹起，熄灭LED
            if((KEY_FLAG!=0)&&(GPIO_ReadInputDataBit(KEY_PORT,KEY_PINS)!=0))
            {
                Delay(5000);
                if(GPIO_ReadInputDataBit(KEY_PORT,KEY_PINS)!=0) //按键软件防抖
                {
                    KEY_FLAG=0;
                    LED_OFF();
                  }
            }
    
    
            bRF_IT_Status = bRadio_Check_Tx_RX();//读取中断状态并返回值
            switch (bRF_IT_Status)
            {
                  //发送数据完成
                case SI446X_CMD_GET_INT_STATUS_REP_PH_PEND_PACKET_SENT_PEND_BIT:
                      vRadio_Tx_TO_Rx();
				
                      vRadio_StartRX(ChannelNumber, 6);
                      Send_Ok=0;
                
	        break;
                  //接收到数据
                case SI446X_CMD_GET_INT_STATUS_REP_PH_PEND_PACKET_RX_PEND_BIT:
              
                      if(Si446xCmd.FIFO_INFO.RX_FIFO_COUNT>0)//如果接收到的数据大于0
                      {                          
                          if((RfRxBuffer[0]==0xF0)&&(RfRxBuffer[1]==0x2D)&&(RfRxBuffer[2]==0xD4)&&(RfRxBuffer[3]==0xA5)&&(RfRxBuffer[4]==0x01))//判断数据正确与否
                          {
                              //LED闪烁一次
                              LED_ON();
                              Delay(5000);
                              LED_OFF();
                              vRadio_StartRX(ChannelNumber, 6);
                              
                          }
                          else
                          {
                              vRadio_StartRX(ChannelNumber, 6);
                          }
                      }
                break;
                default:
                break;
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
