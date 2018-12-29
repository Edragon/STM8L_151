   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  49                     ; 34 int main( void )
  49                     ; 35 {
  51                     	switch	.text
  52  0000               _main:
  56                     ; 36     GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO初始化
  58  0000 4bc0          	push	#192
  59  0002 4b10          	push	#16
  60  0004 ae500a        	ldw	x,#20490
  61  0007 cd0000        	call	_GPIO_Init
  63  000a 85            	popw	x
  64                     ; 37     GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，GPD4上拉中断输入
  66  000b 4b60          	push	#96
  67  000d 4b10          	push	#16
  68  000f ae500f        	ldw	x,#20495
  69  0012 cd0000        	call	_GPIO_Init
  71  0015 85            	popw	x
  72                     ; 39     EXTI_DeInit (); //恢复中断的所有设置 
  74  0016 cd0000        	call	_EXTI_DeInit
  76                     ; 40     EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//外部中断4，下降沿触发
  78  0019 ae1002        	ldw	x,#4098
  79  001c cd0000        	call	_EXTI_SetPinSensitivity
  81                     ; 41     enableInterrupts();//使能中断
  84  001f 9a            rim
  86                     ; 43     CH372_Init();
  89  0020 cd0000        	call	_CH372_Init
  91                     ; 44     CH372_WR_CMD(CMD_SET_USB_MODE);
  93  0023 a615          	ld	a,#21
  94  0025 cd0000        	call	_CH372_WR_CMD
  96                     ; 45     CH372_WR_DAT(2);
  98  0028 a602          	ld	a,#2
  99  002a cd0000        	call	_CH372_WR_DAT
 101  002d               L12:
 103  002d 20fe          	jra	L12
 116                     	xdef	_main
 117                     	xref	_CH372_WR_DAT
 118                     	xref	_CH372_WR_CMD
 119                     	xref	_CH372_Init
 120                     	xref	_GPIO_Init
 121                     	xref	_EXTI_SetPinSensitivity
 122                     	xref	_EXTI_DeInit
 141                     	end
