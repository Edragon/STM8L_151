   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 188                     ; 135 void I2C_DeInit(I2C_TypeDef* I2Cx)
 188                     ; 136 {
 190                     	switch	.text
 191  0000               _I2C_DeInit:
 195                     ; 137   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 197  0000 7f            	clr	(x)
 198                     ; 138   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 200  0001 6f01          	clr	(1,x)
 201                     ; 139   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 203  0003 6f02          	clr	(2,x)
 204                     ; 140   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 206  0005 6f03          	clr	(3,x)
 207                     ; 141   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 209  0007 6f04          	clr	(4,x)
 210                     ; 142   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 212  0009 6f05          	clr	(5,x)
 213                     ; 143   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 215  000b 6f0a          	clr	(10,x)
 216                     ; 144   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 218  000d 6f0b          	clr	(11,x)
 219                     ; 145   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 221  000f 6f0c          	clr	(12,x)
 222                     ; 146   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 224  0011 a602          	ld	a,#2
 225  0013 e70d          	ld	(13,x),a
 226                     ; 147 }
 229  0015 81            	ret
 453                     .const:	section	.text
 454  0000               L01:
 455  0000 000f4240      	dc.l	1000000
 456  0004               L21:
 457  0004 000186a1      	dc.l	100001
 458  0008               L41:
 459  0008 00000004      	dc.l	4
 460                     ; 178 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 460                     ; 179               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 460                     ; 180               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 460                     ; 181 {
 461                     	switch	.text
 462  0016               _I2C_Init:
 464  0016 89            	pushw	x
 465  0017 520c          	subw	sp,#12
 466       0000000c      OFST:	set	12
 469                     ; 182   uint32_t result = 0x0004;
 471  0019 96            	ldw	x,sp
 472  001a 1c0009        	addw	x,#OFST-3
 473  001d cd0000        	call	c_ltor
 475                     ; 183   uint16_t tmpval = 0;
 477  0020 1e05          	ldw	x,(OFST-7,sp)
 478                     ; 184   uint8_t tmpccrh = 0;
 480  0022 0f07          	clr	(OFST-5,sp)
 481                     ; 185   uint8_t input_clock = 0;
 483  0024 7b08          	ld	a,(OFST-4,sp)
 484  0026 97            	ld	xl,a
 485                     ; 188   assert_param(IS_I2C_MODE(I2C_Mode));
 487                     ; 189   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 489                     ; 190   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 491                     ; 191   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 493                     ; 192   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 495                     ; 193   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 497                     ; 197   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 499  0027 cd0000        	call	_CLK_GetClockFreq
 501  002a ae0000        	ldw	x,#L01
 502  002d cd0000        	call	c_ludv
 504  0030 b603          	ld	a,c_lreg+3
 505  0032 6b08          	ld	(OFST-4,sp),a
 506                     ; 201   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 508  0034 1e0d          	ldw	x,(OFST+1,sp)
 509  0036 e602          	ld	a,(2,x)
 510  0038 a4c0          	and	a,#192
 511  003a e702          	ld	(2,x),a
 512                     ; 203   I2Cx->FREQR |= input_clock;
 514  003c 1e0d          	ldw	x,(OFST+1,sp)
 515  003e e602          	ld	a,(2,x)
 516  0040 1a08          	or	a,(OFST-4,sp)
 517  0042 e702          	ld	(2,x),a
 518                     ; 207   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 520  0044 1e0d          	ldw	x,(OFST+1,sp)
 521  0046 f6            	ld	a,(x)
 522  0047 a4fe          	and	a,#254
 523  0049 f7            	ld	(x),a
 524                     ; 210   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 526  004a 1e0d          	ldw	x,(OFST+1,sp)
 527  004c e60c          	ld	a,(12,x)
 528  004e a430          	and	a,#48
 529  0050 e70c          	ld	(12,x),a
 530                     ; 211   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 532  0052 1e0d          	ldw	x,(OFST+1,sp)
 533  0054 6f0b          	clr	(11,x)
 534                     ; 214   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 536  0056 96            	ldw	x,sp
 537  0057 1c0011        	addw	x,#OFST+5
 538  005a cd0000        	call	c_ltor
 540  005d ae0004        	ldw	x,#L21
 541  0060 cd0000        	call	c_lcmp
 543  0063 2403          	jruge	L02
 544  0065 cc0103        	jp	L362
 545  0068               L02:
 546                     ; 217     tmpccrh = I2C_CCRH_FS;
 548  0068 a680          	ld	a,#128
 549  006a 6b07          	ld	(OFST-5,sp),a
 550                     ; 219     if (I2C_DutyCycle == I2C_DutyCycle_2)
 552  006c 0d18          	tnz	(OFST+12,sp)
 553  006e 2633          	jrne	L562
 554                     ; 222       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 556  0070 96            	ldw	x,sp
 557  0071 1c0011        	addw	x,#OFST+5
 558  0074 cd0000        	call	c_ltor
 560  0077 a603          	ld	a,#3
 561  0079 cd0000        	call	c_smul
 563  007c 96            	ldw	x,sp
 564  007d 1c0001        	addw	x,#OFST-11
 565  0080 cd0000        	call	c_rtol
 567  0083 7b08          	ld	a,(OFST-4,sp)
 568  0085 b703          	ld	c_lreg+3,a
 569  0087 3f02          	clr	c_lreg+2
 570  0089 3f01          	clr	c_lreg+1
 571  008b 3f00          	clr	c_lreg
 572  008d ae0000        	ldw	x,#L01
 573  0090 cd0000        	call	c_lmul
 575  0093 96            	ldw	x,sp
 576  0094 1c0001        	addw	x,#OFST-11
 577  0097 cd0000        	call	c_ludv
 579  009a 96            	ldw	x,sp
 580  009b 1c0009        	addw	x,#OFST-3
 581  009e cd0000        	call	c_rtol
 584  00a1 2037          	jra	L762
 585  00a3               L562:
 586                     ; 227       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 588  00a3 96            	ldw	x,sp
 589  00a4 1c0011        	addw	x,#OFST+5
 590  00a7 cd0000        	call	c_ltor
 592  00aa a619          	ld	a,#25
 593  00ac cd0000        	call	c_smul
 595  00af 96            	ldw	x,sp
 596  00b0 1c0001        	addw	x,#OFST-11
 597  00b3 cd0000        	call	c_rtol
 599  00b6 7b08          	ld	a,(OFST-4,sp)
 600  00b8 b703          	ld	c_lreg+3,a
 601  00ba 3f02          	clr	c_lreg+2
 602  00bc 3f01          	clr	c_lreg+1
 603  00be 3f00          	clr	c_lreg
 604  00c0 ae0000        	ldw	x,#L01
 605  00c3 cd0000        	call	c_lmul
 607  00c6 96            	ldw	x,sp
 608  00c7 1c0001        	addw	x,#OFST-11
 609  00ca cd0000        	call	c_ludv
 611  00cd 96            	ldw	x,sp
 612  00ce 1c0009        	addw	x,#OFST-3
 613  00d1 cd0000        	call	c_rtol
 615                     ; 229       tmpccrh |= I2C_CCRH_DUTY;
 617  00d4 7b07          	ld	a,(OFST-5,sp)
 618  00d6 aa40          	or	a,#64
 619  00d8 6b07          	ld	(OFST-5,sp),a
 620  00da               L762:
 621                     ; 233     if (result < (uint16_t)0x01)
 623  00da 96            	ldw	x,sp
 624  00db 1c0009        	addw	x,#OFST-3
 625  00de cd0000        	call	c_lzmp
 627  00e1 260a          	jrne	L172
 628                     ; 236       result = (uint16_t)0x0001;
 630  00e3 ae0001        	ldw	x,#1
 631  00e6 1f0b          	ldw	(OFST-1,sp),x
 632  00e8 ae0000        	ldw	x,#0
 633  00eb 1f09          	ldw	(OFST-3,sp),x
 634  00ed               L172:
 635                     ; 242     tmpval = ((input_clock * 3) / 10) + 1;
 637  00ed 7b08          	ld	a,(OFST-4,sp)
 638  00ef 97            	ld	xl,a
 639  00f0 a603          	ld	a,#3
 640  00f2 42            	mul	x,a
 641  00f3 a60a          	ld	a,#10
 642  00f5 cd0000        	call	c_sdivx
 644  00f8 5c            	incw	x
 645  00f9 1f05          	ldw	(OFST-7,sp),x
 646                     ; 243     I2Cx->TRISER = (uint8_t)tmpval;
 648  00fb 7b06          	ld	a,(OFST-6,sp)
 649  00fd 1e0d          	ldw	x,(OFST+1,sp)
 650  00ff e70d          	ld	(13,x),a
 652  0101 2059          	jra	L372
 653  0103               L362:
 654                     ; 250     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 656  0103 96            	ldw	x,sp
 657  0104 1c0011        	addw	x,#OFST+5
 658  0107 cd0000        	call	c_ltor
 660  010a 3803          	sll	c_lreg+3
 661  010c 3902          	rlc	c_lreg+2
 662  010e 3901          	rlc	c_lreg+1
 663  0110 3900          	rlc	c_lreg
 664  0112 96            	ldw	x,sp
 665  0113 1c0001        	addw	x,#OFST-11
 666  0116 cd0000        	call	c_rtol
 668  0119 7b08          	ld	a,(OFST-4,sp)
 669  011b b703          	ld	c_lreg+3,a
 670  011d 3f02          	clr	c_lreg+2
 671  011f 3f01          	clr	c_lreg+1
 672  0121 3f00          	clr	c_lreg
 673  0123 ae0000        	ldw	x,#L01
 674  0126 cd0000        	call	c_lmul
 676  0129 96            	ldw	x,sp
 677  012a 1c0001        	addw	x,#OFST-11
 678  012d cd0000        	call	c_ludv
 680  0130 be02          	ldw	x,c_lreg+2
 681  0132 cd0000        	call	c_uitolx
 683  0135 96            	ldw	x,sp
 684  0136 1c0009        	addw	x,#OFST-3
 685  0139 cd0000        	call	c_rtol
 687                     ; 253     if (result < (uint16_t)0x0004)
 689  013c 96            	ldw	x,sp
 690  013d 1c0009        	addw	x,#OFST-3
 691  0140 cd0000        	call	c_ltor
 693  0143 ae0008        	ldw	x,#L41
 694  0146 cd0000        	call	c_lcmp
 696  0149 240a          	jruge	L572
 697                     ; 256       result = (uint16_t)0x0004;
 699  014b ae0004        	ldw	x,#4
 700  014e 1f0b          	ldw	(OFST-1,sp),x
 701  0150 ae0000        	ldw	x,#0
 702  0153 1f09          	ldw	(OFST-3,sp),x
 703  0155               L572:
 704                     ; 262     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 706  0155 7b08          	ld	a,(OFST-4,sp)
 707  0157 4c            	inc	a
 708  0158 1e0d          	ldw	x,(OFST+1,sp)
 709  015a e70d          	ld	(13,x),a
 710  015c               L372:
 711                     ; 267   I2Cx->CCRL = (uint8_t)result;
 713  015c 7b0c          	ld	a,(OFST+0,sp)
 714  015e 1e0d          	ldw	x,(OFST+1,sp)
 715  0160 e70b          	ld	(11,x),a
 716                     ; 268   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 718  0162 7b07          	ld	a,(OFST-5,sp)
 719  0164 1e0d          	ldw	x,(OFST+1,sp)
 720  0166 e70c          	ld	(12,x),a
 721                     ; 271   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 723  0168 1e0d          	ldw	x,(OFST+1,sp)
 724  016a 7b17          	ld	a,(OFST+11,sp)
 725  016c aa01          	or	a,#1
 726  016e fa            	or	a,(x)
 727  016f f7            	ld	(x),a
 728                     ; 274   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 730  0170 1e0d          	ldw	x,(OFST+1,sp)
 731  0172 e601          	ld	a,(1,x)
 732  0174 1a19          	or	a,(OFST+13,sp)
 733  0176 e701          	ld	(1,x),a
 734                     ; 277   I2Cx->OARL = (uint8_t)(OwnAddress);
 736  0178 7b16          	ld	a,(OFST+10,sp)
 737  017a 1e0d          	ldw	x,(OFST+1,sp)
 738  017c e703          	ld	(3,x),a
 739                     ; 278   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 739                     ; 279                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 741  017e 7b15          	ld	a,(OFST+9,sp)
 742  0180 97            	ld	xl,a
 743  0181 7b16          	ld	a,(OFST+10,sp)
 744  0183 9f            	ld	a,xl
 745  0184 a403          	and	a,#3
 746  0186 97            	ld	xl,a
 747  0187 4f            	clr	a
 748  0188 02            	rlwa	x,a
 749  0189 a607          	ld	a,#7
 750  018b               L61:
 751  018b 54            	srlw	x
 752  018c 4a            	dec	a
 753  018d 26fc          	jrne	L61
 754  018f 9f            	ld	a,xl
 755  0190 6b04          	ld	(OFST-8,sp),a
 756  0192 7b1a          	ld	a,(OFST+14,sp)
 757  0194 aa40          	or	a,#64
 758  0196 1a04          	or	a,(OFST-8,sp)
 759  0198 1e0d          	ldw	x,(OFST+1,sp)
 760  019a e704          	ld	(4,x),a
 761                     ; 280 }
 764  019c 5b0e          	addw	sp,#14
 765  019e 81            	ret
 832                     ; 289 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 832                     ; 290 {
 833                     	switch	.text
 834  019f               _I2C_Cmd:
 836  019f 89            	pushw	x
 837       00000000      OFST:	set	0
 840                     ; 293   assert_param(IS_FUNCTIONAL_STATE(NewState));
 842                     ; 295   if (NewState != DISABLE)
 844  01a0 0d05          	tnz	(OFST+5,sp)
 845  01a2 2706          	jreq	L333
 846                     ; 298     I2Cx->CR1 |= I2C_CR1_PE;
 848  01a4 f6            	ld	a,(x)
 849  01a5 aa01          	or	a,#1
 850  01a7 f7            	ld	(x),a
 852  01a8 2006          	jra	L533
 853  01aa               L333:
 854                     ; 303     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 856  01aa 1e01          	ldw	x,(OFST+1,sp)
 857  01ac f6            	ld	a,(x)
 858  01ad a4fe          	and	a,#254
 859  01af f7            	ld	(x),a
 860  01b0               L533:
 861                     ; 305 }
 864  01b0 85            	popw	x
 865  01b1 81            	ret
 912                     ; 314 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 912                     ; 315 {
 913                     	switch	.text
 914  01b2               _I2C_GeneralCallCmd:
 916  01b2 89            	pushw	x
 917       00000000      OFST:	set	0
 920                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 922                     ; 320   if (NewState != DISABLE)
 924  01b3 0d05          	tnz	(OFST+5,sp)
 925  01b5 2706          	jreq	L363
 926                     ; 323     I2Cx->CR1 |= I2C_CR1_ENGC;
 928  01b7 f6            	ld	a,(x)
 929  01b8 aa40          	or	a,#64
 930  01ba f7            	ld	(x),a
 932  01bb 2006          	jra	L563
 933  01bd               L363:
 934                     ; 328     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 936  01bd 1e01          	ldw	x,(OFST+1,sp)
 937  01bf f6            	ld	a,(x)
 938  01c0 a4bf          	and	a,#191
 939  01c2 f7            	ld	(x),a
 940  01c3               L563:
 941                     ; 330 }
 944  01c3 85            	popw	x
 945  01c4 81            	ret
 992                     ; 341 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 992                     ; 342 {
 993                     	switch	.text
 994  01c5               _I2C_GenerateSTART:
 996  01c5 89            	pushw	x
 997       00000000      OFST:	set	0
1000                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
1002                     ; 347   if (NewState != DISABLE)
1004  01c6 0d05          	tnz	(OFST+5,sp)
1005  01c8 2708          	jreq	L314
1006                     ; 350     I2Cx->CR2 |= I2C_CR2_START;
1008  01ca e601          	ld	a,(1,x)
1009  01cc aa01          	or	a,#1
1010  01ce e701          	ld	(1,x),a
1012  01d0 2008          	jra	L514
1013  01d2               L314:
1014                     ; 355     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1016  01d2 1e01          	ldw	x,(OFST+1,sp)
1017  01d4 e601          	ld	a,(1,x)
1018  01d6 a4fe          	and	a,#254
1019  01d8 e701          	ld	(1,x),a
1020  01da               L514:
1021                     ; 357 }
1024  01da 85            	popw	x
1025  01db 81            	ret
1072                     ; 366 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1072                     ; 367 {
1073                     	switch	.text
1074  01dc               _I2C_GenerateSTOP:
1076  01dc 89            	pushw	x
1077       00000000      OFST:	set	0
1080                     ; 370   assert_param(IS_FUNCTIONAL_STATE(NewState));
1082                     ; 372   if (NewState != DISABLE)
1084  01dd 0d05          	tnz	(OFST+5,sp)
1085  01df 2708          	jreq	L344
1086                     ; 375     I2Cx->CR2 |= I2C_CR2_STOP;
1088  01e1 e601          	ld	a,(1,x)
1089  01e3 aa02          	or	a,#2
1090  01e5 e701          	ld	(1,x),a
1092  01e7 2008          	jra	L544
1093  01e9               L344:
1094                     ; 380     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1096  01e9 1e01          	ldw	x,(OFST+1,sp)
1097  01eb e601          	ld	a,(1,x)
1098  01ed a4fd          	and	a,#253
1099  01ef e701          	ld	(1,x),a
1100  01f1               L544:
1101                     ; 382 }
1104  01f1 85            	popw	x
1105  01f2 81            	ret
1153                     ; 391 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1153                     ; 392 {
1154                     	switch	.text
1155  01f3               _I2C_SoftwareResetCmd:
1157  01f3 89            	pushw	x
1158       00000000      OFST:	set	0
1161                     ; 394   assert_param(IS_FUNCTIONAL_STATE(NewState));
1163                     ; 396   if (NewState != DISABLE)
1165  01f4 0d05          	tnz	(OFST+5,sp)
1166  01f6 2708          	jreq	L374
1167                     ; 399     I2Cx->CR2 |= I2C_CR2_SWRST;
1169  01f8 e601          	ld	a,(1,x)
1170  01fa aa80          	or	a,#128
1171  01fc e701          	ld	(1,x),a
1173  01fe 2008          	jra	L574
1174  0200               L374:
1175                     ; 404     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1177  0200 1e01          	ldw	x,(OFST+1,sp)
1178  0202 e601          	ld	a,(1,x)
1179  0204 a47f          	and	a,#127
1180  0206 e701          	ld	(1,x),a
1181  0208               L574:
1182                     ; 406 }
1185  0208 85            	popw	x
1186  0209 81            	ret
1234                     ; 415 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1234                     ; 416 {
1235                     	switch	.text
1236  020a               _I2C_StretchClockCmd:
1238  020a 89            	pushw	x
1239       00000000      OFST:	set	0
1242                     ; 418   assert_param(IS_FUNCTIONAL_STATE(NewState));
1244                     ; 420   if (NewState != DISABLE)
1246  020b 0d05          	tnz	(OFST+5,sp)
1247  020d 2706          	jreq	L325
1248                     ; 423     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1250  020f f6            	ld	a,(x)
1251  0210 a47f          	and	a,#127
1252  0212 f7            	ld	(x),a
1254  0213 2006          	jra	L525
1255  0215               L325:
1256                     ; 429     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1258  0215 1e01          	ldw	x,(OFST+1,sp)
1259  0217 f6            	ld	a,(x)
1260  0218 aa80          	or	a,#128
1261  021a f7            	ld	(x),a
1262  021b               L525:
1263                     ; 431 }
1266  021b 85            	popw	x
1267  021c 81            	ret
1314                     ; 440 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1314                     ; 441 {
1315                     	switch	.text
1316  021d               _I2C_ARPCmd:
1318  021d 89            	pushw	x
1319       00000000      OFST:	set	0
1322                     ; 443   assert_param(IS_FUNCTIONAL_STATE(NewState));
1324                     ; 445   if (NewState != DISABLE)
1326  021e 0d05          	tnz	(OFST+5,sp)
1327  0220 2706          	jreq	L355
1328                     ; 448     I2Cx->CR1 |= I2C_CR1_ARP;
1330  0222 f6            	ld	a,(x)
1331  0223 aa10          	or	a,#16
1332  0225 f7            	ld	(x),a
1334  0226 2006          	jra	L555
1335  0228               L355:
1336                     ; 454     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1338  0228 1e01          	ldw	x,(OFST+1,sp)
1339  022a f6            	ld	a,(x)
1340  022b a4ef          	and	a,#239
1341  022d f7            	ld	(x),a
1342  022e               L555:
1343                     ; 456 }
1346  022e 85            	popw	x
1347  022f 81            	ret
1395                     ; 465 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1395                     ; 466 {
1396                     	switch	.text
1397  0230               _I2C_AcknowledgeConfig:
1399  0230 89            	pushw	x
1400       00000000      OFST:	set	0
1403                     ; 468   assert_param(IS_FUNCTIONAL_STATE(NewState));
1405                     ; 470   if (NewState != DISABLE)
1407  0231 0d05          	tnz	(OFST+5,sp)
1408  0233 2708          	jreq	L306
1409                     ; 473     I2Cx->CR2 |= I2C_CR2_ACK;
1411  0235 e601          	ld	a,(1,x)
1412  0237 aa04          	or	a,#4
1413  0239 e701          	ld	(1,x),a
1415  023b 2008          	jra	L506
1416  023d               L306:
1417                     ; 478     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1419  023d 1e01          	ldw	x,(OFST+1,sp)
1420  023f e601          	ld	a,(1,x)
1421  0241 a4fb          	and	a,#251
1422  0243 e701          	ld	(1,x),a
1423  0245               L506:
1424                     ; 480 }
1427  0245 85            	popw	x
1428  0246 81            	ret
1484                     ; 488 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1484                     ; 489 {
1485                     	switch	.text
1486  0247               _I2C_OwnAddress2Config:
1488  0247 89            	pushw	x
1489  0248 88            	push	a
1490       00000001      OFST:	set	1
1493                     ; 490   uint8_t tmpreg = 0;
1495  0249 0f01          	clr	(OFST+0,sp)
1496                     ; 493   tmpreg = I2Cx->OAR2;
1498  024b e605          	ld	a,(5,x)
1499  024d 6b01          	ld	(OFST+0,sp),a
1500                     ; 496   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1502  024f 7b01          	ld	a,(OFST+0,sp)
1503  0251 a401          	and	a,#1
1504  0253 6b01          	ld	(OFST+0,sp),a
1505                     ; 499   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1507  0255 7b06          	ld	a,(OFST+5,sp)
1508  0257 a4fe          	and	a,#254
1509  0259 1a01          	or	a,(OFST+0,sp)
1510  025b 6b01          	ld	(OFST+0,sp),a
1511                     ; 502   I2Cx->OAR2 = tmpreg;
1513  025d 7b01          	ld	a,(OFST+0,sp)
1514  025f 1e02          	ldw	x,(OFST+1,sp)
1515  0261 e705          	ld	(5,x),a
1516                     ; 503 }
1519  0263 5b03          	addw	sp,#3
1520  0265 81            	ret
1567                     ; 512 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1567                     ; 513 {
1568                     	switch	.text
1569  0266               _I2C_DualAddressCmd:
1571  0266 89            	pushw	x
1572       00000000      OFST:	set	0
1575                     ; 515   assert_param(IS_FUNCTIONAL_STATE(NewState));
1577                     ; 517   if (NewState != DISABLE)
1579  0267 0d05          	tnz	(OFST+5,sp)
1580  0269 2708          	jreq	L366
1581                     ; 520     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1583  026b e605          	ld	a,(5,x)
1584  026d aa01          	or	a,#1
1585  026f e705          	ld	(5,x),a
1587  0271 2008          	jra	L566
1588  0273               L366:
1589                     ; 525     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1591  0273 1e01          	ldw	x,(OFST+1,sp)
1592  0275 e605          	ld	a,(5,x)
1593  0277 a4fe          	and	a,#254
1594  0279 e705          	ld	(5,x),a
1595  027b               L566:
1596                     ; 527 }
1599  027b 85            	popw	x
1600  027c 81            	ret
1670                     ; 539 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1670                     ; 540 {
1671                     	switch	.text
1672  027d               _I2C_AckPositionConfig:
1674  027d 89            	pushw	x
1675       00000000      OFST:	set	0
1678                     ; 542   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1680                     ; 545   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1682  027e e601          	ld	a,(1,x)
1683  0280 a4f7          	and	a,#247
1684  0282 e701          	ld	(1,x),a
1685                     ; 547   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1687  0284 e601          	ld	a,(1,x)
1688  0286 1a05          	or	a,(OFST+5,sp)
1689  0288 e701          	ld	(1,x),a
1690                     ; 548 }
1693  028a 85            	popw	x
1694  028b 81            	ret
1763                     ; 559 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1763                     ; 560 {
1764                     	switch	.text
1765  028c               _I2C_SMBusAlertConfig:
1767  028c 89            	pushw	x
1768       00000000      OFST:	set	0
1771                     ; 563   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1773                     ; 565   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1775  028d 0d05          	tnz	(OFST+5,sp)
1776  028f 2708          	jreq	L757
1777                     ; 568     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1779  0291 e601          	ld	a,(1,x)
1780  0293 aa20          	or	a,#32
1781  0295 e701          	ld	(1,x),a
1783  0297 2008          	jra	L167
1784  0299               L757:
1785                     ; 573     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1787  0299 1e01          	ldw	x,(OFST+1,sp)
1788  029b e601          	ld	a,(1,x)
1789  029d a4df          	and	a,#223
1790  029f e701          	ld	(1,x),a
1791  02a1               L167:
1792                     ; 575 }
1795  02a1 85            	popw	x
1796  02a2 81            	ret
1844                     ; 586 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1844                     ; 587 {
1845                     	switch	.text
1846  02a3               _I2C_FastModeDutyCycleConfig:
1848  02a3 89            	pushw	x
1849       00000000      OFST:	set	0
1852                     ; 590   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1854                     ; 592   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1856  02a4 7b05          	ld	a,(OFST+5,sp)
1857  02a6 a140          	cp	a,#64
1858  02a8 2608          	jrne	L7001
1859                     ; 595     I2Cx->CCRH |= I2C_CCRH_DUTY;
1861  02aa e60c          	ld	a,(12,x)
1862  02ac aa40          	or	a,#64
1863  02ae e70c          	ld	(12,x),a
1865  02b0 2008          	jra	L1101
1866  02b2               L7001:
1867                     ; 600     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1869  02b2 1e01          	ldw	x,(OFST+1,sp)
1870  02b4 e60c          	ld	a,(12,x)
1871  02b6 a4bf          	and	a,#191
1872  02b8 e70c          	ld	(12,x),a
1873  02ba               L1101:
1874                     ; 602 }
1877  02ba 85            	popw	x
1878  02bb 81            	ret
1957                     ; 615 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1957                     ; 616 {
1958                     	switch	.text
1959  02bc               _I2C_Send7bitAddress:
1961  02bc 89            	pushw	x
1962       00000000      OFST:	set	0
1965                     ; 618   assert_param(IS_I2C_ADDRESS(Address));
1967                     ; 619   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1969                     ; 622   if (I2C_Direction != I2C_Direction_Transmitter)
1971  02bd 0d06          	tnz	(OFST+6,sp)
1972  02bf 2708          	jreq	L3501
1973                     ; 625     Address |= OAR1_ADD0_Set;
1975  02c1 7b05          	ld	a,(OFST+5,sp)
1976  02c3 aa01          	or	a,#1
1977  02c5 6b05          	ld	(OFST+5,sp),a
1979  02c7 2006          	jra	L5501
1980  02c9               L3501:
1981                     ; 630     Address &= OAR1_ADD0_Reset;
1983  02c9 7b05          	ld	a,(OFST+5,sp)
1984  02cb a4fe          	and	a,#254
1985  02cd 6b05          	ld	(OFST+5,sp),a
1986  02cf               L5501:
1987                     ; 633   I2Cx->DR = Address;
1989  02cf 7b05          	ld	a,(OFST+5,sp)
1990  02d1 1e01          	ldw	x,(OFST+1,sp)
1991  02d3 e706          	ld	(6,x),a
1992                     ; 634 }
1995  02d5 85            	popw	x
1996  02d6 81            	ret
2042                     ; 658 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2042                     ; 659 {
2043                     	switch	.text
2044  02d7               _I2C_SendData:
2046  02d7 89            	pushw	x
2047       00000000      OFST:	set	0
2050                     ; 661   I2Cx->DR = Data;
2052  02d8 7b05          	ld	a,(OFST+5,sp)
2053  02da 1e01          	ldw	x,(OFST+1,sp)
2054  02dc e706          	ld	(6,x),a
2055                     ; 662 }
2058  02de 85            	popw	x
2059  02df 81            	ret
2096                     ; 670 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2096                     ; 671 {
2097                     	switch	.text
2098  02e0               _I2C_ReceiveData:
2102                     ; 673   return ((uint8_t)I2Cx->DR);
2104  02e0 e606          	ld	a,(6,x)
2107  02e2 81            	ret
2154                     ; 699 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2154                     ; 700 {
2155                     	switch	.text
2156  02e3               _I2C_TransmitPEC:
2158  02e3 89            	pushw	x
2159       00000000      OFST:	set	0
2162                     ; 702   assert_param(IS_FUNCTIONAL_STATE(NewState));
2164                     ; 704   if (NewState != DISABLE)
2166  02e4 0d05          	tnz	(OFST+5,sp)
2167  02e6 2708          	jreq	L7411
2168                     ; 707     I2Cx->CR2 |= I2C_CR2_PEC;
2170  02e8 e601          	ld	a,(1,x)
2171  02ea aa10          	or	a,#16
2172  02ec e701          	ld	(1,x),a
2174  02ee 2008          	jra	L1511
2175  02f0               L7411:
2176                     ; 712     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2178  02f0 1e01          	ldw	x,(OFST+1,sp)
2179  02f2 e601          	ld	a,(1,x)
2180  02f4 a4ef          	and	a,#239
2181  02f6 e701          	ld	(1,x),a
2182  02f8               L1511:
2183                     ; 714 }
2186  02f8 85            	popw	x
2187  02f9 81            	ret
2234                     ; 723 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2234                     ; 724 {
2235                     	switch	.text
2236  02fa               _I2C_CalculatePEC:
2238  02fa 89            	pushw	x
2239       00000000      OFST:	set	0
2242                     ; 726   assert_param(IS_FUNCTIONAL_STATE(NewState));
2244                     ; 728   if (NewState != DISABLE)
2246  02fb 0d05          	tnz	(OFST+5,sp)
2247  02fd 2706          	jreq	L7711
2248                     ; 731     I2Cx->CR1 |= I2C_CR1_ENPEC;
2250  02ff f6            	ld	a,(x)
2251  0300 aa20          	or	a,#32
2252  0302 f7            	ld	(x),a
2254  0303 2006          	jra	L1021
2255  0305               L7711:
2256                     ; 736     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2258  0305 1e01          	ldw	x,(OFST+1,sp)
2259  0307 f6            	ld	a,(x)
2260  0308 a4df          	and	a,#223
2261  030a f7            	ld	(x),a
2262  030b               L1021:
2263                     ; 738 }
2266  030b 85            	popw	x
2267  030c 81            	ret
2337                     ; 749 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2337                     ; 750 {
2338                     	switch	.text
2339  030d               _I2C_PECPositionConfig:
2341  030d 89            	pushw	x
2342       00000000      OFST:	set	0
2345                     ; 752   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2347                     ; 755   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2349  030e e601          	ld	a,(1,x)
2350  0310 a4f7          	and	a,#247
2351  0312 e701          	ld	(1,x),a
2352                     ; 757   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2354  0314 e601          	ld	a,(1,x)
2355  0316 1a05          	or	a,(OFST+5,sp)
2356  0318 e701          	ld	(1,x),a
2357                     ; 758 }
2360  031a 85            	popw	x
2361  031b 81            	ret
2398                     ; 766 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2398                     ; 767 {
2399                     	switch	.text
2400  031c               _I2C_GetPEC:
2404                     ; 769   return (I2Cx->PECR);
2406  031c e60e          	ld	a,(14,x)
2409  031e 81            	ret
2456                     ; 797 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2456                     ; 798 {
2457                     	switch	.text
2458  031f               _I2C_DMACmd:
2460  031f 89            	pushw	x
2461       00000000      OFST:	set	0
2464                     ; 800   assert_param(IS_FUNCTIONAL_STATE(NewState));
2466                     ; 802   if (NewState != DISABLE)
2468  0320 0d05          	tnz	(OFST+5,sp)
2469  0322 2708          	jreq	L3031
2470                     ; 805     I2Cx->ITR |= I2C_ITR_DMAEN;
2472  0324 e60a          	ld	a,(10,x)
2473  0326 aa08          	or	a,#8
2474  0328 e70a          	ld	(10,x),a
2476  032a 2008          	jra	L5031
2477  032c               L3031:
2478                     ; 810     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2480  032c 1e01          	ldw	x,(OFST+1,sp)
2481  032e e60a          	ld	a,(10,x)
2482  0330 a4f7          	and	a,#247
2483  0332 e70a          	ld	(10,x),a
2484  0334               L5031:
2485                     ; 812 }
2488  0334 85            	popw	x
2489  0335 81            	ret
2537                     ; 821 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2537                     ; 822 {
2538                     	switch	.text
2539  0336               _I2C_DMALastTransferCmd:
2541  0336 89            	pushw	x
2542       00000000      OFST:	set	0
2545                     ; 824   assert_param(IS_FUNCTIONAL_STATE(NewState));
2547                     ; 826   if (NewState != DISABLE)
2549  0337 0d05          	tnz	(OFST+5,sp)
2550  0339 2708          	jreq	L3331
2551                     ; 829     I2Cx->ITR |= I2C_ITR_LAST;
2553  033b e60a          	ld	a,(10,x)
2554  033d aa10          	or	a,#16
2555  033f e70a          	ld	(10,x),a
2557  0341 2008          	jra	L5331
2558  0343               L3331:
2559                     ; 834     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2561  0343 1e01          	ldw	x,(OFST+1,sp)
2562  0345 e60a          	ld	a,(10,x)
2563  0347 a4ef          	and	a,#239
2564  0349 e70a          	ld	(10,x),a
2565  034b               L5331:
2566                     ; 836 }
2569  034b 85            	popw	x
2570  034c 81            	ret
2759                     ; 948 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2759                     ; 949 {
2760                     	switch	.text
2761  034d               _I2C_ITConfig:
2763  034d 89            	pushw	x
2764       00000000      OFST:	set	0
2767                     ; 951   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2769                     ; 952   assert_param(IS_FUNCTIONAL_STATE(NewState));
2771                     ; 954   if (NewState != DISABLE)
2773  034e 0d07          	tnz	(OFST+7,sp)
2774  0350 2708          	jreq	L7341
2775                     ; 957     I2Cx->ITR |= (uint8_t)I2C_IT;
2777  0352 e60a          	ld	a,(10,x)
2778  0354 1a06          	or	a,(OFST+6,sp)
2779  0356 e70a          	ld	(10,x),a
2781  0358 2009          	jra	L1441
2782  035a               L7341:
2783                     ; 962     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2785  035a 1e01          	ldw	x,(OFST+1,sp)
2786  035c 7b06          	ld	a,(OFST+6,sp)
2787  035e 43            	cpl	a
2788  035f e40a          	and	a,(10,x)
2789  0361 e70a          	ld	(10,x),a
2790  0363               L1441:
2791                     ; 964 }
2794  0363 85            	popw	x
2795  0364 81            	ret
2956                     ; 988 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2956                     ; 989 {
2957                     	switch	.text
2958  0365               _I2C_ReadRegister:
2960  0365 89            	pushw	x
2961  0366 5204          	subw	sp,#4
2962       00000004      OFST:	set	4
2965                     ; 990   __IO uint16_t tmp = 0;
2967  0368 5f            	clrw	x
2968  0369 1f03          	ldw	(OFST-1,sp),x
2969                     ; 992   assert_param(IS_I2C_REGISTER(I2C_Register));
2971                     ; 994   tmp = (uint16_t) I2Cx;
2973  036b 1e05          	ldw	x,(OFST+1,sp)
2974  036d 1f03          	ldw	(OFST-1,sp),x
2975                     ; 995   tmp += I2C_Register;
2977  036f 7b09          	ld	a,(OFST+5,sp)
2978  0371 5f            	clrw	x
2979  0372 97            	ld	xl,a
2980  0373 1f01          	ldw	(OFST-3,sp),x
2981  0375 1e03          	ldw	x,(OFST-1,sp)
2982  0377 72fb01        	addw	x,(OFST-3,sp)
2983  037a 1f03          	ldw	(OFST-1,sp),x
2984                     ; 998   return (*(__IO uint8_t *) tmp);
2986  037c 1e03          	ldw	x,(OFST-1,sp)
2987  037e f6            	ld	a,(x)
2990  037f 5b06          	addw	sp,#6
2991  0381 81            	ret
3245                     ; 1038 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3245                     ; 1039 {
3246                     	switch	.text
3247  0382               _I2C_CheckEvent:
3249  0382 89            	pushw	x
3250  0383 5206          	subw	sp,#6
3251       00000006      OFST:	set	6
3254                     ; 1040   __IO uint16_t lastevent = 0x00;
3256  0385 5f            	clrw	x
3257  0386 1f04          	ldw	(OFST-2,sp),x
3258                     ; 1041   uint8_t flag1 = 0x00 ;
3260  0388 7b03          	ld	a,(OFST-3,sp)
3261  038a 97            	ld	xl,a
3262                     ; 1042   uint8_t flag2 = 0x00;
3264  038b 7b06          	ld	a,(OFST+0,sp)
3265  038d 97            	ld	xl,a
3266                     ; 1043   ErrorStatus status = ERROR;
3268  038e 7b06          	ld	a,(OFST+0,sp)
3269  0390 97            	ld	xl,a
3270                     ; 1046   assert_param(IS_I2C_EVENT(I2C_Event));
3272                     ; 1048   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3274  0391 1e0b          	ldw	x,(OFST+5,sp)
3275  0393 a30004        	cpw	x,#4
3276  0396 260c          	jrne	L5561
3277                     ; 1050     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3279  0398 1e07          	ldw	x,(OFST+1,sp)
3280  039a e608          	ld	a,(8,x)
3281  039c a404          	and	a,#4
3282  039e 5f            	clrw	x
3283  039f 97            	ld	xl,a
3284  03a0 1f04          	ldw	(OFST-2,sp),x
3286  03a2 2021          	jra	L7561
3287  03a4               L5561:
3288                     ; 1054     flag1 = I2Cx->SR1;
3290  03a4 1e07          	ldw	x,(OFST+1,sp)
3291  03a6 e607          	ld	a,(7,x)
3292  03a8 6b03          	ld	(OFST-3,sp),a
3293                     ; 1055     flag2 = I2Cx->SR3;
3295  03aa 1e07          	ldw	x,(OFST+1,sp)
3296  03ac e609          	ld	a,(9,x)
3297  03ae 6b06          	ld	(OFST+0,sp),a
3298                     ; 1056     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3300  03b0 7b03          	ld	a,(OFST-3,sp)
3301  03b2 5f            	clrw	x
3302  03b3 97            	ld	xl,a
3303  03b4 1f01          	ldw	(OFST-5,sp),x
3304  03b6 7b06          	ld	a,(OFST+0,sp)
3305  03b8 5f            	clrw	x
3306  03b9 97            	ld	xl,a
3307  03ba 4f            	clr	a
3308  03bb 02            	rlwa	x,a
3309  03bc 01            	rrwa	x,a
3310  03bd 1a02          	or	a,(OFST-4,sp)
3311  03bf 01            	rrwa	x,a
3312  03c0 1a01          	or	a,(OFST-5,sp)
3313  03c2 01            	rrwa	x,a
3314  03c3 1f04          	ldw	(OFST-2,sp),x
3315  03c5               L7561:
3316                     ; 1059   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3318  03c5 1e04          	ldw	x,(OFST-2,sp)
3319  03c7 01            	rrwa	x,a
3320  03c8 140c          	and	a,(OFST+6,sp)
3321  03ca 01            	rrwa	x,a
3322  03cb 140b          	and	a,(OFST+5,sp)
3323  03cd 01            	rrwa	x,a
3324  03ce 130b          	cpw	x,(OFST+5,sp)
3325  03d0 2606          	jrne	L1661
3326                     ; 1062     status = SUCCESS;
3328  03d2 a601          	ld	a,#1
3329  03d4 6b06          	ld	(OFST+0,sp),a
3331  03d6 2002          	jra	L3661
3332  03d8               L1661:
3333                     ; 1067     status = ERROR;
3335  03d8 0f06          	clr	(OFST+0,sp)
3336  03da               L3661:
3337                     ; 1071   return status;
3339  03da 7b06          	ld	a,(OFST+0,sp)
3342  03dc 5b08          	addw	sp,#8
3343  03de 81            	ret
3408                     ; 1089 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3408                     ; 1090 {
3409                     	switch	.text
3410  03df               _I2C_GetLastEvent:
3412  03df 89            	pushw	x
3413  03e0 5206          	subw	sp,#6
3414       00000006      OFST:	set	6
3417                     ; 1091   __IO uint16_t lastevent = 0;
3419  03e2 5f            	clrw	x
3420  03e3 1f05          	ldw	(OFST-1,sp),x
3421                     ; 1092   uint16_t flag1 = 0;
3423  03e5 1e01          	ldw	x,(OFST-5,sp)
3424                     ; 1093   uint16_t flag2 = 0;
3426  03e7 1e03          	ldw	x,(OFST-3,sp)
3427                     ; 1095   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3429  03e9 1e07          	ldw	x,(OFST+1,sp)
3430  03eb e608          	ld	a,(8,x)
3431  03ed a504          	bcp	a,#4
3432  03ef 2707          	jreq	L1271
3433                     ; 1097     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3435  03f1 ae0004        	ldw	x,#4
3436  03f4 1f05          	ldw	(OFST-1,sp),x
3438  03f6 201d          	jra	L3271
3439  03f8               L1271:
3440                     ; 1102     flag1 = I2Cx->SR1;
3442  03f8 1e07          	ldw	x,(OFST+1,sp)
3443  03fa e607          	ld	a,(7,x)
3444  03fc 5f            	clrw	x
3445  03fd 97            	ld	xl,a
3446  03fe 1f01          	ldw	(OFST-5,sp),x
3447                     ; 1103     flag2 = I2Cx->SR3;
3449  0400 1e07          	ldw	x,(OFST+1,sp)
3450  0402 e609          	ld	a,(9,x)
3451  0404 5f            	clrw	x
3452  0405 97            	ld	xl,a
3453  0406 1f03          	ldw	(OFST-3,sp),x
3454                     ; 1106     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3456  0408 1e03          	ldw	x,(OFST-3,sp)
3457  040a 4f            	clr	a
3458  040b 02            	rlwa	x,a
3459  040c 01            	rrwa	x,a
3460  040d 1a02          	or	a,(OFST-4,sp)
3461  040f 01            	rrwa	x,a
3462  0410 1a01          	or	a,(OFST-5,sp)
3463  0412 01            	rrwa	x,a
3464  0413 1f05          	ldw	(OFST-1,sp),x
3465  0415               L3271:
3466                     ; 1109   return (I2C_Event_TypeDef)lastevent;
3468  0415 1e05          	ldw	x,(OFST-1,sp)
3471  0417 5b08          	addw	sp,#8
3472  0419 81            	ret
3729                     ; 1146 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3729                     ; 1147 {
3730                     	switch	.text
3731  041a               _I2C_GetFlagStatus:
3733  041a 89            	pushw	x
3734  041b 89            	pushw	x
3735       00000002      OFST:	set	2
3738                     ; 1148   uint8_t tempreg = 0;
3740  041c 0f02          	clr	(OFST+0,sp)
3741                     ; 1149   uint8_t regindex = 0;
3743  041e 7b01          	ld	a,(OFST-1,sp)
3744  0420 97            	ld	xl,a
3745                     ; 1150   FlagStatus bitstatus = RESET;
3747  0421 7b02          	ld	a,(OFST+0,sp)
3748  0423 97            	ld	xl,a
3749                     ; 1153   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3751                     ; 1156   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3753  0424 7b07          	ld	a,(OFST+5,sp)
3754  0426 6b01          	ld	(OFST-1,sp),a
3755                     ; 1158   switch (regindex)
3757  0428 7b01          	ld	a,(OFST-1,sp)
3759                     ; 1175     default:
3759                     ; 1176       break;
3760  042a 4a            	dec	a
3761  042b 2708          	jreq	L5271
3762  042d 4a            	dec	a
3763  042e 270d          	jreq	L7271
3764  0430 4a            	dec	a
3765  0431 2712          	jreq	L1371
3766  0433 2016          	jra	L7602
3767  0435               L5271:
3768                     ; 1161     case 0x01:
3768                     ; 1162       tempreg = (uint8_t)I2Cx->SR1;
3770  0435 1e03          	ldw	x,(OFST+1,sp)
3771  0437 e607          	ld	a,(7,x)
3772  0439 6b02          	ld	(OFST+0,sp),a
3773                     ; 1163       break;
3775  043b 200e          	jra	L7602
3776  043d               L7271:
3777                     ; 1166     case 0x02:
3777                     ; 1167       tempreg = (uint8_t)I2Cx->SR2;
3779  043d 1e03          	ldw	x,(OFST+1,sp)
3780  043f e608          	ld	a,(8,x)
3781  0441 6b02          	ld	(OFST+0,sp),a
3782                     ; 1168       break;
3784  0443 2006          	jra	L7602
3785  0445               L1371:
3786                     ; 1171     case 0x03:
3786                     ; 1172       tempreg = (uint8_t)I2Cx->SR3;
3788  0445 1e03          	ldw	x,(OFST+1,sp)
3789  0447 e609          	ld	a,(9,x)
3790  0449 6b02          	ld	(OFST+0,sp),a
3791                     ; 1173       break;
3793  044b               L3371:
3794                     ; 1175     default:
3794                     ; 1176       break;
3796  044b               L7602:
3797                     ; 1180   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3799  044b 7b08          	ld	a,(OFST+6,sp)
3800  044d 1502          	bcp	a,(OFST+0,sp)
3801  044f 2706          	jreq	L1702
3802                     ; 1183     bitstatus = SET;
3804  0451 a601          	ld	a,#1
3805  0453 6b02          	ld	(OFST+0,sp),a
3807  0455 2002          	jra	L3702
3808  0457               L1702:
3809                     ; 1188     bitstatus = RESET;
3811  0457 0f02          	clr	(OFST+0,sp)
3812  0459               L3702:
3813                     ; 1191   return bitstatus;
3815  0459 7b02          	ld	a,(OFST+0,sp)
3818  045b 5b04          	addw	sp,#4
3819  045d 81            	ret
3875                     ; 1223 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3875                     ; 1224 {
3876                     	switch	.text
3877  045e               _I2C_ClearFlag:
3879  045e 89            	pushw	x
3880  045f 89            	pushw	x
3881       00000002      OFST:	set	2
3884                     ; 1225   uint16_t flagpos = 0;
3886  0460 5f            	clrw	x
3887  0461 1f01          	ldw	(OFST-1,sp),x
3888                     ; 1227   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3890                     ; 1230   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3892  0463 7b07          	ld	a,(OFST+5,sp)
3893  0465 97            	ld	xl,a
3894  0466 7b08          	ld	a,(OFST+6,sp)
3895  0468 a4ff          	and	a,#255
3896  046a 5f            	clrw	x
3897  046b 02            	rlwa	x,a
3898  046c 1f01          	ldw	(OFST-1,sp),x
3899  046e 01            	rrwa	x,a
3900                     ; 1232   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3902  046f 7b02          	ld	a,(OFST+0,sp)
3903  0471 43            	cpl	a
3904  0472 1e03          	ldw	x,(OFST+1,sp)
3905  0474 e708          	ld	(8,x),a
3906                     ; 1233 }
3909  0476 5b04          	addw	sp,#4
3910  0478 81            	ret
3986                     ; 1258 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3986                     ; 1259 {
3987                     	switch	.text
3988  0479               _I2C_GetITStatus:
3990  0479 89            	pushw	x
3991  047a 5204          	subw	sp,#4
3992       00000004      OFST:	set	4
3995                     ; 1260   ITStatus bitstatus = RESET;
3997  047c 7b04          	ld	a,(OFST+0,sp)
3998  047e 97            	ld	xl,a
3999                     ; 1261   __IO uint8_t enablestatus = 0;
4001  047f 0f03          	clr	(OFST-1,sp)
4002                     ; 1262   uint16_t tempregister = 0;
4004  0481 1e01          	ldw	x,(OFST-3,sp)
4005                     ; 1265   assert_param(IS_I2C_GET_IT(I2C_IT));
4007                     ; 1267   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
4009  0483 7b09          	ld	a,(OFST+5,sp)
4010  0485 97            	ld	xl,a
4011  0486 7b0a          	ld	a,(OFST+6,sp)
4012  0488 9f            	ld	a,xl
4013  0489 a407          	and	a,#7
4014  048b 97            	ld	xl,a
4015  048c 4f            	clr	a
4016  048d 02            	rlwa	x,a
4017  048e 4f            	clr	a
4018  048f 01            	rrwa	x,a
4019  0490 9f            	ld	a,xl
4020  0491 5f            	clrw	x
4021  0492 97            	ld	xl,a
4022  0493 1f01          	ldw	(OFST-3,sp),x
4023                     ; 1270   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
4025  0495 1e05          	ldw	x,(OFST+1,sp)
4026  0497 e60a          	ld	a,(10,x)
4027  0499 1402          	and	a,(OFST-2,sp)
4028  049b 6b03          	ld	(OFST-1,sp),a
4029                     ; 1272   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
4031  049d 7b09          	ld	a,(OFST+5,sp)
4032  049f 97            	ld	xl,a
4033  04a0 7b0a          	ld	a,(OFST+6,sp)
4034  04a2 9f            	ld	a,xl
4035  04a3 a430          	and	a,#48
4036  04a5 97            	ld	xl,a
4037  04a6 4f            	clr	a
4038  04a7 02            	rlwa	x,a
4039  04a8 a30100        	cpw	x,#256
4040  04ab 2616          	jrne	L5612
4041                     ; 1275     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4043  04ad 1e05          	ldw	x,(OFST+1,sp)
4044  04af e607          	ld	a,(7,x)
4045  04b1 150a          	bcp	a,(OFST+6,sp)
4046  04b3 270a          	jreq	L7612
4048  04b5 0d03          	tnz	(OFST-1,sp)
4049  04b7 2706          	jreq	L7612
4050                     ; 1278       bitstatus = SET;
4052  04b9 a601          	ld	a,#1
4053  04bb 6b04          	ld	(OFST+0,sp),a
4055  04bd 2018          	jra	L3712
4056  04bf               L7612:
4057                     ; 1283       bitstatus = RESET;
4059  04bf 0f04          	clr	(OFST+0,sp)
4060  04c1 2014          	jra	L3712
4061  04c3               L5612:
4062                     ; 1289     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4064  04c3 1e05          	ldw	x,(OFST+1,sp)
4065  04c5 e608          	ld	a,(8,x)
4066  04c7 150a          	bcp	a,(OFST+6,sp)
4067  04c9 270a          	jreq	L5712
4069  04cb 0d03          	tnz	(OFST-1,sp)
4070  04cd 2706          	jreq	L5712
4071                     ; 1292       bitstatus = SET;
4073  04cf a601          	ld	a,#1
4074  04d1 6b04          	ld	(OFST+0,sp),a
4076  04d3 2002          	jra	L3712
4077  04d5               L5712:
4078                     ; 1297       bitstatus = RESET;
4080  04d5 0f04          	clr	(OFST+0,sp)
4081  04d7               L3712:
4082                     ; 1301   return  bitstatus;
4084  04d7 7b04          	ld	a,(OFST+0,sp)
4087  04d9 5b06          	addw	sp,#6
4088  04db 81            	ret
4145                     ; 1334 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4145                     ; 1335 {
4146                     	switch	.text
4147  04dc               _I2C_ClearITPendingBit:
4149  04dc 89            	pushw	x
4150  04dd 89            	pushw	x
4151       00000002      OFST:	set	2
4154                     ; 1336   uint16_t flagpos = 0;
4156  04de 5f            	clrw	x
4157  04df 1f01          	ldw	(OFST-1,sp),x
4158                     ; 1339   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4160                     ; 1342   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4162  04e1 7b07          	ld	a,(OFST+5,sp)
4163  04e3 97            	ld	xl,a
4164  04e4 7b08          	ld	a,(OFST+6,sp)
4165  04e6 a4ff          	and	a,#255
4166  04e8 5f            	clrw	x
4167  04e9 02            	rlwa	x,a
4168  04ea 1f01          	ldw	(OFST-1,sp),x
4169  04ec 01            	rrwa	x,a
4170                     ; 1345   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4172  04ed 7b02          	ld	a,(OFST+0,sp)
4173  04ef 43            	cpl	a
4174  04f0 1e03          	ldw	x,(OFST+1,sp)
4175  04f2 e708          	ld	(8,x),a
4176                     ; 1346 }
4179  04f4 5b04          	addw	sp,#4
4180  04f6 81            	ret
4193                     	xdef	_I2C_ClearITPendingBit
4194                     	xdef	_I2C_GetITStatus
4195                     	xdef	_I2C_ClearFlag
4196                     	xdef	_I2C_GetFlagStatus
4197                     	xdef	_I2C_GetLastEvent
4198                     	xdef	_I2C_CheckEvent
4199                     	xdef	_I2C_ReadRegister
4200                     	xdef	_I2C_ITConfig
4201                     	xdef	_I2C_DMALastTransferCmd
4202                     	xdef	_I2C_DMACmd
4203                     	xdef	_I2C_CalculatePEC
4204                     	xdef	_I2C_TransmitPEC
4205                     	xdef	_I2C_GetPEC
4206                     	xdef	_I2C_PECPositionConfig
4207                     	xdef	_I2C_ReceiveData
4208                     	xdef	_I2C_SendData
4209                     	xdef	_I2C_Send7bitAddress
4210                     	xdef	_I2C_SMBusAlertConfig
4211                     	xdef	_I2C_FastModeDutyCycleConfig
4212                     	xdef	_I2C_AckPositionConfig
4213                     	xdef	_I2C_DualAddressCmd
4214                     	xdef	_I2C_OwnAddress2Config
4215                     	xdef	_I2C_AcknowledgeConfig
4216                     	xdef	_I2C_GenerateSTOP
4217                     	xdef	_I2C_GenerateSTART
4218                     	xdef	_I2C_ARPCmd
4219                     	xdef	_I2C_StretchClockCmd
4220                     	xdef	_I2C_SoftwareResetCmd
4221                     	xdef	_I2C_GeneralCallCmd
4222                     	xdef	_I2C_Cmd
4223                     	xdef	_I2C_Init
4224                     	xdef	_I2C_DeInit
4225                     	xref	_CLK_GetClockFreq
4226                     	xref.b	c_lreg
4245                     	xref	c_uitolx
4246                     	xref	c_sdivx
4247                     	xref	c_lzmp
4248                     	xref	c_rtol
4249                     	xref	c_smul
4250                     	xref	c_lmul
4251                     	xref	c_lcmp
4252                     	xref	c_ludv
4253                     	xref	c_ltor
4254                     	end
