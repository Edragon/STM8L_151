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
  72                     ; 72 }
  75  0001 80            	iret
  97                     ; 78 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
  97                     ; 79 {
  98                     	switch	.text
  99  0002               f_FLASH_IRQHandler:
 104                     ; 83 }
 107  0002 80            	iret
 130                     ; 89 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 130                     ; 90 {
 131                     	switch	.text
 132  0003               f_DMA1_CHANNEL0_1_IRQHandler:
 137                     ; 94 }
 140  0003 80            	iret
 163                     ; 100 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 163                     ; 101 {
 164                     	switch	.text
 165  0004               f_DMA1_CHANNEL2_3_IRQHandler:
 170                     ; 105 }
 173  0004 80            	iret
 196                     ; 111 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 196                     ; 112 {
 197                     	switch	.text
 198  0005               f_RTC_CSSLSE_IRQHandler:
 203                     ; 116 }
 206  0005 80            	iret
 229                     ; 122 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 229                     ; 123 {
 230                     	switch	.text
 231  0006               f_EXTIE_F_PVD_IRQHandler:
 236                     ; 127 }
 239  0006 80            	iret
 261                     ; 134 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 261                     ; 135 {
 262                     	switch	.text
 263  0007               f_EXTIB_G_IRQHandler:
 268                     ; 139 }
 271  0007 80            	iret
 293                     ; 146 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 293                     ; 147 {
 294                     	switch	.text
 295  0008               f_EXTID_H_IRQHandler:
 300                     ; 151 }
 303  0008 80            	iret
 325                     ; 158 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 325                     ; 159 {
 326                     	switch	.text
 327  0009               f_EXTI0_IRQHandler:
 332                     ; 163 }
 335  0009 80            	iret
 357                     ; 170 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 357                     ; 171 {
 358                     	switch	.text
 359  000a               f_EXTI1_IRQHandler:
 364                     ; 175 }
 367  000a 80            	iret
 389                     ; 182 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 389                     ; 183 {
 390                     	switch	.text
 391  000b               f_EXTI2_IRQHandler:
 396                     ; 187 }
 399  000b 80            	iret
 421                     ; 194 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 421                     ; 195 {
 422                     	switch	.text
 423  000c               f_EXTI3_IRQHandler:
 428                     ; 199 }
 431  000c 80            	iret
 455                     ; 206 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 455                     ; 207 {
 456                     	switch	.text
 457  000d               f_EXTI4_IRQHandler:
 460  000d 3b0002        	push	c_x+2
 461  0010 be00          	ldw	x,c_x
 462  0012 89            	pushw	x
 463  0013 3b0002        	push	c_y+2
 464  0016 be00          	ldw	x,c_y
 465  0018 89            	pushw	x
 468                     ; 211 		EXTI_ClearITPendingBit (EXTI_IT_Pin4);
 470  0019 ae0010        	ldw	x,#16
 471  001c cd0000        	call	_EXTI_ClearITPendingBit
 473                     ; 212     GPIO_ToggleBits(GPIOC, GPIO_Pin_4);
 475  001f 4b10          	push	#16
 476  0021 ae500a        	ldw	x,#20490
 477  0024 cd0000        	call	_GPIO_ToggleBits
 479  0027 84            	pop	a
 480                     ; 213 }
 483  0028 85            	popw	x
 484  0029 bf00          	ldw	c_y,x
 485  002b 320002        	pop	c_y+2
 486  002e 85            	popw	x
 487  002f bf00          	ldw	c_x,x
 488  0031 320002        	pop	c_x+2
 489  0034 80            	iret
 511                     ; 220 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 511                     ; 221 {
 512                     	switch	.text
 513  0035               f_EXTI5_IRQHandler:
 518                     ; 225 }
 521  0035 80            	iret
 543                     ; 232 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 543                     ; 233 {
 544                     	switch	.text
 545  0036               f_EXTI6_IRQHandler:
 550                     ; 237 }
 553  0036 80            	iret
 575                     ; 244 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 575                     ; 245 {
 576                     	switch	.text
 577  0037               f_EXTI7_IRQHandler:
 582                     ; 249 }
 585  0037 80            	iret
 607                     ; 255 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 607                     ; 256 {
 608                     	switch	.text
 609  0038               f_LCD_AES_IRQHandler:
 614                     ; 260 }
 617  0038 80            	iret
 640                     ; 266 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 640                     ; 267 {
 641                     	switch	.text
 642  0039               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 647                     ; 271 }
 650  0039 80            	iret
 673                     ; 278 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 673                     ; 279 {
 674                     	switch	.text
 675  003a               f_ADC1_COMP_IRQHandler:
 680                     ; 283 }
 683  003a 80            	iret
 707                     ; 290 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 707                     ; 291 {
 708                     	switch	.text
 709  003b               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 714                     ; 295 }
 717  003b 80            	iret
 740                     ; 302 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 740                     ; 303 {
 741                     	switch	.text
 742  003c               f_TIM2_CC_USART2_RX_IRQHandler:
 747                     ; 307 }
 750  003c 80            	iret
 774                     ; 315 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 774                     ; 316 {
 775                     	switch	.text
 776  003d               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 781                     ; 320 }
 784  003d 80            	iret
 807                     ; 326 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 807                     ; 327 {
 808                     	switch	.text
 809  003e               f_TIM3_CC_USART3_RX_IRQHandler:
 814                     ; 331 }
 817  003e 80            	iret
 840                     ; 337 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 840                     ; 338 {
 841                     	switch	.text
 842  003f               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 847                     ; 342 }
 850  003f 80            	iret
 872                     ; 348 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 872                     ; 349 {
 873                     	switch	.text
 874  0040               f_TIM1_CC_IRQHandler:
 879                     ; 353 }
 882  0040 80            	iret
 905                     ; 360 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 905                     ; 361 {
 906                     	switch	.text
 907  0041               f_TIM4_UPD_OVF_TRG_IRQHandler:
 912                     ; 365 }
 915  0041 80            	iret
 937                     ; 371 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 937                     ; 372 {
 938                     	switch	.text
 939  0042               f_SPI1_IRQHandler:
 944                     ; 376 }
 947  0042 80            	iret
 971                     ; 383 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 971                     ; 384 {
 972                     	switch	.text
 973  0043               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 978                     ; 388 }
 981  0043 80            	iret
