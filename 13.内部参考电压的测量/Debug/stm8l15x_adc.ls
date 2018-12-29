   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 163                     ; 129 void ADC_DeInit(ADC_TypeDef* ADCx)
 163                     ; 130 {
 165                     	switch	.text
 166  0000               _ADC_DeInit:
 170                     ; 132   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 172  0000 7f            	clr	(x)
 173                     ; 133   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 175  0001 6f01          	clr	(1,x)
 176                     ; 134   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 178  0003 a61f          	ld	a,#31
 179  0005 e702          	ld	(2,x),a
 180                     ; 137   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 182  0007 a6ff          	ld	a,#255
 183  0009 e703          	ld	(3,x),a
 184                     ; 140   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 186  000b a60f          	ld	a,#15
 187  000d e706          	ld	(6,x),a
 188                     ; 141   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 190  000f a6ff          	ld	a,#255
 191  0011 e707          	ld	(7,x),a
 192                     ; 144   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 194  0013 6f08          	clr	(8,x)
 195                     ; 145   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 197  0015 6f09          	clr	(9,x)
 198                     ; 148   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 200  0017 6f0a          	clr	(10,x)
 201                     ; 149   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 203  0019 6f0b          	clr	(11,x)
 204                     ; 150   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 206  001b 6f0c          	clr	(12,x)
 207                     ; 151   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 209  001d 6f0d          	clr	(13,x)
 210                     ; 154   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 212  001f 6f0e          	clr	(14,x)
 213                     ; 155   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 215  0021 6f0f          	clr	(15,x)
 216                     ; 156   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 218  0023 6f10          	clr	(16,x)
 219                     ; 157   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 221  0025 6f11          	clr	(17,x)
 222                     ; 158 }
 225  0027 81            	ret
 372                     ; 180 void ADC_Init(ADC_TypeDef* ADCx,
 372                     ; 181               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 372                     ; 182               ADC_Resolution_TypeDef ADC_Resolution,
 372                     ; 183               ADC_Prescaler_TypeDef ADC_Prescaler)
 372                     ; 184 {
 373                     	switch	.text
 374  0028               _ADC_Init:
 376  0028 89            	pushw	x
 377       00000000      OFST:	set	0
 380                     ; 186   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 382                     ; 187   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 384                     ; 188   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 386                     ; 191   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 388  0029 f6            	ld	a,(x)
 389  002a a49b          	and	a,#155
 390  002c f7            	ld	(x),a
 391                     ; 194   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 393  002d 7b05          	ld	a,(OFST+5,sp)
 394  002f 1a06          	or	a,(OFST+6,sp)
 395  0031 fa            	or	a,(x)
 396  0032 f7            	ld	(x),a
 397                     ; 197   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 399  0033 e601          	ld	a,(1,x)
 400  0035 a47f          	and	a,#127
 401  0037 e701          	ld	(1,x),a
 402                     ; 200   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 404  0039 e601          	ld	a,(1,x)
 405  003b 1a07          	or	a,(OFST+7,sp)
 406  003d e701          	ld	(1,x),a
 407                     ; 201 }
 410  003f 85            	popw	x
 411  0040 81            	ret
 478                     ; 210 void ADC_Cmd(ADC_TypeDef* ADCx,
 478                     ; 211              FunctionalState NewState)
 478                     ; 212 {
 479                     	switch	.text
 480  0041               _ADC_Cmd:
 482  0041 89            	pushw	x
 483       00000000      OFST:	set	0
 486                     ; 214   assert_param(IS_FUNCTIONAL_STATE(NewState));
 488                     ; 216   if (NewState != DISABLE)
 490  0042 0d05          	tnz	(OFST+5,sp)
 491  0044 2706          	jreq	L142
 492                     ; 219     ADCx->CR1 |= ADC_CR1_ADON;
 494  0046 f6            	ld	a,(x)
 495  0047 aa01          	or	a,#1
 496  0049 f7            	ld	(x),a
 498  004a 2006          	jra	L342
 499  004c               L142:
 500                     ; 224     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 502  004c 1e01          	ldw	x,(OFST+1,sp)
 503  004e f6            	ld	a,(x)
 504  004f a4fe          	and	a,#254
 505  0051 f7            	ld	(x),a
 506  0052               L342:
 507                     ; 226 }
 510  0052 85            	popw	x
 511  0053 81            	ret
 549                     ; 233 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 549                     ; 234 {
 550                     	switch	.text
 551  0054               _ADC_SoftwareStartConv:
 555                     ; 236   ADCx->CR1 |= ADC_CR1_START;
 557  0054 f6            	ld	a,(x)
 558  0055 aa02          	or	a,#2
 559  0057 f7            	ld	(x),a
 560                     ; 237 }
 563  0058 81            	ret
 691                     ; 255 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 691                     ; 256                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 691                     ; 257                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 691                     ; 258 {
 692                     	switch	.text
 693  0059               _ADC_ExternalTrigConfig:
 695  0059 89            	pushw	x
 696       00000000      OFST:	set	0
 699                     ; 260   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 701                     ; 261   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 703                     ; 264   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 705  005a e601          	ld	a,(1,x)
 706  005c a487          	and	a,#135
 707  005e e701          	ld	(1,x),a
 708                     ; 268   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 708                     ; 269                           (uint8_t)ADC_ExtEventSelection);
 710  0060 7b06          	ld	a,(OFST+6,sp)
 711  0062 1a05          	or	a,(OFST+5,sp)
 712  0064 ea01          	or	a,(1,x)
 713  0066 e701          	ld	(1,x),a
 714                     ; 270 }
 717  0068 85            	popw	x
 718  0069 81            	ret
