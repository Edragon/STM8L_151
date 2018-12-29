   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  98                     ; 90 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  98                     ; 91 {
 100                     	switch	.text
 101  0000               _GPIO_DeInit:
 105                     ; 92   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 107  0000 6f04          	clr	(4,x)
 108                     ; 93   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 110  0002 7f            	clr	(x)
 111                     ; 94   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 113  0003 6f02          	clr	(2,x)
 114                     ; 95   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 116  0005 6f03          	clr	(3,x)
 117                     ; 96 }
 120  0007 81            	ret
 276                     ; 127 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 276                     ; 128 {
 277                     	switch	.text
 278  0008               _GPIO_Init:
 280  0008 89            	pushw	x
 281       00000000      OFST:	set	0
 284                     ; 133   assert_param(IS_GPIO_MODE(GPIO_Mode));
 286                     ; 134   assert_param(IS_GPIO_PIN(GPIO_Pin));
 288                     ; 137   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 290  0009 7b05          	ld	a,(OFST+5,sp)
 291  000b 43            	cpl	a
 292  000c e404          	and	a,(4,x)
 293  000e e704          	ld	(4,x),a
 294                     ; 143   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 296  0010 7b06          	ld	a,(OFST+6,sp)
 297  0012 a580          	bcp	a,#128
 298  0014 271d          	jreq	L541
 299                     ; 145     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 301  0016 7b06          	ld	a,(OFST+6,sp)
 302  0018 a510          	bcp	a,#16
 303  001a 2706          	jreq	L741
 304                     ; 147       GPIOx->ODR |= GPIO_Pin;
 306  001c f6            	ld	a,(x)
 307  001d 1a05          	or	a,(OFST+5,sp)
 308  001f f7            	ld	(x),a
 310  0020 2007          	jra	L151
 311  0022               L741:
 312                     ; 150       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 314  0022 1e01          	ldw	x,(OFST+1,sp)
 315  0024 7b05          	ld	a,(OFST+5,sp)
 316  0026 43            	cpl	a
 317  0027 f4            	and	a,(x)
 318  0028 f7            	ld	(x),a
 319  0029               L151:
 320                     ; 153     GPIOx->DDR |= GPIO_Pin;
 322  0029 1e01          	ldw	x,(OFST+1,sp)
 323  002b e602          	ld	a,(2,x)
 324  002d 1a05          	or	a,(OFST+5,sp)
 325  002f e702          	ld	(2,x),a
 327  0031 2009          	jra	L351
 328  0033               L541:
 329                     ; 157     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 331  0033 1e01          	ldw	x,(OFST+1,sp)
 332  0035 7b05          	ld	a,(OFST+5,sp)
 333  0037 43            	cpl	a
 334  0038 e402          	and	a,(2,x)
 335  003a e702          	ld	(2,x),a
 336  003c               L351:
 337                     ; 164   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 339  003c 7b06          	ld	a,(OFST+6,sp)
 340  003e a540          	bcp	a,#64
 341  0040 270a          	jreq	L551
 342                     ; 166     GPIOx->CR1 |= GPIO_Pin;
 344  0042 1e01          	ldw	x,(OFST+1,sp)
 345  0044 e603          	ld	a,(3,x)
 346  0046 1a05          	or	a,(OFST+5,sp)
 347  0048 e703          	ld	(3,x),a
 349  004a 2009          	jra	L751
 350  004c               L551:
 351                     ; 169     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 353  004c 1e01          	ldw	x,(OFST+1,sp)
 354  004e 7b05          	ld	a,(OFST+5,sp)
 355  0050 43            	cpl	a
 356  0051 e403          	and	a,(3,x)
 357  0053 e703          	ld	(3,x),a
 358  0055               L751:
 359                     ; 176   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 361  0055 7b06          	ld	a,(OFST+6,sp)
 362  0057 a520          	bcp	a,#32
 363  0059 270a          	jreq	L161
 364                     ; 178     GPIOx->CR2 |= GPIO_Pin;
 366  005b 1e01          	ldw	x,(OFST+1,sp)
 367  005d e604          	ld	a,(4,x)
 368  005f 1a05          	or	a,(OFST+5,sp)
 369  0061 e704          	ld	(4,x),a
 371  0063 2009          	jra	L361
 372  0065               L161:
 373                     ; 181     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 375  0065 1e01          	ldw	x,(OFST+1,sp)
 376  0067 7b05          	ld	a,(OFST+5,sp)
 377  0069 43            	cpl	a
 378  006a e404          	and	a,(4,x)
 379  006c e704          	ld	(4,x),a
 380  006e               L361:
 381                     ; 184 }
 384  006e 85            	popw	x
 385  006f 81            	ret
 462                     ; 203 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 462                     ; 204 {
 463                     	switch	.text
 464  0070               _GPIO_ExternalPullUpConfig:
 466  0070 89            	pushw	x
 467       00000000      OFST:	set	0
 470                     ; 206   assert_param(IS_GPIO_PIN(GPIO_Pin));
 472                     ; 207   assert_param(IS_FUNCTIONAL_STATE(NewState));
 474                     ; 209   if (NewState != DISABLE) /* External Pull-Up Set*/
 476  0071 0d06          	tnz	(OFST+6,sp)
 477  0073 2708          	jreq	L522
 478                     ; 211     GPIOx->CR1 |= GPIO_Pin;
 480  0075 e603          	ld	a,(3,x)
 481  0077 1a05          	or	a,(OFST+5,sp)
 482  0079 e703          	ld	(3,x),a
 484  007b 2009          	jra	L722
 485  007d               L522:
 486                     ; 214     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 488  007d 1e01          	ldw	x,(OFST+1,sp)
 489  007f 7b05          	ld	a,(OFST+5,sp)
 490  0081 43            	cpl	a
 491  0082 e403          	and	a,(3,x)
 492  0084 e703          	ld	(3,x),a
 493  0086               L722:
 494                     ; 216 }
 497  0086 85            	popw	x
 498  0087 81            	ret
 544                     ; 242 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 544                     ; 243 {
 545                     	switch	.text
 546  0088               _GPIO_Write:
 548  0088 89            	pushw	x
 549       00000000      OFST:	set	0
 552                     ; 244   GPIOx->ODR = GPIO_PortVal;
 554  0089 7b05          	ld	a,(OFST+5,sp)
 555  008b 1e01          	ldw	x,(OFST+1,sp)
 556  008d f7            	ld	(x),a
 557                     ; 245 }
 560  008e 85            	popw	x
 561  008f 81            	ret
 721                     ; 264 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 721                     ; 265 {
 722                     	switch	.text
 723  0090               _GPIO_WriteBit:
 725  0090 89            	pushw	x
 726       00000000      OFST:	set	0
 729                     ; 267   assert_param(IS_GPIO_PIN(GPIO_Pin));
 731                     ; 268   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 733                     ; 270   if (GPIO_BitVal != RESET)
 735  0091 0d06          	tnz	(OFST+6,sp)
 736  0093 2706          	jreq	L743
 737                     ; 272     GPIOx->ODR |= GPIO_Pin;
 739  0095 f6            	ld	a,(x)
 740  0096 1a05          	or	a,(OFST+5,sp)
 741  0098 f7            	ld	(x),a
 743  0099 2007          	jra	L153
 744  009b               L743:
 745                     ; 277     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 747  009b 1e01          	ldw	x,(OFST+1,sp)
 748  009d 7b05          	ld	a,(OFST+5,sp)
 749  009f 43            	cpl	a
 750  00a0 f4            	and	a,(x)
 751  00a1 f7            	ld	(x),a
 752  00a2               L153:
 753                     ; 279 }
 756  00a2 85            	popw	x
 757  00a3 81            	ret
 803                     ; 297 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 803                     ; 298 {
 804                     	switch	.text
 805  00a4               _GPIO_SetBits:
 807  00a4 89            	pushw	x
 808       00000000      OFST:	set	0
 811                     ; 299   GPIOx->ODR |= GPIO_Pin;
 813  00a5 f6            	ld	a,(x)
 814  00a6 1a05          	or	a,(OFST+5,sp)
 815  00a8 f7            	ld	(x),a
 816                     ; 300 }
 819  00a9 85            	popw	x
 820  00aa 81            	ret
 866                     ; 318 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 866                     ; 319 {
 867                     	switch	.text
 868  00ab               _GPIO_ResetBits:
 870  00ab 89            	pushw	x
 871       00000000      OFST:	set	0
 874                     ; 320   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 876  00ac 7b05          	ld	a,(OFST+5,sp)
 877  00ae 43            	cpl	a
 878  00af f4            	and	a,(x)
 879  00b0 f7            	ld	(x),a
 880                     ; 321 }
 883  00b1 85            	popw	x
 884  00b2 81            	ret
 930                     ; 330 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 930                     ; 331 {
 931                     	switch	.text
 932  00b3               _GPIO_ToggleBits:
 934  00b3 89            	pushw	x
 935       00000000      OFST:	set	0
 938                     ; 332   GPIOx->ODR ^= GPIO_Pin;
 940  00b4 f6            	ld	a,(x)
 941  00b5 1805          	xor	a,	(OFST+5,sp)
 942  00b7 f7            	ld	(x),a
 943                     ; 333 }
 946  00b8 85            	popw	x
 947  00b9 81            	ret
 984                     ; 341 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 984                     ; 342 {
 985                     	switch	.text
 986  00ba               _GPIO_ReadInputData:
 990                     ; 343   return ((uint8_t)GPIOx->IDR);
 992  00ba e601          	ld	a,(1,x)
 995  00bc 81            	ret
1033                     ; 352 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1033                     ; 353 {
1034                     	switch	.text
1035  00bd               _GPIO_ReadOutputData:
1039                     ; 354   return ((uint8_t)GPIOx->ODR);
1041  00bd f6            	ld	a,(x)
1044  00be 81            	ret
1093                     ; 372 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1093                     ; 373 {
1094                     	switch	.text
1095  00bf               _GPIO_ReadInputDataBit:
1097  00bf 89            	pushw	x
1098       00000000      OFST:	set	0
1101                     ; 374   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1103  00c0 e601          	ld	a,(1,x)
1104  00c2 1405          	and	a,(OFST+5,sp)
1107  00c4 85            	popw	x
1108  00c5 81            	ret
1157                     ; 383 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1157                     ; 384 {
1158                     	switch	.text
1159  00c6               _GPIO_ReadOutputDataBit:
1161  00c6 89            	pushw	x
1162       00000000      OFST:	set	0
1165                     ; 385   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1167  00c7 f6            	ld	a,(x)
1168  00c8 1405          	and	a,(OFST+5,sp)
1171  00ca 85            	popw	x
1172  00cb 81            	ret
1185                     	xdef	_GPIO_ReadOutputDataBit
1186                     	xdef	_GPIO_ReadInputDataBit
1187                     	xdef	_GPIO_ReadOutputData
1188                     	xdef	_GPIO_ReadInputData
1189                     	xdef	_GPIO_ToggleBits
1190                     	xdef	_GPIO_ResetBits
1191                     	xdef	_GPIO_SetBits
1192                     	xdef	_GPIO_WriteBit
1193                     	xdef	_GPIO_Write
1194                     	xdef	_GPIO_ExternalPullUpConfig
1195                     	xdef	_GPIO_Init
1196                     	xdef	_GPIO_DeInit
1215                     	end
