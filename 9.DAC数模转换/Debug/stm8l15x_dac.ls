   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 136 void DAC_DeInit(void)
  32                     ; 137 {
  34                     	switch	.text
  35  0000               _DAC_DeInit:
  39                     ; 139   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  41  0000 725f5380      	clr	21376
  42                     ; 140   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  44  0004 725f5381      	clr	21377
  45                     ; 143   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  47  0008 725f5382      	clr	21378
  48                     ; 144   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  50  000c 725f5383      	clr	21379
  51                     ; 147   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  53  0010 725f5384      	clr	21380
  54                     ; 150   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  56  0014 35ff5385      	mov	21381,#255
  57                     ; 153   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  59  0018 725f5388      	clr	21384
  60                     ; 154   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  62  001c 725f5389      	clr	21385
  63                     ; 155   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  65  0020 725f538c      	clr	21388
  66                     ; 156   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  68  0024 725f538d      	clr	21389
  69                     ; 157   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  71  0028 725f5390      	clr	21392
  72                     ; 160   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  74  002c 725f5394      	clr	21396
  75                     ; 161   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  77  0030 725f5395      	clr	21397
  78                     ; 162   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  80  0034 725f5398      	clr	21400
  81                     ; 163   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  83  0038 725f5399      	clr	21401
  84                     ; 164   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  86  003c 725f539c      	clr	21404
  87                     ; 167   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
  89  0040 725f53a0      	clr	21408
  90                     ; 168   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
  92  0044 725f53a1      	clr	21409
  93                     ; 169   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
  95  0048 725f53a2      	clr	21410
  96                     ; 170   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
  98  004c 725f53a3      	clr	21411
  99                     ; 173   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 101  0050 725f53a4      	clr	21412
 102                     ; 174   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 104  0054 725f53a5      	clr	21413
 105                     ; 175   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 107  0058 725f53a6      	clr	21414
 108                     ; 176   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 110  005c 725f53a7      	clr	21415
 111                     ; 179   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 113  0060 725f53a8      	clr	21416
 114                     ; 180   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 116  0064 725f53a9      	clr	21417
 117                     ; 181 }
 120  0068 81            	ret
 279                     ; 202 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 279                     ; 203               DAC_Trigger_TypeDef DAC_Trigger,
 279                     ; 204               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 279                     ; 205 {
 280                     	switch	.text
 281  0069               _DAC_Init:
 283  0069 89            	pushw	x
 284  006a 5203          	subw	sp,#3
 285       00000003      OFST:	set	3
 288                     ; 206   uint8_t tmpreg = 0;
 290  006c 7b03          	ld	a,(OFST+0,sp)
 291  006e 97            	ld	xl,a
 292                     ; 207   uint16_t tmpreg2 = 0;
 294  006f 1e01          	ldw	x,(OFST-2,sp)
 295                     ; 210   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 297                     ; 211   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 299                     ; 212   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 301                     ; 215   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 303  0071 7b04          	ld	a,(OFST+1,sp)
 304  0073 48            	sll	a
 305  0074 5f            	clrw	x
 306  0075 97            	ld	xl,a
 307  0076 1f01          	ldw	(OFST-2,sp),x
 308                     ; 216   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 310  0078 1e01          	ldw	x,(OFST-2,sp)
 311  007a d65380        	ld	a,(21376,x)
 312  007d 6b03          	ld	(OFST+0,sp),a
 313                     ; 219   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 315  007f 7b03          	ld	a,(OFST+0,sp)
 316  0081 a4c1          	and	a,#193
 317  0083 6b03          	ld	(OFST+0,sp),a
 318                     ; 222   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 320  0085 7b03          	ld	a,(OFST+0,sp)
 321  0087 1a08          	or	a,(OFST+5,sp)
 322  0089 6b03          	ld	(OFST+0,sp),a
 323                     ; 226   if (DAC_Trigger != DAC_Trigger_None)
 325  008b 7b05          	ld	a,(OFST+2,sp)
 326  008d a130          	cp	a,#48
 327  008f 2708          	jreq	L511
 328                     ; 229     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 330  0091 7b05          	ld	a,(OFST+2,sp)
 331  0093 aa04          	or	a,#4
 332  0095 1a03          	or	a,(OFST+0,sp)
 333  0097 6b03          	ld	(OFST+0,sp),a
 334  0099               L511:
 335                     ; 233   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 337  0099 7b03          	ld	a,(OFST+0,sp)
 338  009b 1e01          	ldw	x,(OFST-2,sp)
 339  009d d75380        	ld	(21376,x),a
 340                     ; 234 }
 343  00a0 5b05          	addw	sp,#5
 344  00a2 81            	ret
 418                     ; 248 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 418                     ; 249 {
 419                     	switch	.text
 420  00a3               _DAC_Cmd:
 422  00a3 89            	pushw	x
 423  00a4 89            	pushw	x
 424       00000002      OFST:	set	2
 427                     ; 250   uint16_t cr1addr = 0;
 429  00a5 5f            	clrw	x
 430  00a6 1f01          	ldw	(OFST-1,sp),x
 431                     ; 252   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 433                     ; 253   assert_param(IS_FUNCTIONAL_STATE(NewState));
 435                     ; 256   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 437  00a8 7b03          	ld	a,(OFST+1,sp)
 438  00aa 48            	sll	a
 439  00ab 5f            	clrw	x
 440  00ac 97            	ld	xl,a
 441  00ad 1c5380        	addw	x,#21376
 442  00b0 1f01          	ldw	(OFST-1,sp),x
 443                     ; 258   if (NewState != DISABLE)
 445  00b2 0d04          	tnz	(OFST+2,sp)
 446  00b4 2708          	jreq	L551
 447                     ; 261     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 449  00b6 1e01          	ldw	x,(OFST-1,sp)
 450  00b8 f6            	ld	a,(x)
 451  00b9 aa01          	or	a,#1
 452  00bb f7            	ld	(x),a
 454  00bc 2006          	jra	L751
 455  00be               L551:
 456                     ; 266     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 458  00be 1e01          	ldw	x,(OFST-1,sp)
 459  00c0 f6            	ld	a,(x)
 460  00c1 a4fe          	and	a,#254
 461  00c3 f7            	ld	(x),a
 462  00c4               L751:
 463                     ; 268 }
 466  00c4 5b04          	addw	sp,#4
 467  00c6 81            	ret
 513                     ; 280 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 513                     ; 281 {
 514                     	switch	.text
 515  00c7               _DAC_SoftwareTriggerCmd:
 517  00c7 89            	pushw	x
 518       00000000      OFST:	set	0
 521                     ; 283   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 523                     ; 284   assert_param(IS_FUNCTIONAL_STATE(NewState));
 525                     ; 286   if (NewState != DISABLE)
 527  00c8 9f            	ld	a,xl
 528  00c9 4d            	tnz	a
 529  00ca 2714          	jreq	L302
 530                     ; 289     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 532  00cc 9e            	ld	a,xh
 533  00cd 5f            	clrw	x
 534  00ce 97            	ld	xl,a
 535  00cf a601          	ld	a,#1
 536  00d1 5d            	tnzw	x
 537  00d2 2704          	jreq	L41
 538  00d4               L61:
 539  00d4 48            	sll	a
 540  00d5 5a            	decw	x
 541  00d6 26fc          	jrne	L61
 542  00d8               L41:
 543  00d8 ca5384        	or	a,21380
 544  00db c75384        	ld	21380,a
 546  00de 2014          	jra	L502
 547  00e0               L302:
 548                     ; 294     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 550  00e0 7b01          	ld	a,(OFST+1,sp)
 551  00e2 5f            	clrw	x
 552  00e3 97            	ld	xl,a
 553  00e4 a601          	ld	a,#1
 554  00e6 5d            	tnzw	x
 555  00e7 2704          	jreq	L02
 556  00e9               L22:
 557  00e9 48            	sll	a
 558  00ea 5a            	decw	x
 559  00eb 26fc          	jrne	L22
 560  00ed               L02:
 561  00ed 43            	cpl	a
 562  00ee c45384        	and	a,21380
 563  00f1 c75384        	ld	21380,a
 564  00f4               L502:
 565                     ; 296 }
 568  00f4 85            	popw	x
 569  00f5 81            	ret
 605                     ; 305 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 605                     ; 306 {
 606                     	switch	.text
 607  00f6               _DAC_DualSoftwareTriggerCmd:
 611                     ; 308   assert_param(IS_FUNCTIONAL_STATE(NewState));
 613                     ; 310   if (NewState != DISABLE)
 615  00f6 4d            	tnz	a
 616  00f7 270a          	jreq	L522
 617                     ; 313     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 619  00f9 c65384        	ld	a,21380
 620  00fc aa03          	or	a,#3
 621  00fe c75384        	ld	21380,a
 623  0101 2008          	jra	L722
 624  0103               L522:
 625                     ; 318     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 627  0103 c65384        	ld	a,21380
 628  0106 a4fc          	and	a,#252
 629  0108 c75384        	ld	21380,a
 630  010b               L722:
 631                     ; 320 }
 634  010b 81            	ret
 719                     ; 336 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 719                     ; 337                            DAC_Wave_TypeDef DAC_Wave,
 719                     ; 338                            FunctionalState NewState)
 719                     ; 339 {
 720                     	switch	.text
 721  010c               _DAC_WaveGenerationCmd:
 723  010c 89            	pushw	x
 724  010d 88            	push	a
 725       00000001      OFST:	set	1
 728                     ; 340   uint8_t tmpreg = 0;
 730  010e 0f01          	clr	(OFST+0,sp)
 731                     ; 343   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 733                     ; 344   assert_param(IS_DAC_WAVE(DAC_Wave));
 735                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 737                     ; 348   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 739  0110 9e            	ld	a,xh
 740  0111 48            	sll	a
 741  0112 5f            	clrw	x
 742  0113 97            	ld	xl,a
 743  0114 d65380        	ld	a,(21376,x)
 744  0117 a43f          	and	a,#63
 745  0119 6b01          	ld	(OFST+0,sp),a
 746                     ; 350   if (NewState != DISABLE)
 748  011b 0d06          	tnz	(OFST+5,sp)
 749  011d 2706          	jreq	L372
 750                     ; 352     tmpreg |= (uint8_t)(DAC_Wave);
 752  011f 7b01          	ld	a,(OFST+0,sp)
 753  0121 1a03          	or	a,(OFST+2,sp)
 754  0123 6b01          	ld	(OFST+0,sp),a
 755  0125               L372:
 756                     ; 356   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 758  0125 7b02          	ld	a,(OFST+1,sp)
 759  0127 48            	sll	a
 760  0128 5f            	clrw	x
 761  0129 97            	ld	xl,a
 762  012a 7b01          	ld	a,(OFST+0,sp)
 763  012c d75380        	ld	(21376,x),a
 764                     ; 358 }
 767  012f 5b03          	addw	sp,#3
 768  0131 81            	ret
 934                     ; 382 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 934                     ; 383 {
 935                     	switch	.text
 936  0132               _DAC_SetNoiseWaveLFSR:
 938  0132 89            	pushw	x
 939  0133 5203          	subw	sp,#3
 940       00000003      OFST:	set	3
 943                     ; 384   uint8_t tmpreg = 0;
 945  0135 7b01          	ld	a,(OFST-2,sp)
 946  0137 97            	ld	xl,a
 947                     ; 385   uint16_t cr2addr = 0;
 949  0138 1e02          	ldw	x,(OFST-1,sp)
 950                     ; 388   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 952                     ; 389   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 954                     ; 392   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 956  013a 7b04          	ld	a,(OFST+1,sp)
 957  013c 48            	sll	a
 958  013d 5f            	clrw	x
 959  013e 97            	ld	xl,a
 960  013f 1c5381        	addw	x,#21377
 961  0142 1f02          	ldw	(OFST-1,sp),x
 962                     ; 393   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 964  0144 1e02          	ldw	x,(OFST-1,sp)
 965  0146 f6            	ld	a,(x)
 966  0147 a4f0          	and	a,#240
 967  0149 6b01          	ld	(OFST-2,sp),a
 968                     ; 396   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 970  014b 7b01          	ld	a,(OFST-2,sp)
 971  014d 1a05          	or	a,(OFST+2,sp)
 972  014f 1e02          	ldw	x,(OFST-1,sp)
 973  0151 f7            	ld	(x),a
 974                     ; 397 }
 977  0152 5b05          	addw	sp,#5
 978  0154 81            	ret
