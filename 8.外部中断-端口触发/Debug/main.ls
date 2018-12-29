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
 113                     ; 41     GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO初始化
 115  0010 4bc0          	push	#192
 116  0012 4b10          	push	#16
 117  0014 ae500a        	ldw	x,#20490
 118  0017 cd0000        	call	_GPIO_Init
 120  001a 85            	popw	x
 121                     ; 42     GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，GPD4上拉中断输入
 123  001b 4b60          	push	#96
 124  001d 4b10          	push	#16
 125  001f ae500f        	ldw	x,#20495
 126  0022 cd0000        	call	_GPIO_Init
 128  0025 85            	popw	x
 129                     ; 44     EXTI_DeInit (); //恢复中断的所有设置 
 131  0026 cd0000        	call	_EXTI_DeInit
 133                     ; 45     EXTI_SelectPort(EXTI_Port_D);//选择端口D，中断向量号7
 135  0029 a602          	ld	a,#2
 136  002b cd0000        	call	_EXTI_SelectPort
 138                     ; 46     EXTI_SetPortSensitivity(EXTI_Port_D,EXTI_Trigger_Falling);//端口D下降沿触发，中断向量号7
 140  002e ae0202        	ldw	x,#514
 141  0031 cd0000        	call	_EXTI_SetPortSensitivity
 143                     ; 47     EXTI_SetHalfPortSelection(EXTI_HalfPort_D_MSB,ENABLE);//端口D的高四位中断使能
 145  0034 ae0801        	ldw	x,#2049
 146  0037 cd0000        	call	_EXTI_SetHalfPortSelection
 148                     ; 48     enableInterrupts();//使能中断
 151  003a 9a            rim
 153  003b               L54:
 155  003b 20fe          	jra	L54
 168                     	xdef	_main
 169                     	xdef	_Delay
 170                     	xref	_GPIO_Init
 171                     	xref	_EXTI_SetPortSensitivity
 172                     	xref	_EXTI_SetHalfPortSelection
 173                     	xref	_EXTI_SelectPort
 174                     	xref	_EXTI_DeInit
 193                     	end
