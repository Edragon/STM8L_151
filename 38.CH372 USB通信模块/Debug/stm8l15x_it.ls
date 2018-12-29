   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  43                     ; 54 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  43                     ; 55 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 59 }
  52  0000 80            	iret
  74                     ; 69 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 70 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 74 }
  83  0001 80            	iret
 105                     ; 80 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 105                     ; 81 {
 106                     	switch	.text
 107  0002               f_FLASH_IRQHandler:
 111                     ; 85 }
 114  0002 80            	iret
 137                     ; 91 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 137                     ; 92 {
 138                     	switch	.text
 139  0003               f_DMA1_CHANNEL0_1_IRQHandler:
 143                     ; 96 }
 146  0003 80            	iret
 169                     ; 102 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 169                     ; 103 {
 170                     	switch	.text
 171  0004               f_DMA1_CHANNEL2_3_IRQHandler:
 175                     ; 107 }
 178  0004 80            	iret
 201                     ; 113 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 201                     ; 114 {
 202                     	switch	.text
 203  0005               f_RTC_CSSLSE_IRQHandler:
 207                     ; 118 }
 210  0005 80            	iret
 233                     ; 124 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 233                     ; 125 {
 234                     	switch	.text
 235  0006               f_EXTIE_F_PVD_IRQHandler:
 239                     ; 129 }
 242  0006 80            	iret
 264                     ; 136 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 264                     ; 137 {
 265                     	switch	.text
 266  0007               f_EXTIB_G_IRQHandler:
 270                     ; 141 }
 273  0007 80            	iret
 295                     ; 148 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 295                     ; 149 {
 296                     	switch	.text
 297  0008               f_EXTID_H_IRQHandler:
 301                     ; 153 }
 304  0008 80            	iret
 326                     ; 160 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 326                     ; 161 {
 327                     	switch	.text
 328  0009               f_EXTI0_IRQHandler:
 332                     ; 165 }
 335  0009 80            	iret
 357                     ; 172 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 357                     ; 173 {
 358                     	switch	.text
 359  000a               f_EXTI1_IRQHandler:
 363                     ; 177 }
 366  000a 80            	iret
 388                     ; 184 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 388                     ; 185 {
 389                     	switch	.text
 390  000b               f_EXTI2_IRQHandler:
 394                     ; 189 }
 397  000b 80            	iret
 419                     ; 196 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 419                     ; 197 {
 420                     	switch	.text
 421  000c               f_EXTI3_IRQHandler:
 425                     ; 201 }
 428  000c 80            	iret
 495                     ; 208 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 495                     ; 209 {
 496                     	switch	.text
 497  000d               f_EXTI4_IRQHandler:
 499  000d 8a            	push	cc
 500  000e 84            	pop	a
 501  000f a4bf          	and	a,#191
 502  0011 88            	push	a
 503  0012 86            	pop	cc
 504       00000044      OFST:	set	68
 505  0013 3b0002        	push	c_x+2
 506  0016 be00          	ldw	x,c_x
 507  0018 89            	pushw	x
 508  0019 3b0002        	push	c_y+2
 509  001c be00          	ldw	x,c_y
 510  001e 89            	pushw	x
 511  001f 5244          	subw	sp,#68
 514                     ; 215  disableInterrupts();
 517  0021 9b            sim
 519                     ; 217     EXTI_ClearITPendingBit (EXTI_IT_Pin4);
 522  0022 ae0010        	ldw	x,#16
 523  0025 cd0000        	call	_EXTI_ClearITPendingBit
 525                     ; 219     CH372_WR_CMD(CMD_GET_STATUS);
 527  0028 a622          	ld	a,#34
 528  002a cd0000        	call	_CH372_WR_CMD
 530                     ; 220   temp=CH372_RD_DAT();
 532  002d cd0000        	call	_CH372_RD_DAT
 534  0030 6b43          	ld	(OFST-1,sp),a
 536                     ; 222   switch(temp)
 538  0032 7b43          	ld	a,(OFST-1,sp)
 540                     ; 244               break;
 541  0034 a002          	sub	a,#2
 542  0036 270b          	jreq	L161
 543  0038 a008          	sub	a,#8
 544  003a 2764          	jreq	L361
 545  003c               L561:
 546                     ; 242       default:
 546                     ; 243               CH372_WR_CMD(CMD_UNLOCK_USB);
 548  003c a623          	ld	a,#35
 549  003e cd0000        	call	_CH372_WR_CMD
 551                     ; 244               break;
 553  0041 2062          	jra	L322
 554  0043               L161:
 555                     ; 224       case USB_INT_EP2_OUT:
 555                     ; 225                           CH372_WR_CMD(CMD_RD_USB_DATA);
 557  0043 a628          	ld	a,#40
 558  0045 cd0000        	call	_CH372_WR_CMD
 560                     ; 226                           length=CH372_RD_DAT();
 562  0048 cd0000        	call	_CH372_RD_DAT
 564  004b 6b43          	ld	(OFST-1,sp),a
 566                     ; 227                           for(i=0;i<length;i++)
 568  004d 0f44          	clr	(OFST+0,sp)
 571  004f 2019          	jra	L132
 572  0051               L522:
 573                     ; 229                               buf[i]=CH372_RD_DAT();
 575  0051 96            	ldw	x,sp
 576  0052 1c0003        	addw	x,#OFST-65
 577  0055 1f01          	ldw	(OFST-67,sp),x
 579  0057 7b44          	ld	a,(OFST+0,sp)
 580  0059 5f            	clrw	x
 581  005a 4d            	tnz	a
 582  005b 2a01          	jrpl	L04
 583  005d 53            	cplw	x
 584  005e               L04:
 585  005e 97            	ld	xl,a
 586  005f 72fb01        	addw	x,(OFST-67,sp)
 587  0062 89            	pushw	x
 588  0063 cd0000        	call	_CH372_RD_DAT
 590  0066 85            	popw	x
 591  0067 f7            	ld	(x),a
 592                     ; 227                           for(i=0;i<length;i++)
 594  0068 0c44          	inc	(OFST+0,sp)
 596  006a               L132:
 599  006a 9c            	rvf
 600  006b 7b44          	ld	a,(OFST+0,sp)
 601  006d 1143          	cp	a,(OFST-1,sp)
 602  006f 2fe0          	jrslt	L522
 603                     ; 231                           CH372_WR_CMD(CMD_WR_USB_DATA7);
 605  0071 a62b          	ld	a,#43
 606  0073 cd0000        	call	_CH372_WR_CMD
 608                     ; 232                           CH372_WR_DAT(length);
 610  0076 7b43          	ld	a,(OFST-1,sp)
 611  0078 cd0000        	call	_CH372_WR_DAT
 613                     ; 233                           for(i=0;i<length;i++)
 615  007b 0f44          	clr	(OFST+0,sp)
 618  007d 2018          	jra	L142
 619  007f               L532:
 620                     ; 235                               CH372_WR_DAT(~buf[i]);
 622  007f 96            	ldw	x,sp
 623  0080 1c0003        	addw	x,#OFST-65
 624  0083 1f01          	ldw	(OFST-67,sp),x
 626  0085 7b44          	ld	a,(OFST+0,sp)
 627  0087 5f            	clrw	x
 628  0088 4d            	tnz	a
 629  0089 2a01          	jrpl	L24
 630  008b 53            	cplw	x
 631  008c               L24:
 632  008c 97            	ld	xl,a
 633  008d 72fb01        	addw	x,(OFST-67,sp)
 634  0090 f6            	ld	a,(x)
 635  0091 43            	cpl	a
 636  0092 cd0000        	call	_CH372_WR_DAT
 638                     ; 233                           for(i=0;i<length;i++)
 640  0095 0c44          	inc	(OFST+0,sp)
 642  0097               L142:
 645  0097 9c            	rvf
 646  0098 7b44          	ld	a,(OFST+0,sp)
 647  009a 1143          	cp	a,(OFST-1,sp)
 648  009c 2fe1          	jrslt	L532
 649                     ; 238                           break;
 651  009e 2005          	jra	L322
 652  00a0               L361:
 653                     ; 239       case USB_INT_EP2_IN:
 653                     ; 240                           CH372_WR_CMD(CMD_UNLOCK_USB);
 655  00a0 a623          	ld	a,#35
 656  00a2 cd0000        	call	_CH372_WR_CMD
 658                     ; 241                           break;
 660  00a5               L322:
 661                     ; 247   enableInterrupts();
 664  00a5 9a            rim
 666                     ; 248 }
 670  00a6 5b44          	addw	sp,#68
 671  00a8 85            	popw	x
 672  00a9 bf00          	ldw	c_y,x
 673  00ab 320002        	pop	c_y+2
 674  00ae 85            	popw	x
 675  00af bf00          	ldw	c_x,x
 676  00b1 320002        	pop	c_x+2
 677  00b4 80            	iret
 699                     ; 255 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 699                     ; 256 {
 700                     	switch	.text
 701  00b5               f_EXTI5_IRQHandler:
 705                     ; 260 }
 708  00b5 80            	iret
 730                     ; 267 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 730                     ; 268 {
 731                     	switch	.text
 732  00b6               f_EXTI6_IRQHandler:
 736                     ; 272 }
 739  00b6 80            	iret
 761                     ; 279 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 761                     ; 280 {
 762                     	switch	.text
 763  00b7               f_EXTI7_IRQHandler:
 767                     ; 284 }
 770  00b7 80            	iret
 792                     ; 290 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 792                     ; 291 {
 793                     	switch	.text
 794  00b8               f_LCD_AES_IRQHandler:
 798                     ; 295 }
 801  00b8 80            	iret
 824                     ; 301 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 824                     ; 302 {
 825                     	switch	.text
 826  00b9               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 830                     ; 306 }
 833  00b9 80            	iret
 856                     ; 313 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 856                     ; 314 {
 857                     	switch	.text
 858  00ba               f_ADC1_COMP_IRQHandler:
 862                     ; 318 }
 865  00ba 80            	iret
 889                     ; 325 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 889                     ; 326 {
 890                     	switch	.text
 891  00bb               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 895                     ; 330 }
 898  00bb 80            	iret
 921                     ; 337 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 921                     ; 338 {
 922                     	switch	.text
 923  00bc               f_TIM2_CC_USART2_RX_IRQHandler:
 927                     ; 342 }
 930  00bc 80            	iret
 954                     ; 350 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 954                     ; 351 {
 955                     	switch	.text
 956  00bd               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 960                     ; 355 }
 963  00bd 80            	iret
 986                     ; 361 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 986                     ; 362 {
 987                     	switch	.text
 988  00be               f_TIM3_CC_USART3_RX_IRQHandler:
 992                     ; 366 }
 995  00be 80            	iret
