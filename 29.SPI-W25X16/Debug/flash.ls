   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  47                     ; 19 void SPI_Flash_Init(void)
  47                     ; 20 {
  49                     	switch	.text
  50  0000               _SPI_Flash_Init:
  54                     ; 22         SPI_DeInit(SPI1);
  56  0000 ae5200        	ldw	x,#20992
  57  0003 cd0000        	call	_SPI_DeInit
  59                     ; 23 	SPI_Init(SPI1,SPI_FirstBit_MSB, SPI_BaudRatePrescaler_4, SPI_Mode_Master,\
  59                     ; 24 		SPI_CPOL_High, SPI_CPHA_2Edge, \
  59                     ; 25 		SPI_Direction_2Lines_FullDuplex, SPI_NSS_Soft, 0x07);
  61  0006 4b07          	push	#7
  62  0008 4b02          	push	#2
  63  000a 4b00          	push	#0
  64  000c 4b01          	push	#1
  65  000e 4b02          	push	#2
  66  0010 4b04          	push	#4
  67  0012 4b08          	push	#8
  68  0014 4b00          	push	#0
  69  0016 ae5200        	ldw	x,#20992
  70  0019 cd0000        	call	_SPI_Init
  72  001c 5b08          	addw	sp,#8
  73                     ; 27 	SPI_Cmd(SPI1,ENABLE);	/* 使能SPI */
  75  001e 4b01          	push	#1
  76  0020 ae5200        	ldw	x,#20992
  77  0023 cd0000        	call	_SPI_Cmd
  79  0026 84            	pop	a
  80                     ; 30 	GPIO_Init(SPI_CS_PORT, SPI_CS_PIN, GPIO_Mode_Out_PP_High_Slow);
  82  0027 4bd0          	push	#208
  83  0029 4b10          	push	#16
  84  002b ae500a        	ldw	x,#20490
  85  002e cd0000        	call	_GPIO_Init
  87  0031 85            	popw	x
  88                     ; 31 	SPI_FLASH_CS_HIGH();		/* 不使能外部SPI设备 */
  90  0032 4b10          	push	#16
  91  0034 ae500a        	ldw	x,#20490
  92  0037 cd0000        	call	_GPIO_SetBits
  94  003a 84            	pop	a
  95                     ; 32 }
  98  003b 81            	ret
 135                     ; 42 unsigned char SPI_FLASH_SendByte(unsigned char byte)
 135                     ; 43 {
 136                     	switch	.text
 137  003c               _SPI_FLASH_SendByte:
 139  003c 88            	push	a
 140       00000000      OFST:	set	0
 143  003d               L14:
 144                     ; 47   while (SPI_GetFlagStatus(SPI1, SPI_FLAG_TXE) == RESET);
 146  003d 4b02          	push	#2
 147  003f ae5200        	ldw	x,#20992
 148  0042 cd0000        	call	_SPI_GetFlagStatus
 150  0045 5b01          	addw	sp,#1
 151  0047 4d            	tnz	a
 152  0048 27f3          	jreq	L14
 153                     ; 50  SPI_SendData(SPI1,byte);
 155  004a 7b01          	ld	a,(OFST+1,sp)
 156  004c 88            	push	a
 157  004d ae5200        	ldw	x,#20992
 158  0050 cd0000        	call	_SPI_SendData
 160  0053 84            	pop	a
 162  0054               L74:
 163                     ; 53   while (SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE) == RESET);
 165  0054 4b01          	push	#1
 166  0056 ae5200        	ldw	x,#20992
 167  0059 cd0000        	call	_SPI_GetFlagStatus
 169  005c 5b01          	addw	sp,#1
 170  005e 4d            	tnz	a
 171  005f 27f3          	jreq	L74
 172                     ; 56   return SPI_ReceiveData(SPI1);	 
 174  0061 ae5200        	ldw	x,#20992
 175  0064 cd0000        	call	_SPI_ReceiveData
 179  0067 5b01          	addw	sp,#1
 180  0069 81            	ret
 217                     ; 67 unsigned short SPI_FLASH_ReadID(void)
 217                     ; 68 {
 218                     	switch	.text
 219  006a               _SPI_FLASH_ReadID:
 221  006a 89            	pushw	x
 222       00000002      OFST:	set	2
 225                     ; 69   unsigned short Device_ID = 0;
 227                     ; 71   SPI_FLASH_CS_LOW();
 229  006b 4b10          	push	#16
 230  006d ae500a        	ldw	x,#20490
 231  0070 cd0000        	call	_GPIO_ResetBits
 233  0073 84            	pop	a
 234                     ; 74   SPI_FLASH_SendByte(0x90);
 236  0074 a690          	ld	a,#144
 237  0076 adc4          	call	_SPI_FLASH_SendByte
 239                     ; 76   SPI_FLASH_SendByte(0X00);
 241  0078 4f            	clr	a
 242  0079 adc1          	call	_SPI_FLASH_SendByte
 244                     ; 77   SPI_FLASH_SendByte(0X00);
 246  007b 4f            	clr	a
 247  007c adbe          	call	_SPI_FLASH_SendByte
 249                     ; 78   SPI_FLASH_SendByte(0X00);//90 000000 返回标准制造号和特殊器件ID，90 000001 返回顺序倒过来
 251  007e 4f            	clr	a
 252  007f adbb          	call	_SPI_FLASH_SendByte
 254                     ; 82   Device_ID = (SPI_FLASH_SendByte(Dummy_Byte)<<8);
 256  0081 a6ff          	ld	a,#255
 257  0083 adb7          	call	_SPI_FLASH_SendByte
 259  0085 5f            	clrw	x
 260  0086 97            	ld	xl,a
 261  0087 4f            	clr	a
 262  0088 02            	rlwa	x,a
 263  0089 1f01          	ldw	(OFST-1,sp),x
 265                     ; 83   Device_ID|=SPI_FLASH_SendByte(Dummy_Byte);
 267  008b a6ff          	ld	a,#255
 268  008d adad          	call	_SPI_FLASH_SendByte
 270  008f 5f            	clrw	x
 271  0090 97            	ld	xl,a
 272  0091 01            	rrwa	x,a
 273  0092 1a02          	or	a,(OFST+0,sp)
 274  0094 01            	rrwa	x,a
 275  0095 1a01          	or	a,(OFST-1,sp)
 276  0097 01            	rrwa	x,a
 277  0098 1f01          	ldw	(OFST-1,sp),x
 279                     ; 84   SPI_FLASH_CS_HIGH();
 281  009a 4b10          	push	#16
 282  009c ae500a        	ldw	x,#20490
 283  009f cd0000        	call	_GPIO_SetBits
 285  00a2 84            	pop	a
 286                     ; 85   return Device_ID;
 288  00a3 1e01          	ldw	x,(OFST-1,sp)
 291  00a5 5b02          	addw	sp,#2
 292  00a7 81            	ret
 319                     ; 96 void SPI_FLASH_WriteEnable(void)
 319                     ; 97 {
 320                     	switch	.text
 321  00a8               _SPI_FLASH_WriteEnable:
 325                     ; 99   SPI_FLASH_CS_LOW();
 327  00a8 4b10          	push	#16
 328  00aa ae500a        	ldw	x,#20490
 329  00ad cd0000        	call	_GPIO_ResetBits
 331  00b0 84            	pop	a
 332                     ; 102   SPI_FLASH_SendByte(WREN);
 334  00b1 a606          	ld	a,#6
 335  00b3 ad87          	call	_SPI_FLASH_SendByte
 337                     ; 105   SPI_FLASH_CS_HIGH();
 339  00b5 4b10          	push	#16
 340  00b7 ae500a        	ldw	x,#20490
 341  00ba cd0000        	call	_GPIO_SetBits
 343  00bd 84            	pop	a
 344                     ; 106 }
 347  00be 81            	ret
 376                     ; 116 void SPI_Flash_EraseChip(void)
 376                     ; 117 {
 377                     	switch	.text
 378  00bf               _SPI_Flash_EraseChip:
 382                     ; 119   SPI_FLASH_WriteEnable();
 384  00bf ade7          	call	_SPI_FLASH_WriteEnable
 386                     ; 121   SPI_FLASH_CS_LOW();
 388  00c1 4b10          	push	#16
 389  00c3 ae500a        	ldw	x,#20490
 390  00c6 cd0000        	call	_GPIO_ResetBits
 392  00c9 84            	pop	a
 393                     ; 124   SPI_FLASH_SendByte(CE);
 395  00ca a6c7          	ld	a,#199
 396  00cc cd003c        	call	_SPI_FLASH_SendByte
 398                     ; 127   SPI_FLASH_CS_HIGH();
 400  00cf 4b10          	push	#16
 401  00d1 ae500a        	ldw	x,#20490
 402  00d4 cd0000        	call	_GPIO_SetBits
 404  00d7 84            	pop	a
 405                     ; 129   SPI_FLASH_WaitForWriteEnd();
 407  00d8 ad01          	call	_SPI_FLASH_WaitForWriteEnd
 409                     ; 130 }
 412  00da 81            	ret
 450                     ; 140 void SPI_FLASH_WaitForWriteEnd(void)
 450                     ; 141 {
 451                     	switch	.text
 452  00db               _SPI_FLASH_WaitForWriteEnd:
 454  00db 88            	push	a
 455       00000001      OFST:	set	1
 458                     ; 142   unsigned char FLASH_Status = 0;
 460                     ; 145   SPI_FLASH_CS_LOW();
 462  00dc 4b10          	push	#16
 463  00de ae500a        	ldw	x,#20490
 464  00e1 cd0000        	call	_GPIO_ResetBits
 466  00e4 84            	pop	a
 467                     ; 148   SPI_FLASH_SendByte(RDSR);
 469  00e5 a605          	ld	a,#5
 470  00e7 cd003c        	call	_SPI_FLASH_SendByte
 472  00ea               L721:
 473                     ; 155     FLASH_Status = SPI_FLASH_SendByte(Dummy_Byte);
 475  00ea a6ff          	ld	a,#255
 476  00ec cd003c        	call	_SPI_FLASH_SendByte
 478  00ef 6b01          	ld	(OFST+0,sp),a
 480                     ; 158   while ((FLASH_Status & WIP_Flag) == SET); /* Write in progress */
 482  00f1 7b01          	ld	a,(OFST+0,sp)
 483  00f3 a401          	and	a,#1
 484  00f5 a101          	cp	a,#1
 485  00f7 27f1          	jreq	L721
 486                     ; 161   SPI_FLASH_CS_HIGH();
 488  00f9 4b10          	push	#16
 489  00fb ae500a        	ldw	x,#20490
 490  00fe cd0000        	call	_GPIO_SetBits
 492  0101 84            	pop	a
 493                     ; 162 }
 496  0102 84            	pop	a
 497  0103 81            	ret
 565                     ; 173 void SPI_FLASH_WriteOneByte(unsigned char * pBuffer,unsigned int nSector ,unsigned char nBytes)
 565                     ; 174 {
 566                     	switch	.text
 567  0104               _SPI_FLASH_WriteOneByte:
 569  0104 89            	pushw	x
 570  0105 88            	push	a
 571       00000001      OFST:	set	1
 574                     ; 175   unsigned char i=0;
 576                     ; 177   SPI_FLASH_WriteEnable();
 578  0106 ada0          	call	_SPI_FLASH_WriteEnable
 580                     ; 179   SPI_FLASH_CS_LOW();
 582  0108 4b10          	push	#16
 583  010a ae500a        	ldw	x,#20490
 584  010d cd0000        	call	_GPIO_ResetBits
 586  0110 84            	pop	a
 587                     ; 182   SPI_FLASH_SendByte(WRITE);
 589  0111 a602          	ld	a,#2
 590  0113 cd003c        	call	_SPI_FLASH_SendByte
 592                     ; 186   SPI_FLASH_SendByte((nSector & 0xFF0000) >> 16);
 594  0116 1e06          	ldw	x,(OFST+5,sp)
 595  0118 a610          	ld	a,#16
 596  011a               L22:
 597  011a 54            	srlw	x
 598  011b 4a            	dec	a
 599  011c 26fc          	jrne	L22
 600  011e cd0000        	call	c_uitolx
 602  0121 3f02          	clr	c_lreg+2
 603  0123 3f01          	clr	c_lreg+1
 604  0125 3f00          	clr	c_lreg
 605  0127 b603          	ld	a,c_lreg+3
 606  0129 cd003c        	call	_SPI_FLASH_SendByte
 608                     ; 188   SPI_FLASH_SendByte((nSector & 0xFF00) >> 8);
 610  012c 7b06          	ld	a,(OFST+5,sp)
 611  012e cd003c        	call	_SPI_FLASH_SendByte
 613                     ; 190   SPI_FLASH_SendByte(nSector & 0xFF);
 615  0131 7b07          	ld	a,(OFST+6,sp)
 616  0133 a4ff          	and	a,#255
 617  0135 cd003c        	call	_SPI_FLASH_SendByte
 619                     ; 192   for(i=0;i<nBytes;i++)
 621  0138 0f01          	clr	(OFST+0,sp)
 624  013a 2011          	jra	L371
 625  013c               L761:
 626                     ; 193     SPI_FLASH_SendByte(pBuffer[i]);
 628  013c 7b02          	ld	a,(OFST+1,sp)
 629  013e 97            	ld	xl,a
 630  013f 7b03          	ld	a,(OFST+2,sp)
 631  0141 1b01          	add	a,(OFST+0,sp)
 632  0143 2401          	jrnc	L42
 633  0145 5c            	incw	x
 634  0146               L42:
 635  0146 02            	rlwa	x,a
 636  0147 f6            	ld	a,(x)
 637  0148 cd003c        	call	_SPI_FLASH_SendByte
 639                     ; 192   for(i=0;i<nBytes;i++)
 641  014b 0c01          	inc	(OFST+0,sp)
 643  014d               L371:
 646  014d 7b01          	ld	a,(OFST+0,sp)
 647  014f 1108          	cp	a,(OFST+7,sp)
 648  0151 25e9          	jrult	L761
 649                     ; 195   SPI_FLASH_CS_HIGH();
 651  0153 4b10          	push	#16
 652  0155 ae500a        	ldw	x,#20490
 653  0158 cd0000        	call	_GPIO_SetBits
 655  015b 84            	pop	a
 656                     ; 198   SPI_FLASH_WaitForWriteEnd();
 658  015c cd00db        	call	_SPI_FLASH_WaitForWriteEnd
 660                     ; 199 }
 663  015f 5b03          	addw	sp,#3
 664  0161 81            	ret
 723                     ; 209 void SPI_FLASH_PageWrite(unsigned char * pBuffer, unsigned int WriteAddr, unsigned short NumByteToWrite)
 723                     ; 210 {
 724                     	switch	.text
 725  0162               _SPI_FLASH_PageWrite:
 727  0162 89            	pushw	x
 728       00000000      OFST:	set	0
 731                     ; 212   SPI_FLASH_WriteEnable();  //写使能
 733  0163 cd00a8        	call	_SPI_FLASH_WriteEnable
 735                     ; 215   SPI_FLASH_CS_LOW();       //拉低CS
 737  0166 4b10          	push	#16
 738  0168 ae500a        	ldw	x,#20490
 739  016b cd0000        	call	_GPIO_ResetBits
 741  016e 84            	pop	a
 742                     ; 217   SPI_FLASH_SendByte(WRITE);//发送页编程指令
 744  016f a602          	ld	a,#2
 745  0171 cd003c        	call	_SPI_FLASH_SendByte
 747                     ; 221   SPI_FLASH_SendByte((WriteAddr & 0xFF0000) >> 16);
 749  0174 1e05          	ldw	x,(OFST+5,sp)
 750  0176 a610          	ld	a,#16
 751  0178               L03:
 752  0178 54            	srlw	x
 753  0179 4a            	dec	a
 754  017a 26fc          	jrne	L03
 755  017c cd0000        	call	c_uitolx
 757  017f 3f02          	clr	c_lreg+2
 758  0181 3f01          	clr	c_lreg+1
 759  0183 3f00          	clr	c_lreg
 760  0185 b603          	ld	a,c_lreg+3
 761  0187 cd003c        	call	_SPI_FLASH_SendByte
 763                     ; 223   SPI_FLASH_SendByte((WriteAddr & 0xFF00) >> 8);
 765  018a 7b05          	ld	a,(OFST+5,sp)
 766  018c cd003c        	call	_SPI_FLASH_SendByte
 768                     ; 225   SPI_FLASH_SendByte(WriteAddr & 0xFF);
 770  018f 7b06          	ld	a,(OFST+6,sp)
 771  0191 a4ff          	and	a,#255
 772  0193 cd003c        	call	_SPI_FLASH_SendByte
 775  0196 200d          	jra	L722
 776  0198               L522:
 777                     ; 232     SPI_FLASH_SendByte(*pBuffer);
 779  0198 1e01          	ldw	x,(OFST+1,sp)
 780  019a f6            	ld	a,(x)
 781  019b cd003c        	call	_SPI_FLASH_SendByte
 783                     ; 234     pBuffer++;
 785  019e 1e01          	ldw	x,(OFST+1,sp)
 786  01a0 1c0001        	addw	x,#1
 787  01a3 1f01          	ldw	(OFST+1,sp),x
 788  01a5               L722:
 789                     ; 229   while (NumByteToWrite--)                              //写数据
 791  01a5 1e07          	ldw	x,(OFST+7,sp)
 792  01a7 1d0001        	subw	x,#1
 793  01aa 1f07          	ldw	(OFST+7,sp),x
 794  01ac 1c0001        	addw	x,#1
 795  01af a30000        	cpw	x,#0
 796  01b2 26e4          	jrne	L522
 797                     ; 238   SPI_FLASH_CS_HIGH();//拉高CS
 799  01b4 4b10          	push	#16
 800  01b6 ae500a        	ldw	x,#20490
 801  01b9 cd0000        	call	_GPIO_SetBits
 803  01bc 84            	pop	a
 804                     ; 241   SPI_FLASH_WaitForWriteEnd();
 806  01bd cd00db        	call	_SPI_FLASH_WaitForWriteEnd
 808                     ; 242 }
 811  01c0 85            	popw	x
 812  01c1 81            	ret
 912                     ; 253 void SPI_FLASH_BufferWrite(unsigned char * pBuffer, unsigned int WriteAddr, unsigned short NumByteToWrite)
 912                     ; 254 {
 913                     	switch	.text
 914  01c2               _SPI_FLASH_BufferWrite:
 916  01c2 89            	pushw	x
 917  01c3 5206          	subw	sp,#6
 918       00000006      OFST:	set	6
 921                     ; 255   unsigned char NumOfPage = 0, NumOfSingle = 0, Addr = 0, count = 0, temp = 0;
 931                     ; 257   Addr = WriteAddr % W25X16_PAGE_SIZE;
 933  01c5 7b0c          	ld	a,(OFST+6,sp)
 934  01c7 a4ff          	and	a,#255
 935  01c9 6b03          	ld	(OFST-3,sp),a
 937                     ; 258   count = W25X16_PAGE_SIZE - Addr;
 939  01cb a600          	ld	a,#0
 940  01cd 1003          	sub	a,(OFST-3,sp)
 941  01cf 6b06          	ld	(OFST+0,sp),a
 943                     ; 259   NumOfPage =  NumByteToWrite / W25X16_PAGE_SIZE;
 945  01d1 7b0d          	ld	a,(OFST+7,sp)
 946  01d3 6b05          	ld	(OFST-1,sp),a
 948                     ; 260   NumOfSingle = NumByteToWrite % W25X16_PAGE_SIZE;
 950  01d5 7b0e          	ld	a,(OFST+8,sp)
 951  01d7 a4ff          	and	a,#255
 952  01d9 6b04          	ld	(OFST-2,sp),a
 954                     ; 262   if (Addr == 0) /* WriteAddr is W25X16_PAGE_SIZE aligned  */
 956  01db 0d03          	tnz	(OFST-3,sp)
 957  01dd 2649          	jrne	L503
 958                     ; 264     if (NumOfPage == 0) /* NumByteToWrite < W25X16_PAGE_SIZE */
 960  01df 0d05          	tnz	(OFST-1,sp)
 961  01e1 262d          	jrne	L513
 962                     ; 266       SPI_FLASH_PageWrite(pBuffer, WriteAddr, NumByteToWrite);
 964  01e3 1e0d          	ldw	x,(OFST+7,sp)
 965  01e5 89            	pushw	x
 966  01e6 1e0d          	ldw	x,(OFST+7,sp)
 967  01e8 89            	pushw	x
 968  01e9 1e0b          	ldw	x,(OFST+5,sp)
 969  01eb cd0162        	call	_SPI_FLASH_PageWrite
 971  01ee 5b04          	addw	sp,#4
 973  01f0 ac7f027f      	jpf	L123
 974  01f4               L313:
 975                     ; 272         SPI_FLASH_PageWrite(pBuffer, WriteAddr, W25X16_PAGE_SIZE);
 977  01f4 ae0100        	ldw	x,#256
 978  01f7 89            	pushw	x
 979  01f8 1e0d          	ldw	x,(OFST+7,sp)
 980  01fa 89            	pushw	x
 981  01fb 1e0b          	ldw	x,(OFST+5,sp)
 982  01fd cd0162        	call	_SPI_FLASH_PageWrite
 984  0200 5b04          	addw	sp,#4
 985                     ; 273         WriteAddr +=  W25X16_PAGE_SIZE;
 987  0202 1e0b          	ldw	x,(OFST+5,sp)
 988  0204 1c0100        	addw	x,#256
 989  0207 1f0b          	ldw	(OFST+5,sp),x
 990                     ; 274         pBuffer += W25X16_PAGE_SIZE;
 992  0209 1e07          	ldw	x,(OFST+1,sp)
 993  020b 1c0100        	addw	x,#256
 994  020e 1f07          	ldw	(OFST+1,sp),x
 995  0210               L513:
 996                     ; 270       while (NumOfPage--)
 998  0210 7b05          	ld	a,(OFST-1,sp)
 999  0212 0a05          	dec	(OFST-1,sp)
1001  0214 4d            	tnz	a
1002  0215 26dd          	jrne	L313
1003                     ; 277       SPI_FLASH_PageWrite(pBuffer, WriteAddr, NumOfSingle);
1005  0217 7b04          	ld	a,(OFST-2,sp)
1006  0219 5f            	clrw	x
1007  021a 97            	ld	xl,a
1008  021b 89            	pushw	x
1009  021c 1e0d          	ldw	x,(OFST+7,sp)
1010  021e 89            	pushw	x
1011  021f 1e0b          	ldw	x,(OFST+5,sp)
1012  0221 cd0162        	call	_SPI_FLASH_PageWrite
1014  0224 5b04          	addw	sp,#4
1015  0226 2057          	jra	L123
1016  0228               L503:
1017                     ; 282     if (NumOfPage == 0) /* NumByteToWrite < W25X16_PAGE_SIZE */
1019  0228 0d05          	tnz	(OFST-1,sp)
1020  022a 2656          	jrne	L323
1021                     ; 284       if (NumOfSingle > count)
1023  022c 7b04          	ld	a,(OFST-2,sp)
1024  022e 1106          	cp	a,(OFST+0,sp)
1025  0230 2340          	jrule	L523
1026                     ; 286         temp = NumOfSingle - count;
1028  0232 7b04          	ld	a,(OFST-2,sp)
1029  0234 1006          	sub	a,(OFST+0,sp)
1030  0236 6b03          	ld	(OFST-3,sp),a
1032                     ; 288         SPI_FLASH_PageWrite(pBuffer, WriteAddr, count);
1034  0238 7b06          	ld	a,(OFST+0,sp)
1035  023a 5f            	clrw	x
1036  023b 97            	ld	xl,a
1037  023c 89            	pushw	x
1038  023d 1e0d          	ldw	x,(OFST+7,sp)
1039  023f 89            	pushw	x
1040  0240 1e0b          	ldw	x,(OFST+5,sp)
1041  0242 cd0162        	call	_SPI_FLASH_PageWrite
1043  0245 5b04          	addw	sp,#4
1044                     ; 289         WriteAddr +=  count;
1046  0247 7b06          	ld	a,(OFST+0,sp)
1047  0249 5f            	clrw	x
1048  024a 97            	ld	xl,a
1049  024b 1f01          	ldw	(OFST-5,sp),x
1051  024d 1e0b          	ldw	x,(OFST+5,sp)
1052  024f 72fb01        	addw	x,(OFST-5,sp)
1053  0252 1f0b          	ldw	(OFST+5,sp),x
1054                     ; 290         pBuffer += count;
1056  0254 7b06          	ld	a,(OFST+0,sp)
1057  0256 5f            	clrw	x
1058  0257 97            	ld	xl,a
1059  0258 1f01          	ldw	(OFST-5,sp),x
1061  025a 1e07          	ldw	x,(OFST+1,sp)
1062  025c 72fb01        	addw	x,(OFST-5,sp)
1063  025f 1f07          	ldw	(OFST+1,sp),x
1064                     ; 292         SPI_FLASH_PageWrite(pBuffer, WriteAddr, temp);
1066  0261 7b03          	ld	a,(OFST-3,sp)
1067  0263 5f            	clrw	x
1068  0264 97            	ld	xl,a
1069  0265 89            	pushw	x
1070  0266 1e0d          	ldw	x,(OFST+7,sp)
1071  0268 89            	pushw	x
1072  0269 1e0b          	ldw	x,(OFST+5,sp)
1073  026b cd0162        	call	_SPI_FLASH_PageWrite
1075  026e 5b04          	addw	sp,#4
1077  0270 200d          	jra	L123
1078  0272               L523:
1079                     ; 296         SPI_FLASH_PageWrite(pBuffer, WriteAddr, NumByteToWrite);
1081  0272 1e0d          	ldw	x,(OFST+7,sp)
1082  0274 89            	pushw	x
1083  0275 1e0d          	ldw	x,(OFST+7,sp)
1084  0277 89            	pushw	x
1085  0278 1e0b          	ldw	x,(OFST+5,sp)
1086  027a cd0162        	call	_SPI_FLASH_PageWrite
1088  027d 5b04          	addw	sp,#4
1089  027f               L123:
1090                     ; 322 }
1093  027f 5b08          	addw	sp,#8
1094  0281 81            	ret
1095  0282               L323:
1096                     ; 301       NumByteToWrite -= count;
1098  0282 7b06          	ld	a,(OFST+0,sp)
1099  0284 5f            	clrw	x
1100  0285 97            	ld	xl,a
1101  0286 1f01          	ldw	(OFST-5,sp),x
1103  0288 1e0d          	ldw	x,(OFST+7,sp)
1104  028a 72f001        	subw	x,(OFST-5,sp)
1105  028d 1f0d          	ldw	(OFST+7,sp),x
1106                     ; 302       NumOfPage =  NumByteToWrite / W25X16_PAGE_SIZE;
1108  028f 7b0d          	ld	a,(OFST+7,sp)
1109  0291 6b05          	ld	(OFST-1,sp),a
1111                     ; 303       NumOfSingle = NumByteToWrite % W25X16_PAGE_SIZE;
1113  0293 7b0e          	ld	a,(OFST+8,sp)
1114  0295 a4ff          	and	a,#255
1115  0297 6b04          	ld	(OFST-2,sp),a
1117                     ; 305       SPI_FLASH_PageWrite(pBuffer, WriteAddr, count);
1119  0299 7b06          	ld	a,(OFST+0,sp)
1120  029b 5f            	clrw	x
1121  029c 97            	ld	xl,a
1122  029d 89            	pushw	x
1123  029e 1e0d          	ldw	x,(OFST+7,sp)
1124  02a0 89            	pushw	x
1125  02a1 1e0b          	ldw	x,(OFST+5,sp)
1126  02a3 cd0162        	call	_SPI_FLASH_PageWrite
1128  02a6 5b04          	addw	sp,#4
1129                     ; 306       WriteAddr +=  count;
1131  02a8 7b06          	ld	a,(OFST+0,sp)
1132  02aa 5f            	clrw	x
1133  02ab 97            	ld	xl,a
1134  02ac 1f01          	ldw	(OFST-5,sp),x
1136  02ae 1e0b          	ldw	x,(OFST+5,sp)
1137  02b0 72fb01        	addw	x,(OFST-5,sp)
1138  02b3 1f0b          	ldw	(OFST+5,sp),x
1139                     ; 307       pBuffer += count;
1141  02b5 7b06          	ld	a,(OFST+0,sp)
1142  02b7 5f            	clrw	x
1143  02b8 97            	ld	xl,a
1144  02b9 1f01          	ldw	(OFST-5,sp),x
1146  02bb 1e07          	ldw	x,(OFST+1,sp)
1147  02bd 72fb01        	addw	x,(OFST-5,sp)
1148  02c0 1f07          	ldw	(OFST+1,sp),x
1150  02c2 201c          	jra	L533
1151  02c4               L333:
1152                     ; 311         SPI_FLASH_PageWrite(pBuffer, WriteAddr, W25X16_PAGE_SIZE);
1154  02c4 ae0100        	ldw	x,#256
1155  02c7 89            	pushw	x
1156  02c8 1e0d          	ldw	x,(OFST+7,sp)
1157  02ca 89            	pushw	x
1158  02cb 1e0b          	ldw	x,(OFST+5,sp)
1159  02cd cd0162        	call	_SPI_FLASH_PageWrite
1161  02d0 5b04          	addw	sp,#4
1162                     ; 312         WriteAddr +=  W25X16_PAGE_SIZE;
1164  02d2 1e0b          	ldw	x,(OFST+5,sp)
1165  02d4 1c0100        	addw	x,#256
1166  02d7 1f0b          	ldw	(OFST+5,sp),x
1167                     ; 313         pBuffer += W25X16_PAGE_SIZE;
1169  02d9 1e07          	ldw	x,(OFST+1,sp)
1170  02db 1c0100        	addw	x,#256
1171  02de 1f07          	ldw	(OFST+1,sp),x
1172  02e0               L533:
1173                     ; 309       while (NumOfPage--)
1175  02e0 7b05          	ld	a,(OFST-1,sp)
1176  02e2 0a05          	dec	(OFST-1,sp)
1178  02e4 4d            	tnz	a
1179  02e5 26dd          	jrne	L333
1180                     ; 316       if (NumOfSingle != 0)
1182  02e7 0d04          	tnz	(OFST-2,sp)
1183  02e9 2794          	jreq	L123
1184                     ; 318         SPI_FLASH_PageWrite(pBuffer, WriteAddr, NumOfSingle);
1186  02eb 7b04          	ld	a,(OFST-2,sp)
1187  02ed 5f            	clrw	x
1188  02ee 97            	ld	xl,a
1189  02ef 89            	pushw	x
1190  02f0 1e0d          	ldw	x,(OFST+7,sp)
1191  02f2 89            	pushw	x
1192  02f3 1e0b          	ldw	x,(OFST+5,sp)
1193  02f5 cd0162        	call	_SPI_FLASH_PageWrite
1195  02f8 5b04          	addw	sp,#4
1196  02fa 2083          	jra	L123
1253                     ; 332 void SPI_FLASH_BufferRead(unsigned char * pBuffer, unsigned int  ReadAddr, unsigned short NumByteToRead)
1253                     ; 333 {
1254                     	switch	.text
1255  02fc               _SPI_FLASH_BufferRead:
1257  02fc 89            	pushw	x
1258       00000000      OFST:	set	0
1261                     ; 335   SPI_FLASH_CS_LOW();
1263  02fd 4b10          	push	#16
1264  02ff ae500a        	ldw	x,#20490
1265  0302 cd0000        	call	_GPIO_ResetBits
1267  0305 84            	pop	a
1268                     ; 338   SPI_FLASH_SendByte(READ);
1270  0306 a603          	ld	a,#3
1271  0308 cd003c        	call	_SPI_FLASH_SendByte
1273                     ; 341   SPI_FLASH_SendByte((ReadAddr & 0xFF0000) >> 16);
1275  030b 1e05          	ldw	x,(OFST+5,sp)
1276  030d a610          	ld	a,#16
1277  030f               L63:
1278  030f 54            	srlw	x
1279  0310 4a            	dec	a
1280  0311 26fc          	jrne	L63
1281  0313 cd0000        	call	c_uitolx
1283  0316 3f02          	clr	c_lreg+2
1284  0318 3f01          	clr	c_lreg+1
1285  031a 3f00          	clr	c_lreg
1286  031c b603          	ld	a,c_lreg+3
1287  031e cd003c        	call	_SPI_FLASH_SendByte
1289                     ; 343   SPI_FLASH_SendByte((ReadAddr& 0xFF00) >> 8);
1291  0321 7b05          	ld	a,(OFST+5,sp)
1292  0323 cd003c        	call	_SPI_FLASH_SendByte
1294                     ; 345   SPI_FLASH_SendByte(ReadAddr & 0xFF);
1296  0326 7b06          	ld	a,(OFST+6,sp)
1297  0328 a4ff          	and	a,#255
1298  032a cd003c        	call	_SPI_FLASH_SendByte
1301  032d 200f          	jra	L373
1302  032f               L173:
1303                     ; 350     *pBuffer = SPI_FLASH_SendByte(Dummy_Byte);
1305  032f a6ff          	ld	a,#255
1306  0331 cd003c        	call	_SPI_FLASH_SendByte
1308  0334 1e01          	ldw	x,(OFST+1,sp)
1309  0336 f7            	ld	(x),a
1310                     ; 352     pBuffer++;
1312  0337 1e01          	ldw	x,(OFST+1,sp)
1313  0339 1c0001        	addw	x,#1
1314  033c 1f01          	ldw	(OFST+1,sp),x
1315  033e               L373:
1316                     ; 347   while (NumByteToRead--) /* while there is data to be read */
1318  033e 1e07          	ldw	x,(OFST+7,sp)
1319  0340 1d0001        	subw	x,#1
1320  0343 1f07          	ldw	(OFST+7,sp),x
1321  0345 1c0001        	addw	x,#1
1322  0348 a30000        	cpw	x,#0
1323  034b 26e2          	jrne	L173
1324                     ; 356   SPI_FLASH_CS_HIGH();
1326  034d 4b10          	push	#16
1327  034f ae500a        	ldw	x,#20490
1328  0352 cd0000        	call	_GPIO_SetBits
1330  0355 84            	pop	a
1331                     ; 357 }
1334  0356 85            	popw	x
1335  0357 81            	ret
1375                     ; 368 void SPI_FLASH_BlockErase(unsigned int BlockAddr)
1375                     ; 369 {
1376                     	switch	.text
1377  0358               _SPI_FLASH_BlockErase:
1379  0358 89            	pushw	x
1380       00000000      OFST:	set	0
1383                     ; 370   BlockAddr*=W25X16_BLOCK_SIZE;
1385  0359 a610          	ld	a,#16
1386  035b               L24:
1387  035b 0802          	sll	(OFST+2,sp)
1388  035d 0901          	rlc	(OFST+1,sp)
1389  035f 4a            	dec	a
1390  0360 26f9          	jrne	L24
1391                     ; 372   SPI_FLASH_WriteEnable();
1393  0362 cd00a8        	call	_SPI_FLASH_WriteEnable
1395                     ; 375   SPI_FLASH_CS_LOW();
1397  0365 4b10          	push	#16
1398  0367 ae500a        	ldw	x,#20490
1399  036a cd0000        	call	_GPIO_ResetBits
1401  036d 84            	pop	a
1402                     ; 377   SPI_FLASH_SendByte(BE);
1404  036e a6d8          	ld	a,#216
1405  0370 cd003c        	call	_SPI_FLASH_SendByte
1407                     ; 379   SPI_FLASH_SendByte((BlockAddr & 0xFF0000) >> 16);
1409  0373 1e01          	ldw	x,(OFST+1,sp)
1410  0375 a610          	ld	a,#16
1411  0377               L44:
1412  0377 54            	srlw	x
1413  0378 4a            	dec	a
1414  0379 26fc          	jrne	L44
1415  037b cd0000        	call	c_uitolx
1417  037e 3f02          	clr	c_lreg+2
1418  0380 3f01          	clr	c_lreg+1
1419  0382 3f00          	clr	c_lreg
1420  0384 b603          	ld	a,c_lreg+3
1421  0386 cd003c        	call	_SPI_FLASH_SendByte
1423                     ; 381   SPI_FLASH_SendByte((BlockAddr & 0xFF00) >> 8);
1425  0389 7b01          	ld	a,(OFST+1,sp)
1426  038b cd003c        	call	_SPI_FLASH_SendByte
1428                     ; 383   SPI_FLASH_SendByte(BlockAddr & 0xFF);
1430  038e 7b02          	ld	a,(OFST+2,sp)
1431  0390 a4ff          	and	a,#255
1432  0392 cd003c        	call	_SPI_FLASH_SendByte
1434                     ; 385   SPI_FLASH_CS_HIGH();
1436  0395 4b10          	push	#16
1437  0397 ae500a        	ldw	x,#20490
1438  039a cd0000        	call	_GPIO_SetBits
1440  039d 84            	pop	a
1441                     ; 388   SPI_FLASH_WaitForWriteEnd();
1443  039e cd00db        	call	_SPI_FLASH_WaitForWriteEnd
1445                     ; 389 }
1448  03a1 85            	popw	x
1449  03a2 81            	ret
1486                     ; 391 unsigned char SPI_FLASH_Unlock(void)
1486                     ; 392 {
1487                     	switch	.text
1488  03a3               _SPI_FLASH_Unlock:
1490  03a3 88            	push	a
1491       00000001      OFST:	set	1
1494                     ; 393   unsigned char Device_ID = 0;
1496                     ; 394   SPI_FLASH_CS_LOW();
1498  03a4 4b10          	push	#16
1499  03a6 ae500a        	ldw	x,#20490
1500  03a9 cd0000        	call	_GPIO_ResetBits
1502  03ac 84            	pop	a
1503                     ; 395   SPI_FLASH_SendByte(0xAB);
1505  03ad a6ab          	ld	a,#171
1506  03af cd003c        	call	_SPI_FLASH_SendByte
1508                     ; 396   SPI_FLASH_SendByte(0X00);
1510  03b2 4f            	clr	a
1511  03b3 cd003c        	call	_SPI_FLASH_SendByte
1513                     ; 397   SPI_FLASH_SendByte(0X00);
1515  03b6 4f            	clr	a
1516  03b7 cd003c        	call	_SPI_FLASH_SendByte
1518                     ; 398   SPI_FLASH_SendByte(0X00);
1520  03ba 4f            	clr	a
1521  03bb cd003c        	call	_SPI_FLASH_SendByte
1523                     ; 399   Device_ID=SPI_FLASH_SendByte(Dummy_Byte);
1525  03be a6ff          	ld	a,#255
1526  03c0 cd003c        	call	_SPI_FLASH_SendByte
1528  03c3 6b01          	ld	(OFST+0,sp),a
1530                     ; 400   SPI_FLASH_CS_HIGH();
1532  03c5 4b10          	push	#16
1533  03c7 ae500a        	ldw	x,#20490
1534  03ca cd0000        	call	_GPIO_SetBits
1536  03cd 84            	pop	a
1537                     ; 401   SPI_FLASH_CS_LOW();
1539  03ce 4b10          	push	#16
1540  03d0 ae500a        	ldw	x,#20490
1541  03d3 cd0000        	call	_GPIO_ResetBits
1543  03d6 84            	pop	a
1544                     ; 402   SPI_FLASH_SendByte(0X06);
1546  03d7 a606          	ld	a,#6
1547  03d9 cd003c        	call	_SPI_FLASH_SendByte
1549                     ; 403   SPI_FLASH_CS_HIGH();
1551  03dc 4b10          	push	#16
1552  03de ae500a        	ldw	x,#20490
1553  03e1 cd0000        	call	_GPIO_SetBits
1555  03e4 84            	pop	a
1556                     ; 404   SPI_FLASH_CS_LOW();
1558  03e5 4b10          	push	#16
1559  03e7 ae500a        	ldw	x,#20490
1560  03ea cd0000        	call	_GPIO_ResetBits
1562  03ed 84            	pop	a
1563                     ; 405   SPI_FLASH_SendByte(0X01);
1565  03ee a601          	ld	a,#1
1566  03f0 cd003c        	call	_SPI_FLASH_SendByte
1568                     ; 406   SPI_FLASH_SendByte(0X00);
1570  03f3 4f            	clr	a
1571  03f4 cd003c        	call	_SPI_FLASH_SendByte
1573                     ; 407   SPI_FLASH_CS_HIGH();
1575  03f7 4b10          	push	#16
1576  03f9 ae500a        	ldw	x,#20490
1577  03fc cd0000        	call	_GPIO_SetBits
1579  03ff 84            	pop	a
1580                     ; 408   return Device_ID;
1582  0400 7b01          	ld	a,(OFST+0,sp)
1585  0402 5b01          	addw	sp,#1
1586  0404 81            	ret
1599                     	xdef	_SPI_FLASH_Unlock
1600                     	xdef	_SPI_FLASH_BlockErase
1601                     	xdef	_SPI_FLASH_BufferRead
1602                     	xdef	_SPI_FLASH_BufferWrite
1603                     	xdef	_SPI_FLASH_PageWrite
1604                     	xdef	_SPI_FLASH_WriteOneByte
1605                     	xdef	_SPI_Flash_EraseChip
1606                     	xdef	_SPI_FLASH_WaitForWriteEnd
1607                     	xdef	_SPI_FLASH_WriteEnable
1608                     	xdef	_SPI_FLASH_ReadID
1609                     	xdef	_SPI_FLASH_SendByte
1610                     	xdef	_SPI_Flash_Init
1611                     	xref	_SPI_GetFlagStatus
1612                     	xref	_SPI_ReceiveData
1613                     	xref	_SPI_SendData
1614                     	xref	_SPI_Cmd
1615                     	xref	_SPI_Init
1616                     	xref	_SPI_DeInit
1617                     	xref	_GPIO_ResetBits
1618                     	xref	_GPIO_SetBits
1619                     	xref	_GPIO_Init
1620                     	xref.b	c_lreg
1639                     	xref	c_uitolx
1640                     	end