1004                     ; 395 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1004                     ; 396 {
1005                     	switch	.text
1006  0044               f_USART1_RX_TIM5_CC_IRQHandler:
1011                     ; 400 }
1014  0044 80            	iret
1037                     ; 407 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1037                     ; 408 {
1038                     	switch	.text
1039  0045               f_I2C1_SPI2_IRQHandler:
1044                     ; 412 }
1047  0045 80            	iret
1059                     	xdef	f_I2C1_SPI2_IRQHandler
1060                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1061                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1062                     	xdef	f_SPI1_IRQHandler
1063                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1064                     	xdef	f_TIM1_CC_IRQHandler
1065                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1066                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1067                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1068                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1069                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1070                     	xdef	f_ADC1_COMP_IRQHandler
1071                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1072                     	xdef	f_LCD_AES_IRQHandler
1073                     	xdef	f_EXTI7_IRQHandler
1074                     	xdef	f_EXTI6_IRQHandler
1075                     	xdef	f_EXTI5_IRQHandler
1076                     	xdef	f_EXTI4_IRQHandler
1077                     	xdef	f_EXTI3_IRQHandler
1078                     	xdef	f_EXTI2_IRQHandler
1079                     	xdef	f_EXTI1_IRQHandler
1080                     	xdef	f_EXTI0_IRQHandler
1081                     	xdef	f_EXTID_H_IRQHandler
1082                     	xdef	f_EXTIB_G_IRQHandler
1083                     	xdef	f_EXTIE_F_PVD_IRQHandler
1084                     	xdef	f_RTC_CSSLSE_IRQHandler
1085                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1086                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1087                     	xdef	f_FLASH_IRQHandler
1088                     	xdef	f_TRAP_IRQHandler
1089                     	xdef	f_NonHandledInterrupt
1090                     	xref	_GPIO_ToggleBits
1091                     	xref	_EXTI_ClearITPendingBit
1092                     	xref.b	c_x
1093                     	xref.b	c_y
1112                     	end
