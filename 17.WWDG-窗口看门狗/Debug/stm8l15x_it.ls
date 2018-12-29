   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  33                     ; 53 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  33                     ; 54 {
  34                     	switch	.text
  35  0000               f_NonHandledInterrupt:
  40                     ; 58 }
  43  0000 80            	iret
  65                     ; 68 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  65                     ; 69 {
  66                     	switch	.text
  67  0001               f_TRAP_IRQHandler:
  72                     ; 73 }
  75  0001 80            	iret
  97                     ; 79 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
  97                     ; 80 {
  98                     	switch	.text
  99  0002               f_FLASH_IRQHandler:
 104                     ; 84 }
 107  0002 80            	iret
 130                     ; 90 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 130                     ; 91 {
 131                     	switch	.text
 132  0003               f_DMA1_CHANNEL0_1_IRQHandler:
 137                     ; 95 }
 140  0003 80            	iret
 163                     ; 101 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 163                     ; 102 {
 164                     	switch	.text
 165  0004               f_DMA1_CHANNEL2_3_IRQHandler:
 170                     ; 106 }
 173  0004 80            	iret
 196                     ; 112 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 196                     ; 113 {
 197                     	switch	.text
 198  0005               f_RTC_CSSLSE_IRQHandler:
 203                     ; 117 }
 206  0005 80            	iret
 229                     ; 123 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 229                     ; 124 {
 230                     	switch	.text
 231  0006               f_EXTIE_F_PVD_IRQHandler:
 236                     ; 128 }
 239  0006 80            	iret
 261                     ; 135 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 261                     ; 136 {
 262                     	switch	.text
 263  0007               f_EXTIB_G_IRQHandler:
 268                     ; 140 }
 271  0007 80            	iret
 293                     ; 147 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 293                     ; 148 {
 294                     	switch	.text
 295  0008               f_EXTID_H_IRQHandler:
 300                     ; 152 }
 303  0008 80            	iret
 325                     ; 159 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 325                     ; 160 {
 326                     	switch	.text
 327  0009               f_EXTI0_IRQHandler:
 332                     ; 164 }
 335  0009 80            	iret
 357                     ; 171 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 357                     ; 172 {
 358                     	switch	.text
 359  000a               f_EXTI1_IRQHandler:
 364                     ; 176 }
 367  000a 80            	iret
 392                     ; 183 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 392                     ; 184 {
 393                     	switch	.text
 394  000b               f_EXTI2_IRQHandler:
 397  000b 3b0002        	push	c_x+2
 398  000e be00          	ldw	x,c_x
 399  0010 89            	pushw	x
 400  0011 3b0002        	push	c_y+2
 401  0014 be00          	ldw	x,c_y
 402  0016 89            	pushw	x
 405                     ; 188 		EXTI_ClearITPendingBit (EXTI_IT_Pin2);//清除中断标志
 407  0017 ae0004        	ldw	x,#4
 408  001a cd0000        	call	_EXTI_ClearITPendingBit
 410                     ; 189     GPIO_SetBits(GPIOB, GPIO_Pin_4);//底板LED熄灭
 412  001d 4b10          	push	#16
 413  001f ae5005        	ldw	x,#20485
 414  0022 cd0000        	call	_GPIO_SetBits
 416  0025 84            	pop	a
 417                     ; 190     AllowedRefresh = DISABLE;
 419  0026 3f00          	clr	_AllowedRefresh
 420                     ; 191 }
 423  0028 85            	popw	x
 424  0029 bf00          	ldw	c_y,x
 425  002b 320002        	pop	c_y+2
 426  002e 85            	popw	x
 427  002f bf00          	ldw	c_x,x
 428  0031 320002        	pop	c_x+2
 429  0034 80            	iret
 454                     ; 198 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 454                     ; 199 {
 455                     	switch	.text
 456  0035               f_EXTI3_IRQHandler:
 459  0035 3b0002        	push	c_x+2
 460  0038 be00          	ldw	x,c_x
 461  003a 89            	pushw	x
 462  003b 3b0002        	push	c_y+2
 463  003e be00          	ldw	x,c_y
 464  0040 89            	pushw	x
 467                     ; 203 		EXTI_ClearITPendingBit (EXTI_IT_Pin3);//清除中断标志
 469  0041 ae0008        	ldw	x,#8
 470  0044 cd0000        	call	_EXTI_ClearITPendingBit
 472                     ; 204     GPIO_SetBits(GPIOB, GPIO_Pin_4);//翻转LED端口电平
 474  0047 4b10          	push	#16
 475  0049 ae5005        	ldw	x,#20485
 476  004c cd0000        	call	_GPIO_SetBits
 478  004f 84            	pop	a
 479                     ; 205     NonAlowedRefresh = ENABLE;
 481  0050 35010000      	mov	_NonAlowedRefresh,#1
 482                     ; 206 }
 485  0054 85            	popw	x
 486  0055 bf00          	ldw	c_y,x
 487  0057 320002        	pop	c_y+2
 488  005a 85            	popw	x
 489  005b bf00          	ldw	c_x,x
 490  005d 320002        	pop	c_x+2
 491  0060 80            	iret
 513                     ; 213 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 513                     ; 214 {
 514                     	switch	.text
 515  0061               f_EXTI4_IRQHandler:
 520                     ; 218 }
 523  0061 80            	iret
 545                     ; 225 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 545                     ; 226 {
 546                     	switch	.text
 547  0062               f_EXTI5_IRQHandler:
 552                     ; 230 }
 555  0062 80            	iret
 577                     ; 237 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 577                     ; 238 {
 578                     	switch	.text
 579  0063               f_EXTI6_IRQHandler:
 584                     ; 242 }
 587  0063 80            	iret
 609                     ; 249 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 609                     ; 250 {
 610                     	switch	.text
 611  0064               f_EXTI7_IRQHandler:
 616                     ; 254 }
 619  0064 80            	iret
 641                     ; 260 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 641                     ; 261 {
 642                     	switch	.text
 643  0065               f_LCD_AES_IRQHandler:
 648                     ; 265 }
 651  0065 80            	iret
 674                     ; 271 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 674                     ; 272 {
 675                     	switch	.text
 676  0066               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 681                     ; 276 }
 684  0066 80            	iret
 707                     ; 283 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 707                     ; 284 {
 708                     	switch	.text
 709  0067               f_ADC1_COMP_IRQHandler:
 714                     ; 288 }
 717  0067 80            	iret
 741                     ; 295 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 741                     ; 296 {
 742                     	switch	.text
 743  0068               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 748                     ; 300 }
 751  0068 80            	iret
 774                     ; 307 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 774                     ; 308 {
 775                     	switch	.text
 776  0069               f_TIM2_CC_USART2_RX_IRQHandler:
 781                     ; 312 }
 784  0069 80            	iret
 808                     ; 320 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 808                     ; 321 {
 809                     	switch	.text
 810  006a               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 815                     ; 325 }
 818  006a 80            	iret
 841                     ; 331 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 841                     ; 332 {
 842                     	switch	.text
 843  006b               f_TIM3_CC_USART3_RX_IRQHandler:
 848                     ; 336 }
 851  006b 80            	iret
 874                     ; 342 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 874                     ; 343 {
 875                     	switch	.text
 876  006c               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 881                     ; 347 }
 884  006c 80            	iret
 906                     ; 353 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 906                     ; 354 {
 907                     	switch	.text
 908  006d               f_TIM1_CC_IRQHandler:
 913                     ; 358 }
 916  006d 80            	iret
 939                     ; 365 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 939                     ; 366 {
 940                     	switch	.text
 941  006e               f_TIM4_UPD_OVF_TRG_IRQHandler:
 946                     ; 370 }
 949  006e 80            	iret
 971                     ; 376 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 971                     ; 377 {
 972                     	switch	.text
 973  006f               f_SPI1_IRQHandler:
 978                     ; 381 }
 981  006f 80            	iret
