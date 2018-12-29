   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     	bsct
  15  0000               _HexTable:
  16  0000 30            	dc.b	48
  17  0001 31            	dc.b	49
  18  0002 32            	dc.b	50
  19  0003 33            	dc.b	51
  20  0004 34            	dc.b	52
  21  0005 35            	dc.b	53
  22  0006 36            	dc.b	54
  23  0007 37            	dc.b	55
  24  0008 38            	dc.b	56
  25  0009 39            	dc.b	57
  26  000a 41            	dc.b	65
  27  000b 42            	dc.b	66
  28  000c 43            	dc.b	67
  29  000d 44            	dc.b	68
  30  000e 45            	dc.b	69
  31  000f 46            	dc.b	70
  71                     ; 29 void Delay(__IO uint16_t nCount)
  71                     ; 30 {
  73                     	switch	.text
  74  0000               _Delay:
  76  0000 89            	pushw	x
  77       00000000      OFST:	set	0
  80  0001 2007          	jra	L13
  81  0003               L72:
  82                     ; 34         nCount--;
  84  0003 1e01          	ldw	x,(OFST+1,sp)
  85  0005 1d0001        	subw	x,#1
  86  0008 1f01          	ldw	(OFST+1,sp),x
  87  000a               L13:
  88                     ; 32     while (nCount != 0)
  90  000a 1e01          	ldw	x,(OFST+1,sp)
  91  000c 26f5          	jrne	L72
  92                     ; 36 }
  95  000e 85            	popw	x
  96  000f 81            	ret
 133                     ; 43 void USART_SendStr(unsigned char *Str) 
 133                     ; 44 {
 134                     	switch	.text
 135  0010               _USART_SendStr:
 137  0010 89            	pushw	x
 138       00000000      OFST:	set	0
 141  0011 2020          	jra	L55
 142  0013               L35:
 143                     ; 47             USART_SendData8(USART1,*Str);     //发送数据 
 145  0013 1e01          	ldw	x,(OFST+1,sp)
 146  0015 f6            	ld	a,(x)
 147  0016 88            	push	a
 148  0017 ae5230        	ldw	x,#21040
 149  001a cd0000        	call	_USART_SendData8
 151  001d 84            	pop	a
 153  001e               L36:
 154                     ; 48             while(!USART_GetFlagStatus (USART1,USART_FLAG_TXE));//等待发送完毕
 156  001e ae0080        	ldw	x,#128
 157  0021 89            	pushw	x
 158  0022 ae5230        	ldw	x,#21040
 159  0025 cd0000        	call	_USART_GetFlagStatus
 161  0028 85            	popw	x
 162  0029 4d            	tnz	a
 163  002a 27f2          	jreq	L36
 164                     ; 49             Str++;//下一个数据
 166  002c 1e01          	ldw	x,(OFST+1,sp)
 167  002e 1c0001        	addw	x,#1
 168  0031 1f01          	ldw	(OFST+1,sp),x
 169  0033               L55:
 170                     ; 45         while(*Str!=0)//不为结束
 172  0033 1e01          	ldw	x,(OFST+1,sp)
 173  0035 7d            	tnz	(x)
 174  0036 26db          	jrne	L35
 175                     ; 51 }
 178  0038 85            	popw	x
 179  0039 81            	ret
 214                     ; 58 void Get_ChipID(u8 *ChipID)
 214                     ; 59 {
 215                     	switch	.text
 216  003a               _Get_ChipID:
 220                     ; 60 	ChipID[0] = *(__IO u8 *)(0X4926); 
 222  003a c64926        	ld	a,18726
 223  003d f7            	ld	(x),a
 224                     ; 61 	ChipID[1] = *(__IO u8 *)(0X4927); 
 226  003e c64927        	ld	a,18727
 227  0041 e701          	ld	(1,x),a
 228                     ; 62 	ChipID[2] = *(__IO u8 *)(0X4928);
 230  0043 c64928        	ld	a,18728
 231  0046 e702          	ld	(2,x),a
 232                     ; 63 	ChipID[3] = *(__IO u8 *)(0X4929);
 234  0048 c64929        	ld	a,18729
 235  004b e703          	ld	(3,x),a
 236                     ; 64 	ChipID[4] = *(__IO u8 *)(0X492A); 
 238  004d c6492a        	ld	a,18730
 239  0050 e704          	ld	(4,x),a
 240                     ; 65 	ChipID[5] = *(__IO u8 *)(0X492B); 
 242  0052 c6492b        	ld	a,18731
 243  0055 e705          	ld	(5,x),a
 244                     ; 66 	ChipID[6] = *(__IO u8 *)(0X492C);
 246  0057 c6492c        	ld	a,18732
 247  005a e706          	ld	(6,x),a
 248                     ; 67 	ChipID[7] = *(__IO u8 *)(0X492D); 
 250  005c c6492d        	ld	a,18733
 251  005f e707          	ld	(7,x),a
 252                     ; 68 	ChipID[8] = *(__IO u8 *)(0X492E); 
 254  0061 c6492e        	ld	a,18734
 255  0064 e708          	ld	(8,x),a
 256                     ; 69 	ChipID[9] = *(__IO u8 *)(0X492F);
 258  0066 c6492f        	ld	a,18735
 259  0069 e709          	ld	(9,x),a
 260                     ; 70 	ChipID[10] = *(__IO u8 *)(0X4930); 
 262  006b c64930        	ld	a,18736
 263  006e e70a          	ld	(10,x),a
 264                     ; 71 	ChipID[11] = *(__IO u8 *)(0X4931); 
 266  0070 c64931        	ld	a,18737
 267  0073 e70b          	ld	(11,x),a
 268                     ; 72 }
 271  0075 81            	ret
 323                     ; 81 int main( void )
 323                     ; 82 {
 324                     	switch	.text
 325  0076               _main:
 327  0076 523e          	subw	sp,#62
 328       0000003e      OFST:	set	62
 331                     ; 87     GPIO_Init(GPIOC,GPIO_Pin_3,GPIO_Mode_Out_PP_High_Fast);//TXD
 333  0078 4bf0          	push	#240
 334  007a 4b08          	push	#8
 335  007c ae500a        	ldw	x,#20490
 336  007f cd0000        	call	_GPIO_Init
 338  0082 85            	popw	x
 339                     ; 88     GPIO_Init(GPIOC,GPIO_Pin_2,GPIO_Mode_In_PU_No_IT);//RXD
 341  0083 4b40          	push	#64
 342  0085 4b04          	push	#4
 343  0087 ae500a        	ldw	x,#20490
 344  008a cd0000        	call	_GPIO_Init
 346  008d 85            	popw	x
 347                     ; 90     CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//开启USART时钟
 349  008e ae0501        	ldw	x,#1281
 350  0091 cd0000        	call	_CLK_PeripheralClockConfig
 352                     ; 91     USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Tx);//USART初始化，9600，8N1
 354  0094 4b08          	push	#8
 355  0096 4b00          	push	#0
 356  0098 4b00          	push	#0
 357  009a 4b00          	push	#0
 358  009c ae2580        	ldw	x,#9600
 359  009f 89            	pushw	x
 360  00a0 ae0000        	ldw	x,#0
 361  00a3 89            	pushw	x
 362  00a4 ae5230        	ldw	x,#21040
 363  00a7 cd0000        	call	_USART_Init
 365  00aa 5b08          	addw	sp,#8
 366                     ; 92     USART_Cmd (USART1,ENABLE);//使能USART
 368  00ac 4b01          	push	#1
 369  00ae ae5230        	ldw	x,#21040
 370  00b1 cd0000        	call	_USART_Cmd
 372  00b4 84            	pop	a
 373                     ; 93     USART_SendStr("蓝旗嵌入式\r\n"); //发送字符串，末尾换行
 375  00b5 ae0027        	ldw	x,#L721
 376  00b8 cd0010        	call	_USART_SendStr
 378                     ; 94     Get_ChipID(ChipID);//获取芯片ID
 380  00bb 96            	ldw	x,sp
 381  00bc 1c0033        	addw	x,#OFST-11
 382  00bf cd003a        	call	_Get_ChipID
 384                     ; 95     sprintf(str,"芯片ID:%X%X-%X%X-%X%X-%X%X-%X%X-%X%X\r\n",ChipID[0],ChipID[1],ChipID[2],ChipID[3],ChipID[4],ChipID[5],ChipID[6],ChipID[7],ChipID[8],ChipID[9],ChipID[10],ChipID[11]);
 386  00c2 7b3e          	ld	a,(OFST+0,sp)
 387  00c4 88            	push	a
 388  00c5 7b3e          	ld	a,(OFST+0,sp)
 389  00c7 88            	push	a
 390  00c8 7b3e          	ld	a,(OFST+0,sp)
 391  00ca 88            	push	a
 392  00cb 7b3e          	ld	a,(OFST+0,sp)
 393  00cd 88            	push	a
 394  00ce 7b3e          	ld	a,(OFST+0,sp)
 395  00d0 88            	push	a
 396  00d1 7b3e          	ld	a,(OFST+0,sp)
 397  00d3 88            	push	a
 398  00d4 7b3e          	ld	a,(OFST+0,sp)
 399  00d6 88            	push	a
 400  00d7 7b3e          	ld	a,(OFST+0,sp)
 401  00d9 88            	push	a
 402  00da 7b3e          	ld	a,(OFST+0,sp)
 403  00dc 88            	push	a
 404  00dd 7b3e          	ld	a,(OFST+0,sp)
 405  00df 88            	push	a
 406  00e0 7b3e          	ld	a,(OFST+0,sp)
 407  00e2 88            	push	a
 408  00e3 7b3e          	ld	a,(OFST+0,sp)
 409  00e5 88            	push	a
 410  00e6 ae0000        	ldw	x,#L131
 411  00e9 89            	pushw	x
 412  00ea 96            	ldw	x,sp
 413  00eb 1c000f        	addw	x,#OFST-47
 414  00ee cd0000        	call	_sprintf
 416  00f1 5b0e          	addw	sp,#14
 417                     ; 96 		USART_SendStr(str);//输出
 419  00f3 96            	ldw	x,sp
 420  00f4 1c0001        	addw	x,#OFST-61
 421  00f7 cd0010        	call	_USART_SendStr
 423  00fa               L331:
 425  00fa 20fe          	jra	L331
 450                     	xdef	_main
 451                     	xdef	_Get_ChipID
 452                     	xdef	_USART_SendStr
 453                     	xdef	_Delay
 454                     	xdef	_HexTable
 455                     	xref	_sprintf
 456                     	xref	_USART_GetFlagStatus
 457                     	xref	_USART_SendData8
 458                     	xref	_USART_Cmd
 459                     	xref	_USART_Init
 460                     	xref	_GPIO_Init
 461                     	xref	_CLK_PeripheralClockConfig
 462                     .const:	section	.text
 463  0000               L131:
 464  0000 d0bec6ac4944  	dc.b	208,190,198,172,73,68
 465  0006 3a255825582d  	dc.b	":%X%X-%X%X-%X%X-%X"
 466  0018 25582d255825  	dc.b	"%X-%X%X-%X%X",13
 467  0025 0a00          	dc.b	10,0
 468  0027               L721:
 469  0027 c0b6c6ecc7b6  	dc.b	192,182,198,236,199,182
 470  002d c8ebcabd0d0a  	dc.b	200,235,202,189,13,10,0
 490                     	end
