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
 103                     ; 39 int main( void )
 103                     ; 40 {  
 104                     	switch	.text
 105  0010               _main:
 109                     ; 41   GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);//初始化CCO端口，输出/带上拉
 111  0010 4bc0          	push	#192
 112  0012 4b10          	push	#16
 113  0014 ae500a        	ldw	x,#20490
 114  0017 cd0000        	call	_GPIO_Init
 116  001a 85            	popw	x
 117                     ; 43   CLK_CCOConfig(CLK_CCOSource_HSI,CLK_CCODiv_16);//HSI做时钟源，16分频
 119  001b ae0280        	ldw	x,#640
 120  001e cd0000        	call	_CLK_CCOConfig
 122  0021               L54:
 124  0021 20fe          	jra	L54
 137                     	xdef	_main
 138                     	xdef	_Delay
 139                     	xref	_GPIO_Init
 140                     	xref	_CLK_CCOConfig
 159                     	end
