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
 204                     ; 111 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 204                     ; 112 {
 205                     	switch	.text
 206  0005               f_RTC_CSSLSE_IRQHandler:
 208  0005 8a            	push	cc
 209  0006 84            	pop	a
 210  0007 a4bf          	and	a,#191
 211  0009 88            	push	a
 212  000a 86            	pop	cc
 213  000b 3b0002        	push	c_x+2
 214  000e be00          	ldw	x,c_x
 215  0010 89            	pushw	x
 216  0011 3b0002        	push	c_y+2
 217  0014 be00          	ldw	x,c_y
 218  0016 89            	pushw	x
 221                     ; 116 	 RTC_WakeUpCmd(DISABLE);
 223  0017 4f            	clr	a
 224  0018 cd0000        	call	_RTC_WakeUpCmd
 226                     ; 118    GPIO_ToggleBits(GPIOC,GPIO_Pin_4);//翻转LED亮灭状态
 228  001b 4b10          	push	#16
 229  001d ae500a        	ldw	x,#20490
 230  0020 cd0000        	call	_GPIO_ToggleBits
 232  0023 84            	pop	a
 233                     ; 119    RTC_ClearITPendingBit(RTC_IT_WUT);//清中断标志  
 235  0024 ae0040        	ldw	x,#64
 236  0027 cd0000        	call	_RTC_ClearITPendingBit
 238                     ; 121    RTC_WakeUpCmd(ENABLE);
 240  002a a601          	ld	a,#1
 241  002c cd0000        	call	_RTC_WakeUpCmd
 243                     ; 122 }
 246  002f 85            	popw	x
 247  0030 bf00          	ldw	c_y,x
 248  0032 320002        	pop	c_y+2
 249  0035 85            	popw	x
 250  0036 bf00          	ldw	c_x,x
 251  0038 320002        	pop	c_x+2
 252  003b 80            	iret
 275                     ; 128 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 275                     ; 129 {
 276                     	switch	.text
 277  003c               f_EXTIE_F_PVD_IRQHandler:
 281                     ; 133 }
 284  003c 80            	iret
 306                     ; 140 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 306                     ; 141 {
 307                     	switch	.text
 308  003d               f_EXTIB_G_IRQHandler:
 312                     ; 145 }
 315  003d 80            	iret
 337                     ; 152 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 337                     ; 153 {
 338                     	switch	.text
 339  003e               f_EXTID_H_IRQHandler:
 343                     ; 157 }
 346  003e 80            	iret
 368                     ; 164 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 368                     ; 165 {
 369                     	switch	.text
 370  003f               f_EXTI0_IRQHandler:
 374                     ; 169 }
 377  003f 80            	iret
 399                     ; 176 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 399                     ; 177 {
 400                     	switch	.text
 401  0040               f_EXTI1_IRQHandler:
 405                     ; 181 }
 408  0040 80            	iret
 430                     ; 188 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 430                     ; 189 {
 431                     	switch	.text
 432  0041               f_EXTI2_IRQHandler:
 436                     ; 193 }
 439  0041 80            	iret
 461                     ; 200 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 461                     ; 201 {
 462                     	switch	.text
 463  0042               f_EXTI3_IRQHandler:
 467                     ; 205 }
 470  0042 80            	iret
 492                     ; 212 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 492                     ; 213 {
 493                     	switch	.text
 494  0043               f_EXTI4_IRQHandler:
 498                     ; 217 }
 501  0043 80            	iret
 523                     ; 224 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 523                     ; 225 {
 524                     	switch	.text
 525  0044               f_EXTI5_IRQHandler:
 529                     ; 229 }
 532  0044 80            	iret
 554                     ; 236 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 554                     ; 237 {
 555                     	switch	.text
 556  0045               f_EXTI6_IRQHandler:
 560                     ; 241 }
 563  0045 80            	iret
 585                     ; 248 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 585                     ; 249 {
 586                     	switch	.text
 587  0046               f_EXTI7_IRQHandler:
 591                     ; 253 }
 594  0046 80            	iret
 616                     ; 259 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 616                     ; 260 {
 617                     	switch	.text
 618  0047               f_LCD_AES_IRQHandler:
 622                     ; 264 }
 625  0047 80            	iret
 648                     ; 270 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 648                     ; 271 {
 649                     	switch	.text
 650  0048               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 654                     ; 275 }
 657  0048 80            	iret
 680                     ; 282 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 680                     ; 283 {
 681                     	switch	.text
 682  0049               f_ADC1_COMP_IRQHandler:
 686                     ; 287 }
 689  0049 80            	iret
 713                     ; 294 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 713                     ; 295 {
 714                     	switch	.text
 715  004a               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 719                     ; 299 }
 722  004a 80            	iret
 745                     ; 306 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 745                     ; 307 {
 746                     	switch	.text
 747  004b               f_TIM2_CC_USART2_RX_IRQHandler:
 751                     ; 311 }
 754  004b 80            	iret
 778                     ; 319 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 778                     ; 320 {
 779                     	switch	.text
 780  004c               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 784                     ; 324 }
 787  004c 80            	iret
 810                     ; 330 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 810                     ; 331 {
 811                     	switch	.text
 812  004d               f_TIM3_CC_USART3_RX_IRQHandler:
 816                     ; 335 }
 819  004d 80            	iret
 842                     ; 341 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 842                     ; 342 {
 843                     	switch	.text
 844  004e               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 848                     ; 346 }
 851  004e 80            	iret
 873                     ; 352 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 873                     ; 353 {
 874                     	switch	.text
 875  004f               f_TIM1_CC_IRQHandler:
 879                     ; 357 }
 882  004f 80            	iret
 905                     ; 364 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 905                     ; 365 {
 906                     	switch	.text
 907  0050               f_TIM4_UPD_OVF_TRG_IRQHandler:
 911                     ; 369 }
 914  0050 80            	iret
 936                     ; 375 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 936                     ; 376 {
 937                     	switch	.text
 938  0051               f_SPI1_IRQHandler:
 942                     ; 380 }
 945  0051 80            	iret
 969                     ; 387 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 969                     ; 388 {
 970                     	switch	.text
 971  0052               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 975                     ; 392 }
 978  0052 80            	iret
