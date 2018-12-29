   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 125                     ; 122 void SPI_DeInit(SPI_TypeDef* SPIx)
 125                     ; 123 {
 126                     	switch	.text
 127  0000               f_SPI_DeInit:
 131                     ; 124   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 133  0000 7f            	clr	(x)
 134                     ; 125   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 136  0001 6f01          	clr	(1,x)
 137                     ; 126   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 139  0003 6f02          	clr	(2,x)
 140                     ; 127   SPIx->SR     = SPI_SR_RESET_VALUE;
 142  0005 a602          	ld	a,#2
 143  0007 e703          	ld	(3,x),a
 144                     ; 128   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 146  0009 a607          	ld	a,#7
 147  000b e705          	ld	(5,x),a
 148                     ; 129 }
 151  000d 87            	retf
 474                     ; 171 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 474                     ; 172               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 474                     ; 173               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 474                     ; 174               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 474                     ; 175               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 474                     ; 176 {
 475                     	switch	.text
 476  000e               f_SPI_Init:
 478  000e 89            	pushw	x
 479  000f 88            	push	a
 480       00000001      OFST:	set	1
 483                     ; 178   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 485                     ; 179   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 487                     ; 180   assert_param(IS_SPI_MODE(SPI_Mode));
 489                     ; 181   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 491                     ; 182   assert_param(IS_SPI_PHASE(SPI_CPHA));
 493                     ; 183   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 495                     ; 184   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 497                     ; 185   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 499                     ; 188   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 499                     ; 189                                   (uint8_t)SPI_BaudRatePrescaler) |
 499                     ; 190                         (uint8_t)((uint8_t)SPI_CPOL |
 499                     ; 191                                   SPI_CPHA));
 501  0010 7b0a          	ld	a,(OFST+9,sp)
 502  0012 1a0b          	or	a,(OFST+10,sp)
 503  0014 6b01          	ld	(OFST+0,sp),a
 504  0016 7b07          	ld	a,(OFST+6,sp)
 505  0018 1a08          	or	a,(OFST+7,sp)
 506  001a 1a01          	or	a,(OFST+0,sp)
 507  001c 1e02          	ldw	x,(OFST+1,sp)
 508  001e f7            	ld	(x),a
 509                     ; 194   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 511  001f 7b0c          	ld	a,(OFST+11,sp)
 512  0021 1a0d          	or	a,(OFST+12,sp)
 513  0023 1e02          	ldw	x,(OFST+1,sp)
 514  0025 e701          	ld	(1,x),a
 515                     ; 196   if (SPI_Mode == SPI_Mode_Master)
 517  0027 7b09          	ld	a,(OFST+8,sp)
 518  0029 a104          	cp	a,#4
 519  002b 260a          	jrne	L362
 520                     ; 198     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 522  002d 1e02          	ldw	x,(OFST+1,sp)
 523  002f e601          	ld	a,(1,x)
 524  0031 aa01          	or	a,#1
 525  0033 e701          	ld	(1,x),a
 527  0035 2008          	jra	L562
 528  0037               L362:
 529                     ; 202     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 531  0037 1e02          	ldw	x,(OFST+1,sp)
 532  0039 e601          	ld	a,(1,x)
 533  003b a4fe          	and	a,#254
 534  003d e701          	ld	(1,x),a
 535  003f               L562:
 536                     ; 206   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 538  003f 1e02          	ldw	x,(OFST+1,sp)
 539  0041 f6            	ld	a,(x)
 540  0042 1a09          	or	a,(OFST+8,sp)
 541  0044 f7            	ld	(x),a
 542                     ; 209   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 544  0045 7b0e          	ld	a,(OFST+13,sp)
 545  0047 1e02          	ldw	x,(OFST+1,sp)
 546  0049 e705          	ld	(5,x),a
 547                     ; 210 }
 550  004b 5b03          	addw	sp,#3
 551  004d 87            	retf
 617                     ; 219 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 617                     ; 220 {
 618                     	switch	.text
 619  004e               f_SPI_Cmd:
 621  004e 89            	pushw	x
 622       00000000      OFST:	set	0
 625                     ; 222   assert_param(IS_FUNCTIONAL_STATE(NewState));
 627                     ; 224   if (NewState != DISABLE)
 629  004f 0d06          	tnz	(OFST+6,sp)
 630  0051 2706          	jreq	L323
 631                     ; 226     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 633  0053 f6            	ld	a,(x)
 634  0054 aa40          	or	a,#64
 635  0056 f7            	ld	(x),a
 637  0057 2006          	jra	L523
 638  0059               L323:
 639                     ; 230     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 641  0059 1e01          	ldw	x,(OFST+1,sp)
 642  005b f6            	ld	a,(x)
 643  005c a4bf          	and	a,#191
 644  005e f7            	ld	(x),a
 645  005f               L523:
 646                     ; 232 }
 649  005f 85            	popw	x
 650  0060 87            	retf
 697                     ; 241 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 697                     ; 242 {
 698                     	switch	.text
 699  0061               f_SPI_NSSInternalSoftwareCmd:
 701  0061 89            	pushw	x
 702       00000000      OFST:	set	0
 705                     ; 244   assert_param(IS_FUNCTIONAL_STATE(NewState));
 707                     ; 246   if (NewState != DISABLE)
 709  0062 0d06          	tnz	(OFST+6,sp)
 710  0064 2708          	jreq	L353
 711                     ; 248     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 713  0066 e601          	ld	a,(1,x)
 714  0068 aa01          	or	a,#1
 715  006a e701          	ld	(1,x),a
 717  006c 2008          	jra	L553
 718  006e               L353:
 719                     ; 252     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 721  006e 1e01          	ldw	x,(OFST+1,sp)
 722  0070 e601          	ld	a,(1,x)
 723  0072 a4fe          	and	a,#254
 724  0074 e701          	ld	(1,x),a
 725  0076               L553:
 726                     ; 254 }
 729  0076 85            	popw	x
 730  0077 87            	retf
 797                     ; 265 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 797                     ; 266 {
 798                     	switch	.text
 799  0078               f_SPI_BiDirectionalLineConfig:
 801  0078 89            	pushw	x
 802       00000000      OFST:	set	0
 805                     ; 268   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 807                     ; 270   if (SPI_Direction != SPI_Direction_Rx)
 809  0079 0d06          	tnz	(OFST+6,sp)
 810  007b 2708          	jreq	L314
 811                     ; 272     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 813  007d e601          	ld	a,(1,x)
 814  007f aa40          	or	a,#64
 815  0081 e701          	ld	(1,x),a
 817  0083 2008          	jra	L514
 818  0085               L314:
 819                     ; 276     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 821  0085 1e01          	ldw	x,(OFST+1,sp)
 822  0087 e601          	ld	a,(1,x)
 823  0089 a4bf          	and	a,#191
 824  008b e701          	ld	(1,x),a
 825  008d               L514:
 826                     ; 278 }
 829  008d 85            	popw	x
 830  008e 87            	retf
 873                     ; 313 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 873                     ; 314 {
 874                     	switch	.text
 875  008f               f_SPI_SendData:
 877  008f 89            	pushw	x
 878       00000000      OFST:	set	0
 881                     ; 315   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 883  0090 7b06          	ld	a,(OFST+6,sp)
 884  0092 1e01          	ldw	x,(OFST+1,sp)
 885  0094 e704          	ld	(4,x),a
 886                     ; 316 }
 889  0096 85            	popw	x
 890  0097 87            	retf
 926                     ; 323 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 926                     ; 324 {
 927                     	switch	.text
 928  0098               f_SPI_ReceiveData:
 932                     ; 325   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 934  0098 e604          	ld	a,(4,x)
 937  009a 87            	retf
 973                     ; 408 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 973                     ; 409 {
 974                     	switch	.text
 975  009b               f_SPI_TransmitCRC:
 979                     ; 410   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 981  009b e601          	ld	a,(1,x)
 982  009d aa10          	or	a,#16
 983  009f e701          	ld	(1,x),a
 984                     ; 411 }
 987  00a1 87            	retf
1035                     ; 420 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1035                     ; 421 {
1036                     	switch	.text
1037  00a2               f_SPI_CalculateCRCCmd:
1039  00a2 89            	pushw	x
1040       00000000      OFST:	set	0
1043                     ; 423   assert_param(IS_FUNCTIONAL_STATE(NewState));
1045                     ; 426   SPI_Cmd(SPI1, DISABLE);
1047  00a3 4b00          	push	#0
1048  00a5 ae5200        	ldw	x,#20992
1049  00a8 8d4e004e      	callf	f_SPI_Cmd
1051  00ac 84            	pop	a
1052                     ; 428   if (NewState != DISABLE)
1054  00ad 0d06          	tnz	(OFST+6,sp)
1055  00af 270a          	jreq	L525
1056                     ; 430     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1058  00b1 1e01          	ldw	x,(OFST+1,sp)
1059  00b3 e601          	ld	a,(1,x)
1060  00b5 aa20          	or	a,#32
1061  00b7 e701          	ld	(1,x),a
1063  00b9 2008          	jra	L725
1064  00bb               L525:
1065                     ; 434     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1067  00bb 1e01          	ldw	x,(OFST+1,sp)
1068  00bd e601          	ld	a,(1,x)
1069  00bf a4df          	and	a,#223
1070  00c1 e701          	ld	(1,x),a
1071  00c3               L725:
1072                     ; 436 }
1075  00c3 85            	popw	x
1076  00c4 87            	retf
1149                     ; 447 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1149                     ; 448 {
1150                     	switch	.text
1151  00c5               f_SPI_GetCRC:
1153  00c5 89            	pushw	x
1154  00c6 88            	push	a
1155       00000001      OFST:	set	1
1158                     ; 449   uint8_t crcreg = 0;
1160  00c7 0f01          	clr	(OFST+0,sp)
1161                     ; 452   assert_param(IS_SPI_CRC(SPI_CRC));
1163                     ; 454   if (SPI_CRC != SPI_CRC_RX)
1165  00c9 0d07          	tnz	(OFST+6,sp)
1166  00cb 2706          	jreq	L765
1167                     ; 456     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1169  00cd e607          	ld	a,(7,x)
1170  00cf 6b01          	ld	(OFST+0,sp),a
1172  00d1 2006          	jra	L175
1173  00d3               L765:
1174                     ; 460     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1176  00d3 1e02          	ldw	x,(OFST+1,sp)
1177  00d5 e606          	ld	a,(6,x)
1178  00d7 6b01          	ld	(OFST+0,sp),a
1179  00d9               L175:
1180                     ; 464   return crcreg;
1182  00d9 7b01          	ld	a,(OFST+0,sp)
1185  00db 5b03          	addw	sp,#3
1186  00dd 87            	retf
1224                     ; 472 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1224                     ; 473 {
1225                     	switch	.text
1226  00de               f_SPI_ResetCRC:
1228  00de 89            	pushw	x
1229       00000000      OFST:	set	0
1232                     ; 476   SPI_CalculateCRCCmd(SPIx, ENABLE);
1234  00df 4b01          	push	#1
1235  00e1 8da200a2      	callf	f_SPI_CalculateCRCCmd
1237  00e5 84            	pop	a
1238                     ; 479   SPI_Cmd(SPIx, ENABLE);
1240  00e6 4b01          	push	#1
1241  00e8 1e02          	ldw	x,(OFST+2,sp)
1242  00ea 8d4e004e      	callf	f_SPI_Cmd
1244  00ee 84            	pop	a
1245                     ; 480 }
1248  00ef 85            	popw	x
1249  00f0 87            	retf
1286                     ; 487 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1286                     ; 488 {
1287                     	switch	.text
1288  00f1               f_SPI_GetCRCPolynomial:
1292                     ; 489   return SPIx->CRCPR; /* Return the CRC polynomial register */
1294  00f1 e605          	ld	a,(5,x)
1297  00f3 87            	retf
1373                     ; 519 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1373                     ; 520 {
1374                     	switch	.text
1375  00f4               f_SPI_DMACmd:
1377  00f4 89            	pushw	x
1378       00000000      OFST:	set	0
1381                     ; 522   assert_param(IS_FUNCTIONAL_STATE(NewState));
1383                     ; 523   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1385                     ; 525   if (NewState != DISABLE)
1387  00f5 0d07          	tnz	(OFST+7,sp)
1388  00f7 2708          	jreq	L376
1389                     ; 528     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1391  00f9 e602          	ld	a,(2,x)
1392  00fb 1a06          	or	a,(OFST+6,sp)
1393  00fd e702          	ld	(2,x),a
1395  00ff 2009          	jra	L576
1396  0101               L376:
1397                     ; 533     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1399  0101 1e01          	ldw	x,(OFST+1,sp)
1400  0103 7b06          	ld	a,(OFST+6,sp)
1401  0105 43            	cpl	a
1402  0106 e402          	and	a,(2,x)
1403  0108 e702          	ld	(2,x),a
1404  010a               L576:
1405                     ; 535 }
1408  010a 85            	popw	x
1409  010b 87            	retf
1527                     ; 620 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1527                     ; 621 {
1528                     	switch	.text
1529  010c               f_SPI_ITConfig:
1531  010c 89            	pushw	x
1532  010d 88            	push	a
1533       00000001      OFST:	set	1
1536                     ; 622   uint8_t itpos = 0;
1538  010e 0f01          	clr	(OFST+0,sp)
1539                     ; 624   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1541                     ; 625   assert_param(IS_FUNCTIONAL_STATE(NewState));
1543                     ; 628   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1545  0110 7b07          	ld	a,(OFST+6,sp)
1546  0112 a40f          	and	a,#15
1547  0114 5f            	clrw	x
1548  0115 97            	ld	xl,a
1549  0116 a601          	ld	a,#1
1550  0118 5d            	tnzw	x
1551  0119 2704          	jreq	L04
1552  011b               L24:
1553  011b 48            	sll	a
1554  011c 5a            	decw	x
1555  011d 26fc          	jrne	L24
1556  011f               L04:
1557  011f 6b01          	ld	(OFST+0,sp),a
1558                     ; 630   if (NewState != DISABLE)
1560  0121 0d08          	tnz	(OFST+7,sp)
1561  0123 270a          	jreq	L357
1562                     ; 632     SPIx->CR3 |= itpos; /* Enable interrupt*/
1564  0125 1e02          	ldw	x,(OFST+1,sp)
1565  0127 e602          	ld	a,(2,x)
1566  0129 1a01          	or	a,(OFST+0,sp)
1567  012b e702          	ld	(2,x),a
1569  012d 2009          	jra	L557
1570  012f               L357:
1571                     ; 636     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1573  012f 1e02          	ldw	x,(OFST+1,sp)
1574  0131 7b01          	ld	a,(OFST+0,sp)
1575  0133 43            	cpl	a
1576  0134 e402          	and	a,(2,x)
1577  0136 e702          	ld	(2,x),a
1578  0138               L557:
1579                     ; 638 }
1582  0138 5b03          	addw	sp,#3
1583  013a 87            	retf
1715                     ; 655 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1715                     ; 656 {
1716                     	switch	.text
1717  013b               f_SPI_GetFlagStatus:
1719  013b 89            	pushw	x
1720  013c 88            	push	a
1721       00000001      OFST:	set	1
1724                     ; 657   FlagStatus status = RESET;
1726  013d 0f01          	clr	(OFST+0,sp)
1727                     ; 659   assert_param(IS_SPI_FLAG(SPI_FLAG));
1729                     ; 662   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1731  013f e603          	ld	a,(3,x)
1732  0141 1507          	bcp	a,(OFST+6,sp)
1733  0143 2706          	jreq	L1401
1734                     ; 664     status = SET; /* SPI_FLAG is set */
1736  0145 a601          	ld	a,#1
1737  0147 6b01          	ld	(OFST+0,sp),a
1739  0149 2002          	jra	L3401
1740  014b               L1401:
1741                     ; 668     status = RESET; /* SPI_FLAG is reset*/
1743  014b 0f01          	clr	(OFST+0,sp)
1744  014d               L3401:
1745                     ; 672   return status;
1747  014d 7b01          	ld	a,(OFST+0,sp)
1750  014f 5b03          	addw	sp,#3
1751  0151 87            	retf
1797                     ; 690 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1797                     ; 691 {
1798                     	switch	.text
1799  0152               f_SPI_ClearFlag:
1801  0152 89            	pushw	x
1802       00000000      OFST:	set	0
1805                     ; 692   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1807                     ; 694   SPIx->SR = (uint8_t)(~SPI_FLAG);
1809  0153 7b06          	ld	a,(OFST+6,sp)
1810  0155 43            	cpl	a
1811  0156 1e01          	ldw	x,(OFST+1,sp)
1812  0158 e703          	ld	(3,x),a
1813                     ; 695 }
1816  015a 85            	popw	x
1817  015b 87            	retf
1904                     ; 711 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1904                     ; 712 {
1905                     	switch	.text
1906  015c               f_SPI_GetITStatus:
1908  015c 89            	pushw	x
1909  015d 5203          	subw	sp,#3
1910       00000003      OFST:	set	3
1913                     ; 713   ITStatus pendingbitstatus = RESET;
1915  015f 7b03          	ld	a,(OFST+0,sp)
1916  0161 97            	ld	xl,a
1917                     ; 714   uint8_t itpos = 0;
1919  0162 7b01          	ld	a,(OFST-2,sp)
1920  0164 97            	ld	xl,a
1921                     ; 715   uint8_t itmask1 = 0;
1923  0165 7b03          	ld	a,(OFST+0,sp)
1924  0167 97            	ld	xl,a
1925                     ; 716   uint8_t itmask2 = 0;
1927  0168 7b03          	ld	a,(OFST+0,sp)
1928  016a 97            	ld	xl,a
1929                     ; 717   __IO uint8_t enablestatus = 0;
1931  016b 0f02          	clr	(OFST-1,sp)
1932                     ; 718   assert_param(IS_SPI_GET_IT(SPI_IT));
1934                     ; 720   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1936  016d 7b09          	ld	a,(OFST+6,sp)
1937  016f a40f          	and	a,#15
1938  0171 5f            	clrw	x
1939  0172 97            	ld	xl,a
1940  0173 a601          	ld	a,#1
1941  0175 5d            	tnzw	x
1942  0176 2704          	jreq	L25
1943  0178               L45:
1944  0178 48            	sll	a
1945  0179 5a            	decw	x
1946  017a 26fc          	jrne	L45
1947  017c               L25:
1948  017c 6b01          	ld	(OFST-2,sp),a
1949                     ; 723   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1951  017e 7b09          	ld	a,(OFST+6,sp)
1952  0180 4e            	swap	a
1953  0181 a40f          	and	a,#15
1954  0183 6b03          	ld	(OFST+0,sp),a
1955                     ; 725   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1957  0185 7b03          	ld	a,(OFST+0,sp)
1958  0187 5f            	clrw	x
1959  0188 97            	ld	xl,a
1960  0189 a601          	ld	a,#1
1961  018b 5d            	tnzw	x
1962  018c 2704          	jreq	L65
1963  018e               L06:
1964  018e 48            	sll	a
1965  018f 5a            	decw	x
1966  0190 26fc          	jrne	L06
1967  0192               L65:
1968  0192 6b03          	ld	(OFST+0,sp),a
1969                     ; 727   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
1971  0194 1e04          	ldw	x,(OFST+1,sp)
1972  0196 e603          	ld	a,(3,x)
1973  0198 1403          	and	a,(OFST+0,sp)
1974  019a 6b02          	ld	(OFST-1,sp),a
1975                     ; 729   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
1977  019c 1e04          	ldw	x,(OFST+1,sp)
1978  019e e602          	ld	a,(2,x)
1979  01a0 1501          	bcp	a,(OFST-2,sp)
1980  01a2 270a          	jreq	L3311
1982  01a4 0d02          	tnz	(OFST-1,sp)
1983  01a6 2706          	jreq	L3311
1984                     ; 732     pendingbitstatus = SET;
1986  01a8 a601          	ld	a,#1
1987  01aa 6b03          	ld	(OFST+0,sp),a
1989  01ac 2002          	jra	L5311
1990  01ae               L3311:
1991                     ; 737     pendingbitstatus = RESET;
1993  01ae 0f03          	clr	(OFST+0,sp)
1994  01b0               L5311:
1995                     ; 740   return  pendingbitstatus;
1997  01b0 7b03          	ld	a,(OFST+0,sp)
2000  01b2 5b05          	addw	sp,#5
2001  01b4 87            	retf
2055                     ; 758 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2055                     ; 759 {
2056                     	switch	.text
2057  01b5               f_SPI_ClearITPendingBit:
2059  01b5 89            	pushw	x
2060  01b6 88            	push	a
2061       00000001      OFST:	set	1
2064                     ; 760   uint8_t itpos = 0;
2066  01b7 0f01          	clr	(OFST+0,sp)
2067                     ; 761   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2069                     ; 766   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2071  01b9 7b07          	ld	a,(OFST+6,sp)
2072  01bb a4f0          	and	a,#240
2073  01bd 4e            	swap	a
2074  01be a40f          	and	a,#15
2075  01c0 5f            	clrw	x
2076  01c1 97            	ld	xl,a
2077  01c2 a601          	ld	a,#1
2078  01c4 5d            	tnzw	x
2079  01c5 2704          	jreq	L46
2080  01c7               L66:
2081  01c7 48            	sll	a
2082  01c8 5a            	decw	x
2083  01c9 26fc          	jrne	L66
2084  01cb               L46:
2085  01cb 6b01          	ld	(OFST+0,sp),a
2086                     ; 768   SPIx->SR = (uint8_t)(~itpos);
2088  01cd 7b01          	ld	a,(OFST+0,sp)
2089  01cf 43            	cpl	a
2090  01d0 1e02          	ldw	x,(OFST+1,sp)
2091  01d2 e703          	ld	(3,x),a
2092                     ; 770 }
2095  01d4 5b03          	addw	sp,#3
2096  01d6 87            	retf
2108                     	xdef	f_SPI_ClearITPendingBit
2109                     	xdef	f_SPI_GetITStatus
2110                     	xdef	f_SPI_ClearFlag
2111                     	xdef	f_SPI_GetFlagStatus
2112                     	xdef	f_SPI_ITConfig
2113                     	xdef	f_SPI_DMACmd
2114                     	xdef	f_SPI_GetCRCPolynomial
2115                     	xdef	f_SPI_ResetCRC
2116                     	xdef	f_SPI_GetCRC
2117                     	xdef	f_SPI_CalculateCRCCmd
2118                     	xdef	f_SPI_TransmitCRC
2119                     	xdef	f_SPI_ReceiveData
2120                     	xdef	f_SPI_SendData
2121                     	xdef	f_SPI_BiDirectionalLineConfig
2122                     	xdef	f_SPI_NSSInternalSoftwareCmd
2123                     	xdef	f_SPI_Cmd
2124                     	xdef	f_SPI_Init
2125                     	xdef	f_SPI_DeInit
2144                     	end
