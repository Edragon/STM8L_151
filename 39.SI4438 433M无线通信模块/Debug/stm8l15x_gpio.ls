   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  98                     ; 90 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  98                     ; 91 {
  99                     	switch	.text
 100  0000               f_GPIO_DeInit:
 104                     ; 92   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 106  0000 6f04          	clr	(4,x)
 107                     ; 93   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 109  0002 7f            	clr	(x)
 110                     ; 94   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 112  0003 6f02          	clr	(2,x)
 113                     ; 95   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 115  0005 6f03          	clr	(3,x)
 116                     ; 96 }
 119  0007 87            	retf
 272                     ; 127 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 272                     ; 128 {
 273                     	switch	.text
 274  0008               f_GPIO_Init:
 276  0008 89            	pushw	x
 277       00000000      OFST:	set	0
 280                     ; 133   assert_param(IS_GPIO_MODE(GPIO_Mode));
 282                     ; 134   assert_param(IS_GPIO_PIN(GPIO_Pin));
 284                     ; 137   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 286  0009 7b06          	ld	a,(OFST+6,sp)
 287  000b 43            	cpl	a
 288  000c e404          	and	a,(4,x)
 289  000e e704          	ld	(4,x),a
 290                     ; 143   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 292  0010 7b07          	ld	a,(OFST+7,sp)
 293  0012 a580          	bcp	a,#128
 294  0014 271d          	jreq	L341
 295                     ; 145     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 297  0016 7b07          	ld	a,(OFST+7,sp)
 298  0018 a510          	bcp	a,#16
 299  001a 2706          	jreq	L541
 300                     ; 147       GPIOx->ODR |= GPIO_Pin;
 302  001c f6            	ld	a,(x)
 303  001d 1a06          	or	a,(OFST+6,sp)
 304  001f f7            	ld	(x),a
 306  0020 2007          	jra	L741
 307  0022               L541:
 308                     ; 150       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 310  0022 1e01          	ldw	x,(OFST+1,sp)
 311  0024 7b06          	ld	a,(OFST+6,sp)
 312  0026 43            	cpl	a
 313  0027 f4            	and	a,(x)
 314  0028 f7            	ld	(x),a
 315  0029               L741:
 316                     ; 153     GPIOx->DDR |= GPIO_Pin;
 318  0029 1e01          	ldw	x,(OFST+1,sp)
 319  002b e602          	ld	a,(2,x)
 320  002d 1a06          	or	a,(OFST+6,sp)
 321  002f e702          	ld	(2,x),a
 323  0031 2009          	jra	L151
 324  0033               L341:
 325                     ; 157     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 327  0033 1e01          	ldw	x,(OFST+1,sp)
 328  0035 7b06          	ld	a,(OFST+6,sp)
 329  0037 43            	cpl	a
 330  0038 e402          	and	a,(2,x)
 331  003a e702          	ld	(2,x),a
 332  003c               L151:
 333                     ; 164   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 335  003c 7b07          	ld	a,(OFST+7,sp)
 336  003e a540          	bcp	a,#64
 337  0040 270a          	jreq	L351
 338                     ; 166     GPIOx->CR1 |= GPIO_Pin;
 340  0042 1e01          	ldw	x,(OFST+1,sp)
 341  0044 e603          	ld	a,(3,x)
 342  0046 1a06          	or	a,(OFST+6,sp)
 343  0048 e703          	ld	(3,x),a
 345  004a 2009          	jra	L551
 346  004c               L351:
 347                     ; 169     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 349  004c 1e01          	ldw	x,(OFST+1,sp)
 350  004e 7b06          	ld	a,(OFST+6,sp)
 351  0050 43            	cpl	a
 352  0051 e403          	and	a,(3,x)
 353  0053 e703          	ld	(3,x),a
 354  0055               L551:
 355                     ; 176   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 357  0055 7b07          	ld	a,(OFST+7,sp)
 358  0057 a520          	bcp	a,#32
 359  0059 270a          	jreq	L751
 360                     ; 178     GPIOx->CR2 |= GPIO_Pin;
 362  005b 1e01          	ldw	x,(OFST+1,sp)
 363  005d e604          	ld	a,(4,x)
 364  005f 1a06          	or	a,(OFST+6,sp)
 365  0061 e704          	ld	(4,x),a
 367  0063 2009          	jra	L161
 368  0065               L751:
 369                     ; 181     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 371  0065 1e01          	ldw	x,(OFST+1,sp)
 372  0067 7b06          	ld	a,(OFST+6,sp)
 373  0069 43            	cpl	a
 374  006a e404          	and	a,(4,x)
 375  006c e704          	ld	(4,x),a
 376  006e               L161:
 377                     ; 184 }
 380  006e 85            	popw	x
 381  006f 87            	retf
 455                     ; 203 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 455                     ; 204 {
 456                     	switch	.text
 457  0070               f_GPIO_ExternalPullUpConfig:
 459  0070 89            	pushw	x
 460       00000000      OFST:	set	0
 463                     ; 206   assert_param(IS_GPIO_PIN(GPIO_Pin));
 465                     ; 207   assert_param(IS_FUNCTIONAL_STATE(NewState));
 467                     ; 209   if (NewState != DISABLE) /* External Pull-Up Set*/
 469  0071 0d07          	tnz	(OFST+7,sp)
 470  0073 2708          	jreq	L122
 471                     ; 211     GPIOx->CR1 |= GPIO_Pin;
 473  0075 e603          	ld	a,(3,x)
 474  0077 1a06          	or	a,(OFST+6,sp)
 475  0079 e703          	ld	(3,x),a
 477  007b 2009          	jra	L322
 478  007d               L122:
 479                     ; 214     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 481  007d 1e01          	ldw	x,(OFST+1,sp)
 482  007f 7b06          	ld	a,(OFST+6,sp)
 483  0081 43            	cpl	a
 484  0082 e403          	and	a,(3,x)
 485  0084 e703          	ld	(3,x),a
 486  0086               L322:
 487                     ; 216 }
 490  0086 85            	popw	x
 491  0087 87            	retf
 534                     ; 242 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 534                     ; 243 {
 535                     	switch	.text
 536  0088               f_GPIO_Write:
 538  0088 89            	pushw	x
 539       00000000      OFST:	set	0
 542                     ; 244   GPIOx->ODR = GPIO_PortVal;
 544  0089 7b06          	ld	a,(OFST+6,sp)
 545  008b 1e01          	ldw	x,(OFST+1,sp)
 546  008d f7            	ld	(x),a
 547                     ; 245 }
 550  008e 85            	popw	x
 551  008f 87            	retf
 710                     ; 264 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 710                     ; 265 {
 711                     	switch	.text
 712  0090               f_GPIO_WriteBit:
 714  0090 89            	pushw	x
 715       00000000      OFST:	set	0
 718                     ; 267   assert_param(IS_GPIO_PIN(GPIO_Pin));
 720                     ; 268   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 722                     ; 270   if (GPIO_BitVal != RESET)
 724  0091 0d07          	tnz	(OFST+7,sp)
 725  0093 2706          	jreq	L143
 726                     ; 272     GPIOx->ODR |= GPIO_Pin;
 728  0095 f6            	ld	a,(x)
 729  0096 1a06          	or	a,(OFST+6,sp)
 730  0098 f7            	ld	(x),a
 732  0099 2007          	jra	L343
 733  009b               L143:
 734                     ; 277     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 736  009b 1e01          	ldw	x,(OFST+1,sp)
 737  009d 7b06          	ld	a,(OFST+6,sp)
 738  009f 43            	cpl	a
 739  00a0 f4            	and	a,(x)
 740  00a1 f7            	ld	(x),a
 741  00a2               L343:
 742                     ; 279 }
 745  00a2 85            	popw	x
 746  00a3 87            	retf
 789                     ; 297 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 789                     ; 298 {
 790                     	switch	.text
 791  00a4               f_GPIO_SetBits:
 793  00a4 89            	pushw	x
 794       00000000      OFST:	set	0
 797                     ; 299   GPIOx->ODR |= GPIO_Pin;
 799  00a5 f6            	ld	a,(x)
 800  00a6 1a06          	or	a,(OFST+6,sp)
 801  00a8 f7            	ld	(x),a
 802                     ; 300 }
 805  00a9 85            	popw	x
 806  00aa 87            	retf
 849                     ; 318 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 849                     ; 319 {
 850                     	switch	.text
 851  00ab               f_GPIO_ResetBits:
 853  00ab 89            	pushw	x
 854       00000000      OFST:	set	0
 857                     ; 320   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 859  00ac 7b06          	ld	a,(OFST+6,sp)
 860  00ae 43            	cpl	a
 861  00af f4            	and	a,(x)
 862  00b0 f7            	ld	(x),a
 863                     ; 321 }
 866  00b1 85            	popw	x
 867  00b2 87            	retf
 910                     ; 330 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 910                     ; 331 {
 911                     	switch	.text
 912  00b3               f_GPIO_ToggleBits:
 914  00b3 89            	pushw	x
 915       00000000      OFST:	set	0
 918                     ; 332   GPIOx->ODR ^= GPIO_Pin;
 920  00b4 f6            	ld	a,(x)
 921  00b5 1806          	xor	a,	(OFST+6,sp)
 922  00b7 f7            	ld	(x),a
 923                     ; 333 }
 926  00b8 85            	popw	x
 927  00b9 87            	retf
 963                     ; 341 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 963                     ; 342 {
 964                     	switch	.text
 965  00ba               f_GPIO_ReadInputData:
 969                     ; 343   return ((uint8_t)GPIOx->IDR);
 971  00ba e601          	ld	a,(1,x)
 974  00bc 87            	retf
1011                     ; 352 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1011                     ; 353 {
1012                     	switch	.text
1013  00bd               f_GPIO_ReadOutputData:
1017                     ; 354   return ((uint8_t)GPIOx->ODR);
1019  00bd f6            	ld	a,(x)
1022  00be 87            	retf
1070                     ; 372 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1070                     ; 373 {
1071                     	switch	.text
1072  00bf               f_GPIO_ReadInputDataBit:
1074  00bf 89            	pushw	x
1075       00000000      OFST:	set	0
1078                     ; 374   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1080  00c0 e601          	ld	a,(1,x)
1081  00c2 1406          	and	a,(OFST+6,sp)
1084  00c4 85            	popw	x
1085  00c5 87            	retf
1133                     ; 383 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1133                     ; 384 {
1134                     	switch	.text
1135  00c6               f_GPIO_ReadOutputDataBit:
1137  00c6 89            	pushw	x
1138       00000000      OFST:	set	0
1141                     ; 385   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1143  00c7 f6            	ld	a,(x)
1144  00c8 1406          	and	a,(OFST+6,sp)
1147  00ca 85            	popw	x
1148  00cb 87            	retf
1160                     	xdef	f_GPIO_ReadOutputDataBit
1161                     	xdef	f_GPIO_ReadInputDataBit
1162                     	xdef	f_GPIO_ReadOutputData
1163                     	xdef	f_GPIO_ReadInputData
1164                     	xdef	f_GPIO_ToggleBits
1165                     	xdef	f_GPIO_ResetBits
1166                     	xdef	f_GPIO_SetBits
1167                     	xdef	f_GPIO_WriteBit
1168                     	xdef	f_GPIO_Write
1169                     	xdef	f_GPIO_ExternalPullUpConfig
1170                     	xdef	f_GPIO_Init
1171                     	xdef	f_GPIO_DeInit
1190                     	end
