   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 50 uint8_t ITC_GetCPUCC(void)
  32                     ; 51 {
  34                     	switch	.text
  35  0000               _ITC_GetCPUCC:
  39                     ; 53   _asm("push cc");
  42  0000 8a            push cc
  44                     ; 54   _asm("pop a");
  47  0001 84            pop a
  49                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  52  0002 81            	ret
  75                     ; 81 void ITC_DeInit(void)
  75                     ; 82 {
  76                     	switch	.text
  77  0003               _ITC_DeInit:
  81                     ; 83   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  83  0003 35ff7f70      	mov	32624,#255
  84                     ; 84   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  86  0007 35ff7f71      	mov	32625,#255
  87                     ; 85   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  89  000b 35ff7f72      	mov	32626,#255
  90                     ; 86   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  92  000f 35ff7f73      	mov	32627,#255
  93                     ; 87   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  95  0013 35ff7f74      	mov	32628,#255
  96                     ; 88   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  98  0017 35ff7f75      	mov	32629,#255
  99                     ; 89   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 101  001b 35ff7f76      	mov	32630,#255
 102                     ; 90   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 104  001f 35ff7f77      	mov	32631,#255
 105                     ; 91 }
 108  0023 81            	ret
 133                     ; 98 uint8_t ITC_GetSoftIntStatus(void)
 133                     ; 99 {
 134                     	switch	.text
 135  0024               _ITC_GetSoftIntStatus:
 139                     ; 100   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 141  0024 adda          	call	_ITC_GetCPUCC
 143  0026 a428          	and	a,#40
 146  0028 81            	ret
 455                     .const:	section	.text
 456  0000               L22:
 457  0000 0052          	dc.w	L14
 458  0002 0052          	dc.w	L14
 459  0004 0052          	dc.w	L14
 460  0006 005b          	dc.w	L34
 461  0008 005b          	dc.w	L34
 462  000a 005b          	dc.w	L34
 463  000c 005b          	dc.w	L34
 464  000e 0064          	dc.w	L54
 465  0010 0064          	dc.w	L54
 466  0012 0064          	dc.w	L54
 467  0014 0064          	dc.w	L54
 468  0016 006d          	dc.w	L74
 469  0018 006d          	dc.w	L74
 470  001a 006d          	dc.w	L74
 471  001c 006d          	dc.w	L74
 472  001e 0076          	dc.w	L15
 473  0020 0076          	dc.w	L15
 474  0022 0076          	dc.w	L15
 475  0024 0076          	dc.w	L15
 476  0026 007f          	dc.w	L35
 477  0028 007f          	dc.w	L35
 478  002a 007f          	dc.w	L35
 479  002c 007f          	dc.w	L35
 480  002e 0088          	dc.w	L55
 481  0030 0088          	dc.w	L55
 482  0032 0088          	dc.w	L55
 483  0034 0088          	dc.w	L55
 484  0036 0091          	dc.w	L75
 485  0038 0091          	dc.w	L75
 486                     ; 108 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 486                     ; 109 {
 487                     	switch	.text
 488  0029               _ITC_GetSoftwarePriority:
 490  0029 88            	push	a
 491  002a 89            	pushw	x
 492       00000002      OFST:	set	2
 495                     ; 110   uint8_t Value = 0;
 497  002b 0f02          	clr	(OFST+0,sp)
 498                     ; 111   uint8_t Mask = 0;
 500  002d 7b01          	ld	a,(OFST-1,sp)
 501  002f 97            	ld	xl,a
 502                     ; 114   assert_param(IS_ITC_IRQ(IRQn));
 504                     ; 117   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 506  0030 7b03          	ld	a,(OFST+1,sp)
 507  0032 a403          	and	a,#3
 508  0034 48            	sll	a
 509  0035 5f            	clrw	x
 510  0036 97            	ld	xl,a
 511  0037 a603          	ld	a,#3
 512  0039 5d            	tnzw	x
 513  003a 2704          	jreq	L41
 514  003c               L61:
 515  003c 48            	sll	a
 516  003d 5a            	decw	x
 517  003e 26fc          	jrne	L61
 518  0040               L41:
 519  0040 6b01          	ld	(OFST-1,sp),a
 520                     ; 119   switch (IRQn)
 522  0042 7b03          	ld	a,(OFST+1,sp)
 524                     ; 214     default:
 524                     ; 215       break;
 525  0044 4a            	dec	a
 526  0045 a11d          	cp	a,#29
 527  0047 2407          	jruge	L02
 528  0049 5f            	clrw	x
 529  004a 97            	ld	xl,a
 530  004b 58            	sllw	x
 531  004c de0000        	ldw	x,(L22,x)
 532  004f fc            	jp	(x)
 533  0050               L02:
 534  0050 2046          	jra	L522
 535  0052               L14:
 536                     ; 121     case FLASH_IRQn:
 536                     ; 122     case DMA1_CHANNEL0_1_IRQn:
 536                     ; 123     case DMA1_CHANNEL2_3_IRQn:
 536                     ; 124       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 538  0052 c67f70        	ld	a,32624
 539  0055 1401          	and	a,(OFST-1,sp)
 540  0057 6b02          	ld	(OFST+0,sp),a
 541                     ; 125       break;
 543  0059 203d          	jra	L522
 544  005b               L34:
 545                     ; 127     case EXTIE_F_PVD_IRQn:
 545                     ; 128 #ifdef STM8L15X_MD
 545                     ; 129     case RTC_IRQn:
 545                     ; 130     case EXTIB_IRQn:
 545                     ; 131     case EXTID_IRQn:
 545                     ; 132 #elif defined (STM8L15X_LD)
 545                     ; 133     case RTC_CSSLSE_IRQn:
 545                     ; 134     case EXTIB_IRQn:
 545                     ; 135     case EXTID_IRQn:
 545                     ; 136 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 545                     ; 137     case RTC_CSSLSE_IRQn:
 545                     ; 138     case EXTIB_G_IRQn:
 545                     ; 139     case EXTID_H_IRQn:
 545                     ; 140 #endif  /* STM8L15X_MD */
 545                     ; 141       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 547  005b c67f71        	ld	a,32625
 548  005e 1401          	and	a,(OFST-1,sp)
 549  0060 6b02          	ld	(OFST+0,sp),a
 550                     ; 142       break;
 552  0062 2034          	jra	L522
 553  0064               L54:
 554                     ; 144     case EXTI0_IRQn:
 554                     ; 145     case EXTI1_IRQn:
 554                     ; 146     case EXTI2_IRQn:
 554                     ; 147     case EXTI3_IRQn:
 554                     ; 148       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 556  0064 c67f72        	ld	a,32626
 557  0067 1401          	and	a,(OFST-1,sp)
 558  0069 6b02          	ld	(OFST+0,sp),a
 559                     ; 149       break;
 561  006b 202b          	jra	L522
 562  006d               L74:
 563                     ; 151     case EXTI4_IRQn:
 563                     ; 152     case EXTI5_IRQn:
 563                     ; 153     case EXTI6_IRQn:
 563                     ; 154     case EXTI7_IRQn:
 563                     ; 155       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 565  006d c67f73        	ld	a,32627
 566  0070 1401          	and	a,(OFST-1,sp)
 567  0072 6b02          	ld	(OFST+0,sp),a
 568                     ; 156       break;
 570  0074 2022          	jra	L522
 571  0076               L15:
 572                     ; 161     case SWITCH_CSS_BREAK_DAC_IRQn:
 572                     ; 162 #endif /* STM8L15X_LD */		
 572                     ; 163     case ADC1_COMP_IRQn:
 572                     ; 164 #ifdef STM8L15X_MD
 572                     ; 165     case LCD_IRQn:
 572                     ; 166     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 572                     ; 167 #elif defined (STM8L15X_LD)
 572                     ; 168     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 572                     ; 169 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 572                     ; 170     case LCD_AES_IRQn:
 572                     ; 171     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 572                     ; 172 #endif  /* STM8L15X_MD */
 572                     ; 173       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 574  0076 c67f74        	ld	a,32628
 575  0079 1401          	and	a,(OFST-1,sp)
 576  007b 6b02          	ld	(OFST+0,sp),a
 577                     ; 174       break;
 579  007d 2019          	jra	L522
 580  007f               L35:
 581                     ; 177     case TIM1_UPD_OVF_TRG_IRQn:
 581                     ; 178 #endif /* STM8L15X_LD */		
 581                     ; 179 #if defined (STM8L15X_MD) || defined (STM8L15X_LD)
 581                     ; 180     case TIM2_CC_IRQn:
 581                     ; 181     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 581                     ; 182     case TIM3_CC_IRQn:
 581                     ; 183 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 581                     ; 184     case TIM2_CC_USART2_RX_IRQn:
 581                     ; 185     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 581                     ; 186     case TIM3_CC_USART3_RX_IRQn:
 581                     ; 187 #endif  /* STM8L15X_MD */
 581                     ; 188       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 583  007f c67f75        	ld	a,32629
 584  0082 1401          	and	a,(OFST-1,sp)
 585  0084 6b02          	ld	(OFST+0,sp),a
 586                     ; 189       break;
 588  0086 2010          	jra	L522
 589  0088               L55:
 590                     ; 192     case TIM1_CC_IRQn:
 590                     ; 193 #endif /* STM8L15X_LD */	
 590                     ; 194     case TIM4_UPD_OVF_TRG_IRQn:
 590                     ; 195     case SPI1_IRQn:
 590                     ; 196 #if defined (STM8L15X_MD) || defined (STM8L15X_LD)
 590                     ; 197     case USART1_TX_IRQn:
 590                     ; 198 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 590                     ; 199     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 590                     ; 200 #endif  /* STM8L15X_MD || STM8L15X_LD */
 590                     ; 201       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 592  0088 c67f76        	ld	a,32630
 593  008b 1401          	and	a,(OFST-1,sp)
 594  008d 6b02          	ld	(OFST+0,sp),a
 595                     ; 202       break;
 597  008f 2007          	jra	L522
 598  0091               L75:
 599                     ; 205     case USART1_RX_IRQn:
 599                     ; 206     case I2C1_IRQn:
 599                     ; 207 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 599                     ; 208     case USART1_RX_TIM5_CC_IRQn:
 599                     ; 209     case I2C1_SPI2_IRQn:
 599                     ; 210 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 599                     ; 211       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 601  0091 c67f77        	ld	a,32631
 602  0094 1401          	and	a,(OFST-1,sp)
 603  0096 6b02          	ld	(OFST+0,sp),a
 604                     ; 212       break;
 606  0098               L16:
 607                     ; 214     default:
 607                     ; 215       break;
 609  0098               L522:
 610                     ; 218   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 612  0098 7b03          	ld	a,(OFST+1,sp)
 613  009a a403          	and	a,#3
 614  009c 48            	sll	a
 615  009d 5f            	clrw	x
 616  009e 97            	ld	xl,a
 617  009f 7b02          	ld	a,(OFST+0,sp)
 618  00a1 5d            	tnzw	x
 619  00a2 2704          	jreq	L42
 620  00a4               L62:
 621  00a4 44            	srl	a
 622  00a5 5a            	decw	x
 623  00a6 26fc          	jrne	L62
 624  00a8               L42:
 625  00a8 6b02          	ld	(OFST+0,sp),a
 626                     ; 220   return((ITC_PriorityLevel_TypeDef)Value);
 628  00aa 7b02          	ld	a,(OFST+0,sp)
 631  00ac 5b03          	addw	sp,#3
 632  00ae 81            	ret
 696                     	switch	.const
 697  003a               L44:
 698  003a 00ee          	dc.w	L722
 699  003c 00ee          	dc.w	L722
 700  003e 00ee          	dc.w	L722
 701  0040 0100          	dc.w	L132
 702  0042 0100          	dc.w	L132
 703  0044 0100          	dc.w	L132
 704  0046 0100          	dc.w	L132
 705  0048 0112          	dc.w	L332
 706  004a 0112          	dc.w	L332
 707  004c 0112          	dc.w	L332
 708  004e 0112          	dc.w	L332
 709  0050 0124          	dc.w	L532
 710  0052 0124          	dc.w	L532
 711  0054 0124          	dc.w	L532
 712  0056 0124          	dc.w	L532
 713  0058 0136          	dc.w	L732
 714  005a 0136          	dc.w	L732
 715  005c 0136          	dc.w	L732
 716  005e 0136          	dc.w	L732
 717  0060 0148          	dc.w	L142
 718  0062 0148          	dc.w	L142
 719  0064 0148          	dc.w	L142
 720  0066 0148          	dc.w	L142
 721  0068 015a          	dc.w	L342
 722  006a 015a          	dc.w	L342
 723  006c 015a          	dc.w	L342
 724  006e 015a          	dc.w	L342
 725  0070 016c          	dc.w	L542
 726  0072 016c          	dc.w	L542
 727                     ; 241 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 727                     ; 242 {
 728                     	switch	.text
 729  00af               _ITC_SetSoftwarePriority:
 731  00af 89            	pushw	x
 732  00b0 89            	pushw	x
 733       00000002      OFST:	set	2
 736                     ; 243   uint8_t Mask = 0;
 738  00b1 7b01          	ld	a,(OFST-1,sp)
 739  00b3 97            	ld	xl,a
 740                     ; 244   uint8_t NewPriority = 0;
 742  00b4 7b02          	ld	a,(OFST+0,sp)
 743  00b6 97            	ld	xl,a
 744                     ; 247   assert_param(IS_ITC_IRQ(IRQn));
 746                     ; 248   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 748                     ; 251   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 750                     ; 255   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 752  00b7 7b03          	ld	a,(OFST+1,sp)
 753  00b9 a403          	and	a,#3
 754  00bb 48            	sll	a
 755  00bc 5f            	clrw	x
 756  00bd 97            	ld	xl,a
 757  00be a603          	ld	a,#3
 758  00c0 5d            	tnzw	x
 759  00c1 2704          	jreq	L23
 760  00c3               L43:
 761  00c3 48            	sll	a
 762  00c4 5a            	decw	x
 763  00c5 26fc          	jrne	L43
 764  00c7               L23:
 765  00c7 43            	cpl	a
 766  00c8 6b01          	ld	(OFST-1,sp),a
 767                     ; 257   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 769  00ca 7b03          	ld	a,(OFST+1,sp)
 770  00cc a403          	and	a,#3
 771  00ce 48            	sll	a
 772  00cf 5f            	clrw	x
 773  00d0 97            	ld	xl,a
 774  00d1 7b04          	ld	a,(OFST+2,sp)
 775  00d3 5d            	tnzw	x
 776  00d4 2704          	jreq	L63
 777  00d6               L04:
 778  00d6 48            	sll	a
 779  00d7 5a            	decw	x
 780  00d8 26fc          	jrne	L04
 781  00da               L63:
 782  00da 6b02          	ld	(OFST+0,sp),a
 783                     ; 259   switch (IRQn)
 785  00dc 7b03          	ld	a,(OFST+1,sp)
 787                     ; 360     default:
 787                     ; 361       break;
 788  00de 4a            	dec	a
 789  00df a11d          	cp	a,#29
 790  00e1 2407          	jruge	L24
 791  00e3 5f            	clrw	x
 792  00e4 97            	ld	xl,a
 793  00e5 58            	sllw	x
 794  00e6 de003a        	ldw	x,(L44,x)
 795  00e9 fc            	jp	(x)
 796  00ea               L24:
 797  00ea ac7c017c      	jpf	L503
 798  00ee               L722:
 799                     ; 261     case FLASH_IRQn:
 799                     ; 262     case DMA1_CHANNEL0_1_IRQn:
 799                     ; 263     case DMA1_CHANNEL2_3_IRQn:
 799                     ; 264       ITC->ISPR1 &= Mask;
 801  00ee c67f70        	ld	a,32624
 802  00f1 1401          	and	a,(OFST-1,sp)
 803  00f3 c77f70        	ld	32624,a
 804                     ; 265       ITC->ISPR1 |= NewPriority;
 806  00f6 c67f70        	ld	a,32624
 807  00f9 1a02          	or	a,(OFST+0,sp)
 808  00fb c77f70        	ld	32624,a
 809                     ; 266       break;
 811  00fe 207c          	jra	L503
 812  0100               L132:
 813                     ; 268     case EXTIE_F_PVD_IRQn:
 813                     ; 269 #ifdef STM8L15X_MD
 813                     ; 270     case RTC_IRQn:
 813                     ; 271     case EXTIB_IRQn:
 813                     ; 272     case EXTID_IRQn:
 813                     ; 273 #elif defined (STM8L15X_LD)
 813                     ; 274     case RTC_CSSLSE_IRQn:
 813                     ; 275     case EXTIB_IRQn:
 813                     ; 276     case EXTID_IRQn:
 813                     ; 277 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 813                     ; 278     case RTC_CSSLSE_IRQn:
 813                     ; 279     case EXTIB_G_IRQn:
 813                     ; 280     case EXTID_H_IRQn:
 813                     ; 281 #endif  /* STM8L15X_MD */
 813                     ; 282       ITC->ISPR2 &= Mask;
 815  0100 c67f71        	ld	a,32625
 816  0103 1401          	and	a,(OFST-1,sp)
 817  0105 c77f71        	ld	32625,a
 818                     ; 283       ITC->ISPR2 |= NewPriority;
 820  0108 c67f71        	ld	a,32625
 821  010b 1a02          	or	a,(OFST+0,sp)
 822  010d c77f71        	ld	32625,a
 823                     ; 284       break;
 825  0110 206a          	jra	L503
 826  0112               L332:
 827                     ; 286     case EXTI0_IRQn:
 827                     ; 287     case EXTI1_IRQn:
 827                     ; 288     case EXTI2_IRQn:
 827                     ; 289     case EXTI3_IRQn:
 827                     ; 290       ITC->ISPR3 &= Mask;
 829  0112 c67f72        	ld	a,32626
 830  0115 1401          	and	a,(OFST-1,sp)
 831  0117 c77f72        	ld	32626,a
 832                     ; 291       ITC->ISPR3 |= NewPriority;
 834  011a c67f72        	ld	a,32626
 835  011d 1a02          	or	a,(OFST+0,sp)
 836  011f c77f72        	ld	32626,a
 837                     ; 292       break;
 839  0122 2058          	jra	L503
 840  0124               L532:
 841                     ; 294     case EXTI4_IRQn:
 841                     ; 295     case EXTI5_IRQn:
 841                     ; 296     case EXTI6_IRQn:
 841                     ; 297     case EXTI7_IRQn:
 841                     ; 298       ITC->ISPR4 &= Mask;
 843  0124 c67f73        	ld	a,32627
 844  0127 1401          	and	a,(OFST-1,sp)
 845  0129 c77f73        	ld	32627,a
 846                     ; 299       ITC->ISPR4 |= NewPriority;
 848  012c c67f73        	ld	a,32627
 849  012f 1a02          	or	a,(OFST+0,sp)
 850  0131 c77f73        	ld	32627,a
 851                     ; 300       break;
 853  0134 2046          	jra	L503
 854  0136               L732:
 855                     ; 302     case SWITCH_CSS_BREAK_DAC_IRQn:
 855                     ; 303 #else
 855                     ; 304     case SWITCH_CSS_IRQn:
 855                     ; 305 #endif /*	STM8L15X_LD	*/
 855                     ; 306     case ADC1_COMP_IRQn:
 855                     ; 307 #ifdef STM8L15X_MD
 855                     ; 308     case LCD_IRQn:
 855                     ; 309     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 855                     ; 310 #elif defined (STM8L15X_LD)
 855                     ; 311     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 855                     ; 312 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 855                     ; 313     case LCD_AES_IRQn:
 855                     ; 314     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 855                     ; 315 #endif  /* STM8L15X_MD */
 855                     ; 316       ITC->ISPR5 &= Mask;
 857  0136 c67f74        	ld	a,32628
 858  0139 1401          	and	a,(OFST-1,sp)
 859  013b c77f74        	ld	32628,a
 860                     ; 317       ITC->ISPR5 |= NewPriority;
 862  013e c67f74        	ld	a,32628
 863  0141 1a02          	or	a,(OFST+0,sp)
 864  0143 c77f74        	ld	32628,a
 865                     ; 318       break;
 867  0146 2034          	jra	L503
 868  0148               L142:
 869                     ; 320     case TIM1_UPD_OVF_TRG_IRQn:
 869                     ; 321 #endif  /* STM8L15X_LD */
 869                     ; 322 #if defined (STM8L15X_MD) || defined (STM8L15X_LD)
 869                     ; 323     case TIM2_CC_IRQn:
 869                     ; 324     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 869                     ; 325     case TIM3_CC_IRQn:
 869                     ; 326 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 869                     ; 327     case TIM2_CC_USART2_RX_IRQn:
 869                     ; 328     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 869                     ; 329     case TIM3_CC_USART3_RX_IRQn:
 869                     ; 330 #endif  /* STM8L15X_MD */
 869                     ; 331       ITC->ISPR6 &= Mask;
 871  0148 c67f75        	ld	a,32629
 872  014b 1401          	and	a,(OFST-1,sp)
 873  014d c77f75        	ld	32629,a
 874                     ; 332       ITC->ISPR6 |= NewPriority;
 876  0150 c67f75        	ld	a,32629
 877  0153 1a02          	or	a,(OFST+0,sp)
 878  0155 c77f75        	ld	32629,a
 879                     ; 333       break;
 881  0158 2022          	jra	L503
 882  015a               L342:
 883                     ; 336     case TIM1_CC_IRQn:
 883                     ; 337 #endif  /* STM8L15X_LD */
 883                     ; 338     case TIM4_UPD_OVF_TRG_IRQn:
 883                     ; 339     case SPI1_IRQn:
 883                     ; 340 #if defined (STM8L15X_MD) || defined (STM8L15X_LD)
 883                     ; 341     case USART1_TX_IRQn:
 883                     ; 342 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 883                     ; 343     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 883                     ; 344 #endif  /* STM8L15X_MD */
 883                     ; 345       ITC->ISPR7 &= Mask;
 885  015a c67f76        	ld	a,32630
 886  015d 1401          	and	a,(OFST-1,sp)
 887  015f c77f76        	ld	32630,a
 888                     ; 346       ITC->ISPR7 |= NewPriority;
 890  0162 c67f76        	ld	a,32630
 891  0165 1a02          	or	a,(OFST+0,sp)
 892  0167 c77f76        	ld	32630,a
 893                     ; 347       break;
 895  016a 2010          	jra	L503
 896  016c               L542:
 897                     ; 350     case USART1_RX_IRQn:
 897                     ; 351     case I2C1_IRQn:
 897                     ; 352 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 897                     ; 353     case USART1_RX_TIM5_CC_IRQn:
 897                     ; 354     case I2C1_SPI2_IRQn:
 897                     ; 355 #endif  /* STM8L15X_MD */
 897                     ; 356       ITC->ISPR8 &= Mask;
 899  016c c67f77        	ld	a,32631
 900  016f 1401          	and	a,(OFST-1,sp)
 901  0171 c77f77        	ld	32631,a
 902                     ; 357       ITC->ISPR8 |= NewPriority;
 904  0174 c67f77        	ld	a,32631
 905  0177 1a02          	or	a,(OFST+0,sp)
 906  0179 c77f77        	ld	32631,a
 907                     ; 358       break;
 909  017c               L742:
 910                     ; 360     default:
 910                     ; 361       break;
 912  017c               L503:
 913                     ; 363 }
 916  017c 5b04          	addw	sp,#4
 917  017e 81            	ret
 930                     	xdef	_ITC_GetSoftwarePriority
 931                     	xdef	_ITC_SetSoftwarePriority
 932                     	xdef	_ITC_GetSoftIntStatus
 933                     	xdef	_ITC_GetCPUCC
 934                     	xdef	_ITC_DeInit
 953                     	end
