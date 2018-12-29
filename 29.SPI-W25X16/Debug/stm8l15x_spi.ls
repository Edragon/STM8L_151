   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 125                     ; 122 void SPI_DeInit(SPI_TypeDef* SPIx)
 125                     ; 123 {
 127                     	switch	.text
 128  0000               _SPI_DeInit:
 132                     ; 124   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 134  0000 7f            	clr	(x)
 135                     ; 125   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 137  0001 6f01          	clr	(1,x)
 138                     ; 126   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 140  0003 6f02          	clr	(2,x)
 141                     ; 127   SPIx->SR     = SPI_SR_RESET_VALUE;
 143  0005 a602          	ld	a,#2
 144  0007 e703          	ld	(3,x),a
 145                     ; 128   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 147  0009 a607          	ld	a,#7
 148  000b e705          	ld	(5,x),a
 149                     ; 129 }
 152  000d 81            	ret
 478                     ; 171 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 478                     ; 172               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 478                     ; 173               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 478                     ; 174               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 478                     ; 175               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 478                     ; 176 {
 479                     	switch	.text
 480  000e               _SPI_Init:
 482  000e 89            	pushw	x
 483  000f 88            	push	a
 484       00000001      OFST:	set	1
 487                     ; 178   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 489                     ; 179   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 491                     ; 180   assert_param(IS_SPI_MODE(SPI_Mode));
 493                     ; 181   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 495                     ; 182   assert_param(IS_SPI_PHASE(SPI_CPHA));
 497                     ; 183   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 499                     ; 184   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 501                     ; 185   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 503                     ; 188   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 503                     ; 189                                   (uint8_t)SPI_BaudRatePrescaler) |
 503                     ; 190                         (uint8_t)((uint8_t)SPI_CPOL |
 503                     ; 191                                   SPI_CPHA));
 505  0010 7b09          	ld	a,(OFST+8,sp)
 506  0012 1a0a          	or	a,(OFST+9,sp)
 507  0014 6b01          	ld	(OFST+0,sp),a
 508  0016 7b06          	ld	a,(OFST+5,sp)
 509  0018 1a07          	or	a,(OFST+6,sp)
 510  001a 1a01          	or	a,(OFST+0,sp)
 511  001c 1e02          	ldw	x,(OFST+1,sp)
 512  001e f7            	ld	(x),a
 513                     ; 194   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 515  001f 7b0b          	ld	a,(OFST+10,sp)
 516  0021 1a0c          	or	a,(OFST+11,sp)
 517  0023 1e02          	ldw	x,(OFST+1,sp)
 518  0025 e701          	ld	(1,x),a
 519                     ; 196   if (SPI_Mode == SPI_Mode_Master)
 521  0027 7b08          	ld	a,(OFST+7,sp)
 522  0029 a104          	cp	a,#4
 523  002b 260a          	jrne	L562
 524                     ; 198     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 526  002d 1e02          	ldw	x,(OFST+1,sp)
 527  002f e601          	ld	a,(1,x)
 528  0031 aa01          	or	a,#1
 529  0033 e701          	ld	(1,x),a
 531  0035 2008          	jra	L762
 532  0037               L562:
 533                     ; 202     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 535  0037 1e02          	ldw	x,(OFST+1,sp)
 536  0039 e601          	ld	a,(1,x)
 537  003b a4fe          	and	a,#254
 538  003d e701          	ld	(1,x),a
 539  003f               L762:
 540                     ; 206   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 542  003f 1e02          	ldw	x,(OFST+1,sp)
 543  0041 f6            	ld	a,(x)
 544  0042 1a08          	or	a,(OFST+7,sp)
 545  0044 f7            	ld	(x),a
 546                     ; 209   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 548  0045 7b0d          	ld	a,(OFST+12,sp)
 549  0047 1e02          	ldw	x,(OFST+1,sp)
 550  0049 e705          	ld	(5,x),a
 551                     ; 210 }
 554  004b 5b03          	addw	sp,#3
 555  004d 81            	ret
 622                     ; 219 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 622                     ; 220 {
 623                     	switch	.text
 624  004e               _SPI_Cmd:
 626  004e 89            	pushw	x
 627       00000000      OFST:	set	0
 630                     ; 222   assert_param(IS_FUNCTIONAL_STATE(NewState));
 632                     ; 224   if (NewState != DISABLE)
 634  004f 0d05          	tnz	(OFST+5,sp)
 635  0051 2706          	jreq	L523
 636                     ; 226     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 638  0053 f6            	ld	a,(x)
 639  0054 aa40          	or	a,#64
 640  0056 f7            	ld	(x),a
 642  0057 2006          	jra	L723
 643  0059               L523:
 644                     ; 230     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 646  0059 1e01          	ldw	x,(OFST+1,sp)
 647  005b f6            	ld	a,(x)
 648  005c a4bf          	and	a,#191
 649  005e f7            	ld	(x),a
 650  005f               L723:
 651                     ; 232 }
 654  005f 85            	popw	x
 655  0060 81            	ret
 703                     ; 241 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 703                     ; 242 {
 704                     	switch	.text
 705  0061               _SPI_NSSInternalSoftwareCmd:
 707  0061 89            	pushw	x
 708       00000000      OFST:	set	0
 711                     ; 244   assert_param(IS_FUNCTIONAL_STATE(NewState));
 713                     ; 246   if (NewState != DISABLE)
 715  0062 0d05          	tnz	(OFST+5,sp)
 716  0064 2708          	jreq	L553
 717                     ; 248     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 719  0066 e601          	ld	a,(1,x)
 720  0068 aa01          	or	a,#1
 721  006a e701          	ld	(1,x),a
 723  006c 2008          	jra	L753
 724  006e               L553:
 725                     ; 252     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 727  006e 1e01          	ldw	x,(OFST+1,sp)
 728  0070 e601          	ld	a,(1,x)
 729  0072 a4fe          	and	a,#254
 730  0074 e701          	ld	(1,x),a
 731  0076               L753:
 732                     ; 254 }
 735  0076 85            	popw	x
 736  0077 81            	ret
 804                     ; 265 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 804                     ; 266 {
 805                     	switch	.text
 806  0078               _SPI_BiDirectionalLineConfig:
 808  0078 89            	pushw	x
 809       00000000      OFST:	set	0
 812                     ; 268   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 814                     ; 270   if (SPI_Direction != SPI_Direction_Rx)
 816  0079 0d05          	tnz	(OFST+5,sp)
 817  007b 2708          	jreq	L514
 818                     ; 272     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 820  007d e601          	ld	a,(1,x)
 821  007f aa40          	or	a,#64
 822  0081 e701          	ld	(1,x),a
 824  0083 2008          	jra	L714
 825  0085               L514:
 826                     ; 276     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 828  0085 1e01          	ldw	x,(OFST+1,sp)
 829  0087 e601          	ld	a,(1,x)
 830  0089 a4bf          	and	a,#191
 831  008b e701          	ld	(1,x),a
 832  008d               L714:
 833                     ; 278 }
 836  008d 85            	popw	x
 837  008e 81            	ret
 883                     ; 313 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 883                     ; 314 {
 884                     	switch	.text
 885  008f               _SPI_SendData:
 887  008f 89            	pushw	x
 888       00000000      OFST:	set	0
 891                     ; 315   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 893  0090 7b05          	ld	a,(OFST+5,sp)
 894  0092 1e01          	ldw	x,(OFST+1,sp)
 895  0094 e704          	ld	(4,x),a
 896                     ; 316 }
 899  0096 85            	popw	x
 900  0097 81            	ret
 937                     ; 323 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 937                     ; 324 {
 938                     	switch	.text
 939  0098               _SPI_ReceiveData:
 943                     ; 325   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 945  0098 e604          	ld	a,(4,x)
 948  009a 81            	ret
 985                     ; 408 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 985                     ; 409 {
 986                     	switch	.text
 987  009b               _SPI_TransmitCRC:
 991                     ; 410   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 993  009b e601          	ld	a,(1,x)
 994  009d aa10          	or	a,#16
 995  009f e701          	ld	(1,x),a
 996                     ; 411 }
 999  00a1 81            	ret
1048                     ; 420 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1048                     ; 421 {
1049                     	switch	.text
1050  00a2               _SPI_CalculateCRCCmd:
1052  00a2 89            	pushw	x
1053       00000000      OFST:	set	0
1056                     ; 423   assert_param(IS_FUNCTIONAL_STATE(NewState));
1058                     ; 426   SPI_Cmd(SPI1, DISABLE);
1060  00a3 4b00          	push	#0
1061  00a5 ae5200        	ldw	x,#20992
1062  00a8 ada4          	call	_SPI_Cmd
1064  00aa 84            	pop	a
1065                     ; 428   if (NewState != DISABLE)
1067  00ab 0d05          	tnz	(OFST+5,sp)
1068  00ad 270a          	jreq	L135
1069                     ; 430     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1071  00af 1e01          	ldw	x,(OFST+1,sp)
1072  00b1 e601          	ld	a,(1,x)
1073  00b3 aa20          	or	a,#32
1074  00b5 e701          	ld	(1,x),a
1076  00b7 2008          	jra	L335
1077  00b9               L135:
1078                     ; 434     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1080  00b9 1e01          	ldw	x,(OFST+1,sp)
1081  00bb e601          	ld	a,(1,x)
1082  00bd a4df          	and	a,#223
1083  00bf e701          	ld	(1,x),a
1084  00c1               L335:
1085                     ; 436 }
1088  00c1 85            	popw	x
1089  00c2 81            	ret
1165                     ; 447 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1165                     ; 448 {
1166                     	switch	.text
1167  00c3               _SPI_GetCRC:
1169  00c3 89            	pushw	x
1170  00c4 88            	push	a
1171       00000001      OFST:	set	1
1174                     ; 449   uint8_t crcreg = 0;
1176  00c5 0f01          	clr	(OFST+0,sp)
1177                     ; 452   assert_param(IS_SPI_CRC(SPI_CRC));
1179                     ; 454   if (SPI_CRC != SPI_CRC_RX)
1181  00c7 0d06          	tnz	(OFST+5,sp)
1182  00c9 2706          	jreq	L575
1183                     ; 456     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1185  00cb e607          	ld	a,(7,x)
1186  00cd 6b01          	ld	(OFST+0,sp),a
1188  00cf 2006          	jra	L775
1189  00d1               L575:
1190                     ; 460     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1192  00d1 1e02          	ldw	x,(OFST+1,sp)
1193  00d3 e606          	ld	a,(6,x)
1194  00d5 6b01          	ld	(OFST+0,sp),a
1195  00d7               L775:
1196                     ; 464   return crcreg;
1198  00d7 7b01          	ld	a,(OFST+0,sp)
1201  00d9 5b03          	addw	sp,#3
1202  00db 81            	ret
1241                     ; 472 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1241                     ; 473 {
1242                     	switch	.text
1243  00dc               _SPI_ResetCRC:
1245  00dc 89            	pushw	x
1246       00000000      OFST:	set	0
1249                     ; 476   SPI_CalculateCRCCmd(SPIx, ENABLE);
1251  00dd 4b01          	push	#1
1252  00df adc1          	call	_SPI_CalculateCRCCmd
1254  00e1 84            	pop	a
1255                     ; 479   SPI_Cmd(SPIx, ENABLE);
1257  00e2 4b01          	push	#1
1258  00e4 1e02          	ldw	x,(OFST+2,sp)
1259  00e6 cd004e        	call	_SPI_Cmd
1261  00e9 84            	pop	a
1262                     ; 480 }
1265  00ea 85            	popw	x
1266  00eb 81            	ret
1304                     ; 487 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1304                     ; 488 {
1305                     	switch	.text
1306  00ec               _SPI_GetCRCPolynomial:
1310                     ; 489   return SPIx->CRCPR; /* Return the CRC polynomial register */
1312  00ec e605          	ld	a,(5,x)
1315  00ee 81            	ret
1392                     ; 519 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1392                     ; 520 {
1393                     	switch	.text
1394  00ef               _SPI_DMACmd:
1396  00ef 89            	pushw	x
1397       00000000      OFST:	set	0
1400                     ; 522   assert_param(IS_FUNCTIONAL_STATE(NewState));
1402                     ; 523   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1404                     ; 525   if (NewState != DISABLE)
1406  00f0 0d06          	tnz	(OFST+6,sp)
1407  00f2 2708          	jreq	L107
1408                     ; 528     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1410  00f4 e602          	ld	a,(2,x)
1411  00f6 1a05          	or	a,(OFST+5,sp)
1412  00f8 e702          	ld	(2,x),a
1414  00fa 2009          	jra	L307
1415  00fc               L107:
1416                     ; 533     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1418  00fc 1e01          	ldw	x,(OFST+1,sp)
1419  00fe 7b05          	ld	a,(OFST+5,sp)
1420  0100 43            	cpl	a
1421  0101 e402          	and	a,(2,x)
1422  0103 e702          	ld	(2,x),a
1423  0105               L307:
1424                     ; 535 }
1427  0105 85            	popw	x
1428  0106 81            	ret
1549                     ; 620 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1549                     ; 621 {
1550                     	switch	.text
1551  0107               _SPI_ITConfig:
1553  0107 89            	pushw	x
1554  0108 88            	push	a
1555       00000001      OFST:	set	1
1558                     ; 622   uint8_t itpos = 0;
1560  0109 0f01          	clr	(OFST+0,sp)
1561                     ; 624   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1563                     ; 625   assert_param(IS_FUNCTIONAL_STATE(NewState));
1565                     ; 628   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1567  010b 7b06          	ld	a,(OFST+5,sp)
1568  010d a40f          	and	a,#15
1569  010f 5f            	clrw	x
1570  0110 97            	ld	xl,a
1571  0111 a601          	ld	a,#1
1572  0113 5d            	tnzw	x
1573  0114 2704          	jreq	L04
1574  0116               L24:
1575  0116 48            	sll	a
1576  0117 5a            	decw	x
1577  0118 26fc          	jrne	L24
1578  011a               L04:
1579  011a 6b01          	ld	(OFST+0,sp),a
1580                     ; 630   if (NewState != DISABLE)
1582  011c 0d07          	tnz	(OFST+6,sp)
1583  011e 270a          	jreq	L367
1584                     ; 632     SPIx->CR3 |= itpos; /* Enable interrupt*/
1586  0120 1e02          	ldw	x,(OFST+1,sp)
1587  0122 e602          	ld	a,(2,x)
1588  0124 1a01          	or	a,(OFST+0,sp)
1589  0126 e702          	ld	(2,x),a
1591  0128 2009          	jra	L567
1592  012a               L367:
1593                     ; 636     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1595  012a 1e02          	ldw	x,(OFST+1,sp)
1596  012c 7b01          	ld	a,(OFST+0,sp)
1597  012e 43            	cpl	a
1598  012f e402          	and	a,(2,x)
1599  0131 e702          	ld	(2,x),a
1600  0133               L567:
1601                     ; 638 }
1604  0133 5b03          	addw	sp,#3
1605  0135 81            	ret
1738                     ; 655 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1738                     ; 656 {
1739                     	switch	.text
1740  0136               _SPI_GetFlagStatus:
1742  0136 89            	pushw	x
1743  0137 88            	push	a
1744       00000001      OFST:	set	1
1747                     ; 657   FlagStatus status = RESET;
1749  0138 0f01          	clr	(OFST+0,sp)
1750                     ; 659   assert_param(IS_SPI_FLAG(SPI_FLAG));
1752                     ; 662   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1754  013a e603          	ld	a,(3,x)
1755  013c 1506          	bcp	a,(OFST+5,sp)
1756  013e 2706          	jreq	L1501
1757                     ; 664     status = SET; /* SPI_FLAG is set */
1759  0140 a601          	ld	a,#1
1760  0142 6b01          	ld	(OFST+0,sp),a
1762  0144 2002          	jra	L3501
1763  0146               L1501:
1764                     ; 668     status = RESET; /* SPI_FLAG is reset*/
1766  0146 0f01          	clr	(OFST+0,sp)
1767  0148               L3501:
1768                     ; 672   return status;
1770  0148 7b01          	ld	a,(OFST+0,sp)
1773  014a 5b03          	addw	sp,#3
1774  014c 81            	ret
1821                     ; 690 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1821                     ; 691 {
1822                     	switch	.text
1823  014d               _SPI_ClearFlag:
1825  014d 89            	pushw	x
1826       00000000      OFST:	set	0
1829                     ; 692   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1831                     ; 694   SPIx->SR = (uint8_t)(~SPI_FLAG);
1833  014e 7b05          	ld	a,(OFST+5,sp)
1834  0150 43            	cpl	a
1835  0151 1e01          	ldw	x,(OFST+1,sp)
1836  0153 e703          	ld	(3,x),a
1837                     ; 695 }
1840  0155 85            	popw	x
1841  0156 81            	ret
1935                     ; 711 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1935                     ; 712 {
1936                     	switch	.text
1937  0157               _SPI_GetITStatus:
1939  0157 89            	pushw	x
1940  0158 5203          	subw	sp,#3
1941       00000003      OFST:	set	3
1944                     ; 713   ITStatus pendingbitstatus = RESET;
1946  015a 7b03          	ld	a,(OFST+0,sp)
1947  015c 97            	ld	xl,a
1948                     ; 714   uint8_t itpos = 0;
1950  015d 7b01          	ld	a,(OFST-2,sp)
1951  015f 97            	ld	xl,a
1952                     ; 715   uint8_t itmask1 = 0;
1954  0160 7b03          	ld	a,(OFST+0,sp)
1955  0162 97            	ld	xl,a
1956                     ; 716   uint8_t itmask2 = 0;
1958  0163 7b03          	ld	a,(OFST+0,sp)
1959  0165 97            	ld	xl,a
1960                     ; 717   __IO uint8_t enablestatus = 0;
1962  0166 0f02          	clr	(OFST-1,sp)
1963                     ; 718   assert_param(IS_SPI_GET_IT(SPI_IT));
1965                     ; 720   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1967  0168 7b08          	ld	a,(OFST+5,sp)
1968  016a a40f          	and	a,#15
1969  016c 5f            	clrw	x
1970  016d 97            	ld	xl,a
1971  016e a601          	ld	a,#1
1972  0170 5d            	tnzw	x
1973  0171 2704          	jreq	L25
1974  0173               L45:
1975  0173 48            	sll	a
1976  0174 5a            	decw	x
1977  0175 26fc          	jrne	L45
1978  0177               L25:
1979  0177 6b01          	ld	(OFST-2,sp),a
1980                     ; 723   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1982  0179 7b08          	ld	a,(OFST+5,sp)
1983  017b 4e            	swap	a
1984  017c a40f          	and	a,#15
1985  017e 6b03          	ld	(OFST+0,sp),a
1986                     ; 725   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1988  0180 7b03          	ld	a,(OFST+0,sp)
1989  0182 5f            	clrw	x
1990  0183 97            	ld	xl,a
1991  0184 a601          	ld	a,#1
1992  0186 5d            	tnzw	x
1993  0187 2704          	jreq	L65
1994  0189               L06:
1995  0189 48            	sll	a
1996  018a 5a            	decw	x
1997  018b 26fc          	jrne	L06
1998  018d               L65:
1999  018d 6b03          	ld	(OFST+0,sp),a
2000                     ; 727   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
2002  018f 1e04          	ldw	x,(OFST+1,sp)
2003  0191 e603          	ld	a,(3,x)
2004  0193 1403          	and	a,(OFST+0,sp)
2005  0195 6b02          	ld	(OFST-1,sp),a
2006                     ; 729   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
2008  0197 1e04          	ldw	x,(OFST+1,sp)
2009  0199 e602          	ld	a,(2,x)
2010  019b 1501          	bcp	a,(OFST-2,sp)
2011  019d 270a          	jreq	L1511
2013  019f 0d02          	tnz	(OFST-1,sp)
2014  01a1 2706          	jreq	L1511
2015                     ; 732     pendingbitstatus = SET;
2017  01a3 a601          	ld	a,#1
2018  01a5 6b03          	ld	(OFST+0,sp),a
2020  01a7 2002          	jra	L3511
2021  01a9               L1511:
2022                     ; 737     pendingbitstatus = RESET;
2024  01a9 0f03          	clr	(OFST+0,sp)
2025  01ab               L3511:
2026                     ; 740   return  pendingbitstatus;
2028  01ab 7b03          	ld	a,(OFST+0,sp)
2031  01ad 5b05          	addw	sp,#5
2032  01af 81            	ret
2089                     ; 758 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2089                     ; 759 {
2090                     	switch	.text
2091  01b0               _SPI_ClearITPendingBit:
2093  01b0 89            	pushw	x
2094  01b1 88            	push	a
2095       00000001      OFST:	set	1
2098                     ; 760   uint8_t itpos = 0;
2100  01b2 0f01          	clr	(OFST+0,sp)
2101                     ; 761   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2103                     ; 766   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2105  01b4 7b06          	ld	a,(OFST+5,sp)
2106  01b6 a4f0          	and	a,#240
2107  01b8 4e            	swap	a
2108  01b9 a40f          	and	a,#15
2109  01bb 5f            	clrw	x
2110  01bc 97            	ld	xl,a
2111  01bd a601          	ld	a,#1
2112  01bf 5d            	tnzw	x
2113  01c0 2704          	jreq	L46
2114  01c2               L66:
2115  01c2 48            	sll	a
2116  01c3 5a            	decw	x
2117  01c4 26fc          	jrne	L66
2118  01c6               L46:
2119  01c6 6b01          	ld	(OFST+0,sp),a
2120                     ; 768   SPIx->SR = (uint8_t)(~itpos);
2122  01c8 7b01          	ld	a,(OFST+0,sp)
2123  01ca 43            	cpl	a
2124  01cb 1e02          	ldw	x,(OFST+1,sp)
2125  01cd e703          	ld	(3,x),a
2126                     ; 770 }
2129  01cf 5b03          	addw	sp,#3
2130  01d1 81            	ret
2143                     	xdef	_SPI_ClearITPendingBit
2144                     	xdef	_SPI_GetITStatus
2145                     	xdef	_SPI_ClearFlag
2146                     	xdef	_SPI_GetFlagStatus
2147                     	xdef	_SPI_ITConfig
2148                     	xdef	_SPI_DMACmd
2149                     	xdef	_SPI_GetCRCPolynomial
2150                     	xdef	_SPI_ResetCRC
2151                     	xdef	_SPI_GetCRC
2152                     	xdef	_SPI_CalculateCRCCmd
2153                     	xdef	_SPI_TransmitCRC
2154                     	xdef	_SPI_ReceiveData
2155                     	xdef	_SPI_SendData
2156                     	xdef	_SPI_BiDirectionalLineConfig
2157                     	xdef	_SPI_NSSInternalSoftwareCmd
2158                     	xdef	_SPI_Cmd
2159                     	xdef	_SPI_Init
2160                     	xdef	_SPI_DeInit
2179                     	end
