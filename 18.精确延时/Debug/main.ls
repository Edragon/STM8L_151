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
 105                     ; 40 int main( void )
 105                     ; 41 {
 106                     	switch	.text
 107  0010               _main:
 111                     ; 42 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);  
 113  0010 4f            	clr	a
 114  0011 cd0000        	call	_CLK_SYSCLKDivConfig
 116                     ; 43   GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);//初始化LED端口
 118  0014 4bc0          	push	#192
 119  0016 4b10          	push	#16
 120  0018 ae500a        	ldw	x,#20490
 121  001b cd0000        	call	_GPIO_Init
 123  001e 85            	popw	x
 124  001f               L54:
 125                     ; 47     GPIO_ToggleBits(LED1_PORT,LED1_PINS);//翻转LED端口
 127  001f 4b10          	push	#16
 128  0021 ae500a        	ldw	x,#20490
 129  0024 cd0000        	call	_GPIO_ToggleBits
 131  0027 84            	pop	a
 132                     ; 49     delay_ms(1000);
 134  0028 ae03e8        	ldw	x,#1000
 135  002b cd0000        	call	_delay_ms
 138  002e 20ef          	jra	L54
 151                     	xdef	_main
 152                     	xdef	_Delay
 153                     	xref	_delay_ms
 154                     	xref	_GPIO_ToggleBits
 155                     	xref	_GPIO_Init
 156                     	xref	_CLK_SYSCLKDivConfig
 175                     	end