1145                     ; 421 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1145                     ; 422 {
1146                     	switch	.text
1147  0155               _DAC_SetTriangleWaveAmplitude:
1149  0155 89            	pushw	x
1150  0156 5203          	subw	sp,#3
1151       00000003      OFST:	set	3
1154                     ; 423   uint8_t tmpreg = 0;
1156  0158 7b01          	ld	a,(OFST-2,sp)
1157  015a 97            	ld	xl,a
1158                     ; 424   uint16_t cr2addr = 0;
1160  015b 1e02          	ldw	x,(OFST-1,sp)
1161                     ; 427   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1163                     ; 428   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1165                     ; 432   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1167  015d 7b04          	ld	a,(OFST+1,sp)
1168  015f 48            	sll	a
1169  0160 5f            	clrw	x
1170  0161 97            	ld	xl,a
1171  0162 1c5381        	addw	x,#21377
1172  0165 1f02          	ldw	(OFST-1,sp),x
1173                     ; 433   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1175  0167 1e02          	ldw	x,(OFST-1,sp)
1176  0169 f6            	ld	a,(x)
1177  016a a4f0          	and	a,#240
1178  016c 6b01          	ld	(OFST-2,sp),a
1179                     ; 436   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1181  016e 7b01          	ld	a,(OFST-2,sp)
1182  0170 1a05          	or	a,(OFST+2,sp)
1183  0172 1e02          	ldw	x,(OFST-1,sp)
1184  0174 f7            	ld	(x),a
1185                     ; 437 }
1188  0175 5b05          	addw	sp,#5
1189  0177 81            	ret
1261                     ; 449 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1261                     ; 450 {
1262                     	switch	.text
1263  0178               _DAC_SetChannel1Data:
1265  0178 88            	push	a
1266       00000000      OFST:	set	0
1269                     ; 452   assert_param(IS_DAC_ALIGN(DAC_Align));
1271                     ; 454   if (DAC_Align != DAC_Align_8b_R)
1273  0179 a108          	cp	a,#8
1274  017b 2712          	jreq	L505
1275                     ; 457     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1277  017d 5f            	clrw	x
1278  017e 97            	ld	xl,a
1279  017f 7b04          	ld	a,(OFST+4,sp)
1280  0181 d75388        	ld	(21384,x),a
1281                     ; 458     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1283  0184 7b01          	ld	a,(OFST+1,sp)
1284  0186 5f            	clrw	x
1285  0187 97            	ld	xl,a
1286  0188 7b05          	ld	a,(OFST+5,sp)
1287  018a d75389        	ld	(21385,x),a
1289  018d 2005          	jra	L705
1290  018f               L505:
1291                     ; 463     assert_param(IS_DAC_DATA_08R(DAC_Data));
1293                     ; 466     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1295  018f 7b05          	ld	a,(OFST+5,sp)
1296  0191 c75390        	ld	21392,a
1297  0194               L705:
1298                     ; 468 }
1301  0194 84            	pop	a
1302  0195 81            	ret
1347                     ; 480 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1347                     ; 481 {
1348                     	switch	.text
1349  0196               _DAC_SetChannel2Data:
1351  0196 88            	push	a
1352       00000000      OFST:	set	0
1355                     ; 483   assert_param(IS_DAC_ALIGN(DAC_Align));
1357                     ; 485   if (DAC_Align != DAC_Align_8b_R)
1359  0197 a108          	cp	a,#8
1360  0199 2712          	jreq	L335
1361                     ; 488     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1363  019b 5f            	clrw	x
1364  019c 97            	ld	xl,a
1365  019d 7b04          	ld	a,(OFST+4,sp)
1366  019f d75394        	ld	(21396,x),a
1367                     ; 489     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1369  01a2 7b01          	ld	a,(OFST+1,sp)
1370  01a4 5f            	clrw	x
1371  01a5 97            	ld	xl,a
1372  01a6 7b05          	ld	a,(OFST+5,sp)
1373  01a8 d75395        	ld	(21397,x),a
1375  01ab 2005          	jra	L535
1376  01ad               L335:
1377                     ; 494     assert_param(IS_DAC_DATA_08R(DAC_Data));
1379                     ; 497     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1381  01ad 7b05          	ld	a,(OFST+5,sp)
1382  01af c7539c        	ld	21404,a
1383  01b2               L535:
1384                     ; 499 }
1387  01b2 84            	pop	a
1388  01b3 81            	ret
1451                     ; 516 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1451                     ; 517 {
1452                     	switch	.text
1453  01b4               _DAC_SetDualChannelData:
1455  01b4 88            	push	a
1456  01b5 89            	pushw	x
1457       00000002      OFST:	set	2
1460                     ; 518   uint16_t dchxrdhrhaddr = 0;
1462  01b6 5f            	clrw	x
1463  01b7 1f01          	ldw	(OFST-1,sp),x
1464                     ; 521   assert_param(IS_DAC_ALIGN(DAC_Align));
1466                     ; 523   if (DAC_Align != DAC_Align_8b_R)
1468  01b9 a108          	cp	a,#8
1469  01bb 2727          	jreq	L175
1470                     ; 526     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1472  01bd a653          	ld	a,#83
1473  01bf 97            	ld	xl,a
1474  01c0 a6a0          	ld	a,#160
1475  01c2 1b03          	add	a,(OFST+1,sp)
1476  01c4 2401          	jrnc	L24
1477  01c6 5c            	incw	x
1478  01c7               L24:
1479  01c7 02            	rlwa	x,a
1480  01c8 1f01          	ldw	(OFST-1,sp),x
1481  01ca 01            	rrwa	x,a
1482                     ; 529     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1484  01cb 7b08          	ld	a,(OFST+6,sp)
1485  01cd 1e01          	ldw	x,(OFST-1,sp)
1486  01cf f7            	ld	(x),a
1487                     ; 530     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1489  01d0 7b09          	ld	a,(OFST+7,sp)
1490  01d2 1e01          	ldw	x,(OFST-1,sp)
1491  01d4 e701          	ld	(1,x),a
1492                     ; 531     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1494  01d6 7b06          	ld	a,(OFST+4,sp)
1495  01d8 1e01          	ldw	x,(OFST-1,sp)
1496  01da e702          	ld	(2,x),a
1497                     ; 532     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1499  01dc 7b07          	ld	a,(OFST+5,sp)
1500  01de 1e01          	ldw	x,(OFST-1,sp)
1501  01e0 e703          	ld	(3,x),a
1503  01e2 200a          	jra	L375
1504  01e4               L175:
1505                     ; 537     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1507                     ; 540     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1509  01e4 7b09          	ld	a,(OFST+7,sp)
1510  01e6 c753a8        	ld	21416,a
1511                     ; 541     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1513  01e9 7b07          	ld	a,(OFST+5,sp)
1514  01eb c753a9        	ld	21417,a
1515  01ee               L375:
1516                     ; 543 }
1519  01ee 5b03          	addw	sp,#3
1520  01f0 81            	ret
1574                     ; 553 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1574                     ; 554 {
1575                     	switch	.text
1576  01f1               _DAC_GetDataOutputValue:
1578  01f1 89            	pushw	x
1579       00000002      OFST:	set	2
1582                     ; 555   uint16_t outputdata = 0;
1584  01f2 1e01          	ldw	x,(OFST-1,sp)
1585                     ; 556   uint16_t tmp = 0;
1587  01f4 1e01          	ldw	x,(OFST-1,sp)
1588                     ; 559   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1590                     ; 561   if ( DAC_Channel ==  DAC_Channel_1)
1592  01f6 4d            	tnz	a
1593  01f7 2619          	jrne	L326
1594                     ; 564     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1596  01f9 c653ac        	ld	a,21420
1597  01fc 5f            	clrw	x
1598  01fd 97            	ld	xl,a
1599  01fe 4f            	clr	a
1600  01ff 02            	rlwa	x,a
1601  0200 1f01          	ldw	(OFST-1,sp),x
1602                     ; 565     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1604  0202 c653ad        	ld	a,21421
1605  0205 5f            	clrw	x
1606  0206 97            	ld	xl,a
1607  0207 01            	rrwa	x,a
1608  0208 1a02          	or	a,(OFST+0,sp)
1609  020a 01            	rrwa	x,a
1610  020b 1a01          	or	a,(OFST-1,sp)
1611  020d 01            	rrwa	x,a
1612  020e 1f01          	ldw	(OFST-1,sp),x
1614  0210 2017          	jra	L526
1615  0212               L326:
1616                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1618  0212 c653b0        	ld	a,21424
1619  0215 5f            	clrw	x
1620  0216 97            	ld	xl,a
1621  0217 4f            	clr	a
1622  0218 02            	rlwa	x,a
1623  0219 1f01          	ldw	(OFST-1,sp),x
1624                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1626  021b c653b1        	ld	a,21425
1627  021e 5f            	clrw	x
1628  021f 97            	ld	xl,a
1629  0220 01            	rrwa	x,a
1630  0221 1a02          	or	a,(OFST+0,sp)
1631  0223 01            	rrwa	x,a
1632  0224 1a01          	or	a,(OFST-1,sp)
1633  0226 01            	rrwa	x,a
1634  0227 1f01          	ldw	(OFST-1,sp),x
1635  0229               L526:
1636                     ; 575   return (uint16_t)outputdata;
1638  0229 1e01          	ldw	x,(OFST-1,sp)
1641  022b 5b02          	addw	sp,#2
1642  022d 81            	ret
1696                     ; 607 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1696                     ; 608 {
1697                     	switch	.text
1698  022e               _DAC_DMACmd:
1700  022e 89            	pushw	x
1701  022f 89            	pushw	x
1702       00000002      OFST:	set	2
1705                     ; 609   uint16_t cr2addr = 0;
1707  0230 5f            	clrw	x
1708  0231 1f01          	ldw	(OFST-1,sp),x
1709                     ; 612   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1711                     ; 613   assert_param(IS_FUNCTIONAL_STATE(NewState));
1713                     ; 616   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1715  0233 7b03          	ld	a,(OFST+1,sp)
1716  0235 48            	sll	a
1717  0236 5f            	clrw	x
1718  0237 97            	ld	xl,a
1719  0238 1c5381        	addw	x,#21377
1720  023b 1f01          	ldw	(OFST-1,sp),x
1721                     ; 618   if (NewState != DISABLE)
1723  023d 0d04          	tnz	(OFST+2,sp)
1724  023f 2708          	jreq	L556
1725                     ; 621     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1727  0241 1e01          	ldw	x,(OFST-1,sp)
1728  0243 f6            	ld	a,(x)
1729  0244 aa10          	or	a,#16
1730  0246 f7            	ld	(x),a
1732  0247 2006          	jra	L756
1733  0249               L556:
1734                     ; 626     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1736  0249 1e01          	ldw	x,(OFST-1,sp)
1737  024b f6            	ld	a,(x)
1738  024c a4ef          	and	a,#239
1739  024e f7            	ld	(x),a
1740  024f               L756:
1741                     ; 628 }
1744  024f 5b04          	addw	sp,#4
1745  0251 81            	ret
1822                     ; 661 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1822                     ; 662 {
1823                     	switch	.text
1824  0252               _DAC_ITConfig:
1826  0252 89            	pushw	x
1827  0253 89            	pushw	x
1828       00000002      OFST:	set	2
1831                     ; 663   uint16_t cr2addr = 0;
1833  0254 5f            	clrw	x
1834  0255 1f01          	ldw	(OFST-1,sp),x
1835                     ; 666   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1837                     ; 667   assert_param(IS_FUNCTIONAL_STATE(NewState));
1839                     ; 668   assert_param(IS_DAC_IT(DAC_IT));
1841                     ; 671   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1843  0257 7b03          	ld	a,(OFST+1,sp)
1844  0259 48            	sll	a
1845  025a 5f            	clrw	x
1846  025b 97            	ld	xl,a
1847  025c 1c5381        	addw	x,#21377
1848  025f 1f01          	ldw	(OFST-1,sp),x
1849                     ; 673   if (NewState != DISABLE)
1851  0261 0d07          	tnz	(OFST+5,sp)
1852  0263 2708          	jreq	L127
1853                     ; 676     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1855  0265 1e01          	ldw	x,(OFST-1,sp)
1856  0267 f6            	ld	a,(x)
1857  0268 1a04          	or	a,(OFST+2,sp)
1858  026a f7            	ld	(x),a
1860  026b 2007          	jra	L327
1861  026d               L127:
1862                     ; 681     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1864  026d 1e01          	ldw	x,(OFST-1,sp)
1865  026f 7b04          	ld	a,(OFST+2,sp)
1866  0271 43            	cpl	a
1867  0272 f4            	and	a,(x)
1868  0273 f7            	ld	(x),a
1869  0274               L327:
1870                     ; 683 }
1873  0274 5b04          	addw	sp,#4
1874  0276 81            	ret
1972                     ; 698 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1972                     ; 699 {
1973                     	switch	.text
1974  0277               _DAC_GetFlagStatus:
1976  0277 89            	pushw	x
1977  0278 88            	push	a
1978       00000001      OFST:	set	1
1981                     ; 700   FlagStatus flagstatus = RESET;
1983  0279 7b01          	ld	a,(OFST+0,sp)
1984  027b 97            	ld	xl,a
1985                     ; 701   uint8_t flag = 0;
1987  027c 7b01          	ld	a,(OFST+0,sp)
1988  027e 97            	ld	xl,a
1989                     ; 704   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1991                     ; 705   assert_param(IS_DAC_FLAG(DAC_FLAG));
1993                     ; 707   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1995  027f 7b02          	ld	a,(OFST+1,sp)
1996  0281 5f            	clrw	x
1997  0282 97            	ld	xl,a
1998  0283 7b03          	ld	a,(OFST+2,sp)
1999  0285 5d            	tnzw	x
2000  0286 2704          	jreq	L45
2001  0288               L65:
2002  0288 48            	sll	a
2003  0289 5a            	decw	x
2004  028a 26fc          	jrne	L65
2005  028c               L45:
2006  028c 6b01          	ld	(OFST+0,sp),a
2007                     ; 710   if ((DAC->SR & flag ) != (uint8_t)RESET)
2009  028e c65385        	ld	a,21381
2010  0291 1501          	bcp	a,(OFST+0,sp)
2011  0293 2706          	jreq	L577
2012                     ; 713     flagstatus = SET;
2014  0295 a601          	ld	a,#1
2015  0297 6b01          	ld	(OFST+0,sp),a
2017  0299 2002          	jra	L777
2018  029b               L577:
2019                     ; 718     flagstatus = RESET;
2021  029b 0f01          	clr	(OFST+0,sp)
2022  029d               L777:
2023                     ; 722   return  flagstatus;
2025  029d 7b01          	ld	a,(OFST+0,sp)
2028  029f 5b03          	addw	sp,#3
2029  02a1 81            	ret
2083                     ; 736 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2083                     ; 737 {
2084                     	switch	.text
2085  02a2               _DAC_ClearFlag:
2087  02a2 89            	pushw	x
2088  02a3 88            	push	a
2089       00000001      OFST:	set	1
2092                     ; 738   uint8_t flag = 0;
2094  02a4 0f01          	clr	(OFST+0,sp)
2095                     ; 741   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2097                     ; 742   assert_param(IS_DAC_FLAG(DAC_FLAG));
2099                     ; 745   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2101  02a6 9e            	ld	a,xh
2102  02a7 5f            	clrw	x
2103  02a8 97            	ld	xl,a
2104  02a9 7b03          	ld	a,(OFST+2,sp)
2105  02ab 5d            	tnzw	x
2106  02ac 2704          	jreq	L26
2107  02ae               L46:
2108  02ae 48            	sll	a
2109  02af 5a            	decw	x
2110  02b0 26fc          	jrne	L46
2111  02b2               L26:
2112  02b2 6b01          	ld	(OFST+0,sp),a
2113                     ; 748   DAC->SR = (uint8_t)(~flag);
2115  02b4 7b01          	ld	a,(OFST+0,sp)
2116  02b6 43            	cpl	a
2117  02b7 c75385        	ld	21381,a
2118                     ; 749 }
2121  02ba 5b03          	addw	sp,#3
2122  02bc 81            	ret
2205                     ; 764 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2205                     ; 765 {
2206                     	switch	.text
2207  02bd               _DAC_GetITStatus:
2209  02bd 89            	pushw	x
2210  02be 89            	pushw	x
2211       00000002      OFST:	set	2
2214                     ; 766   ITStatus itstatus = RESET;
2216  02bf 7b02          	ld	a,(OFST+0,sp)
2217  02c1 97            	ld	xl,a
2218                     ; 767   uint8_t enablestatus = 0;
2220  02c2 7b01          	ld	a,(OFST-1,sp)
2221  02c4 97            	ld	xl,a
2222                     ; 768   uint8_t flagstatus = 0;
2224  02c5 7b02          	ld	a,(OFST+0,sp)
2225  02c7 97            	ld	xl,a
2226                     ; 769   uint8_t tempreg = 0;
2228  02c8 7b02          	ld	a,(OFST+0,sp)
2229  02ca 97            	ld	xl,a
2230                     ; 772   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2232                     ; 773   assert_param(IS_DAC_IT(DAC_IT));
2234                     ; 776   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2236  02cb 7b03          	ld	a,(OFST+1,sp)
2237  02cd 48            	sll	a
2238  02ce 48            	sll	a
2239  02cf 5f            	clrw	x
2240  02d0 97            	ld	xl,a
2241  02d1 d65381        	ld	a,(21377,x)
2242  02d4 6b02          	ld	(OFST+0,sp),a
2243                     ; 777   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2245  02d6 7b03          	ld	a,(OFST+1,sp)
2246  02d8 5f            	clrw	x
2247  02d9 97            	ld	xl,a
2248  02da 7b04          	ld	a,(OFST+2,sp)
2249  02dc 5d            	tnzw	x
2250  02dd 2704          	jreq	L07
2251  02df               L27:
2252  02df 48            	sll	a
2253  02e0 5a            	decw	x
2254  02e1 26fc          	jrne	L27
2255  02e3               L07:
2256  02e3 1402          	and	a,(OFST+0,sp)
2257  02e5 6b01          	ld	(OFST-1,sp),a
2258                     ; 778   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2260  02e7 a605          	ld	a,#5
2261  02e9 1003          	sub	a,(OFST+1,sp)
2262  02eb 5f            	clrw	x
2263  02ec 97            	ld	xl,a
2264  02ed 7b04          	ld	a,(OFST+2,sp)
2265  02ef 5d            	tnzw	x
2266  02f0 2704          	jreq	L47
2267  02f2               L67:
2268  02f2 44            	srl	a
2269  02f3 5a            	decw	x
2270  02f4 26fc          	jrne	L67
2271  02f6               L47:
2272  02f6 c45385        	and	a,21381
2273  02f9 6b02          	ld	(OFST+0,sp),a
2274                     ; 781   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2276  02fb 0d02          	tnz	(OFST+0,sp)
2277  02fd 270a          	jreq	L1701
2279  02ff 0d01          	tnz	(OFST-1,sp)
2280  0301 2706          	jreq	L1701
2281                     ; 784     itstatus = SET;
2283  0303 a601          	ld	a,#1
2284  0305 6b02          	ld	(OFST+0,sp),a
2286  0307 2002          	jra	L3701
2287  0309               L1701:
2288                     ; 789     itstatus = RESET;
2290  0309 0f02          	clr	(OFST+0,sp)
2291  030b               L3701:
2292                     ; 793   return  itstatus;
2294  030b 7b02          	ld	a,(OFST+0,sp)
2297  030d 5b04          	addw	sp,#4
2298  030f 81            	ret
2344                     ; 807 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2344                     ; 808 {
2345                     	switch	.text
2346  0310               _DAC_ClearITPendingBit:
2348  0310 89            	pushw	x
2349       00000000      OFST:	set	0
2352                     ; 810   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2354                     ; 811   assert_param(IS_DAC_IT(DAC_IT));
2356                     ; 814   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2358  0311 9e            	ld	a,xh
2359  0312 a005          	sub	a,#5
2360  0314 40            	neg	a
2361  0315 5f            	clrw	x
2362  0316 97            	ld	xl,a
2363  0317 7b02          	ld	a,(OFST+2,sp)
2364  0319 5d            	tnzw	x
2365  031a 2704          	jreq	L201
2366  031c               L401:
2367  031c 44            	srl	a
2368  031d 5a            	decw	x
2369  031e 26fc          	jrne	L401
2370  0320               L201:
2371  0320 43            	cpl	a
2372  0321 c75385        	ld	21381,a
2373                     ; 815 }
2376  0324 85            	popw	x
2377  0325 81            	ret
2390                     	xdef	_DAC_ClearITPendingBit
2391                     	xdef	_DAC_GetITStatus
2392                     	xdef	_DAC_ClearFlag
2393                     	xdef	_DAC_GetFlagStatus
2394                     	xdef	_DAC_ITConfig
2395                     	xdef	_DAC_DMACmd
2396                     	xdef	_DAC_GetDataOutputValue
2397                     	xdef	_DAC_SetDualChannelData
2398                     	xdef	_DAC_SetChannel2Data
2399                     	xdef	_DAC_SetChannel1Data
2400                     	xdef	_DAC_SetTriangleWaveAmplitude
2401                     	xdef	_DAC_SetNoiseWaveLFSR
2402                     	xdef	_DAC_WaveGenerationCmd
2403                     	xdef	_DAC_DualSoftwareTriggerCmd
2404                     	xdef	_DAC_SoftwareTriggerCmd
2405                     	xdef	_DAC_Cmd
2406                     	xdef	_DAC_Init
2407                     	xdef	_DAC_DeInit
2426                     	end
