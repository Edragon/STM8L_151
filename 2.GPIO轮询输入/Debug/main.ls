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
 105                     ; 40 int main( void )
 105                     ; 41 {
 106                     	switch	.text
 107  0010               _main:
 111                     ; 42     GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//初始化LED，GPC4低速推挽输出
 113  0010 4bc0          	push	#192
 114  0012 4b10          	push	#16
 115  0014 ae500a        	ldw	x,#20490
 116  0017 cd0000        	call	_GPIO_Init
 118  001a 85            	popw	x
 119                     ; 43     GPIO_Init(KEY1_PORT, KEY1_PINS, GPIO_Mode_In_PU_No_IT);//初始化按键，GPD4上拉输入
 121  001b 4b40          	push	#64
 122  001d 4b10          	push	#16
 123  001f ae500f        	ldw	x,#20495
 124  0022 cd0000        	call	_GPIO_Init
 126  0025 85            	popw	x
 127  0026               L54:
 128                     ; 46          if(GPIO_ReadInputDataBit(KEY1_PORT,KEY1_PINS)==0)//读GPD4输入状态
 130  0026 4b10          	push	#16
 131  0028 ae500f        	ldw	x,#20495
 132  002b cd0000        	call	_GPIO_ReadInputDataBit
 134  002e 5b01          	addw	sp,#1
 135  0030 4d            	tnz	a
 136  0031 26f3          	jrne	L54
 137                     ; 48              Delay(0x3FFF);  //软件防抖
 139  0033 ae3fff        	ldw	x,#16383
 140  0036 adc8          	call	_Delay
 142                     ; 49              if(GPIO_ReadInputDataBit(KEY1_PORT,KEY1_PINS)==0)  //读GPD4输入状态
 144  0038 4b10          	push	#16
 145  003a ae500f        	ldw	x,#20495
 146  003d cd0000        	call	_GPIO_ReadInputDataBit
 148  0040 5b01          	addw	sp,#1
 149  0042 4d            	tnz	a
 150  0043 26e1          	jrne	L54
 151                     ; 50                 GPIO_ToggleBits(LED1_PORT, LED1_PINS);//翻转GPC4输出状态
 153  0045 4b10          	push	#16
 154  0047 ae500a        	ldw	x,#20490
 155  004a cd0000        	call	_GPIO_ToggleBits
 157  004d 84            	pop	a
 158  004e 20d6          	jra	L54
 171                     	xdef	_main
 172                     	xdef	_Delay
 173                     	xref	_GPIO_ReadInputDataBit
 174                     	xref	_GPIO_ToggleBits
 175                     	xref	_GPIO_Init
 194                     	end
