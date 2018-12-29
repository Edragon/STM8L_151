   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  53                     ; 26 void Delay(__IO uint16_t nCount)
  53                     ; 27 {
  55                     	switch	.text
  56  0000               _Delay:
  58  0000 89            	pushw	x
  59       00000000      OFST:	set	0
  62  0001 2007          	jra	L13
  63  0003               L72:
  64                     ; 31         nCount--;
  66  0003 1e01          	ldw	x,(OFST+1,sp)
  67  0005 1d0001        	subw	x,#1
  68  0008 1f01          	ldw	(OFST+1,sp),x
  69  000a               L13:
  70                     ; 29     while (nCount != 0)
  72  000a 1e01          	ldw	x,(OFST+1,sp)
  73  000c 26f5          	jrne	L72
  74                     ; 33 }
  77  000e 85            	popw	x
  78  000f 81            	ret
 105                     ; 40 void CLK_Config(void)
 105                     ; 41 {
 106                     	switch	.text
 107  0010               _CLK_Config:
 111                     ; 43   CLK_SYSCLKSourceSwitchCmd(ENABLE);//使能时钟切换
 113  0010 a601          	ld	a,#1
 114  0012 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 116                     ; 44   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);//选择内部低速时钟作为时钟源
 118  0015 a602          	ld	a,#2
 119  0017 cd0000        	call	_CLK_SYSCLKSourceConfig
 121                     ; 46   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//设置系统时钟分频
 123  001a 4f            	clr	a
 124  001b cd0000        	call	_CLK_SYSCLKDivConfig
 127  001e               L74:
 128                     ; 47   while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_LSI);//等待时钟稳定
 130  001e cd0000        	call	_CLK_GetSYSCLKSource
 132  0021 a102          	cp	a,#2
 133  0023 26f9          	jrne	L74
 134                     ; 48 }
 137  0025 81            	ret
 164                     ; 61 void main(void)
 164                     ; 62 {
 165                     	switch	.text
 166  0026               _main:
 170                     ; 63 		_fctcpy('F');
 172  0026 a646          	ld	a,#70
 173  0028 cd0000        	call	__fctcpy
 175                     ; 64 		CLK_Config();//切换LSI为主时钟
 177  002b ade3          	call	_CLK_Config
 179                     ; 66     GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 181  002d 4bc0          	push	#192
 182  002f 4bff          	push	#255
 183  0031 ae5000        	ldw	x,#20480
 184  0034 cd0000        	call	_GPIO_Init
 186  0037 85            	popw	x
 187                     ; 67     GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 189  0038 4bc0          	push	#192
 190  003a 4bff          	push	#255
 191  003c ae5005        	ldw	x,#20485
 192  003f cd0000        	call	_GPIO_Init
 194  0042 85            	popw	x
 195                     ; 68     GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 197  0043 4bc0          	push	#192
 198  0045 4bff          	push	#255
 199  0047 ae500a        	ldw	x,#20490
 200  004a cd0000        	call	_GPIO_Init
 202  004d 85            	popw	x
 203                     ; 69     GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 205  004e 4bc0          	push	#192
 206  0050 4bff          	push	#255
 207  0052 ae500f        	ldw	x,#20495
 208  0055 cd0000        	call	_GPIO_Init
 210  0058 85            	popw	x
 211                     ; 72     GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO初始化
 213  0059 4bc0          	push	#192
 214  005b 4b10          	push	#16
 215  005d ae500a        	ldw	x,#20490
 216  0060 cd0000        	call	_GPIO_Init
 218  0063 85            	popw	x
 219                     ; 73     GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，GPD4带上拉带中断输入
 221  0064 4b60          	push	#96
 222  0066 4b10          	push	#16
 223  0068 ae500f        	ldw	x,#20495
 224  006b cd0000        	call	_GPIO_Init
 226  006e 85            	popw	x
 227                     ; 75     CLK_MainRegulatorCmd(DISABLE);//关闭电压调节器
 229  006f 4f            	clr	a
 230  0070 cd0000        	call	_CLK_MainRegulatorCmd
 232  0073               L36:
 234  0073 20fe          	jra	L36
 247                     	xdef	_main
 248                     	xdef	_CLK_Config
 249                     	xdef	_Delay
 250                     	xref	__fctcpy
 251                     	xref	_GPIO_Init
 252                     	xref	_CLK_MainRegulatorCmd
 253                     	xref	_CLK_SYSCLKSourceSwitchCmd
 254                     	xref	_CLK_SYSCLKDivConfig
 255                     	xref	_CLK_GetSYSCLKSource
 256                     	xref	_CLK_SYSCLKSourceConfig
 275                     	end
