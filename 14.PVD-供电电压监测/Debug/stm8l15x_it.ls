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
 231                     ; 122 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 231                     ; 123 {
 232                     	switch	.text
 233  0006               f_EXTIE_F_PVD_IRQHandler:
 236  0006 3b0002        	push	c_x+2
 237  0009 be00          	ldw	x,c_x
 238  000b 89            	pushw	x
 239  000c 3b0002        	push	c_y+2
 240  000f be00          	ldw	x,c_y
 241  0011 89            	pushw	x
 244                     ; 127 	PWR_PVDClearITPendingBit();
 246  0012 cd0000        	call	_PWR_PVDClearITPendingBit
 248                     ; 128   GPIO_ResetBits (GPIOD,GPIO_Pin_4);
 250  0015 4b10          	push	#16
 251  0017 ae500f        	ldw	x,#20495
 252  001a cd0000        	call	_GPIO_ResetBits
 254  001d 84            	pop	a
 255                     ; 129 }
 258  001e 85            	popw	x
 259  001f bf00          	ldw	c_y,x
 260  0021 320002        	pop	c_y+2
 261  0024 85            	popw	x
 262  0025 bf00          	ldw	c_x,x
 263  0027 320002        	pop	c_x+2
 264  002a 80            	iret
 286                     ; 136 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 286                     ; 137 {
 287                     	switch	.text
 288  002b               f_EXTIB_G_IRQHandler:
 293                     ; 141 }
 296  002b 80            	iret
 318                     ; 148 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 318                     ; 149 {
 319                     	switch	.text
 320  002c               f_EXTID_H_IRQHandler:
 325                     ; 153 }
 328  002c 80            	iret
 350                     ; 160 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 350                     ; 161 {
 351                     	switch	.text
 352  002d               f_EXTI0_IRQHandler:
 357                     ; 165 }
 360  002d 80            	iret
 382                     ; 172 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 382                     ; 173 {
 383                     	switch	.text
 384  002e               f_EXTI1_IRQHandler:
 389                     ; 177 }
 392  002e 80            	iret
 414                     ; 184 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 414                     ; 185 {
 415                     	switch	.text
 416  002f               f_EXTI2_IRQHandler:
 421                     ; 189 }
 424  002f 80            	iret
 446                     ; 196 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 446                     ; 197 {
 447                     	switch	.text
 448  0030               f_EXTI3_IRQHandler:
 453                     ; 201 }
 456  0030 80            	iret
 478                     ; 208 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 478                     ; 209 {
 479                     	switch	.text
 480  0031               f_EXTI4_IRQHandler:
 485                     ; 213 }
 488  0031 80            	iret
 510                     ; 220 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 510                     ; 221 {
 511                     	switch	.text
 512  0032               f_EXTI5_IRQHandler:
 517                     ; 225 }
 520  0032 80            	iret
 542                     ; 232 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 542                     ; 233 {
 543                     	switch	.text
 544  0033               f_EXTI6_IRQHandler:
 549                     ; 237 }
 552  0033 80            	iret
 574                     ; 244 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 574                     ; 245 {
 575                     	switch	.text
 576  0034               f_EXTI7_IRQHandler:
 581                     ; 249 }
 584  0034 80            	iret
 606                     ; 255 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 606                     ; 256 {
 607                     	switch	.text
 608  0035               f_LCD_AES_IRQHandler:
 613                     ; 260 }
 616  0035 80            	iret
 639                     ; 266 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 639                     ; 267 {
 640                     	switch	.text
 641  0036               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 646                     ; 271 }
 649  0036 80            	iret
 672                     ; 278 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 672                     ; 279 {
 673                     	switch	.text
 674  0037               f_ADC1_COMP_IRQHandler:
 679                     ; 283 }
 682  0037 80            	iret
 706                     ; 290 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 706                     ; 291 {
 707                     	switch	.text
 708  0038               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 713                     ; 295 }
 716  0038 80            	iret
 739                     ; 302 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 739                     ; 303 {
 740                     	switch	.text
 741  0039               f_TIM2_CC_USART2_RX_IRQHandler:
 746                     ; 307 }
 749  0039 80            	iret
 773                     ; 315 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 773                     ; 316 {
 774                     	switch	.text
 775  003a               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 780                     ; 320 }
 783  003a 80            	iret
 806                     ; 326 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 806                     ; 327 {
 807                     	switch	.text
 808  003b               f_TIM3_CC_USART3_RX_IRQHandler:
 813                     ; 331 }
 816  003b 80            	iret
 839                     ; 337 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 839                     ; 338 {
 840                     	switch	.text
 841  003c               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 846                     ; 342 }
 849  003c 80            	iret
 871                     ; 348 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 871                     ; 349 {
 872                     	switch	.text
 873  003d               f_TIM1_CC_IRQHandler:
 878                     ; 353 }
 881  003d 80            	iret
 904                     ; 360 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 904                     ; 361 {
 905                     	switch	.text
 906  003e               f_TIM4_UPD_OVF_TRG_IRQHandler:
 911                     ; 365 }
 914  003e 80            	iret
 936                     ; 371 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 936                     ; 372 {
 937                     	switch	.text
 938  003f               f_SPI1_IRQHandler:
 943                     ; 376 }
 946  003f 80            	iret
 970                     ; 383 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 970                     ; 384 {
 971                     	switch	.text
 972  0040               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 977                     ; 388 }
 980  0040 80            	iret
1003                     ; 395 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
1003                     ; 396 {
1004                     	switch	.text
1005  0041               f_USART1_RX_TIM5_CC_IRQHandler:
1010                     ; 400 }
1013  0041 80            	iret
1036                     ; 407 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1036                     ; 408 {
1037                     	switch	.text
1038  0042               f_I2C1_SPI2_IRQHandler:
1043                     ; 412 }
1046  0042 80            	iret
1058                     	xdef	f_I2C1_SPI2_IRQHandler
1059                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1060                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1061                     	xdef	f_SPI1_IRQHandler
1062                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1063                     	xdef	f_TIM1_CC_IRQHandler
1064                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1065                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1066                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1067                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1068                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1069                     	xdef	f_ADC1_COMP_IRQHandler
1070                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1071                     	xdef	f_LCD_AES_IRQHandler
1072                     	xdef	f_EXTI7_IRQHandler
1073                     	xdef	f_EXTI6_IRQHandler
1074                     	xdef	f_EXTI5_IRQHandler
1075                     	xdef	f_EXTI4_IRQHandler
1076                     	xdef	f_EXTI3_IRQHandler
1077                     	xdef	f_EXTI2_IRQHandler
1078                     	xdef	f_EXTI1_IRQHandler
1079                     	xdef	f_EXTI0_IRQHandler
1080                     	xdef	f_EXTID_H_IRQHandler
1081                     	xdef	f_EXTIB_G_IRQHandler
1082                     	xdef	f_EXTIE_F_PVD_IRQHandler
1083                     	xdef	f_RTC_CSSLSE_IRQHandler
1084                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1085                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1086                     	xdef	f_FLASH_IRQHandler
1087                     	xdef	f_TRAP_IRQHandler
1088                     	xdef	f_NonHandledInterrupt
1089                     	xref	_PWR_PVDClearITPendingBit
1090                     	xref	_GPIO_ResetBits
1091                     	xref.b	c_x
1092                     	xref.b	c_y
1111                     	end
