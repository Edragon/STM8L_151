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
 296                     ; 146 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 296                     ; 147 {
 297                     	switch	.text
 298  0008               f_EXTID_H_IRQHandler:
 301  0008 3b0002        	push	c_x+2
 302  000b be00          	ldw	x,c_x
 303  000d 89            	pushw	x
 304  000e 3b0002        	push	c_y+2
 305  0011 be00          	ldw	x,c_y
 306  0013 89            	pushw	x
 309                     ; 152 	if(GPIO_ReadInputDataBit(GPIOD,GPIO_Pin_4)==0)//判断按键1是否按下
 311  0014 4b10          	push	#16
 312  0016 ae500f        	ldw	x,#20495
 313  0019 cd0000        	call	_GPIO_ReadInputDataBit
 315  001c 5b01          	addw	sp,#1
 316  001e 4d            	tnz	a
 317  001f 260f          	jrne	L121
 318                     ; 154 	  GPIO_ToggleBits(GPIOC, GPIO_Pin_4);//翻转LED端口电平
 320  0021 4b10          	push	#16
 321  0023 ae500a        	ldw	x,#20490
 322  0026 cd0000        	call	_GPIO_ToggleBits
 324  0029 84            	pop	a
 325                     ; 155 		EXTI_ClearITPendingBit (EXTI_IT_PortD);//清除中断标志
 327  002a ae0102        	ldw	x,#258
 328  002d cd0000        	call	_EXTI_ClearITPendingBit
 330  0030               L121:
 331                     ; 157 }
 334  0030 85            	popw	x
 335  0031 bf00          	ldw	c_y,x
 336  0033 320002        	pop	c_y+2
 337  0036 85            	popw	x
 338  0037 bf00          	ldw	c_x,x
 339  0039 320002        	pop	c_x+2
 340  003c 80            	iret
 362                     ; 164 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 362                     ; 165 {
 363                     	switch	.text
 364  003d               f_EXTI0_IRQHandler:
 369                     ; 169 }
 372  003d 80            	iret
 394                     ; 176 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 394                     ; 177 {
 395                     	switch	.text
 396  003e               f_EXTI1_IRQHandler:
 401                     ; 181 }
 404  003e 80            	iret
 426                     ; 188 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 426                     ; 189 {
 427                     	switch	.text
 428  003f               f_EXTI2_IRQHandler:
 433                     ; 193 }
 436  003f 80            	iret
 458                     ; 200 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 458                     ; 201 {
 459                     	switch	.text
 460  0040               f_EXTI3_IRQHandler:
 465                     ; 205 }
 468  0040 80            	iret
 492                     ; 212 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 492                     ; 213 {
 493                     	switch	.text
 494  0041               f_EXTI4_IRQHandler:
 497  0041 3b0002        	push	c_x+2
 498  0044 be00          	ldw	x,c_x
 499  0046 89            	pushw	x
 500  0047 3b0002        	push	c_y+2
 501  004a be00          	ldw	x,c_y
 502  004c 89            	pushw	x
 505                     ; 217 		EXTI_ClearITPendingBit (EXTI_IT_Pin4);
 507  004d ae0010        	ldw	x,#16
 508  0050 cd0000        	call	_EXTI_ClearITPendingBit
 510                     ; 218     GPIO_ToggleBits(GPIOC, GPIO_Pin_4);
 512  0053 4b10          	push	#16
 513  0055 ae500a        	ldw	x,#20490
 514  0058 cd0000        	call	_GPIO_ToggleBits
 516  005b 84            	pop	a
 517                     ; 219 }
 520  005c 85            	popw	x
 521  005d bf00          	ldw	c_y,x
 522  005f 320002        	pop	c_y+2
 523  0062 85            	popw	x
 524  0063 bf00          	ldw	c_x,x
 525  0065 320002        	pop	c_x+2
 526  0068 80            	iret
 548                     ; 226 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 548                     ; 227 {
 549                     	switch	.text
 550  0069               f_EXTI5_IRQHandler:
 555                     ; 231 }
 558  0069 80            	iret
 580                     ; 238 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 580                     ; 239 {
 581                     	switch	.text
 582  006a               f_EXTI6_IRQHandler:
 587                     ; 243 }
 590  006a 80            	iret
 612                     ; 250 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 612                     ; 251 {
 613                     	switch	.text
 614  006b               f_EXTI7_IRQHandler:
 619                     ; 255 }
 622  006b 80            	iret
 644                     ; 261 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 644                     ; 262 {
 645                     	switch	.text
 646  006c               f_LCD_AES_IRQHandler:
 651                     ; 266 }
 654  006c 80            	iret
 677                     ; 272 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 677                     ; 273 {
 678                     	switch	.text
 679  006d               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 684                     ; 277 }
 687  006d 80            	iret
 710                     ; 284 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 710                     ; 285 {
 711                     	switch	.text
 712  006e               f_ADC1_COMP_IRQHandler:
 717                     ; 289 }
 720  006e 80            	iret
 744                     ; 296 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 744                     ; 297 {
 745                     	switch	.text
 746  006f               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 751                     ; 301 }
 754  006f 80            	iret
 777                     ; 308 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 777                     ; 309 {
 778                     	switch	.text
 779  0070               f_TIM2_CC_USART2_RX_IRQHandler:
 784                     ; 313 }
 787  0070 80            	iret
 811                     ; 321 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 811                     ; 322 {
 812                     	switch	.text
 813  0071               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 818                     ; 326 }
 821  0071 80            	iret
 844                     ; 332 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 844                     ; 333 {
 845                     	switch	.text
 846  0072               f_TIM3_CC_USART3_RX_IRQHandler:
 851                     ; 337 }
 854  0072 80            	iret
 877                     ; 343 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 877                     ; 344 {
 878                     	switch	.text
 879  0073               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 884                     ; 348 }
 887  0073 80            	iret
 909                     ; 354 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 909                     ; 355 {
 910                     	switch	.text
 911  0074               f_TIM1_CC_IRQHandler:
 916                     ; 359 }
 919  0074 80            	iret
 942                     ; 366 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 942                     ; 367 {
 943                     	switch	.text
 944  0075               f_TIM4_UPD_OVF_TRG_IRQHandler:
 949                     ; 371 }
 952  0075 80            	iret
 974                     ; 377 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 974                     ; 378 {
 975                     	switch	.text
 976  0076               f_SPI1_IRQHandler:
 981                     ; 382 }
 984  0076 80            	iret
