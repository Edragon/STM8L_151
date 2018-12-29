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
 451                     ; 206 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 451                     ; 207 {
 452                     	switch	.text
 453  000d               f_EXTI4_IRQHandler:
 455  000d 8a            	push	cc
 456  000e 84            	pop	a
 457  000f a4bf          	and	a,#191
 458  0011 88            	push	a
 459  0012 86            	pop	cc
 460  0013 3b0002        	push	c_x+2
 461  0016 be00          	ldw	x,c_x
 462  0018 89            	pushw	x
 463  0019 3b0002        	push	c_y+2
 464  001c be00          	ldw	x,c_y
 465  001e 89            	pushw	x
 468                     ; 211 	EXTI_ClearITPendingBit (EXTI_IT_Pin4);//清除中断标志
 470  001f ae0010        	ldw	x,#16
 471  0022 cd0000        	call	_EXTI_ClearITPendingBit
 473                     ; 212 }
 476  0025 85            	popw	x
 477  0026 bf00          	ldw	c_y,x
 478  0028 320002        	pop	c_y+2
 479  002b 85            	popw	x
 480  002c bf00          	ldw	c_x,x
 481  002e 320002        	pop	c_x+2
 482  0031 80            	iret
 504                     ; 219 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 504                     ; 220 {
 505                     	switch	.text
 506  0032               f_EXTI5_IRQHandler:
 510                     ; 224 }
 513  0032 80            	iret
 535                     ; 231 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 535                     ; 232 {
 536                     	switch	.text
 537  0033               f_EXTI6_IRQHandler:
 541                     ; 236 }
 544  0033 80            	iret
 566                     ; 243 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 566                     ; 244 {
 567                     	switch	.text
 568  0034               f_EXTI7_IRQHandler:
 572                     ; 248 }
 575  0034 80            	iret
 597                     ; 254 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 597                     ; 255 {
 598                     	switch	.text
 599  0035               f_LCD_AES_IRQHandler:
 603                     ; 259 }
 606  0035 80            	iret
 629                     ; 265 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 629                     ; 266 {
 630                     	switch	.text
 631  0036               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 635                     ; 270 }
 638  0036 80            	iret
 661                     ; 277 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 661                     ; 278 {
 662                     	switch	.text
 663  0037               f_ADC1_COMP_IRQHandler:
 667                     ; 282 }
 670  0037 80            	iret
 694                     ; 289 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 694                     ; 290 {
 695                     	switch	.text
 696  0038               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 700                     ; 294 }
 703  0038 80            	iret
 726                     ; 301 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 726                     ; 302 {
 727                     	switch	.text
 728  0039               f_TIM2_CC_USART2_RX_IRQHandler:
 732                     ; 306 }
 735  0039 80            	iret
 759                     ; 314 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 759                     ; 315 {
 760                     	switch	.text
 761  003a               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 765                     ; 319 }
 768  003a 80            	iret
 791                     ; 325 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 791                     ; 326 {
 792                     	switch	.text
 793  003b               f_TIM3_CC_USART3_RX_IRQHandler:
 797                     ; 330 }
 800  003b 80            	iret
 823                     ; 336 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 823                     ; 337 {
 824                     	switch	.text
 825  003c               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 829                     ; 341 }
 832  003c 80            	iret
 854                     ; 347 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 854                     ; 348 {
 855                     	switch	.text
 856  003d               f_TIM1_CC_IRQHandler:
 860                     ; 352 }
 863  003d 80            	iret
 886                     ; 359 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 886                     ; 360 {
 887                     	switch	.text
 888  003e               f_TIM4_UPD_OVF_TRG_IRQHandler:
 892                     ; 364 }
 895  003e 80            	iret
 917                     ; 370 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 917                     ; 371 {
 918                     	switch	.text
 919  003f               f_SPI1_IRQHandler:
 923                     ; 375 }
 926  003f 80            	iret
 950                     ; 382 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 950                     ; 383 {
 951                     	switch	.text
 952  0040               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 956                     ; 387 }
 959  0040 80            	iret
 982                     ; 394 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
 982                     ; 395 {
 983                     	switch	.text
 984  0041               f_USART1_RX_TIM5_CC_IRQHandler:
 988                     ; 399 }
 991  0041 80            	iret
1014                     ; 406 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1014                     ; 407 {
1015                     	switch	.text
1016  0042               f_I2C1_SPI2_IRQHandler:
1020                     ; 411 }
1023  0042 80            	iret
1035                     	xdef	f_I2C1_SPI2_IRQHandler
1036                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1037                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1038                     	xdef	f_SPI1_IRQHandler
1039                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1040                     	xdef	f_TIM1_CC_IRQHandler
1041                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1042                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1043                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1044                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1045                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1046                     	xdef	f_ADC1_COMP_IRQHandler
1047                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1048                     	xdef	f_LCD_AES_IRQHandler
1049                     	xdef	f_EXTI7_IRQHandler
1050                     	xdef	f_EXTI6_IRQHandler
1051                     	xdef	f_EXTI5_IRQHandler
1052                     	xdef	f_EXTI4_IRQHandler
1053                     	xdef	f_EXTI3_IRQHandler
1054                     	xdef	f_EXTI2_IRQHandler
1055                     	xdef	f_EXTI1_IRQHandler
1056                     	xdef	f_EXTI0_IRQHandler
1057                     	xdef	f_EXTID_H_IRQHandler
1058                     	xdef	f_EXTIB_G_IRQHandler
1059                     	xdef	f_EXTIE_F_PVD_IRQHandler
1060                     	xdef	f_RTC_CSSLSE_IRQHandler
1061                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1062                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1063                     	xdef	f_FLASH_IRQHandler
1064                     	xdef	f_TRAP_IRQHandler
1065                     	xdef	f_NonHandledInterrupt
1066                     	xref	_EXTI_ClearITPendingBit
1067                     	xref.b	c_x
1068                     	xref.b	c_y
1087                     	end
