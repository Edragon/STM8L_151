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
 143                     ; 45 int main( void )
 143                     ; 46 {  
 144                     	switch	.text
 145  0010               _main:
 147  0010 88            	push	a
 148       00000001      OFST:	set	1
 151                     ; 47   FlagStatus IllOpFlag = RESET;
 153                     ; 48   GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_High_Slow);//初始化LED端口
 155  0011 4bd0          	push	#208
 156  0013 4b10          	push	#16
 157  0015 ae500a        	ldw	x,#20490
 158  0018 cd0000        	call	_GPIO_Init
 160  001b 85            	popw	x
 161                     ; 50   GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_IT);//初始化按键，上拉输入，带中断
 163  001c 4b60          	push	#96
 164  001e 4b10          	push	#16
 165  0020 ae500f        	ldw	x,#20495
 166  0023 cd0000        	call	_GPIO_Init
 168  0026 85            	popw	x
 169                     ; 53   EXTI_DeInit (); //恢复中断的所有设置 
 171  0027 cd0000        	call	_EXTI_DeInit
 173                     ; 54   EXTI_SetPinSensitivity (EXTI_Pin_4,EXTI_Trigger_Falling);//外部中断4，下降沿触发，向量号12
 175  002a ae1002        	ldw	x,#4098
 176  002d cd0000        	call	_EXTI_SetPinSensitivity
 178                     ; 57   enableInterrupts();//使能中断
 181  0030 9a            rim
 183                     ; 59   FLASH_Unlock(FLASH_MemType_Program);
 186  0031 a6fd          	ld	a,#253
 187  0033 cd0000        	call	_FLASH_Unlock
 189                     ; 60   IllOpFlag = RST_GetFlagStatus(RST_FLAG_ILLOPF);
 191  0036 a604          	ld	a,#4
 192  0038 cd0000        	call	_RST_GetFlagStatus
 194  003b 6b01          	ld	(OFST+0,sp),a
 196                     ; 61    if(IllOpFlag)//判断非法操作码复位有没有发生
 198  003d 0d01          	tnz	(OFST+0,sp)
 199  003f 2710          	jreq	L36
 200                     ; 63         GPIO_ResetBits(LED1_PORT, LED1_PINS);//点亮LED
 202  0041 4b10          	push	#16
 203  0043 ae500a        	ldw	x,#20490
 204  0046 cd0000        	call	_GPIO_ResetBits
 206  0049 84            	pop	a
 207                     ; 65         RST_ClearFlag(RST_FLAG_ILLOPF);
 209  004a a604          	ld	a,#4
 210  004c cd0000        	call	_RST_ClearFlag
 213  004f 2009          	jra	L56
 214  0051               L36:
 215                     ; 69         GPIO_SetBits(LED1_PORT, LED1_PINS);
 217  0051 4b10          	push	#16
 218  0053 ae500a        	ldw	x,#20490
 219  0056 cd0000        	call	_GPIO_SetBits
 221  0059 84            	pop	a
 222  005a               L56:
 223                     ; 72   FLASH_ProgramByte(0x9F00, 0x05);
 225  005a 4b05          	push	#5
 226  005c ae9f00        	ldw	x,#40704
 227  005f 89            	pushw	x
 228  0060 ae0000        	ldw	x,#0
 229  0063 89            	pushw	x
 230  0064 cd0000        	call	_FLASH_ProgramByte
 232  0067 5b05          	addw	sp,#5
 233  0069               L76:
 235  0069 20fe          	jra	L76
 248                     	xdef	_main
 249                     	xdef	_Delay
 250                     	xref	_RST_ClearFlag
 251                     	xref	_RST_GetFlagStatus
 252                     	xref	_GPIO_ResetBits
 253                     	xref	_GPIO_SetBits
 254                     	xref	_GPIO_Init
 255                     	xref	_FLASH_ProgramByte
 256                     	xref	_FLASH_Unlock
 257                     	xref	_EXTI_SetPinSensitivity
 258                     	xref	_EXTI_DeInit
 277                     	end
