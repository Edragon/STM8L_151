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
 467                     ; 206 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 467                     ; 207 {
 468                     	switch	.text
 469  000d               f_EXTI4_IRQHandler:
 472       00000002      OFST:	set	2
 473  000d 3b0002        	push	c_x+2
 474  0010 be00          	ldw	x,c_x
 475  0012 89            	pushw	x
 476  0013 3b0002        	push	c_y+2
 477  0016 be00          	ldw	x,c_y
 478  0018 89            	pushw	x
 479  0019 89            	pushw	x
 482                     ; 212     Jump_Function = (Function_Pointer) 0x9F00;
 484  001a ae9f00        	ldw	x,#40704
 485  001d 1f01          	ldw	(OFST-1,sp),x
 486                     ; 213     Jump_Function();
 488  001f cd9f00        	call	40704
 490                     ; 214     EXTI_ClearITPendingBit(EXTI_IT_Pin4);
 492  0022 ae0010        	ldw	x,#16
 493  0025 cd0000        	call	_EXTI_ClearITPendingBit
 495                     ; 215 }
 498  0028 5b02          	addw	sp,#2
 499  002a 85            	popw	x
 500  002b bf00          	ldw	c_y,x
 501  002d 320002        	pop	c_y+2
 502  0030 85            	popw	x
 503  0031 bf00          	ldw	c_x,x
 504  0033 320002        	pop	c_x+2
 505  0036 80            	iret
 527                     ; 222 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 527                     ; 223 {
 528                     	switch	.text
 529  0037               f_EXTI5_IRQHandler:
 534                     ; 227 }
 537  0037 80            	iret
 559                     ; 234 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 559                     ; 235 {
 560                     	switch	.text
 561  0038               f_EXTI6_IRQHandler:
 566                     ; 239 }
 569  0038 80            	iret
 591                     ; 246 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 591                     ; 247 {
 592                     	switch	.text
 593  0039               f_EXTI7_IRQHandler:
 598                     ; 251 }
 601  0039 80            	iret
 623                     ; 257 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 623                     ; 258 {
 624                     	switch	.text
 625  003a               f_LCD_AES_IRQHandler:
 630                     ; 262 }
 633  003a 80            	iret
 656                     ; 268 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 656                     ; 269 {
 657                     	switch	.text
 658  003b               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 663                     ; 273 }
 666  003b 80            	iret
 689                     ; 280 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 689                     ; 281 {
 690                     	switch	.text
 691  003c               f_ADC1_COMP_IRQHandler:
 696                     ; 285 }
 699  003c 80            	iret
 723                     ; 292 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 723                     ; 293 {
 724                     	switch	.text
 725  003d               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 730                     ; 297 }
 733  003d 80            	iret
 756                     ; 304 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 756                     ; 305 {
 757                     	switch	.text
 758  003e               f_TIM2_CC_USART2_RX_IRQHandler:
 763                     ; 309 }
 766  003e 80            	iret
 790                     ; 317 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 790                     ; 318 {
 791                     	switch	.text
 792  003f               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 797                     ; 322 }
 800  003f 80            	iret
 823                     ; 328 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 823                     ; 329 {
 824                     	switch	.text
 825  0040               f_TIM3_CC_USART3_RX_IRQHandler:
 830                     ; 333 }
 833  0040 80            	iret
 856                     ; 339 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 856                     ; 340 {
 857                     	switch	.text
 858  0041               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 863                     ; 344 }
 866  0041 80            	iret
 888                     ; 350 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 888                     ; 351 {
 889                     	switch	.text
 890  0042               f_TIM1_CC_IRQHandler:
 895                     ; 355 }
 898  0042 80            	iret
 921                     ; 362 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 921                     ; 363 {
 922                     	switch	.text
 923  0043               f_TIM4_UPD_OVF_TRG_IRQHandler:
 928                     ; 367 }
 931  0043 80            	iret
 953                     ; 373 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 953                     ; 374 {
 954                     	switch	.text
 955  0044               f_SPI1_IRQHandler:
 960                     ; 378 }
 963  0044 80            	iret
 987                     ; 385 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 987                     ; 386 {
 988                     	switch	.text
 989  0045               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 994                     ; 390 }
 997  0045 80            	iret
1020                     ; 397 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1020                     ; 398 {
1021                     	switch	.text
1022  0046               f_USART1_RX_TIM5_CC_IRQHandler:
1027                     ; 402 }
1030  0046 80            	iret
1053                     ; 409 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1053                     ; 410 {
1054                     	switch	.text
1055  0047               f_I2C1_SPI2_IRQHandler:
1060                     ; 414 }
1063  0047 80            	iret
1075                     	xdef	f_I2C1_SPI2_IRQHandler
1076                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1077                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1078                     	xdef	f_SPI1_IRQHandler
1079                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1080                     	xdef	f_TIM1_CC_IRQHandler
1081                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1082                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1083                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1084                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1085                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1086                     	xdef	f_ADC1_COMP_IRQHandler
1087                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1088                     	xdef	f_LCD_AES_IRQHandler
1089                     	xdef	f_EXTI7_IRQHandler
1090                     	xdef	f_EXTI6_IRQHandler
1091                     	xdef	f_EXTI5_IRQHandler
1092                     	xdef	f_EXTI4_IRQHandler
1093                     	xdef	f_EXTI3_IRQHandler
1094                     	xdef	f_EXTI2_IRQHandler
1095                     	xdef	f_EXTI1_IRQHandler
1096                     	xdef	f_EXTI0_IRQHandler
1097                     	xdef	f_EXTID_H_IRQHandler
1098                     	xdef	f_EXTIB_G_IRQHandler
1099                     	xdef	f_EXTIE_F_PVD_IRQHandler
1100                     	xdef	f_RTC_CSSLSE_IRQHandler
1101                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1102                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1103                     	xdef	f_FLASH_IRQHandler
1104                     	xdef	f_TRAP_IRQHandler
1105                     	xdef	f_NonHandledInterrupt
1106                     	xref	_EXTI_ClearITPendingBit
1107                     	xref.b	c_x
1108                     	xref.b	c_y
1127                     	end
