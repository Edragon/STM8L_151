   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 117 void EXTI_DeInit(void)
  32                     ; 118 {
  34                     	switch	.text
  35  0000               _EXTI_DeInit:
  39                     ; 119   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  41  0000 725f50a0      	clr	20640
  42                     ; 120   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  44  0004 725f50a1      	clr	20641
  45                     ; 121   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  47  0008 725f50a2      	clr	20642
  48                     ; 122   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  50  000c 725f50aa      	clr	20650
  51                     ; 123   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  53  0010 35ff50a3      	mov	20643,#255
  54                     ; 124   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  56  0014 35ff50a4      	mov	20644,#255
  57                     ; 125   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  59  0018 725f50a5      	clr	20645
  60                     ; 126   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  62  001c 725f50ab      	clr	20651
  63                     ; 127 }
  66  0020 81            	ret
 212                     ; 154 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 212                     ; 155 {
 213                     	switch	.text
 214  0021               _EXTI_SetPinSensitivity:
 216  0021 89            	pushw	x
 217       00000000      OFST:	set	0
 220                     ; 158   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 222                     ; 159   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 224                     ; 162   switch (EXTI_Pin)
 226  0022 9e            	ld	a,xh
 228                     ; 196     default:
 228                     ; 197       break;
 229  0023 4d            	tnz	a
 230  0024 272f          	jreq	L12
 231  0026 a002          	sub	a,#2
 232  0028 274a          	jreq	L32
 233  002a a002          	sub	a,#2
 234  002c 2765          	jreq	L52
 235  002e a002          	sub	a,#2
 236  0030 2603cc00b2    	jreq	L72
 237  0035 a00a          	sub	a,#10
 238  0037 2603          	jrne	L05
 239  0039 cc00cf        	jp	L13
 240  003c               L05:
 241  003c a002          	sub	a,#2
 242  003e 2603          	jrne	L25
 243  0040 cc00ee        	jp	L33
 244  0043               L25:
 245  0043 a002          	sub	a,#2
 246  0045 2603          	jrne	L45
 247  0047 cc010d        	jp	L53
 248  004a               L45:
 249  004a a002          	sub	a,#2
 250  004c 2603          	jrne	L65
 251  004e cc012c        	jp	L73
 252  0051               L65:
 253  0051 ac490149      	jpf	L721
 254  0055               L12:
 255                     ; 164     case EXTI_Pin_0:
 255                     ; 165       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 257  0055 c650a0        	ld	a,20640
 258  0058 a4fc          	and	a,#252
 259  005a c750a0        	ld	20640,a
 260                     ; 166       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 262  005d 7b01          	ld	a,(OFST+1,sp)
 263  005f 5f            	clrw	x
 264  0060 97            	ld	xl,a
 265  0061 7b02          	ld	a,(OFST+2,sp)
 266  0063 5d            	tnzw	x
 267  0064 2704          	jreq	L01
 268  0066               L21:
 269  0066 48            	sll	a
 270  0067 5a            	decw	x
 271  0068 26fc          	jrne	L21
 272  006a               L01:
 273  006a ca50a0        	or	a,20640
 274  006d c750a0        	ld	20640,a
 275                     ; 167       break;
 277  0070 ac490149      	jpf	L721
 278  0074               L32:
 279                     ; 168     case EXTI_Pin_1:
 279                     ; 169       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 281  0074 c650a0        	ld	a,20640
 282  0077 a4f3          	and	a,#243
 283  0079 c750a0        	ld	20640,a
 284                     ; 170       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 286  007c 7b01          	ld	a,(OFST+1,sp)
 287  007e 5f            	clrw	x
 288  007f 97            	ld	xl,a
 289  0080 7b02          	ld	a,(OFST+2,sp)
 290  0082 5d            	tnzw	x
 291  0083 2704          	jreq	L41
 292  0085               L61:
 293  0085 48            	sll	a
 294  0086 5a            	decw	x
 295  0087 26fc          	jrne	L61
 296  0089               L41:
 297  0089 ca50a0        	or	a,20640
 298  008c c750a0        	ld	20640,a
 299                     ; 171       break;
 301  008f ac490149      	jpf	L721
 302  0093               L52:
 303                     ; 172     case EXTI_Pin_2:
 303                     ; 173       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 305  0093 c650a0        	ld	a,20640
 306  0096 a4cf          	and	a,#207
 307  0098 c750a0        	ld	20640,a
 308                     ; 174       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 310  009b 7b01          	ld	a,(OFST+1,sp)
 311  009d 5f            	clrw	x
 312  009e 97            	ld	xl,a
 313  009f 7b02          	ld	a,(OFST+2,sp)
 314  00a1 5d            	tnzw	x
 315  00a2 2704          	jreq	L02
 316  00a4               L22:
 317  00a4 48            	sll	a
 318  00a5 5a            	decw	x
 319  00a6 26fc          	jrne	L22
 320  00a8               L02:
 321  00a8 ca50a0        	or	a,20640
 322  00ab c750a0        	ld	20640,a
 323                     ; 175       break;
 325  00ae ac490149      	jpf	L721
 326  00b2               L72:
 327                     ; 176     case EXTI_Pin_3:
 327                     ; 177       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 329  00b2 c650a0        	ld	a,20640
 330  00b5 a43f          	and	a,#63
 331  00b7 c750a0        	ld	20640,a
 332                     ; 178       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 334  00ba 7b01          	ld	a,(OFST+1,sp)
 335  00bc 5f            	clrw	x
 336  00bd 97            	ld	xl,a
 337  00be 7b02          	ld	a,(OFST+2,sp)
 338  00c0 5d            	tnzw	x
 339  00c1 2704          	jreq	L42
 340  00c3               L62:
 341  00c3 48            	sll	a
 342  00c4 5a            	decw	x
 343  00c5 26fc          	jrne	L62
 344  00c7               L42:
 345  00c7 ca50a0        	or	a,20640
 346  00ca c750a0        	ld	20640,a
 347                     ; 179       break;
 349  00cd 207a          	jra	L721
 350  00cf               L13:
 351                     ; 180     case EXTI_Pin_4:
 351                     ; 181       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 353  00cf c650a1        	ld	a,20641
 354  00d2 a4fc          	and	a,#252
 355  00d4 c750a1        	ld	20641,a
 356                     ; 182       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 358  00d7 7b01          	ld	a,(OFST+1,sp)
 359  00d9 a4ef          	and	a,#239
 360  00db 5f            	clrw	x
 361  00dc 97            	ld	xl,a
 362  00dd 7b02          	ld	a,(OFST+2,sp)
 363  00df 5d            	tnzw	x
 364  00e0 2704          	jreq	L03
 365  00e2               L23:
 366  00e2 48            	sll	a
 367  00e3 5a            	decw	x
 368  00e4 26fc          	jrne	L23
 369  00e6               L03:
 370  00e6 ca50a1        	or	a,20641
 371  00e9 c750a1        	ld	20641,a
 372                     ; 183       break;
 374  00ec 205b          	jra	L721
 375  00ee               L33:
 376                     ; 184     case EXTI_Pin_5:
 376                     ; 185       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 378  00ee c650a1        	ld	a,20641
 379  00f1 a4f3          	and	a,#243
 380  00f3 c750a1        	ld	20641,a
 381                     ; 186       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 383  00f6 7b01          	ld	a,(OFST+1,sp)
 384  00f8 a4ef          	and	a,#239
 385  00fa 5f            	clrw	x
 386  00fb 97            	ld	xl,a
 387  00fc 7b02          	ld	a,(OFST+2,sp)
 388  00fe 5d            	tnzw	x
 389  00ff 2704          	jreq	L43
 390  0101               L63:
 391  0101 48            	sll	a
 392  0102 5a            	decw	x
 393  0103 26fc          	jrne	L63
 394  0105               L43:
 395  0105 ca50a1        	or	a,20641
 396  0108 c750a1        	ld	20641,a
 397                     ; 187       break;
 399  010b 203c          	jra	L721
 400  010d               L53:
 401                     ; 188     case EXTI_Pin_6:
 401                     ; 189       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 403  010d c650a1        	ld	a,20641
 404  0110 a4cf          	and	a,#207
 405  0112 c750a1        	ld	20641,a
 406                     ; 190       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 408  0115 7b01          	ld	a,(OFST+1,sp)
 409  0117 a4ef          	and	a,#239
 410  0119 5f            	clrw	x
 411  011a 97            	ld	xl,a
 412  011b 7b02          	ld	a,(OFST+2,sp)
 413  011d 5d            	tnzw	x
 414  011e 2704          	jreq	L04
 415  0120               L24:
 416  0120 48            	sll	a
 417  0121 5a            	decw	x
 418  0122 26fc          	jrne	L24
 419  0124               L04:
 420  0124 ca50a1        	or	a,20641
 421  0127 c750a1        	ld	20641,a
 422                     ; 191       break;
 424  012a 201d          	jra	L721
 425  012c               L73:
 426                     ; 192     case EXTI_Pin_7:
 426                     ; 193       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 428  012c c650a1        	ld	a,20641
 429  012f a43f          	and	a,#63
 430  0131 c750a1        	ld	20641,a
 431                     ; 194       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 433  0134 7b01          	ld	a,(OFST+1,sp)
 434  0136 a4ef          	and	a,#239
 435  0138 5f            	clrw	x
 436  0139 97            	ld	xl,a
 437  013a 7b02          	ld	a,(OFST+2,sp)
 438  013c 5d            	tnzw	x
 439  013d 2704          	jreq	L44
 440  013f               L64:
 441  013f 48            	sll	a
 442  0140 5a            	decw	x
 443  0141 26fc          	jrne	L64
 444  0143               L44:
 445  0143 ca50a1        	or	a,20641
 446  0146 c750a1        	ld	20641,a
 447                     ; 195       break;
 449  0149               L14:
 450                     ; 196     default:
 450                     ; 197       break;
 452  0149               L721:
 453                     ; 199 }
 456  0149 85            	popw	x
 457  014a 81            	ret
 540                     ; 213 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 540                     ; 214 {
 541                     	switch	.text
 542  014b               _EXTI_SelectPort:
 544  014b 88            	push	a
 545       00000000      OFST:	set	0
 548                     ; 216   assert_param(IS_EXTI_PORT(EXTI_Port));
 550                     ; 218   if (EXTI_Port == EXTI_Port_B)
 552  014c 4d            	tnz	a
 553  014d 2606          	jrne	L761
 554                     ; 221     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 556  014f 721b50ab      	bres	20651,#5
 558  0153 2034          	jra	L171
 559  0155               L761:
 560                     ; 223   else if (EXTI_Port == EXTI_Port_D)
 562  0155 7b01          	ld	a,(OFST+1,sp)
 563  0157 a102          	cp	a,#2
 564  0159 2606          	jrne	L371
 565                     ; 226     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 567  015b 721d50ab      	bres	20651,#6
 569  015f 2028          	jra	L171
 570  0161               L371:
 571                     ; 228   else if (EXTI_Port == EXTI_Port_E)
 573  0161 7b01          	ld	a,(OFST+1,sp)
 574  0163 a104          	cp	a,#4
 575  0165 2606          	jrne	L771
 576                     ; 231     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 578  0167 721f50a5      	bres	20645,#7
 580  016b 201c          	jra	L171
 581  016d               L771:
 582                     ; 233   else if (EXTI_Port == EXTI_Port_F)
 584  016d 7b01          	ld	a,(OFST+1,sp)
 585  016f a106          	cp	a,#6
 586  0171 2606          	jrne	L302
 587                     ; 236     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 589  0173 721e50a5      	bset	20645,#7
 591  0177 2010          	jra	L171
 592  0179               L302:
 593                     ; 238   else if (EXTI_Port == EXTI_Port_G)
 595  0179 7b01          	ld	a,(OFST+1,sp)
 596  017b a110          	cp	a,#16
 597  017d 2606          	jrne	L702
 598                     ; 241     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 600  017f 721a50ab      	bset	20651,#5
 602  0183 2004          	jra	L171
 603  0185               L702:
 604                     ; 246     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 606  0185 721c50ab      	bset	20651,#6
 607  0189               L171:
 608                     ; 248 }
 611  0189 84            	pop	a
 612  018a 81            	ret
 780                     ; 274 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 780                     ; 275                                FunctionalState NewState)
 780                     ; 276 {
 781                     	switch	.text
 782  018b               _EXTI_SetHalfPortSelection:
 784  018b 89            	pushw	x
 785       00000000      OFST:	set	0
 788                     ; 278   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 790                     ; 279   assert_param(IS_FUNCTIONAL_STATE(NewState));
 792                     ; 281   if ((EXTI_HalfPort & 0x80) == 0x00)
 794  018c 9e            	ld	a,xh
 795  018d a580          	bcp	a,#128
 796  018f 2619          	jrne	L103
 797                     ; 283     if (NewState != DISABLE)
 799  0191 0d02          	tnz	(OFST+2,sp)
 800  0193 270a          	jreq	L303
 801                     ; 286       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 803  0195 c650a5        	ld	a,20645
 804  0198 1a01          	or	a,(OFST+1,sp)
 805  019a c750a5        	ld	20645,a
 807  019d 2026          	jra	L703
 808  019f               L303:
 809                     ; 291       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 811  019f 7b01          	ld	a,(OFST+1,sp)
 812  01a1 43            	cpl	a
 813  01a2 c450a5        	and	a,20645
 814  01a5 c750a5        	ld	20645,a
 815  01a8 201b          	jra	L703
 816  01aa               L103:
 817                     ; 296     if (NewState != DISABLE)
 819  01aa 0d02          	tnz	(OFST+2,sp)
 820  01ac 270c          	jreq	L113
 821                     ; 299       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 823  01ae 7b01          	ld	a,(OFST+1,sp)
 824  01b0 a47f          	and	a,#127
 825  01b2 ca50ab        	or	a,20651
 826  01b5 c750ab        	ld	20651,a
 828  01b8 200b          	jra	L703
 829  01ba               L113:
 830                     ; 304       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 832  01ba 7b01          	ld	a,(OFST+1,sp)
 833  01bc a47f          	and	a,#127
 834  01be 43            	cpl	a
 835  01bf c450ab        	and	a,20651
 836  01c2 c750ab        	ld	20651,a
 837  01c5               L703:
 838                     ; 307 }
 841  01c5 85            	popw	x
 842  01c6 81            	ret
 888                     ; 332 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 888                     ; 333                              EXTI_Trigger_TypeDef EXTI_Trigger)
 888                     ; 334 {
 889                     	switch	.text
 890  01c7               _EXTI_SetPortSensitivity:
 892  01c7 89            	pushw	x
 893       00000000      OFST:	set	0
 896                     ; 336   assert_param(IS_EXTI_PORT(EXTI_Port));
 898                     ; 337   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 900                     ; 340   if ((EXTI_Port & 0xF0) == 0x00)
 902  01c8 9e            	ld	a,xh
 903  01c9 a5f0          	bcp	a,#240
 904  01cb 2629          	jrne	L733
 905                     ; 343     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 907  01cd 7b01          	ld	a,(OFST+1,sp)
 908  01cf 5f            	clrw	x
 909  01d0 97            	ld	xl,a
 910  01d1 a603          	ld	a,#3
 911  01d3 5d            	tnzw	x
 912  01d4 2704          	jreq	L66
 913  01d6               L07:
 914  01d6 48            	sll	a
 915  01d7 5a            	decw	x
 916  01d8 26fc          	jrne	L07
 917  01da               L66:
 918  01da 43            	cpl	a
 919  01db c450a2        	and	a,20642
 920  01de c750a2        	ld	20642,a
 921                     ; 345     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 923  01e1 7b01          	ld	a,(OFST+1,sp)
 924  01e3 5f            	clrw	x
 925  01e4 97            	ld	xl,a
 926  01e5 7b02          	ld	a,(OFST+2,sp)
 927  01e7 5d            	tnzw	x
 928  01e8 2704          	jreq	L27
 929  01ea               L47:
 930  01ea 48            	sll	a
 931  01eb 5a            	decw	x
 932  01ec 26fc          	jrne	L47
 933  01ee               L27:
 934  01ee ca50a2        	or	a,20642
 935  01f1 c750a2        	ld	20642,a
 937  01f4 202b          	jra	L143
 938  01f6               L733:
 939                     ; 350     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 941  01f6 7b01          	ld	a,(OFST+1,sp)
 942  01f8 a40f          	and	a,#15
 943  01fa 5f            	clrw	x
 944  01fb 97            	ld	xl,a
 945  01fc a603          	ld	a,#3
 946  01fe 5d            	tnzw	x
 947  01ff 2704          	jreq	L67
 948  0201               L001:
 949  0201 48            	sll	a
 950  0202 5a            	decw	x
 951  0203 26fc          	jrne	L001
 952  0205               L67:
 953  0205 43            	cpl	a
 954  0206 c450aa        	and	a,20650
 955  0209 c750aa        	ld	20650,a
 956                     ; 352     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 958  020c 7b01          	ld	a,(OFST+1,sp)
 959  020e a40f          	and	a,#15
 960  0210 5f            	clrw	x
 961  0211 97            	ld	xl,a
 962  0212 7b02          	ld	a,(OFST+2,sp)
 963  0214 5d            	tnzw	x
 964  0215 2704          	jreq	L201
 965  0217               L401:
 966  0217 48            	sll	a
 967  0218 5a            	decw	x
 968  0219 26fc          	jrne	L401
 969  021b               L201:
 970  021b ca50aa        	or	a,20650
 971  021e c750aa        	ld	20650,a
 972  0221               L143:
 973                     ; 354 }
 976  0221 85            	popw	x
 977  0222 81            	ret
