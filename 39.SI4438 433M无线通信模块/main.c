
#include "include.h"

//����LED�˿�
#define LED_PORT  GPIOC
#define LED_PINS  GPIO_Pin_4
#define KEY_PORT  GPIOD
#define KEY_PINS  GPIO_Pin_4

//���巢�ͻ������ͽ��ջ�����
u8 RfTxBuffer[RADIO_MAX_PACKET_LENGTH] = {0};
u8 RfRxBuffer[RADIO_MAX_PACKET_LENGTH] = {0};

u8 ChannelNumber=0;//ͨ����
u8 bRF_IT_Status=0;//�ж�״̬
u8 Send_Ok=0;      //������ɱ�ʶ
u8 ucPackLgth;//���յ������ݳ���
u8 rssi=0;    //�ź�ǿ��
/*******************************************************************************
****��ڲ�������
****���ڲ�������
****������ע������ȷ��ʱ����
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
****������ע������LED
****��Ȩ��Ϣ������Ƕ��ʽϵͳ
*******************************************************************************/
void LED_ON(void)
{
   GPIO_ResetBits(LED_PORT,LED_PINS);
}
/*******************************************************************************
****��ڲ�������
****���ڲ�������
****������ע��Ϩ��LED
****��Ȩ��Ϣ������Ƕ��ʽϵͳ
*******************************************************************************/
void LED_OFF(void)
{
  GPIO_SetBits(LED_PORT,LED_PINS);
}

/*******************************************************************************
****����˵����������
****��ڲ���:��
****���ڲ���:��
****������ע:����S2���������ݣ������ӵ�LED����������������󱾰���LED��Ϩ��
             ���յ����ͷ����͵�����LED D2����˸һ��
********************************************************************************/
void main(void)
{
    u8 KEY_FLAG=0;//������������ʶ
    
    GPIO_Init(LED_PORT,LED_PINS,GPIO_Mode_Out_PP_Low_Slow);//��ʼ��LED�˿�
    GPIO_Init(KEY_PORT,KEY_PINS,GPIO_Mode_In_PU_No_IT);    //��ʼ�������˿ڣ����������ж�
    LED_OFF();                                             //�ر�LED
  
    MCU_PinInit();//��Ƭ����ģ��Ľӿڳ�ʼ��
    vRadio_Init();//ģ���ʼ��,Ĭ�Ͽ�������9600
    //vRadio_Set_Rate(4);//�������ÿ������ʣ��շ�˫������������Ҫ��ͬ
    vRadio_StartRX(ChannelNumber,6);//����ģʽ	
     
    while(1)
    {    
        if((KEY_FLAG!=1)&&(GPIO_ReadInputDataBit(KEY_PORT,KEY_PINS)==0))
        {
            Delay(5000);
            if(GPIO_ReadInputDataBit(KEY_PORT,KEY_PINS)==0)   //�����������
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
            //�����������Ϩ��LED
            if((KEY_FLAG!=0)&&(GPIO_ReadInputDataBit(KEY_PORT,KEY_PINS)!=0))
            {
                Delay(5000);
                if(GPIO_ReadInputDataBit(KEY_PORT,KEY_PINS)!=0) //�����������
                {
                    KEY_FLAG=0;
                    LED_OFF();
                  }
            }
    
    
            bRF_IT_Status = bRadio_Check_Tx_RX();//��ȡ�ж�״̬������ֵ
            switch (bRF_IT_Status)
            {
                  //�����������
                case SI446X_CMD_GET_INT_STATUS_REP_PH_PEND_PACKET_SENT_PEND_BIT:
                      vRadio_Tx_TO_Rx();
				
                      vRadio_StartRX(ChannelNumber, 6);
                      Send_Ok=0;
                
	        break;
                  //���յ�����
                case SI446X_CMD_GET_INT_STATUS_REP_PH_PEND_PACKET_RX_PEND_BIT:
              
                      if(Si446xCmd.FIFO_INFO.RX_FIFO_COUNT>0)//������յ������ݴ���0
                      {                          
                          if((RfRxBuffer[0]==0xF0)&&(RfRxBuffer[1]==0x2D)&&(RfRxBuffer[2]==0xD4)&&(RfRxBuffer[3]==0xA5)&&(RfRxBuffer[4]==0x01))//�ж�������ȷ���
                          {
                              //LED��˸һ��
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
