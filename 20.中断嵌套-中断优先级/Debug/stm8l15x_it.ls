   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  43                     ; 52 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  43                     ; 53 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 57 }
  52  0000 80            	iret
  74                     ; 67 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 68 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 72 }
  83  0001 80            	iret
 105                     ; 78 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 105                     ; 79 {
 106                     	switch	.text
 107  0002               f_FLASH_IRQHandler:
 111                     ; 83 }
 114  0002 80            	iret
 137                     ; 89 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 137                     ; 90 {
 138                     	switch	.text
 139  0003               f_DMA1_CHANNEL0_1_IRQHandler:
 143                     ; 94 }
 146  0003 80            	iret
 169                     ; 100 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 169                     ; 101 {
 170                     	switch	.text
 171  0004               f_DMA1_CHANNEL2_3_IRQHandler:
 175                     ; 105 }
 178  0004 80            	iret
 201                     ; 111 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 201                     ; 112 {
 202                     	switch	.text
 203  0005               f_RTC_CSSLSE_IRQHandler:
 207                     ; 116 }
 210  0005 80            	iret
 233                     ; 122 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 233                     ; 123 {
 234                     	switch	.text
 235  0006               f_EXTIE_F_PVD_IRQHandler:
 239                     ; 127 }
 242  0006 80            	iret
 264                     ; 134 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 264                     ; 135 {
 265                     	switch	.text
 266  0007               f_EXTIB_G_IRQHandler:
 270                     ; 139 }
 273  0007 80            	iret
 295                     ; 146 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 295                     ; 147 {
 296                     	switch	.text
 297  0008               f_EXTID_H_IRQHandler:
 301                     ; 151 }
 304  0008 80            	iret
 326                     ; 158 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 326                     ; 159 {
 327                     	switch	.text
 328  0009               f_EXTI0_IRQHandler:
 332                     ; 163 }
 335  0009 80            	iret
 357                     ; 170 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 357                     ; 171 {
 358                     	switch	.text
 359  000a               f_EXTI1_IRQHandler:
 363                     ; 175 }
 366  000a 80            	iret
 393                     ; 182 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 393                     ; 183 {
 394                     	switch	.text
 395  000b               f_EXTI2_IRQHandler:
 397  000b 8a            	push	cc
 398  000c 84            	pop	a
 399  000d a4bf          	and	a,#191
 400  000f 88            	push	a
 401  0010 86            	pop	cc
 402  0011 3b0002        	push	c_x+2
 403  0014 be00          	ldw	x,c_x
 404  0016 89            	pushw	x
 405  0017 3b0002        	push	c_y+2
 406  001a be00          	ldw	x,c_y
 407  001c 89            	pushw	x
 410                     ; 187 		EXTI_ClearITPendingBit (EXTI_IT_Pin2);
 412  001d ae0004        	ldw	x,#4
 413  0020 cd0000        	call	_EXTI_ClearITPendingBit
 415                     ; 188       if(!GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_2))
 417  0023 4b04          	push	#4
 418  0025 ae5000        	ldw	x,#20480
 419  0028 cd0000        	call	_GPIO_ReadInputDataBit
 421  002b 5b01          	addw	sp,#1
 422  002d 4d            	tnz	a
 423  002e 264e          	jrne	L151
 424                     ; 190         GPIO_ResetBits(GPIOB, GPIO_Pin_0);
 426  0030 4b01          	push	#1
 427  0032 ae5005        	ldw	x,#20485
 428  0035 cd0000        	call	_GPIO_ResetBits
 430  0038 84            	pop	a
 431                     ; 191         Delay(0xffff);
 433  0039 aeffff        	ldw	x,#65535
 434  003c cd0000        	call	_Delay
 436                     ; 192         Delay(0xffff);
 438  003f aeffff        	ldw	x,#65535
 439  0042 cd0000        	call	_Delay
 441                     ; 193         Delay(0xffff);
 443  0045 aeffff        	ldw	x,#65535
 444  0048 cd0000        	call	_Delay
 446                     ; 194         Delay(0xffff);
 448  004b aeffff        	ldw	x,#65535
 449  004e cd0000        	call	_Delay
 451                     ; 195         Delay(0xffff);
 453  0051 aeffff        	ldw	x,#65535
 454  0054 cd0000        	call	_Delay
 456                     ; 196         Delay(0xffff);
 458  0057 aeffff        	ldw	x,#65535
 459  005a cd0000        	call	_Delay
 461                     ; 197         Delay(0xffff);
 463  005d aeffff        	ldw	x,#65535
 464  0060 cd0000        	call	_Delay
 466                     ; 198         Delay(0xffff);
 468  0063 aeffff        	ldw	x,#65535
 469  0066 cd0000        	call	_Delay
 471                     ; 199         Delay(0xffff);
 473  0069 aeffff        	ldw	x,#65535
 474  006c cd0000        	call	_Delay
 476                     ; 200         Delay(0xffff);
 478  006f aeffff        	ldw	x,#65535
 479  0072 cd0000        	call	_Delay
 481                     ; 201         GPIO_SetBits(GPIOB, GPIO_Pin_0);
 483  0075 4b01          	push	#1
 484  0077 ae5005        	ldw	x,#20485
 485  007a cd0000        	call	_GPIO_SetBits
 487  007d 84            	pop	a
 488  007e               L151:
 489                     ; 203 }
 492  007e 85            	popw	x
 493  007f bf00          	ldw	c_y,x
 494  0081 320002        	pop	c_y+2
 495  0084 85            	popw	x
 496  0085 bf00          	ldw	c_x,x
 497  0087 320002        	pop	c_x+2
 498  008a 80            	iret
 525                     ; 210 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 525                     ; 211 {
 526                     	switch	.text
 527  008b               f_EXTI3_IRQHandler:
 529  008b 8a            	push	cc
 530  008c 84            	pop	a
 531  008d a4bf          	and	a,#191
 532  008f 88            	push	a
 533  0090 86            	pop	cc
 534  0091 3b0002        	push	c_x+2
 535  0094 be00          	ldw	x,c_x
 536  0096 89            	pushw	x
 537  0097 3b0002        	push	c_y+2
 538  009a be00          	ldw	x,c_y
 539  009c 89            	pushw	x
 542                     ; 215 		 EXTI_ClearITPendingBit (EXTI_IT_Pin3);
 544  009d ae0008        	ldw	x,#8
 545  00a0 cd0000        	call	_EXTI_ClearITPendingBit
 547                     ; 216       if(!GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_3))
 549  00a3 4b08          	push	#8
 550  00a5 ae5005        	ldw	x,#20485
 551  00a8 cd0000        	call	_GPIO_ReadInputDataBit
 553  00ab 5b01          	addw	sp,#1
 554  00ad 4d            	tnz	a
 555  00ae 264e          	jrne	L361
 556                     ; 218         GPIO_ResetBits(GPIOD, GPIO_Pin_2);
 558  00b0 4b04          	push	#4
 559  00b2 ae500f        	ldw	x,#20495
 560  00b5 cd0000        	call	_GPIO_ResetBits
 562  00b8 84            	pop	a
 563                     ; 219         Delay(0xffff);
 565  00b9 aeffff        	ldw	x,#65535
 566  00bc cd0000        	call	_Delay
 568                     ; 220         Delay(0xffff);
 570  00bf aeffff        	ldw	x,#65535
 571  00c2 cd0000        	call	_Delay
 573                     ; 221         Delay(0xffff);
 575  00c5 aeffff        	ldw	x,#65535
 576  00c8 cd0000        	call	_Delay
 578                     ; 222         Delay(0xffff);
 580  00cb aeffff        	ldw	x,#65535
 581  00ce cd0000        	call	_Delay
 583                     ; 223         Delay(0xffff);
 585  00d1 aeffff        	ldw	x,#65535
 586  00d4 cd0000        	call	_Delay
 588                     ; 224         Delay(0xffff);
 590  00d7 aeffff        	ldw	x,#65535
 591  00da cd0000        	call	_Delay
 593                     ; 225         Delay(0xffff);
 595  00dd aeffff        	ldw	x,#65535
 596  00e0 cd0000        	call	_Delay
 598                     ; 226         Delay(0xffff);
 600  00e3 aeffff        	ldw	x,#65535
 601  00e6 cd0000        	call	_Delay
 603                     ; 227         Delay(0xffff);
 605  00e9 aeffff        	ldw	x,#65535
 606  00ec cd0000        	call	_Delay
 608                     ; 228         Delay(0xffff);
 610  00ef aeffff        	ldw	x,#65535
 611  00f2 cd0000        	call	_Delay
 613                     ; 229         GPIO_SetBits(GPIOD, GPIO_Pin_2);
 615  00f5 4b04          	push	#4
 616  00f7 ae500f        	ldw	x,#20495
 617  00fa cd0000        	call	_GPIO_SetBits
 619  00fd 84            	pop	a
 620  00fe               L361:
 621                     ; 231 }
 624  00fe 85            	popw	x
 625  00ff bf00          	ldw	c_y,x
 626  0101 320002        	pop	c_y+2
 627  0104 85            	popw	x
 628  0105 bf00          	ldw	c_x,x
 629  0107 320002        	pop	c_x+2
 630  010a 80            	iret
 657                     ; 238 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 657                     ; 239 {
 658                     	switch	.text
 659  010b               f_EXTI4_IRQHandler:
 661  010b 8a            	push	cc
 662  010c 84            	pop	a
 663  010d a4bf          	and	a,#191
 664  010f 88            	push	a
 665  0110 86            	pop	cc
 666  0111 3b0002        	push	c_x+2
 667  0114 be00          	ldw	x,c_x
 668  0116 89            	pushw	x
 669  0117 3b0002        	push	c_y+2
 670  011a be00          	ldw	x,c_y
 671  011c 89            	pushw	x
 674                     ; 243 		 EXTI_ClearITPendingBit (EXTI_IT_Pin4);
 676  011d ae0010        	ldw	x,#16
 677  0120 cd0000        	call	_EXTI_ClearITPendingBit
 679                     ; 244       if(!GPIO_ReadInputDataBit(GPIOD, GPIO_Pin_4))
 681  0123 4b10          	push	#16
 682  0125 ae500f        	ldw	x,#20495
 683  0128 cd0000        	call	_GPIO_ReadInputDataBit
 685  012b 5b01          	addw	sp,#1
 686  012d 4d            	tnz	a
 687  012e 264e          	jrne	L571
 688                     ; 246         GPIO_ResetBits(GPIOC, GPIO_Pin_4);
 690  0130 4b10          	push	#16
 691  0132 ae500a        	ldw	x,#20490
 692  0135 cd0000        	call	_GPIO_ResetBits
 694  0138 84            	pop	a
 695                     ; 247         Delay(0xffff);
 697  0139 aeffff        	ldw	x,#65535
 698  013c cd0000        	call	_Delay
 700                     ; 248         Delay(0xffff);
 702  013f aeffff        	ldw	x,#65535
 703  0142 cd0000        	call	_Delay
 705                     ; 249         Delay(0xffff);
 707  0145 aeffff        	ldw	x,#65535
 708  0148 cd0000        	call	_Delay
 710                     ; 250         Delay(0xffff);
 712  014b aeffff        	ldw	x,#65535
 713  014e cd0000        	call	_Delay
 715                     ; 251         Delay(0xffff);
 717  0151 aeffff        	ldw	x,#65535
 718  0154 cd0000        	call	_Delay
 720                     ; 252         Delay(0xffff);
 722  0157 aeffff        	ldw	x,#65535
 723  015a cd0000        	call	_Delay
 725                     ; 253         Delay(0xffff);
 727  015d aeffff        	ldw	x,#65535
 728  0160 cd0000        	call	_Delay
 730                     ; 254         Delay(0xffff);
 732  0163 aeffff        	ldw	x,#65535
 733  0166 cd0000        	call	_Delay
 735                     ; 255         Delay(0xffff);
 737  0169 aeffff        	ldw	x,#65535
 738  016c cd0000        	call	_Delay
 740                     ; 256         Delay(0xffff);
 742  016f aeffff        	ldw	x,#65535
 743  0172 cd0000        	call	_Delay
 745                     ; 257         GPIO_SetBits(GPIOC, GPIO_Pin_4);
 747  0175 4b10          	push	#16
 748  0177 ae500a        	ldw	x,#20490
 749  017a cd0000        	call	_GPIO_SetBits
 751  017d 84            	pop	a
 752  017e               L571:
 753                     ; 259 }
 756  017e 85            	popw	x
 757  017f bf00          	ldw	c_y,x
 758  0181 320002        	pop	c_y+2
 759  0184 85            	popw	x
 760  0185 bf00          	ldw	c_x,x
 761  0187 320002        	pop	c_x+2
 762  018a 80            	iret
 784                     ; 266 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 784                     ; 267 {
 785                     	switch	.text
 786  018b               f_EXTI5_IRQHandler:
 790                     ; 271 }
 793  018b 80            	iret
 815                     ; 278 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 815                     ; 279 {
 816                     	switch	.text
 817  018c               f_EXTI6_IRQHandler:
 821                     ; 283 }
 824  018c 80            	iret
 846                     ; 290 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 846                     ; 291 {
 847                     	switch	.text
 848  018d               f_EXTI7_IRQHandler:
 852                     ; 295 }
 855  018d 80            	iret
 877                     ; 301 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 877                     ; 302 {
 878                     	switch	.text
 879  018e               f_LCD_AES_IRQHandler:
 883                     ; 306 }
 886  018e 80            	iret
 909                     ; 312 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 909                     ; 313 {
 910                     	switch	.text
 911  018f               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 915                     ; 317 }
 918  018f 80            	iret
 941                     ; 324 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 941                     ; 325 {
 942                     	switch	.text
 943  0190               f_ADC1_COMP_IRQHandler:
 947                     ; 329 }
 950  0190 80            	iret
 974                     ; 336 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 974                     ; 337 {
 975                     	switch	.text
 976  0191               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 980                     ; 341 }
 983  0191 80            	iret
