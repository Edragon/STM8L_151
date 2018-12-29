#include "stm8l15x.h"
#include "1621.h"
unsigned int tmp;
unsigned int n1, n2, n3, n4;
unsigned char DispTab[]={0xEB,0x0A,0xAD,0x8F,0x4E,0xC7,0xE7,0x8A,0xEF,0xCF,0x85,0xEE, 0x67, 0xE1,0x2F,0xE5,0xE4};
//������������
void Ht1621_CS_0(void) { GPIO_Init(Ht1621_CS_PORT, Ht1621_CS_PIN, GPIO_Mode_Out_PP_Low_Fast);}  // 
void Ht1621_CS_1(void) { GPIO_Init(Ht1621_CS_PORT, Ht1621_CS_PIN, GPIO_Mode_Out_PP_High_Fast);}

void Ht1621_WR_0(void) { GPIO_Init(Ht1621_WR_PORT, Ht1621_WR_PIN, GPIO_Mode_Out_PP_Low_Fast);}  // 
void Ht1621_WR_1(void) { GPIO_Init(Ht1621_WR_PORT, Ht1621_WR_PIN, GPIO_Mode_Out_PP_High_Fast);}

void Ht1621_DAT_0(void) { GPIO_Init(Ht1621_DAT_PORT, Ht1621_DAT_PIN, GPIO_Mode_Out_PP_Low_Fast);}  // 
void Ht1621_DAT_1(void) { GPIO_Init(Ht1621_DAT_PORT, Ht1621_DAT_PIN, GPIO_Mode_Out_PP_High_Fast);}

void Ht1621_GND_0(void) { GPIO_Init(Ht1621_GND_PORT, Ht1621_GND_PIN, GPIO_Mode_Out_PP_Low_Slow);}  //
void Ht1621_GND_1(void) { GPIO_Init(Ht1621_GND_PORT, Ht1621_GND_PIN, GPIO_Mode_Out_PP_High_Fast);}

void Ht1621_VCC_0(void) { GPIO_Init(Ht1621_VCC_PORT, Ht1621_VCC_PIN, GPIO_Mode_Out_PP_Low_Fast);}  //
void Ht1621_VCC_1(void) { GPIO_Init(Ht1621_VCC_PORT, Ht1621_VCC_PIN, GPIO_Mode_Out_PP_High_Slow);}

/*******************************************************************************
****��������:
****��������:1621д���ݺ���
****�汾:V1.0
****����:14-2-2014
****��ڲ���:Data-Ҫ���͵�����  cnt-Ҫ���͵�����λ��
****���ڲ���:
****˵��:
********************************************************************************/
void Ht1621Wr_Data(unsigned char Data,unsigned char cnt) 
{ 
  unsigned char i; 
  for (i=0;i<cnt;i++) 
   {   
     Ht1621_WR_0(); 
     if((Data & 0x80)==0x80) 
        {Ht1621_DAT_1();}
     else 
        {Ht1621_DAT_0();}
     Ht1621_WR_1(); 
     Data<<=1; 
   } 
} 
/*******************************************************************************
****��������:
****��������:1621дָ���
****�汾:V1.0
****����:14-2-2014
****��ڲ���:Cmd ����
****���ڲ���:
****˵��:
********************************************************************************/
void Ht1621WrCmd(unsigned char Cmd) 
{ 
   Ht1621_CS_0(); 
   Ht1621Wr_Data(0x80,4);          //д�������־100 
   Ht1621Wr_Data(Cmd,8);           //д���������� 
   Ht1621_CS_1(); 
} 
/*******************************************************************************
****��������:
****��������:1621дһ�����ݺ���
****�汾:V1.0
****����:14-2-2014
****��ڲ���:Addr--��ַ Data--����
****���ڲ���:
****˵��:
********************************************************************************/
void Ht1621WrOneData(unsigned char Addr,unsigned char Data)
{
  Ht1621_CS_0();
  Ht1621Wr_Data(0xa0,3);  //д�����ݱ�־101
  Ht1621Wr_Data(Addr<<2,6); //д���ַ����
  Ht1621Wr_Data(Data,4); //д�����ݵ�ǰ��λ 7  6  5  4
  Ht1621_CS_1();
}
/*******************************************************************************
****��������:
****��������:1621д�������ݺ���
****�汾:V1.0
****����:14-2-2014
****��ڲ���:Addr--��ַ p--����  cnt���ݸ���
****���ڲ���:
****˵��:
********************************************************************************/
void Ht1621WrAllData(unsigned char Addr,unsigned char *p,unsigned char cnt)
{
  unsigned char i;
  Ht1621_CS_0();
  Ht1621Wr_Data(0xa0,3); //д�����ݱ�־101
  Ht1621Wr_Data(Addr<<2,6); //д���ַ����
  for (i=0;i<cnt;i++)
   {
    Ht1621Wr_Data(*p,8); //д������
    p++;
   }
  Ht1621_CS_1();
}
/*******************************************************************************
****��������:
****��������:1621��ʼ������
****�汾:V1.0
****����:14-2-2014
****��ڲ���:
****���ڲ���:
****˵��:
********************************************************************************/
void Ht1621_Init(void) 
{ 
    Ht1621_GND_0();       //HT1621 power on
    Ht1621_VCC_1();
   Ht1621WrCmd(BIAS); 
   Ht1621WrCmd(RC256);             //ʹ���ڲ����� 
   //Ht1621WrCmd(XTAL);             //ʹ���ⲿ���� 
   Ht1621WrCmd(SYSDIS); 
   Ht1621WrCmd(WDTDIS1); 
   Ht1621WrCmd(SYSEN); 
   Ht1621WrCmd(LCDON); 
} 
/*******************************************************************************
****��������:
****��������:1621��ʾ����
****�汾:V1.0
****����:14-2-2014
****��ڲ���:
****���ڲ���:
****˵��:
********************************************************************************/
void Display(void) 
{ 
 
   Ht1621WrOneData(0 , DispTab[n4]);
   Ht1621WrOneData(1 , DispTab[n4]<<4);

   Ht1621WrOneData(2 , DispTab[n3]);
   Ht1621WrOneData(3 , DispTab[n3]<<4);
   
   Ht1621WrOneData(4 , DispTab[n2]);
   Ht1621WrOneData(5 , DispTab[n2]<<4);
  
   Ht1621WrOneData(6 , DispTab[n1]); 
   Ht1621WrOneData(7 , DispTab[n1]<<4); 
   
}
/*******************************************************************************
****��������:
****��������:��ʾ���ź���
****�汾:V1.0
****����:14-2-2014
****��ڲ���:Addr--��ַ Data--����
****���ڲ���:
****˵��:
********************************************************************************/
void Display_lcd_dot(void) 
{ 
  Ht1621WrOneData(0 , DispTab[n4]|0x10);//P1
  // Ht1621WrOneData(2 , DispTab[n3]|0x10);    //2P
   //Ht1621WrOneData(4 , DispTab[n2]|0x10);    //3P
   //Ht1621WrOneData(6 , DispTab[n1]|0x10);    //4P
}
/*******************************************************************************
****��������:
****��������:����ת������
****�汾:V1.0
****����:14-2-2014
****��ڲ���:adc_value-��Ҫת������ֵ
****���ڲ���:
****˵��:
********************************************************************************/
void data_convertor(unsigned long adc_value) 
{  
    tmp=adc_value;         //adc 
    n4=tmp/1000;
    tmp=tmp%1000;
    n3=tmp/100;
    tmp=tmp%100;	
    n2=tmp/10;
    tmp=tmp%10;		
    n1=tmp; 
 }
