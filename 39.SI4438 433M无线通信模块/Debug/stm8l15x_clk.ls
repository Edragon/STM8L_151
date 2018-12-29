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
  40                     	switch	.text
  41  0000               f_CLK_DeInit:
  45                     ; 116   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  47  0000 351150c2      	mov	20674,#17
  48                     ; 117   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  50  0004 725f50c6      	clr	20678
  51                     ; 118   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  53  0008 725f50c1      	clr	20673
  54                     ; 119   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  56  000c 725f50cb      	clr	20683
  57                     ; 120   CLK->SWR  = CLK_SWR_RESET_VALUE;
  59  0010 350150c8      	mov	20680,#1
  60                     ; 121   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  62  0014 725f50c9      	clr	20681
  63                     ; 122   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  65  0018 350350c0      	mov	20672,#3
  66                     ; 123   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  68  001c 725f50c3      	clr	20675
  69                     ; 124   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  71  0020 358050c4      	mov	20676,#128
  72                     ; 125   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  74  0024 725f50d0      	clr	20688
  75                     ; 126   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  77  0028 725f50ca      	clr	20682
  78                     ; 127   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  80  002c 725f50c5      	clr	20677
  81                     ; 128   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  83  0030 725f50cd      	clr	20685
  84                     ; 129   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  86  0034 725f50cc      	clr	20684
  87                     ; 130   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
  89  0038 725f50ce      	clr	20686
  90                     ; 131   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
  92  003c 35b950cf      	mov	20687,#185
  93                     ; 132 }
  96  0040 87            	retf
 150                     ; 154 void CLK_HSICmd(FunctionalState NewState)
 150                     ; 155 {
 151                     	switch	.text
 152  0041               f_CLK_HSICmd:
 156                     ; 157   assert_param(IS_FUNCTIONAL_STATE(NewState));
 158                     ; 159   if (NewState != DISABLE)
 160  0041 4d            	tnz	a
 161  0042 2706          	jreq	L74
 162                     ; 162     CLK->ICKCR |= CLK_ICKCR_HSION;
 164  0044 721050c2      	bset	20674,#0
 166  0048 2004          	jra	L15
 167  004a               L74:
 168                     ; 167     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 170  004a 721150c2      	bres	20674,#0
 171  004e               L15:
 172                     ; 169 }
 175  004e 87            	retf
 208                     ; 182 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 208                     ; 183 {
 209                     	switch	.text
 210  004f               f_CLK_AdjustHSICalibrationValue:
 214                     ; 185   CLK->HSIUNLCKR = 0xAC;
 216  004f 35ac50ce      	mov	20686,#172
 217                     ; 186   CLK->HSIUNLCKR = 0x35;
 219  0053 353550ce      	mov	20686,#53
 220                     ; 189   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 222  0057 c750cd        	ld	20685,a
 223                     ; 190 }
 226  005a 87            	retf
 260                     ; 206 void CLK_LSICmd(FunctionalState NewState)
 260                     ; 207 {
 261                     	switch	.text
 262  005b               f_CLK_LSICmd:
 266                     ; 210   assert_param(IS_FUNCTIONAL_STATE(NewState));
 268                     ; 212   if (NewState != DISABLE)
 270  005b 4d            	tnz	a
 271  005c 2706          	jreq	L501
 272                     ; 215     CLK->ICKCR |= CLK_ICKCR_LSION;
 274  005e 721450c2      	bset	20674,#2
 276  0062 2004          	jra	L701
 277  0064               L501:
 278                     ; 220     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 280  0064 721550c2      	bres	20674,#2
 281  0068               L701:
 282                     ; 222 }
 285  0068 87            	retf
 346                     ; 243 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 346                     ; 244 {
 347                     	switch	.text
 348  0069               f_CLK_HSEConfig:
 352                     ; 246   assert_param(IS_CLK_HSE(CLK_HSE));
 354                     ; 250   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 356  0069 721150c6      	bres	20678,#0
 357                     ; 253   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 359  006d 721950c6      	bres	20678,#4
 360                     ; 256   CLK->ECKCR |= (uint8_t)CLK_HSE;
 362  0071 ca50c6        	or	a,20678
 363  0074 c750c6        	ld	20678,a
 364                     ; 257 }
 367  0077 87            	retf
 428                     ; 274 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 428                     ; 275 {
 429                     	switch	.text
 430  0078               f_CLK_LSEConfig:
 434                     ; 277   assert_param(IS_CLK_LSE(CLK_LSE));
 436                     ; 281   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 438  0078 721550c6      	bres	20678,#2
 439                     ; 284   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 441  007c 721b50c6      	bres	20678,#5
 442                     ; 287   CLK->ECKCR |= (uint8_t)CLK_LSE;
 444  0080 ca50c6        	or	a,20678
 445  0083 c750c6        	ld	20678,a
 446                     ; 289 }
 449  0086 87            	retf
 472                     ; 300 void CLK_ClockSecuritySystemEnable(void)
 472                     ; 301 {
 473                     	switch	.text
 474  0087               f_CLK_ClockSecuritySystemEnable:
 478                     ; 303   CLK->CSSR |= CLK_CSSR_CSSEN;
 480  0087 721050ca      	bset	20682,#0
 481                     ; 304 }
 484  008b 87            	retf
 519                     ; 311 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 519                     ; 312 {
 520                     	switch	.text
 521  008c               f_CLK_ClockSecuritySytemDeglitchCmd:
 525                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 527                     ; 316   if (NewState != DISABLE)
 529  008c 4d            	tnz	a
 530  008d 2706          	jreq	L712
 531                     ; 319     CLK->CSSR |= CLK_CSSR_CSSDGON;
 533  008f 721850ca      	bset	20682,#4
 535  0093 2004          	jra	L122
 536  0095               L712:
 537                     ; 324     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 539  0095 721950ca      	bres	20682,#4
 540  0099               L122:
 541                     ; 326 }
 544  0099 87            	retf
 684                     ; 350 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 684                     ; 351 {
 685                     	switch	.text
 686  009a               f_CLK_CCOConfig:
 688  009a 89            	pushw	x
 689       00000000      OFST:	set	0
 692                     ; 353   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 694                     ; 354   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 696                     ; 357   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 698  009b 9f            	ld	a,xl
 699  009c 1a01          	or	a,(OFST+1,sp)
 700  009e c750c5        	ld	20677,a
 701                     ; 358 }
 704  00a1 85            	popw	x
 705  00a2 87            	retf
 778                     ; 410 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 778                     ; 411 {
 779                     	switch	.text
 780  00a3               f_CLK_SYSCLKSourceConfig:
 784                     ; 413   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 786                     ; 416   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 788  00a3 c750c8        	ld	20680,a
 789                     ; 417 }
 792  00a6 87            	retf
 816                     ; 429 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 816                     ; 430 {
 817                     	switch	.text
 818  00a7               f_CLK_GetSYSCLKSource:
 822                     ; 431   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 824  00a7 c650c7        	ld	a,20679
 827  00aa 87            	retf
 890                     ; 472 uint32_t CLK_GetClockFreq(void)
 890                     ; 473 {
 891                     	switch	.text
 892  00ab               f_CLK_GetClockFreq:
 894  00ab 5209          	subw	sp,#9
 895       00000009      OFST:	set	9
 898                     ; 474   uint32_t clockfrequency = 0;
 900  00ad 96            	ldw	x,sp
 901  00ae 1c0005        	addw	x,#OFST-4
 902  00b1 8d000000      	callf	d_ltor
 904                     ; 475   uint32_t sourcefrequency = 0;
 906  00b5 ae0000        	ldw	x,#0
 907  00b8 1f07          	ldw	(OFST-2,sp),x
 908  00ba ae0000        	ldw	x,#0
 909  00bd 1f05          	ldw	(OFST-4,sp),x
 910                     ; 476   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 912  00bf 7b09          	ld	a,(OFST+0,sp)
 913  00c1 97            	ld	xl,a
 914                     ; 477   uint8_t tmp = 0, presc = 0;
 916  00c2 7b09          	ld	a,(OFST+0,sp)
 917  00c4 97            	ld	xl,a
 920  00c5 7b09          	ld	a,(OFST+0,sp)
 921  00c7 97            	ld	xl,a
 922                     ; 480   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 924  00c8 c650c7        	ld	a,20679
 925  00cb 6b09          	ld	(OFST+0,sp),a
 926                     ; 482   if ( clocksource == CLK_SYSCLKSource_HSI)
 928  00cd 7b09          	ld	a,(OFST+0,sp)
 929  00cf a101          	cp	a,#1
 930  00d1 260c          	jrne	L573
 931                     ; 484     sourcefrequency = HSI_VALUE;
 933  00d3 ae2400        	ldw	x,#9216
 934  00d6 1f07          	ldw	(OFST-2,sp),x
 935  00d8 ae00f4        	ldw	x,#244
 936  00db 1f05          	ldw	(OFST-4,sp),x
 938  00dd 202c          	jra	L773
 939  00df               L573:
 940                     ; 486   else if ( clocksource == CLK_SYSCLKSource_LSI)
 942  00df 7b09          	ld	a,(OFST+0,sp)
 943  00e1 a102          	cp	a,#2
 944  00e3 260c          	jrne	L104
 945                     ; 488     sourcefrequency = LSI_VALUE;
 947  00e5 ae9470        	ldw	x,#38000
 948  00e8 1f07          	ldw	(OFST-2,sp),x
 949  00ea ae0000        	ldw	x,#0
 950  00ed 1f05          	ldw	(OFST-4,sp),x
 952  00ef 201a          	jra	L773
 953  00f1               L104:
 954                     ; 490   else if ( clocksource == CLK_SYSCLKSource_HSE)
 956  00f1 7b09          	ld	a,(OFST+0,sp)
 957  00f3 a104          	cp	a,#4
 958  00f5 260c          	jrne	L504
 959                     ; 492     sourcefrequency = HSE_VALUE;
 961  00f7 ae2400        	ldw	x,#9216
 962  00fa 1f07          	ldw	(OFST-2,sp),x
 963  00fc ae00f4        	ldw	x,#244
 964  00ff 1f05          	ldw	(OFST-4,sp),x
 966  0101 2008          	jra	L773
 967  0103               L504:
 968                     ; 496     clockfrequency = LSE_VALUE;
 970  0103 96            	ldw	x,sp
 971  0104 1c0005        	addw	x,#OFST-4
 972  0107 8d000000      	callf	d_ltor
 974  010b               L773:
 975                     ; 500   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 977  010b c650c0        	ld	a,20672
 978  010e a407          	and	a,#7
 979  0110 6b09          	ld	(OFST+0,sp),a
 980                     ; 501   presc = SYSDivFactor[tmp];
 982  0112 7b09          	ld	a,(OFST+0,sp)
 983  0114 5f            	clrw	x
 984  0115 97            	ld	xl,a
 985  0116 d60000        	ld	a,(_SYSDivFactor,x)
 986  0119 6b09          	ld	(OFST+0,sp),a
 987                     ; 504   clockfrequency = sourcefrequency / presc;
 989  011b 7b09          	ld	a,(OFST+0,sp)
 990  011d b703          	ld	c_lreg+3,a
 991  011f 3f02          	clr	c_lreg+2
 992  0121 3f01          	clr	c_lreg+1
 993  0123 3f00          	clr	c_lreg
 994  0125 96            	ldw	x,sp
 995  0126 1c0001        	addw	x,#OFST-8
 996  0129 8d000000      	callf	d_rtol
 998  012d 96            	ldw	x,sp
 999  012e 1c0005        	addw	x,#OFST-4
1000  0131 8d000000      	callf	d_ltor
1002  0135 96            	ldw	x,sp
1003  0136 1c0001        	addw	x,#OFST-8
1004  0139 8d000000      	callf	d_ludv
1006  013d 96            	ldw	x,sp
1007  013e 1c0005        	addw	x,#OFST-4
1008  0141 8d000000      	callf	d_rtol
1010                     ; 506   return((uint32_t)clockfrequency);
1012  0145 96            	ldw	x,sp
1013  0146 1c0005        	addw	x,#OFST-4
1014  0149 8d000000      	callf	d_ltor
1018  014d 5b09          	addw	sp,#9
1019  014f 87            	retf
1116                     ; 522 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1116                     ; 523 {
1117                     	switch	.text
1118  0150               f_CLK_SYSCLKDivConfig:
1122                     ; 525   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1124                     ; 527   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1126  0150 c750c0        	ld	20672,a
1127                     ; 528 }
1130  0153 87            	retf
1165                     ; 535 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1165                     ; 536 {
1166                     	switch	.text
1167  0154               f_CLK_SYSCLKSourceSwitchCmd:
1171                     ; 538   assert_param(IS_FUNCTIONAL_STATE(NewState));
1173                     ; 540   if (NewState != DISABLE)
1175  0154 4d            	tnz	a
1176  0155 2706          	jreq	L174
1177                     ; 543     CLK->SWCR |= CLK_SWCR_SWEN;
1179  0157 721250c9      	bset	20681,#1
1181  015b 2004          	jra	L374
1182  015d               L174:
1183                     ; 548     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1185  015d 721350c9      	bres	20681,#1
1186  0161               L374:
1187                     ; 550 }
1190  0161 87            	retf
1335                     ; 610 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1335                     ; 611 {
1336                     	switch	.text
1337  0162               f_CLK_RTCClockConfig:
1339  0162 89            	pushw	x
1340       00000000      OFST:	set	0
1343                     ; 613   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1345                     ; 614   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1347                     ; 617   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1349  0163 9f            	ld	a,xl
1350  0164 1a01          	or	a,(OFST+1,sp)
1351  0166 c750c1        	ld	20673,a
1352                     ; 618 }
1355  0169 85            	popw	x
1356  016a 87            	retf
1421                     ; 629 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1421                     ; 630 {
1422                     	switch	.text
1423  016b               f_CLK_BEEPClockConfig:
1427                     ; 632   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1429                     ; 635   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1431  016b c750cb        	ld	20683,a
1432                     ; 637 }
1435  016e 87            	retf
1657                     ; 671 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1657                     ; 672 {
1658                     	switch	.text
1659  016f               f_CLK_PeripheralClockConfig:
1661  016f 89            	pushw	x
1662  0170 88            	push	a
1663       00000001      OFST:	set	1
1666                     ; 673   uint8_t reg = 0;
1668  0171 0f01          	clr	(OFST+0,sp)
1669                     ; 676   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1671                     ; 677   assert_param(IS_FUNCTIONAL_STATE(NewState));
1673                     ; 680   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1675  0173 9e            	ld	a,xh
1676  0174 a4f0          	and	a,#240
1677  0176 6b01          	ld	(OFST+0,sp),a
1678                     ; 682   if ( reg == 0x00)
1680  0178 0d01          	tnz	(OFST+0,sp)
1681  017a 2635          	jrne	L117
1682                     ; 684     if (NewState != DISABLE)
1684  017c 0d03          	tnz	(OFST+2,sp)
1685  017e 2719          	jreq	L317
1686                     ; 687       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1688  0180 7b02          	ld	a,(OFST+1,sp)
1689  0182 a40f          	and	a,#15
1690  0184 5f            	clrw	x
1691  0185 97            	ld	xl,a
1692  0186 a601          	ld	a,#1
1693  0188 5d            	tnzw	x
1694  0189 2704          	jreq	L64
1695  018b               L05:
1696  018b 48            	sll	a
1697  018c 5a            	decw	x
1698  018d 26fc          	jrne	L05
1699  018f               L64:
1700  018f ca50c3        	or	a,20675
1701  0192 c750c3        	ld	20675,a
1703  0195 ac1b021b      	jpf	L717
1704  0199               L317:
1705                     ; 692       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1707  0199 7b02          	ld	a,(OFST+1,sp)
1708  019b a40f          	and	a,#15
1709  019d 5f            	clrw	x
1710  019e 97            	ld	xl,a
1711  019f a601          	ld	a,#1
1712  01a1 5d            	tnzw	x
1713  01a2 2704          	jreq	L25
1714  01a4               L45:
1715  01a4 48            	sll	a
1716  01a5 5a            	decw	x
1717  01a6 26fc          	jrne	L45
1718  01a8               L25:
1719  01a8 43            	cpl	a
1720  01a9 c450c3        	and	a,20675
1721  01ac c750c3        	ld	20675,a
1722  01af 206a          	jra	L717
1723  01b1               L117:
1724                     ; 695   else if (reg == 0x10)
1726  01b1 7b01          	ld	a,(OFST+0,sp)
1727  01b3 a110          	cp	a,#16
1728  01b5 2633          	jrne	L127
1729                     ; 697     if (NewState != DISABLE)
1731  01b7 0d03          	tnz	(OFST+2,sp)
1732  01b9 2717          	jreq	L327
1733                     ; 700       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1735  01bb 7b02          	ld	a,(OFST+1,sp)
1736  01bd a40f          	and	a,#15
1737  01bf 5f            	clrw	x
1738  01c0 97            	ld	xl,a
1739  01c1 a601          	ld	a,#1
1740  01c3 5d            	tnzw	x
1741  01c4 2704          	jreq	L65
1742  01c6               L06:
1743  01c6 48            	sll	a
1744  01c7 5a            	decw	x
1745  01c8 26fc          	jrne	L06
1746  01ca               L65:
1747  01ca ca50c4        	or	a,20676
1748  01cd c750c4        	ld	20676,a
1750  01d0 2049          	jra	L717
1751  01d2               L327:
1752                     ; 705       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1754  01d2 7b02          	ld	a,(OFST+1,sp)
1755  01d4 a40f          	and	a,#15
1756  01d6 5f            	clrw	x
1757  01d7 97            	ld	xl,a
1758  01d8 a601          	ld	a,#1
1759  01da 5d            	tnzw	x
1760  01db 2704          	jreq	L26
1761  01dd               L46:
1762  01dd 48            	sll	a
1763  01de 5a            	decw	x
1764  01df 26fc          	jrne	L46
1765  01e1               L26:
1766  01e1 43            	cpl	a
1767  01e2 c450c4        	and	a,20676
1768  01e5 c750c4        	ld	20676,a
1769  01e8 2031          	jra	L717
1770  01ea               L127:
1771                     ; 710     if (NewState != DISABLE)
1773  01ea 0d03          	tnz	(OFST+2,sp)
1774  01ec 2717          	jreq	L137
1775                     ; 713       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1777  01ee 7b02          	ld	a,(OFST+1,sp)
1778  01f0 a40f          	and	a,#15
1779  01f2 5f            	clrw	x
1780  01f3 97            	ld	xl,a
1781  01f4 a601          	ld	a,#1
1782  01f6 5d            	tnzw	x
1783  01f7 2704          	jreq	L66
1784  01f9               L07:
1785  01f9 48            	sll	a
1786  01fa 5a            	decw	x
1787  01fb 26fc          	jrne	L07
1788  01fd               L66:
1789  01fd ca50d0        	or	a,20688
1790  0200 c750d0        	ld	20688,a
1792  0203 2016          	jra	L717
1793  0205               L137:
1794                     ; 718       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1796  0205 7b02          	ld	a,(OFST+1,sp)
1797  0207 a40f          	and	a,#15
1798  0209 5f            	clrw	x
1799  020a 97            	ld	xl,a
1800  020b a601          	ld	a,#1
1801  020d 5d            	tnzw	x
1802  020e 2704          	jreq	L27
1803  0210               L47:
1804  0210 48            	sll	a
1805  0211 5a            	decw	x
1806  0212 26fc          	jrne	L47
1807  0214               L27:
1808  0214 43            	cpl	a
1809  0215 c450d0        	and	a,20688
1810  0218 c750d0        	ld	20688,a
1811  021b               L717:
1812                     ; 721 }
1815  021b 5b03          	addw	sp,#3
1816  021d 87            	retf
1839                     ; 759 void CLK_LSEClockSecuritySystemEnable(void)
1839                     ; 760 {
1840                     	switch	.text
1841  021e               f_CLK_LSEClockSecuritySystemEnable:
1845                     ; 762   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1847  021e 72105190      	bset	20880,#0
1848                     ; 763 }
1851  0222 87            	retf
1874                     ; 771 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1874                     ; 772 {
1875                     	switch	.text
1876  0223               f_CLK_RTCCLKSwitchOnLSEFailureEnable:
1880                     ; 774   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1882  0223 72125190      	bset	20880,#1
1883                     ; 775 }
1886  0227 87            	retf
1960                     ; 801 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1960                     ; 802 {
1961                     	switch	.text
1962  0228               f_CLK_HaltConfig:
1964  0228 89            	pushw	x
1965       00000000      OFST:	set	0
1968                     ; 804   assert_param(IS_CLK_HALT(CLK_Halt));
1970                     ; 805   assert_param(IS_FUNCTIONAL_STATE(NewState));
1972                     ; 807   if (NewState != DISABLE)
1974  0229 9f            	ld	a,xl
1975  022a 4d            	tnz	a
1976  022b 2709          	jreq	L1101
1977                     ; 809     CLK->ICKCR |= (uint8_t)(CLK_Halt);
1979  022d 9e            	ld	a,xh
1980  022e ca50c2        	or	a,20674
1981  0231 c750c2        	ld	20674,a
1983  0234 2009          	jra	L3101
1984  0236               L1101:
1985                     ; 813     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
1987  0236 7b01          	ld	a,(OFST+1,sp)
1988  0238 43            	cpl	a
1989  0239 c450c2        	and	a,20674
1990  023c c750c2        	ld	20674,a
1991  023f               L3101:
1992                     ; 815 }
1995  023f 85            	popw	x
1996  0240 87            	retf
2031                     ; 825 void CLK_MainRegulatorCmd(FunctionalState NewState)
2031                     ; 826 {
2032                     	switch	.text
2033  0241               f_CLK_MainRegulatorCmd:
2037                     ; 828   assert_param(IS_FUNCTIONAL_STATE(NewState));
2039                     ; 830   if (NewState != DISABLE)
2041  0241 4d            	tnz	a
2042  0242 2706          	jreq	L3301
2043                     ; 833     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2045  0244 721350cf      	bres	20687,#1
2047  0248 2004          	jra	L5301
2048  024a               L3301:
2049                     ; 838     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2051  024a 721250cf      	bset	20687,#1
2052  024e               L5301:
2053                     ; 840 }
2056  024e 87            	retf
2127                     ; 869 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2127                     ; 870 {
2128                     	switch	.text
2129  024f               f_CLK_ITConfig:
2131  024f 89            	pushw	x
2132       00000000      OFST:	set	0
2135                     ; 873   assert_param(IS_CLK_IT(CLK_IT));
2137                     ; 874   assert_param(IS_FUNCTIONAL_STATE(NewState));
2139                     ; 876   if (NewState != DISABLE)
2141  0250 9f            	ld	a,xl
2142  0251 4d            	tnz	a
2143  0252 271d          	jreq	L3701
2144                     ; 878     if (CLK_IT == CLK_IT_SWIF)
2146  0254 9e            	ld	a,xh
2147  0255 a11c          	cp	a,#28
2148  0257 2606          	jrne	L5701
2149                     ; 881       CLK->SWCR |= CLK_SWCR_SWIEN;
2151  0259 721450c9      	bset	20681,#2
2153  025d 202e          	jra	L5011
2154  025f               L5701:
2155                     ; 883     else if (CLK_IT == CLK_IT_LSECSSF)
2157  025f 7b01          	ld	a,(OFST+1,sp)
2158  0261 a12c          	cp	a,#44
2159  0263 2606          	jrne	L1011
2160                     ; 886       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2162  0265 72145190      	bset	20880,#2
2164  0269 2022          	jra	L5011
2165  026b               L1011:
2166                     ; 891       CLK->CSSR |= CLK_CSSR_CSSDIE;
2168  026b 721450ca      	bset	20682,#2
2169  026f 201c          	jra	L5011
2170  0271               L3701:
2171                     ; 896     if (CLK_IT == CLK_IT_SWIF)
2173  0271 7b01          	ld	a,(OFST+1,sp)
2174  0273 a11c          	cp	a,#28
2175  0275 2606          	jrne	L7011
2176                     ; 899       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2178  0277 721550c9      	bres	20681,#2
2180  027b 2010          	jra	L5011
2181  027d               L7011:
2182                     ; 901     else if (CLK_IT == CLK_IT_LSECSSF)
2184  027d 7b01          	ld	a,(OFST+1,sp)
2185  027f a12c          	cp	a,#44
2186  0281 2606          	jrne	L3111
2187                     ; 904       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2189  0283 72155190      	bres	20880,#2
2191  0287 2004          	jra	L5011
2192  0289               L3111:
2193                     ; 909       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2195  0289 721550ca      	bres	20682,#2
2196  028d               L5011:
2197                     ; 912 }
2200  028d 85            	popw	x
2201  028e 87            	retf
2419                     ; 939 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2419                     ; 940 {
2420                     	switch	.text
2421  028f               f_CLK_GetFlagStatus:
2423  028f 88            	push	a
2424  0290 89            	pushw	x
2425       00000002      OFST:	set	2
2428                     ; 941   uint8_t reg = 0;
2430  0291 7b02          	ld	a,(OFST+0,sp)
2431  0293 97            	ld	xl,a
2432                     ; 942   uint8_t pos = 0;
2434  0294 7b01          	ld	a,(OFST-1,sp)
2435  0296 97            	ld	xl,a
2436                     ; 943   FlagStatus bitstatus = RESET;
2438  0297 7b02          	ld	a,(OFST+0,sp)
2439  0299 97            	ld	xl,a
2440                     ; 946   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2442                     ; 949   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2444  029a 7b03          	ld	a,(OFST+1,sp)
2445  029c a4f0          	and	a,#240
2446  029e 6b02          	ld	(OFST+0,sp),a
2447                     ; 952   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2449  02a0 7b03          	ld	a,(OFST+1,sp)
2450  02a2 a40f          	and	a,#15
2451  02a4 6b01          	ld	(OFST-1,sp),a
2452                     ; 954   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2454  02a6 0d02          	tnz	(OFST+0,sp)
2455  02a8 2607          	jrne	L7221
2456                     ; 956     reg = CLK->CRTCR;
2458  02aa c650c1        	ld	a,20673
2459  02ad 6b02          	ld	(OFST+0,sp),a
2461  02af 2060          	jra	L1321
2462  02b1               L7221:
2463                     ; 958   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2465  02b1 7b02          	ld	a,(OFST+0,sp)
2466  02b3 a110          	cp	a,#16
2467  02b5 2607          	jrne	L3321
2468                     ; 960     reg = CLK->ICKCR;
2470  02b7 c650c2        	ld	a,20674
2471  02ba 6b02          	ld	(OFST+0,sp),a
2473  02bc 2053          	jra	L1321
2474  02be               L3321:
2475                     ; 962   else if (reg == 0x20) /* The flag to check is in CCOR register */
2477  02be 7b02          	ld	a,(OFST+0,sp)
2478  02c0 a120          	cp	a,#32
2479  02c2 2607          	jrne	L7321
2480                     ; 964     reg = CLK->CCOR;
2482  02c4 c650c5        	ld	a,20677
2483  02c7 6b02          	ld	(OFST+0,sp),a
2485  02c9 2046          	jra	L1321
2486  02cb               L7321:
2487                     ; 966   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2489  02cb 7b02          	ld	a,(OFST+0,sp)
2490  02cd a130          	cp	a,#48
2491  02cf 2607          	jrne	L3421
2492                     ; 968     reg = CLK->ECKCR;
2494  02d1 c650c6        	ld	a,20678
2495  02d4 6b02          	ld	(OFST+0,sp),a
2497  02d6 2039          	jra	L1321
2498  02d8               L3421:
2499                     ; 970   else if (reg == 0x40) /* The flag to check is in SWCR register */
2501  02d8 7b02          	ld	a,(OFST+0,sp)
2502  02da a140          	cp	a,#64
2503  02dc 2607          	jrne	L7421
2504                     ; 972     reg = CLK->SWCR;
2506  02de c650c9        	ld	a,20681
2507  02e1 6b02          	ld	(OFST+0,sp),a
2509  02e3 202c          	jra	L1321
2510  02e5               L7421:
2511                     ; 974   else if (reg == 0x50) /* The flag to check is in CSSR register */
2513  02e5 7b02          	ld	a,(OFST+0,sp)
2514  02e7 a150          	cp	a,#80
2515  02e9 2607          	jrne	L3521
2516                     ; 976     reg = CLK->CSSR;
2518  02eb c650ca        	ld	a,20682
2519  02ee 6b02          	ld	(OFST+0,sp),a
2521  02f0 201f          	jra	L1321
2522  02f2               L3521:
2523                     ; 978   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2525  02f2 7b02          	ld	a,(OFST+0,sp)
2526  02f4 a170          	cp	a,#112
2527  02f6 2607          	jrne	L7521
2528                     ; 980     reg = CLK->REGCSR;
2530  02f8 c650cf        	ld	a,20687
2531  02fb 6b02          	ld	(OFST+0,sp),a
2533  02fd 2012          	jra	L1321
2534  02ff               L7521:
2535                     ; 982   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2537  02ff 7b02          	ld	a,(OFST+0,sp)
2538  0301 a180          	cp	a,#128
2539  0303 2607          	jrne	L3621
2540                     ; 984     reg = CSSLSE->CSR;
2542  0305 c65190        	ld	a,20880
2543  0308 6b02          	ld	(OFST+0,sp),a
2545  030a 2005          	jra	L1321
2546  030c               L3621:
2547                     ; 988     reg = CLK->CBEEPR;
2549  030c c650cb        	ld	a,20683
2550  030f 6b02          	ld	(OFST+0,sp),a
2551  0311               L1321:
2552                     ; 992   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2554  0311 7b01          	ld	a,(OFST-1,sp)
2555  0313 5f            	clrw	x
2556  0314 97            	ld	xl,a
2557  0315 a601          	ld	a,#1
2558  0317 5d            	tnzw	x
2559  0318 2704          	jreq	L211
2560  031a               L411:
2561  031a 48            	sll	a
2562  031b 5a            	decw	x
2563  031c 26fc          	jrne	L411
2564  031e               L211:
2565  031e 1402          	and	a,(OFST+0,sp)
2566  0320 2706          	jreq	L7621
2567                     ; 994     bitstatus = SET;
2569  0322 a601          	ld	a,#1
2570  0324 6b02          	ld	(OFST+0,sp),a
2572  0326 2002          	jra	L1721
2573  0328               L7621:
2574                     ; 998     bitstatus = RESET;
2576  0328 0f02          	clr	(OFST+0,sp)
2577  032a               L1721:
2578                     ; 1002   return((FlagStatus)bitstatus);
2580  032a 7b02          	ld	a,(OFST+0,sp)
2583  032c 5b03          	addw	sp,#3
2584  032e 87            	retf
2606                     ; 1010 void CLK_ClearFlag(void)
2606                     ; 1011 {
2607                     	switch	.text
2608  032f               f_CLK_ClearFlag:
2612                     ; 1014   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2614  032f 72175190      	bres	20880,#3
2615                     ; 1015 }
2618  0333 87            	retf
2663                     ; 1026 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2663                     ; 1027 {
2664                     	switch	.text
2665  0334               f_CLK_GetITStatus:
2667  0334 88            	push	a
2668  0335 88            	push	a
2669       00000001      OFST:	set	1
2672                     ; 1029   ITStatus bitstatus = RESET;
2674  0336 0f01          	clr	(OFST+0,sp)
2675                     ; 1032   assert_param(IS_CLK_IT(CLK_IT));
2677                     ; 1034   if (CLK_IT == CLK_IT_SWIF)
2679  0338 a11c          	cp	a,#28
2680  033a 2611          	jrne	L5231
2681                     ; 1037     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2683  033c c450c9        	and	a,20681
2684  033f a10c          	cp	a,#12
2685  0341 2606          	jrne	L7231
2686                     ; 1039       bitstatus = SET;
2688  0343 a601          	ld	a,#1
2689  0345 6b01          	ld	(OFST+0,sp),a
2691  0347 202e          	jra	L3331
2692  0349               L7231:
2693                     ; 1043       bitstatus = RESET;
2695  0349 0f01          	clr	(OFST+0,sp)
2696  034b 202a          	jra	L3331
2697  034d               L5231:
2698                     ; 1046   else if (CLK_IT == CLK_IT_LSECSSF)
2700  034d 7b02          	ld	a,(OFST+1,sp)
2701  034f a12c          	cp	a,#44
2702  0351 2613          	jrne	L5331
2703                     ; 1049     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2705  0353 c65190        	ld	a,20880
2706  0356 1402          	and	a,(OFST+1,sp)
2707  0358 a10c          	cp	a,#12
2708  035a 2606          	jrne	L7331
2709                     ; 1051       bitstatus = SET;
2711  035c a601          	ld	a,#1
2712  035e 6b01          	ld	(OFST+0,sp),a
2714  0360 2015          	jra	L3331
2715  0362               L7331:
2716                     ; 1055       bitstatus = RESET;
2718  0362 0f01          	clr	(OFST+0,sp)
2719  0364 2011          	jra	L3331
2720  0366               L5331:
2721                     ; 1061     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2723  0366 c650ca        	ld	a,20682
2724  0369 1402          	and	a,(OFST+1,sp)
2725  036b a10c          	cp	a,#12
2726  036d 2606          	jrne	L5431
2727                     ; 1063       bitstatus = SET;
2729  036f a601          	ld	a,#1
2730  0371 6b01          	ld	(OFST+0,sp),a
2732  0373 2002          	jra	L3331
2733  0375               L5431:
2734                     ; 1067       bitstatus = RESET;
2736  0375 0f01          	clr	(OFST+0,sp)
2737  0377               L3331:
2738                     ; 1072   return bitstatus;
2740  0377 7b01          	ld	a,(OFST+0,sp)
2743  0379 85            	popw	x
2744  037a 87            	retf
2779                     ; 1083 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2779                     ; 1084 {
2780                     	switch	.text
2781  037b               f_CLK_ClearITPendingBit:
2785                     ; 1087   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2787                     ; 1089   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2789  037b a4f0          	and	a,#240
2790  037d a120          	cp	a,#32
2791  037f 2606          	jrne	L7631
2792                     ; 1092     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2794  0381 72175190      	bres	20880,#3
2796  0385 2004          	jra	L1731
2797  0387               L7631:
2798                     ; 1097     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2800  0387 721750c9      	bres	20681,#3
2801  038b               L1731:
2802                     ; 1099 }
2805  038b 87            	retf
2829                     	xdef	_SYSDivFactor
2830                     	xdef	f_CLK_ClearITPendingBit
2831                     	xdef	f_CLK_GetITStatus
2832                     	xdef	f_CLK_ClearFlag
2833                     	xdef	f_CLK_GetFlagStatus
2834                     	xdef	f_CLK_ITConfig
2835                     	xdef	f_CLK_MainRegulatorCmd
2836                     	xdef	f_CLK_HaltConfig
2837                     	xdef	f_CLK_RTCCLKSwitchOnLSEFailureEnable
2838                     	xdef	f_CLK_LSEClockSecuritySystemEnable
2839                     	xdef	f_CLK_PeripheralClockConfig
2840                     	xdef	f_CLK_BEEPClockConfig
2841                     	xdef	f_CLK_RTCClockConfig
2842                     	xdef	f_CLK_SYSCLKSourceSwitchCmd
2843                     	xdef	f_CLK_SYSCLKDivConfig
2844                     	xdef	f_CLK_GetClockFreq
2845                     	xdef	f_CLK_GetSYSCLKSource
2846                     	xdef	f_CLK_SYSCLKSourceConfig
2847                     	xdef	f_CLK_CCOConfig
2848                     	xdef	f_CLK_ClockSecuritySytemDeglitchCmd
2849                     	xdef	f_CLK_ClockSecuritySystemEnable
2850                     	xdef	f_CLK_LSEConfig
2851                     	xdef	f_CLK_HSEConfig
2852                     	xdef	f_CLK_LSICmd
2853                     	xdef	f_CLK_AdjustHSICalibrationValue
2854                     	xdef	f_CLK_HSICmd
2855                     	xdef	f_CLK_DeInit
2856                     	xref.b	c_lreg
2875                     	xref	d_ludv
2876                     	xref	d_rtol
2877                     	xref	d_ltor
2878                     	end