1006                     ; 348 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
1006                     ; 349 {
1007                     	switch	.text
1008  0192               f_TIM2_CC_USART2_RX_IRQHandler:
1012                     ; 353 }
1015  0192 80            	iret
1039                     ; 361 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
1039                     ; 362 {
1040                     	switch	.text
1041  0193               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
1045                     ; 366 }
1048  0193 80            	iret
1071                     ; 372 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
1071                     ; 373 {
1072                     	switch	.text
1073  0194               f_TIM3_CC_USART3_RX_IRQHandler:
1077                     ; 377 }
1080  0194 80            	iret
1103                     ; 383 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
1103                     ; 384 {
1104                     	switch	.text
1105  0195               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
1109                     ; 388 }
1112  0195 80            	iret
1134                     ; 394 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
1134                     ; 395 {
1135                     	switch	.text
1136  0196               f_TIM1_CC_IRQHandler:
1140                     ; 399 }
1143  0196 80            	iret
1166                     ; 406 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
1166                     ; 407 {
1167                     	switch	.text
1168  0197               f_TIM4_UPD_OVF_TRG_IRQHandler:
1172                     ; 411 }
1175  0197 80            	iret
1197                     ; 417 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
1197                     ; 418 {
1198                     	switch	.text
1199  0198               f_SPI1_IRQHandler:
1203                     ; 422 }
1206  0198 80            	iret
1230                     ; 429 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
1230                     ; 430 {
1231                     	switch	.text
1232  0199               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1236                     ; 434 }
1239  0199 80            	iret
1262                     ; 441 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1262                     ; 442 {
1263                     	switch	.text
1264  019a               f_USART1_RX_TIM5_CC_IRQHandler:
1268                     ; 446 }
1271  019a 80            	iret
1294                     ; 453 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1294                     ; 454 {
1295                     	switch	.text
1296  019b               f_I2C1_SPI2_IRQHandler:
1300                     ; 458 }
1303  019b 80            	iret
1315                     	xref	_Delay
1316                     	xdef	f_I2C1_SPI2_IRQHandler
1317                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1318                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1319                     	xdef	f_SPI1_IRQHandler
1320                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1321                     	xdef	f_TIM1_CC_IRQHandler
1322                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1323                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1324                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1325                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1326                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1327                     	xdef	f_ADC1_COMP_IRQHandler
1328                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1329                     	xdef	f_LCD_AES_IRQHandler
1330                     	xdef	f_EXTI7_IRQHandler
1331                     	xdef	f_EXTI6_IRQHandler
1332                     	xdef	f_EXTI5_IRQHandler
1333                     	xdef	f_EXTI4_IRQHandler
1334                     	xdef	f_EXTI3_IRQHandler
1335                     	xdef	f_EXTI2_IRQHandler
1336                     	xdef	f_EXTI1_IRQHandler
1337                     	xdef	f_EXTI0_IRQHandler
1338                     	xdef	f_EXTID_H_IRQHandler
1339                     	xdef	f_EXTIB_G_IRQHandler
1340                     	xdef	f_EXTIE_F_PVD_IRQHandler
1341                     	xdef	f_RTC_CSSLSE_IRQHandler
1342                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1343                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1344                     	xdef	f_FLASH_IRQHandler
1345                     	xdef	f_TRAP_IRQHandler
1346                     	xdef	f_NonHandledInterrupt
1347                     	xref	_GPIO_ReadInputDataBit
1348                     	xref	_GPIO_ResetBits
1349                     	xref	_GPIO_SetBits
1350                     	xref	_EXTI_ClearITPendingBit
1351                     	xref.b	c_x
1352                     	xref.b	c_y
1371                     	end
