   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     .const:	section	.text
   5  0000               _SYSDivFactor:
   6  0000 01            	dc.b	1
   7  0001 02            	dc.b	2
   8  0002 04            	dc.b	4
   9  0003 08            	dc.b	8
  10  0004 10            	dc.b	16
  39                     ; 114 void CLK_DeInit(void)
  39                     ; 115 {
  41                     	switch	.text
  42  0000               _CLK_DeInit:
  46                     ; 116   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  48  0000 351150c2      	mov	20674,#17
  49                     ; 117   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  51  0004 725f50c6      	clr	20678
  52                     ; 118   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  54  0008 725f50c1      	clr	20673
  55                     ; 119   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  57  000c 725f50cb      	clr	20683
  58                     ; 120   CLK->SWR  = CLK_SWR_RESET_VALUE;
  60  0010 350150c8      	mov	20680,#1
  61                     ; 121   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  63  0014 725f50c9      	clr	20681
  64                     ; 122   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  66  0018 350350c0      	mov	20672,#3
  67                     ; 123   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  69  001c 725f50c3      	clr	20675
  70                     ; 124   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  72  0020 358050c4      	mov	20676,#128
  73                     ; 125   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  75  0024 725f50d0      	clr	20688
  76                     ; 126   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  78  0028 725f50ca      	clr	20682
  79                     ; 127   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  81  002c 725f50c5      	clr	20677
  82                     ; 128   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  84  0030 725f50cd      	clr	20685
  85                     ; 129   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  87  0034 725f50cc      	clr	20684
  88                     ; 130   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
  90  0038 725f50ce      	clr	20686
  91                     ; 131   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
  93  003c 35b950cf      	mov	20687,#185
  94                     ; 132 }
  97  0040 81            	ret
 152                     ; 154 void CLK_HSICmd(FunctionalState NewState)
 152                     ; 155 {
 153                     	switch	.text
 154  0041               _CLK_HSICmd:
 158                     ; 157   assert_param(IS_FUNCTIONAL_STATE(NewState));
 160                     ; 159   if (NewState != DISABLE)
 162  0041 4d            	tnz	a
 163  0042 2706          	jreq	L74
 164                     ; 162     CLK->ICKCR |= CLK_ICKCR_HSION;
 166  0044 721050c2      	bset	20674,#0
 168  0048 2004          	jra	L15
 169  004a               L74:
 170                     ; 167     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 172  004a 721150c2      	bres	20674,#0
 173  004e               L15:
 174                     ; 169 }
 177  004e 81            	ret
 213                     ; 182 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 213                     ; 183 {
 214                     	switch	.text
 215  004f               _CLK_AdjustHSICalibrationValue:
 219                     ; 185   CLK->HSIUNLCKR = 0xAC;
 221  004f 35ac50ce      	mov	20686,#172
 222                     ; 186   CLK->HSIUNLCKR = 0x35;
 224  0053 353550ce      	mov	20686,#53
 225                     ; 189   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 227  0057 c750cd        	ld	20685,a
 228                     ; 190 }
 231  005a 81            	ret
 266                     ; 206 void CLK_LSICmd(FunctionalState NewState)
 266                     ; 207 {
 267                     	switch	.text
 268  005b               _CLK_LSICmd:
 272                     ; 210   assert_param(IS_FUNCTIONAL_STATE(NewState));
 274                     ; 212   if (NewState != DISABLE)
 276  005b 4d            	tnz	a
 277  005c 2706          	jreq	L701
 278                     ; 215     CLK->ICKCR |= CLK_ICKCR_LSION;
 280  005e 721450c2      	bset	20674,#2
 282  0062 2004          	jra	L111
 283  0064               L701:
 284                     ; 220     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 286  0064 721550c2      	bres	20674,#2
 287  0068               L111:
 288                     ; 222 }
 291  0068 81            	ret
 353                     ; 243 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 353                     ; 244 {
 354                     	switch	.text
 355  0069               _CLK_HSEConfig:
 359                     ; 246   assert_param(IS_CLK_HSE(CLK_HSE));
 361                     ; 250   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 363  0069 721150c6      	bres	20678,#0
 364                     ; 253   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 366  006d 721950c6      	bres	20678,#4
 367                     ; 256   CLK->ECKCR |= (uint8_t)CLK_HSE;
 369  0071 ca50c6        	or	a,20678
 370  0074 c750c6        	ld	20678,a
 371                     ; 257 }
 374  0077 81            	ret
 436                     ; 274 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 436                     ; 275 {
 437                     	switch	.text
 438  0078               _CLK_LSEConfig:
 442                     ; 277   assert_param(IS_CLK_LSE(CLK_LSE));
 444                     ; 281   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 446  0078 721550c6      	bres	20678,#2
 447                     ; 284   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 449  007c 721b50c6      	bres	20678,#5
 450                     ; 287   CLK->ECKCR |= (uint8_t)CLK_LSE;
 452  0080 ca50c6        	or	a,20678
 453  0083 c750c6        	ld	20678,a
 454                     ; 289 }
 457  0086 81            	ret
 481                     ; 300 void CLK_ClockSecuritySystemEnable(void)
 481                     ; 301 {
 482                     	switch	.text
 483  0087               _CLK_ClockSecuritySystemEnable:
 487                     ; 303   CLK->CSSR |= CLK_CSSR_CSSEN;
 489  0087 721050ca      	bset	20682,#0
 490                     ; 304 }
 493  008b 81            	ret
 529                     ; 311 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 529                     ; 312 {
 530                     	switch	.text
 531  008c               _CLK_ClockSecuritySytemDeglitchCmd:
 535                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 537                     ; 316   if (NewState != DISABLE)
 539  008c 4d            	tnz	a
 540  008d 2706          	jreq	L122
 541                     ; 319     CLK->CSSR |= CLK_CSSR_CSSDGON;
 543  008f 721850ca      	bset	20682,#4
 545  0093 2004          	jra	L322
 546  0095               L122:
 547                     ; 324     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 549  0095 721950ca      	bres	20682,#4
 550  0099               L322:
 551                     ; 326 }
 554  0099 81            	ret
 695                     ; 350 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 695                     ; 351 {
 696                     	switch	.text
 697  009a               _CLK_CCOConfig:
 699  009a 89            	pushw	x
 700       00000000      OFST:	set	0
 703                     ; 353   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 705                     ; 354   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 707                     ; 357   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 709  009b 9f            	ld	a,xl
 710  009c 1a01          	or	a,(OFST+1,sp)
 711  009e c750c5        	ld	20677,a
 712                     ; 358 }
 715  00a1 85            	popw	x
 716  00a2 81            	ret
 790                     ; 410 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 790                     ; 411 {
 791                     	switch	.text
 792  00a3               _CLK_SYSCLKSourceConfig:
 796                     ; 413   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 798                     ; 416   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 800  00a3 c750c8        	ld	20680,a
 801                     ; 417 }
 804  00a6 81            	ret
 829                     ; 429 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 829                     ; 430 {
 830                     	switch	.text
 831  00a7               _CLK_GetSYSCLKSource:
 835                     ; 431   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 837  00a7 c650c7        	ld	a,20679
 840  00aa 81            	ret
 912                     ; 472 uint32_t CLK_GetClockFreq(void)
 912                     ; 473 {
 913                     	switch	.text
 914  00ab               _CLK_GetClockFreq:
 916  00ab 5209          	subw	sp,#9
 917       00000009      OFST:	set	9
 920                     ; 474   uint32_t clockfrequency = 0;
 922  00ad 96            	ldw	x,sp
 923  00ae 1c0005        	addw	x,#OFST-4
 924  00b1 cd0000        	call	c_ltor
 926                     ; 475   uint32_t sourcefrequency = 0;
 928  00b4 ae0000        	ldw	x,#0
 929  00b7 1f07          	ldw	(OFST-2,sp),x
 930  00b9 ae0000        	ldw	x,#0
 931  00bc 1f05          	ldw	(OFST-4,sp),x
 932                     ; 476   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 934  00be 7b09          	ld	a,(OFST+0,sp)
 935  00c0 97            	ld	xl,a
 936                     ; 477   uint8_t tmp = 0, presc = 0;
 938  00c1 7b09          	ld	a,(OFST+0,sp)
 939  00c3 97            	ld	xl,a
 942  00c4 7b09          	ld	a,(OFST+0,sp)
 943  00c6 97            	ld	xl,a
 944                     ; 480   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 946  00c7 c650c7        	ld	a,20679
 947  00ca 6b09          	ld	(OFST+0,sp),a
 948                     ; 482   if ( clocksource == CLK_SYSCLKSource_HSI)
 950  00cc 7b09          	ld	a,(OFST+0,sp)
 951  00ce a101          	cp	a,#1
 952  00d0 260c          	jrne	L704
 953                     ; 484     sourcefrequency = HSI_VALUE;
 955  00d2 ae2400        	ldw	x,#9216
 956  00d5 1f07          	ldw	(OFST-2,sp),x
 957  00d7 ae00f4        	ldw	x,#244
 958  00da 1f05          	ldw	(OFST-4,sp),x
 960  00dc 202b          	jra	L114
 961  00de               L704:
 962                     ; 486   else if ( clocksource == CLK_SYSCLKSource_LSI)
 964  00de 7b09          	ld	a,(OFST+0,sp)
 965  00e0 a102          	cp	a,#2
 966  00e2 260c          	jrne	L314
 967                     ; 488     sourcefrequency = LSI_VALUE;
 969  00e4 ae9470        	ldw	x,#38000
 970  00e7 1f07          	ldw	(OFST-2,sp),x
 971  00e9 ae0000        	ldw	x,#0
 972  00ec 1f05          	ldw	(OFST-4,sp),x
 974  00ee 2019          	jra	L114
 975  00f0               L314:
 976                     ; 490   else if ( clocksource == CLK_SYSCLKSource_HSE)
 978  00f0 7b09          	ld	a,(OFST+0,sp)
 979  00f2 a104          	cp	a,#4
 980  00f4 260c          	jrne	L714
 981                     ; 492     sourcefrequency = HSE_VALUE;
 983  00f6 ae2400        	ldw	x,#9216
 984  00f9 1f07          	ldw	(OFST-2,sp),x
 985  00fb ae00f4        	ldw	x,#244
 986  00fe 1f05          	ldw	(OFST-4,sp),x
 988  0100 2007          	jra	L114
 989  0102               L714:
 990                     ; 496     clockfrequency = LSE_VALUE;
 992  0102 96            	ldw	x,sp
 993  0103 1c0005        	addw	x,#OFST-4
 994  0106 cd0000        	call	c_ltor
 996  0109               L114:
 997                     ; 500   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 999  0109 c650c0        	ld	a,20672
1000  010c a407          	and	a,#7
1001  010e 6b09          	ld	(OFST+0,sp),a
1002                     ; 501   presc = SYSDivFactor[tmp];
1004  0110 7b09          	ld	a,(OFST+0,sp)
1005  0112 5f            	clrw	x
1006  0113 97            	ld	xl,a
1007  0114 d60000        	ld	a,(_SYSDivFactor,x)
1008  0117 6b09          	ld	(OFST+0,sp),a
1009                     ; 504   clockfrequency = sourcefrequency / presc;
1011  0119 7b09          	ld	a,(OFST+0,sp)
1012  011b b703          	ld	c_lreg+3,a
1013  011d 3f02          	clr	c_lreg+2
1014  011f 3f01          	clr	c_lreg+1
1015  0121 3f00          	clr	c_lreg
1016  0123 96            	ldw	x,sp
1017  0124 1c0001        	addw	x,#OFST-8
1018  0127 cd0000        	call	c_rtol
1020  012a 96            	ldw	x,sp
1021  012b 1c0005        	addw	x,#OFST-4
1022  012e cd0000        	call	c_ltor
1024  0131 96            	ldw	x,sp
1025  0132 1c0001        	addw	x,#OFST-8
1026  0135 cd0000        	call	c_ludv
1028  0138 96            	ldw	x,sp
1029  0139 1c0005        	addw	x,#OFST-4
1030  013c cd0000        	call	c_rtol
1032                     ; 506   return((uint32_t)clockfrequency);
1034  013f 96            	ldw	x,sp
1035  0140 1c0005        	addw	x,#OFST-4
1036  0143 cd0000        	call	c_ltor
1040  0146 5b09          	addw	sp,#9
1041  0148 81            	ret
1139                     ; 522 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1139                     ; 523 {
1140                     	switch	.text
1141  0149               _CLK_SYSCLKDivConfig:
1145                     ; 525   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1147                     ; 527   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1149  0149 c750c0        	ld	20672,a
1150                     ; 528 }
1153  014c 81            	ret
1189                     ; 535 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1189                     ; 536 {
1190                     	switch	.text
1191  014d               _CLK_SYSCLKSourceSwitchCmd:
1195                     ; 538   assert_param(IS_FUNCTIONAL_STATE(NewState));
1197                     ; 540   if (NewState != DISABLE)
1199  014d 4d            	tnz	a
1200  014e 2706          	jreq	L305
1201                     ; 543     CLK->SWCR |= CLK_SWCR_SWEN;
1203  0150 721250c9      	bset	20681,#1
1205  0154 2004          	jra	L505
1206  0156               L305:
1207                     ; 548     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1209  0156 721350c9      	bres	20681,#1
1210  015a               L505:
1211                     ; 550 }
1214  015a 81            	ret
1360                     ; 610 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1360                     ; 611 {
1361                     	switch	.text
1362  015b               _CLK_RTCClockConfig:
1364  015b 89            	pushw	x
1365       00000000      OFST:	set	0
1368                     ; 613   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1370                     ; 614   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1372                     ; 617   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1374  015c 9f            	ld	a,xl
1375  015d 1a01          	or	a,(OFST+1,sp)
1376  015f c750c1        	ld	20673,a
1377                     ; 618 }
1380  0162 85            	popw	x
1381  0163 81            	ret
1447                     ; 629 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1447                     ; 630 {
1448                     	switch	.text
1449  0164               _CLK_BEEPClockConfig:
1453                     ; 632   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1455                     ; 635   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1457  0164 c750cb        	ld	20683,a
1458                     ; 637 }
1461  0167 81            	ret
1686                     ; 671 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1686                     ; 672 {
1687                     	switch	.text
1688  0168               _CLK_PeripheralClockConfig:
1690  0168 89            	pushw	x
1691  0169 88            	push	a
1692       00000001      OFST:	set	1
1695                     ; 673   uint8_t reg = 0;
1697  016a 0f01          	clr	(OFST+0,sp)
1698                     ; 676   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1700                     ; 677   assert_param(IS_FUNCTIONAL_STATE(NewState));
1702                     ; 680   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1704  016c 9e            	ld	a,xh
1705  016d a4f0          	and	a,#240
1706  016f 6b01          	ld	(OFST+0,sp),a
1707                     ; 682   if ( reg == 0x00)
1709  0171 0d01          	tnz	(OFST+0,sp)
1710  0173 2635          	jrne	L527
1711                     ; 684     if (NewState != DISABLE)
1713  0175 0d03          	tnz	(OFST+2,sp)
1714  0177 2719          	jreq	L727
1715                     ; 687       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1717  0179 7b02          	ld	a,(OFST+1,sp)
1718  017b a40f          	and	a,#15
1719  017d 5f            	clrw	x
1720  017e 97            	ld	xl,a
1721  017f a601          	ld	a,#1
1722  0181 5d            	tnzw	x
1723  0182 2704          	jreq	L64
1724  0184               L05:
1725  0184 48            	sll	a
1726  0185 5a            	decw	x
1727  0186 26fc          	jrne	L05
1728  0188               L64:
1729  0188 ca50c3        	or	a,20675
1730  018b c750c3        	ld	20675,a
1732  018e ac140214      	jpf	L337
1733  0192               L727:
1734                     ; 692       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1736  0192 7b02          	ld	a,(OFST+1,sp)
1737  0194 a40f          	and	a,#15
1738  0196 5f            	clrw	x
1739  0197 97            	ld	xl,a
1740  0198 a601          	ld	a,#1
1741  019a 5d            	tnzw	x
1742  019b 2704          	jreq	L25
1743  019d               L45:
1744  019d 48            	sll	a
1745  019e 5a            	decw	x
1746  019f 26fc          	jrne	L45
1747  01a1               L25:
1748  01a1 43            	cpl	a
1749  01a2 c450c3        	and	a,20675
1750  01a5 c750c3        	ld	20675,a
1751  01a8 206a          	jra	L337
1752  01aa               L527:
1753                     ; 695   else if (reg == 0x10)
1755  01aa 7b01          	ld	a,(OFST+0,sp)
1756  01ac a110          	cp	a,#16
1757  01ae 2633          	jrne	L537
1758                     ; 697     if (NewState != DISABLE)
1760  01b0 0d03          	tnz	(OFST+2,sp)
1761  01b2 2717          	jreq	L737
1762                     ; 700       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1764  01b4 7b02          	ld	a,(OFST+1,sp)
1765  01b6 a40f          	and	a,#15
1766  01b8 5f            	clrw	x
1767  01b9 97            	ld	xl,a
1768  01ba a601          	ld	a,#1
1769  01bc 5d            	tnzw	x
1770  01bd 2704          	jreq	L65
1771  01bf               L06:
1772  01bf 48            	sll	a
1773  01c0 5a            	decw	x
1774  01c1 26fc          	jrne	L06
1775  01c3               L65:
1776  01c3 ca50c4        	or	a,20676
1777  01c6 c750c4        	ld	20676,a
1779  01c9 2049          	jra	L337
1780  01cb               L737:
1781                     ; 705       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1783  01cb 7b02          	ld	a,(OFST+1,sp)
1784  01cd a40f          	and	a,#15
1785  01cf 5f            	clrw	x
1786  01d0 97            	ld	xl,a
1787  01d1 a601          	ld	a,#1
1788  01d3 5d            	tnzw	x
1789  01d4 2704          	jreq	L26
1790  01d6               L46:
1791  01d6 48            	sll	a
1792  01d7 5a            	decw	x
1793  01d8 26fc          	jrne	L46
1794  01da               L26:
1795  01da 43            	cpl	a
1796  01db c450c4        	and	a,20676
1797  01de c750c4        	ld	20676,a
1798  01e1 2031          	jra	L337
1799  01e3               L537:
1800                     ; 710     if (NewState != DISABLE)
1802  01e3 0d03          	tnz	(OFST+2,sp)
1803  01e5 2717          	jreq	L547
1804                     ; 713       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1806  01e7 7b02          	ld	a,(OFST+1,sp)
1807  01e9 a40f          	and	a,#15
1808  01eb 5f            	clrw	x
1809  01ec 97            	ld	xl,a
1810  01ed a601          	ld	a,#1
1811  01ef 5d            	tnzw	x
1812  01f0 2704          	jreq	L66
1813  01f2               L07:
1814  01f2 48            	sll	a
1815  01f3 5a            	decw	x
1816  01f4 26fc          	jrne	L07
1817  01f6               L66:
1818  01f6 ca50d0        	or	a,20688
1819  01f9 c750d0        	ld	20688,a
1821  01fc 2016          	jra	L337
1822  01fe               L547:
1823                     ; 718       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1825  01fe 7b02          	ld	a,(OFST+1,sp)
1826  0200 a40f          	and	a,#15
1827  0202 5f            	clrw	x
1828  0203 97            	ld	xl,a
1829  0204 a601          	ld	a,#1
1830  0206 5d            	tnzw	x
1831  0207 2704          	jreq	L27
1832  0209               L47:
1833  0209 48            	sll	a
1834  020a 5a            	decw	x
1835  020b 26fc          	jrne	L47
1836  020d               L27:
1837  020d 43            	cpl	a
1838  020e c450d0        	and	a,20688
1839  0211 c750d0        	ld	20688,a
1840  0214               L337:
1841                     ; 721 }
1844  0214 5b03          	addw	sp,#3
1845  0216 81            	ret
1869                     ; 759 void CLK_LSEClockSecuritySystemEnable(void)
1869                     ; 760 {
1870                     	switch	.text
1871  0217               _CLK_LSEClockSecuritySystemEnable:
1875                     ; 762   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1877  0217 72105190      	bset	20880,#0
1878                     ; 763 }
1881  021b 81            	ret
1905                     ; 771 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1905                     ; 772 {
1906                     	switch	.text
1907  021c               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1911                     ; 774   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1913  021c 72125190      	bset	20880,#1
1914                     ; 775 }
1917  0220 81            	ret
1992                     ; 801 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1992                     ; 802 {
1993                     	switch	.text
1994  0221               _CLK_HaltConfig:
1996  0221 89            	pushw	x
1997       00000000      OFST:	set	0
2000                     ; 804   assert_param(IS_CLK_HALT(CLK_Halt));
2002                     ; 805   assert_param(IS_FUNCTIONAL_STATE(NewState));
2004                     ; 807   if (NewState != DISABLE)
2006  0222 9f            	ld	a,xl
2007  0223 4d            	tnz	a
2008  0224 2709          	jreq	L5201
2009                     ; 809     CLK->ICKCR |= (uint8_t)(CLK_Halt);
2011  0226 9e            	ld	a,xh
2012  0227 ca50c2        	or	a,20674
2013  022a c750c2        	ld	20674,a
2015  022d 2009          	jra	L7201
2016  022f               L5201:
2017                     ; 813     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2019  022f 7b01          	ld	a,(OFST+1,sp)
2020  0231 43            	cpl	a
2021  0232 c450c2        	and	a,20674
2022  0235 c750c2        	ld	20674,a
2023  0238               L7201:
2024                     ; 815 }
2027  0238 85            	popw	x
2028  0239 81            	ret
2064                     ; 825 void CLK_MainRegulatorCmd(FunctionalState NewState)
2064                     ; 826 {
2065                     	switch	.text
2066  023a               _CLK_MainRegulatorCmd:
2070                     ; 828   assert_param(IS_FUNCTIONAL_STATE(NewState));
2072                     ; 830   if (NewState != DISABLE)
2074  023a 4d            	tnz	a
2075  023b 2706          	jreq	L7401
2076                     ; 833     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2078  023d 721350cf      	bres	20687,#1
2080  0241 2004          	jra	L1501
2081  0243               L7401:
2082                     ; 838     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2084  0243 721250cf      	bset	20687,#1
2085  0247               L1501:
2086                     ; 840 }
2089  0247 81            	ret
2161                     ; 869 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2161                     ; 870 {
2162                     	switch	.text
2163  0248               _CLK_ITConfig:
2165  0248 89            	pushw	x
2166       00000000      OFST:	set	0
2169                     ; 873   assert_param(IS_CLK_IT(CLK_IT));
2171                     ; 874   assert_param(IS_FUNCTIONAL_STATE(NewState));
2173                     ; 876   if (NewState != DISABLE)
2175  0249 9f            	ld	a,xl
2176  024a 4d            	tnz	a
2177  024b 271d          	jreq	L7011
2178                     ; 878     if (CLK_IT == CLK_IT_SWIF)
2180  024d 9e            	ld	a,xh
2181  024e a11c          	cp	a,#28
2182  0250 2606          	jrne	L1111
2183                     ; 881       CLK->SWCR |= CLK_SWCR_SWIEN;
2185  0252 721450c9      	bset	20681,#2
2187  0256 202e          	jra	L1211
2188  0258               L1111:
2189                     ; 883     else if (CLK_IT == CLK_IT_LSECSSF)
2191  0258 7b01          	ld	a,(OFST+1,sp)
2192  025a a12c          	cp	a,#44
2193  025c 2606          	jrne	L5111
2194                     ; 886       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2196  025e 72145190      	bset	20880,#2
2198  0262 2022          	jra	L1211
2199  0264               L5111:
2200                     ; 891       CLK->CSSR |= CLK_CSSR_CSSDIE;
2202  0264 721450ca      	bset	20682,#2
2203  0268 201c          	jra	L1211
2204  026a               L7011:
2205                     ; 896     if (CLK_IT == CLK_IT_SWIF)
2207  026a 7b01          	ld	a,(OFST+1,sp)
2208  026c a11c          	cp	a,#28
2209  026e 2606          	jrne	L3211
2210                     ; 899       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2212  0270 721550c9      	bres	20681,#2
2214  0274 2010          	jra	L1211
2215  0276               L3211:
2216                     ; 901     else if (CLK_IT == CLK_IT_LSECSSF)
2218  0276 7b01          	ld	a,(OFST+1,sp)
2219  0278 a12c          	cp	a,#44
2220  027a 2606          	jrne	L7211
2221                     ; 904       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2223  027c 72155190      	bres	20880,#2
2225  0280 2004          	jra	L1211
2226  0282               L7211:
2227                     ; 909       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2229  0282 721550ca      	bres	20682,#2
2230  0286               L1211:
2231                     ; 912 }
2234  0286 85            	popw	x
2235  0287 81            	ret
2458                     ; 939 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2458                     ; 940 {
2459                     	switch	.text
2460  0288               _CLK_GetFlagStatus:
2462  0288 88            	push	a
2463  0289 89            	pushw	x
2464       00000002      OFST:	set	2
2467                     ; 941   uint8_t reg = 0;
2469  028a 7b02          	ld	a,(OFST+0,sp)
2470  028c 97            	ld	xl,a
2471                     ; 942   uint8_t pos = 0;
2473  028d 7b01          	ld	a,(OFST-1,sp)
2474  028f 97            	ld	xl,a
2475                     ; 943   FlagStatus bitstatus = RESET;
2477  0290 7b02          	ld	a,(OFST+0,sp)
2478  0292 97            	ld	xl,a
2479                     ; 946   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2481                     ; 949   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2483  0293 7b03          	ld	a,(OFST+1,sp)
2484  0295 a4f0          	and	a,#240
2485  0297 6b02          	ld	(OFST+0,sp),a
2486                     ; 952   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2488  0299 7b03          	ld	a,(OFST+1,sp)
2489  029b a40f          	and	a,#15
2490  029d 6b01          	ld	(OFST-1,sp),a
2491                     ; 954   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2493  029f 0d02          	tnz	(OFST+0,sp)
2494  02a1 2607          	jrne	L7421
2495                     ; 956     reg = CLK->CRTCR;
2497  02a3 c650c1        	ld	a,20673
2498  02a6 6b02          	ld	(OFST+0,sp),a
2500  02a8 2060          	jra	L1521
2501  02aa               L7421:
2502                     ; 958   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2504  02aa 7b02          	ld	a,(OFST+0,sp)
2505  02ac a110          	cp	a,#16
2506  02ae 2607          	jrne	L3521
2507                     ; 960     reg = CLK->ICKCR;
2509  02b0 c650c2        	ld	a,20674
2510  02b3 6b02          	ld	(OFST+0,sp),a
2512  02b5 2053          	jra	L1521
2513  02b7               L3521:
2514                     ; 962   else if (reg == 0x20) /* The flag to check is in CCOR register */
2516  02b7 7b02          	ld	a,(OFST+0,sp)
2517  02b9 a120          	cp	a,#32
2518  02bb 2607          	jrne	L7521
2519                     ; 964     reg = CLK->CCOR;
2521  02bd c650c5        	ld	a,20677
2522  02c0 6b02          	ld	(OFST+0,sp),a
2524  02c2 2046          	jra	L1521
2525  02c4               L7521:
2526                     ; 966   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2528  02c4 7b02          	ld	a,(OFST+0,sp)
2529  02c6 a130          	cp	a,#48
2530  02c8 2607          	jrne	L3621
2531                     ; 968     reg = CLK->ECKCR;
2533  02ca c650c6        	ld	a,20678
2534  02cd 6b02          	ld	(OFST+0,sp),a
2536  02cf 2039          	jra	L1521
2537  02d1               L3621:
2538                     ; 970   else if (reg == 0x40) /* The flag to check is in SWCR register */
2540  02d1 7b02          	ld	a,(OFST+0,sp)
2541  02d3 a140          	cp	a,#64
2542  02d5 2607          	jrne	L7621
2543                     ; 972     reg = CLK->SWCR;
2545  02d7 c650c9        	ld	a,20681
2546  02da 6b02          	ld	(OFST+0,sp),a
2548  02dc 202c          	jra	L1521
2549  02de               L7621:
2550                     ; 974   else if (reg == 0x50) /* The flag to check is in CSSR register */
2552  02de 7b02          	ld	a,(OFST+0,sp)
2553  02e0 a150          	cp	a,#80
2554  02e2 2607          	jrne	L3721
2555                     ; 976     reg = CLK->CSSR;
2557  02e4 c650ca        	ld	a,20682
2558  02e7 6b02          	ld	(OFST+0,sp),a
2560  02e9 201f          	jra	L1521
2561  02eb               L3721:
2562                     ; 978   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2564  02eb 7b02          	ld	a,(OFST+0,sp)
2565  02ed a170          	cp	a,#112
2566  02ef 2607          	jrne	L7721
2567                     ; 980     reg = CLK->REGCSR;
2569  02f1 c650cf        	ld	a,20687
2570  02f4 6b02          	ld	(OFST+0,sp),a
2572  02f6 2012          	jra	L1521
2573  02f8               L7721:
2574                     ; 982   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2576  02f8 7b02          	ld	a,(OFST+0,sp)
2577  02fa a180          	cp	a,#128
2578  02fc 2607          	jrne	L3031
2579                     ; 984     reg = CSSLSE->CSR;
2581  02fe c65190        	ld	a,20880
2582  0301 6b02          	ld	(OFST+0,sp),a
2584  0303 2005          	jra	L1521
2585  0305               L3031:
2586                     ; 988     reg = CLK->CBEEPR;
2588  0305 c650cb        	ld	a,20683
2589  0308 6b02          	ld	(OFST+0,sp),a
2590  030a               L1521:
2591                     ; 992   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2593  030a 7b01          	ld	a,(OFST-1,sp)
2594  030c 5f            	clrw	x
2595  030d 97            	ld	xl,a
2596  030e a601          	ld	a,#1
2597  0310 5d            	tnzw	x
2598  0311 2704          	jreq	L211
2599  0313               L411:
2600  0313 48            	sll	a
2601  0314 5a            	decw	x
2602  0315 26fc          	jrne	L411
2603  0317               L211:
2604  0317 1402          	and	a,(OFST+0,sp)
2605  0319 2706          	jreq	L7031
2606                     ; 994     bitstatus = SET;
2608  031b a601          	ld	a,#1
2609  031d 6b02          	ld	(OFST+0,sp),a
2611  031f 2002          	jra	L1131
2612  0321               L7031:
2613                     ; 998     bitstatus = RESET;
2615  0321 0f02          	clr	(OFST+0,sp)
2616  0323               L1131:
2617                     ; 1002   return((FlagStatus)bitstatus);
2619  0323 7b02          	ld	a,(OFST+0,sp)
2622  0325 5b03          	addw	sp,#3
2623  0327 81            	ret
2646                     ; 1010 void CLK_ClearFlag(void)
2646                     ; 1011 {
2647                     	switch	.text
2648  0328               _CLK_ClearFlag:
2652                     ; 1014   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2654  0328 72175190      	bres	20880,#3
2655                     ; 1015 }
2658  032c 81            	ret
2704                     ; 1026 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2704                     ; 1027 {
2705                     	switch	.text
2706  032d               _CLK_GetITStatus:
2708  032d 88            	push	a
2709  032e 88            	push	a
2710       00000001      OFST:	set	1
2713                     ; 1029   ITStatus bitstatus = RESET;
2715  032f 0f01          	clr	(OFST+0,sp)
2716                     ; 1032   assert_param(IS_CLK_IT(CLK_IT));
2718                     ; 1034   if (CLK_IT == CLK_IT_SWIF)
2720  0331 a11c          	cp	a,#28
2721  0333 2611          	jrne	L5431
2722                     ; 1037     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2724  0335 c450c9        	and	a,20681
2725  0338 a10c          	cp	a,#12
2726  033a 2606          	jrne	L7431
2727                     ; 1039       bitstatus = SET;
2729  033c a601          	ld	a,#1
2730  033e 6b01          	ld	(OFST+0,sp),a
2732  0340 202e          	jra	L3531
2733  0342               L7431:
2734                     ; 1043       bitstatus = RESET;
2736  0342 0f01          	clr	(OFST+0,sp)
2737  0344 202a          	jra	L3531
2738  0346               L5431:
2739                     ; 1046   else if (CLK_IT == CLK_IT_LSECSSF)
2741  0346 7b02          	ld	a,(OFST+1,sp)
2742  0348 a12c          	cp	a,#44
2743  034a 2613          	jrne	L5531
2744                     ; 1049     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2746  034c c65190        	ld	a,20880
2747  034f 1402          	and	a,(OFST+1,sp)
2748  0351 a10c          	cp	a,#12
2749  0353 2606          	jrne	L7531
2750                     ; 1051       bitstatus = SET;
2752  0355 a601          	ld	a,#1
2753  0357 6b01          	ld	(OFST+0,sp),a
2755  0359 2015          	jra	L3531
2756  035b               L7531:
2757                     ; 1055       bitstatus = RESET;
2759  035b 0f01          	clr	(OFST+0,sp)
2760  035d 2011          	jra	L3531
2761  035f               L5531:
2762                     ; 1061     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2764  035f c650ca        	ld	a,20682
2765  0362 1402          	and	a,(OFST+1,sp)
2766  0364 a10c          	cp	a,#12
2767  0366 2606          	jrne	L5631
2768                     ; 1063       bitstatus = SET;
2770  0368 a601          	ld	a,#1
2771  036a 6b01          	ld	(OFST+0,sp),a
2773  036c 2002          	jra	L3531
2774  036e               L5631:
2775                     ; 1067       bitstatus = RESET;
2777  036e 0f01          	clr	(OFST+0,sp)
2778  0370               L3531:
2779                     ; 1072   return bitstatus;
2781  0370 7b01          	ld	a,(OFST+0,sp)
2784  0372 85            	popw	x
2785  0373 81            	ret
2821                     ; 1083 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2821                     ; 1084 {
2822                     	switch	.text
2823  0374               _CLK_ClearITPendingBit:
2827                     ; 1087   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2829                     ; 1089   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2831  0374 a4f0          	and	a,#240
2832  0376 a120          	cp	a,#32
2833  0378 2606          	jrne	L7041
2834                     ; 1092     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2836  037a 72175190      	bres	20880,#3
2838  037e 2004          	jra	L1141
2839  0380               L7041:
2840                     ; 1097     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2842  0380 721750c9      	bres	20681,#3
2843  0384               L1141:
2844                     ; 1099 }
2847  0384 81            	ret
2872                     	xdef	_SYSDivFactor
2873                     	xdef	_CLK_ClearITPendingBit
2874                     	xdef	_CLK_GetITStatus
2875                     	xdef	_CLK_ClearFlag
2876                     	xdef	_CLK_GetFlagStatus
2877                     	xdef	_CLK_ITConfig
2878                     	xdef	_CLK_MainRegulatorCmd
2879                     	xdef	_CLK_HaltConfig
2880                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2881                     	xdef	_CLK_LSEClockSecuritySystemEnable
2882                     	xdef	_CLK_PeripheralClockConfig
2883                     	xdef	_CLK_BEEPClockConfig
2884                     	xdef	_CLK_RTCClockConfig
2885                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2886                     	xdef	_CLK_SYSCLKDivConfig
2887                     	xdef	_CLK_GetClockFreq
2888                     	xdef	_CLK_GetSYSCLKSource
2889                     	xdef	_CLK_SYSCLKSourceConfig
2890                     	xdef	_CLK_CCOConfig
2891                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2892                     	xdef	_CLK_ClockSecuritySystemEnable
2893                     	xdef	_CLK_LSEConfig
2894                     	xdef	_CLK_HSEConfig
2895                     	xdef	_CLK_LSICmd
2896                     	xdef	_CLK_AdjustHSICalibrationValue
2897                     	xdef	_CLK_HSICmd
2898                     	xdef	_CLK_DeInit
2899                     	xref.b	c_lreg
2918                     	xref	c_ludv
2919                     	xref	c_rtol
2920                     	xref	c_ltor
2921                     	end