1008                     ; 389 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
1008                     ; 390 {
1009                     	switch	.text
1010  0077               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1015                     ; 394 }
1018  0077 80            	iret
1041                     ; 401 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1041                     ; 402 {
1042                     	switch	.text
1043  0078               f_USART1_RX_TIM5_CC_IRQHandler:
1048                     ; 406 }
1051  0078 80            	iret
1074                     ; 413 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1074                     ; 414 {
1075                     	switch	.text
1076  0079               f_I2C1_SPI2_IRQHandler:
1081                     ; 418 }
1084  0079 80            	iret
1096                     	xdef	f_I2C1_SPI2_IRQHandler
1097                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1098                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1099                     	xdef	f_SPI1_IRQHandler
1100                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1101                     	xdef	f_TIM1_CC_IRQHandler
1102                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1103                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1104                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1105                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1106                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1107                     	xdef	f_ADC1_COMP_IRQHandler
1108                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1109                     	xdef	f_LCD_AES_IRQHandler
1110                     	xdef	f_EXTI7_IRQHandler
1111                     	xdef	f_EXTI6_IRQHandler
1112                     	xdef	f_EXTI5_IRQHandler
1113                     	xdef	f_EXTI4_IRQHandler
1114                     	xdef	f_EXTI3_IRQHandler
1115                     	xdef	f_EXTI2_IRQHandler
1116                     	xdef	f_EXTI1_IRQHandler
1117                     	xdef	f_EXTI0_IRQHandler
1118                     	xdef	f_EXTID_H_IRQHandler
1119                     	xdef	f_EXTIB_G_IRQHandler
1120                     	xdef	f_EXTIE_F_PVD_IRQHandler
1121                     	xdef	f_RTC_CSSLSE_IRQHandler
1122                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1123                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1124                     	xdef	f_FLASH_IRQHandler
1125                     	xdef	f_TRAP_IRQHandler
1126                     	xdef	f_NonHandledInterrupt
1127                     	xref	_GPIO_ReadInputDataBit
1128                     	xref	_GPIO_ToggleBits
1129                     	xref	_EXTI_ClearITPendingBit
1130                     	xref.b	c_x
1131                     	xref.b	c_y
1150                     	end