1001                     ; 399 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1001                     ; 400 {
1002                     	switch	.text
1003  0053               f_USART1_RX_TIM5_CC_IRQHandler:
1007                     ; 404 }
1010  0053 80            	iret
1033                     ; 411 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1033                     ; 412 {
1034                     	switch	.text
1035  0054               f_I2C1_SPI2_IRQHandler:
1039                     ; 416 }
1042  0054 80            	iret
1054                     	xdef	f_I2C1_SPI2_IRQHandler
1055                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1056                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1057                     	xdef	f_SPI1_IRQHandler
1058                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1059                     	xdef	f_TIM1_CC_IRQHandler
1060                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1061                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1062                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1063                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1064                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1065                     	xdef	f_ADC1_COMP_IRQHandler
1066                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1067                     	xdef	f_LCD_AES_IRQHandler
1068                     	xdef	f_EXTI7_IRQHandler
1069                     	xdef	f_EXTI6_IRQHandler
1070                     	xdef	f_EXTI5_IRQHandler
1071                     	xdef	f_EXTI4_IRQHandler
1072                     	xdef	f_EXTI3_IRQHandler
1073                     	xdef	f_EXTI2_IRQHandler
1074                     	xdef	f_EXTI1_IRQHandler
1075                     	xdef	f_EXTI0_IRQHandler
1076                     	xdef	f_EXTID_H_IRQHandler
1077                     	xdef	f_EXTIB_G_IRQHandler
1078                     	xdef	f_EXTIE_F_PVD_IRQHandler
1079                     	xdef	f_RTC_CSSLSE_IRQHandler
1080                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1081                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1082                     	xdef	f_FLASH_IRQHandler
1083                     	xdef	f_TRAP_IRQHandler
1084                     	xdef	f_NonHandledInterrupt
1085                     	xref	_RTC_ClearITPendingBit
1086                     	xref	_RTC_WakeUpCmd
1087                     	xref	_GPIO_ToggleBits
1088                     	xref.b	c_x
1089                     	xref.b	c_y
1108                     	end
