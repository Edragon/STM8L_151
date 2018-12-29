   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  43                     ; 115 void LCD_DeInit(void)
  43                     ; 116 {
  45                     	switch	.text
  46  0000               _LCD_DeInit:
  48  0000 88            	push	a
  49       00000001      OFST:	set	1
  52                     ; 117   uint8_t counter = 0;
  54  0001 0f01          	clr	(OFST+0,sp)
  55                     ; 119   LCD->CR1 = LCD_CR1_RESET_VALUE;
  57  0003 725f5400      	clr	21504
  58                     ; 120   LCD->CR2 = LCD_CR2_RESET_VALUE;
  60  0007 725f5401      	clr	21505
  61                     ; 121   LCD->CR3 = LCD_CR3_RESET_VALUE;
  63  000b 725f5402      	clr	21506
  64                     ; 122   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  66  000f 725f5403      	clr	21507
  67                     ; 124   for (counter = 0;counter < 0x05; counter++)
  69  0013 0f01          	clr	(OFST+0,sp)
  70  0015               L72:
  71                     ; 126     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  73  0015 7b01          	ld	a,(OFST+0,sp)
  74  0017 5f            	clrw	x
  75  0018 97            	ld	xl,a
  76  0019 724f5404      	clr	(21508,x)
  77                     ; 124   for (counter = 0;counter < 0x05; counter++)
  79  001d 0c01          	inc	(OFST+0,sp)
  82  001f 7b01          	ld	a,(OFST+0,sp)
  83  0021 a105          	cp	a,#5
  84  0023 25f0          	jrult	L72
  85                     ; 129   for (counter = 0;counter < 0x16; counter++)
  87  0025 0f01          	clr	(OFST+0,sp)
  88  0027               L53:
  89                     ; 131     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
  91  0027 7b01          	ld	a,(OFST+0,sp)
  92  0029 5f            	clrw	x
  93  002a 97            	ld	xl,a
  94  002b 724f540c      	clr	(21516,x)
  95                     ; 129   for (counter = 0;counter < 0x16; counter++)
  97  002f 0c01          	inc	(OFST+0,sp)
 100  0031 7b01          	ld	a,(OFST+0,sp)
 101  0033 a116          	cp	a,#22
 102  0035 25f0          	jrult	L53
 103                     ; 134   LCD->CR4 = LCD_CR4_RESET_VALUE;
 105  0037 725f542f      	clr	21551
 106                     ; 136 }
 109  003b 84            	pop	a
 110  003c 81            	ret
 513                     ; 194 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 513                     ; 195               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 513                     ; 196               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 513                     ; 197 {
 514                     	switch	.text
 515  003d               _LCD_Init:
 517  003d 89            	pushw	x
 518       00000000      OFST:	set	0
 521                     ; 199   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 523                     ; 200   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 525                     ; 201   assert_param(IS_LCD_DUTY(LCD_Duty));
 527                     ; 202   assert_param(IS_LCD_BIAS(LCD_Bias));
 529                     ; 203   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 531                     ; 205   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 533  003e c65403        	ld	a,21507
 534  0041 a40f          	and	a,#15
 535  0043 c75403        	ld	21507,a
 536                     ; 206   LCD->FRQ |= LCD_Prescaler;
 538  0046 9e            	ld	a,xh
 539  0047 ca5403        	or	a,21507
 540  004a c75403        	ld	21507,a
 541                     ; 208   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 543  004d c65403        	ld	a,21507
 544  0050 a4f0          	and	a,#240
 545  0052 c75403        	ld	21507,a
 546                     ; 209   LCD->FRQ |= LCD_Divider;
 548  0055 9f            	ld	a,xl
 549  0056 ca5403        	or	a,21507
 550  0059 c75403        	ld	21507,a
 551                     ; 212   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 553  005c c65400        	ld	a,21504
 554  005f a4f9          	and	a,#249
 555  0061 c75400        	ld	21504,a
 556                     ; 213   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 558  0064 7213542f      	bres	21551,#1
 559                     ; 215   if (LCD_Duty == LCD_Duty_1_8)
 561  0068 7b05          	ld	a,(OFST+5,sp)
 562  006a a120          	cp	a,#32
 563  006c 260f          	jrne	L152
 564                     ; 217     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 566  006e 7b05          	ld	a,(OFST+5,sp)
 567  0070 a4f0          	and	a,#240
 568  0072 4e            	swap	a
 569  0073 a40f          	and	a,#15
 570  0075 ca542f        	or	a,21551
 571  0078 c7542f        	ld	21551,a
 573  007b 200a          	jra	L352
 574  007d               L152:
 575                     ; 221     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 577  007d 7b05          	ld	a,(OFST+5,sp)
 578  007f a40f          	and	a,#15
 579  0081 ca5400        	or	a,21504
 580  0084 c75400        	ld	21504,a
 581  0087               L352:
 582                     ; 225   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 584  0087 72115400      	bres	21504,#0
 585                     ; 226   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 587  008b 7211542f      	bres	21551,#0
 588                     ; 228   if (LCD_Bias == LCD_Bias_1_4)
 590  008f 7b06          	ld	a,(OFST+6,sp)
 591  0091 a110          	cp	a,#16
 592  0093 2619          	jrne	L552
 593                     ; 230     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 595  0095 7b06          	ld	a,(OFST+6,sp)
 596  0097 a40f          	and	a,#15
 597  0099 ca5400        	or	a,21504
 598  009c c75400        	ld	21504,a
 599                     ; 231     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 601  009f 7b06          	ld	a,(OFST+6,sp)
 602  00a1 a4f0          	and	a,#240
 603  00a3 4e            	swap	a
 604  00a4 a40f          	and	a,#15
 605  00a6 ca542f        	or	a,21551
 606  00a9 c7542f        	ld	21551,a
 608  00ac 200a          	jra	L752
 609  00ae               L552:
 610                     ; 235     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 612  00ae 7b06          	ld	a,(OFST+6,sp)
 613  00b0 a40f          	and	a,#15
 614  00b2 ca5400        	or	a,21504
 615  00b5 c75400        	ld	21504,a
 616  00b8               L752:
 617                     ; 238   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 619  00b8 72115401      	bres	21505,#0
 620                     ; 239   LCD->CR2 |= LCD_VoltageSource;
 622  00bc c65401        	ld	a,21505
 623  00bf 1a07          	or	a,(OFST+7,sp)
 624  00c1 c75401        	ld	21505,a
 625                     ; 241 }
 628  00c4 85            	popw	x
 629  00c5 81            	ret
 728                     ; 256 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 728                     ; 257 {
 729                     	switch	.text
 730  00c6               _LCD_PortMaskConfig:
 732  00c6 89            	pushw	x
 733       00000000      OFST:	set	0
 736                     ; 259   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 738                     ; 262   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 740  00c7 9e            	ld	a,xh
 741  00c8 5f            	clrw	x
 742  00c9 97            	ld	xl,a
 743  00ca 7b02          	ld	a,(OFST+2,sp)
 744  00cc d75404        	ld	(21508,x),a
 745                     ; 264 }
 748  00cf 85            	popw	x
 749  00d0 81            	ret
 804                     ; 273 void LCD_Cmd(FunctionalState NewState)
 804                     ; 274 {
 805                     	switch	.text
 806  00d1               _LCD_Cmd:
 810                     ; 276   assert_param(IS_FUNCTIONAL_STATE(NewState));
 812                     ; 278   if (NewState != DISABLE)
 814  00d1 4d            	tnz	a
 815  00d2 2706          	jreq	L153
 816                     ; 280     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 818  00d4 721c5402      	bset	21506,#6
 820  00d8 2004          	jra	L353
 821  00da               L153:
 822                     ; 284     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 824  00da 721d5402      	bres	21506,#6
 825  00de               L353:
 826                     ; 286 }
 829  00de 81            	ret
 864                     ; 299 void LCD_HighDriveCmd(FunctionalState NewState)
 864                     ; 300 {
 865                     	switch	.text
 866  00df               _LCD_HighDriveCmd:
 870                     ; 302   assert_param(IS_FUNCTIONAL_STATE(NewState));
 872                     ; 304   if (NewState != DISABLE)
 874  00df 4d            	tnz	a
 875  00e0 2706          	jreq	L373
 876                     ; 306     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 878  00e2 72185401      	bset	21505,#4
 880  00e6 2004          	jra	L573
 881  00e8               L373:
 882                     ; 310     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 884  00e8 72195401      	bres	21505,#4
 885  00ec               L573:
 886                     ; 312 }
 889  00ec 81            	ret
 996                     ; 329 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
 996                     ; 330 {
 997                     	switch	.text
 998  00ed               _LCD_PulseOnDurationConfig:
1000  00ed 88            	push	a
1001       00000000      OFST:	set	0
1004                     ; 332   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1006                     ; 334   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1008  00ee c65401        	ld	a,21505
1009  00f1 a41f          	and	a,#31
1010  00f3 c75401        	ld	21505,a
1011                     ; 335   LCD->CR2 |= LCD_PulseOnDuration;
1013  00f6 c65401        	ld	a,21505
1014  00f9 1a01          	or	a,(OFST+1,sp)
1015  00fb c75401        	ld	21505,a
1016                     ; 336 }
1019  00fe 84            	pop	a
1020  00ff 81            	ret
1117                     ; 352 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1117                     ; 353 {
1118                     	switch	.text
1119  0100               _LCD_DeadTimeConfig:
1121  0100 88            	push	a
1122       00000000      OFST:	set	0
1125                     ; 355   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1127                     ; 357   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1129  0101 c65402        	ld	a,21506
1130  0104 a4f8          	and	a,#248
1131  0106 c75402        	ld	21506,a
1132                     ; 359   LCD->CR3 |= LCD_DeadTime;
1134  0109 c65402        	ld	a,21506
1135  010c 1a01          	or	a,(OFST+1,sp)
1136  010e c75402        	ld	21506,a
1137                     ; 361 }
1140  0111 84            	pop	a
1141  0112 81            	ret
1293                     ; 385 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1293                     ; 386 {
1294                     	switch	.text
1295  0113               _LCD_BlinkConfig:
1299                     ; 388   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1301                     ; 389   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1303                     ; 391   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1305  0113 c65400        	ld	a,21504
1306  0116 a43f          	and	a,#63
1307  0118 c75400        	ld	21504,a
1308                     ; 392   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1310  011b 9e            	ld	a,xh
1311  011c ca5400        	or	a,21504
1312  011f c75400        	ld	21504,a
1313                     ; 394   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1315  0122 c65400        	ld	a,21504
1316  0125 a4c7          	and	a,#199
1317  0127 c75400        	ld	21504,a
1318                     ; 395   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1320  012a 9f            	ld	a,xl
1321  012b ca5400        	or	a,21504
1322  012e c75400        	ld	21504,a
1323                     ; 397 }
1326  0131 81            	ret
1431                     ; 413 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1431                     ; 414 {
1432                     	switch	.text
1433  0132               _LCD_ContrastConfig:
1435  0132 88            	push	a
1436       00000000      OFST:	set	0
1439                     ; 416   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1441                     ; 418   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1443  0133 c65401        	ld	a,21505
1444  0136 a4f1          	and	a,#241
1445  0138 c75401        	ld	21505,a
1446                     ; 419   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1448  013b c65401        	ld	a,21505
1449  013e 1a01          	or	a,(OFST+1,sp)
1450  0140 c75401        	ld	21505,a
1451                     ; 421 }
1454  0143 84            	pop	a
1455  0144 81            	ret
1659                     ; 468 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1659                     ; 469 {
1660                     	switch	.text
1661  0145               _LCD_WriteRAM:
1663  0145 89            	pushw	x
1664       00000000      OFST:	set	0
1667                     ; 471   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1669                     ; 474   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1671  0146 9e            	ld	a,xh
1672  0147 5f            	clrw	x
1673  0148 97            	ld	xl,a
1674  0149 7b02          	ld	a,(OFST+2,sp)
1675  014b d7540c        	ld	(21516,x),a
1676                     ; 476 }
1679  014e 85            	popw	x
1680  014f 81            	ret
1737                     ; 486 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1737                     ; 487 {
1738                     	switch	.text
1739  0150               _LCD_PageSelect:
1743                     ; 489   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1745                     ; 491   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1747  0150 7215542f      	bres	21551,#2
1748                     ; 492   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1750  0154 ca542f        	or	a,21551
1751  0157 c7542f        	ld	21551,a
1752                     ; 494 }
1755  015a 81            	ret
1790                     ; 519 void LCD_ITConfig(FunctionalState NewState)
1790                     ; 520 {
1791                     	switch	.text
1792  015b               _LCD_ITConfig:
1796                     ; 522   assert_param(IS_FUNCTIONAL_STATE(NewState));
1798                     ; 524   if (NewState != DISABLE)
1800  015b 4d            	tnz	a
1801  015c 2706          	jreq	L577
1802                     ; 526     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1804  015e 721a5402      	bset	21506,#5
1806  0162 2004          	jra	L777
1807  0164               L577:
1808                     ; 530     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1810  0164 721b5402      	bres	21506,#5
1811  0168               L777:
1812                     ; 533 }
1815  0168 81            	ret
1871                     ; 540 FlagStatus LCD_GetFlagStatus(void)
1871                     ; 541 {
1872                     	switch	.text
1873  0169               _LCD_GetFlagStatus:
1875  0169 88            	push	a
1876       00000001      OFST:	set	1
1879                     ; 542   FlagStatus status = RESET;
1881  016a 0f01          	clr	(OFST+0,sp)
1882                     ; 545   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1884  016c c65402        	ld	a,21506
1885  016f a510          	bcp	a,#16
1886  0171 2706          	jreq	L7201
1887                     ; 547     status = SET; /* Flag is set */
1889  0173 a601          	ld	a,#1
1890  0175 6b01          	ld	(OFST+0,sp),a
1892  0177 2002          	jra	L1301
1893  0179               L7201:
1894                     ; 551     status = RESET; /* Flag is reset*/
1896  0179 0f01          	clr	(OFST+0,sp)
1897  017b               L1301:
1898                     ; 554   return status;
1900  017b 7b01          	ld	a,(OFST+0,sp)
1903  017d 5b01          	addw	sp,#1
1904  017f 81            	ret
1927                     ; 563 void LCD_ClearFlag(void)
1927                     ; 564 {
1928                     	switch	.text
1929  0180               _LCD_ClearFlag:
1933                     ; 566   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1935  0180 72165402      	bset	21506,#3
1936                     ; 568 }
1939  0184 81            	ret
1984                     ; 576 ITStatus LCD_GetITStatus(void)
1984                     ; 577 {
1985                     	switch	.text
1986  0185               _LCD_GetITStatus:
1988  0185 88            	push	a
1989       00000001      OFST:	set	1
1992                     ; 578   ITStatus pendingbitstatus = RESET;
1994  0186 7b01          	ld	a,(OFST+0,sp)
1995  0188 97            	ld	xl,a
1996                     ; 579   uint8_t enablestatus = 0;
1998  0189 7b01          	ld	a,(OFST+0,sp)
1999  018b 97            	ld	xl,a
2000                     ; 581   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
2002  018c c65402        	ld	a,21506
2003  018f a420          	and	a,#32
2004  0191 6b01          	ld	(OFST+0,sp),a
2005                     ; 583   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
2007  0193 c65402        	ld	a,21506
2008  0196 a510          	bcp	a,#16
2009  0198 270a          	jreq	L5601
2011  019a 0d01          	tnz	(OFST+0,sp)
2012  019c 2706          	jreq	L5601
2013                     ; 586     pendingbitstatus = SET;
2015  019e a601          	ld	a,#1
2016  01a0 6b01          	ld	(OFST+0,sp),a
2018  01a2 2002          	jra	L7601
2019  01a4               L5601:
2020                     ; 591     pendingbitstatus = RESET;
2022  01a4 0f01          	clr	(OFST+0,sp)
2023  01a6               L7601:
2024                     ; 594   return  pendingbitstatus;
2026  01a6 7b01          	ld	a,(OFST+0,sp)
2029  01a8 5b01          	addw	sp,#1
2030  01aa 81            	ret
2054                     ; 603 void LCD_ClearITPendingBit(void)
2054                     ; 604 {
2055                     	switch	.text
2056  01ab               _LCD_ClearITPendingBit:
2060                     ; 606   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2062  01ab 72165402      	bset	21506,#3
2063                     ; 608 }
2066  01af 81            	ret
2079                     	xdef	_LCD_ClearITPendingBit
2080                     	xdef	_LCD_GetITStatus
2081                     	xdef	_LCD_ClearFlag
2082                     	xdef	_LCD_GetFlagStatus
2083                     	xdef	_LCD_ITConfig
2084                     	xdef	_LCD_PageSelect
2085                     	xdef	_LCD_WriteRAM
2086                     	xdef	_LCD_ContrastConfig
2087                     	xdef	_LCD_BlinkConfig
2088                     	xdef	_LCD_DeadTimeConfig
2089                     	xdef	_LCD_PulseOnDurationConfig
2090                     	xdef	_LCD_HighDriveCmd
2091                     	xdef	_LCD_Cmd
2092                     	xdef	_LCD_PortMaskConfig
2093                     	xdef	_LCD_Init
2094                     	xdef	_LCD_DeInit
2113                     	end
