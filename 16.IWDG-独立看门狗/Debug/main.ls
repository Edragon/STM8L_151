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
 106                     ; 41 static void IWDG_Config(void)
 106                     ; 42 {
 107                     	switch	.text
 108  0010               L53_IWDG_Config:
 112                     ; 44   IWDG_Enable();
 114  0010 cd0000        	call	_IWDG_Enable
 116                     ; 46   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 118  0013 a655          	ld	a,#85
 119  0015 cd0000        	call	_IWDG_WriteAccessCmd
 121                     ; 48   IWDG_SetPrescaler(IWDG_Prescaler_256);
 123  0018 a606          	ld	a,#6
 124  001a cd0000        	call	_IWDG_SetPrescaler
 126                     ; 53   IWDG_SetReload((uint8_t)RELOAD_VALUE);
 128  001d a6ff          	ld	a,#255
 129  001f cd0000        	call	_IWDG_SetReload
 131                     ; 56   IWDG_ReloadCounter();
 133  0022 cd0000        	call	_IWDG_ReloadCounter
 135                     ; 57 }
 138  0025 81            	ret
 172                     ; 67 int main( void )
 172                     ; 68 {  
 173                     	switch	.text
 174  0026               _main:
 178                     ; 69   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 180  0026 4f            	clr	a
 181  0027 cd0000        	call	_CLK_SYSCLKDivConfig
 183                     ; 71   GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_High_Slow);//初始化LED端口
 185  002a 4bd0          	push	#208
 186  002c 4b10          	push	#16
 187  002e ae500a        	ldw	x,#20490
 188  0031 cd0000        	call	_GPIO_Init
 190  0034 85            	popw	x
 191                     ; 73   GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，上拉输入，带中断
 193  0035 4b60          	push	#96
 194  0037 4b10          	push	#16
 195  0039 ae500f        	ldw	x,#20495
 196  003c cd0000        	call	_GPIO_Init
 198  003f 85            	popw	x
 199                     ; 75   EXTI_DeInit (); //恢复中断的所有设置 
 201  0040 cd0000        	call	_EXTI_DeInit
 203                     ; 76   EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//外部中断4，下降沿触发，向量号12
 205  0043 ae1002        	ldw	x,#4098
 206  0046 cd0000        	call	_EXTI_SetPinSensitivity
 208                     ; 78   enableInterrupts();//使能中断
 211  0049 9a            rim
 213                     ; 81   if(RST_GetFlagStatus(RST_FLAG_IWDGF) != RESET)//判断IWDG复位有没有发生
 216  004a a602          	ld	a,#2
 217  004c cd0000        	call	_RST_GetFlagStatus
 219  004f 4d            	tnz	a
 220  0050 2710          	jreq	L75
 221                     ; 83         GPIO_ResetBits(LED1_PORT, LED1_PINS);//点亮LED
 223  0052 4b10          	push	#16
 224  0054 ae500a        	ldw	x,#20490
 225  0057 cd0000        	call	_GPIO_ResetBits
 227  005a 84            	pop	a
 228                     ; 85         RST_ClearFlag(RST_FLAG_IWDGF);
 230  005b a602          	ld	a,#2
 231  005d cd0000        	call	_RST_ClearFlag
 234  0060 2009          	jra	L16
 235  0062               L75:
 236                     ; 89         GPIO_SetBits(LED1_PORT, LED1_PINS);
 238  0062 4b10          	push	#16
 239  0064 ae500a        	ldw	x,#20490
 240  0067 cd0000        	call	_GPIO_SetBits
 242  006a 84            	pop	a
 243  006b               L16:
 244                     ; 93   IWDG_Config();
 246  006b ada3          	call	L53_IWDG_Config
 248  006d               L36:
 249                     ; 97     IWDG_ReloadCounter(); //喂狗
 251  006d cd0000        	call	_IWDG_ReloadCounter
 254  0070 20fb          	jra	L36
 267                     	xdef	_main
 268                     	xdef	_Delay
 269                     	xref	_RST_ClearFlag
 270                     	xref	_RST_GetFlagStatus
 271                     	xref	_IWDG_Enable
 272                     	xref	_IWDG_ReloadCounter
 273                     	xref	_IWDG_SetReload
 274                     	xref	_IWDG_SetPrescaler
 275                     	xref	_IWDG_WriteAccessCmd
 276                     	xref	_GPIO_ResetBits
 277                     	xref	_GPIO_SetBits
 278                     	xref	_GPIO_Init
 279                     	xref	_EXTI_SetPinSensitivity
 280                     	xref	_EXTI_DeInit
 281                     	xref	_CLK_SYSCLKDivConfig
 300                     	end
