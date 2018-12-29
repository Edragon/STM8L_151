   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  33                     ; 52 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  33                     ; 53 {
  34                     	switch	.text
  35  0000               f_NonHandledInterrupt:
  40                     ; 57 }
  43  0000 80            	iret
  65                     ; 67 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  65                     ; 68 {
  66                     	switch	.text
  67  0001               f_TRAP_IRQHandler:
  72  0001               L13:
  73  0001 20fe          	jra	L13
  95                     ; 80 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
  95                     ; 81 {
  96                     	switch	.text
  97  0003               f_FLASH_IRQHandler:
 102                     ; 85 }
 105  0003 80            	iret
 128                     ; 91 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 128                     ; 92 {
 129                     	switch	.text
 130  0004               f_DMA1_CHANNEL0_1_IRQHandler:
 135                     ; 96 }
 138  0004 80            	iret
 161                     ; 102 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 161                     ; 103 {
 162                     	switch	.text
 163  0005               f_DMA1_CHANNEL2_3_IRQHandler:
 168                     ; 107 }
 171  0005 80            	iret
 194                     ; 113 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 194                     ; 114 {
 195                     	switch	.text
 196  0006               f_RTC_CSSLSE_IRQHandler:
 201                     ; 118 }
 204  0006 80            	iret
 227                     ; 124 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 227                     ; 125 {
 228                     	switch	.text
 229  0007               f_EXTIE_F_PVD_IRQHandler:
 234                     ; 129 }
 237  0007 80            	iret
 259                     ; 136 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 259                     ; 137 {
 260                     	switch	.text
 261  0008               f_EXTIB_G_IRQHandler:
 266                     ; 141 }
 269  0008 80            	iret
 291                     ; 148 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 291                     ; 149 {
 292                     	switch	.text
 293  0009               f_EXTID_H_IRQHandler:
 298                     ; 153 }
 301  0009 80            	iret
 323                     ; 160 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 323                     ; 161 {
 324                     	switch	.text
 325  000a               f_EXTI0_IRQHandler:
 330                     ; 165 }
 333  000a 80            	iret
 355                     ; 172 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 355                     ; 173 {
 356                     	switch	.text
 357  000b               f_EXTI1_IRQHandler:
 362                     ; 177 }
 365  000b 80            	iret
 387                     ; 184 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 387                     ; 185 {
 388                     	switch	.text
 389  000c               f_EXTI2_IRQHandler:
 394                     ; 189 }
 397  000c 80            	iret
 419                     ; 196 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 419                     ; 197 {
 420                     	switch	.text
 421  000d               f_EXTI3_IRQHandler:
 426                     ; 201 }
 429  000d 80            	iret
 453                     ; 208 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 453                     ; 209 {
 454                     	switch	.text
 455  000e               f_EXTI4_IRQHandler:
 458  000e 3b0002        	push	c_x+2
 459  0011 be00          	ldw	x,c_x
 460  0013 89            	pushw	x
 461  0014 3b0002        	push	c_y+2
 462  0017 be00          	ldw	x,c_y
 463  0019 89            	pushw	x
 466                     ; 213 		EXTI_ClearITPendingBit(EXTI_IT_Pin4);
 468  001a ae0010        	ldw	x,#16
 469  001d cd0000        	call	_EXTI_ClearITPendingBit
 471                     ; 214     trap();
 474  0020 83            trap
 476                     ; 215 }
 480  0021 85            	popw	x
 481  0022 bf00          	ldw	c_y,x
 482  0024 320002        	pop	c_y+2
 483  0027 85            	popw	x
 484  0028 bf00          	ldw	c_x,x
 485  002a 320002        	pop	c_x+2
 486  002d 80            	iret
 508                     ; 222 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 508                     ; 223 {
 509                     	switch	.text
 510  002e               f_EXTI5_IRQHandler:
 515                     ; 227 }
 518  002e 80            	iret
 540                     ; 234 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 540                     ; 235 {
 541                     	switch	.text
 542  002f               f_EXTI6_IRQHandler:
 547                     ; 239 }
 550  002f 80            	iret
 572                     ; 246 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 572                     ; 247 {
 573                     	switch	.text
 574  0030               f_EXTI7_IRQHandler:
 579                     ; 251 }
 582  0030 80            	iret
 604                     ; 257 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 604                     ; 258 {
 605                     	switch	.text
 606  0031               f_LCD_AES_IRQHandler:
 611                     ; 262 }
 614  0031 80            	iret
 637                     ; 268 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 637                     ; 269 {
 638                     	switch	.text
 639  0032               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 644                     ; 273 }
 647  0032 80            	iret
 670                     ; 280 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 670                     ; 281 {
 671                     	switch	.text
 672  0033               f_ADC1_COMP_IRQHandler:
 677                     ; 285 }
 680  0033 80            	iret
 704                     ; 292 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 704                     ; 293 {
 705                     	switch	.text
 706  0034               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 711                     ; 297 }
 714  0034 80            	iret
 737                     ; 304 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 737                     ; 305 {
 738                     	switch	.text
 739  0035               f_TIM2_CC_USART2_RX_IRQHandler:
 744                     ; 309 }
 747  0035 80            	iret
 771                     ; 317 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 771                     ; 318 {
 772                     	switch	.text
 773  0036               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 778                     ; 322 }
 781  0036 80            	iret
 804                     ; 328 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 804                     ; 329 {
 805                     	switch	.text
 806  0037               f_TIM3_CC_USART3_RX_IRQHandler:
 811                     ; 333 }
 814  0037 80            	iret
 837                     ; 339 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 837                     ; 340 {
 838                     	switch	.text
 839  0038               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 844                     ; 344 }
 847  0038 80            	iret
 869                     ; 350 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 869                     ; 351 {
 870                     	switch	.text
 871  0039               f_TIM1_CC_IRQHandler:
 876                     ; 355 }
 879  0039 80            	iret
 902                     ; 362 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 902                     ; 363 {
 903                     	switch	.text
 904  003a               f_TIM4_UPD_OVF_TRG_IRQHandler:
 909                     ; 367 }
 912  003a 80            	iret
 934                     ; 373 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 934                     ; 374 {
 935                     	switch	.text
 936  003b               f_SPI1_IRQHandler:
 941                     ; 378 }
 944  003b 80            	iret
 968                     ; 385 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 968                     ; 386 {
 969                     	switch	.text
 970  003c               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 975                     ; 390 }
 978  003c 80            	iret
1001                     ; 397 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1001                     ; 398 {
1002                     	switch	.text
1003  003d               f_USART1_RX_TIM5_CC_IRQHandler:
1008                     ; 402 }
1011  003d 80            	iret
1034                     ; 409 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1034                     ; 410 {
1035                     	switch	.text
1036  003e               f_I2C1_SPI2_IRQHandler:
1041                     ; 414 }
1044  003e 80            	iret
1056                     	xdef	f_I2C1_SPI2_IRQHandler
1057                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1058                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1059                     	xdef	f_SPI1_IRQHandler
1060                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1061                     	xdef	f_TIM1_CC_IRQHandler
1062                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1063                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1064                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1065                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1066                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1067                     	xdef	f_ADC1_COMP_IRQHandler
1068                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1069                     	xdef	f_LCD_AES_IRQHandler
1070                     	xdef	f_EXTI7_IRQHandler
1071                     	xdef	f_EXTI6_IRQHandler
1072                     	xdef	f_EXTI5_IRQHandler
1073                     	xdef	f_EXTI4_IRQHandler
1074                     	xdef	f_EXTI3_IRQHandler
1075                     	xdef	f_EXTI2_IRQHandler
1076                     	xdef	f_EXTI1_IRQHandler
1077                     	xdef	f_EXTI0_IRQHandler
1078                     	xdef	f_EXTID_H_IRQHandler
1079                     	xdef	f_EXTIB_G_IRQHandler
1080                     	xdef	f_EXTIE_F_PVD_IRQHandler
1081                     	xdef	f_RTC_CSSLSE_IRQHandler
1082                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1083                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1084                     	xdef	f_FLASH_IRQHandler
1085                     	xdef	f_TRAP_IRQHandler
1086                     	xdef	f_NonHandledInterrupt
1087                     	xref	_EXTI_ClearITPendingBit
1088                     	xref.b	c_x
1089                     	xref.b	c_y
1108                     	end
