   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  55                     ; 54 void dellayus(unsigned int i)
  55                     ; 55 {
  56                     	switch	.text
  57  0000               f_dellayus:
  59  0000 89            	pushw	x
  60  0001 5204          	subw	sp,#4
  61       00000004      OFST:	set	4
  64                     ; 58    for (j = 0; j <1; j++)
  66  0003 5f            	clrw	x
  67  0004 1f01          	ldw	(OFST-3,sp),x
  68  0006               L13:
  69                     ; 60         for (k = 0; k < i; k++);
  71  0006 5f            	clrw	x
  72  0007 1f03          	ldw	(OFST-1,sp),x
  74  0009 2007          	jra	L34
  75  000b               L73:
  79  000b 1e03          	ldw	x,(OFST-1,sp)
  80  000d 1c0001        	addw	x,#1
  81  0010 1f03          	ldw	(OFST-1,sp),x
  82  0012               L34:
  85  0012 1e03          	ldw	x,(OFST-1,sp)
  86  0014 1305          	cpw	x,(OFST+1,sp)
  87  0016 25f3          	jrult	L73
  88                     ; 58    for (j = 0; j <1; j++)
  90  0018 1e01          	ldw	x,(OFST-3,sp)
  91  001a 1c0001        	addw	x,#1
  92  001d 1f01          	ldw	(OFST-3,sp),x
  95  001f 1e01          	ldw	x,(OFST-3,sp)
  96  0021 27e3          	jreq	L13
  97                     ; 62 }
 100  0023 5b06          	addw	sp,#6
 101  0025 87            	retf
 146                     ; 69 void dellayxm(unsigned int uiNum)
 146                     ; 70 {
 147                     	switch	.text
 148  0026               f_dellayxm:
 150  0026 89            	pushw	x
 151  0027 5204          	subw	sp,#4
 152       00000004      OFST:	set	4
 155                     ; 71    unsigned int i = 0;
 157  0029 5f            	clrw	x
 158  002a 1f01          	ldw	(OFST-3,sp),x
 159                     ; 72    unsigned int j = 0;
 161  002c 1e03          	ldw	x,(OFST-1,sp)
 163  002e 2018          	jra	L17
 164  0030               L76:
 165                     ; 75    	i++;
 167  0030 1e01          	ldw	x,(OFST-3,sp)
 168  0032 1c0001        	addw	x,#1
 169  0035 1f01          	ldw	(OFST-3,sp),x
 170                     ; 76 	for(j = 0; j < 4369; j++);
 172  0037 5f            	clrw	x
 173  0038 1f03          	ldw	(OFST-1,sp),x
 174  003a               L57:
 178  003a 1e03          	ldw	x,(OFST-1,sp)
 179  003c 1c0001        	addw	x,#1
 180  003f 1f03          	ldw	(OFST-1,sp),x
 183  0041 1e03          	ldw	x,(OFST-1,sp)
 184  0043 a31111        	cpw	x,#4369
 185  0046 25f2          	jrult	L57
 186  0048               L17:
 187                     ; 73    while(i < uiNum) 
 189  0048 1e01          	ldw	x,(OFST-3,sp)
 190  004a 1305          	cpw	x,(OFST+1,sp)
 191  004c 25e2          	jrult	L76
 192                     ; 78 }
 195  004e 5b06          	addw	sp,#6
 196  0050 87            	retf
 227                     ; 85 void dellay(uint32_t i)
 227                     ; 86 {
 228                     	switch	.text
 229  0051               f_dellay:
 231       00000000      OFST:	set	0
 234  0051               L121:
 235                     ; 87   while(i--);
 237  0051 96            	ldw	x,sp
 238  0052 1c0004        	addw	x,#OFST+4
 239  0055 8d000000      	callf	d_ltor
 241  0059 96            	ldw	x,sp
 242  005a 1c0004        	addw	x,#OFST+4
 243  005d a601          	ld	a,#1
 244  005f 8d000000      	callf	d_lgsbc
 246  0063 8d000000      	callf	d_lrzmp
 248  0067 26e8          	jrne	L121
 249                     ; 88 }
 252  0069 87            	retf
 297                     .const:	section	.text
 298  0000               L41:
 299  0000 00001111      	dc.l	4369
 300                     ; 95 void dellayxms(uint32_t uiNum)
 300                     ; 96 {
 301                     	switch	.text
 302  006a               f_dellayxms:
 304  006a 5208          	subw	sp,#8
 305       00000008      OFST:	set	8
 308                     ; 97    uint32_t i = 0;
 310  006c ae0000        	ldw	x,#0
 311  006f 1f03          	ldw	(OFST-5,sp),x
 312  0071 ae0000        	ldw	x,#0
 313  0074 1f01          	ldw	(OFST-7,sp),x
 314                     ; 98    uint32_t j = 0;
 316  0076 96            	ldw	x,sp
 317  0077 1c0005        	addw	x,#OFST-3
 318  007a 8d000000      	callf	d_ltor
 321  007e 202f          	jra	L741
 322  0080               L541:
 323                     ; 101    	i++;
 325  0080 96            	ldw	x,sp
 326  0081 1c0001        	addw	x,#OFST-7
 327  0084 a601          	ld	a,#1
 328  0086 8d000000      	callf	d_lgadc
 330                     ; 102 	for(j = 0; j < 4369; j++);
 332  008a ae0000        	ldw	x,#0
 333  008d 1f07          	ldw	(OFST-1,sp),x
 334  008f ae0000        	ldw	x,#0
 335  0092 1f05          	ldw	(OFST-3,sp),x
 336  0094               L351:
 340  0094 96            	ldw	x,sp
 341  0095 1c0005        	addw	x,#OFST-3
 342  0098 a601          	ld	a,#1
 343  009a 8d000000      	callf	d_lgadc
 347  009e 96            	ldw	x,sp
 348  009f 1c0005        	addw	x,#OFST-3
 349  00a2 8d000000      	callf	d_ltor
 351  00a6 ae0000        	ldw	x,#L41
 352  00a9 8d000000      	callf	d_lcmp
 354  00ad 25e5          	jrult	L351
 355  00af               L741:
 356                     ; 99    while(i < uiNum) 
 358  00af 96            	ldw	x,sp
 359  00b0 1c0001        	addw	x,#OFST-7
 360  00b3 8d000000      	callf	d_ltor
 362  00b7 96            	ldw	x,sp
 363  00b8 1c000c        	addw	x,#OFST+4
 364  00bb 8d000000      	callf	d_lcmp
 366  00bf 25bf          	jrult	L541
 367                     ; 104 }
 370  00c1 5b08          	addw	sp,#8
 371  00c3 87            	retf
 403                     ; 111 unsigned char IRQ_STATE(void)
 403                     ; 112 {
 404                     	switch	.text
 405  00c4               f_IRQ_STATE:
 407  00c4 88            	push	a
 408       00000001      OFST:	set	1
 411                     ; 113     uint8_t state = 0;
 413  00c5 0f01          	clr	(OFST+0,sp)
 414                     ; 115     state = IRQ_READ();
 416  00c7 4b40          	push	#64
 417  00c9 ae500f        	ldw	x,#20495
 418  00cc 8d000000      	callf	f_GPIO_ReadInputDataBit
 420  00d0 5b01          	addw	sp,#1
 421  00d2 6b01          	ld	(OFST+0,sp),a
 422                     ; 116     return ( state );
 424  00d4 7b01          	ld	a,(OFST+0,sp)
 427  00d6 5b01          	addw	sp,#1
 428  00d8 87            	retf
 456                     ; 124 void MCU_PinInit(void)
 456                     ; 125 {   
 457                     	switch	.text
 458  00d9               f_MCU_PinInit:
 462                     ; 126     CLK_PeripheralClockConfig(CLK_Peripheral_SPI1,ENABLE);
 464  00d9 ae0001        	ldw	x,#1
 465  00dc a604          	ld	a,#4
 466  00de 95            	ld	xh,a
 467  00df 8d000000      	callf	f_CLK_PeripheralClockConfig
 469                     ; 127     GPIO_Init(GPIOB, GPIO_Pin_5, GPIO_Mode_Out_PP_High_Fast);
 471  00e3 4bf0          	push	#240
 472  00e5 4b20          	push	#32
 473  00e7 ae5005        	ldw	x,#20485
 474  00ea 8d000000      	callf	f_GPIO_Init
 476  00ee 85            	popw	x
 477                     ; 128     GPIO_Init(GPIOB, GPIO_Pin_6, GPIO_Mode_Out_PP_High_Fast);
 479  00ef 4bf0          	push	#240
 480  00f1 4b40          	push	#64
 481  00f3 ae5005        	ldw	x,#20485
 482  00f6 8d000000      	callf	f_GPIO_Init
 484  00fa 85            	popw	x
 485                     ; 129     GPIO_Init(GPIOB, GPIO_Pin_7, GPIO_Mode_In_PU_No_IT);
 487  00fb 4b40          	push	#64
 488  00fd 4b80          	push	#128
 489  00ff ae5005        	ldw	x,#20485
 490  0102 8d000000      	callf	f_GPIO_Init
 492  0106 85            	popw	x
 493                     ; 130     GPIO_Init(GPIOD, GPIO_Pin_5, GPIO_Mode_Out_PP_High_Fast);
 495  0107 4bf0          	push	#240
 496  0109 4b20          	push	#32
 497  010b ae500f        	ldw	x,#20495
 498  010e 8d000000      	callf	f_GPIO_Init
 500  0112 85            	popw	x
 501                     ; 131     GPIO_Init(GPIOD, GPIO_Pin_6, GPIO_Mode_In_PU_No_IT);
 503  0113 4b40          	push	#64
 504  0115 4b40          	push	#64
 505  0117 ae500f        	ldw	x,#20495
 506  011a 8d000000      	callf	f_GPIO_Init
 508  011e 85            	popw	x
 509                     ; 132     GPIO_Init(GPIOD, GPIO_Pin_7, GPIO_Mode_Out_PP_High_Fast);
 511  011f 4bf0          	push	#240
 512  0121 4b80          	push	#128
 513  0123 ae500f        	ldw	x,#20495
 514  0126 8d000000      	callf	f_GPIO_Init
 516  012a 85            	popw	x
 517                     ; 134     SPI_DeInit(SPI1);
 519  012b ae5200        	ldw	x,#20992
 520  012e 8d000000      	callf	f_SPI_DeInit
 522                     ; 135     SPI_Init(SPI1,SPI_FirstBit_MSB, SPI_BaudRatePrescaler_4, SPI_Mode_Master,\
 522                     ; 136 	   SPI_CPOL_Low, SPI_CPHA_1Edge, \
 522                     ; 137 	   SPI_Direction_2Lines_FullDuplex, SPI_NSS_Soft, 0x07);
 524  0132 4b07          	push	#7
 525  0134 4b02          	push	#2
 526  0136 4b00          	push	#0
 527  0138 4b00          	push	#0
 528  013a 4b00          	push	#0
 529  013c 4b04          	push	#4
 530  013e 4b08          	push	#8
 531  0140 4b00          	push	#0
 532  0142 ae5200        	ldw	x,#20992
 533  0145 8d000000      	callf	f_SPI_Init
 535  0149 5b08          	addw	sp,#8
 536                     ; 139     SPI_Cmd(SPI1,ENABLE);	/* 使能SPI */
 538  014b 4b01          	push	#1
 539  014d ae5200        	ldw	x,#20992
 540  0150 8d000000      	callf	f_SPI_Cmd
 542  0154 84            	pop	a
 543                     ; 140     SEL_H();
 545  0155 4b20          	push	#32
 546  0157 ae500f        	ldw	x,#20495
 547  015a 8d000000      	callf	f_GPIO_SetBits
 549  015e 84            	pop	a
 550                     ; 142 }
 553  015f 87            	retf
 587                     ; 149 uint8_t SpiSendByte(uint8_t dat)
 587                     ; 150 {
 588                     	switch	.text
 589  0160               f_SpiSendByte:
 591  0160 88            	push	a
 592       00000000      OFST:	set	0
 595  0161               L322:
 596                     ; 152     while(SPI_GetFlagStatus(SPI1, SPI_FLAG_TXE) == RESET);  
 598  0161 4b02          	push	#2
 599  0163 ae5200        	ldw	x,#20992
 600  0166 8d000000      	callf	f_SPI_GetFlagStatus
 602  016a 5b01          	addw	sp,#1
 603  016c 4d            	tnz	a
 604  016d 27f2          	jreq	L322
 605                     ; 155     SPI_SendData(SPI1, dat);  
 607  016f 7b01          	ld	a,(OFST+1,sp)
 608  0171 88            	push	a
 609  0172 ae5200        	ldw	x,#20992
 610  0175 8d000000      	callf	f_SPI_SendData
 612  0179 84            	pop	a
 614  017a               L132:
 615                     ; 158     while(SPI_GetFlagStatus(SPI1, SPI_FLAG_RXNE) == RESET);  
 617  017a 4b01          	push	#1
 618  017c ae5200        	ldw	x,#20992
 619  017f 8d000000      	callf	f_SPI_GetFlagStatus
 621  0183 5b01          	addw	sp,#1
 622  0185 4d            	tnz	a
 623  0186 27f2          	jreq	L132
 624                     ; 161     return SPI_ReceiveData(SPI1);                                                          /* set 0;                       */ 
 626  0188 ae5200        	ldw	x,#20992
 627  018b 8d000000      	callf	f_SPI_ReceiveData
 631  018f 5b01          	addw	sp,#1
 632  0191 87            	retf
 655                     ; 169 unsigned char SpiRCVByte(void)
 655                     ; 170 {
 656                     	switch	.text
 657  0192               f_SpiRCVByte:
 661                     ; 171     return (SpiSendByte(0x00));
 663  0192 4f            	clr	a
 664  0193 8d600160      	callf	f_SpiSendByte
 668  0197 87            	retf
 710                     ; 179 uint8_t SpiReadRegister (uint8_t ucReg)
 710                     ; 180 {
 711                     	switch	.text
 712  0198               f_SpiReadRegister:
 714  0198 88            	push	a
 715  0199 88            	push	a
 716       00000001      OFST:	set	1
 719                     ; 183 	SEL_L();
 721  019a 4b20          	push	#32
 722  019c ae500f        	ldw	x,#20495
 723  019f 8d000000      	callf	f_GPIO_ResetBits
 725  01a3 84            	pop	a
 726                     ; 184 	SpiSendByte(ucReg);
 728  01a4 7b02          	ld	a,(OFST+1,sp)
 729  01a6 8d600160      	callf	f_SpiSendByte
 731                     ; 185 	ucTemp = SpiRCVByte();
 733  01aa 8d920192      	callf	f_SpiRCVByte
 735  01ae 6b01          	ld	(OFST+0,sp),a
 736                     ; 186 	SEL_H();
 738  01b0 4b20          	push	#32
 739  01b2 ae500f        	ldw	x,#20495
 740  01b5 8d000000      	callf	f_GPIO_SetBits
 742  01b9 84            	pop	a
 743                     ; 187 	return ucTemp;	
 745  01ba 7b01          	ld	a,(OFST+0,sp)
 748  01bc 85            	popw	x
 749  01bd 87            	retf
 790                     ; 195 void SpiWriteRegister(uint8_t ucReg,uint8_t ucData)
 790                     ; 196 {	
 791                     	switch	.text
 792  01be               f_SpiWriteRegister:
 794  01be 89            	pushw	x
 795       00000000      OFST:	set	0
 798                     ; 197 	SEL_L();
 800  01bf 4b20          	push	#32
 801  01c1 ae500f        	ldw	x,#20495
 802  01c4 8d000000      	callf	f_GPIO_ResetBits
 804  01c8 84            	pop	a
 805                     ; 198 	SpiSendByte(ucReg|0x80);
 807  01c9 7b01          	ld	a,(OFST+1,sp)
 808  01cb aa80          	or	a,#128
 809  01cd 8d600160      	callf	f_SpiSendByte
 811                     ; 199 	SpiSendByte(ucData);
 813  01d1 7b02          	ld	a,(OFST+2,sp)
 814  01d3 8d600160      	callf	f_SpiSendByte
 816                     ; 200 	SEL_H();
 818  01d7 4b20          	push	#32
 819  01d9 ae500f        	ldw	x,#20495
 820  01dc 8d000000      	callf	f_GPIO_SetBits
 822  01e0 84            	pop	a
 823                     ; 201 }
 826  01e1 85            	popw	x
 827  01e2 87            	retf
 851                     ; 203 void radio_hal_AssertShutdown(void)
 851                     ; 204 {
 852                     	switch	.text
 853  01e3               f_radio_hal_AssertShutdown:
 857                     ; 205     SDN_H();  /* 拉高SDN引脚 */
 859  01e3 4b80          	push	#128
 860  01e5 ae500f        	ldw	x,#20495
 861  01e8 8d000000      	callf	f_GPIO_SetBits
 863  01ec 84            	pop	a
 864                     ; 206 }
 867  01ed 87            	retf
 891                     ; 207 void radio_hal_DeassertShutdown(void)
 891                     ; 208 {
 892                     	switch	.text
 893  01ee               f_radio_hal_DeassertShutdown:
 897                     ; 209     SDN_L();
 899  01ee 4b80          	push	#128
 900  01f0 ae500f        	ldw	x,#20495
 901  01f3 8d000000      	callf	f_GPIO_ResetBits
 903  01f7 84            	pop	a
 904                     ; 210 }
 907  01f8 87            	retf
 931                     ; 211 void radio_hal_ClearNsel(void)
 931                     ; 212 {
 932                     	switch	.text
 933  01f9               f_radio_hal_ClearNsel:
 937                     ; 213     SEL_L();
 939  01f9 4b20          	push	#32
 940  01fb ae500f        	ldw	x,#20495
 941  01fe 8d000000      	callf	f_GPIO_ResetBits
 943  0202 84            	pop	a
 944                     ; 214 }
 947  0203 87            	retf
 970                     ; 216 void radio_hal_SetNsel(void)
 970                     ; 217 {
 971                     	switch	.text
 972  0204               f_radio_hal_SetNsel:
 976                     ; 218 	SEL_H(); 
 978  0204 4b20          	push	#32
 979  0206 ae500f        	ldw	x,#20495
 980  0209 8d000000      	callf	f_GPIO_SetBits
 982  020d 84            	pop	a
 983                     ; 219 }
 986  020e 87            	retf
1010                     ; 221 u8 radio_hal_NirqLevel(void)
1010                     ; 222 {
1011                     	switch	.text
1012  020f               f_radio_hal_NirqLevel:
1016                     ; 223     return IRQ_READ();	  /* 读IRQ引脚电平 */
1018  020f 4b40          	push	#64
1019  0211 ae500f        	ldw	x,#20495
1020  0214 8d000000      	callf	f_GPIO_ReadInputDataBit
1022  0218 5b01          	addw	sp,#1
1025  021a 87            	retf
1058                     ; 226 void radio_hal_SpiWriteByte(u8 byteToWrite)
1058                     ; 227 {
1059                     	switch	.text
1060  021b               f_radio_hal_SpiWriteByte:
1064                     ; 229     SpiSendByte(byteToWrite);
1066  021b 8d600160      	callf	f_SpiSendByte
1068                     ; 231 }
1071  021f 87            	retf
1095                     ; 233 u8 radio_hal_SpiReadByte(void)
1095                     ; 234 {
1096                     	switch	.text
1097  0220               f_radio_hal_SpiReadByte:
1101                     ; 236     return SpiRCVByte();
1103  0220 8d920192      	callf	f_SpiRCVByte
1107  0224 87            	retf
1150                     ; 240 void radio_hal_SpiWriteData(u8 byteCount, u8* pData)
1150                     ; 241 {
1151                     	switch	.text
1152  0225               f_radio_hal_SpiWriteData:
1154  0225 88            	push	a
1155       00000000      OFST:	set	0
1158  0226 200f          	jra	L714
1159  0228               L514:
1160                     ; 245         SpiSendByte(*pData++);
1162  0228 1e05          	ldw	x,(OFST+5,sp)
1163  022a 1c0001        	addw	x,#1
1164  022d 1f05          	ldw	(OFST+5,sp),x
1165  022f 1d0001        	subw	x,#1
1166  0232 f6            	ld	a,(x)
1167  0233 8d600160      	callf	f_SpiSendByte
1169  0237               L714:
1170                     ; 243     while (byteCount--) 
1172  0237 7b01          	ld	a,(OFST+1,sp)
1173  0239 0a01          	dec	(OFST+1,sp)
1174  023b 4d            	tnz	a
1175  023c 26ea          	jrne	L514
1176                     ; 248 }
1179  023e 84            	pop	a
1180  023f 87            	retf
1223                     ; 250 void radio_hal_SpiReadData(u8 byteCount, u8* pData)
1223                     ; 251 {
1224                     	switch	.text
1225  0240               f_radio_hal_SpiReadData:
1227  0240 88            	push	a
1228       00000000      OFST:	set	0
1231  0241 200f          	jra	L544
1232  0243               L344:
1233                     ; 254       *pData++ = SpiRCVByte();
1235  0243 8d920192      	callf	f_SpiRCVByte
1237  0247 1e05          	ldw	x,(OFST+5,sp)
1238  0249 1c0001        	addw	x,#1
1239  024c 1f05          	ldw	(OFST+5,sp),x
1240  024e 1d0001        	subw	x,#1
1241  0251 f7            	ld	(x),a
1242  0252               L544:
1243                     ; 252     while (byteCount--) 
1245  0252 7b01          	ld	a,(OFST+1,sp)
1246  0254 0a01          	dec	(OFST+1,sp)
1247  0256 4d            	tnz	a
1248  0257 26ea          	jrne	L344
1249                     ; 257 }
1252  0259 84            	pop	a
1253  025a 87            	retf
1265                     	xdef	f_radio_hal_SpiReadData
1266                     	xdef	f_radio_hal_SpiWriteData
1267                     	xdef	f_radio_hal_SpiReadByte
1268                     	xdef	f_radio_hal_SpiWriteByte
1269                     	xdef	f_radio_hal_NirqLevel
1270                     	xdef	f_radio_hal_SetNsel
1271                     	xdef	f_radio_hal_ClearNsel
1272                     	xdef	f_radio_hal_DeassertShutdown
1273                     	xdef	f_radio_hal_AssertShutdown
1274                     	xdef	f_SpiWriteRegister
1275                     	xdef	f_SpiReadRegister
1276                     	xdef	f_SpiRCVByte
1277                     	xdef	f_SpiSendByte
1278                     	xdef	f_MCU_PinInit
1279                     	xdef	f_IRQ_STATE
1280                     	xdef	f_dellayxms
1281                     	xdef	f_dellay
1282                     	xdef	f_dellayxm
1283                     	xdef	f_dellayus
1284                     	xref	f_SPI_GetFlagStatus
1285                     	xref	f_SPI_ReceiveData
1286                     	xref	f_SPI_SendData
1287                     	xref	f_SPI_Cmd
1288                     	xref	f_SPI_Init
1289                     	xref	f_SPI_DeInit
1290                     	xref	f_GPIO_ReadInputDataBit
1291                     	xref	f_GPIO_ResetBits
1292                     	xref	f_GPIO_SetBits
1293                     	xref	f_GPIO_Init
1294                     	xref	f_CLK_PeripheralClockConfig
1313                     	xref	d_lcmp
1314                     	xref	d_lgadc
1315                     	xref	d_lrzmp
1316                     	xref	d_lgsbc
1317                     	xref	d_ltor
1318                     	end
