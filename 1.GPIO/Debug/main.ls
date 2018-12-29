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
 104                     ; 40 void main(void)
 104                     ; 41 {
 105                     	switch	.text
 106  0010               _main:
 110                     ; 42     GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//带上拉，推挽输出低电平
 112  0010 4bc0          	push	#192
 113  0012 4b10          	push	#16
 114  0014 ae500a        	ldw	x,#20490
 115  0017 cd0000        	call	_GPIO_Init
 117  001a 85            	popw	x
 118  001b               L54:
 119                     ; 45         GPIO_ToggleBits(LED1_PORT, LED1_PINS);//翻转PC4电平,LED闪烁
 121  001b 4b10          	push	#16
 122  001d ae500a        	ldw	x,#20490
 123  0020 cd0000        	call	_GPIO_ToggleBits
 125  0023 84            	pop	a
 126                     ; 46         Delay(0xFFFF);
 128  0024 aeffff        	ldw	x,#65535
 129  0027 add7          	call	_Delay
 132  0029 20f0          	jra	L54
 145                     	xdef	_main
 146                     	xdef	_Delay
 147                     	xref	_GPIO_ToggleBits
 148                     	xref	_GPIO_Init
 167                     	end
