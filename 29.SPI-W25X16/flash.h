#ifndef _flash_h_
#define _flash_h_
/*******************************************************************************
****����Ƕ��ʽϵͳ STM8S105 EasyKit
****LENCHIMCU.TAOBAO.COM
****�汾:V1.0
****����:14-2-2014
****˵��:��оƬSTM8S105C4T6
********************************************************************************/

#define SPI_CS_PORT                   GPIOC
#define SPI_CS_PIN                    GPIO_Pin_4
/* ʹ��SPI�ⲿ�豸������CS���ŵ�ƽ */
#define SPI_FLASH_CS_LOW()       GPIO_ResetBits(SPI_CS_PORT , SPI_CS_PIN)
/* ��ֹSPI�ⲿ�豸������CS���ŵ�ƽ */
#define SPI_FLASH_CS_HIGH()      GPIO_SetBits(SPI_CS_PORT, SPI_CS_PIN)
//ָ���
#define Dummy_Byte 0xFF   //α�ֽ�
#define WRITE      0x02  //ҳ���ָ��
#define WRSR       0x01  //д״̬�Ĵ���ָ��
#define WREN       0x06  //дʹ��
#define WRDIS      0x04  //д����

#define READ       0x03  //������ָ��
#define RDSR       0x05  //��״̬�Ĵ���ָ��
#define RDID       0x9F  //��JEDEC ID
#define SE         0x20  //��������ָ�� 4K
#define BE         0xD8  //�����ָ�� 64K
#define CE         0xC7  //оƬ����ָ��


#define WIP_Flag   0x01  /* Write In Progress (WIP) flag */
#define W25X16_PAGE_SIZE         256
#define W25X16_SECTOR_SIZE	 4096
#define W25X16_SECTOR_COUNT	 512
#define W25X16_BLOCK_SIZE	 65536
#define W25X16_PAGES_PER_SECTOR	W25X16_SECTOR_SIZE/W25X16_PAGE_SIZE
extern void SPI_Flash_Init(void);
extern unsigned char SPI_FLASH_SendByte(unsigned char byte);
extern unsigned short SPI_FLASH_ReadID(void);
extern void SPI_FLASH_WriteEnable(void);
extern void SPI_FLASH_WaitForWriteEnd(void);
extern void SPI_Flash_EraseChip(void);
extern void SPI_FLASH_WriteOneByte(unsigned char * pBuffer,unsigned int nSector ,unsigned char nBytes);
extern void SPI_FLASH_PageWrite(unsigned char * pBuffer, unsigned int WriteAddr, unsigned short NumByteToWrite);
extern void SPI_FLASH_BufferWrite(unsigned char * pBuffer, unsigned int WriteAddr, unsigned short NumByteToWrite);
extern void SPI_FLASH_BufferRead(unsigned char * pBuffer, unsigned int  ReadAddr, unsigned short NumByteToRead);
extern void SPI_FLASH_BlockErase(unsigned int BlockAddr);
extern unsigned char SPI_FLASH_Unlock(void);
#endif