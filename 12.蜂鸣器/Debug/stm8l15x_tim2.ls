   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 162 void TIM2_DeInit(void)
  32                     ; 163 {
  34                     	switch	.text
  35  0000               _TIM2_DeInit:
  39                     ; 164   TIM2->CR1 = TIM_CR1_RESET_VALUE;
  41  0000 725f5250      	clr	21072
  42                     ; 165   TIM2->CR2 = TIM_CR2_RESET_VALUE;
  44  0004 725f5251      	clr	21073
  45                     ; 166   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  47  0008 725f5252      	clr	21074
  48                     ; 167   TIM2->ETR = TIM_ETR_RESET_VALUE;
  50  000c 725f5253      	clr	21075
  51                     ; 168   TIM2->IER = TIM_IER_RESET_VALUE;
  53  0010 725f5255      	clr	21077
  54                     ; 169   TIM2->SR2 = TIM_SR2_RESET_VALUE;
  56  0014 725f5257      	clr	21079
  57                     ; 172   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  59  0018 725f525b      	clr	21083
  60                     ; 174   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  62  001c 35015259      	mov	21081,#1
  63                     ; 175   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  65  0020 3501525a      	mov	21082,#1
  66                     ; 178   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  68  0024 725f525b      	clr	21083
  69                     ; 179   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  71  0028 725f5259      	clr	21081
  72                     ; 180   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  74  002c 725f525a      	clr	21082
  75                     ; 182   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  77  0030 725f525c      	clr	21084
  78                     ; 183   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  80  0034 725f525d      	clr	21085
  81                     ; 185   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
  83  0038 725f525e      	clr	21086
  84                     ; 187   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
  86  003c 35ff525f      	mov	21087,#255
  87                     ; 188   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
  89  0040 35ff5260      	mov	21088,#255
  90                     ; 190   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
  92  0044 725f5261      	clr	21089
  93                     ; 191   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
  95  0048 725f5262      	clr	21090
  96                     ; 192   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
  98  004c 725f5263      	clr	21091
  99                     ; 193   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 101  0050 725f5264      	clr	21092
 102                     ; 196   TIM2->OISR = TIM_OISR_RESET_VALUE;
 104  0054 725f5266      	clr	21094
 105                     ; 197   TIM2->EGR = 0x01;/* TIM_EGR_UG */
 107  0058 35015258      	mov	21080,#1
 108                     ; 198   TIM2->BKR = TIM_BKR_RESET_VALUE;
 110  005c 725f5265      	clr	21093
 111                     ; 199   TIM2->SR1 = TIM_SR1_RESET_VALUE;
 113  0060 725f5256      	clr	21078
 114                     ; 200 }
 117  0064 81            	ret
 279                     ; 225 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 279                     ; 226                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 279                     ; 227                        uint16_t TIM2_Period)
 279                     ; 228 {
 280                     	switch	.text
 281  0065               _TIM2_TimeBaseInit:
 283  0065 89            	pushw	x
 284       00000000      OFST:	set	0
 287                     ; 230   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 289                     ; 231   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 291                     ; 236   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 293  0066 7b05          	ld	a,(OFST+5,sp)
 294  0068 c7525f        	ld	21087,a
 295                     ; 237   TIM2->ARRL = (uint8_t)(TIM2_Period);
 297  006b 7b06          	ld	a,(OFST+6,sp)
 298  006d c75260        	ld	21088,a
 299                     ; 240   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 301  0070 9e            	ld	a,xh
 302  0071 c7525e        	ld	21086,a
 303                     ; 243   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 305  0074 c65250        	ld	a,21072
 306  0077 a48f          	and	a,#143
 307  0079 c75250        	ld	21072,a
 308                     ; 244   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 310  007c 9f            	ld	a,xl
 311  007d ca5250        	or	a,21072
 312  0080 c75250        	ld	21072,a
 313                     ; 247   TIM2->EGR = TIM2_EventSource_Update;
 315  0083 35015258      	mov	21080,#1
 316                     ; 248 }
 319  0087 85            	popw	x
 320  0088 81            	ret
 388                     ; 268 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
 388                     ; 269                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
 388                     ; 270 {
 389                     	switch	.text
 390  0089               _TIM2_PrescalerConfig:
 394                     ; 272   assert_param(IS_TIM2_PRESCALER(Prescaler));
 396                     ; 273   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
 398                     ; 276   TIM2->PSCR = (uint8_t)(Prescaler);
 400  0089 9e            	ld	a,xh
 401  008a c7525e        	ld	21086,a
 402                     ; 279   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
 404  008d 9f            	ld	a,xl
 405  008e a101          	cp	a,#1
 406  0090 2606          	jrne	L741
 407                     ; 281     TIM2->EGR |= TIM_EGR_UG ;
 409  0092 72105258      	bset	21080,#0
 411  0096 2004          	jra	L151
 412  0098               L741:
 413                     ; 285     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 415  0098 72115258      	bres	21080,#0
 416  009c               L151:
 417                     ; 287 }
 420  009c 81            	ret
 465                     ; 300 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
 465                     ; 301 {
 466                     	switch	.text
 467  009d               _TIM2_CounterModeConfig:
 469  009d 88            	push	a
 470  009e 88            	push	a
 471       00000001      OFST:	set	1
 474                     ; 302   uint8_t tmpcr1 = 0;
 476  009f 0f01          	clr	(OFST+0,sp)
 477                     ; 305   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 479                     ; 307   tmpcr1 = TIM2->CR1;
 481  00a1 c65250        	ld	a,21072
 482  00a4 6b01          	ld	(OFST+0,sp),a
 483                     ; 310   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 485  00a6 7b01          	ld	a,(OFST+0,sp)
 486  00a8 a48f          	and	a,#143
 487  00aa 6b01          	ld	(OFST+0,sp),a
 488                     ; 313   tmpcr1 |= (uint8_t)TIM2_CounterMode;
 490  00ac 7b01          	ld	a,(OFST+0,sp)
 491  00ae 1a02          	or	a,(OFST+1,sp)
 492  00b0 6b01          	ld	(OFST+0,sp),a
 493                     ; 315   TIM2->CR1 = tmpcr1;
 495  00b2 7b01          	ld	a,(OFST+0,sp)
 496  00b4 c75250        	ld	21072,a
 497                     ; 316 }
 500  00b7 85            	popw	x
 501  00b8 81            	ret
 535                     ; 324 void TIM2_SetCounter(uint16_t Counter)
 535                     ; 325 {
 536                     	switch	.text
 537  00b9               _TIM2_SetCounter:
 541                     ; 328   TIM2->CNTRH = (uint8_t)(Counter >> 8);
 543  00b9 9e            	ld	a,xh
 544  00ba c7525c        	ld	21084,a
 545                     ; 329   TIM2->CNTRL = (uint8_t)(Counter);
 547  00bd 9f            	ld	a,xl
 548  00be c7525d        	ld	21085,a
 549                     ; 330 }
 552  00c1 81            	ret
 586                     ; 338 void TIM2_SetAutoreload(uint16_t Autoreload)
 586                     ; 339 {
 587                     	switch	.text
 588  00c2               _TIM2_SetAutoreload:
 592                     ; 341   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
 594  00c2 9e            	ld	a,xh
 595  00c3 c7525f        	ld	21087,a
 596                     ; 342   TIM2->ARRL = (uint8_t)(Autoreload);
 598  00c6 9f            	ld	a,xl
 599  00c7 c75260        	ld	21088,a
 600                     ; 343 }
 603  00ca 81            	ret
 655                     ; 350 uint16_t TIM2_GetCounter(void)
 655                     ; 351 {
 656                     	switch	.text
 657  00cb               _TIM2_GetCounter:
 659  00cb 5204          	subw	sp,#4
 660       00000004      OFST:	set	4
 663                     ; 352   uint16_t tmpcnt = 0;
 665  00cd 1e03          	ldw	x,(OFST-1,sp)
 666                     ; 355   tmpcntrh = TIM2->CNTRH;
 668  00cf c6525c        	ld	a,21084
 669  00d2 6b02          	ld	(OFST-2,sp),a
 670                     ; 356   tmpcntrl = TIM2->CNTRL;
 672  00d4 c6525d        	ld	a,21085
 673  00d7 6b01          	ld	(OFST-3,sp),a
 674                     ; 358   tmpcnt = (uint16_t)(tmpcntrl);
 676  00d9 7b01          	ld	a,(OFST-3,sp)
 677  00db 5f            	clrw	x
 678  00dc 97            	ld	xl,a
 679  00dd 1f03          	ldw	(OFST-1,sp),x
 680                     ; 359   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 682  00df 7b02          	ld	a,(OFST-2,sp)
 683  00e1 5f            	clrw	x
 684  00e2 97            	ld	xl,a
 685  00e3 4f            	clr	a
 686  00e4 02            	rlwa	x,a
 687  00e5 01            	rrwa	x,a
 688  00e6 1a04          	or	a,(OFST+0,sp)
 689  00e8 01            	rrwa	x,a
 690  00e9 1a03          	or	a,(OFST-1,sp)
 691  00eb 01            	rrwa	x,a
 692  00ec 1f03          	ldw	(OFST-1,sp),x
 693                     ; 361   return ((uint16_t)tmpcnt);
 695  00ee 1e03          	ldw	x,(OFST-1,sp)
 698  00f0 5b04          	addw	sp,#4
 699  00f2 81            	ret
 723                     ; 377 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
 723                     ; 378 {
 724                     	switch	.text
 725  00f3               _TIM2_GetPrescaler:
 729                     ; 380   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
 731  00f3 c6525e        	ld	a,21086
 734  00f6 81            	ret
 790                     ; 390 void TIM2_UpdateDisableConfig(FunctionalState NewState)
 790                     ; 391 {
 791                     	switch	.text
 792  00f7               _TIM2_UpdateDisableConfig:
 796                     ; 393   assert_param(IS_FUNCTIONAL_STATE(NewState));
 798                     ; 396   if (NewState != DISABLE)
 800  00f7 4d            	tnz	a
 801  00f8 2706          	jreq	L513
 802                     ; 398     TIM2->CR1 |= TIM_CR1_UDIS;
 804  00fa 72125250      	bset	21072,#1
 806  00fe 2004          	jra	L713
 807  0100               L513:
 808                     ; 402     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 810  0100 72135250      	bres	21072,#1
 811  0104               L713:
 812                     ; 404 }
 815  0104 81            	ret
 873                     ; 414 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
 873                     ; 415 {
 874                     	switch	.text
 875  0105               _TIM2_UpdateRequestConfig:
 879                     ; 417   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
 881                     ; 420   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
 883  0105 a101          	cp	a,#1
 884  0107 2606          	jrne	L743
 885                     ; 422     TIM2->CR1 |= TIM_CR1_URS ;
 887  0109 72145250      	bset	21072,#2
 889  010d 2004          	jra	L153
 890  010f               L743:
 891                     ; 426     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
 893  010f 72155250      	bres	21072,#2
 894  0113               L153:
 895                     ; 428 }
 898  0113 81            	ret
 934                     ; 436 void TIM2_ARRPreloadConfig(FunctionalState NewState)
 934                     ; 437 {
 935                     	switch	.text
 936  0114               _TIM2_ARRPreloadConfig:
 940                     ; 439   assert_param(IS_FUNCTIONAL_STATE(NewState));
 942                     ; 442   if (NewState != DISABLE)
 944  0114 4d            	tnz	a
 945  0115 2706          	jreq	L173
 946                     ; 444     TIM2->CR1 |= TIM_CR1_ARPE;
 948  0117 721e5250      	bset	21072,#7
 950  011b 2004          	jra	L373
 951  011d               L173:
 952                     ; 448     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 954  011d 721f5250      	bres	21072,#7
 955  0121               L373:
 956                     ; 450 }
 959  0121 81            	ret
1016                     ; 460 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1016                     ; 461 {
1017                     	switch	.text
1018  0122               _TIM2_SelectOnePulseMode:
1022                     ; 463   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
1024                     ; 466   if (TIM2_OPMode == TIM2_OPMode_Single)
1026  0122 a101          	cp	a,#1
1027  0124 2606          	jrne	L324
1028                     ; 468     TIM2->CR1 |= TIM_CR1_OPM ;
1030  0126 72165250      	bset	21072,#3
1032  012a 2004          	jra	L524
1033  012c               L324:
1034                     ; 472     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1036  012c 72175250      	bres	21072,#3
1037  0130               L524:
1038                     ; 474 }
1041  0130 81            	ret
1076                     ; 482 void TIM2_Cmd(FunctionalState NewState)
1076                     ; 483 {
1077                     	switch	.text
1078  0131               _TIM2_Cmd:
1082                     ; 485   assert_param(IS_FUNCTIONAL_STATE(NewState));
1084                     ; 488   if (NewState != DISABLE)
1086  0131 4d            	tnz	a
1087  0132 2706          	jreq	L544
1088                     ; 490     TIM2->CR1 |= TIM_CR1_CEN;
1090  0134 72105250      	bset	21072,#0
1092  0138 2004          	jra	L744
1093  013a               L544:
1094                     ; 494     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1096  013a 72115250      	bres	21072,#0
1097  013e               L744:
1098                     ; 496 }
1101  013e 81            	ret
1299                     ; 572 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
1299                     ; 573                   TIM2_OutputState_TypeDef TIM2_OutputState,
1299                     ; 574                   uint16_t TIM2_Pulse,
1299                     ; 575                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
1299                     ; 576                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
1299                     ; 577 {
1300                     	switch	.text
1301  013f               _TIM2_OC1Init:
1303  013f 89            	pushw	x
1304  0140 88            	push	a
1305       00000001      OFST:	set	1
1308                     ; 578   uint8_t tmpccmr1 = 0;
1310  0141 0f01          	clr	(OFST+0,sp)
1311                     ; 581   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
1313                     ; 582   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
1315                     ; 583   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
1317                     ; 584   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
1319                     ; 586   tmpccmr1 = TIM2->CCMR1;
1321  0143 c65259        	ld	a,21081
1322  0146 6b01          	ld	(OFST+0,sp),a
1323                     ; 589   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1325  0148 7211525b      	bres	21083,#0
1326                     ; 591   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1328  014c 7b01          	ld	a,(OFST+0,sp)
1329  014e a48f          	and	a,#143
1330  0150 6b01          	ld	(OFST+0,sp),a
1331                     ; 594   tmpccmr1 |= (uint8_t)TIM2_OCMode;
1333  0152 9e            	ld	a,xh
1334  0153 1a01          	or	a,(OFST+0,sp)
1335  0155 6b01          	ld	(OFST+0,sp),a
1336                     ; 596   TIM2->CCMR1 = tmpccmr1;
1338  0157 7b01          	ld	a,(OFST+0,sp)
1339  0159 c75259        	ld	21081,a
1340                     ; 599   if (TIM2_OutputState == TIM2_OutputState_Enable)
1342  015c 9f            	ld	a,xl
1343  015d a101          	cp	a,#1
1344  015f 2606          	jrne	L365
1345                     ; 601     TIM2->CCER1 |= TIM_CCER1_CC1E;
1347  0161 7210525b      	bset	21083,#0
1349  0165 2004          	jra	L565
1350  0167               L365:
1351                     ; 605     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1353  0167 7211525b      	bres	21083,#0
1354  016b               L565:
1355                     ; 609   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
1357  016b 7b08          	ld	a,(OFST+7,sp)
1358  016d a101          	cp	a,#1
1359  016f 2606          	jrne	L765
1360                     ; 611     TIM2->CCER1 |= TIM_CCER1_CC1P;
1362  0171 7212525b      	bset	21083,#1
1364  0175 2004          	jra	L175
1365  0177               L765:
1366                     ; 615     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1368  0177 7213525b      	bres	21083,#1
1369  017b               L175:
1370                     ; 619   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
1372  017b 7b09          	ld	a,(OFST+8,sp)
1373  017d a101          	cp	a,#1
1374  017f 2606          	jrne	L375
1375                     ; 621     TIM2->OISR |= TIM_OISR_OIS1;
1377  0181 72105266      	bset	21094,#0
1379  0185 2004          	jra	L575
1380  0187               L375:
1381                     ; 625     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1383  0187 72115266      	bres	21094,#0
1384  018b               L575:
1385                     ; 629   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
1387  018b 7b06          	ld	a,(OFST+5,sp)
1388  018d c75261        	ld	21089,a
1389                     ; 630   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
1391  0190 7b07          	ld	a,(OFST+6,sp)
1392  0192 c75262        	ld	21090,a
1393                     ; 631 }
1396  0195 5b03          	addw	sp,#3
1397  0197 81            	ret
1480                     ; 658 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
1480                     ; 659                   TIM2_OutputState_TypeDef TIM2_OutputState,
1480                     ; 660                   uint16_t TIM2_Pulse,
1480                     ; 661                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
1480                     ; 662                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
1480                     ; 663 {
1481                     	switch	.text
1482  0198               _TIM2_OC2Init:
1484  0198 89            	pushw	x
1485  0199 88            	push	a
1486       00000001      OFST:	set	1
1489                     ; 664   uint8_t tmpccmr2 = 0;
1491  019a 0f01          	clr	(OFST+0,sp)
1492                     ; 667   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
1494                     ; 668   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
1496                     ; 669   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
1498                     ; 670   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
1500                     ; 672   tmpccmr2 = TIM2->CCMR2;
1502  019c c6525a        	ld	a,21082
1503  019f 6b01          	ld	(OFST+0,sp),a
1504                     ; 675   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1506  01a1 7219525b      	bres	21083,#4
1507                     ; 678   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1509  01a5 7b01          	ld	a,(OFST+0,sp)
1510  01a7 a48f          	and	a,#143
1511  01a9 6b01          	ld	(OFST+0,sp),a
1512                     ; 681   tmpccmr2 |= (uint8_t)TIM2_OCMode;
1514  01ab 9e            	ld	a,xh
1515  01ac 1a01          	or	a,(OFST+0,sp)
1516  01ae 6b01          	ld	(OFST+0,sp),a
1517                     ; 683   TIM2->CCMR2 = tmpccmr2;
1519  01b0 7b01          	ld	a,(OFST+0,sp)
1520  01b2 c7525a        	ld	21082,a
1521                     ; 686   if (TIM2_OutputState == TIM2_OutputState_Enable)
1523  01b5 9f            	ld	a,xl
1524  01b6 a101          	cp	a,#1
1525  01b8 2606          	jrne	L146
1526                     ; 688     TIM2->CCER1 |= TIM_CCER1_CC2E;
1528  01ba 7218525b      	bset	21083,#4
1530  01be 2004          	jra	L346
1531  01c0               L146:
1532                     ; 692     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1534  01c0 7219525b      	bres	21083,#4
1535  01c4               L346:
1536                     ; 696   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
1538  01c4 7b08          	ld	a,(OFST+7,sp)
1539  01c6 a101          	cp	a,#1
1540  01c8 2606          	jrne	L546
1541                     ; 698     TIM2->CCER1 |= TIM_CCER1_CC2P;
1543  01ca 721a525b      	bset	21083,#5
1545  01ce 2004          	jra	L746
1546  01d0               L546:
1547                     ; 702     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1549  01d0 721b525b      	bres	21083,#5
1550  01d4               L746:
1551                     ; 707   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
1553  01d4 7b09          	ld	a,(OFST+8,sp)
1554  01d6 a101          	cp	a,#1
1555  01d8 2606          	jrne	L156
1556                     ; 709     TIM2->OISR |= TIM_OISR_OIS2;
1558  01da 72145266      	bset	21094,#2
1560  01de 2004          	jra	L356
1561  01e0               L156:
1562                     ; 713     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1564  01e0 72155266      	bres	21094,#2
1565  01e4               L356:
1566                     ; 717   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
1568  01e4 7b06          	ld	a,(OFST+5,sp)
1569  01e6 c75263        	ld	21091,a
1570                     ; 718   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
1572  01e9 7b07          	ld	a,(OFST+6,sp)
1573  01eb c75264        	ld	21092,a
1574                     ; 719 }
1577  01ee 5b03          	addw	sp,#3
1578  01f0 81            	ret
1776                     ; 748 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1776                     ; 749                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1776                     ; 750                     TIM2_BreakState_TypeDef TIM2_BreakState,
1776                     ; 751                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1776                     ; 752                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1776                     ; 753 
1776                     ; 754 {
1777                     	switch	.text
1778  01f1               _TIM2_BKRConfig:
1780  01f1 89            	pushw	x
1781  01f2 88            	push	a
1782       00000001      OFST:	set	1
1785                     ; 756   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1787                     ; 757   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1789                     ; 758   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1791                     ; 759   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1793                     ; 760   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1795                     ; 766   TIM2->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel) | \
1795                     ; 767                                   (uint8_t)((uint8_t)TIM2_BreakState | (uint8_t)TIM2_BreakPolarity)) | \
1795                     ; 768                                   TIM2_AutomaticOutput));
1797  01f3 7b06          	ld	a,(OFST+5,sp)
1798  01f5 1a07          	or	a,(OFST+6,sp)
1799  01f7 6b01          	ld	(OFST+0,sp),a
1800  01f9 9f            	ld	a,xl
1801  01fa 1a02          	or	a,(OFST+1,sp)
1802  01fc 1a01          	or	a,(OFST+0,sp)
1803  01fe 1a08          	or	a,(OFST+7,sp)
1804  0200 c75265        	ld	21093,a
1805                     ; 769 }
1808  0203 5b03          	addw	sp,#3
1809  0205 81            	ret
1845                     ; 777 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1845                     ; 778 {
1846                     	switch	.text
1847  0206               _TIM2_CtrlPWMOutputs:
1851                     ; 780   assert_param(IS_FUNCTIONAL_STATE(NewState));
1853                     ; 784   if (NewState != DISABLE)
1855  0206 4d            	tnz	a
1856  0207 2706          	jreq	L5001
1857                     ; 786     TIM2->BKR |= TIM_BKR_MOE ;
1859  0209 721e5265      	bset	21093,#7
1861  020d 2004          	jra	L7001
1862  020f               L5001:
1863                     ; 790     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1865  020f 721f5265      	bres	21093,#7
1866  0213               L7001:
1867                     ; 792 }
1870  0213 81            	ret
1935                     ; 812 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
1935                     ; 813                      TIM2_OCMode_TypeDef TIM2_OCMode)
1935                     ; 814 {
1936                     	switch	.text
1937  0214               _TIM2_SelectOCxM:
1939  0214 89            	pushw	x
1940       00000000      OFST:	set	0
1943                     ; 816   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1945                     ; 817   assert_param(IS_TIM2_OCM(TIM2_OCMode));
1947                     ; 819   if (TIM2_Channel == TIM2_Channel_1)
1949  0215 9e            	ld	a,xh
1950  0216 4d            	tnz	a
1951  0217 2615          	jrne	L3401
1952                     ; 822     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1954  0219 7211525b      	bres	21083,#0
1955                     ; 825     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1957  021d c65259        	ld	a,21081
1958  0220 a48f          	and	a,#143
1959  0222 c75259        	ld	21081,a
1960                     ; 828     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
1962  0225 9f            	ld	a,xl
1963  0226 ca5259        	or	a,21081
1964  0229 c75259        	ld	21081,a
1966  022c 2014          	jra	L5401
1967  022e               L3401:
1968                     ; 833     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1970  022e 7219525b      	bres	21083,#4
1971                     ; 836     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1973  0232 c6525a        	ld	a,21082
1974  0235 a48f          	and	a,#143
1975  0237 c7525a        	ld	21082,a
1976                     ; 839     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
1978  023a c6525a        	ld	a,21082
1979  023d 1a02          	or	a,(OFST+2,sp)
1980  023f c7525a        	ld	21082,a
1981  0242               L5401:
1982                     ; 841 }
1985  0242 85            	popw	x
1986  0243 81            	ret
2020                     ; 849 void TIM2_SetCompare1(uint16_t Compare)
2020                     ; 850 {
2021                     	switch	.text
2022  0244               _TIM2_SetCompare1:
2026                     ; 852   TIM2->CCR1H = (uint8_t)(Compare >> 8);
2028  0244 9e            	ld	a,xh
2029  0245 c75261        	ld	21089,a
2030                     ; 853   TIM2->CCR1L = (uint8_t)(Compare);
2032  0248 9f            	ld	a,xl
2033  0249 c75262        	ld	21090,a
2034                     ; 854 }
2037  024c 81            	ret
2071                     ; 862 void TIM2_SetCompare2(uint16_t Compare)
2071                     ; 863 {
2072                     	switch	.text
2073  024d               _TIM2_SetCompare2:
2077                     ; 865   TIM2->CCR2H = (uint8_t)(Compare >> 8);
2079  024d 9e            	ld	a,xh
2080  024e c75263        	ld	21091,a
2081                     ; 866   TIM2->CCR2L = (uint8_t)(Compare);
2083  0251 9f            	ld	a,xl
2084  0252 c75264        	ld	21092,a
2085                     ; 867 }
2088  0255 81            	ret
2155                     ; 877 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2155                     ; 878 {
2156                     	switch	.text
2157  0256               _TIM2_ForcedOC1Config:
2159  0256 88            	push	a
2160  0257 88            	push	a
2161       00000001      OFST:	set	1
2164                     ; 879   uint8_t tmpccmr1 = 0;
2166  0258 0f01          	clr	(OFST+0,sp)
2167                     ; 882   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
2169                     ; 884   tmpccmr1 = TIM2->CCMR1;
2171  025a c65259        	ld	a,21081
2172  025d 6b01          	ld	(OFST+0,sp),a
2173                     ; 887   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2175  025f 7b01          	ld	a,(OFST+0,sp)
2176  0261 a48f          	and	a,#143
2177  0263 6b01          	ld	(OFST+0,sp),a
2178                     ; 890   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
2180  0265 7b01          	ld	a,(OFST+0,sp)
2181  0267 1a02          	or	a,(OFST+1,sp)
2182  0269 6b01          	ld	(OFST+0,sp),a
2183                     ; 892   TIM2->CCMR1 = tmpccmr1;
2185  026b 7b01          	ld	a,(OFST+0,sp)
2186  026d c75259        	ld	21081,a
2187                     ; 893 }
2190  0270 85            	popw	x
2191  0271 81            	ret
2236                     ; 903 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2236                     ; 904 {
2237                     	switch	.text
2238  0272               _TIM2_ForcedOC2Config:
2240  0272 88            	push	a
2241  0273 88            	push	a
2242       00000001      OFST:	set	1
2245                     ; 905   uint8_t tmpccmr2 = 0;
2247  0274 0f01          	clr	(OFST+0,sp)
2248                     ; 908   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
2250                     ; 910   tmpccmr2 = TIM2->CCMR2;
2252  0276 c6525a        	ld	a,21082
2253  0279 6b01          	ld	(OFST+0,sp),a
2254                     ; 913   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2256  027b 7b01          	ld	a,(OFST+0,sp)
2257  027d a48f          	and	a,#143
2258  027f 6b01          	ld	(OFST+0,sp),a
2259                     ; 916   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
2261  0281 7b01          	ld	a,(OFST+0,sp)
2262  0283 1a02          	or	a,(OFST+1,sp)
2263  0285 6b01          	ld	(OFST+0,sp),a
2264                     ; 918   TIM2->CCMR2 = tmpccmr2;
2266  0287 7b01          	ld	a,(OFST+0,sp)
2267  0289 c7525a        	ld	21082,a
2268                     ; 919 }
2271  028c 85            	popw	x
2272  028d 81            	ret
2308                     ; 927 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2308                     ; 928 {
2309                     	switch	.text
2310  028e               _TIM2_OC1PreloadConfig:
2314                     ; 930   assert_param(IS_FUNCTIONAL_STATE(NewState));
2316                     ; 933   if (NewState != DISABLE)
2318  028e 4d            	tnz	a
2319  028f 2706          	jreq	L5711
2320                     ; 935     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
2322  0291 72165259      	bset	21081,#3
2324  0295 2004          	jra	L7711
2325  0297               L5711:
2326                     ; 939     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2328  0297 72175259      	bres	21081,#3
2329  029b               L7711:
2330                     ; 941 }
2333  029b 81            	ret
2369                     ; 949 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2369                     ; 950 {
2370                     	switch	.text
2371  029c               _TIM2_OC2PreloadConfig:
2375                     ; 952   assert_param(IS_FUNCTIONAL_STATE(NewState));
2377                     ; 955   if (NewState != DISABLE)
2379  029c 4d            	tnz	a
2380  029d 2706          	jreq	L7121
2381                     ; 957     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
2383  029f 7216525a      	bset	21082,#3
2385  02a3 2004          	jra	L1221
2386  02a5               L7121:
2387                     ; 961     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2389  02a5 7217525a      	bres	21082,#3
2390  02a9               L1221:
2391                     ; 963 }
2394  02a9 81            	ret
2429                     ; 971 void TIM2_OC1FastConfig(FunctionalState NewState)
2429                     ; 972 {
2430                     	switch	.text
2431  02aa               _TIM2_OC1FastConfig:
2435                     ; 974   assert_param(IS_FUNCTIONAL_STATE(NewState));
2437                     ; 977   if (NewState != DISABLE)
2439  02aa 4d            	tnz	a
2440  02ab 2706          	jreq	L1421
2441                     ; 979     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
2443  02ad 72145259      	bset	21081,#2
2445  02b1 2004          	jra	L3421
2446  02b3               L1421:
2447                     ; 983     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2449  02b3 72155259      	bres	21081,#2
2450  02b7               L3421:
2451                     ; 985 }
2454  02b7 81            	ret
2489                     ; 994 void TIM2_OC2FastConfig(FunctionalState NewState)
2489                     ; 995 {
2490                     	switch	.text
2491  02b8               _TIM2_OC2FastConfig:
2495                     ; 997   assert_param(IS_FUNCTIONAL_STATE(NewState));
2497                     ; 1000   if (NewState != DISABLE)
2499  02b8 4d            	tnz	a
2500  02b9 2706          	jreq	L3621
2501                     ; 1002     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
2503  02bb 7214525a      	bset	21082,#2
2505  02bf 2004          	jra	L5621
2506  02c1               L3621:
2507                     ; 1006     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2509  02c1 7215525a      	bres	21082,#2
2510  02c5               L5621:
2511                     ; 1008 }
2514  02c5 81            	ret
2550                     ; 1018 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2550                     ; 1019 {
2551                     	switch	.text
2552  02c6               _TIM2_OC1PolarityConfig:
2556                     ; 1021   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
2558                     ; 1024   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
2560  02c6 a101          	cp	a,#1
2561  02c8 2606          	jrne	L5031
2562                     ; 1026     TIM2->CCER1 |= TIM_CCER1_CC1P ;
2564  02ca 7212525b      	bset	21083,#1
2566  02ce 2004          	jra	L7031
2567  02d0               L5031:
2568                     ; 1030     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2570  02d0 7213525b      	bres	21083,#1
2571  02d4               L7031:
2572                     ; 1032 }
2575  02d4 81            	ret
2611                     ; 1042 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2611                     ; 1043 {
2612                     	switch	.text
2613  02d5               _TIM2_OC2PolarityConfig:
2617                     ; 1045   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
2619                     ; 1048   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
2621  02d5 a101          	cp	a,#1
2622  02d7 2606          	jrne	L7231
2623                     ; 1050     TIM2->CCER1 |= TIM_CCER1_CC2P ;
2625  02d9 721a525b      	bset	21083,#5
2627  02dd 2004          	jra	L1331
2628  02df               L7231:
2629                     ; 1054     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2631  02df 721b525b      	bres	21083,#5
2632  02e3               L1331:
2633                     ; 1056 }
2636  02e3 81            	ret
2681                     ; 1068 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
2681                     ; 1069                  FunctionalState NewState)
2681                     ; 1070 {
2682                     	switch	.text
2683  02e4               _TIM2_CCxCmd:
2685  02e4 89            	pushw	x
2686       00000000      OFST:	set	0
2689                     ; 1072   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
2691                     ; 1073   assert_param(IS_FUNCTIONAL_STATE(NewState));
2693                     ; 1075   if (TIM2_Channel == TIM2_Channel_1)
2695  02e5 9e            	ld	a,xh
2696  02e6 4d            	tnz	a
2697  02e7 2610          	jrne	L5531
2698                     ; 1078     if (NewState != DISABLE)
2700  02e9 9f            	ld	a,xl
2701  02ea 4d            	tnz	a
2702  02eb 2706          	jreq	L7531
2703                     ; 1080       TIM2->CCER1 |= TIM_CCER1_CC1E ;
2705  02ed 7210525b      	bset	21083,#0
2707  02f1 2014          	jra	L3631
2708  02f3               L7531:
2709                     ; 1084       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2711  02f3 7211525b      	bres	21083,#0
2712  02f7 200e          	jra	L3631
2713  02f9               L5531:
2714                     ; 1091     if (NewState != DISABLE)
2716  02f9 0d02          	tnz	(OFST+2,sp)
2717  02fb 2706          	jreq	L5631
2718                     ; 1093       TIM2->CCER1 |= TIM_CCER1_CC2E;
2720  02fd 7218525b      	bset	21083,#4
2722  0301 2004          	jra	L3631
2723  0303               L5631:
2724                     ; 1097       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2726  0303 7219525b      	bres	21083,#4
2727  0307               L3631:
2728                     ; 1100 }
2731  0307 85            	popw	x
2732  0308 81            	ret
2896                     ; 1178 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
2896                     ; 1179                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2896                     ; 1180                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
2896                     ; 1181                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
2896                     ; 1182                  uint8_t TIM2_ICFilter)
2896                     ; 1183 {
2897                     	switch	.text
2898  0309               _TIM2_ICInit:
2900  0309 89            	pushw	x
2901       00000000      OFST:	set	0
2904                     ; 1185   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
2906                     ; 1187   if (TIM2_Channel == TIM2_Channel_1)
2908  030a 9e            	ld	a,xh
2909  030b 4d            	tnz	a
2910  030c 2614          	jrne	L5641
2911                     ; 1190     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
2913  030e 7b07          	ld	a,(OFST+7,sp)
2914  0310 88            	push	a
2915  0311 7b06          	ld	a,(OFST+6,sp)
2916  0313 97            	ld	xl,a
2917  0314 7b03          	ld	a,(OFST+3,sp)
2918  0316 95            	ld	xh,a
2919  0317 cd064f        	call	L3_TI1_Config
2921  031a 84            	pop	a
2922                     ; 1193     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
2924  031b 7b06          	ld	a,(OFST+6,sp)
2925  031d cd03fa        	call	_TIM2_SetIC1Prescaler
2928  0320 2012          	jra	L7641
2929  0322               L5641:
2930                     ; 1198     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
2932  0322 7b07          	ld	a,(OFST+7,sp)
2933  0324 88            	push	a
2934  0325 7b06          	ld	a,(OFST+6,sp)
2935  0327 97            	ld	xl,a
2936  0328 7b03          	ld	a,(OFST+3,sp)
2937  032a 95            	ld	xh,a
2938  032b cd0690        	call	L5_TI2_Config
2940  032e 84            	pop	a
2941                     ; 1201     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
2943  032f 7b06          	ld	a,(OFST+6,sp)
2944  0331 cd0416        	call	_TIM2_SetIC2Prescaler
2946  0334               L7641:
2947                     ; 1203 }
2950  0334 85            	popw	x
2951  0335 81            	ret
3047                     ; 1229 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
3047                     ; 1230                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
3047                     ; 1231                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
3047                     ; 1232                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
3047                     ; 1233                      uint8_t TIM2_ICFilter)
3047                     ; 1234 {
3048                     	switch	.text
3049  0336               _TIM2_PWMIConfig:
3051  0336 89            	pushw	x
3052  0337 89            	pushw	x
3053       00000002      OFST:	set	2
3056                     ; 1235   uint8_t icpolarity = TIM2_ICPolarity_Rising;
3058  0338 7b01          	ld	a,(OFST-1,sp)
3059  033a 97            	ld	xl,a
3060                     ; 1236   uint8_t icselection = TIM2_ICSelection_DirectTI;
3062  033b 7b02          	ld	a,(OFST+0,sp)
3063  033d 97            	ld	xl,a
3064                     ; 1239   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
3066                     ; 1242   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
3068  033e 0d04          	tnz	(OFST+2,sp)
3069  0340 2606          	jrne	L7351
3070                     ; 1244     icpolarity = TIM2_ICPolarity_Falling;
3072  0342 a601          	ld	a,#1
3073  0344 6b01          	ld	(OFST-1,sp),a
3075  0346 2002          	jra	L1451
3076  0348               L7351:
3077                     ; 1248     icpolarity = TIM2_ICPolarity_Rising;
3079  0348 0f01          	clr	(OFST-1,sp)
3080  034a               L1451:
3081                     ; 1252   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
3083  034a 7b07          	ld	a,(OFST+5,sp)
3084  034c a101          	cp	a,#1
3085  034e 2606          	jrne	L3451
3086                     ; 1254     icselection = TIM2_ICSelection_IndirectTI;
3088  0350 a602          	ld	a,#2
3089  0352 6b02          	ld	(OFST+0,sp),a
3091  0354 2004          	jra	L5451
3092  0356               L3451:
3093                     ; 1258     icselection = TIM2_ICSelection_DirectTI;
3095  0356 a601          	ld	a,#1
3096  0358 6b02          	ld	(OFST+0,sp),a
3097  035a               L5451:
3098                     ; 1261   if (TIM2_Channel == TIM2_Channel_1)
3100  035a 0d03          	tnz	(OFST+1,sp)
3101  035c 2626          	jrne	L7451
3102                     ; 1264     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
3102                     ; 1265                TIM2_ICFilter);
3104  035e 7b09          	ld	a,(OFST+7,sp)
3105  0360 88            	push	a
3106  0361 7b08          	ld	a,(OFST+6,sp)
3107  0363 97            	ld	xl,a
3108  0364 7b05          	ld	a,(OFST+3,sp)
3109  0366 95            	ld	xh,a
3110  0367 cd064f        	call	L3_TI1_Config
3112  036a 84            	pop	a
3113                     ; 1268     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
3115  036b 7b08          	ld	a,(OFST+6,sp)
3116  036d cd03fa        	call	_TIM2_SetIC1Prescaler
3118                     ; 1271     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
3120  0370 7b09          	ld	a,(OFST+7,sp)
3121  0372 88            	push	a
3122  0373 7b03          	ld	a,(OFST+1,sp)
3123  0375 97            	ld	xl,a
3124  0376 7b02          	ld	a,(OFST+0,sp)
3125  0378 95            	ld	xh,a
3126  0379 cd0690        	call	L5_TI2_Config
3128  037c 84            	pop	a
3129                     ; 1274     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
3131  037d 7b08          	ld	a,(OFST+6,sp)
3132  037f cd0416        	call	_TIM2_SetIC2Prescaler
3135  0382 2023          	jra	L1551
3136  0384               L7451:
3137                     ; 1279     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
3137                     ; 1280                TIM2_ICFilter);
3139  0384 7b09          	ld	a,(OFST+7,sp)
3140  0386 88            	push	a
3141  0387 7b08          	ld	a,(OFST+6,sp)
3142  0389 97            	ld	xl,a
3143  038a 7b05          	ld	a,(OFST+3,sp)
3144  038c 95            	ld	xh,a
3145  038d cd0690        	call	L5_TI2_Config
3147  0390 84            	pop	a
3148                     ; 1283     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
3150  0391 7b08          	ld	a,(OFST+6,sp)
3151  0393 cd0416        	call	_TIM2_SetIC2Prescaler
3153                     ; 1286     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
3155  0396 7b09          	ld	a,(OFST+7,sp)
3156  0398 88            	push	a
3157  0399 7b03          	ld	a,(OFST+1,sp)
3158  039b 97            	ld	xl,a
3159  039c 7b02          	ld	a,(OFST+0,sp)
3160  039e 95            	ld	xh,a
3161  039f cd064f        	call	L3_TI1_Config
3163  03a2 84            	pop	a
3164                     ; 1289     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
3166  03a3 7b08          	ld	a,(OFST+6,sp)
3167  03a5 ad53          	call	_TIM2_SetIC1Prescaler
3169  03a7               L1551:
3170                     ; 1291 }
3173  03a7 5b04          	addw	sp,#4
3174  03a9 81            	ret
3226                     ; 1298 uint16_t TIM2_GetCapture1(void)
3226                     ; 1299 {
3227                     	switch	.text
3228  03aa               _TIM2_GetCapture1:
3230  03aa 5204          	subw	sp,#4
3231       00000004      OFST:	set	4
3234                     ; 1300   uint16_t tmpccr1 = 0;
3236  03ac 1e03          	ldw	x,(OFST-1,sp)
3237                     ; 1303   tmpccr1h = TIM2->CCR1H;
3239  03ae c65261        	ld	a,21089
3240  03b1 6b02          	ld	(OFST-2,sp),a
3241                     ; 1304   tmpccr1l = TIM2->CCR1L;
3243  03b3 c65262        	ld	a,21090
3244  03b6 6b01          	ld	(OFST-3,sp),a
3245                     ; 1306   tmpccr1 = (uint16_t)(tmpccr1l);
3247  03b8 7b01          	ld	a,(OFST-3,sp)
3248  03ba 5f            	clrw	x
3249  03bb 97            	ld	xl,a
3250  03bc 1f03          	ldw	(OFST-1,sp),x
3251                     ; 1307   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3253  03be 7b02          	ld	a,(OFST-2,sp)
3254  03c0 5f            	clrw	x
3255  03c1 97            	ld	xl,a
3256  03c2 4f            	clr	a
3257  03c3 02            	rlwa	x,a
3258  03c4 01            	rrwa	x,a
3259  03c5 1a04          	or	a,(OFST+0,sp)
3260  03c7 01            	rrwa	x,a
3261  03c8 1a03          	or	a,(OFST-1,sp)
3262  03ca 01            	rrwa	x,a
3263  03cb 1f03          	ldw	(OFST-1,sp),x
3264                     ; 1309   return ((uint16_t)tmpccr1);
3266  03cd 1e03          	ldw	x,(OFST-1,sp)
3269  03cf 5b04          	addw	sp,#4
3270  03d1 81            	ret
3322                     ; 1317 uint16_t TIM2_GetCapture2(void)
3322                     ; 1318 {
3323                     	switch	.text
3324  03d2               _TIM2_GetCapture2:
3326  03d2 5204          	subw	sp,#4
3327       00000004      OFST:	set	4
3330                     ; 1319   uint16_t tmpccr2 = 0;
3332  03d4 1e03          	ldw	x,(OFST-1,sp)
3333                     ; 1322   tmpccr2h = TIM2->CCR2H;
3335  03d6 c65263        	ld	a,21091
3336  03d9 6b02          	ld	(OFST-2,sp),a
3337                     ; 1323   tmpccr2l = TIM2->CCR2L;
3339  03db c65264        	ld	a,21092
3340  03de 6b01          	ld	(OFST-3,sp),a
3341                     ; 1325   tmpccr2 = (uint16_t)(tmpccr2l);
3343  03e0 7b01          	ld	a,(OFST-3,sp)
3344  03e2 5f            	clrw	x
3345  03e3 97            	ld	xl,a
3346  03e4 1f03          	ldw	(OFST-1,sp),x
3347                     ; 1326   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3349  03e6 7b02          	ld	a,(OFST-2,sp)
3350  03e8 5f            	clrw	x
3351  03e9 97            	ld	xl,a
3352  03ea 4f            	clr	a
3353  03eb 02            	rlwa	x,a
3354  03ec 01            	rrwa	x,a
3355  03ed 1a04          	or	a,(OFST+0,sp)
3356  03ef 01            	rrwa	x,a
3357  03f0 1a03          	or	a,(OFST-1,sp)
3358  03f2 01            	rrwa	x,a
3359  03f3 1f03          	ldw	(OFST-1,sp),x
3360                     ; 1328   return ((uint16_t)tmpccr2);
3362  03f5 1e03          	ldw	x,(OFST-1,sp)
3365  03f7 5b04          	addw	sp,#4
3366  03f9 81            	ret
3411                     ; 1341 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3411                     ; 1342 {
3412                     	switch	.text
3413  03fa               _TIM2_SetIC1Prescaler:
3415  03fa 88            	push	a
3416  03fb 88            	push	a
3417       00000001      OFST:	set	1
3420                     ; 1343   uint8_t tmpccmr1 = 0;
3422  03fc 0f01          	clr	(OFST+0,sp)
3423                     ; 1346   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
3425                     ; 1348   tmpccmr1 = TIM2->CCMR1;
3427  03fe c65259        	ld	a,21081
3428  0401 6b01          	ld	(OFST+0,sp),a
3429                     ; 1351   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3431  0403 7b01          	ld	a,(OFST+0,sp)
3432  0405 a4f3          	and	a,#243
3433  0407 6b01          	ld	(OFST+0,sp),a
3434                     ; 1354   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
3436  0409 7b01          	ld	a,(OFST+0,sp)
3437  040b 1a02          	or	a,(OFST+1,sp)
3438  040d 6b01          	ld	(OFST+0,sp),a
3439                     ; 1356   TIM2->CCMR1 = tmpccmr1;
3441  040f 7b01          	ld	a,(OFST+0,sp)
3442  0411 c75259        	ld	21081,a
3443                     ; 1357 }
3446  0414 85            	popw	x
3447  0415 81            	ret
3492                     ; 1369 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3492                     ; 1370 {
3493                     	switch	.text
3494  0416               _TIM2_SetIC2Prescaler:
3496  0416 88            	push	a
3497  0417 88            	push	a
3498       00000001      OFST:	set	1
3501                     ; 1371   uint8_t tmpccmr2 = 0;
3503  0418 0f01          	clr	(OFST+0,sp)
3504                     ; 1374   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
3506                     ; 1376   tmpccmr2 = TIM2->CCMR2;
3508  041a c6525a        	ld	a,21082
3509  041d 6b01          	ld	(OFST+0,sp),a
3510                     ; 1379   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3512  041f 7b01          	ld	a,(OFST+0,sp)
3513  0421 a4f3          	and	a,#243
3514  0423 6b01          	ld	(OFST+0,sp),a
3515                     ; 1382   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
3517  0425 7b01          	ld	a,(OFST+0,sp)
3518  0427 1a02          	or	a,(OFST+1,sp)
3519  0429 6b01          	ld	(OFST+0,sp),a
3520                     ; 1384   TIM2->CCMR2 = tmpccmr2;
3522  042b 7b01          	ld	a,(OFST+0,sp)
3523  042d c7525a        	ld	21082,a
3524                     ; 1385 }
3527  0430 85            	popw	x
3528  0431 81            	ret
3614                     ; 1416 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
3614                     ; 1417 {
3615                     	switch	.text
3616  0432               _TIM2_ITConfig:
3618  0432 89            	pushw	x
3619       00000000      OFST:	set	0
3622                     ; 1419   assert_param(IS_TIM2_IT(TIM2_IT));
3624                     ; 1420   assert_param(IS_FUNCTIONAL_STATE(NewState));
3626                     ; 1422   if (NewState != DISABLE)
3628  0433 9f            	ld	a,xl
3629  0434 4d            	tnz	a
3630  0435 2709          	jreq	L3371
3631                     ; 1425     TIM2->IER |= (uint8_t)TIM2_IT;
3633  0437 9e            	ld	a,xh
3634  0438 ca5255        	or	a,21077
3635  043b c75255        	ld	21077,a
3637  043e 2009          	jra	L5371
3638  0440               L3371:
3639                     ; 1430     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
3641  0440 7b01          	ld	a,(OFST+1,sp)
3642  0442 43            	cpl	a
3643  0443 c45255        	and	a,21077
3644  0446 c75255        	ld	21077,a
3645  0449               L5371:
3646                     ; 1432 }
3649  0449 85            	popw	x
3650  044a 81            	ret
3731                     ; 1445 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
3731                     ; 1446 {
3732                     	switch	.text
3733  044b               _TIM2_GenerateEvent:
3737                     ; 1448   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
3739                     ; 1451   TIM2->EGR |= (uint8_t)TIM2_EventSource;
3741  044b ca5258        	or	a,21080
3742  044e c75258        	ld	21080,a
3743                     ; 1452 }
3746  0451 81            	ret
3885                     ; 1467 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3885                     ; 1468 {
3886                     	switch	.text
3887  0452               _TIM2_GetFlagStatus:
3889  0452 89            	pushw	x
3890  0453 89            	pushw	x
3891       00000002      OFST:	set	2
3894                     ; 1469   FlagStatus bitstatus = RESET;
3896  0454 7b02          	ld	a,(OFST+0,sp)
3897  0456 97            	ld	xl,a
3898                     ; 1470   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3900  0457 7b01          	ld	a,(OFST-1,sp)
3901  0459 97            	ld	xl,a
3904  045a 7b02          	ld	a,(OFST+0,sp)
3905  045c 97            	ld	xl,a
3906                     ; 1473   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
3908                     ; 1475   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
3910  045d c65256        	ld	a,21078
3911  0460 1404          	and	a,(OFST+2,sp)
3912  0462 6b01          	ld	(OFST-1,sp),a
3913                     ; 1476   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
3915  0464 c65257        	ld	a,21079
3916  0467 1403          	and	a,(OFST+1,sp)
3917  0469 6b02          	ld	(OFST+0,sp),a
3918                     ; 1478   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
3920  046b 7b01          	ld	a,(OFST-1,sp)
3921  046d 1a02          	or	a,(OFST+0,sp)
3922  046f 2706          	jreq	L7502
3923                     ; 1480     bitstatus = SET;
3925  0471 a601          	ld	a,#1
3926  0473 6b02          	ld	(OFST+0,sp),a
3928  0475 2002          	jra	L1602
3929  0477               L7502:
3930                     ; 1484     bitstatus = RESET;
3932  0477 0f02          	clr	(OFST+0,sp)
3933  0479               L1602:
3934                     ; 1486   return ((FlagStatus)bitstatus);
3936  0479 7b02          	ld	a,(OFST+0,sp)
3939  047b 5b04          	addw	sp,#4
3940  047d 81            	ret
3975                     ; 1500 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3975                     ; 1501 {
3976                     	switch	.text
3977  047e               _TIM2_ClearFlag:
3979  047e 89            	pushw	x
3980       00000000      OFST:	set	0
3983                     ; 1503   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
3985                     ; 1505   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
3987  047f 9f            	ld	a,xl
3988  0480 43            	cpl	a
3989  0481 c75256        	ld	21078,a
3990                     ; 1506   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
3992  0484 7b01          	ld	a,(OFST+1,sp)
3993  0486 43            	cpl	a
3994  0487 c75257        	ld	21079,a
3995                     ; 1507 }
3998  048a 85            	popw	x
3999  048b 81            	ret
4063                     ; 1520 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4063                     ; 1521 {
4064                     	switch	.text
4065  048c               _TIM2_GetITStatus:
4067  048c 88            	push	a
4068  048d 89            	pushw	x
4069       00000002      OFST:	set	2
4072                     ; 1522   ITStatus bitstatus = RESET;
4074  048e 7b02          	ld	a,(OFST+0,sp)
4075  0490 97            	ld	xl,a
4076                     ; 1524   uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
4078  0491 7b01          	ld	a,(OFST-1,sp)
4079  0493 97            	ld	xl,a
4082  0494 7b02          	ld	a,(OFST+0,sp)
4083  0496 97            	ld	xl,a
4084                     ; 1527   assert_param(IS_TIM2_GET_IT(TIM2_IT));
4086                     ; 1529   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
4088  0497 c65256        	ld	a,21078
4089  049a 1403          	and	a,(OFST+1,sp)
4090  049c 6b01          	ld	(OFST-1,sp),a
4091                     ; 1531   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
4093  049e c65255        	ld	a,21077
4094  04a1 1403          	and	a,(OFST+1,sp)
4095  04a3 6b02          	ld	(OFST+0,sp),a
4096                     ; 1533   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET))
4098  04a5 0d01          	tnz	(OFST-1,sp)
4099  04a7 270a          	jreq	L3312
4101  04a9 0d02          	tnz	(OFST+0,sp)
4102  04ab 2706          	jreq	L3312
4103                     ; 1535     bitstatus = (ITStatus)SET;
4105  04ad a601          	ld	a,#1
4106  04af 6b02          	ld	(OFST+0,sp),a
4108  04b1 2002          	jra	L5312
4109  04b3               L3312:
4110                     ; 1539     bitstatus = (ITStatus)RESET;
4112  04b3 0f02          	clr	(OFST+0,sp)
4113  04b5               L5312:
4114                     ; 1541   return ((ITStatus)bitstatus);
4116  04b5 7b02          	ld	a,(OFST+0,sp)
4119  04b7 5b03          	addw	sp,#3
4120  04b9 81            	ret
4156                     ; 1555 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4156                     ; 1556 {
4157                     	switch	.text
4158  04ba               _TIM2_ClearITPendingBit:
4162                     ; 1558   assert_param(IS_TIM2_IT(TIM2_IT));
4164                     ; 1561   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
4166  04ba 43            	cpl	a
4167  04bb c75256        	ld	21078,a
4168                     ; 1562 }
4171  04be 81            	ret
4244                     ; 1575 void TIM2_DMACmd( TIM2_DMASource_TypeDef TIM2_DMASource, FunctionalState NewState)
4244                     ; 1576 {
4245                     	switch	.text
4246  04bf               _TIM2_DMACmd:
4248  04bf 89            	pushw	x
4249       00000000      OFST:	set	0
4252                     ; 1578   assert_param(IS_FUNCTIONAL_STATE(NewState));
4254                     ; 1579   assert_param(IS_TIM2_DMA_SOURCE(TIM2_DMASource));
4256                     ; 1581   if (NewState != DISABLE)
4258  04c0 9f            	ld	a,xl
4259  04c1 4d            	tnz	a
4260  04c2 2709          	jreq	L1122
4261                     ; 1584     TIM2->DER |= TIM2_DMASource;
4263  04c4 9e            	ld	a,xh
4264  04c5 ca5254        	or	a,21076
4265  04c8 c75254        	ld	21076,a
4267  04cb 2009          	jra	L3122
4268  04cd               L1122:
4269                     ; 1589     TIM2->DER &= (uint8_t)(~TIM2_DMASource);
4271  04cd 7b01          	ld	a,(OFST+1,sp)
4272  04cf 43            	cpl	a
4273  04d0 c45254        	and	a,21076
4274  04d3 c75254        	ld	21076,a
4275  04d6               L3122:
4276                     ; 1591 }
4279  04d6 85            	popw	x
4280  04d7 81            	ret
4315                     ; 1599 void TIM2_SelectCCDMA(FunctionalState NewState)
4315                     ; 1600 {
4316                     	switch	.text
4317  04d8               _TIM2_SelectCCDMA:
4321                     ; 1602   assert_param(IS_FUNCTIONAL_STATE(NewState));
4323                     ; 1604   if (NewState != DISABLE)
4325  04d8 4d            	tnz	a
4326  04d9 2706          	jreq	L3322
4327                     ; 1607     TIM2->CR2 |= TIM_CR2_CCDS;
4329  04db 72165251      	bset	21073,#3
4331  04df 2004          	jra	L5322
4332  04e1               L3322:
4333                     ; 1612     TIM2->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4335  04e1 72175251      	bres	21073,#3
4336  04e5               L5322:
4337                     ; 1614 }
4340  04e5 81            	ret
4364                     ; 1638 void TIM2_InternalClockConfig(void)
4364                     ; 1639 {
4365                     	switch	.text
4366  04e6               _TIM2_InternalClockConfig:
4370                     ; 1641   TIM2->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4372  04e6 c65252        	ld	a,21074
4373  04e9 a4f8          	and	a,#248
4374  04eb c75252        	ld	21074,a
4375                     ; 1642 }
4378  04ee 81            	ret
4467                     ; 1659 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
4467                     ; 1660                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
4467                     ; 1661                                  uint8_t ICFilter)
4467                     ; 1662 {
4468                     	switch	.text
4469  04ef               _TIM2_TIxExternalClockConfig:
4471  04ef 89            	pushw	x
4472       00000000      OFST:	set	0
4475                     ; 1664   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
4477                     ; 1665   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
4479                     ; 1666   assert_param(IS_TIM2_IC_FILTER(ICFilter));
4481                     ; 1669   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
4483  04f0 9e            	ld	a,xh
4484  04f1 a160          	cp	a,#96
4485  04f3 260f          	jrne	L7032
4486                     ; 1671     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
4488  04f5 7b05          	ld	a,(OFST+5,sp)
4489  04f7 88            	push	a
4490  04f8 ae0001        	ldw	x,#1
4491  04fb 7b03          	ld	a,(OFST+3,sp)
4492  04fd 95            	ld	xh,a
4493  04fe cd0690        	call	L5_TI2_Config
4495  0501 84            	pop	a
4497  0502 200d          	jra	L1132
4498  0504               L7032:
4499                     ; 1675     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
4501  0504 7b05          	ld	a,(OFST+5,sp)
4502  0506 88            	push	a
4503  0507 ae0001        	ldw	x,#1
4504  050a 7b03          	ld	a,(OFST+3,sp)
4505  050c 95            	ld	xh,a
4506  050d cd064f        	call	L3_TI1_Config
4508  0510 84            	pop	a
4509  0511               L1132:
4510                     ; 1679   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
4512  0511 7b01          	ld	a,(OFST+1,sp)
4513  0513 ad4b          	call	_TIM2_SelectInputTrigger
4515                     ; 1682   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
4517  0515 c65252        	ld	a,21074
4518  0518 aa07          	or	a,#7
4519  051a c75252        	ld	21074,a
4520                     ; 1683 }
4523  051d 85            	popw	x
4524  051e 81            	ret
4641                     ; 1701 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
4641                     ; 1702                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
4641                     ; 1703                               uint8_t ExtTRGFilter)
4641                     ; 1704 {
4642                     	switch	.text
4643  051f               _TIM2_ETRClockMode1Config:
4645  051f 89            	pushw	x
4646       00000000      OFST:	set	0
4649                     ; 1706   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
4651  0520 7b05          	ld	a,(OFST+5,sp)
4652  0522 88            	push	a
4653  0523 9f            	ld	a,xl
4654  0524 97            	ld	xl,a
4655  0525 7b02          	ld	a,(OFST+2,sp)
4656  0527 95            	ld	xh,a
4657  0528 cd05c2        	call	_TIM2_ETRConfig
4659  052b 84            	pop	a
4660                     ; 1709   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4662  052c c65252        	ld	a,21074
4663  052f a4f8          	and	a,#248
4664  0531 c75252        	ld	21074,a
4665                     ; 1710   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
4667  0534 c65252        	ld	a,21074
4668  0537 aa07          	or	a,#7
4669  0539 c75252        	ld	21074,a
4670                     ; 1713   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4672  053c c65252        	ld	a,21074
4673  053f a48f          	and	a,#143
4674  0541 c75252        	ld	21074,a
4675                     ; 1714   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
4677  0544 c65252        	ld	a,21074
4678  0547 aa70          	or	a,#112
4679  0549 c75252        	ld	21074,a
4680                     ; 1715 }
4683  054c 85            	popw	x
4684  054d 81            	ret
4742                     ; 1733 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
4742                     ; 1734                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
4742                     ; 1735                               uint8_t ExtTRGFilter)
4742                     ; 1736 {
4743                     	switch	.text
4744  054e               _TIM2_ETRClockMode2Config:
4746  054e 89            	pushw	x
4747       00000000      OFST:	set	0
4750                     ; 1738   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
4752  054f 7b05          	ld	a,(OFST+5,sp)
4753  0551 88            	push	a
4754  0552 9f            	ld	a,xl
4755  0553 97            	ld	xl,a
4756  0554 7b02          	ld	a,(OFST+2,sp)
4757  0556 95            	ld	xh,a
4758  0557 ad69          	call	_TIM2_ETRConfig
4760  0559 84            	pop	a
4761                     ; 1741   TIM2->ETR |= TIM_ETR_ECE ;
4763  055a 721c5253      	bset	21075,#6
4764                     ; 1742 }
4767  055e 85            	popw	x
4768  055f 81            	ret
4884                     ; 1793 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
4884                     ; 1794 {
4885                     	switch	.text
4886  0560               _TIM2_SelectInputTrigger:
4888  0560 88            	push	a
4889  0561 88            	push	a
4890       00000001      OFST:	set	1
4893                     ; 1795   uint8_t tmpsmcr = 0;
4895  0562 0f01          	clr	(OFST+0,sp)
4896                     ; 1798   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
4898                     ; 1800   tmpsmcr = TIM2->SMCR;
4900  0564 c65252        	ld	a,21074
4901  0567 6b01          	ld	(OFST+0,sp),a
4902                     ; 1803   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4904  0569 7b01          	ld	a,(OFST+0,sp)
4905  056b a48f          	and	a,#143
4906  056d 6b01          	ld	(OFST+0,sp),a
4907                     ; 1804   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
4909  056f 7b01          	ld	a,(OFST+0,sp)
4910  0571 1a02          	or	a,(OFST+1,sp)
4911  0573 6b01          	ld	(OFST+0,sp),a
4912                     ; 1806   TIM2->SMCR = (uint8_t)tmpsmcr;
4914  0575 7b01          	ld	a,(OFST+0,sp)
4915  0577 c75252        	ld	21074,a
4916                     ; 1807 }
4919  057a 85            	popw	x
4920  057b 81            	ret
5019                     ; 1821 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
5019                     ; 1822 {
5020                     	switch	.text
5021  057c               _TIM2_SelectOutputTrigger:
5023  057c 88            	push	a
5024  057d 88            	push	a
5025       00000001      OFST:	set	1
5028                     ; 1823   uint8_t tmpcr2 = 0;
5030  057e 0f01          	clr	(OFST+0,sp)
5031                     ; 1826   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
5033                     ; 1828   tmpcr2 = TIM2->CR2;
5035  0580 c65251        	ld	a,21073
5036  0583 6b01          	ld	(OFST+0,sp),a
5037                     ; 1831   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
5039  0585 7b01          	ld	a,(OFST+0,sp)
5040  0587 a48f          	and	a,#143
5041  0589 6b01          	ld	(OFST+0,sp),a
5042                     ; 1834   tmpcr2 |=  (uint8_t)TIM2_TRGOSource;
5044  058b 7b01          	ld	a,(OFST+0,sp)
5045  058d 1a02          	or	a,(OFST+1,sp)
5046  058f 6b01          	ld	(OFST+0,sp),a
5047                     ; 1836   TIM2->CR2 = tmpcr2;
5049  0591 7b01          	ld	a,(OFST+0,sp)
5050  0593 c75251        	ld	21073,a
5051                     ; 1837 }
5054  0596 85            	popw	x
5055  0597 81            	ret
5138                     ; 1849 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
5138                     ; 1850 {
5139                     	switch	.text
5140  0598               _TIM2_SelectSlaveMode:
5142  0598 88            	push	a
5143  0599 88            	push	a
5144       00000001      OFST:	set	1
5147                     ; 1851   uint8_t tmpsmcr = 0;
5149  059a 0f01          	clr	(OFST+0,sp)
5150                     ; 1854   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
5152                     ; 1856   tmpsmcr = TIM2->SMCR;
5154  059c c65252        	ld	a,21074
5155  059f 6b01          	ld	(OFST+0,sp),a
5156                     ; 1859   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5158  05a1 7b01          	ld	a,(OFST+0,sp)
5159  05a3 a4f8          	and	a,#248
5160  05a5 6b01          	ld	(OFST+0,sp),a
5161                     ; 1862   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
5163  05a7 7b01          	ld	a,(OFST+0,sp)
5164  05a9 1a02          	or	a,(OFST+1,sp)
5165  05ab 6b01          	ld	(OFST+0,sp),a
5166                     ; 1864   TIM2->SMCR = tmpsmcr;
5168  05ad 7b01          	ld	a,(OFST+0,sp)
5169  05af c75252        	ld	21074,a
5170                     ; 1865 }
5173  05b2 85            	popw	x
5174  05b3 81            	ret
5210                     ; 1873 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
5210                     ; 1874 {
5211                     	switch	.text
5212  05b4               _TIM2_SelectMasterSlaveMode:
5216                     ; 1876   assert_param(IS_FUNCTIONAL_STATE(NewState));
5218                     ; 1879   if (NewState != DISABLE)
5220  05b4 4d            	tnz	a
5221  05b5 2706          	jreq	L7752
5222                     ; 1881     TIM2->SMCR |= TIM_SMCR_MSM;
5224  05b7 721e5252      	bset	21074,#7
5226  05bb 2004          	jra	L1062
5227  05bd               L7752:
5228                     ; 1885     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5230  05bd 721f5252      	bres	21074,#7
5231  05c1               L1062:
5232                     ; 1887 }
5235  05c1 81            	ret
5291                     ; 1905 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
5291                     ; 1906                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
5291                     ; 1907                     uint8_t ExtTRGFilter)
5291                     ; 1908 {
5292                     	switch	.text
5293  05c2               _TIM2_ETRConfig:
5295  05c2 89            	pushw	x
5296       00000000      OFST:	set	0
5299                     ; 1910   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
5301                     ; 1911   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
5303                     ; 1912   assert_param(IS_TIM2_EXT_FILTER(ExtTRGFilter));
5305                     ; 1915   TIM2->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | (uint8_t)TIM2_ExtTRGPolarity)
5305                     ; 1916                          | (uint8_t)ExtTRGFilter);
5307  05c3 9f            	ld	a,xl
5308  05c4 1a01          	or	a,(OFST+1,sp)
5309  05c6 1a05          	or	a,(OFST+5,sp)
5310  05c8 ca5253        	or	a,21075
5311  05cb c75253        	ld	21075,a
5312                     ; 1917 }
5315  05ce 85            	popw	x
5316  05cf 81            	ret
5429                     ; 1952 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
5429                     ; 1953                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
5429                     ; 1954                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
5429                     ; 1955 {
5430                     	switch	.text
5431  05d0               _TIM2_EncoderInterfaceConfig:
5433  05d0 89            	pushw	x
5434  05d1 5203          	subw	sp,#3
5435       00000003      OFST:	set	3
5438                     ; 1956   uint8_t tmpsmcr = 0;
5440  05d3 7b01          	ld	a,(OFST-2,sp)
5441  05d5 97            	ld	xl,a
5442                     ; 1957   uint8_t tmpccmr1 = 0;
5444  05d6 7b02          	ld	a,(OFST-1,sp)
5445  05d8 97            	ld	xl,a
5446                     ; 1958   uint8_t tmpccmr2 = 0;
5448  05d9 7b03          	ld	a,(OFST+0,sp)
5449  05db 97            	ld	xl,a
5450                     ; 1961   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
5452                     ; 1962   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
5454                     ; 1963   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
5456                     ; 1965   tmpsmcr = TIM2->SMCR;
5458  05dc c65252        	ld	a,21074
5459  05df 6b01          	ld	(OFST-2,sp),a
5460                     ; 1966   tmpccmr1 = TIM2->CCMR1;
5462  05e1 c65259        	ld	a,21081
5463  05e4 6b02          	ld	(OFST-1,sp),a
5464                     ; 1967   tmpccmr2 = TIM2->CCMR2;
5466  05e6 c6525a        	ld	a,21082
5467  05e9 6b03          	ld	(OFST+0,sp),a
5468                     ; 1970   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5470  05eb 7b01          	ld	a,(OFST-2,sp)
5471  05ed a4f0          	and	a,#240
5472  05ef 6b01          	ld	(OFST-2,sp),a
5473                     ; 1971   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
5475  05f1 7b01          	ld	a,(OFST-2,sp)
5476  05f3 1a04          	or	a,(OFST+1,sp)
5477  05f5 6b01          	ld	(OFST-2,sp),a
5478                     ; 1974   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5480  05f7 7b02          	ld	a,(OFST-1,sp)
5481  05f9 a4fc          	and	a,#252
5482  05fb 6b02          	ld	(OFST-1,sp),a
5483                     ; 1975   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5485  05fd 7b03          	ld	a,(OFST+0,sp)
5486  05ff a4fc          	and	a,#252
5487  0601 6b03          	ld	(OFST+0,sp),a
5488                     ; 1976   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5490  0603 7b02          	ld	a,(OFST-1,sp)
5491  0605 aa01          	or	a,#1
5492  0607 6b02          	ld	(OFST-1,sp),a
5493                     ; 1977   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5495  0609 7b03          	ld	a,(OFST+0,sp)
5496  060b aa01          	or	a,#1
5497  060d 6b03          	ld	(OFST+0,sp),a
5498                     ; 1980   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
5500  060f 7b05          	ld	a,(OFST+2,sp)
5501  0611 a101          	cp	a,#1
5502  0613 2606          	jrne	L5072
5503                     ; 1982     TIM2->CCER1 |= TIM_CCER1_CC1P ;
5505  0615 7212525b      	bset	21083,#1
5507  0619 2004          	jra	L7072
5508  061b               L5072:
5509                     ; 1986     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5511  061b 7213525b      	bres	21083,#1
5512  061f               L7072:
5513                     ; 1989   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
5515  061f 7b08          	ld	a,(OFST+5,sp)
5516  0621 a101          	cp	a,#1
5517  0623 2606          	jrne	L1172
5518                     ; 1991     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5520  0625 721a525b      	bset	21083,#5
5522  0629 2004          	jra	L3172
5523  062b               L1172:
5524                     ; 1995     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5526  062b 721b525b      	bres	21083,#5
5527  062f               L3172:
5528                     ; 1998   TIM2->SMCR = tmpsmcr;
5530  062f 7b01          	ld	a,(OFST-2,sp)
5531  0631 c75252        	ld	21074,a
5532                     ; 1999   TIM2->CCMR1 = tmpccmr1;
5534  0634 7b02          	ld	a,(OFST-1,sp)
5535  0636 c75259        	ld	21081,a
5536                     ; 2000   TIM2->CCMR2 = tmpccmr2;
5538  0639 7b03          	ld	a,(OFST+0,sp)
5539  063b c7525a        	ld	21082,a
5540                     ; 2001 }
5543  063e 5b05          	addw	sp,#5
5544  0640 81            	ret
5580                     ; 2009 void TIM2_SelectHallSensor(FunctionalState NewState)
5580                     ; 2010 {
5581                     	switch	.text
5582  0641               _TIM2_SelectHallSensor:
5586                     ; 2012   assert_param(IS_FUNCTIONAL_STATE(NewState));
5588                     ; 2015   if (NewState != DISABLE)
5590  0641 4d            	tnz	a
5591  0642 2706          	jreq	L3372
5592                     ; 2017     TIM2->CR2 |= TIM_CR2_TI1S;
5594  0644 721e5251      	bset	21073,#7
5596  0648 2004          	jra	L5372
5597  064a               L3372:
5598                     ; 2021     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5600  064a 721f5251      	bres	21073,#7
5601  064e               L5372:
5602                     ; 2023 }
5605  064e 81            	ret
5677                     ; 2044 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5677                     ; 2045                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5677                     ; 2046                        uint8_t TIM2_ICFilter)
5677                     ; 2047 {
5678                     	switch	.text
5679  064f               L3_TI1_Config:
5681  064f 89            	pushw	x
5682  0650 89            	pushw	x
5683       00000002      OFST:	set	2
5686                     ; 2048   uint8_t tmpccmr1 = 0;
5688  0651 7b02          	ld	a,(OFST+0,sp)
5689  0653 97            	ld	xl,a
5690                     ; 2049   uint8_t tmpicpolarity = TIM2_ICPolarity;
5692  0654 7b03          	ld	a,(OFST+1,sp)
5693  0656 6b01          	ld	(OFST-1,sp),a
5694                     ; 2050   tmpccmr1 = TIM2->CCMR1;
5696  0658 c65259        	ld	a,21081
5697  065b 6b02          	ld	(OFST+0,sp),a
5698                     ; 2053   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5700                     ; 2054   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5702                     ; 2055   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5704                     ; 2058   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5706  065d 7211525b      	bres	21083,#0
5707                     ; 2061   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5709  0661 7b02          	ld	a,(OFST+0,sp)
5710  0663 a40c          	and	a,#12
5711  0665 6b02          	ld	(OFST+0,sp),a
5712                     ; 2062   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5714  0667 7b07          	ld	a,(OFST+5,sp)
5715  0669 97            	ld	xl,a
5716  066a a610          	ld	a,#16
5717  066c 42            	mul	x,a
5718  066d 9f            	ld	a,xl
5719  066e 1a04          	or	a,(OFST+2,sp)
5720  0670 1a02          	or	a,(OFST+0,sp)
5721  0672 6b02          	ld	(OFST+0,sp),a
5722                     ; 2064   TIM2->CCMR1 = tmpccmr1;
5724  0674 7b02          	ld	a,(OFST+0,sp)
5725  0676 c75259        	ld	21081,a
5726                     ; 2067   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5728  0679 7b01          	ld	a,(OFST-1,sp)
5729  067b a101          	cp	a,#1
5730  067d 2606          	jrne	L5772
5731                     ; 2069     TIM2->CCER1 |= TIM_CCER1_CC1P;
5733  067f 7212525b      	bset	21083,#1
5735  0683 2004          	jra	L7772
5736  0685               L5772:
5737                     ; 2073     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5739  0685 7213525b      	bres	21083,#1
5740  0689               L7772:
5741                     ; 2077   TIM2->CCER1 |=  TIM_CCER1_CC1E;
5743  0689 7210525b      	bset	21083,#0
5744                     ; 2078 }
5747  068d 5b04          	addw	sp,#4
5748  068f 81            	ret
5820                     ; 2095 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5820                     ; 2096                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5820                     ; 2097                        uint8_t TIM2_ICFilter)
5820                     ; 2098 {
5821                     	switch	.text
5822  0690               L5_TI2_Config:
5824  0690 89            	pushw	x
5825  0691 89            	pushw	x
5826       00000002      OFST:	set	2
5829                     ; 2099   uint8_t tmpccmr2 = 0;
5831  0692 7b02          	ld	a,(OFST+0,sp)
5832  0694 97            	ld	xl,a
5833                     ; 2100   uint8_t tmpicpolarity = TIM2_ICPolarity;
5835  0695 7b03          	ld	a,(OFST+1,sp)
5836  0697 6b01          	ld	(OFST-1,sp),a
5837                     ; 2103   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5839                     ; 2104   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5841                     ; 2105   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5843                     ; 2107   tmpccmr2 = TIM2->CCMR2;
5845  0699 c6525a        	ld	a,21082
5846  069c 6b02          	ld	(OFST+0,sp),a
5847                     ; 2110   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5849  069e 7219525b      	bres	21083,#4
5850                     ; 2113   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5852  06a2 7b02          	ld	a,(OFST+0,sp)
5853  06a4 a40c          	and	a,#12
5854  06a6 6b02          	ld	(OFST+0,sp),a
5855                     ; 2114   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5857  06a8 7b07          	ld	a,(OFST+5,sp)
5858  06aa 97            	ld	xl,a
5859  06ab a610          	ld	a,#16
5860  06ad 42            	mul	x,a
5861  06ae 9f            	ld	a,xl
5862  06af 1a04          	or	a,(OFST+2,sp)
5863  06b1 1a02          	or	a,(OFST+0,sp)
5864  06b3 6b02          	ld	(OFST+0,sp),a
5865                     ; 2116   TIM2->CCMR2 = tmpccmr2;
5867  06b5 7b02          	ld	a,(OFST+0,sp)
5868  06b7 c7525a        	ld	21082,a
5869                     ; 2119   if (tmpicpolarity == TIM2_ICPolarity_Falling)
5871  06ba 7b01          	ld	a,(OFST-1,sp)
5872  06bc a101          	cp	a,#1
5873  06be 2606          	jrne	L7303
5874                     ; 2121     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5876  06c0 721a525b      	bset	21083,#5
5878  06c4 2004          	jra	L1403
5879  06c6               L7303:
5880                     ; 2125     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5882  06c6 721b525b      	bres	21083,#5
5883  06ca               L1403:
5884                     ; 2129   TIM2->CCER1 |=  TIM_CCER1_CC2E;
5886  06ca 7218525b      	bset	21083,#4
5887                     ; 2130 }
5890  06ce 5b04          	addw	sp,#4
5891  06d0 81            	ret
5904                     	xdef	_TIM2_SelectHallSensor
5905                     	xdef	_TIM2_EncoderInterfaceConfig
5906                     	xdef	_TIM2_ETRConfig
5907                     	xdef	_TIM2_SelectMasterSlaveMode
5908                     	xdef	_TIM2_SelectSlaveMode
5909                     	xdef	_TIM2_SelectOutputTrigger
5910                     	xdef	_TIM2_SelectInputTrigger
5911                     	xdef	_TIM2_ETRClockMode2Config
5912                     	xdef	_TIM2_ETRClockMode1Config
5913                     	xdef	_TIM2_TIxExternalClockConfig
5914                     	xdef	_TIM2_InternalClockConfig
5915                     	xdef	_TIM2_SelectCCDMA
5916                     	xdef	_TIM2_DMACmd
5917                     	xdef	_TIM2_ClearITPendingBit
5918                     	xdef	_TIM2_GetITStatus
5919                     	xdef	_TIM2_ClearFlag
5920                     	xdef	_TIM2_GetFlagStatus
5921                     	xdef	_TIM2_GenerateEvent
5922                     	xdef	_TIM2_ITConfig
5923                     	xdef	_TIM2_SetIC2Prescaler
5924                     	xdef	_TIM2_SetIC1Prescaler
5925                     	xdef	_TIM2_GetCapture2
5926                     	xdef	_TIM2_GetCapture1
5927                     	xdef	_TIM2_PWMIConfig
5928                     	xdef	_TIM2_ICInit
5929                     	xdef	_TIM2_CCxCmd
5930                     	xdef	_TIM2_OC2PolarityConfig
5931                     	xdef	_TIM2_OC1PolarityConfig
5932                     	xdef	_TIM2_OC2FastConfig
5933                     	xdef	_TIM2_OC1FastConfig
5934                     	xdef	_TIM2_OC2PreloadConfig
5935                     	xdef	_TIM2_OC1PreloadConfig
5936                     	xdef	_TIM2_ForcedOC2Config
5937                     	xdef	_TIM2_ForcedOC1Config
5938                     	xdef	_TIM2_SetCompare2
5939                     	xdef	_TIM2_SetCompare1
5940                     	xdef	_TIM2_SelectOCxM
5941                     	xdef	_TIM2_CtrlPWMOutputs
5942                     	xdef	_TIM2_BKRConfig
5943                     	xdef	_TIM2_OC2Init
5944                     	xdef	_TIM2_OC1Init
5945                     	xdef	_TIM2_Cmd
5946                     	xdef	_TIM2_SelectOnePulseMode
5947                     	xdef	_TIM2_ARRPreloadConfig
5948                     	xdef	_TIM2_UpdateRequestConfig
5949                     	xdef	_TIM2_UpdateDisableConfig
5950                     	xdef	_TIM2_GetPrescaler
5951                     	xdef	_TIM2_GetCounter
5952                     	xdef	_TIM2_SetAutoreload
5953                     	xdef	_TIM2_SetCounter
5954                     	xdef	_TIM2_CounterModeConfig
5955                     	xdef	_TIM2_PrescalerConfig
5956                     	xdef	_TIM2_TimeBaseInit
5957                     	xdef	_TIM2_DeInit
5976                     	end
