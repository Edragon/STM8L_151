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
 107                     ; 39 int main( void )
 107                     ; 40 {
 108                     	switch	.text
 109  0010               _main:
 113                     ; 41     GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//初始化LED，GPC4低速推挽输出
 115  0010 4bc0          	push	#192
 116  0012 4b10          	push	#16
 117  0014 ae500a        	ldw	x,#20490
 118  0017 cd0000        	call	_GPIO_Init
 120  001a 85            	popw	x
 121                     ; 42     CLK_PeripheralClockConfig (CLK_Peripheral_TIM4,ENABLE); //使能外设时钟，STM8L默认所有外设时钟初始时关闭，使用前徐开启
 123  001b ae0201        	ldw	x,#513
 124  001e cd0000        	call	_CLK_PeripheralClockConfig
 126                     ; 44     TIM4_TimeBaseInit(TIM4_Prescaler_128, 0xff);//16M/8/128=15.625K，0xff=255,255*（1/15.625）=0.01632S，大约61次中断是1S
 128  0021 ae07ff        	ldw	x,#2047
 129  0024 cd0000        	call	_TIM4_TimeBaseInit
 131                     ; 45     TIM4_ITConfig(TIM4_IT_Update, ENABLE);//向上溢出中断，中断函数向量号为25
 133  0027 ae0101        	ldw	x,#257
 134  002a cd0000        	call	_TIM4_ITConfig
 136                     ; 46     TIM4_Cmd(ENABLE);//使能
 138  002d a601          	ld	a,#1
 139  002f cd0000        	call	_TIM4_Cmd
 141                     ; 47     enableInterrupts();
 144  0032 9a            rim
 146  0033               L54:
 148  0033 20fe          	jra	L54
 161                     	xdef	_main
 162                     	xdef	_Delay
 163                     	xref	_TIM4_ITConfig
 164                     	xref	_TIM4_Cmd
 165                     	xref	_TIM4_TimeBaseInit
 166                     	xref	_GPIO_Init
 167                     	xref	_CLK_PeripheralClockConfig
 186                     	end
