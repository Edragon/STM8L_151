   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 112 void SYSCFG_RIDeInit(void)
  32                     ; 113 {
  34                     	switch	.text
  35  0000               _SYSCFG_RIDeInit:
  39                     ; 114   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  41  0000 725f5431      	clr	21553
  42                     ; 115   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  44  0004 725f5432      	clr	21554
  45                     ; 116   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  47  0008 725f5439      	clr	21561
  48                     ; 117   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  50  000c 725f543a      	clr	21562
  51                     ; 118   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  53  0010 725f543b      	clr	21563
  54                     ; 119   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  56  0014 725f5457      	clr	21591
  57                     ; 120   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  59  0018 725f543d      	clr	21565
  60                     ; 121   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  62  001c 725f543e      	clr	21566
  63                     ; 122   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  65  0020 725f543f      	clr	21567
  66                     ; 123 }
  69  0024 81            	ret
 328                     ; 135 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 328                     ; 136                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 328                     ; 137 {
 329                     	switch	.text
 330  0025               _SYSCFG_RITIMInputCaptureConfig:
 332  0025 89            	pushw	x
 333       00000000      OFST:	set	0
 336                     ; 139   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 338                     ; 140   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 340                     ; 143   if (RI_InputCapture == RI_InputCapture_IC2)
 342  0026 9e            	ld	a,xh
 343  0027 a102          	cp	a,#2
 344  0029 2606          	jrne	L531
 345                     ; 146     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 347  002b 9f            	ld	a,xl
 348  002c c75431        	ld	21553,a
 350  002f 2005          	jra	L731
 351  0031               L531:
 352                     ; 152     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 354  0031 7b02          	ld	a,(OFST+2,sp)
 355  0033 c75432        	ld	21554,a
 356  0036               L731:
 357                     ; 154 }
 360  0036 85            	popw	x
 361  0037 81            	ret
 543                     ; 177 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 543                     ; 178                                  FunctionalState NewState)
 543                     ; 179 {
 544                     	switch	.text
 545  0038               _SYSCFG_RIAnalogSwitchConfig:
 547  0038 89            	pushw	x
 548  0039 89            	pushw	x
 549       00000002      OFST:	set	2
 552                     ; 180   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 554  003a 7b02          	ld	a,(OFST+0,sp)
 555  003c 97            	ld	xl,a
 556                     ; 183   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 558                     ; 184   assert_param(IS_FUNCTIONAL_STATE(NewState));
 560                     ; 187   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 562  003d 7b03          	ld	a,(OFST+1,sp)
 563  003f a4f0          	and	a,#240
 564  0041 6b01          	ld	(OFST-1,sp),a
 565                     ; 190   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 567  0043 7b03          	ld	a,(OFST+1,sp)
 568  0045 a40f          	and	a,#15
 569  0047 6b02          	ld	(OFST+0,sp),a
 570                     ; 192   if (NewState != DISABLE)
 572  0049 0d04          	tnz	(OFST+2,sp)
 573  004b 2730          	jreq	L142
 574                     ; 194     if (AnalogSwitchRegister == (uint8_t) 0x10)
 576  004d 7b01          	ld	a,(OFST-1,sp)
 577  004f a110          	cp	a,#16
 578  0051 2615          	jrne	L342
 579                     ; 197       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 581  0053 7b02          	ld	a,(OFST+0,sp)
 582  0055 5f            	clrw	x
 583  0056 97            	ld	xl,a
 584  0057 a601          	ld	a,#1
 585  0059 5d            	tnzw	x
 586  005a 2704          	jreq	L21
 587  005c               L41:
 588  005c 48            	sll	a
 589  005d 5a            	decw	x
 590  005e 26fc          	jrne	L41
 591  0060               L21:
 592  0060 ca543d        	or	a,21565
 593  0063 c7543d        	ld	21565,a
 595  0066 2045          	jra	L742
 596  0068               L342:
 597                     ; 202       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 599  0068 7b02          	ld	a,(OFST+0,sp)
 600  006a 5f            	clrw	x
 601  006b 97            	ld	xl,a
 602  006c a601          	ld	a,#1
 603  006e 5d            	tnzw	x
 604  006f 2704          	jreq	L61
 605  0071               L02:
 606  0071 48            	sll	a
 607  0072 5a            	decw	x
 608  0073 26fc          	jrne	L02
 609  0075               L61:
 610  0075 ca543e        	or	a,21566
 611  0078 c7543e        	ld	21566,a
 612  007b 2030          	jra	L742
 613  007d               L142:
 614                     ; 207     if (AnalogSwitchRegister == (uint8_t) 0x10)
 616  007d 7b01          	ld	a,(OFST-1,sp)
 617  007f a110          	cp	a,#16
 618  0081 2616          	jrne	L152
 619                     ; 210       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 621  0083 7b02          	ld	a,(OFST+0,sp)
 622  0085 5f            	clrw	x
 623  0086 97            	ld	xl,a
 624  0087 a601          	ld	a,#1
 625  0089 5d            	tnzw	x
 626  008a 2704          	jreq	L22
 627  008c               L42:
 628  008c 48            	sll	a
 629  008d 5a            	decw	x
 630  008e 26fc          	jrne	L42
 631  0090               L22:
 632  0090 43            	cpl	a
 633  0091 c4543d        	and	a,21565
 634  0094 c7543d        	ld	21565,a
 636  0097 2014          	jra	L742
 637  0099               L152:
 638                     ; 215       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 640  0099 7b02          	ld	a,(OFST+0,sp)
 641  009b 5f            	clrw	x
 642  009c 97            	ld	xl,a
 643  009d a601          	ld	a,#1
 644  009f 5d            	tnzw	x
 645  00a0 2704          	jreq	L62
 646  00a2               L03:
 647  00a2 48            	sll	a
 648  00a3 5a            	decw	x
 649  00a4 26fc          	jrne	L03
 650  00a6               L62:
 651  00a6 43            	cpl	a
 652  00a7 c4543e        	and	a,21566
 653  00aa c7543e        	ld	21566,a
 654  00ad               L742:
 655                     ; 218 }
 658  00ad 5b04          	addw	sp,#4
 659  00af 81            	ret
 925                     ; 227 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 925                     ; 228                              FunctionalState NewState)
 925                     ; 229 {
 926                     	switch	.text
 927  00b0               _SYSCFG_RIIOSwitchConfig:
 929  00b0 89            	pushw	x
 930  00b1 89            	pushw	x
 931       00000002      OFST:	set	2
 934                     ; 230   uint8_t IOSwitchRegsiter, IOSwitchIndex = 0;
 936  00b2 7b02          	ld	a,(OFST+0,sp)
 937  00b4 97            	ld	xl,a
 938                     ; 233   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 940                     ; 234   assert_param(IS_FUNCTIONAL_STATE(NewState));
 942                     ; 237   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 944  00b5 7b03          	ld	a,(OFST+1,sp)
 945  00b7 a40f          	and	a,#15
 946  00b9 6b02          	ld	(OFST+0,sp),a
 947                     ; 240   IOSwitchRegsiter = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 949  00bb 7b03          	ld	a,(OFST+1,sp)
 950  00bd a4f0          	and	a,#240
 951  00bf 6b01          	ld	(OFST-1,sp),a
 952                     ; 243   if (IOSwitchRegsiter == (uint8_t) 0x10)
 954  00c1 7b01          	ld	a,(OFST-1,sp)
 955  00c3 a110          	cp	a,#16
 956  00c5 2633          	jrne	L304
 957                     ; 245     if (NewState != DISABLE)
 959  00c7 0d04          	tnz	(OFST+2,sp)
 960  00c9 2717          	jreq	L504
 961                     ; 248       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 963  00cb 7b02          	ld	a,(OFST+0,sp)
 964  00cd 5f            	clrw	x
 965  00ce 97            	ld	xl,a
 966  00cf a601          	ld	a,#1
 967  00d1 5d            	tnzw	x
 968  00d2 2704          	jreq	L43
 969  00d4               L63:
 970  00d4 48            	sll	a
 971  00d5 5a            	decw	x
 972  00d6 26fc          	jrne	L63
 973  00d8               L43:
 974  00d8 ca5439        	or	a,21561
 975  00db c75439        	ld	21561,a
 977  00de ac910191      	jpf	L114
 978  00e2               L504:
 979                     ; 253       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 981  00e2 7b02          	ld	a,(OFST+0,sp)
 982  00e4 5f            	clrw	x
 983  00e5 97            	ld	xl,a
 984  00e6 a601          	ld	a,#1
 985  00e8 5d            	tnzw	x
 986  00e9 2704          	jreq	L04
 987  00eb               L24:
 988  00eb 48            	sll	a
 989  00ec 5a            	decw	x
 990  00ed 26fc          	jrne	L24
 991  00ef               L04:
 992  00ef 43            	cpl	a
 993  00f0 c45439        	and	a,21561
 994  00f3 c75439        	ld	21561,a
 995  00f6 ac910191      	jpf	L114
 996  00fa               L304:
 997                     ; 258   else if (IOSwitchRegsiter == (uint8_t) 0x20)
 999  00fa 7b01          	ld	a,(OFST-1,sp)
1000  00fc a120          	cp	a,#32
1001  00fe 262f          	jrne	L314
1002                     ; 260     if (NewState != DISABLE)
1004  0100 0d04          	tnz	(OFST+2,sp)
1005  0102 2715          	jreq	L514
1006                     ; 263       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1008  0104 7b02          	ld	a,(OFST+0,sp)
1009  0106 5f            	clrw	x
1010  0107 97            	ld	xl,a
1011  0108 a601          	ld	a,#1
1012  010a 5d            	tnzw	x
1013  010b 2704          	jreq	L44
1014  010d               L64:
1015  010d 48            	sll	a
1016  010e 5a            	decw	x
1017  010f 26fc          	jrne	L64
1018  0111               L44:
1019  0111 ca543a        	or	a,21562
1020  0114 c7543a        	ld	21562,a
1022  0117 2078          	jra	L114
1023  0119               L514:
1024                     ; 268       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1026  0119 7b02          	ld	a,(OFST+0,sp)
1027  011b 5f            	clrw	x
1028  011c 97            	ld	xl,a
1029  011d a601          	ld	a,#1
1030  011f 5d            	tnzw	x
1031  0120 2704          	jreq	L05
1032  0122               L25:
1033  0122 48            	sll	a
1034  0123 5a            	decw	x
1035  0124 26fc          	jrne	L25
1036  0126               L05:
1037  0126 43            	cpl	a
1038  0127 c4543a        	and	a,21562
1039  012a c7543a        	ld	21562,a
1040  012d 2062          	jra	L114
1041  012f               L314:
1042                     ; 273   else if (IOSwitchRegsiter == (uint8_t) 0x30)
1044  012f 7b01          	ld	a,(OFST-1,sp)
1045  0131 a130          	cp	a,#48
1046  0133 262f          	jrne	L324
1047                     ; 275     if (NewState != DISABLE)
1049  0135 0d04          	tnz	(OFST+2,sp)
1050  0137 2715          	jreq	L524
1051                     ; 278       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1053  0139 7b02          	ld	a,(OFST+0,sp)
1054  013b 5f            	clrw	x
1055  013c 97            	ld	xl,a
1056  013d a601          	ld	a,#1
1057  013f 5d            	tnzw	x
1058  0140 2704          	jreq	L45
1059  0142               L65:
1060  0142 48            	sll	a
1061  0143 5a            	decw	x
1062  0144 26fc          	jrne	L65
1063  0146               L45:
1064  0146 ca543b        	or	a,21563
1065  0149 c7543b        	ld	21563,a
1067  014c 2043          	jra	L114
1068  014e               L524:
1069                     ; 283       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1071  014e 7b02          	ld	a,(OFST+0,sp)
1072  0150 5f            	clrw	x
1073  0151 97            	ld	xl,a
1074  0152 a601          	ld	a,#1
1075  0154 5d            	tnzw	x
1076  0155 2704          	jreq	L06
1077  0157               L26:
1078  0157 48            	sll	a
1079  0158 5a            	decw	x
1080  0159 26fc          	jrne	L26
1081  015b               L06:
1082  015b 43            	cpl	a
1083  015c c4543b        	and	a,21563
1084  015f c7543b        	ld	21563,a
1085  0162 202d          	jra	L114
1086  0164               L324:
1087                     ; 290     if (NewState != DISABLE)
1089  0164 0d04          	tnz	(OFST+2,sp)
1090  0166 2715          	jreq	L334
1091                     ; 293       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1093  0168 7b02          	ld	a,(OFST+0,sp)
1094  016a 5f            	clrw	x
1095  016b 97            	ld	xl,a
1096  016c a601          	ld	a,#1
1097  016e 5d            	tnzw	x
1098  016f 2704          	jreq	L46
1099  0171               L66:
1100  0171 48            	sll	a
1101  0172 5a            	decw	x
1102  0173 26fc          	jrne	L66
1103  0175               L46:
1104  0175 ca5457        	or	a,21591
1105  0178 c75457        	ld	21591,a
1107  017b 2014          	jra	L114
1108  017d               L334:
1109                     ; 298       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1111  017d 7b02          	ld	a,(OFST+0,sp)
1112  017f 5f            	clrw	x
1113  0180 97            	ld	xl,a
1114  0181 a601          	ld	a,#1
1115  0183 5d            	tnzw	x
1116  0184 2704          	jreq	L07
1117  0186               L27:
1118  0186 48            	sll	a
1119  0187 5a            	decw	x
1120  0188 26fc          	jrne	L27
1121  018a               L07:
1122  018a 43            	cpl	a
1123  018b c45457        	and	a,21591
1124  018e c75457        	ld	21591,a
1125  0191               L114:
1126                     ; 301 }
1129  0191 5b04          	addw	sp,#4
1130  0193 81            	ret
1210                     ; 313 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1210                     ; 314 {
1211                     	switch	.text
1212  0194               _SYSCFG_RIResistorConfig:
1214  0194 89            	pushw	x
1215       00000000      OFST:	set	0
1218                     ; 316   assert_param(IS_RI_RESISTOR(RI_Resistor));
1220                     ; 317   assert_param(IS_FUNCTIONAL_STATE(NewState));
1222                     ; 319   if (NewState != DISABLE)
1224  0195 9f            	ld	a,xl
1225  0196 4d            	tnz	a
1226  0197 2709          	jreq	L574
1227                     ; 322     RI->RCR |= (uint8_t) RI_Resistor;
1229  0199 9e            	ld	a,xh
1230  019a ca543f        	or	a,21567
1231  019d c7543f        	ld	21567,a
1233  01a0 2009          	jra	L774
1234  01a2               L574:
1235                     ; 327     RI->RCR &= (uint8_t) (~RI_Resistor);
1237  01a2 7b01          	ld	a,(OFST+1,sp)
1238  01a4 43            	cpl	a
1239  01a5 c4543f        	and	a,21567
1240  01a8 c7543f        	ld	21567,a
1241  01ab               L774:
1242                     ; 329 }
1245  01ab 85            	popw	x
1246  01ac 81            	ret
1269                     ; 361 void SYSCFG_REMAPDeInit(void)
1269                     ; 362 {
1270                     	switch	.text
1271  01ad               _SYSCFG_REMAPDeInit:
1275                     ; 364   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1277  01ad 350c509e      	mov	20638,#12
1278                     ; 367   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1280  01b1 725f509f      	clr	20639
1281                     ; 370   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1283  01b5 725f509d      	clr	20637
1284                     ; 371 }
1287  01b9 81            	ret
1505                     ; 404 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1505                     ; 405 {
1506                     	switch	.text
1507  01ba               _SYSCFG_REMAPPinConfig:
1509  01ba 89            	pushw	x
1510  01bb 88            	push	a
1511       00000001      OFST:	set	1
1514                     ; 406   uint8_t regindex = 0;
1516  01bc 0f01          	clr	(OFST+0,sp)
1517                     ; 408   assert_param(IS_REMAP_PIN(REMAP_Pin));
1519                     ; 409   assert_param(IS_FUNCTIONAL_STATE(NewState));
1521                     ; 412   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1523  01be 9e            	ld	a,xh
1524  01bf 6b01          	ld	(OFST+0,sp),a
1525                     ; 415   if (regindex == 0x01)
1527  01c1 7b01          	ld	a,(OFST+0,sp)
1528  01c3 a101          	cp	a,#1
1529  01c5 261e          	jrne	L316
1530                     ; 417     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1532  01c7 9f            	ld	a,xl
1533  01c8 97            	ld	xl,a
1534  01c9 a610          	ld	a,#16
1535  01cb 42            	mul	x,a
1536  01cc 9f            	ld	a,xl
1537  01cd aa0f          	or	a,#15
1538  01cf c4509e        	and	a,20638
1539  01d2 c7509e        	ld	20638,a
1540                     ; 418     if (NewState != DISABLE)
1542  01d5 0d06          	tnz	(OFST+5,sp)
1543  01d7 2742          	jreq	L716
1544                     ; 420       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1546  01d9 7b03          	ld	a,(OFST+2,sp)
1547  01db a4f0          	and	a,#240
1548  01dd ca509e        	or	a,20638
1549  01e0 c7509e        	ld	20638,a
1550  01e3 2036          	jra	L716
1551  01e5               L316:
1552                     ; 424   else if (regindex == 0x02)
1554  01e5 7b01          	ld	a,(OFST+0,sp)
1555  01e7 a102          	cp	a,#2
1556  01e9 2619          	jrne	L126
1557                     ; 426     if (NewState != DISABLE)
1559  01eb 0d06          	tnz	(OFST+5,sp)
1560  01ed 270a          	jreq	L326
1561                     ; 428       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1563  01ef c6509f        	ld	a,20639
1564  01f2 1a03          	or	a,(OFST+2,sp)
1565  01f4 c7509f        	ld	20639,a
1567  01f7 2022          	jra	L716
1568  01f9               L326:
1569                     ; 432       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1571  01f9 7b03          	ld	a,(OFST+2,sp)
1572  01fb 43            	cpl	a
1573  01fc c4509f        	and	a,20639
1574  01ff c7509f        	ld	20639,a
1575  0202 2017          	jra	L716
1576  0204               L126:
1577                     ; 438     if (NewState != DISABLE)
1579  0204 0d06          	tnz	(OFST+5,sp)
1580  0206 270a          	jreq	L136
1581                     ; 440       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1583  0208 c6509d        	ld	a,20637
1584  020b 1a03          	or	a,(OFST+2,sp)
1585  020d c7509d        	ld	20637,a
1587  0210 2009          	jra	L716
1588  0212               L136:
1589                     ; 444       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1591  0212 7b03          	ld	a,(OFST+2,sp)
1592  0214 43            	cpl	a
1593  0215 c4509d        	and	a,20637
1594  0218 c7509d        	ld	20637,a
1595  021b               L716:
1596                     ; 447 }
1599  021b 5b03          	addw	sp,#3
1600  021d 81            	ret
1706                     ; 463 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1706                     ; 464 {
1707                     	switch	.text
1708  021e               _SYSCFG_REMAPDMAChannelConfig:
1710  021e 88            	push	a
1711       00000000      OFST:	set	0
1714                     ; 466   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1716                     ; 469   if ((REMAP_DMAChannel & 0xF0) != RESET)
1718  021f a5f0          	bcp	a,#240
1719  0221 270a          	jreq	L776
1720                     ; 472     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1722  0223 c6509e        	ld	a,20638
1723  0226 a4f3          	and	a,#243
1724  0228 c7509e        	ld	20638,a
1726  022b 2008          	jra	L107
1727  022d               L776:
1728                     ; 478     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1730  022d c6509e        	ld	a,20638
1731  0230 a4fc          	and	a,#252
1732  0232 c7509e        	ld	20638,a
1733  0235               L107:
1734                     ; 481   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1736  0235 7b01          	ld	a,(OFST+1,sp)
1737  0237 a40f          	and	a,#15
1738  0239 ca509e        	or	a,20638
1739  023c c7509e        	ld	20638,a
1740                     ; 482 }
1743  023f 84            	pop	a
1744  0240 81            	ret
1757                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1758                     	xdef	_SYSCFG_REMAPPinConfig
1759                     	xdef	_SYSCFG_REMAPDeInit
1760                     	xdef	_SYSCFG_RIResistorConfig
1761                     	xdef	_SYSCFG_RIIOSwitchConfig
1762                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1763                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1764                     	xdef	_SYSCFG_RIDeInit
1783                     	end