1018                     ; 372 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
1018                     ; 373 {
1019                     	switch	.text
1020  00bf               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
1024                     ; 377 }
1027  00bf 80            	iret
1049                     ; 383 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
1049                     ; 384 {
1050                     	switch	.text
1051  00c0               f_TIM1_CC_IRQHandler:
1055                     ; 388 }
1058  00c0 80            	iret
1081                     ; 395 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
1081                     ; 396 {
1082                     	switch	.text
1083  00c1               f_TIM4_UPD_OVF_TRG_IRQHandler:
1087                     ; 400 }
1090  00c1 80            	iret
1112                     ; 406 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
1112                     ; 407 {
1113                     	switch	.text
1114  00c2               f_SPI1_IRQHandler:
1118                     ; 411 }
1121  00c2 80            	iret
1145                     ; 418 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
1145                     ; 419 {
1146                     	switch	.text
1147  00c3               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1151                     ; 423 }
1154  00c3 80            	iret
1177                     ; 430 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1177                     ; 431 {
1178                     	switch	.text
1179  00c4               f_USART1_RX_TIM5_CC_IRQHandler:
1183                     ; 435 }
1186  00c4 80            	iret
1209                     ; 442 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1209                     ; 443 {
1210                     	switch	.text
1211  00c5               f_I2C1_SPI2_IRQHandler:
1215                     ; 447 }
1218  00c5 80            	iret
1230                     	xref	_CH372_WR_DAT
1231                     	xref	_CH372_RD_DAT
1232                     	xref	_CH372_WR_CMD
1233                     	xdef	f_I2C1_SPI2_IRQHandler
1234                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1235                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1236                     	xdef	f_SPI1_IRQHandler
1237                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1238                     	xdef	f_TIM1_CC_IRQHandler
1239                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1240                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1241                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1242                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1243                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1244                     	xdef	f_ADC1_COMP_IRQHandler
1245                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1246                     	xdef	f_LCD_AES_IRQHandler
1247                     	xdef	f_EXTI7_IRQHandler
1248                     	xdef	f_EXTI6_IRQHandler
1249                     	xdef	f_EXTI5_IRQHandler
1250                     	xdef	f_EXTI4_IRQHandler
1251                     	xdef	f_EXTI3_IRQHandler
1252                     	xdef	f_EXTI2_IRQHandler
1253                     	xdef	f_EXTI1_IRQHandler
1254                     	xdef	f_EXTI0_IRQHandler
1255                     	xdef	f_EXTID_H_IRQHandler
1256                     	xdef	f_EXTIB_G_IRQHandler
1257                     	xdef	f_EXTIE_F_PVD_IRQHandler
1258                     	xdef	f_RTC_CSSLSE_IRQHandler
1259                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1260                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1261                     	xdef	f_FLASH_IRQHandler
1262                     	xdef	f_TRAP_IRQHandler
1263                     	xdef	f_NonHandledInterrupt
1264                     	xref	_EXTI_ClearITPendingBit
1265                     	xref.b	c_x
1266                     	xref.b	c_y
1285                     	end
