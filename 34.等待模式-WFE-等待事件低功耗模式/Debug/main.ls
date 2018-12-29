   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  53                     ; 25 void Delay(__IO uint16_t nCount)
  53                     ; 26 {
  55                     	switch	.text
  56  0000               _Delay:
  58  0000 89            	pushw	x
  59       00000000      OFST:	set	0
  62  0001 2007          	jra	L13
  63  0003               L72:
  64                     ; 30         nCount--;
  66  0003 1e01          	ldw	x,(OFST+1,sp)
  67  0005 1d0001        	subw	x,#1
  68  0008 1f01          	ldw	(OFST+1,sp),x
  69  000a               L13:
  70                     ; 28     while (nCount != 0)
  72  000a 1e01          	ldw	x,(OFST+1,sp)
  73  000c 26f5          	jrne	L72
  74                     ; 32 }
  77  000e 85            	popw	x
  78  000f 81            	ret
 105                     ; 39 void CLK_Config(void)
 105                     ; 40 {
 106                     	switch	.text
 107  0010               _CLK_Config:
 111                     ; 42   CLK_SYSCLKSourceSwitchCmd(ENABLE);//使能时钟切换
 113  0010 a601          	ld	a,#1
 114  0012 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 116                     ; 43   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);//选择内部低速时钟作为时钟源
 118  0015 a602          	ld	a,#2
 119  0017 cd0000        	call	_CLK_SYSCLKSourceConfig
 121                     ; 45   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//设置系统时钟分频
 123  001a 4f            	clr	a
 124  001b cd0000        	call	_CLK_SYSCLKDivConfig
 127  001e               L74:
 128                     ; 46   while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_LSI);//等待时钟稳定
 130  001e cd0000        	call	_CLK_GetSYSCLKSource
 132  0021 a102          	cp	a,#2
 133  0023 26f9          	jrne	L74
 134                     ; 47 }
 137  0025 81            	ret
 169                     ; 59 void main(void)
 169                     ; 60 {
 170                     	switch	.text
 171  0026               _main:
 175                     ; 61 		CLK_Config();//切换LSI为主时钟
 177  0026 ade8          	call	_CLK_Config
 179                     ; 63     GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 181  0028 4bc0          	push	#192
 182  002a 4bff          	push	#255
 183  002c ae5000        	ldw	x,#20480
 184  002f cd0000        	call	_GPIO_Init
 186  0032 85            	popw	x
 187                     ; 64     GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 189  0033 4bc0          	push	#192
 190  0035 4bff          	push	#255
 191  0037 ae5005        	ldw	x,#20485
 192  003a cd0000        	call	_GPIO_Init
 194  003d 85            	popw	x
 195                     ; 65     GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 197  003e 4bc0          	push	#192
 198  0040 4bff          	push	#255
 199  0042 ae500a        	ldw	x,#20490
 200  0045 cd0000        	call	_GPIO_Init
 202  0048 85            	popw	x
 203                     ; 66     GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 205  0049 4bc0          	push	#192
 206  004b 4bff          	push	#255
 207  004d ae500f        	ldw	x,#20495
 208  0050 cd0000        	call	_GPIO_Init
 210  0053 85            	popw	x
 211                     ; 69     GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO初始化
 213  0054 4bc0          	push	#192
 214  0056 4b10          	push	#16
 215  0058 ae500a        	ldw	x,#20490
 216  005b cd0000        	call	_GPIO_Init
 218  005e 85            	popw	x
 219                     ; 70     GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，GPD4带上拉带中断输入
 221  005f 4b60          	push	#96
 222  0061 4b10          	push	#16
 223  0063 ae500f        	ldw	x,#20495
 224  0066 cd0000        	call	_GPIO_Init
 226  0069 85            	popw	x
 227                     ; 72     EXTI_SetPinSensitivity(EXTI_Pin_4,EXTI_Trigger_Falling);//外部中断4下降沿触发
 229  006a ae1002        	ldw	x,#4098
 230  006d cd0000        	call	_EXTI_SetPinSensitivity
 232                     ; 74     WFE_DeInit ();
 234  0070 cd0000        	call	_WFE_DeInit
 236                     ; 75     WFE_WakeUpSourceEventCmd (WFE_Source_EXTI_EV4,ENABLE);//指定外部中断4为等待的事件，WFE时不进入中断响应函数
 238  0073 4b01          	push	#1
 239  0075 ae0201        	ldw	x,#513
 240  0078 cd0000        	call	_WFE_WakeUpSourceEventCmd
 242  007b 84            	pop	a
 243  007c               L36:
 244                     ; 81         EXTI_ClearITPendingBit (EXTI_IT_Pin4);//清中断标志
 246  007c ae0010        	ldw	x,#16
 247  007f cd0000        	call	_EXTI_ClearITPendingBit
 249                     ; 82         GPIO_ToggleBits(LED1_PORT, (GPIO_Pin_TypeDef)LED1_PINS);//翻转LED端口电平
 251  0082 4b10          	push	#16
 252  0084 ae500a        	ldw	x,#20490
 253  0087 cd0000        	call	_GPIO_ToggleBits
 255  008a 84            	pop	a
 256                     ; 83         Delay(0x00FF);
 258  008b ae00ff        	ldw	x,#255
 259  008e cd0000        	call	_Delay
 261                     ; 85         wfe();//进入WFE模式
 264  0091 728f          wfe
 268  0093 20e7          	jra	L36
 281                     	xdef	_main
 282                     	xdef	_CLK_Config
 283                     	xdef	_Delay
 284                     	xref	_WFE_WakeUpSourceEventCmd
 285                     	xref	_WFE_DeInit
 286                     	xref	_GPIO_ToggleBits
 287                     	xref	_GPIO_Init
 288                     	xref	_EXTI_ClearITPendingBit
 289                     	xref	_EXTI_SetPinSensitivity
 290                     	xref	_CLK_SYSCLKSourceSwitchCmd
 291                     	xref	_CLK_SYSCLKDivConfig
 292                     	xref	_CLK_GetSYSCLKSource
 293                     	xref	_CLK_SYSCLKSourceConfig
 312                     	end
