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
 106                     ; 51 int main( void )
 106                     ; 52 {
 107                     	switch	.text
 108  0010               _main:
 112                     ; 53 	GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_High_Slow);//初始化LED端口
 114  0010 4bd0          	push	#208
 115  0012 4b10          	push	#16
 116  0014 ae500a        	ldw	x,#20490
 117  0017 cd0000        	call	_GPIO_Init
 119  001a 85            	popw	x
 120                     ; 54   GPIO_Init(LED2_PORT,LED2_PINS,GPIO_Mode_Out_PP_High_Slow);//初始化LED端口
 122  001b 4bd0          	push	#208
 123  001d 4b01          	push	#1
 124  001f ae5005        	ldw	x,#20485
 125  0022 cd0000        	call	_GPIO_Init
 127  0025 85            	popw	x
 128                     ; 55   GPIO_Init(LED3_PORT,LED3_PINS,GPIO_Mode_Out_PP_High_Slow);//初始化LED端口
 130  0026 4bd0          	push	#208
 131  0028 4b04          	push	#4
 132  002a ae500f        	ldw	x,#20495
 133  002d cd0000        	call	_GPIO_Init
 135  0030 85            	popw	x
 136                     ; 57   GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，上拉输入，带中断
 138  0031 4b60          	push	#96
 139  0033 4b10          	push	#16
 140  0035 ae500f        	ldw	x,#20495
 141  0038 cd0000        	call	_GPIO_Init
 143  003b 85            	popw	x
 144                     ; 58   GPIO_Init(KEY2_PORT, KEY2_PINS, GPIO_Mode_In_PU_IT);//初始化按键，上拉输入，带中断
 146  003c 4b60          	push	#96
 147  003e 4b04          	push	#4
 148  0040 ae5000        	ldw	x,#20480
 149  0043 cd0000        	call	_GPIO_Init
 151  0046 85            	popw	x
 152                     ; 59   GPIO_Init(KEY3_PORT, KEY3_PINS, GPIO_Mode_In_PU_IT);//初始化按键，上拉输入，带中断
 154  0047 4b60          	push	#96
 155  0049 4b08          	push	#8
 156  004b ae5005        	ldw	x,#20485
 157  004e cd0000        	call	_GPIO_Init
 159  0051 85            	popw	x
 160                     ; 62   EXTI_DeInit (); //恢复中断的所有设置 
 162  0052 cd0000        	call	_EXTI_DeInit
 164                     ; 63   EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//外部中断4，下降沿触发，向量号12
 166  0055 ae1002        	ldw	x,#4098
 167  0058 cd0000        	call	_EXTI_SetPinSensitivity
 169                     ; 64   EXTI_SetPinSensitivity (EXTI_Pin_2,EXTI_Trigger_Falling);//外部中断2，下降沿触发，向量号10
 171  005b ae0402        	ldw	x,#1026
 172  005e cd0000        	call	_EXTI_SetPinSensitivity
 174                     ; 65   EXTI_SetPinSensitivity (EXTI_Pin_3,EXTI_Trigger_Falling);//外部中断3，下降沿触发，向量号11
 176  0061 ae0602        	ldw	x,#1538
 177  0064 cd0000        	call	_EXTI_SetPinSensitivity
 179                     ; 67   ITC_SetSoftwarePriority(EXTI4_IRQn,ITC_PriorityLevel_1);//设置外部中断4的软件优先级为1，比外部中断2/3默认的3级优先级要低。
 181  0067 ae0c01        	ldw	x,#3073
 182  006a cd0000        	call	_ITC_SetSoftwarePriority
 184                     ; 69   enableInterrupts();//使能中断
 187  006d 9a            rim
 189  006e               L54:
 191  006e 20fe          	jra	L54
 204                     	xdef	_main
 205                     	xdef	_Delay
 206                     	xref	_ITC_SetSoftwarePriority
 207                     	xref	_GPIO_Init
 208                     	xref	_EXTI_SetPinSensitivity
 209                     	xref	_EXTI_DeInit
 228                     	end
