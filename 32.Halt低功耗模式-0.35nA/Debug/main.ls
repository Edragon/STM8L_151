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
 109                     ; 48 void main(void)
 109                     ; 49 {
 110                     	switch	.text
 111  0010               _main:
 115                     ; 50 		PWR_FastWakeUpCmd(ENABLE);  //快速唤醒使能
 117  0010 a601          	ld	a,#1
 118  0012 cd0000        	call	_PWR_FastWakeUpCmd
 120                     ; 52     GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 122  0015 4bc0          	push	#192
 123  0017 4bff          	push	#255
 124  0019 ae5000        	ldw	x,#20480
 125  001c cd0000        	call	_GPIO_Init
 127  001f 85            	popw	x
 128                     ; 53     GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 130  0020 4bc0          	push	#192
 131  0022 4bff          	push	#255
 132  0024 ae5005        	ldw	x,#20485
 133  0027 cd0000        	call	_GPIO_Init
 135  002a 85            	popw	x
 136                     ; 54     GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 138  002b 4bc0          	push	#192
 139  002d 4bff          	push	#255
 140  002f ae500a        	ldw	x,#20490
 141  0032 cd0000        	call	_GPIO_Init
 143  0035 85            	popw	x
 144                     ; 55     GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 146  0036 4bc0          	push	#192
 147  0038 4bff          	push	#255
 148  003a ae500f        	ldw	x,#20495
 149  003d cd0000        	call	_GPIO_Init
 151  0040 85            	popw	x
 152                     ; 58     GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO初始化
 154  0041 4bc0          	push	#192
 155  0043 4b10          	push	#16
 156  0045 ae500a        	ldw	x,#20490
 157  0048 cd0000        	call	_GPIO_Init
 159  004b 85            	popw	x
 160                     ; 59     GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，GPD4带上拉带中断输入
 162  004c 4b60          	push	#96
 163  004e 4b10          	push	#16
 164  0050 ae500f        	ldw	x,#20495
 165  0053 cd0000        	call	_GPIO_Init
 167  0056 85            	popw	x
 168                     ; 63     EXTI_DeInit (); //恢复中断的所有设置 
 170  0057 cd0000        	call	_EXTI_DeInit
 172                     ; 64     EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//外部中断4，下降沿触发，中断处理函数在stm8l15x_it.c文件里面，向量号12
 174  005a ae1002        	ldw	x,#4098
 175  005d cd0000        	call	_EXTI_SetPinSensitivity
 177                     ; 65     enableInterrupts();//使能中断
 180  0060 9a            rim
 182  0061               L54:
 183                     ; 73         Delay(0xFFFF);
 185  0061 aeffff        	ldw	x,#65535
 186  0064 ad9a          	call	_Delay
 188                     ; 74         GPIO_ResetBits (GPIOC,GPIO_Pin_4);
 190  0066 4b10          	push	#16
 191  0068 ae500a        	ldw	x,#20490
 192  006b cd0000        	call	_GPIO_ResetBits
 194  006e 84            	pop	a
 195                     ; 75         halt();//进入低功耗休眠模式
 198  006f 8e            halt
 202  0070 20ef          	jra	L54
 215                     	xdef	_main
 216                     	xdef	_Delay
 217                     	xref	_PWR_FastWakeUpCmd
 218                     	xref	_GPIO_ResetBits
 219                     	xref	_GPIO_Init
 220                     	xref	_EXTI_SetPinSensitivity
 221                     	xref	_EXTI_DeInit
 240                     	end
