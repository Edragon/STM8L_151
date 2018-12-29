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
 388                     ; 182 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 388                     ; 183 {
 389                     	switch	.text
 390  000b               f_EXTI2_IRQHandler:
 394                     ; 187 }
 397  000b 80            	iret
 419                     ; 194 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 419                     ; 195 {
 420                     	switch	.text
 421  000c               f_EXTI3_IRQHandler:
 425                     ; 199 }
 428  000c 80            	iret
 452                     ; 206 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 452                     ; 207 {
 453                     	switch	.text
 454  000d               f_EXTI4_IRQHandler:
 456  000d 8a            	push	cc
 457  000e 84            	pop	a
 458  000f a4bf          	and	a,#191
 459  0011 88            	push	a
 460  0012 86            	pop	cc
 461  0013 3b0002        	push	c_x+2
 462  0016 be00          	ldw	x,c_x
 463  0018 89            	pushw	x
 464  0019 3b0002        	push	c_y+2
 465  001c be00          	ldw	x,c_y
 466  001e 89            	pushw	x
 469                     ; 211 		EXTI_ClearITPendingBit (EXTI_IT_Pin4);
 471  001f ae0010        	ldw	x,#16
 472  0022 cd0000        	call	_EXTI_ClearITPendingBit
 474                     ; 212     GPIO_SetBits(GPIOC,GPIO_Pin_4);
 476  0025 4b10          	push	#16
 477  0027 ae500a        	ldw	x,#20490
 478  002a cd0000        	call	_GPIO_SetBits
 480  002d 84            	pop	a
 481                     ; 213 }
 484  002e 85            	popw	x
 485  002f bf00          	ldw	c_y,x
 486  0031 320002        	pop	c_y+2
 487  0034 85            	popw	x
 488  0035 bf00          	ldw	c_x,x
 489  0037 320002        	pop	c_x+2
 490  003a 80            	iret
 512                     ; 220 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 512                     ; 221 {
 513                     	switch	.text
 514  003b               f_EXTI5_IRQHandler:
 518                     ; 225 }
 521  003b 80            	iret
 543                     ; 232 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 543                     ; 233 {
 544                     	switch	.text
 545  003c               f_EXTI6_IRQHandler:
 549                     ; 237 }
 552  003c 80            	iret
 574                     ; 244 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 574                     ; 245 {
 575                     	switch	.text
 576  003d               f_EXTI7_IRQHandler:
 580                     ; 249 }
 583  003d 80            	iret
 605                     ; 255 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 605                     ; 256 {
 606                     	switch	.text
 607  003e               f_LCD_AES_IRQHandler:
 611                     ; 260 }
 614  003e 80            	iret
 637                     ; 266 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 637                     ; 267 {
 638                     	switch	.text
 639  003f               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 643                     ; 271 }
 646  003f 80            	iret
 669                     ; 278 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 669                     ; 279 {
 670                     	switch	.text
 671  0040               f_ADC1_COMP_IRQHandler:
 675                     ; 283 }
 678  0040 80            	iret
 702                     ; 290 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 702                     ; 291 {
 703                     	switch	.text
 704  0041               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 708                     ; 295 }
 711  0041 80            	iret
 734                     ; 302 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 734                     ; 303 {
 735                     	switch	.text
 736  0042               f_TIM2_CC_USART2_RX_IRQHandler:
 740                     ; 307 }
 743  0042 80            	iret
 767                     ; 315 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 767                     ; 316 {
 768                     	switch	.text
 769  0043               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 773                     ; 320 }
 776  0043 80            	iret
 799                     ; 326 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 799                     ; 327 {
 800                     	switch	.text
 801  0044               f_TIM3_CC_USART3_RX_IRQHandler:
 805                     ; 331 }
 808  0044 80            	iret
 831                     ; 337 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 831                     ; 338 {
 832                     	switch	.text
 833  0045               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 837                     ; 342 }
 840  0045 80            	iret
 862                     ; 348 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 862                     ; 349 {
 863                     	switch	.text
 864  0046               f_TIM1_CC_IRQHandler:
 868                     ; 353 }
 871  0046 80            	iret
 894                     ; 360 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 894                     ; 361 {
 895                     	switch	.text
 896  0047               f_TIM4_UPD_OVF_TRG_IRQHandler:
 900                     ; 365 }
 903  0047 80            	iret
 925                     ; 371 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 925                     ; 372 {
 926                     	switch	.text
 927  0048               f_SPI1_IRQHandler:
 931                     ; 376 }
 934  0048 80            	iret
 958                     ; 383 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 958                     ; 384 {
 959                     	switch	.text
 960  0049               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 964                     ; 388 }
 967  0049 80            	iret
 990                     ; 395 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
 990                     ; 396 {
 991                     	switch	.text
 992  004a               f_USART1_RX_TIM5_CC_IRQHandler:
 996                     ; 400 }
 999  004a 80            	iret
1022                     ; 407 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1022                     ; 408 {
1023                     	switch	.text
1024  004b               f_I2C1_SPI2_IRQHandler:
1028                     ; 412 }
1031  004b 80            	iret
1043                     	xdef	f_I2C1_SPI2_IRQHandler
1044                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1045                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1046                     	xdef	f_SPI1_IRQHandler
1047                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1048                     	xdef	f_TIM1_CC_IRQHandler
1049                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1050                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1051                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1052                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1053                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1054                     	xdef	f_ADC1_COMP_IRQHandler
1055                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1056                     	xdef	f_LCD_AES_IRQHandler
1057                     	xdef	f_EXTI7_IRQHandler
1058                     	xdef	f_EXTI6_IRQHandler
1059                     	xdef	f_EXTI5_IRQHandler
1060                     	xdef	f_EXTI4_IRQHandler
1061                     	xdef	f_EXTI3_IRQHandler
1062                     	xdef	f_EXTI2_IRQHandler
1063                     	xdef	f_EXTI1_IRQHandler
1064                     	xdef	f_EXTI0_IRQHandler
1065                     	xdef	f_EXTID_H_IRQHandler
1066                     	xdef	f_EXTIB_G_IRQHandler
1067                     	xdef	f_EXTIE_F_PVD_IRQHandler
1068                     	xdef	f_RTC_CSSLSE_IRQHandler
1069                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1070                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1071                     	xdef	f_FLASH_IRQHandler
1072                     	xdef	f_TRAP_IRQHandler
1073                     	xdef	f_NonHandledInterrupt
1074                     	xref	_GPIO_SetBits
1075                     	xref	_EXTI_ClearITPendingBit
1076                     	xref.b	c_x
1077                     	xref.b	c_y
1096                     	end
