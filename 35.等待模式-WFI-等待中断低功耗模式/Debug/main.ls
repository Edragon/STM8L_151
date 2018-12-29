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
 166                     ; 59 void main(void)
 166                     ; 60 {
 167                     	switch	.text
 168  0026               _main:
 172                     ; 61 		CLK_Config();//切换LSI为主时钟
 174  0026 ade8          	call	_CLK_Config
 176                     ; 63     GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 178  0028 4bc0          	push	#192
 179  002a 4bff          	push	#255
 180  002c ae5000        	ldw	x,#20480
 181  002f cd0000        	call	_GPIO_Init
 183  0032 85            	popw	x
 184                     ; 64     GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 186  0033 4bc0          	push	#192
 187  0035 4bff          	push	#255
 188  0037 ae5005        	ldw	x,#20485
 189  003a cd0000        	call	_GPIO_Init
 191  003d 85            	popw	x
 192                     ; 65     GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 194  003e 4bc0          	push	#192
 195  0040 4bff          	push	#255
 196  0042 ae500a        	ldw	x,#20490
 197  0045 cd0000        	call	_GPIO_Init
 199  0048 85            	popw	x
 200                     ; 66     GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 202  0049 4bc0          	push	#192
 203  004b 4bff          	push	#255
 204  004d ae500f        	ldw	x,#20495
 205  0050 cd0000        	call	_GPIO_Init
 207  0053 85            	popw	x
 208                     ; 69     GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO初始化
 210  0054 4bc0          	push	#192
 211  0056 4b10          	push	#16
 212  0058 ae500a        	ldw	x,#20490
 213  005b cd0000        	call	_GPIO_Init
 215  005e 85            	popw	x
 216                     ; 70     GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，GPD4带上拉带中断输入
 218  005f 4b60          	push	#96
 219  0061 4b10          	push	#16
 220  0063 ae500f        	ldw	x,#20495
 221  0066 cd0000        	call	_GPIO_Init
 223  0069 85            	popw	x
 224                     ; 72     EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//外部中断4为唤醒源，下降沿触发，中断向量号12，中断处理函数在stm8l15x_it.c文件里
 226  006a ae1002        	ldw	x,#4098
 227  006d cd0000        	call	_EXTI_SetPinSensitivity
 229  0070               L36:
 230                     ; 77         GPIO_ToggleBits(LED1_PORT, (GPIO_Pin_TypeDef)LED1_PINS);//翻转LED端口电平
 232  0070 4b10          	push	#16
 233  0072 ae500a        	ldw	x,#20490
 234  0075 cd0000        	call	_GPIO_ToggleBits
 236  0078 84            	pop	a
 237                     ; 78         Delay(0x00FF);
 239  0079 ae00ff        	ldw	x,#255
 240  007c ad82          	call	_Delay
 242                     ; 80         wfi();//进入WFI低功耗模式 
 245  007e 8f            wfi
 249  007f 20ef          	jra	L36
 262                     	xdef	_main
 263                     	xdef	_CLK_Config
 264                     	xdef	_Delay
 265                     	xref	_GPIO_ToggleBits
 266                     	xref	_GPIO_Init
 267                     	xref	_EXTI_SetPinSensitivity
 268                     	xref	_CLK_SYSCLKSourceSwitchCmd
 269                     	xref	_CLK_SYSCLKDivConfig
 270                     	xref	_CLK_GetSYSCLKSource
 271                     	xref	_CLK_SYSCLKSourceConfig
 290                     	end
