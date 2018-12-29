   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  53                     ; 27 void Delay(__IO uint16_t nCount)
  53                     ; 28 {
  55                     	switch	.text
  56  0000               _Delay:
  58  0000 89            	pushw	x
  59       00000000      OFST:	set	0
  62  0001 2007          	jra	L13
  63  0003               L72:
  64                     ; 32         nCount--;
  66  0003 1e01          	ldw	x,(OFST+1,sp)
  67  0005 1d0001        	subw	x,#1
  68  0008 1f01          	ldw	(OFST+1,sp),x
  69  000a               L13:
  70                     ; 30     while (nCount != 0)
  72  000a 1e01          	ldw	x,(OFST+1,sp)
  73  000c 26f5          	jrne	L72
  74                     ; 34 }
  77  000e 85            	popw	x
  78  000f 81            	ret
 105                     ; 41 void CLK_Config(void)
 105                     ; 42 {
 106                     	switch	.text
 107  0010               _CLK_Config:
 111                     ; 44   CLK_SYSCLKSourceSwitchCmd(ENABLE);//使能时钟切换
 113  0010 a601          	ld	a,#1
 114  0012 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 116                     ; 45   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);//选择内部低速时钟作为时钟源
 118  0015 a602          	ld	a,#2
 119  0017 cd0000        	call	_CLK_SYSCLKSourceConfig
 121                     ; 47   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//设置系统时钟分频
 123  001a 4f            	clr	a
 124  001b cd0000        	call	_CLK_SYSCLKDivConfig
 127  001e               L74:
 128                     ; 48   while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_LSI);//等待时钟稳定
 130  001e cd0000        	call	_CLK_GetSYSCLKSource
 132  0021 a102          	cp	a,#2
 133  0023 26f9          	jrne	L74
 134                     ; 49 }
 137  0025 81            	ret
 168                     ; 59 void main(void)
 168                     ; 60 {
 169                     	switch	.text
 170  0026               _main:
 174                     ; 61 		_fctcpy('F');
 176  0026 a646          	ld	a,#70
 177  0028 cd0000        	call	__fctcpy
 179                     ; 62 		CLK_Config();//切换LSI为主时钟
 181  002b ade3          	call	_CLK_Config
 183                     ; 64 		CLK_HSICmd(DISABLE);//关闭HSI等所有不使用的外设，ADC在此模式下无效；关闭所有中断源
 185  002d 4f            	clr	a
 186  002e cd0000        	call	_CLK_HSICmd
 188                     ; 66     GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 190  0031 4bc0          	push	#192
 191  0033 4bff          	push	#255
 192  0035 ae5000        	ldw	x,#20480
 193  0038 cd0000        	call	_GPIO_Init
 195  003b 85            	popw	x
 196                     ; 67     GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 198  003c 4bc0          	push	#192
 199  003e 4bff          	push	#255
 200  0040 ae5005        	ldw	x,#20485
 201  0043 cd0000        	call	_GPIO_Init
 203  0046 85            	popw	x
 204                     ; 68     GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 206  0047 4bc0          	push	#192
 207  0049 4bff          	push	#255
 208  004b ae500a        	ldw	x,#20490
 209  004e cd0000        	call	_GPIO_Init
 211  0051 85            	popw	x
 212                     ; 69     GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 214  0052 4bc0          	push	#192
 215  0054 4bff          	push	#255
 216  0056 ae500f        	ldw	x,#20495
 217  0059 cd0000        	call	_GPIO_Init
 219  005c 85            	popw	x
 220                     ; 76     WFE_DeInit ();
 222  005d cd0000        	call	_WFE_DeInit
 224                     ; 77     WFE_WakeUpSourceEventCmd (WFE_Source_EXTI_EV4,ENABLE);
 226  0060 4b01          	push	#1
 227  0062 ae0201        	ldw	x,#513
 228  0065 cd0000        	call	_WFE_WakeUpSourceEventCmd
 230  0068 84            	pop	a
 231                     ; 80     CLK_MainRegulatorCmd(DISABLE);//关闭电压调节器
 233  0069 4f            	clr	a
 234  006a cd0000        	call	_CLK_MainRegulatorCmd
 236  006d               L36:
 237                     ; 89        wfe();
 240  006d 728f          wfe
 244  006f 20fc          	jra	L36
 257                     	xdef	_main
 258                     	xdef	_CLK_Config
 259                     	xdef	_Delay
 260                     	xref	__fctcpy
 261                     	xref	_WFE_WakeUpSourceEventCmd
 262                     	xref	_WFE_DeInit
 263                     	xref	_GPIO_Init
 264                     	xref	_CLK_MainRegulatorCmd
 265                     	xref	_CLK_SYSCLKSourceSwitchCmd
 266                     	xref	_CLK_SYSCLKDivConfig
 267                     	xref	_CLK_GetSYSCLKSource
 268                     	xref	_CLK_SYSCLKSourceConfig
 269                     	xref	_CLK_HSICmd
 288                     	end
