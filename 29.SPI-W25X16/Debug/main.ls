   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     	bsct
  15  0000               _i:
  16  0000 00            	dc.b	0
  17  0001               _SendBuf:
  18  0001 53544d384c20  	dc.b	"STM8L SPI",178
  19  000b d9d7f7323558  	dc.b	217,215,247,50,53,88
  20  0011 313620ca      	dc.b	"16 ",202
  21  0015 b5d1e9a3a10d  	dc.b	181,209,233,163,161,13
  22  001b 0a00          	dc.b	10,0
  23  001d               _HexTable:
  24  001d 30            	dc.b	48
  25  001e 31            	dc.b	49
  26  001f 32            	dc.b	50
  27  0020 33            	dc.b	51
  28  0021 34            	dc.b	52
  29  0022 35            	dc.b	53
  30  0023 36            	dc.b	54
  31  0024 37            	dc.b	55
  32  0025 38            	dc.b	56
  33  0026 39            	dc.b	57
  34  0027 41            	dc.b	65
  35  0028 42            	dc.b	66
  36  0029 43            	dc.b	67
  37  002a 44            	dc.b	68
  38  002b 45            	dc.b	69
  39  002c 46            	dc.b	70
  80                     ; 34 void Delay(__IO uint16_t nCount)
  80                     ; 35 {
  82                     	switch	.text
  83  0000               _Delay:
  85  0000 89            	pushw	x
  86       00000000      OFST:	set	0
  89  0001 2007          	jra	L13
  90  0003               L72:
  91                     ; 39         nCount--;
  93  0003 1e01          	ldw	x,(OFST+1,sp)
  94  0005 1d0001        	subw	x,#1
  95  0008 1f01          	ldw	(OFST+1,sp),x
  96  000a               L13:
  97                     ; 37     while (nCount != 0)
  99  000a 1e01          	ldw	x,(OFST+1,sp)
 100  000c 26f5          	jrne	L72
 101                     ; 41 }
 104  000e 85            	popw	x
 105  000f 81            	ret
 141                     ; 48 void Send_Dat(u8 dat)
 141                     ; 49 {
 142                     	switch	.text
 143  0010               _Send_Dat:
 145  0010 88            	push	a
 146       00000000      OFST:	set	0
 149  0011               L55:
 150                     ; 50    while(( USART_GetFlagStatus(USART1,USART_FLAG_TXE)==RESET));
 152  0011 ae0080        	ldw	x,#128
 153  0014 89            	pushw	x
 154  0015 ae5230        	ldw	x,#21040
 155  0018 cd0000        	call	_USART_GetFlagStatus
 157  001b 85            	popw	x
 158  001c 4d            	tnz	a
 159  001d 27f2          	jreq	L55
 160                     ; 51    USART_SendData8(USART1,dat);
 162  001f 7b01          	ld	a,(OFST+1,sp)
 163  0021 88            	push	a
 164  0022 ae5230        	ldw	x,#21040
 165  0025 cd0000        	call	_USART_SendData8
 167  0028 84            	pop	a
 168                     ; 52 }
 171  0029 84            	pop	a
 172  002a 81            	ret
 208                     ; 59 void Send_Hex(unsigned char dat)
 208                     ; 60 {
 209                     	switch	.text
 210  002b               _Send_Hex:
 212  002b 88            	push	a
 213       00000000      OFST:	set	0
 216                     ; 61    Send_Dat('0');
 218  002c a630          	ld	a,#48
 219  002e ade0          	call	_Send_Dat
 221                     ; 62    Send_Dat('x');
 223  0030 a678          	ld	a,#120
 224  0032 addc          	call	_Send_Dat
 226                     ; 63    Send_Dat(HexTable[dat>>4]);
 228  0034 7b01          	ld	a,(OFST+1,sp)
 229  0036 4e            	swap	a
 230  0037 a40f          	and	a,#15
 231  0039 5f            	clrw	x
 232  003a 97            	ld	xl,a
 233  003b e61d          	ld	a,(_HexTable,x)
 234  003d add1          	call	_Send_Dat
 236                     ; 64    Send_Dat(HexTable[dat&0x0f]);
 238  003f 7b01          	ld	a,(OFST+1,sp)
 239  0041 a40f          	and	a,#15
 240  0043 5f            	clrw	x
 241  0044 97            	ld	xl,a
 242  0045 e61d          	ld	a,(_HexTable,x)
 243  0047 adc7          	call	_Send_Dat
 245                     ; 65    Send_Dat(' ');
 247  0049 a620          	ld	a,#32
 248  004b adc3          	call	_Send_Dat
 250                     ; 66 }
 253  004d 84            	pop	a
 254  004e 81            	ret
 291                     ; 73 void USART_SendStr(unsigned char *Str) 
 291                     ; 74 {
 292                     	switch	.text
 293  004f               _USART_SendStr:
 295  004f 89            	pushw	x
 296       00000000      OFST:	set	0
 299  0050 2020          	jra	L711
 300  0052               L511:
 301                     ; 77             USART_SendData8(USART1,*Str);     //发送数据 
 303  0052 1e01          	ldw	x,(OFST+1,sp)
 304  0054 f6            	ld	a,(x)
 305  0055 88            	push	a
 306  0056 ae5230        	ldw	x,#21040
 307  0059 cd0000        	call	_USART_SendData8
 309  005c 84            	pop	a
 311  005d               L521:
 312                     ; 78             while(!USART_GetFlagStatus (USART1,USART_FLAG_TXE));//等待发送完毕
 314  005d ae0080        	ldw	x,#128
 315  0060 89            	pushw	x
 316  0061 ae5230        	ldw	x,#21040
 317  0064 cd0000        	call	_USART_GetFlagStatus
 319  0067 85            	popw	x
 320  0068 4d            	tnz	a
 321  0069 27f2          	jreq	L521
 322                     ; 79             Str++;//下一个数据
 324  006b 1e01          	ldw	x,(OFST+1,sp)
 325  006d 1c0001        	addw	x,#1
 326  0070 1f01          	ldw	(OFST+1,sp),x
 327  0072               L711:
 328                     ; 75         while(*Str!=0)//不为结束
 330  0072 1e01          	ldw	x,(OFST+1,sp)
 331  0074 7d            	tnz	(x)
 332  0075 26db          	jrne	L511
 333                     ; 81 }
 336  0077 85            	popw	x
 337  0078 81            	ret
 377                     ; 89 int main( void )
 377                     ; 90 {
 378                     	switch	.text
 379  0079               _main:
 383                     ; 91 	GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//初始化LED1接口
 385  0079 4bc0          	push	#192
 386  007b 4b10          	push	#16
 387  007d ae500a        	ldw	x,#20490
 388  0080 cd0000        	call	_GPIO_Init
 390  0083 85            	popw	x
 391                     ; 93 	GPIO_Init(GPIOC,GPIO_Pin_3,GPIO_Mode_Out_PP_High_Fast);//TXD
 393  0084 4bf0          	push	#240
 394  0086 4b08          	push	#8
 395  0088 ae500a        	ldw	x,#20490
 396  008b cd0000        	call	_GPIO_Init
 398  008e 85            	popw	x
 399                     ; 94 	GPIO_Init(GPIOC,GPIO_Pin_2,GPIO_Mode_In_PU_No_IT);//RXD
 401  008f 4b40          	push	#64
 402  0091 4b04          	push	#4
 403  0093 ae500a        	ldw	x,#20490
 404  0096 cd0000        	call	_GPIO_Init
 406  0099 85            	popw	x
 407                     ; 96 	CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//开启USART1时钟
 409  009a ae0501        	ldw	x,#1281
 410  009d cd0000        	call	_CLK_PeripheralClockConfig
 412                     ; 97   CLK_PeripheralClockConfig (CLK_Peripheral_SPI1,ENABLE);//开启SPI时钟
 414  00a0 ae0401        	ldw	x,#1025
 415  00a3 cd0000        	call	_CLK_PeripheralClockConfig
 417                     ; 99 	USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Rx|USART_Mode_Tx);//设置USART参数9600，8N1，接收/发送
 419  00a6 4b0c          	push	#12
 420  00a8 4b00          	push	#0
 421  00aa 4b00          	push	#0
 422  00ac 4b00          	push	#0
 423  00ae ae2580        	ldw	x,#9600
 424  00b1 89            	pushw	x
 425  00b2 ae0000        	ldw	x,#0
 426  00b5 89            	pushw	x
 427  00b6 ae5230        	ldw	x,#21040
 428  00b9 cd0000        	call	_USART_Init
 430  00bc 5b08          	addw	sp,#8
 431                     ; 100   USART_SendStr("STM8L SPI读写测试:\r\n");
 433  00be ae0088        	ldw	x,#L141
 434  00c1 ad8c          	call	_USART_SendStr
 436                     ; 103 	GPIO_Init(GPIOB, GPIO_Pin_5, GPIO_Mode_Out_PP_High_Fast);
 438  00c3 4bf0          	push	#240
 439  00c5 4b20          	push	#32
 440  00c7 ae5005        	ldw	x,#20485
 441  00ca cd0000        	call	_GPIO_Init
 443  00cd 85            	popw	x
 444                     ; 104 	GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_Out_PP_High_Fast);
 446  00ce 4bf0          	push	#240
 447  00d0 4b40          	push	#64
 448  00d2 ae5005        	ldw	x,#20485
 449  00d5 cd0000        	call	_GPIO_Init
 451  00d8 85            	popw	x
 452                     ; 105 	GPIO_Init(GPIOB, GPIO_Pin_7, GPIO_Mode_In_PU_No_IT);
 454  00d9 4b40          	push	#64
 455  00db 4b80          	push	#128
 456  00dd ae5005        	ldw	x,#20485
 457  00e0 cd0000        	call	_GPIO_Init
 459  00e3 85            	popw	x
 460                     ; 107   SPI_Flash_Init();//SPI初始化
 462  00e4 cd0000        	call	_SPI_Flash_Init
 464                     ; 108   USART_SendStr("正在读取芯片ID\r\n");
 466  00e7 ae0077        	ldw	x,#L341
 467  00ea cd004f        	call	_USART_SendStr
 469                     ; 109   FlashID=SPI_FLASH_ReadID();//获取W25X16芯片ID
 471  00ed cd0000        	call	_SPI_FLASH_ReadID
 473  00f0 bf1c          	ldw	_FlashID,x
 474                     ; 110   USART_SendStr("芯片ID为:");
 476  00f2 ae006d        	ldw	x,#L541
 477  00f5 cd004f        	call	_USART_SendStr
 479                     ; 111   Send_Hex(FlashID>>8);
 481  00f8 b61c          	ld	a,_FlashID
 482  00fa cd002b        	call	_Send_Hex
 484                     ; 112   Send_Hex(FlashID&0xff);
 486  00fd b61d          	ld	a,_FlashID+1
 487  00ff a4ff          	and	a,#255
 488  0101 cd002b        	call	_Send_Hex
 490                     ; 113 	USART_SendStr("\r\n");
 492  0104 ae006a        	ldw	x,#L741
 493  0107 cd004f        	call	_USART_SendStr
 495                     ; 116   SPI_FLASH_WriteEnable();
 497  010a cd0000        	call	_SPI_FLASH_WriteEnable
 499                     ; 117   USART_SendStr("开始擦除整块芯片......\r\n");
 501  010d ae0051        	ldw	x,#L151
 502  0110 cd004f        	call	_USART_SendStr
 504                     ; 118   SPI_Flash_EraseChip();
 506  0113 cd0000        	call	_SPI_Flash_EraseChip
 508                     ; 119   SPI_FLASH_BlockErase(0);
 510  0116 5f            	clrw	x
 511  0117 cd0000        	call	_SPI_FLASH_BlockErase
 513                     ; 120   USART_SendStr("芯片擦除完毕！\r\n");
 515  011a ae0040        	ldw	x,#L351
 516  011d cd004f        	call	_USART_SendStr
 518                     ; 122   USART_SendStr("开始写入数据\r\n");
 520  0120 ae0031        	ldw	x,#L551
 521  0123 cd004f        	call	_USART_SendStr
 523                     ; 124   SPI_FLASH_BufferWrite(SendBuf, 0, BufferSize);
 525  0126 ae001c        	ldw	x,#28
 526  0129 89            	pushw	x
 527  012a 5f            	clrw	x
 528  012b 89            	pushw	x
 529  012c ae0001        	ldw	x,#_SendBuf
 530  012f cd0000        	call	_SPI_FLASH_BufferWrite
 532  0132 5b04          	addw	sp,#4
 533                     ; 127   USART_SendStr("写入数据完毕！\r\n");
 535  0134 ae0020        	ldw	x,#L751
 536  0137 cd004f        	call	_USART_SendStr
 538                     ; 129   USART_SendStr("开始读出数据\r\n");
 540  013a ae0011        	ldw	x,#L161
 541  013d cd004f        	call	_USART_SendStr
 543                     ; 130   SPI_FLASH_BufferRead(RecBuf, 0,BufferSize);
 545  0140 ae001c        	ldw	x,#28
 546  0143 89            	pushw	x
 547  0144 5f            	clrw	x
 548  0145 89            	pushw	x
 549  0146 ae0000        	ldw	x,#_RecBuf
 550  0149 cd0000        	call	_SPI_FLASH_BufferRead
 552  014c 5b04          	addw	sp,#4
 553                     ; 131   USART_SendStr("读出数据完毕！\r\n");
 555  014e ae0000        	ldw	x,#L361
 556  0151 cd004f        	call	_USART_SendStr
 558                     ; 133   USART_SendStr(RecBuf);//将读出的数据通过USART发出
 560  0154 ae0000        	ldw	x,#_RecBuf
 561  0157 cd004f        	call	_USART_SendStr
 563  015a               L561:
 564                     ; 136 		GPIO_ToggleBits(LED1_PORT, LED1_PINS);//翻转LED1接口电平，实现LED1闪烁
 566  015a 4b10          	push	#16
 567  015c ae500a        	ldw	x,#20490
 568  015f cd0000        	call	_GPIO_ToggleBits
 570  0162 84            	pop	a
 571                     ; 137 		Delay(0xFFFF);//延时，便于观察实验现象
 573  0163 aeffff        	ldw	x,#65535
 574  0166 cd0000        	call	_Delay
 577  0169 20ef          	jra	L561
 640                     	xdef	_main
 641                     	xdef	_USART_SendStr
 642                     	xdef	_Send_Hex
 643                     	xdef	_Send_Dat
 644                     	xdef	_Delay
 645                     	xdef	_HexTable
 646                     	switch	.ubsct
 647  0000               _RecBuf:
 648  0000 000000000000  	ds.b	28
 649                     	xdef	_RecBuf
 650                     	xdef	_SendBuf
 651  001c               _FlashID:
 652  001c 0000          	ds.b	2
 653                     	xdef	_FlashID
 654                     	xdef	_i
 655                     	xref	_SPI_FLASH_BlockErase
 656                     	xref	_SPI_FLASH_BufferRead
 657                     	xref	_SPI_FLASH_BufferWrite
 658                     	xref	_SPI_Flash_EraseChip
 659                     	xref	_SPI_FLASH_WriteEnable
 660                     	xref	_SPI_FLASH_ReadID
 661                     	xref	_SPI_Flash_Init
 662                     	xref	_USART_GetFlagStatus
 663                     	xref	_USART_SendData8
 664                     	xref	_USART_Init
 665                     	xref	_GPIO_ToggleBits
 666                     	xref	_GPIO_Init
 667                     	xref	_CLK_PeripheralClockConfig
 668                     .const:	section	.text
 669  0000               L361:
 670  0000 b6c1b3f6cafd  	dc.b	182,193,179,246,202,253
 671  0006 beddcdeab1cf  	dc.b	190,221,205,234,177,207
 672  000c a3a10d0a00    	dc.b	163,161,13,10,0
 673  0011               L161:
 674  0011 bfaacabcb6c1  	dc.b	191,170,202,188,182,193
 675  0017 b3f6cafdbedd  	dc.b	179,246,202,253,190,221
 676  001d 0d0a00        	dc.b	13,10,0
 677  0020               L751:
 678  0020 d0b4c8ebcafd  	dc.b	208,180,200,235,202,253
 679  0026 beddcdeab1cf  	dc.b	190,221,205,234,177,207
 680  002c a3a10d0a00    	dc.b	163,161,13,10,0
 681  0031               L551:
 682  0031 bfaacabcd0b4  	dc.b	191,170,202,188,208,180
 683  0037 c8ebcafdbedd  	dc.b	200,235,202,253,190,221
 684  003d 0d0a00        	dc.b	13,10,0
 685  0040               L351:
 686  0040 d0bec6acb2c1  	dc.b	208,190,198,172,178,193
 687  0046 b3fdcdeab1cf  	dc.b	179,253,205,234,177,207
 688  004c a3a10d0a00    	dc.b	163,161,13,10,0
 689  0051               L151:
 690  0051 bfaacabcb2c1  	dc.b	191,170,202,188,178,193
 691  0057 b3fdd5fbbfe9  	dc.b	179,253,213,251,191,233
 692  005d d0bec6ac2e2e  	dc.b	208,190,198,172,46,46
 693  0063 2e2e2e2e0d    	dc.b	"....",13
 694  0068 0a00          	dc.b	10,0
 695  006a               L741:
 696  006a 0d0a00        	dc.b	13,10,0
 697  006d               L541:
 698  006d d0bec6ac4944  	dc.b	208,190,198,172,73,68
 699  0073 ceaa3a00      	dc.b	206,170,58,0
 700  0077               L341:
 701  0077 d5fdd4dab6c1  	dc.b	213,253,212,218,182,193
 702  007d c8a1d0bec6ac  	dc.b	200,161,208,190,198,172
 703  0083 49440d        	dc.b	"ID",13
 704  0086 0a00          	dc.b	10,0
 705  0088               L141:
 706  0088 53544d384c20  	dc.b	"STM8L SPI",182
 707  0092 c1d0b4b2e2ca  	dc.b	193,208,180,178,226,202
 708  0098 d43a0d0a00    	dc.b	212,58,13,10,0
 728                     	end