1005                     ; 388 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
1005                     ; 389 {
1006                     	switch	.text
1007  0070               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
1012                     ; 393 }
1015  0070 80            	iret
1038                     ; 400 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1038                     ; 401 {
1039                     	switch	.text
1040  0071               f_USART1_RX_TIM5_CC_IRQHandler:
1045                     ; 405 }
1048  0071 80            	iret
1071                     ; 412 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1071                     ; 413 {
1072                     	switch	.text
1073  0072               f_I2C1_SPI2_IRQHandler:
1078                     ; 417 }
1081  0072 80            	iret
1093                     	xref.b	_AllowedRefresh
1094                     	xref.b	_NonAlowedRefresh
1095                     	xdef	f_I2C1_SPI2_IRQHandler
1096                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1097                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1098                     	xdef	f_SPI1_IRQHandler
1099                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1100                     	xdef	f_TIM1_CC_IRQHandler
1101                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1102                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1103                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1104                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1105                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1106                     	xdef	f_ADC1_COMP_IRQHandler
1107                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1108                     	xdef	f_LCD_AES_IRQHandler
1109                     	xdef	f_EXTI7_IRQHandler
1110                     	xdef	f_EXTI6_IRQHandler
1111                     	xdef	f_EXTI5_IRQHandler
1112                     	xdef	f_EXTI4_IRQHandler
1113                     	xdef	f_EXTI3_IRQHandler
1114                     	xdef	f_EXTI2_IRQHandler
1115                     	xdef	f_EXTI1_IRQHandler
1116                     	xdef	f_EXTI0_IRQHandler
1117                     	xdef	f_EXTID_H_IRQHandler
1118                     	xdef	f_EXTIB_G_IRQHandler
1119                     	xdef	f_EXTIE_F_PVD_IRQHandler
1120                     	xdef	f_RTC_CSSLSE_IRQHandler
1121                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1122                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1123                     	xdef	f_FLASH_IRQHandler
1124                     	xdef	f_TRAP_IRQHandler
1125                     	xdef	f_NonHandledInterrupt
1126                     	xref	_GPIO_SetBits
1127                     	xref	_EXTI_ClearITPendingBit
1128                     	xref.b	c_x
1129                     	xref.b	c_y
1148                     	end
