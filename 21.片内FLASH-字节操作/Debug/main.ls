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
 114                     ; 43 void main(void)
 114                     ; 44 {
 115                     	switch	.text
 116  0010               _main:
 118  0010 88            	push	a
 119       00000001      OFST:	set	1
 122                     ; 46 	GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//带上拉，推挽输出低电平
 124  0011 4bc0          	push	#192
 125  0013 4b10          	push	#16
 126  0015 ae500a        	ldw	x,#20490
 127  0018 cd0000        	call	_GPIO_Init
 129  001b 85            	popw	x
 130                     ; 47 	GPIO_Init(KEY1_PORT,KEY1_PINS,GPIO_Mode_In_PU_No_IT);//初始化KEY端口，带上拉输入，不带中断
 132  001c 4b40          	push	#64
 133  001e 4b10          	push	#16
 134  0020 ae500f        	ldw	x,#20495
 135  0023 cd0000        	call	_GPIO_Init
 137  0026 85            	popw	x
 138                     ; 49   CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//开启USART时钟
 140  0027 ae0001        	ldw	x,#1
 141  002a a605          	ld	a,#5
 142  002c 95            	ld	xh,a
 143  002d cd0000        	call	_CLK_PeripheralClockConfig
 145                     ; 50   USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Tx|USART_Mode_Rx);//设置USART参数9600，8N1，接收/发送
 147  0030 4b0c          	push	#12
 148  0032 4b00          	push	#0
 149  0034 4b00          	push	#0
 150  0036 4b00          	push	#0
 151  0038 ae2580        	ldw	x,#9600
 152  003b 89            	pushw	x
 153  003c ae0000        	ldw	x,#0
 154  003f 89            	pushw	x
 155  0040 ae5230        	ldw	x,#21040
 156  0043 cd0000        	call	_USART_Init
 158  0046 5b08          	addw	sp,#8
 159                     ; 51   USART_ITConfig (USART1,USART_IT_RXNE,ENABLE);//使能接收中断
 161  0048 4b01          	push	#1
 162  004a ae0255        	ldw	x,#597
 163  004d 89            	pushw	x
 164  004e ae5230        	ldw	x,#21040
 165  0051 cd0000        	call	_USART_ITConfig
 167  0054 5b03          	addw	sp,#3
 168                     ; 52   USART_Cmd (USART1,ENABLE);//使能USART
 170  0056 4b01          	push	#1
 171  0058 ae5230        	ldw	x,#21040
 172  005b cd0000        	call	_USART_Cmd
 174  005e 84            	pop	a
 175                     ; 53   enableInterrupts(); 
 178  005f 9a            rim
 180                     ; 55   FLASH_DeInit();
 183  0060 cd0000        	call	_FLASH_DeInit
 185                     ; 56   FLASH_Unlock(FLASH_MemType_Program);//先解锁，注意参数
 187  0063 a6fd          	ld	a,#253
 188  0065 cd0000        	call	_FLASH_Unlock
 190                     ; 57   FLASH_EraseByte(0x9f40);         //再擦除
 192  0068 ae9f40        	ldw	x,#40768
 193  006b 89            	pushw	x
 194  006c ae0000        	ldw	x,#0
 195  006f 89            	pushw	x
 196  0070 cd0000        	call	_FLASH_EraseByte
 198  0073 5b04          	addw	sp,#4
 199                     ; 58   FLASH_ProgramByte(0x9f40,0x0f);  //写数据，第一个参数为地址，第二个参数为写入的数据，9f40为片内flash区域靠近中间的位置
 201  0075 4b0f          	push	#15
 202  0077 ae9f40        	ldw	x,#40768
 203  007a 89            	pushw	x
 204  007b ae0000        	ldw	x,#0
 205  007e 89            	pushw	x
 206  007f cd0000        	call	_FLASH_ProgramByte
 208  0082 5b05          	addw	sp,#5
 209                     ; 60   r_byte = FLASH_ReadByte(0x9f40);//读指定地址的数据
 211  0084 ae9f40        	ldw	x,#40768
 212  0087 89            	pushw	x
 213  0088 ae0000        	ldw	x,#0
 214  008b 89            	pushw	x
 215  008c cd0000        	call	_FLASH_ReadByte
 217  008f 5b04          	addw	sp,#4
 218  0091 6b01          	ld	(OFST+0,sp),a
 219                     ; 61   USART_SendData8 (USART1,r_byte);//通过UART发送，16进制
 221  0093 7b01          	ld	a,(OFST+0,sp)
 222  0095 88            	push	a
 223  0096 ae5230        	ldw	x,#21040
 224  0099 cd0000        	call	_USART_SendData8
 226  009c 84            	pop	a
 227  009d               L35:
 229  009d 20fe          	jra	L35
 242                     	xdef	_main
 243                     	xdef	_Delay
 244                     	xref	_USART_ITConfig
 245                     	xref	_USART_SendData8
 246                     	xref	_USART_Cmd
 247                     	xref	_USART_Init
 248                     	xref	_GPIO_Init
 249                     	xref	_FLASH_ReadByte
 250                     	xref	_FLASH_EraseByte
 251                     	xref	_FLASH_ProgramByte
 252                     	xref	_FLASH_Unlock
 253                     	xref	_FLASH_DeInit
 254                     	xref	_CLK_PeripheralClockConfig
 273                     	end