1032                     ; 333 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1032                     ; 334                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1032                     ; 335 {
1033                     	switch	.text
1034  006a               _ADC_AnalogWatchdogChannelSelect:
1036  006a 89            	pushw	x
1037       00000000      OFST:	set	0
1040                     ; 337   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1042                     ; 340   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1044  006b e602          	ld	a,(2,x)
1045  006d a4e0          	and	a,#224
1046  006f e702          	ld	(2,x),a
1047                     ; 343   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1049  0071 e602          	ld	a,(2,x)
1050  0073 1a05          	or	a,(OFST+5,sp)
1051  0075 e702          	ld	(2,x),a
1052                     ; 344 }
1055  0077 85            	popw	x
1056  0078 81            	ret
1112                     ; 355 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1112                     ; 356 {
1113                     	switch	.text
1114  0079               _ADC_AnalogWatchdogThresholdsConfig:
1116  0079 89            	pushw	x
1117       00000000      OFST:	set	0
1120                     ; 358   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1122                     ; 359   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1124                     ; 362   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1126  007a 7b05          	ld	a,(OFST+5,sp)
1127  007c 1e01          	ldw	x,(OFST+1,sp)
1128  007e e706          	ld	(6,x),a
1129                     ; 363   ADCx->HTRL = (uint8_t)(HighThreshold);
1131  0080 7b06          	ld	a,(OFST+6,sp)
1132  0082 1e01          	ldw	x,(OFST+1,sp)
1133  0084 e707          	ld	(7,x),a
1134                     ; 366   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1136  0086 7b07          	ld	a,(OFST+7,sp)
1137  0088 1e01          	ldw	x,(OFST+1,sp)
1138  008a e708          	ld	(8,x),a
1139                     ; 367   ADCx->LTRL = (uint8_t)(LowThreshold);
1141  008c 7b08          	ld	a,(OFST+8,sp)
1142  008e 1e01          	ldw	x,(OFST+1,sp)
1143  0090 e709          	ld	(9,x),a
1144                     ; 368 }
1147  0092 85            	popw	x
1148  0093 81            	ret
1215                     ; 406 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1215                     ; 407                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1215                     ; 408                               uint16_t HighThreshold,
1215                     ; 409                               uint16_t LowThreshold)
1215                     ; 410 {
1216                     	switch	.text
1217  0094               _ADC_AnalogWatchdogConfig:
1219  0094 89            	pushw	x
1220       00000000      OFST:	set	0
1223                     ; 412   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1225                     ; 413   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1227                     ; 414   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1229                     ; 417   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1231  0095 e602          	ld	a,(2,x)
1232  0097 a4e0          	and	a,#224
1233  0099 e702          	ld	(2,x),a
1234                     ; 420   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1236  009b e602          	ld	a,(2,x)
1237  009d 1a05          	or	a,(OFST+5,sp)
1238  009f e702          	ld	(2,x),a
1239                     ; 423   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1241  00a1 7b06          	ld	a,(OFST+6,sp)
1242  00a3 1e01          	ldw	x,(OFST+1,sp)
1243  00a5 e706          	ld	(6,x),a
1244                     ; 424   ADCx->HTRL = (uint8_t)(HighThreshold);
1246  00a7 7b07          	ld	a,(OFST+7,sp)
1247  00a9 1e01          	ldw	x,(OFST+1,sp)
1248  00ab e707          	ld	(7,x),a
1249                     ; 427   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1251  00ad 7b08          	ld	a,(OFST+8,sp)
1252  00af 1e01          	ldw	x,(OFST+1,sp)
1253  00b1 e708          	ld	(8,x),a
1254                     ; 428   ADCx->LTRL = (uint8_t)LowThreshold;
1256  00b3 7b09          	ld	a,(OFST+9,sp)
1257  00b5 1e01          	ldw	x,(OFST+1,sp)
1258  00b7 e709          	ld	(9,x),a
1259                     ; 429 }
1262  00b9 85            	popw	x
1263  00ba 81            	ret
1298                     ; 468 void ADC_TempSensorCmd(FunctionalState NewState)
1298                     ; 469 {
1299                     	switch	.text
1300  00bb               _ADC_TempSensorCmd:
1304                     ; 471   assert_param(IS_FUNCTIONAL_STATE(NewState));
1306                     ; 473   if (NewState != DISABLE)
1308  00bb 4d            	tnz	a
1309  00bc 2706          	jreq	L175
1310                     ; 476     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1312  00be 721a534e      	bset	21326,#5
1314  00c2 2004          	jra	L375
1315  00c4               L175:
1316                     ; 481     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1318  00c4 721b534e      	bres	21326,#5
1319  00c8               L375:
1320                     ; 483 }
1323  00c8 81            	ret
1358                     ; 491 void ADC_VrefintCmd(FunctionalState NewState)
1358                     ; 492 {
1359                     	switch	.text
1360  00c9               _ADC_VrefintCmd:
1364                     ; 494   assert_param(IS_FUNCTIONAL_STATE(NewState));
1366                     ; 496   if (NewState != DISABLE)
1368  00c9 4d            	tnz	a
1369  00ca 2706          	jreq	L316
1370                     ; 499     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1372  00cc 7218534e      	bset	21326,#4
1374  00d0 2004          	jra	L516
1375  00d2               L316:
1376                     ; 504     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1378  00d2 7219534e      	bres	21326,#4
1379  00d6               L516:
1380                     ; 506 }
1383  00d6 81            	ret
1695                     ; 577 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1695                     ; 578 {
1696                     	switch	.text
1697  00d7               _ADC_ChannelCmd:
1699  00d7 89            	pushw	x
1700  00d8 88            	push	a
1701       00000001      OFST:	set	1
1704                     ; 579   uint8_t regindex = 0;
1706  00d9 0f01          	clr	(OFST+0,sp)
1707                     ; 581   assert_param(IS_FUNCTIONAL_STATE(NewState));
1709                     ; 583   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1711  00db 7b06          	ld	a,(OFST+5,sp)
1712  00dd 6b01          	ld	(OFST+0,sp),a
1713                     ; 585   if (NewState != DISABLE)
1715  00df 0d08          	tnz	(OFST+7,sp)
1716  00e1 270f          	jreq	L367
1717                     ; 588     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1719  00e3 01            	rrwa	x,a
1720  00e4 1b01          	add	a,(OFST+0,sp)
1721  00e6 2401          	jrnc	L23
1722  00e8 5c            	incw	x
1723  00e9               L23:
1724  00e9 02            	rlwa	x,a
1725  00ea e60a          	ld	a,(10,x)
1726  00ec 1a07          	or	a,(OFST+6,sp)
1727  00ee e70a          	ld	(10,x),a
1729  00f0 2012          	jra	L567
1730  00f2               L367:
1731                     ; 593     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1733  00f2 7b02          	ld	a,(OFST+1,sp)
1734  00f4 97            	ld	xl,a
1735  00f5 7b03          	ld	a,(OFST+2,sp)
1736  00f7 1b01          	add	a,(OFST+0,sp)
1737  00f9 2401          	jrnc	L43
1738  00fb 5c            	incw	x
1739  00fc               L43:
1740  00fc 02            	rlwa	x,a
1741  00fd 7b07          	ld	a,(OFST+6,sp)
1742  00ff 43            	cpl	a
1743  0100 e40a          	and	a,(10,x)
1744  0102 e70a          	ld	(10,x),a
1745  0104               L567:
1746                     ; 595 }
1749  0104 5b03          	addw	sp,#3
1750  0106 81            	ret
1900                     ; 619 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1900                     ; 620                             ADC_Group_TypeDef ADC_GroupChannels,
1900                     ; 621                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1900                     ; 622 {
1901                     	switch	.text
1902  0107               _ADC_SamplingTimeConfig:
1904  0107 89            	pushw	x
1905       00000000      OFST:	set	0
1908                     ; 624   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1910                     ; 625   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1912                     ; 627   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1914  0108 0d05          	tnz	(OFST+5,sp)
1915  010a 2712          	jreq	L3501
1916                     ; 630     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1918  010c e602          	ld	a,(2,x)
1919  010e a41f          	and	a,#31
1920  0110 e702          	ld	(2,x),a
1921                     ; 631     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1923  0112 7b06          	ld	a,(OFST+6,sp)
1924  0114 4e            	swap	a
1925  0115 48            	sll	a
1926  0116 a4e0          	and	a,#224
1927  0118 ea02          	or	a,(2,x)
1928  011a e702          	ld	(2,x),a
1930  011c 2010          	jra	L5501
1931  011e               L3501:
1932                     ; 636     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1934  011e 1e01          	ldw	x,(OFST+1,sp)
1935  0120 e601          	ld	a,(1,x)
1936  0122 a4f8          	and	a,#248
1937  0124 e701          	ld	(1,x),a
1938                     ; 637     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1940  0126 1e01          	ldw	x,(OFST+1,sp)
1941  0128 e601          	ld	a,(1,x)
1942  012a 1a06          	or	a,(OFST+6,sp)
1943  012c e701          	ld	(1,x),a
1944  012e               L5501:
1945                     ; 639 }
1948  012e 85            	popw	x
1949  012f 81            	ret
2016                     ; 685 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2016                     ; 686                               FunctionalState NewState)
2016                     ; 687 {
2017                     	switch	.text
2018  0130               _ADC_SchmittTriggerConfig:
2020  0130 89            	pushw	x
2021  0131 88            	push	a
2022       00000001      OFST:	set	1
2025                     ; 688   uint8_t regindex = 0;
2027  0132 0f01          	clr	(OFST+0,sp)
2028                     ; 690   assert_param(IS_FUNCTIONAL_STATE(NewState));
2030                     ; 692   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2032  0134 7b06          	ld	a,(OFST+5,sp)
2033  0136 6b01          	ld	(OFST+0,sp),a
2034                     ; 694   if (NewState != DISABLE)
2036  0138 0d08          	tnz	(OFST+7,sp)
2037  013a 2710          	jreq	L3111
2038                     ; 697     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2040  013c 01            	rrwa	x,a
2041  013d 1b01          	add	a,(OFST+0,sp)
2042  013f 2401          	jrnc	L24
2043  0141 5c            	incw	x
2044  0142               L24:
2045  0142 02            	rlwa	x,a
2046  0143 7b07          	ld	a,(OFST+6,sp)
2047  0145 43            	cpl	a
2048  0146 e40e          	and	a,(14,x)
2049  0148 e70e          	ld	(14,x),a
2051  014a 2011          	jra	L5111
2052  014c               L3111:
2053                     ; 702     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2055  014c 7b02          	ld	a,(OFST+1,sp)
2056  014e 97            	ld	xl,a
2057  014f 7b03          	ld	a,(OFST+2,sp)
2058  0151 1b01          	add	a,(OFST+0,sp)
2059  0153 2401          	jrnc	L44
2060  0155 5c            	incw	x
2061  0156               L44:
2062  0156 02            	rlwa	x,a
2063  0157 e60e          	ld	a,(14,x)
2064  0159 1a07          	or	a,(OFST+6,sp)
2065  015b e70e          	ld	(14,x),a
2066  015d               L5111:
2067                     ; 704 }
2070  015d 5b03          	addw	sp,#3
2071  015f 81            	ret
2118                     ; 711 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2118                     ; 712 {
2119                     	switch	.text
2120  0160               _ADC_GetConversionValue:
2122  0160 89            	pushw	x
2123  0161 89            	pushw	x
2124       00000002      OFST:	set	2
2127                     ; 713   uint16_t tmpreg = 0;
2129  0162 5f            	clrw	x
2130  0163 1f01          	ldw	(OFST-1,sp),x
2131                     ; 716   tmpreg = (uint16_t)(ADCx->DRH);
2133  0165 1e03          	ldw	x,(OFST+1,sp)
2134  0167 e604          	ld	a,(4,x)
2135  0169 5f            	clrw	x
2136  016a 97            	ld	xl,a
2137  016b 1f01          	ldw	(OFST-1,sp),x
2138                     ; 717   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2140  016d 1e01          	ldw	x,(OFST-1,sp)
2141  016f 4f            	clr	a
2142  0170 02            	rlwa	x,a
2143  0171 01            	rrwa	x,a
2144  0172 1603          	ldw	y,(OFST+1,sp)
2145  0174 90ea05        	or	a,(5,y)
2146  0177 02            	rlwa	x,a
2147  0178 1f01          	ldw	(OFST-1,sp),x
2148  017a 01            	rrwa	x,a
2149                     ; 720   return (uint16_t)(tmpreg) ;
2151  017b 1e01          	ldw	x,(OFST-1,sp)
2154  017d 5b04          	addw	sp,#4
2155  017f 81            	ret
2202                     ; 754 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2202                     ; 755 {
2203                     	switch	.text
2204  0180               _ADC_DMACmd:
2206  0180 89            	pushw	x
2207       00000000      OFST:	set	0
2210                     ; 757   assert_param(IS_FUNCTIONAL_STATE(NewState));
2212                     ; 759   if (NewState != DISABLE)
2214  0181 0d05          	tnz	(OFST+5,sp)
2215  0183 2708          	jreq	L7611
2216                     ; 762     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2218  0185 e60a          	ld	a,(10,x)
2219  0187 a47f          	and	a,#127
2220  0189 e70a          	ld	(10,x),a
2222  018b 2008          	jra	L1711
2223  018d               L7611:
2224                     ; 767     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2226  018d 1e01          	ldw	x,(OFST+1,sp)
2227  018f e60a          	ld	a,(10,x)
2228  0191 aa80          	or	a,#128
2229  0193 e70a          	ld	(10,x),a
2230  0195               L1711:
2231                     ; 769 }
2234  0195 85            	popw	x
2235  0196 81            	ret
2319                     ; 825 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2319                     ; 826 {
2320                     	switch	.text
2321  0197               _ADC_ITConfig:
2323  0197 89            	pushw	x
2324       00000000      OFST:	set	0
2327                     ; 828   assert_param(IS_FUNCTIONAL_STATE(NewState));
2329                     ; 829   assert_param(IS_ADC_IT(ADC_IT));
2331                     ; 831   if (NewState != DISABLE)
2333  0198 0d06          	tnz	(OFST+6,sp)
2334  019a 2706          	jreq	L5321
2335                     ; 834     ADCx->CR1 |= (uint8_t) ADC_IT;
2337  019c f6            	ld	a,(x)
2338  019d 1a05          	or	a,(OFST+5,sp)
2339  019f f7            	ld	(x),a
2341  01a0 2007          	jra	L7321
2342  01a2               L5321:
2343                     ; 839     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2345  01a2 1e01          	ldw	x,(OFST+1,sp)
2346  01a4 7b05          	ld	a,(OFST+5,sp)
2347  01a6 43            	cpl	a
2348  01a7 f4            	and	a,(x)
2349  01a8 f7            	ld	(x),a
2350  01a9               L7321:
2351                     ; 841 }
2354  01a9 85            	popw	x
2355  01aa 81            	ret
2460                     ; 853 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2460                     ; 854 {
2461                     	switch	.text
2462  01ab               _ADC_GetFlagStatus:
2464  01ab 89            	pushw	x
2465  01ac 88            	push	a
2466       00000001      OFST:	set	1
2469                     ; 855   FlagStatus flagstatus = RESET;
2471  01ad 0f01          	clr	(OFST+0,sp)
2472                     ; 858   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2474                     ; 861   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2476  01af e603          	ld	a,(3,x)
2477  01b1 1506          	bcp	a,(OFST+5,sp)
2478  01b3 2706          	jreq	L3131
2479                     ; 864     flagstatus = SET;
2481  01b5 a601          	ld	a,#1
2482  01b7 6b01          	ld	(OFST+0,sp),a
2484  01b9 2002          	jra	L5131
2485  01bb               L3131:
2486                     ; 869     flagstatus = RESET;
2488  01bb 0f01          	clr	(OFST+0,sp)
2489  01bd               L5131:
2490                     ; 873   return  flagstatus;
2492  01bd 7b01          	ld	a,(OFST+0,sp)
2495  01bf 5b03          	addw	sp,#3
2496  01c1 81            	ret
2543                     ; 886 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2543                     ; 887                    ADC_FLAG_TypeDef ADC_FLAG)
2543                     ; 888 {
2544                     	switch	.text
2545  01c2               _ADC_ClearFlag:
2547  01c2 89            	pushw	x
2548       00000000      OFST:	set	0
2551                     ; 890   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2553                     ; 893   ADCx->SR = (uint8_t)~ADC_FLAG;
2555  01c3 7b05          	ld	a,(OFST+5,sp)
2556  01c5 43            	cpl	a
2557  01c6 1e01          	ldw	x,(OFST+1,sp)
2558  01c8 e703          	ld	(3,x),a
2559                     ; 894 }
2562  01ca 85            	popw	x
2563  01cb 81            	ret
2639                     ; 906 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2639                     ; 907                          ADC_IT_TypeDef ADC_IT)
2639                     ; 908 {
2640                     	switch	.text
2641  01cc               _ADC_GetITStatus:
2643  01cc 89            	pushw	x
2644  01cd 5203          	subw	sp,#3
2645       00000003      OFST:	set	3
2648                     ; 909   ITStatus itstatus = RESET;
2650  01cf 7b03          	ld	a,(OFST+0,sp)
2651  01d1 97            	ld	xl,a
2652                     ; 910   uint8_t itmask = 0, enablestatus = 0;
2654  01d2 7b03          	ld	a,(OFST+0,sp)
2655  01d4 97            	ld	xl,a
2658  01d5 7b02          	ld	a,(OFST-1,sp)
2659  01d7 97            	ld	xl,a
2660                     ; 913   assert_param(IS_ADC_GET_IT(ADC_IT));
2662                     ; 916   itmask = (uint8_t)(ADC_IT >> 3);
2664  01d8 7b08          	ld	a,(OFST+5,sp)
2665  01da 44            	srl	a
2666  01db 44            	srl	a
2667  01dc 44            	srl	a
2668  01dd 6b03          	ld	(OFST+0,sp),a
2669                     ; 917   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2669                     ; 918                                 (uint8_t)(itmask & (uint8_t)0x03));
2671  01df 7b03          	ld	a,(OFST+0,sp)
2672  01e1 a403          	and	a,#3
2673  01e3 6b01          	ld	(OFST-2,sp),a
2674  01e5 7b03          	ld	a,(OFST+0,sp)
2675  01e7 a410          	and	a,#16
2676  01e9 44            	srl	a
2677  01ea 44            	srl	a
2678  01eb 1a01          	or	a,(OFST-2,sp)
2679  01ed 6b03          	ld	(OFST+0,sp),a
2680                     ; 921   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2682  01ef 1e04          	ldw	x,(OFST+1,sp)
2683  01f1 f6            	ld	a,(x)
2684  01f2 1408          	and	a,(OFST+5,sp)
2685  01f4 6b02          	ld	(OFST-1,sp),a
2686                     ; 924   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2688  01f6 1e04          	ldw	x,(OFST+1,sp)
2689  01f8 e603          	ld	a,(3,x)
2690  01fa 1503          	bcp	a,(OFST+0,sp)
2691  01fc 270a          	jreq	L3041
2693  01fe 0d02          	tnz	(OFST-1,sp)
2694  0200 2706          	jreq	L3041
2695                     ; 927     itstatus = SET;
2697  0202 a601          	ld	a,#1
2698  0204 6b03          	ld	(OFST+0,sp),a
2700  0206 2002          	jra	L5041
2701  0208               L3041:
2702                     ; 932     itstatus = RESET;
2704  0208 0f03          	clr	(OFST+0,sp)
2705  020a               L5041:
2706                     ; 936   return  itstatus;
2708  020a 7b03          	ld	a,(OFST+0,sp)
2711  020c 5b05          	addw	sp,#5
2712  020e 81            	ret
2769                     ; 949 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2769                     ; 950                            ADC_IT_TypeDef ADC_IT)
2769                     ; 951 {
2770                     	switch	.text
2771  020f               _ADC_ClearITPendingBit:
2773  020f 89            	pushw	x
2774  0210 89            	pushw	x
2775       00000002      OFST:	set	2
2778                     ; 952   uint8_t itmask = 0;
2780  0211 0f02          	clr	(OFST+0,sp)
2781                     ; 955   assert_param(IS_ADC_IT(ADC_IT));
2783                     ; 958   itmask = (uint8_t)(ADC_IT >> 3);
2785  0213 7b07          	ld	a,(OFST+5,sp)
2786  0215 44            	srl	a
2787  0216 44            	srl	a
2788  0217 44            	srl	a
2789  0218 6b02          	ld	(OFST+0,sp),a
2790                     ; 959   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2790                     ; 960                                  (uint8_t)(itmask & (uint8_t)0x03));
2792  021a 7b02          	ld	a,(OFST+0,sp)
2793  021c a403          	and	a,#3
2794  021e 6b01          	ld	(OFST-1,sp),a
2795  0220 7b02          	ld	a,(OFST+0,sp)
2796  0222 a410          	and	a,#16
2797  0224 44            	srl	a
2798  0225 44            	srl	a
2799  0226 1a01          	or	a,(OFST-1,sp)
2800  0228 6b02          	ld	(OFST+0,sp),a
2801                     ; 963   ADCx->SR = (uint8_t)~itmask;
2803  022a 7b02          	ld	a,(OFST+0,sp)
2804  022c 43            	cpl	a
2805  022d 1e03          	ldw	x,(OFST+1,sp)
2806  022f e703          	ld	(3,x),a
2807                     ; 964 }
2810  0231 5b04          	addw	sp,#4
2811  0233 81            	ret
2824                     	xdef	_ADC_ClearITPendingBit
2825                     	xdef	_ADC_GetITStatus
2826                     	xdef	_ADC_ClearFlag
2827                     	xdef	_ADC_GetFlagStatus
2828                     	xdef	_ADC_ITConfig
2829                     	xdef	_ADC_DMACmd
2830                     	xdef	_ADC_GetConversionValue
2831                     	xdef	_ADC_SchmittTriggerConfig
2832                     	xdef	_ADC_SamplingTimeConfig
2833                     	xdef	_ADC_ChannelCmd
2834                     	xdef	_ADC_VrefintCmd
2835                     	xdef	_ADC_TempSensorCmd
2836                     	xdef	_ADC_AnalogWatchdogConfig
2837                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2838                     	xdef	_ADC_AnalogWatchdogChannelSelect
2839                     	xdef	_ADC_ExternalTrigConfig
2840                     	xdef	_ADC_SoftwareStartConv
2841                     	xdef	_ADC_Cmd
2842                     	xdef	_ADC_Init
2843                     	xdef	_ADC_DeInit
2862                     	end
