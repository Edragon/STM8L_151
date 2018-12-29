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
 450                     ; 206 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 450                     ; 207 {
 451                     	switch	.text
 452  000d               f_EXTI4_IRQHandler:
 456                     ; 211 }
 459  000d 80            	iret
 481                     ; 218 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 481                     ; 219 {
 482                     	switch	.text
 483  000e               f_EXTI5_IRQHandler:
 487                     ; 223 }
 490  000e 80            	iret
 512                     ; 230 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 512                     ; 231 {
 513                     	switch	.text
 514  000f               f_EXTI6_IRQHandler:
 518                     ; 235 }
 521  000f 80            	iret
 543                     ; 242 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 543                     ; 243 {
 544                     	switch	.text
 545  0010               f_EXTI7_IRQHandler:
 549                     ; 247 }
 552  0010 80            	iret
 574                     ; 253 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 574                     ; 254 {
 575                     	switch	.text
 576  0011               f_LCD_AES_IRQHandler:
 580                     ; 258 }
 583  0011 80            	iret
 606                     ; 264 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 606                     ; 265 {
 607                     	switch	.text
 608  0012               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 612                     ; 269 }
 615  0012 80            	iret
 638                     ; 276 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 638                     ; 277 {
 639                     	switch	.text
 640  0013               f_ADC1_COMP_IRQHandler:
 644                     ; 281 }
 647  0013 80            	iret
 671                     ; 288 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 671                     ; 289 {
 672                     	switch	.text
 673  0014               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 677                     ; 293 }
 680  0014 80            	iret
 703                     ; 300 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 703                     ; 301 {
 704                     	switch	.text
 705  0015               f_TIM2_CC_USART2_RX_IRQHandler:
 709                     ; 305 }
 712  0015 80            	iret
 736                     ; 313 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 736                     ; 314 {
 737                     	switch	.text
 738  0016               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 742                     ; 318 }
 745  0016 80            	iret
 768                     ; 324 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 768                     ; 325 {
 769                     	switch	.text
 770  0017               f_TIM3_CC_USART3_RX_IRQHandler:
 774                     ; 329 }
 777  0017 80            	iret
 800                     ; 335 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 800                     ; 336 {
 801                     	switch	.text
 802  0018               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 806                     ; 340 }
 809  0018 80            	iret
 831                     ; 346 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 831                     ; 347 {
 832                     	switch	.text
 833  0019               f_TIM1_CC_IRQHandler:
 837                     ; 351 }
 840  0019 80            	iret
 863                     ; 358 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 863                     ; 359 {
 864                     	switch	.text
 865  001a               f_TIM4_UPD_OVF_TRG_IRQHandler:
 869                     ; 363 }
 872  001a 80            	iret
 894                     ; 369 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 894                     ; 370 {
 895                     	switch	.text
 896  001b               f_SPI1_IRQHandler:
 900                     ; 374 }
 903  001b 80            	iret
 927                     ; 381 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 927                     ; 382 {
 928                     	switch	.text
 929  001c               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 933                     ; 386 }
 936  001c 80            	iret
 963                     ; 394 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
 963                     ; 395 {
 964                     	switch	.text
 965  001d               f_USART1_RX_TIM5_CC_IRQHandler:
 967  001d 8a            	push	cc
 968  001e 84            	pop	a
 969  001f a4bf          	and	a,#191
 970  0021 88            	push	a
 971  0022 86            	pop	cc
 972  0023 3b0002        	push	c_x+2
 973  0026 be00          	ldw	x,c_x
 974  0028 89            	pushw	x
 975  0029 3b0002        	push	c_y+2
 976  002c be00          	ldw	x,c_y
 977  002e 89            	pushw	x
 980                     ; 399 	  a=(USART_ReceiveData8 (USART1));
 982  002f ae5230        	ldw	x,#21040
 983  0032 cd0000        	call	_USART_ReceiveData8
 985  0035 b700          	ld	_a,a
 987  0037               L573:
 988                     ; 400     while(USART_GetFlagStatus(USART1,USART_FLAG_TXE)==0);
 990  0037 ae0080        	ldw	x,#128
 991  003a 89            	pushw	x
 992  003b ae5230        	ldw	x,#21040
 993  003e cd0000        	call	_USART_GetFlagStatus
 995  0041 85            	popw	x
 996  0042 4d            	tnz	a
 997  0043 27f2          	jreq	L573
 998                     ; 401     USART_SendData8(USART1,a); 
1000  0045 3b0000        	push	_a
1001  0048 ae5230        	ldw	x,#21040
1002  004b cd0000        	call	_USART_SendData8
1004  004e 84            	pop	a
1005                     ; 402 }
1008  004f 85            	popw	x
1009  0050 bf00          	ldw	c_y,x
1010  0052 320002        	pop	c_y+2
1011  0055 85            	popw	x
1012  0056 bf00          	ldw	c_x,x
1013  0058 320002        	pop	c_x+2
1014  005b 80            	iret
1037                     ; 409 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1037                     ; 410 {
1038                     	switch	.text
1039  005c               f_I2C1_SPI2_IRQHandler:
1043                     ; 414 }
1046  005c 80            	iret
1069                     	switch	.ubsct
1070  0000               _a:
1071  0000 00            	ds.b	1
1072                     	xdef	_a
1073                     	xdef	f_I2C1_SPI2_IRQHandler
1074                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1075                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1076                     	xdef	f_SPI1_IRQHandler
1077                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1078                     	xdef	f_TIM1_CC_IRQHandler
1079                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1080                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1081                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1082                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1083                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1084                     	xdef	f_ADC1_COMP_IRQHandler
1085                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1086                     	xdef	f_LCD_AES_IRQHandler
1087                     	xdef	f_EXTI7_IRQHandler
1088                     	xdef	f_EXTI6_IRQHandler
1089                     	xdef	f_EXTI5_IRQHandler
1090                     	xdef	f_EXTI4_IRQHandler
1091                     	xdef	f_EXTI3_IRQHandler
1092                     	xdef	f_EXTI2_IRQHandler
1093                     	xdef	f_EXTI1_IRQHandler
1094                     	xdef	f_EXTI0_IRQHandler
1095                     	xdef	f_EXTID_H_IRQHandler
1096                     	xdef	f_EXTIB_G_IRQHandler
1097                     	xdef	f_EXTIE_F_PVD_IRQHandler
1098                     	xdef	f_RTC_CSSLSE_IRQHandler
1099                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1100                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1101                     	xdef	f_FLASH_IRQHandler
1102                     	xdef	f_TRAP_IRQHandler
1103                     	xdef	f_NonHandledInterrupt
1104                     	xref	_USART_GetFlagStatus
1105                     	xref	_USART_ReceiveData8
1106                     	xref	_USART_SendData8
1107                     	xref.b	c_x
1108                     	xref.b	c_y
1128                     	end