1023                     ; 370 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1023                     ; 371 {
1024                     	switch	.text
1025  0223               _EXTI_GetPinSensitivity:
1027  0223 88            	push	a
1028       00000001      OFST:	set	1
1031                     ; 372   uint8_t value = 0;
1033  0224 0f01          	clr	(OFST+0,sp)
1034                     ; 375   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1036                     ; 377   switch (EXTI_Pin)
1039                     ; 403     default:
1039                     ; 404       break;
1040  0226 4d            	tnz	a
1041  0227 271e          	jreq	L343
1042  0229 a002          	sub	a,#2
1043  022b 2723          	jreq	L543
1044  022d a002          	sub	a,#2
1045  022f 272a          	jreq	L743
1046  0231 a002          	sub	a,#2
1047  0233 2732          	jreq	L153
1048  0235 a00a          	sub	a,#10
1049  0237 273c          	jreq	L353
1050  0239 a002          	sub	a,#2
1051  023b 2741          	jreq	L553
1052  023d a002          	sub	a,#2
1053  023f 2748          	jreq	L753
1054  0241 a002          	sub	a,#2
1055  0243 2750          	jreq	L163
1056  0245 205a          	jra	L114
1057  0247               L343:
1058                     ; 379     case EXTI_Pin_0:
1058                     ; 380       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1060  0247 c650a0        	ld	a,20640
1061  024a a403          	and	a,#3
1062  024c 6b01          	ld	(OFST+0,sp),a
1063                     ; 381       break;
1065  024e 2051          	jra	L114
1066  0250               L543:
1067                     ; 382     case EXTI_Pin_1:
1067                     ; 383       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1069  0250 c650a0        	ld	a,20640
1070  0253 a40c          	and	a,#12
1071  0255 44            	srl	a
1072  0256 44            	srl	a
1073  0257 6b01          	ld	(OFST+0,sp),a
1074                     ; 384       break;
1076  0259 2046          	jra	L114
1077  025b               L743:
1078                     ; 385     case EXTI_Pin_2:
1078                     ; 386       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1080  025b c650a0        	ld	a,20640
1081  025e a430          	and	a,#48
1082  0260 4e            	swap	a
1083  0261 a40f          	and	a,#15
1084  0263 6b01          	ld	(OFST+0,sp),a
1085                     ; 387       break;
1087  0265 203a          	jra	L114
1088  0267               L153:
1089                     ; 388     case EXTI_Pin_3:
1089                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1091  0267 c650a0        	ld	a,20640
1092  026a a4c0          	and	a,#192
1093  026c 4e            	swap	a
1094  026d 44            	srl	a
1095  026e 44            	srl	a
1096  026f a403          	and	a,#3
1097  0271 6b01          	ld	(OFST+0,sp),a
1098                     ; 390       break;
1100  0273 202c          	jra	L114
1101  0275               L353:
1102                     ; 391     case EXTI_Pin_4:
1102                     ; 392       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1104  0275 c650a1        	ld	a,20641
1105  0278 a403          	and	a,#3
1106  027a 6b01          	ld	(OFST+0,sp),a
1107                     ; 393       break;
1109  027c 2023          	jra	L114
1110  027e               L553:
1111                     ; 394     case EXTI_Pin_5:
1111                     ; 395       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1113  027e c650a1        	ld	a,20641
1114  0281 a40c          	and	a,#12
1115  0283 44            	srl	a
1116  0284 44            	srl	a
1117  0285 6b01          	ld	(OFST+0,sp),a
1118                     ; 396       break;
1120  0287 2018          	jra	L114
1121  0289               L753:
1122                     ; 397     case EXTI_Pin_6:
1122                     ; 398       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1124  0289 c650a1        	ld	a,20641
1125  028c a430          	and	a,#48
1126  028e 4e            	swap	a
1127  028f a40f          	and	a,#15
1128  0291 6b01          	ld	(OFST+0,sp),a
1129                     ; 399       break;
1131  0293 200c          	jra	L114
1132  0295               L163:
1133                     ; 400     case EXTI_Pin_7:
1133                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1135  0295 c650a1        	ld	a,20641
1136  0298 a4c0          	and	a,#192
1137  029a 4e            	swap	a
1138  029b 44            	srl	a
1139  029c 44            	srl	a
1140  029d a403          	and	a,#3
1141  029f 6b01          	ld	(OFST+0,sp),a
1142                     ; 402       break;
1144  02a1               L363:
1145                     ; 403     default:
1145                     ; 404       break;
1147  02a1               L114:
1148                     ; 406   return((EXTI_Trigger_TypeDef)value);
1150  02a1 7b01          	ld	a,(OFST+0,sp)
1153  02a3 5b01          	addw	sp,#1
1154  02a5 81            	ret
1200                     ; 421 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1200                     ; 422 {
1201                     	switch	.text
1202  02a6               _EXTI_GetPortSensitivity:
1204  02a6 88            	push	a
1205  02a7 88            	push	a
1206       00000001      OFST:	set	1
1209                     ; 423   uint8_t portsensitivity = 0;
1211  02a8 0f01          	clr	(OFST+0,sp)
1212                     ; 426   assert_param(IS_EXTI_PORT(EXTI_Port));
1214                     ; 429   if ((EXTI_Port & 0xF0) == 0x00)
1216  02aa a5f0          	bcp	a,#240
1217  02ac 2614          	jrne	L534
1218                     ; 432     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1220  02ae 7b02          	ld	a,(OFST+1,sp)
1221  02b0 5f            	clrw	x
1222  02b1 97            	ld	xl,a
1223  02b2 c650a2        	ld	a,20642
1224  02b5 5d            	tnzw	x
1225  02b6 2704          	jreq	L211
1226  02b8               L411:
1227  02b8 44            	srl	a
1228  02b9 5a            	decw	x
1229  02ba 26fc          	jrne	L411
1230  02bc               L211:
1231  02bc a403          	and	a,#3
1232  02be 6b01          	ld	(OFST+0,sp),a
1234  02c0 2014          	jra	L734
1235  02c2               L534:
1236                     ; 438     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1238  02c2 7b02          	ld	a,(OFST+1,sp)
1239  02c4 a40f          	and	a,#15
1240  02c6 5f            	clrw	x
1241  02c7 97            	ld	xl,a
1242  02c8 c650aa        	ld	a,20650
1243  02cb 5d            	tnzw	x
1244  02cc 2704          	jreq	L611
1245  02ce               L021:
1246  02ce 44            	srl	a
1247  02cf 5a            	decw	x
1248  02d0 26fc          	jrne	L021
1249  02d2               L611:
1250  02d2 a403          	and	a,#3
1251  02d4 6b01          	ld	(OFST+0,sp),a
1252  02d6               L734:
1253                     ; 441   return((EXTI_Trigger_TypeDef)portsensitivity);
1255  02d6 7b01          	ld	a,(OFST+0,sp)
1258  02d8 85            	popw	x
1259  02d9 81            	ret
1429                     ; 481 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1429                     ; 482 {
1430                     	switch	.text
1431  02da               _EXTI_GetITStatus:
1433  02da 89            	pushw	x
1434  02db 88            	push	a
1435       00000001      OFST:	set	1
1438                     ; 483   ITStatus status = RESET;
1440  02dc 0f01          	clr	(OFST+0,sp)
1441                     ; 485   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1443                     ; 487   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1445  02de 01            	rrwa	x,a
1446  02df 9f            	ld	a,xl
1447  02e0 a4ff          	and	a,#255
1448  02e2 97            	ld	xl,a
1449  02e3 4f            	clr	a
1450  02e4 02            	rlwa	x,a
1451  02e5 a30100        	cpw	x,#256
1452  02e8 260b          	jrne	L335
1453                     ; 489     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1455  02ea 7b03          	ld	a,(OFST+2,sp)
1456  02ec a4ff          	and	a,#255
1457  02ee c450a4        	and	a,20644
1458  02f1 6b01          	ld	(OFST+0,sp),a
1460  02f3 2009          	jra	L535
1461  02f5               L335:
1462                     ; 493     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1464  02f5 7b03          	ld	a,(OFST+2,sp)
1465  02f7 a4ff          	and	a,#255
1466  02f9 c450a3        	and	a,20643
1467  02fc 6b01          	ld	(OFST+0,sp),a
1468  02fe               L535:
1469                     ; 495   return((ITStatus)status);
1471  02fe 7b01          	ld	a,(OFST+0,sp)
1474  0300 5b03          	addw	sp,#3
1475  0302 81            	ret
1520                     ; 518 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1520                     ; 519 {
1521                     	switch	.text
1522  0303               _EXTI_ClearITPendingBit:
1524  0303 89            	pushw	x
1525  0304 89            	pushw	x
1526       00000002      OFST:	set	2
1529                     ; 520   uint16_t tempvalue = 0;
1531  0305 5f            	clrw	x
1532  0306 1f01          	ldw	(OFST-1,sp),x
1533                     ; 523   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1535                     ; 525   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1537  0308 7b03          	ld	a,(OFST+1,sp)
1538  030a 97            	ld	xl,a
1539  030b 7b04          	ld	a,(OFST+2,sp)
1540  030d 9f            	ld	a,xl
1541  030e a4ff          	and	a,#255
1542  0310 97            	ld	xl,a
1543  0311 4f            	clr	a
1544  0312 02            	rlwa	x,a
1545  0313 1f01          	ldw	(OFST-1,sp),x
1546  0315 01            	rrwa	x,a
1547                     ; 527   if ( tempvalue == 0x0100)
1549  0316 1e01          	ldw	x,(OFST-1,sp)
1550  0318 a30100        	cpw	x,#256
1551  031b 2609          	jrne	L165
1552                     ; 529     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1554  031d 7b04          	ld	a,(OFST+2,sp)
1555  031f a4ff          	and	a,#255
1556  0321 c750a4        	ld	20644,a
1558  0324 2005          	jra	L365
1559  0326               L165:
1560                     ; 533     EXTI->SR1 = (uint8_t) (EXTI_IT);
1562  0326 7b04          	ld	a,(OFST+2,sp)
1563  0328 c750a3        	ld	20643,a
1564  032b               L365:
1565                     ; 535 }
1568  032b 5b04          	addw	sp,#4
1569  032d 81            	ret
1582                     	xdef	_EXTI_ClearITPendingBit
1583                     	xdef	_EXTI_GetITStatus
1584                     	xdef	_EXTI_GetPortSensitivity
1585                     	xdef	_EXTI_GetPinSensitivity
1586                     	xdef	_EXTI_SetPortSensitivity
1587                     	xdef	_EXTI_SetHalfPortSelection
1588                     	xdef	_EXTI_SelectPort
1589                     	xdef	_EXTI_SetPinSensitivity
1590                     	xdef	_EXTI_DeInit
1609                     	end
