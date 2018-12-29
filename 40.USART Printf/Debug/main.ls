   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  43                     ; 25 void Delay(__IO uint16_t nCount)
  43                     ; 26 {
  45                     	switch	.text
  46  0000               _Delay:
  48  0000 89            	pushw	x
  49       00000000      OFST:	set	0
  52  0001 2007          	jra	L13
  53  0003               L72:
  54                     ; 30         nCount--;
  56  0003 1e01          	ldw	x,(OFST+1,sp)
  57  0005 1d0001        	subw	x,#1
  58  0008 1f01          	ldw	(OFST+1,sp),x
  59  000a               L13:
  60                     ; 28     while (nCount != 0)
  62  000a 1e01          	ldw	x,(OFST+1,sp)
  63  000c 26f5          	jrne	L72
  64                     ; 32 }
  67  000e 85            	popw	x
  68  000f 81            	ret
 105                     ; 39 void USART_SendStr(unsigned char *Str) 
 105                     ; 40 {
 106                     	switch	.text
 107  0010               _USART_SendStr:
 109  0010 89            	pushw	x
 110       00000000      OFST:	set	0
 113  0011 2020          	jra	L55
 114  0013               L35:
 115                     ; 43             USART_SendData8(USART1,*Str);     //发送数据 
 117  0013 1e01          	ldw	x,(OFST+1,sp)
 118  0015 f6            	ld	a,(x)
 119  0016 88            	push	a
 120  0017 ae5230        	ldw	x,#21040
 121  001a cd0000        	call	_USART_SendData8
 123  001d 84            	pop	a
 125  001e               L36:
 126                     ; 44             while(!USART_GetFlagStatus (USART1,USART_FLAG_TXE));//等待发送完毕
 128  001e ae0080        	ldw	x,#128
 129  0021 89            	pushw	x
 130  0022 ae5230        	ldw	x,#21040
 131  0025 cd0000        	call	_USART_GetFlagStatus
 133  0028 85            	popw	x
 134  0029 4d            	tnz	a
 135  002a 27f2          	jreq	L36
 136                     ; 45             Str++;//下一个数据
 138  002c 1e01          	ldw	x,(OFST+1,sp)
 139  002e 1c0001        	addw	x,#1
 140  0031 1f01          	ldw	(OFST+1,sp),x
 141  0033               L55:
 142                     ; 41         while(*Str!=0)//不为结束
 144  0033 1e01          	ldw	x,(OFST+1,sp)
 145  0035 7d            	tnz	(x)
 146  0036 26db          	jrne	L35
 147                     ; 47 }
 150  0038 85            	popw	x
 151  0039 81            	ret
 184                     ; 57 int main( void )
 184                     ; 58 {
 185                     	switch	.text
 186  003a               _main:
 190                     ; 59     CLK_HSICmd(ENABLE);//开始内部高频RC 16M
 192  003a a601          	ld	a,#1
 193  003c cd0000        	call	_CLK_HSICmd
 195                     ; 60     CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);//HSI为系统时钟
 197  003f a601          	ld	a,#1
 198  0041 cd0000        	call	_CLK_SYSCLKSourceConfig
 200                     ; 61     CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//不分频，即1分频，16M
 202  0044 4f            	clr	a
 203  0045 cd0000        	call	_CLK_SYSCLKDivConfig
 205                     ; 64     GPIO_Init(GPIOC,GPIO_Pin_3,GPIO_Mode_Out_PP_High_Fast);//TXD
 207  0048 4bf0          	push	#240
 208  004a 4b08          	push	#8
 209  004c ae500a        	ldw	x,#20490
 210  004f cd0000        	call	_GPIO_Init
 212  0052 85            	popw	x
 213                     ; 65     GPIO_Init(GPIOC,GPIO_Pin_2,GPIO_Mode_In_PU_No_IT);//RXD
 215  0053 4b40          	push	#64
 216  0055 4b04          	push	#4
 217  0057 ae500a        	ldw	x,#20490
 218  005a cd0000        	call	_GPIO_Init
 220  005d 85            	popw	x
 221                     ; 67     CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//开启USART时钟
 223  005e ae0001        	ldw	x,#1
 224  0061 a605          	ld	a,#5
 225  0063 95            	ld	xh,a
 226  0064 cd0000        	call	_CLK_PeripheralClockConfig
 228                     ; 69     USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Rx|USART_Mode_Tx);//设置USART参数9600，8N1，接收/发送
 230  0067 4b0c          	push	#12
 231  0069 4b00          	push	#0
 232  006b 4b00          	push	#0
 233  006d 4b00          	push	#0
 234  006f ae2580        	ldw	x,#9600
 235  0072 89            	pushw	x
 236  0073 ae0000        	ldw	x,#0
 237  0076 89            	pushw	x
 238  0077 ae5230        	ldw	x,#21040
 239  007a cd0000        	call	_USART_Init
 241  007d 5b08          	addw	sp,#8
 242                     ; 70     USART_ITConfig (USART1,USART_IT_OR,ENABLE);//使能接收中断,中断向量号为28
 244  007f 4b01          	push	#1
 245  0081 ae0235        	ldw	x,#565
 246  0084 89            	pushw	x
 247  0085 ae5230        	ldw	x,#21040
 248  0088 cd0000        	call	_USART_ITConfig
 250  008b 5b03          	addw	sp,#3
 251                     ; 71     USART_Cmd (USART1,ENABLE);//使能USART
 253  008d 4b01          	push	#1
 254  008f ae5230        	ldw	x,#21040
 255  0092 cd0000        	call	_USART_Cmd
 257  0095 84            	pop	a
 258                     ; 73 		USART_SendStr("蓝旗嵌入式\r\n"); //发送字符串，末尾换行
 260  0096 ae0000        	ldw	x,#L77
 261  0099 cd0010        	call	_USART_SendStr
 263                     ; 74     enableInterrupts(); 
 266  009c 9a            rim
 268  009d               L101:
 270  009d 20fe          	jra	L101
 283                     	xdef	_main
 284                     	xdef	_USART_SendStr
 285                     	xdef	_Delay
 286                     	xref	_USART_GetFlagStatus
 287                     	xref	_USART_ITConfig
 288                     	xref	_USART_SendData8
 289                     	xref	_USART_Cmd
 290                     	xref	_USART_Init
 291                     	xref	_GPIO_Init
 292                     	xref	_CLK_PeripheralClockConfig
 293                     	xref	_CLK_SYSCLKDivConfig
 294                     	xref	_CLK_SYSCLKSourceConfig
 295                     	xref	_CLK_HSICmd
 296                     .const:	section	.text
 297  0000               L77:
 298  0000 c0b6c6ecc7b6  	dc.b	192,182,198,236,199,182
 299  0006 c8ebcabd0d0a  	dc.b	200,235,202,189,13,10,0
 319                     	end
