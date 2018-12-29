   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 152                     ; 142 void USART_DeInit(USART_TypeDef* USARTx)
 152                     ; 143 {
 154                     	switch	.text
 155  0000               _USART_DeInit:
 157  0000 89            	pushw	x
 158       00000000      OFST:	set	0
 161                     ; 147   (void) USARTx->SR;
 163  0001 f6            	ld	a,(x)
 164  0002 97            	ld	xl,a
 165                     ; 148   (void) USARTx->DR;
 167  0003 1e01          	ldw	x,(OFST+1,sp)
 168  0005 e601          	ld	a,(1,x)
 169  0007 97            	ld	xl,a
 170                     ; 150   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 172  0008 1e01          	ldw	x,(OFST+1,sp)
 173  000a 6f03          	clr	(3,x)
 174                     ; 151   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 176  000c 1e01          	ldw	x,(OFST+1,sp)
 177  000e 6f02          	clr	(2,x)
 178                     ; 153   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 180  0010 1e01          	ldw	x,(OFST+1,sp)
 181  0012 6f04          	clr	(4,x)
 182                     ; 154   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 184  0014 1e01          	ldw	x,(OFST+1,sp)
 185  0016 6f05          	clr	(5,x)
 186                     ; 155   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 188  0018 1e01          	ldw	x,(OFST+1,sp)
 189  001a 6f06          	clr	(6,x)
 190                     ; 156   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 192  001c 1e01          	ldw	x,(OFST+1,sp)
 193  001e 6f07          	clr	(7,x)
 194                     ; 157 }
 197  0020 85            	popw	x
 198  0021 81            	ret
 390                     ; 186 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 390                     ; 187                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 390                     ; 188                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 390                     ; 189 {
 391                     	switch	.text
 392  0022               _USART_Init:
 394  0022 89            	pushw	x
 395  0023 5204          	subw	sp,#4
 396       00000004      OFST:	set	4
 399                     ; 190   uint32_t BaudRate_Mantissa = 0;
 401  0025 ae0000        	ldw	x,#0
 402  0028 1f03          	ldw	(OFST-1,sp),x
 403  002a ae0000        	ldw	x,#0
 404  002d 1f01          	ldw	(OFST-3,sp),x
 405                     ; 193   assert_param(IS_USART_BAUDRATE(BaudRate));
 407                     ; 195   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 409                     ; 197   assert_param(IS_USART_STOPBITS(USART_StopBits));
 411                     ; 199   assert_param(IS_USART_PARITY(USART_Parity));
 413                     ; 201   assert_param(IS_USART_MODE(USART_Mode));
 415                     ; 204   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 417  002f 1e05          	ldw	x,(OFST+1,sp)
 418  0031 e604          	ld	a,(4,x)
 419  0033 a4e9          	and	a,#233
 420  0035 e704          	ld	(4,x),a
 421                     ; 207   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 423  0037 1e05          	ldw	x,(OFST+1,sp)
 424  0039 7b0d          	ld	a,(OFST+9,sp)
 425  003b 1a0f          	or	a,(OFST+11,sp)
 426  003d ea04          	or	a,(4,x)
 427  003f e704          	ld	(4,x),a
 428                     ; 210   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 430  0041 1e05          	ldw	x,(OFST+1,sp)
 431  0043 e606          	ld	a,(6,x)
 432  0045 a4cf          	and	a,#207
 433  0047 e706          	ld	(6,x),a
 434                     ; 212   USARTx->CR3 |= (uint8_t)USART_StopBits;
 436  0049 1e05          	ldw	x,(OFST+1,sp)
 437  004b e606          	ld	a,(6,x)
 438  004d 1a0e          	or	a,(OFST+10,sp)
 439  004f e706          	ld	(6,x),a
 440                     ; 215   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 442  0051 1e05          	ldw	x,(OFST+1,sp)
 443  0053 6f02          	clr	(2,x)
 444                     ; 217   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 446  0055 1e05          	ldw	x,(OFST+1,sp)
 447  0057 e603          	ld	a,(3,x)
 448  0059 a40f          	and	a,#15
 449  005b e703          	ld	(3,x),a
 450                     ; 219   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 452  005d 1e05          	ldw	x,(OFST+1,sp)
 453  005f e603          	ld	a,(3,x)
 454  0061 a4f0          	and	a,#240
 455  0063 e703          	ld	(3,x),a
 456                     ; 221   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 458  0065 cd0000        	call	_CLK_GetClockFreq
 460  0068 96            	ldw	x,sp
 461  0069 1c0009        	addw	x,#OFST+5
 462  006c cd0000        	call	c_ludv
 464  006f 96            	ldw	x,sp
 465  0070 1c0001        	addw	x,#OFST-3
 466  0073 cd0000        	call	c_rtol
 468                     ; 223   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 470  0076 7b03          	ld	a,(OFST-1,sp)
 471  0078 a4f0          	and	a,#240
 472  007a 1e05          	ldw	x,(OFST+1,sp)
 473  007c e703          	ld	(3,x),a
 474                     ; 225   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 476  007e 1e05          	ldw	x,(OFST+1,sp)
 477  0080 7b04          	ld	a,(OFST+0,sp)
 478  0082 a40f          	and	a,#15
 479  0084 ea03          	or	a,(3,x)
 480  0086 e703          	ld	(3,x),a
 481                     ; 227   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 483  0088 96            	ldw	x,sp
 484  0089 1c0001        	addw	x,#OFST-3
 485  008c cd0000        	call	c_ltor
 487  008f a604          	ld	a,#4
 488  0091 cd0000        	call	c_lursh
 490  0094 b603          	ld	a,c_lreg+3
 491  0096 1e05          	ldw	x,(OFST+1,sp)
 492  0098 e702          	ld	(2,x),a
 493                     ; 230   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 495  009a 1e05          	ldw	x,(OFST+1,sp)
 496  009c e605          	ld	a,(5,x)
 497  009e a4f3          	and	a,#243
 498  00a0 e705          	ld	(5,x),a
 499                     ; 232   USARTx->CR2 |= (uint8_t)USART_Mode;
 501  00a2 1e05          	ldw	x,(OFST+1,sp)
 502  00a4 e605          	ld	a,(5,x)
 503  00a6 1a10          	or	a,(OFST+12,sp)
 504  00a8 e705          	ld	(5,x),a
 505                     ; 233 }
 508  00aa 5b06          	addw	sp,#6
 509  00ac 81            	ret
 669                     ; 258 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 669                     ; 259                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 669                     ; 260                      USART_LastBit_TypeDef USART_LastBit)
 669                     ; 261 {
 670                     	switch	.text
 671  00ad               _USART_ClockInit:
 673  00ad 89            	pushw	x
 674       00000000      OFST:	set	0
 677                     ; 263   assert_param(IS_USART_CLOCK(USART_Clock));
 679                     ; 264   assert_param(IS_USART_CPOL(USART_CPOL));
 681                     ; 265   assert_param(IS_USART_CPHA(USART_CPHA));
 683                     ; 266   assert_param(IS_USART_LASTBIT(USART_LastBit));
 685                     ; 269   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 687  00ae e606          	ld	a,(6,x)
 688  00b0 a4f8          	and	a,#248
 689  00b2 e706          	ld	(6,x),a
 690                     ; 271   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 692  00b4 7b06          	ld	a,(OFST+6,sp)
 693  00b6 1a07          	or	a,(OFST+7,sp)
 694  00b8 1a08          	or	a,(OFST+8,sp)
 695  00ba ea06          	or	a,(6,x)
 696  00bc e706          	ld	(6,x),a
 697                     ; 273   if (USART_Clock != USART_Clock_Disable)
 699  00be 0d05          	tnz	(OFST+5,sp)
 700  00c0 2708          	jreq	L523
 701                     ; 275     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 703  00c2 e606          	ld	a,(6,x)
 704  00c4 aa08          	or	a,#8
 705  00c6 e706          	ld	(6,x),a
 707  00c8 2008          	jra	L723
 708  00ca               L523:
 709                     ; 279     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 711  00ca 1e01          	ldw	x,(OFST+1,sp)
 712  00cc e606          	ld	a,(6,x)
 713  00ce a4f7          	and	a,#247
 714  00d0 e706          	ld	(6,x),a
 715  00d2               L723:
 716                     ; 281 }
 719  00d2 85            	popw	x
 720  00d3 81            	ret
 787                     ; 290 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 787                     ; 291 {
 788                     	switch	.text
 789  00d4               _USART_Cmd:
 791  00d4 89            	pushw	x
 792       00000000      OFST:	set	0
 795                     ; 292   if (NewState != DISABLE)
 797  00d5 0d05          	tnz	(OFST+5,sp)
 798  00d7 2708          	jreq	L563
 799                     ; 294     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 801  00d9 e604          	ld	a,(4,x)
 802  00db a4df          	and	a,#223
 803  00dd e704          	ld	(4,x),a
 805  00df 2008          	jra	L763
 806  00e1               L563:
 807                     ; 298     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 809  00e1 1e01          	ldw	x,(OFST+1,sp)
 810  00e3 e604          	ld	a,(4,x)
 811  00e5 aa20          	or	a,#32
 812  00e7 e704          	ld	(4,x),a
 813  00e9               L763:
 814                     ; 300 }
 817  00e9 85            	popw	x
 818  00ea 81            	ret
 864                     ; 323 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 864                     ; 324 {
 865                     	switch	.text
 866  00eb               _USART_SetPrescaler:
 868  00eb 89            	pushw	x
 869       00000000      OFST:	set	0
 872                     ; 326   USARTx->PSCR = USART_Prescaler;
 874  00ec 7b05          	ld	a,(OFST+5,sp)
 875  00ee 1e01          	ldw	x,(OFST+1,sp)
 876  00f0 e70a          	ld	(10,x),a
 877                     ; 327 }
 880  00f2 85            	popw	x
 881  00f3 81            	ret
 918                     ; 334 void USART_SendBreak(USART_TypeDef* USARTx)
 918                     ; 335 {
 919                     	switch	.text
 920  00f4               _USART_SendBreak:
 924                     ; 336   USARTx->CR2 |= USART_CR2_SBK;
 926  00f4 e605          	ld	a,(5,x)
 927  00f6 aa01          	or	a,#1
 928  00f8 e705          	ld	(5,x),a
 929                     ; 337 }
 932  00fa 81            	ret
 969                     ; 376 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 969                     ; 377 {
 970                     	switch	.text
 971  00fb               _USART_ReceiveData8:
 975                     ; 378   return USARTx->DR;
 977  00fb e601          	ld	a,(1,x)
 980  00fd 81            	ret
1026                     ; 386 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1026                     ; 387 {
1027                     	switch	.text
1028  00fe               _USART_ReceiveData9:
1030  00fe 89            	pushw	x
1031  00ff 89            	pushw	x
1032       00000002      OFST:	set	2
1035                     ; 388   uint16_t temp = 0;
1037  0100 5f            	clrw	x
1038  0101 1f01          	ldw	(OFST-1,sp),x
1039                     ; 390   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1041  0103 1e03          	ldw	x,(OFST+1,sp)
1042  0105 e604          	ld	a,(4,x)
1043  0107 5f            	clrw	x
1044  0108 a480          	and	a,#128
1045  010a 5f            	clrw	x
1046  010b 02            	rlwa	x,a
1047  010c 58            	sllw	x
1048  010d 1f01          	ldw	(OFST-1,sp),x
1049                     ; 391   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1051  010f 1e03          	ldw	x,(OFST+1,sp)
1052  0111 e601          	ld	a,(1,x)
1053  0113 5f            	clrw	x
1054  0114 97            	ld	xl,a
1055  0115 01            	rrwa	x,a
1056  0116 1a02          	or	a,(OFST+0,sp)
1057  0118 01            	rrwa	x,a
1058  0119 1a01          	or	a,(OFST-1,sp)
1059  011b 01            	rrwa	x,a
1060  011c 01            	rrwa	x,a
1061  011d a4ff          	and	a,#255
1062  011f 01            	rrwa	x,a
1063  0120 a401          	and	a,#1
1064  0122 01            	rrwa	x,a
1067  0123 5b04          	addw	sp,#4
1068  0125 81            	ret
1114                     ; 399 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1114                     ; 400 {
1115                     	switch	.text
1116  0126               _USART_SendData8:
1118  0126 89            	pushw	x
1119       00000000      OFST:	set	0
1122                     ; 402   USARTx->DR = Data;
1124  0127 7b05          	ld	a,(OFST+5,sp)
1125  0129 1e01          	ldw	x,(OFST+1,sp)
1126  012b e701          	ld	(1,x),a
1127                     ; 403 }
1130  012d 85            	popw	x
1131  012e 81            	ret
1177                     ; 412 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1177                     ; 413 {
1178                     	switch	.text
1179  012f               _USART_SendData9:
1181  012f 89            	pushw	x
1182       00000000      OFST:	set	0
1185                     ; 414   assert_param(IS_USART_DATA_9BITS(Data));
1187                     ; 417   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1189  0130 e604          	ld	a,(4,x)
1190  0132 a4bf          	and	a,#191
1191  0134 e704          	ld	(4,x),a
1192                     ; 420   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1194  0136 1605          	ldw	y,(OFST+5,sp)
1195  0138 9054          	srlw	y
1196  013a 9054          	srlw	y
1197  013c 909f          	ld	a,yl
1198  013e a440          	and	a,#64
1199  0140 ea04          	or	a,(4,x)
1200  0142 e704          	ld	(4,x),a
1201                     ; 423   USARTx->DR   = (uint8_t)(Data);
1203  0144 7b06          	ld	a,(OFST+6,sp)
1204  0146 1e01          	ldw	x,(OFST+1,sp)
1205  0148 e701          	ld	(1,x),a
1206                     ; 424 }
1209  014a 85            	popw	x
1210  014b 81            	ret
1258                     ; 467 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1258                     ; 468 {
1259                     	switch	.text
1260  014c               _USART_ReceiverWakeUpCmd:
1262  014c 89            	pushw	x
1263       00000000      OFST:	set	0
1266                     ; 469   assert_param(IS_FUNCTIONAL_STATE(NewState));
1268                     ; 471   if (NewState != DISABLE)
1270  014d 0d05          	tnz	(OFST+5,sp)
1271  014f 2708          	jreq	L575
1272                     ; 474     USARTx->CR2 |= USART_CR2_RWU;
1274  0151 e605          	ld	a,(5,x)
1275  0153 aa02          	or	a,#2
1276  0155 e705          	ld	(5,x),a
1278  0157 2008          	jra	L775
1279  0159               L575:
1280                     ; 479     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1282  0159 1e01          	ldw	x,(OFST+1,sp)
1283  015b e605          	ld	a,(5,x)
1284  015d a4fd          	and	a,#253
1285  015f e705          	ld	(5,x),a
1286  0161               L775:
1287                     ; 481 }
1290  0161 85            	popw	x
1291  0162 81            	ret
1337                     ; 490 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1337                     ; 491 {
1338                     	switch	.text
1339  0163               _USART_SetAddress:
1341  0163 89            	pushw	x
1342       00000000      OFST:	set	0
1345                     ; 493   assert_param(IS_USART_ADDRESS(USART_Address));
1347                     ; 496   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1349  0164 e607          	ld	a,(7,x)
1350  0166 a4f0          	and	a,#240
1351  0168 e707          	ld	(7,x),a
1352                     ; 498   USARTx->CR4 |= USART_Address;
1354  016a e607          	ld	a,(7,x)
1355  016c 1a05          	or	a,(OFST+5,sp)
1356  016e e707          	ld	(7,x),a
1357                     ; 499 }
1360  0170 85            	popw	x
1361  0171 81            	ret
1430                     ; 509 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1430                     ; 510 {
1431                     	switch	.text
1432  0172               _USART_WakeUpConfig:
1434  0172 89            	pushw	x
1435       00000000      OFST:	set	0
1438                     ; 511   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1440                     ; 513   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1442  0173 e604          	ld	a,(4,x)
1443  0175 a4f7          	and	a,#247
1444  0177 e704          	ld	(4,x),a
1445                     ; 514   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1447  0179 e604          	ld	a,(4,x)
1448  017b 1a05          	or	a,(OFST+5,sp)
1449  017d e704          	ld	(4,x),a
1450                     ; 515 }
1453  017f 85            	popw	x
1454  0180 81            	ret
1502                     ; 560 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1502                     ; 561 {
1503                     	switch	.text
1504  0181               _USART_HalfDuplexCmd:
1506  0181 89            	pushw	x
1507       00000000      OFST:	set	0
1510                     ; 562   assert_param(IS_FUNCTIONAL_STATE(NewState));
1512                     ; 564   if (NewState != DISABLE)
1514  0182 0d05          	tnz	(OFST+5,sp)
1515  0184 2708          	jreq	L507
1516                     ; 566     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1518  0186 e608          	ld	a,(8,x)
1519  0188 aa08          	or	a,#8
1520  018a e708          	ld	(8,x),a
1522  018c 2008          	jra	L707
1523  018e               L507:
1524                     ; 570     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1526  018e 1e01          	ldw	x,(OFST+1,sp)
1527  0190 e608          	ld	a,(8,x)
1528  0192 a4f7          	and	a,#247
1529  0194 e708          	ld	(8,x),a
1530  0196               L707:
1531                     ; 572 }
1534  0196 85            	popw	x
1535  0197 81            	ret
1582                     ; 638 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1582                     ; 639 {
1583                     	switch	.text
1584  0198               _USART_SmartCardCmd:
1586  0198 89            	pushw	x
1587       00000000      OFST:	set	0
1590                     ; 640   assert_param(IS_FUNCTIONAL_STATE(NewState));
1592                     ; 642   if (NewState != DISABLE)
1594  0199 0d05          	tnz	(OFST+5,sp)
1595  019b 2708          	jreq	L537
1596                     ; 645     USARTx->CR5 |= USART_CR5_SCEN;
1598  019d e608          	ld	a,(8,x)
1599  019f aa20          	or	a,#32
1600  01a1 e708          	ld	(8,x),a
1602  01a3 2008          	jra	L737
1603  01a5               L537:
1604                     ; 650     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1606  01a5 1e01          	ldw	x,(OFST+1,sp)
1607  01a7 e608          	ld	a,(8,x)
1608  01a9 a4df          	and	a,#223
1609  01ab e708          	ld	(8,x),a
1610  01ad               L737:
1611                     ; 652 }
1614  01ad 85            	popw	x
1615  01ae 81            	ret
1663                     ; 661 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1663                     ; 662 {
1664                     	switch	.text
1665  01af               _USART_SmartCardNACKCmd:
1667  01af 89            	pushw	x
1668       00000000      OFST:	set	0
1671                     ; 663   assert_param(IS_FUNCTIONAL_STATE(NewState));
1673                     ; 665   if (NewState != DISABLE)
1675  01b0 0d05          	tnz	(OFST+5,sp)
1676  01b2 2708          	jreq	L567
1677                     ; 668     USARTx->CR5 |= USART_CR5_NACK;
1679  01b4 e608          	ld	a,(8,x)
1680  01b6 aa10          	or	a,#16
1681  01b8 e708          	ld	(8,x),a
1683  01ba 2008          	jra	L767
1684  01bc               L567:
1685                     ; 673     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1687  01bc 1e01          	ldw	x,(OFST+1,sp)
1688  01be e608          	ld	a,(8,x)
1689  01c0 a4ef          	and	a,#239
1690  01c2 e708          	ld	(8,x),a
1691  01c4               L767:
1692                     ; 675 }
1695  01c4 85            	popw	x
1696  01c5 81            	ret
1742                     ; 684 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1742                     ; 685 {
1743                     	switch	.text
1744  01c6               _USART_SetGuardTime:
1746  01c6 89            	pushw	x
1747       00000000      OFST:	set	0
1750                     ; 687   USARTx->GTR = USART_GuardTime;
1752  01c7 7b05          	ld	a,(OFST+5,sp)
1753  01c9 1e01          	ldw	x,(OFST+1,sp)
1754  01cb e709          	ld	(9,x),a
1755                     ; 688 }
1758  01cd 85            	popw	x
1759  01ce 81            	ret
1828                     ; 745 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1828                     ; 746 {
1829                     	switch	.text
1830  01cf               _USART_IrDAConfig:
1832  01cf 89            	pushw	x
1833       00000000      OFST:	set	0
1836                     ; 747   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1838                     ; 749   if (USART_IrDAMode != USART_IrDAMode_Normal)
1840  01d0 0d05          	tnz	(OFST+5,sp)
1841  01d2 2708          	jreq	L1501
1842                     ; 751     USARTx->CR5 |= USART_CR5_IRLP;
1844  01d4 e608          	ld	a,(8,x)
1845  01d6 aa04          	or	a,#4
1846  01d8 e708          	ld	(8,x),a
1848  01da 2008          	jra	L3501
1849  01dc               L1501:
1850                     ; 755     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1852  01dc 1e01          	ldw	x,(OFST+1,sp)
1853  01de e608          	ld	a,(8,x)
1854  01e0 a4fb          	and	a,#251
1855  01e2 e708          	ld	(8,x),a
1856  01e4               L3501:
1857                     ; 757 }
1860  01e4 85            	popw	x
1861  01e5 81            	ret
1908                     ; 766 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1908                     ; 767 {
1909                     	switch	.text
1910  01e6               _USART_IrDACmd:
1912  01e6 89            	pushw	x
1913       00000000      OFST:	set	0
1916                     ; 770   assert_param(IS_FUNCTIONAL_STATE(NewState));
1918                     ; 772   if (NewState != DISABLE)
1920  01e7 0d05          	tnz	(OFST+5,sp)
1921  01e9 2708          	jreq	L1011
1922                     ; 775     USARTx->CR5 |= USART_CR5_IREN;
1924  01eb e608          	ld	a,(8,x)
1925  01ed aa02          	or	a,#2
1926  01ef e708          	ld	(8,x),a
1928  01f1 2008          	jra	L3011
1929  01f3               L1011:
1930                     ; 780     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1932  01f3 1e01          	ldw	x,(OFST+1,sp)
1933  01f5 e608          	ld	a,(8,x)
1934  01f7 a4fd          	and	a,#253
1935  01f9 e708          	ld	(8,x),a
1936  01fb               L3011:
1937                     ; 782 }
1940  01fb 85            	popw	x
1941  01fc 81            	ret
2018                     ; 812 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
2018                     ; 813                   FunctionalState NewState)
2018                     ; 814 {
2019                     	switch	.text
2020  01fd               _USART_DMACmd:
2022  01fd 89            	pushw	x
2023       00000000      OFST:	set	0
2026                     ; 816   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2028                     ; 817   assert_param(IS_FUNCTIONAL_STATE(NewState));
2030                     ; 819   if (NewState != DISABLE)
2032  01fe 0d06          	tnz	(OFST+6,sp)
2033  0200 2708          	jreq	L5411
2034                     ; 823     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2036  0202 e608          	ld	a,(8,x)
2037  0204 1a05          	or	a,(OFST+5,sp)
2038  0206 e708          	ld	(8,x),a
2040  0208 2009          	jra	L7411
2041  020a               L5411:
2042                     ; 829     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2044  020a 1e01          	ldw	x,(OFST+1,sp)
2045  020c 7b05          	ld	a,(OFST+5,sp)
2046  020e 43            	cpl	a
2047  020f e408          	and	a,(8,x)
2048  0211 e708          	ld	(8,x),a
2049  0213               L7411:
2050                     ; 831 }
2053  0213 85            	popw	x
2054  0214 81            	ret
2198                     ; 933 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2198                     ; 934 {
2199                     	switch	.text
2200  0215               _USART_ITConfig:
2202  0215 89            	pushw	x
2203  0216 89            	pushw	x
2204       00000002      OFST:	set	2
2207                     ; 935   uint8_t usartreg, itpos = 0x00;
2209  0217 7b02          	ld	a,(OFST+0,sp)
2210  0219 97            	ld	xl,a
2211                     ; 936   assert_param(IS_USART_CONFIG_IT(USART_IT));
2213                     ; 937   assert_param(IS_FUNCTIONAL_STATE(NewState));
2215                     ; 940   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2217  021a 7b07          	ld	a,(OFST+5,sp)
2218  021c 6b01          	ld	(OFST-1,sp),a
2219                     ; 942   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2221  021e 7b08          	ld	a,(OFST+6,sp)
2222  0220 a40f          	and	a,#15
2223  0222 5f            	clrw	x
2224  0223 97            	ld	xl,a
2225  0224 a601          	ld	a,#1
2226  0226 5d            	tnzw	x
2227  0227 2704          	jreq	L65
2228  0229               L06:
2229  0229 48            	sll	a
2230  022a 5a            	decw	x
2231  022b 26fc          	jrne	L06
2232  022d               L65:
2233  022d 6b02          	ld	(OFST+0,sp),a
2234                     ; 944   if (NewState != DISABLE)
2236  022f 0d09          	tnz	(OFST+7,sp)
2237  0231 272a          	jreq	L7321
2238                     ; 947     if (usartreg == 0x01)
2240  0233 7b01          	ld	a,(OFST-1,sp)
2241  0235 a101          	cp	a,#1
2242  0237 260a          	jrne	L1421
2243                     ; 949       USARTx->CR1 |= itpos;
2245  0239 1e03          	ldw	x,(OFST+1,sp)
2246  023b e604          	ld	a,(4,x)
2247  023d 1a02          	or	a,(OFST+0,sp)
2248  023f e704          	ld	(4,x),a
2250  0241 2045          	jra	L1521
2251  0243               L1421:
2252                     ; 951     else if (usartreg == 0x05)
2254  0243 7b01          	ld	a,(OFST-1,sp)
2255  0245 a105          	cp	a,#5
2256  0247 260a          	jrne	L5421
2257                     ; 953       USARTx->CR5 |= itpos;
2259  0249 1e03          	ldw	x,(OFST+1,sp)
2260  024b e608          	ld	a,(8,x)
2261  024d 1a02          	or	a,(OFST+0,sp)
2262  024f e708          	ld	(8,x),a
2264  0251 2035          	jra	L1521
2265  0253               L5421:
2266                     ; 958       USARTx->CR2 |= itpos;
2268  0253 1e03          	ldw	x,(OFST+1,sp)
2269  0255 e605          	ld	a,(5,x)
2270  0257 1a02          	or	a,(OFST+0,sp)
2271  0259 e705          	ld	(5,x),a
2272  025b 202b          	jra	L1521
2273  025d               L7321:
2274                     ; 964     if (usartreg == 0x01)
2276  025d 7b01          	ld	a,(OFST-1,sp)
2277  025f a101          	cp	a,#1
2278  0261 260b          	jrne	L3521
2279                     ; 966       USARTx->CR1 &= (uint8_t)(~itpos);
2281  0263 1e03          	ldw	x,(OFST+1,sp)
2282  0265 7b02          	ld	a,(OFST+0,sp)
2283  0267 43            	cpl	a
2284  0268 e404          	and	a,(4,x)
2285  026a e704          	ld	(4,x),a
2287  026c 201a          	jra	L1521
2288  026e               L3521:
2289                     ; 968     else if (usartreg == 0x05)
2291  026e 7b01          	ld	a,(OFST-1,sp)
2292  0270 a105          	cp	a,#5
2293  0272 260b          	jrne	L7521
2294                     ; 970       USARTx->CR5 &= (uint8_t)(~itpos);
2296  0274 1e03          	ldw	x,(OFST+1,sp)
2297  0276 7b02          	ld	a,(OFST+0,sp)
2298  0278 43            	cpl	a
2299  0279 e408          	and	a,(8,x)
2300  027b e708          	ld	(8,x),a
2302  027d 2009          	jra	L1521
2303  027f               L7521:
2304                     ; 975       USARTx->CR2 &= (uint8_t)(~itpos);
2306  027f 1e03          	ldw	x,(OFST+1,sp)
2307  0281 7b02          	ld	a,(OFST+0,sp)
2308  0283 43            	cpl	a
2309  0284 e405          	and	a,(5,x)
2310  0286 e705          	ld	(5,x),a
2311  0288               L1521:
2312                     ; 978 }
2315  0288 5b04          	addw	sp,#4
2316  028a 81            	ret
2464                     ; 996 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2464                     ; 997 {
2465                     	switch	.text
2466  028b               _USART_GetFlagStatus:
2468  028b 89            	pushw	x
2469  028c 88            	push	a
2470       00000001      OFST:	set	1
2473                     ; 998   FlagStatus status = RESET;
2475  028d 0f01          	clr	(OFST+0,sp)
2476                     ; 1001   assert_param(IS_USART_FLAG(USART_FLAG));
2478                     ; 1003   if (USART_FLAG == USART_FLAG_SBK)
2480  028f 1e06          	ldw	x,(OFST+5,sp)
2481  0291 a30101        	cpw	x,#257
2482  0294 2612          	jrne	L1531
2483                     ; 1005     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2485  0296 1e02          	ldw	x,(OFST+1,sp)
2486  0298 e605          	ld	a,(5,x)
2487  029a 1507          	bcp	a,(OFST+6,sp)
2488  029c 2706          	jreq	L3531
2489                     ; 1008       status = SET;
2491  029e a601          	ld	a,#1
2492  02a0 6b01          	ld	(OFST+0,sp),a
2494  02a2 2013          	jra	L7531
2495  02a4               L3531:
2496                     ; 1013       status = RESET;
2498  02a4 0f01          	clr	(OFST+0,sp)
2499  02a6 200f          	jra	L7531
2500  02a8               L1531:
2501                     ; 1018     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2503  02a8 1e02          	ldw	x,(OFST+1,sp)
2504  02aa f6            	ld	a,(x)
2505  02ab 1507          	bcp	a,(OFST+6,sp)
2506  02ad 2706          	jreq	L1631
2507                     ; 1021       status = SET;
2509  02af a601          	ld	a,#1
2510  02b1 6b01          	ld	(OFST+0,sp),a
2512  02b3 2002          	jra	L7531
2513  02b5               L1631:
2514                     ; 1026       status = RESET;
2516  02b5 0f01          	clr	(OFST+0,sp)
2517  02b7               L7531:
2518                     ; 1030   return status;
2520  02b7 7b01          	ld	a,(OFST+0,sp)
2523  02b9 5b03          	addw	sp,#3
2524  02bb 81            	ret
2571                     ; 1054 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2571                     ; 1055 {
2572                     	switch	.text
2573  02bc               _USART_ClearFlag:
2575  02bc 89            	pushw	x
2576       00000000      OFST:	set	0
2579                     ; 1057   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2581                     ; 1059   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2583  02bd 7b06          	ld	a,(OFST+6,sp)
2584  02bf 43            	cpl	a
2585  02c0 1e01          	ldw	x,(OFST+1,sp)
2586  02c2 f7            	ld	(x),a
2587                     ; 1060 }
2590  02c3 85            	popw	x
2591  02c4 81            	ret
2694                     ; 1077 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2694                     ; 1078 {
2695                     	switch	.text
2696  02c5               _USART_GetITStatus:
2698  02c5 89            	pushw	x
2699  02c6 5203          	subw	sp,#3
2700       00000003      OFST:	set	3
2703                     ; 1079   ITStatus pendingbitstatus = RESET;
2705  02c8 7b03          	ld	a,(OFST+0,sp)
2706  02ca 97            	ld	xl,a
2707                     ; 1080   uint8_t temp = 0;
2709  02cb 7b01          	ld	a,(OFST-2,sp)
2710  02cd 97            	ld	xl,a
2711                     ; 1081   uint8_t itpos = 0;
2713  02ce 7b02          	ld	a,(OFST-1,sp)
2714  02d0 97            	ld	xl,a
2715                     ; 1082   uint8_t itmask1 = 0;
2717  02d1 7b03          	ld	a,(OFST+0,sp)
2718  02d3 97            	ld	xl,a
2719                     ; 1083   uint8_t itmask2 = 0;
2721  02d4 7b03          	ld	a,(OFST+0,sp)
2722  02d6 97            	ld	xl,a
2723                     ; 1084   uint8_t enablestatus = 0;
2725  02d7 7b03          	ld	a,(OFST+0,sp)
2726  02d9 97            	ld	xl,a
2727                     ; 1087   assert_param(IS_USART_GET_IT(USART_IT));
2729                     ; 1090   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2731  02da 7b09          	ld	a,(OFST+6,sp)
2732  02dc a40f          	and	a,#15
2733  02de 5f            	clrw	x
2734  02df 97            	ld	xl,a
2735  02e0 a601          	ld	a,#1
2736  02e2 5d            	tnzw	x
2737  02e3 2704          	jreq	L07
2738  02e5               L27:
2739  02e5 48            	sll	a
2740  02e6 5a            	decw	x
2741  02e7 26fc          	jrne	L27
2742  02e9               L07:
2743  02e9 6b02          	ld	(OFST-1,sp),a
2744                     ; 1092   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2746  02eb 7b09          	ld	a,(OFST+6,sp)
2747  02ed 4e            	swap	a
2748  02ee a40f          	and	a,#15
2749  02f0 6b03          	ld	(OFST+0,sp),a
2750                     ; 1094   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2752  02f2 7b03          	ld	a,(OFST+0,sp)
2753  02f4 5f            	clrw	x
2754  02f5 97            	ld	xl,a
2755  02f6 a601          	ld	a,#1
2756  02f8 5d            	tnzw	x
2757  02f9 2704          	jreq	L47
2758  02fb               L67:
2759  02fb 48            	sll	a
2760  02fc 5a            	decw	x
2761  02fd 26fc          	jrne	L67
2762  02ff               L47:
2763  02ff 6b03          	ld	(OFST+0,sp),a
2764                     ; 1097   if (USART_IT == USART_IT_PE)
2766  0301 1e08          	ldw	x,(OFST+5,sp)
2767  0303 a30100        	cpw	x,#256
2768  0306 261d          	jrne	L5641
2769                     ; 1100     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2771  0308 1e04          	ldw	x,(OFST+1,sp)
2772  030a e604          	ld	a,(4,x)
2773  030c 1403          	and	a,(OFST+0,sp)
2774  030e 6b03          	ld	(OFST+0,sp),a
2775                     ; 1103     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2777  0310 1e04          	ldw	x,(OFST+1,sp)
2778  0312 f6            	ld	a,(x)
2779  0313 1502          	bcp	a,(OFST-1,sp)
2780  0315 270a          	jreq	L7641
2782  0317 0d03          	tnz	(OFST+0,sp)
2783  0319 2706          	jreq	L7641
2784                     ; 1106       pendingbitstatus = SET;
2786  031b a601          	ld	a,#1
2787  031d 6b03          	ld	(OFST+0,sp),a
2789  031f 204f          	jra	L3741
2790  0321               L7641:
2791                     ; 1111       pendingbitstatus = RESET;
2793  0321 0f03          	clr	(OFST+0,sp)
2794  0323 204b          	jra	L3741
2795  0325               L5641:
2796                     ; 1115   else if (USART_IT == USART_IT_OR)
2798  0325 1e08          	ldw	x,(OFST+5,sp)
2799  0327 a30235        	cpw	x,#565
2800  032a 2629          	jrne	L5741
2801                     ; 1118     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2803  032c 1e04          	ldw	x,(OFST+1,sp)
2804  032e e605          	ld	a,(5,x)
2805  0330 1403          	and	a,(OFST+0,sp)
2806  0332 6b03          	ld	(OFST+0,sp),a
2807                     ; 1121     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2809  0334 1e04          	ldw	x,(OFST+1,sp)
2810  0336 e608          	ld	a,(8,x)
2811  0338 a401          	and	a,#1
2812  033a 6b01          	ld	(OFST-2,sp),a
2813                     ; 1123     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2815  033c 1e04          	ldw	x,(OFST+1,sp)
2816  033e f6            	ld	a,(x)
2817  033f 1502          	bcp	a,(OFST-1,sp)
2818  0341 270e          	jreq	L7741
2820  0343 0d03          	tnz	(OFST+0,sp)
2821  0345 2604          	jrne	L1051
2823  0347 0d01          	tnz	(OFST-2,sp)
2824  0349 2706          	jreq	L7741
2825  034b               L1051:
2826                     ; 1126       pendingbitstatus = SET;
2828  034b a601          	ld	a,#1
2829  034d 6b03          	ld	(OFST+0,sp),a
2831  034f 201f          	jra	L3741
2832  0351               L7741:
2833                     ; 1131       pendingbitstatus = RESET;
2835  0351 0f03          	clr	(OFST+0,sp)
2836  0353 201b          	jra	L3741
2837  0355               L5741:
2838                     ; 1138     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2840  0355 1e04          	ldw	x,(OFST+1,sp)
2841  0357 e605          	ld	a,(5,x)
2842  0359 1403          	and	a,(OFST+0,sp)
2843  035b 6b03          	ld	(OFST+0,sp),a
2844                     ; 1140     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2846  035d 1e04          	ldw	x,(OFST+1,sp)
2847  035f f6            	ld	a,(x)
2848  0360 1502          	bcp	a,(OFST-1,sp)
2849  0362 270a          	jreq	L7051
2851  0364 0d03          	tnz	(OFST+0,sp)
2852  0366 2706          	jreq	L7051
2853                     ; 1143       pendingbitstatus = SET;
2855  0368 a601          	ld	a,#1
2856  036a 6b03          	ld	(OFST+0,sp),a
2858  036c 2002          	jra	L3741
2859  036e               L7051:
2860                     ; 1148       pendingbitstatus = RESET;
2862  036e 0f03          	clr	(OFST+0,sp)
2863  0370               L3741:
2864                     ; 1153   return  pendingbitstatus;
2866  0370 7b03          	ld	a,(OFST+0,sp)
2869  0372 5b05          	addw	sp,#5
2870  0374 81            	ret
2936                     ; 1178 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2936                     ; 1179 {
2937                     	switch	.text
2938  0375               _USART_ClearITPendingBit:
2940  0375 89            	pushw	x
2941  0376 88            	push	a
2942       00000001      OFST:	set	1
2945                     ; 1180   uint8_t bitpos = 0x00, itmask = 0x00;
2947  0377 7b01          	ld	a,(OFST+0,sp)
2948  0379 97            	ld	xl,a
2951  037a 7b01          	ld	a,(OFST+0,sp)
2952  037c 97            	ld	xl,a
2953                     ; 1181   assert_param(IS_USART_CLEAR_IT(USART_IT));
2955                     ; 1182   bitpos = (uint8_t)( (uint8_t)((uint8_t)USART_IT & (uint8_t)0xF0) >> 0x04);
2957  037d 7b07          	ld	a,(OFST+6,sp)
2958  037f a4f0          	and	a,#240
2959  0381 4e            	swap	a
2960  0382 a40f          	and	a,#15
2961  0384 6b01          	ld	(OFST+0,sp),a
2962                     ; 1183   itmask = (uint8_t)( (uint8_t)0x01 << bitpos);
2964  0386 7b01          	ld	a,(OFST+0,sp)
2965  0388 5f            	clrw	x
2966  0389 97            	ld	xl,a
2967  038a a601          	ld	a,#1
2968  038c 5d            	tnzw	x
2969  038d 2704          	jreq	L201
2970  038f               L401:
2971  038f 48            	sll	a
2972  0390 5a            	decw	x
2973  0391 26fc          	jrne	L401
2974  0393               L201:
2975  0393 6b01          	ld	(OFST+0,sp),a
2976                     ; 1185   USARTx->SR = (uint8_t)~itmask;
2978  0395 7b01          	ld	a,(OFST+0,sp)
2979  0397 43            	cpl	a
2980  0398 1e02          	ldw	x,(OFST+1,sp)
2981  039a f7            	ld	(x),a
2982                     ; 1186 }
2985  039b 5b03          	addw	sp,#3
2986  039d 81            	ret
2999                     	xdef	_USART_ClearITPendingBit
3000                     	xdef	_USART_GetITStatus
3001                     	xdef	_USART_ClearFlag
3002                     	xdef	_USART_GetFlagStatus
3003                     	xdef	_USART_ITConfig
3004                     	xdef	_USART_DMACmd
3005                     	xdef	_USART_IrDACmd
3006                     	xdef	_USART_IrDAConfig
3007                     	xdef	_USART_SetGuardTime
3008                     	xdef	_USART_SmartCardNACKCmd
3009                     	xdef	_USART_SmartCardCmd
3010                     	xdef	_USART_HalfDuplexCmd
3011                     	xdef	_USART_SetAddress
3012                     	xdef	_USART_ReceiverWakeUpCmd
3013                     	xdef	_USART_WakeUpConfig
3014                     	xdef	_USART_ReceiveData9
3015                     	xdef	_USART_ReceiveData8
3016                     	xdef	_USART_SendData9
3017                     	xdef	_USART_SendData8
3018                     	xdef	_USART_SendBreak
3019                     	xdef	_USART_SetPrescaler
3020                     	xdef	_USART_Cmd
3021                     	xdef	_USART_ClockInit
3022                     	xdef	_USART_Init
3023                     	xdef	_USART_DeInit
3024                     	xref	_CLK_GetClockFreq
3025                     	xref.b	c_lreg
3044                     	xref	c_lursh
3045                     	xref	c_ltor
3046                     	xref	c_rtol
3047                     	xref	c_ludv
3048                     	end
