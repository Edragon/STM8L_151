#ifndef _flash_h_
#define _flash_h_
/*******************************************************************************
****蓝旗嵌入式系统 STM8S105 EasyKit
****LENCHIMCU.TAOBAO.COM
****版本:V1.0
****日期:14-2-2014
****说明:主芯片STM8S105C4T6
********************************************************************************/

#define SPI_CS_PORT                   GPIOC
#define SPI_CS_PIN                    GPIO_Pin_4
/* 使能SPI外部设备，拉低CS引脚电平 */
#define SPI_FLASH_CS_LOW()       GPIO_ResetBits(SPI_CS_PORT , SPI_CS_PIN)
/* 禁止SPI外部设备，拉高CS引脚电平 */
#define SPI_FLASH_CS_HIGH()      GPIO_SetBits(SPI_CS_PORT, SPI_CS_PIN)
//指令表
#define Dummy_Byte 0xFF   //伪字节
#define WRITE      0x02  //页编程指令
#define WRSR       0x01  //写状态寄存器指令
#define WREN       0x06  //写使能
#define WRDIS      0x04  //写禁能

#define READ       0x03  //读数据指令
#define RDSR       0x05  //读状态寄存器指令
#define RDID       0x9F  //读JEDEC ID
#define SE         0x20  //扇区擦除指令 4K
#define BE         0xD8  //块擦除指令 64K
#define CE         0xC7  //芯片擦除指令


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