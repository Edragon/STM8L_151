
#include "stm8l15x.h"

#include "ch372.h"
/********************��������**/

void Delay(unsigned int nCount)
{
   while (nCount != 0)
  {   
    nCount--;
  }
}
/*******************************************************************************
****��������:��ʼ��ch372��ض˿�
********************************************************************************/
void CH372_Init(void)
{
    // Delayus();Delayus();Delayus();Delayus();
   GPIO_Init(CH372_CS_PORT, CH372_CS_PIN, GPIO_Mode_Out_PP_High_Slow);//CS
   GPIO_Init(CH372_AO_PORT, CH372_AO_PIN, GPIO_Mode_Out_PP_High_Slow);//AO
   GPIO_Init(CH372_WR_PORT, CH372_WR_PIN, GPIO_Mode_Out_PP_High_Slow);//WR
   GPIO_Init(CH372_RD_PORT, CH372_RD_PIN, GPIO_Mode_Out_PP_High_Slow);//RD

   GPIO_ExternalPullUpConfig(CH372_CS_PORT, CH372_CS_PIN, ENABLE);
   GPIO_ExternalPullUpConfig(CH372_AO_PORT, CH372_AO_PIN, ENABLE);
   GPIO_ExternalPullUpConfig(CH372_WR_PORT, CH372_WR_PIN, ENABLE);
   GPIO_ExternalPullUpConfig(CH372_RD_PORT, CH372_RD_PIN, ENABLE);
   GPIO_Init(CH372_DATA_PORT, GPIO_Pin_All, GPIO_Mode_Out_PP_High_Slow);
 //ע��PD7�ж�λ��߼��ж�
   
    
   // GPIO_Init(GPIOA, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow);//GPIO��ʼ��
    
   // GPIO_Init(GPIOD, GPIO_Pin_4, GPIO_Mode_In_PU_IT);//��ʼ��������GPB4��������
    
    EXTI_DeInit (); //�ָ��жϵ��������� 
    EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//�ⲿ�ж�4���½��ش���
    enableInterrupts();//ʹ���ж�
 
 
}



/*****************��CH372д����******************************************************/
void CH372_WR_CMD(s8 Cmd)
{

//Delayus();Delayus();Delayus();Delayus();
   
   GPIO_Init(CH372_DATA_PORT, GPIO_Pin_All, GPIO_Mode_Out_PP_High_Slow);
   GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_All, ENABLE);
   
   GPIO_Write(CH372_DATA_PORT, Cmd);
   
   GPIO_SetBits(CH372_AO_PORT, CH372_AO_PIN);//�ߵ�ƽд����


   GPIO_SetBits(CH372_RD_PORT, CH372_RD_PIN);
   
   GPIO_ResetBits(CH372_CS_PORT, CH372_CS_PIN);
   
   GPIO_ResetBits(CH372_WR_PORT, CH372_WR_PIN);

 //  Delayus();Delayus();Delayus();Delayus();
   
   GPIO_SetBits(CH372_WR_PORT, CH372_WR_PIN);
   GPIO_SetBits(CH372_CS_PORT, CH372_CS_PIN);
   GPIO_ResetBits(CH372_AO_PORT, CH372_AO_PIN);

 
     Delay(1);
   
   
}
/****************��CH372д����*******************************************/
void CH372_WR_DAT(s8 Dat)
{
   
   GPIO_Init(CH372_DATA_PORT, GPIO_Pin_All, GPIO_Mode_Out_PP_High_Slow);
   GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_All, ENABLE);
   GPIO_Write(CH372_DATA_PORT, Dat);

   GPIO_ResetBits(CH372_AO_PORT, CH372_AO_PIN);
   
   GPIO_ResetBits(CH372_CS_PORT, CH372_CS_PIN);
   
   GPIO_ResetBits(CH372_WR_PORT, CH372_WR_PIN);
   
   GPIO_ResetBits(CH372_CS_PORT, CH372_CS_PIN);

   GPIO_SetBits(CH372_WR_PORT, CH372_WR_PIN);
   GPIO_SetBits(CH372_CS_PORT, CH372_CS_PIN);
   
GPIO_Init(GPIOA, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow);
 
   Delay(10); 
}
/**************��CH372������*****************************/
s8 CH372_RD_DAT(void)
{
   s8 Dat;
   
   GPIO_Init(CH372_DATA_PORT, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
   
//Delayus();Delayus();Delayus();Delayus();
   GPIO_ResetBits(CH372_AO_PORT, CH372_AO_PIN);
   GPIO_ResetBits(CH372_CS_PORT, CH372_CS_PIN);
   GPIO_ResetBits(CH372_RD_PORT, CH372_RD_PIN);
   
   //GPIO_ResetBits(CH372_CS_PORT, CH372_CS_PIN);

   Dat= GPIO_ReadInputData(CH372_DATA_PORT);
   
   GPIO_SetBits(CH372_RD_PORT, CH372_RD_PIN);
   GPIO_SetBits(CH372_CS_PORT, CH372_CS_PIN);

   return Dat;
}