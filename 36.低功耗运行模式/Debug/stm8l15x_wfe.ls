   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 89 void WFE_DeInit(void)
  32                     ; 90 {
  34                     	switch	.text
  35  0000               _WFE_DeInit:
  39                     ; 91   WFE->CR1 = WFE_CRX_RESET_VALUE;
  41  0000 725f50a6      	clr	20646
  42                     ; 92   WFE->CR2 = WFE_CRX_RESET_VALUE;
  44  0004 725f50a7      	clr	20647
  45                     ; 93   WFE->CR3 = WFE_CRX_RESET_VALUE;
  47  0008 725f50a8      	clr	20648
  48                     ; 94   WFE->CR4 = WFE_CRX_RESET_VALUE;
  50  000c 725f50a9      	clr	20649
  51                     ; 95 }
  54  0010 81            	ret
 378                     ; 135 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 378                     ; 136 {
 379                     	switch	.text
 380  0011               _WFE_WakeUpSourceEventCmd:
 382  0011 89            	pushw	x
 383  0012 88            	push	a
 384       00000001      OFST:	set	1
 387                     ; 137   uint8_t register_index = 0;
 389  0013 0f01          	clr	(OFST+0,sp)
 390                     ; 139   assert_param(IS_WFE_SOURCE(WFE_Source));
 392                     ; 140   assert_param(IS_FUNCTIONAL_STATE(NewState));
 394                     ; 143   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 396  0015 9e            	ld	a,xh
 397  0016 6b01          	ld	(OFST+0,sp),a
 398                     ; 145   if (NewState != DISABLE)
 400  0018 0d06          	tnz	(OFST+5,sp)
 401  001a 273c          	jreq	L502
 402                     ; 147     switch (register_index)
 404  001c 7b01          	ld	a,(OFST+0,sp)
 406                     ; 165       default:
 406                     ; 166         break;
 407  001e 4a            	dec	a
 408  001f 270b          	jreq	L12
 409  0021 4a            	dec	a
 410  0022 2712          	jreq	L32
 411  0024 4a            	dec	a
 412  0025 2719          	jreq	L52
 413  0027 4a            	dec	a
 414  0028 2720          	jreq	L72
 415  002a 2045          	jra	L312
 416  002c               L12:
 417                     ; 149       case 1:
 417                     ; 150         WFE->CR1 |= (uint8_t)WFE_Source;
 419  002c c650a6        	ld	a,20646
 420  002f 1a03          	or	a,(OFST+2,sp)
 421  0031 c750a6        	ld	20646,a
 422                     ; 151         break;
 424  0034 203b          	jra	L312
 425  0036               L32:
 426                     ; 153       case 2:
 426                     ; 154         WFE->CR2 |= (uint8_t)WFE_Source;
 428  0036 c650a7        	ld	a,20647
 429  0039 1a03          	or	a,(OFST+2,sp)
 430  003b c750a7        	ld	20647,a
 431                     ; 155         break;
 433  003e 2031          	jra	L312
 434  0040               L52:
 435                     ; 157       case 3:
 435                     ; 158         WFE->CR3 |= (uint8_t)WFE_Source;
 437  0040 c650a8        	ld	a,20648
 438  0043 1a03          	or	a,(OFST+2,sp)
 439  0045 c750a8        	ld	20648,a
 440                     ; 159         break;
 442  0048 2027          	jra	L312
 443  004a               L72:
 444                     ; 161       case 4:
 444                     ; 162         WFE->CR4 |= (uint8_t)WFE_Source;
 446  004a c650a9        	ld	a,20649
 447  004d 1a03          	or	a,(OFST+2,sp)
 448  004f c750a9        	ld	20649,a
 449                     ; 163         break;
 451  0052 201d          	jra	L312
 452  0054               L13:
 453                     ; 165       default:
 453                     ; 166         break;
 455  0054 201b          	jra	L312
 456  0056               L112:
 458  0056 2019          	jra	L312
 459  0058               L502:
 460                     ; 171     switch (register_index)
 462  0058 7b01          	ld	a,(OFST+0,sp)
 464                     ; 189       default:
 464                     ; 190         break;
 465  005a 4a            	dec	a
 466  005b 270b          	jreq	L33
 467  005d 4a            	dec	a
 468  005e 2714          	jreq	L53
 469  0060 4a            	dec	a
 470  0061 271c          	jreq	L73
 471  0063 4a            	dec	a
 472  0064 2724          	jreq	L14
 473  0066 2009          	jra	L312
 474  0068               L33:
 475                     ; 173       case 1:
 475                     ; 174         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 477  0068 7b03          	ld	a,(OFST+2,sp)
 478  006a 43            	cpl	a
 479  006b c450a6        	and	a,20646
 480  006e c750a6        	ld	20646,a
 481                     ; 175         break;
 482  0071               L312:
 483                     ; 193 }
 486  0071 5b03          	addw	sp,#3
 487  0073 81            	ret
 488  0074               L53:
 489                     ; 177       case 2:
 489                     ; 178         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 491  0074 7b03          	ld	a,(OFST+2,sp)
 492  0076 43            	cpl	a
 493  0077 c450a7        	and	a,20647
 494  007a c750a7        	ld	20647,a
 495                     ; 179         break;
 497  007d 20f2          	jra	L312
 498  007f               L73:
 499                     ; 181       case 3:
 499                     ; 182         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 501  007f 7b03          	ld	a,(OFST+2,sp)
 502  0081 43            	cpl	a
 503  0082 c450a8        	and	a,20648
 504  0085 c750a8        	ld	20648,a
 505                     ; 183         break;
 507  0088 20e7          	jra	L312
 508  008a               L14:
 509                     ; 185       case 4:
 509                     ; 186         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 511  008a 7b03          	ld	a,(OFST+2,sp)
 512  008c 43            	cpl	a
 513  008d c450a9        	and	a,20649
 514  0090 c750a9        	ld	20649,a
 515                     ; 187         break;
 517  0093 20dc          	jra	L312
 518  0095               L34:
 519                     ; 189       default:
 519                     ; 190         break;
 521  0095 20da          	jra	L312
 522  0097               L712:
 523  0097 20d8          	jra	L312
 570                     ; 231 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 570                     ; 232 {
 571                     	switch	.text
 572  0099               _WFE_GetWakeUpSourceEventStatus:
 574  0099 89            	pushw	x
 575  009a 88            	push	a
 576       00000001      OFST:	set	1
 579                     ; 233   FunctionalState status = DISABLE;
 581  009b 0f01          	clr	(OFST+0,sp)
 582                     ; 235   assert_param(IS_WFE_SOURCE(WFE_Source));
 584                     ; 237   switch (WFE_Source)
 587                     ; 320     default:
 587                     ; 321       break;
 588  009d 1d0101        	subw	x,#257
 589  00a0 2603          	jrne	L21
 590  00a2 cc0140        	jp	L122
 591  00a5               L21:
 592  00a5 5a            	decw	x
 593  00a6 2603          	jrne	L41
 594  00a8 cc0140        	jp	L122
 595  00ab               L41:
 596  00ab 1d0002        	subw	x,#2
 597  00ae 2603          	jrne	L61
 598  00b0 cc0140        	jp	L122
 599  00b3               L61:
 600  00b3 1d0004        	subw	x,#4
 601  00b6 2603          	jrne	L02
 602  00b8 cc0140        	jp	L122
 603  00bb               L02:
 604  00bb 1d0008        	subw	x,#8
 605  00be 2602          	jrne	L22
 606  00c0 207e          	jp	L122
 607  00c2               L22:
 608  00c2 1d0010        	subw	x,#16
 609  00c5 2779          	jreq	L122
 610  00c7 1d0020        	subw	x,#32
 611  00ca 2774          	jreq	L122
 612  00cc 1d0040        	subw	x,#64
 613  00cf 276f          	jreq	L122
 614  00d1 1d0081        	subw	x,#129
 615  00d4 277b          	jreq	L322
 616  00d6 5a            	decw	x
 617  00d7 2778          	jreq	L322
 618  00d9 1d0002        	subw	x,#2
 619  00dc 2773          	jreq	L322
 620  00de 1d0004        	subw	x,#4
 621  00e1 276e          	jreq	L322
 622  00e3 1d0008        	subw	x,#8
 623  00e6 2769          	jreq	L322
 624  00e8 1d0010        	subw	x,#16
 625  00eb 2764          	jreq	L322
 626  00ed 1d0020        	subw	x,#32
 627  00f0 275f          	jreq	L322
 628  00f2 1d0040        	subw	x,#64
 629  00f5 275a          	jreq	L322
 630  00f7 1d0081        	subw	x,#129
 631  00fa 2766          	jreq	L522
 632  00fc 5a            	decw	x
 633  00fd 2763          	jreq	L522
 634  00ff 1d0002        	subw	x,#2
 635  0102 275e          	jreq	L522
 636  0104 1d0004        	subw	x,#4
 637  0107 2759          	jreq	L522
 638  0109 1d0008        	subw	x,#8
 639  010c 2754          	jreq	L522
 640  010e 1d0010        	subw	x,#16
 641  0111 274f          	jreq	L522
 642  0113 1d0020        	subw	x,#32
 643  0116 274a          	jreq	L522
 644  0118 1d0040        	subw	x,#64
 645  011b 2745          	jreq	L522
 646  011d 1d0081        	subw	x,#129
 647  0120 2751          	jreq	L722
 648  0122 5a            	decw	x
 649  0123 274e          	jreq	L722
 650  0125 1d0002        	subw	x,#2
 651  0128 2749          	jreq	L722
 652  012a 1d0004        	subw	x,#4
 653  012d 2744          	jreq	L722
 654  012f 1d0008        	subw	x,#8
 655  0132 273f          	jreq	L722
 656  0134 1d0010        	subw	x,#16
 657  0137 273a          	jreq	L722
 658  0139 1d0020        	subw	x,#32
 659  013c 2735          	jreq	L722
 660  013e 2042          	jra	L752
 661  0140               L122:
 662                     ; 239     case WFE_Source_TIM2_EV0:
 662                     ; 240     case WFE_Source_TIM2_EV1:
 662                     ; 241     case WFE_Source_TIM1_EV0:
 662                     ; 242     case WFE_Source_TIM1_EV1:
 662                     ; 243     case WFE_Source_EXTI_EV0:
 662                     ; 244     case WFE_Source_EXTI_EV1:
 662                     ; 245     case WFE_Source_EXTI_EV2:
 662                     ; 246     case WFE_Source_EXTI_EV3:
 662                     ; 247 
 662                     ; 248       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 664  0140 c650a6        	ld	a,20646
 665  0143 1503          	bcp	a,(OFST+2,sp)
 666  0145 2706          	jreq	L162
 667                     ; 251         status = ENABLE;
 669  0147 a601          	ld	a,#1
 670  0149 6b01          	ld	(OFST+0,sp),a
 672  014b 2035          	jra	L752
 673  014d               L162:
 674                     ; 256         status = DISABLE;
 676  014d 0f01          	clr	(OFST+0,sp)
 677  014f 2031          	jra	L752
 678  0151               L322:
 679                     ; 260     case WFE_Source_EXTI_EV4:
 679                     ; 261     case WFE_Source_EXTI_EV5:
 679                     ; 262     case WFE_Source_EXTI_EV6:
 679                     ; 263     case WFE_Source_EXTI_EV7:
 679                     ; 264     case WFE_Source_EXTI_EVB_G:
 679                     ; 265     case WFE_Source_EXTI_EVD_H:
 679                     ; 266     case WFE_Source_EXTI_EVE_F:
 679                     ; 267     case WFE_Source_ADC1_COMP_EV:
 679                     ; 268 
 679                     ; 269       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 681  0151 c650a7        	ld	a,20647
 682  0154 1503          	bcp	a,(OFST+2,sp)
 683  0156 2706          	jreq	L562
 684                     ; 272         status = ENABLE;
 686  0158 a601          	ld	a,#1
 687  015a 6b01          	ld	(OFST+0,sp),a
 689  015c 2024          	jra	L752
 690  015e               L562:
 691                     ; 277         status = DISABLE;
 693  015e 0f01          	clr	(OFST+0,sp)
 694  0160 2020          	jra	L752
 695  0162               L522:
 696                     ; 280     case WFE_Source_TIM3_EV0:
 696                     ; 281     case WFE_Source_TIM3_EV1:
 696                     ; 282     case WFE_Source_TIM4_EV:
 696                     ; 283     case WFE_Source_SPI1_EV:
 696                     ; 284     case WFE_Source_I2C1_EV:
 696                     ; 285     case WFE_Source_USART1_EV:
 696                     ; 286     case WFE_Source_DMA1CH01_EV:
 696                     ; 287     case WFE_Source_DMA1CH23_EV:
 696                     ; 288 
 696                     ; 289       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 698  0162 c650a8        	ld	a,20648
 699  0165 1503          	bcp	a,(OFST+2,sp)
 700  0167 2706          	jreq	L172
 701                     ; 292         status = ENABLE;
 703  0169 a601          	ld	a,#1
 704  016b 6b01          	ld	(OFST+0,sp),a
 706  016d 2013          	jra	L752
 707  016f               L172:
 708                     ; 297         status = DISABLE;
 710  016f 0f01          	clr	(OFST+0,sp)
 711  0171 200f          	jra	L752
 712  0173               L722:
 713                     ; 301     case WFE_Source_TIM5_EV0:
 713                     ; 302     case WFE_Source_TIM5_EV1:
 713                     ; 303     case WFE_Source_AES_EV:
 713                     ; 304     case WFE_Source_SPI2_EV:
 713                     ; 305     case WFE_Source_USART2_EV:
 713                     ; 306     case WFE_Source_USART3_EV:
 713                     ; 307     case WFE_Source_RTC_CSS_EV:
 713                     ; 308 
 713                     ; 309       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 715  0173 c650a9        	ld	a,20649
 716  0176 1503          	bcp	a,(OFST+2,sp)
 717  0178 2706          	jreq	L572
 718                     ; 312         status = ENABLE;
 720  017a a601          	ld	a,#1
 721  017c 6b01          	ld	(OFST+0,sp),a
 723  017e 2002          	jra	L752
 724  0180               L572:
 725                     ; 317         status = DISABLE;
 727  0180 0f01          	clr	(OFST+0,sp)
 728  0182               L132:
 729                     ; 320     default:
 729                     ; 321       break;
 731  0182               L752:
 732                     ; 323   return status;
 734  0182 7b01          	ld	a,(OFST+0,sp)
 737  0184 5b03          	addw	sp,#3
 738  0186 81            	ret
 751                     	xdef	_WFE_GetWakeUpSourceEventStatus
 752                     	xdef	_WFE_WakeUpSourceEventCmd
 753                     	xdef	_WFE_DeInit
 772                     	end
