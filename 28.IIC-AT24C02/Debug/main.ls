   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     	bsct
  15  0000               _WBuf:
  16  0000 53544d384c20  	dc.b	"STM8L IIC",182
  17  000a c1d0b4323443  	dc.b	193,208,180,50,52,67
  18  0010 3058210d      	dc.b	"0X!",13
  19  0014 0a00          	dc.b	10,0
  59                     ; 30 void Delay(__IO uint16_t nCount)
  59                     ; 31 {
  61                     	switch	.text
  62  0000               _Delay:
  64  0000 89            	pushw	x
  65       00000000      OFST:	set	0
  68  0001 2007          	jra	L13
  69  0003               L72:
  70                     ; 35         nCount--;
  72  0003 1e01          	ldw	x,(OFST+1,sp)
  73  0005 1d0001        	subw	x,#1
  74  0008 1f01          	ldw	(OFST+1,sp),x
  75  000a               L13:
  76                     ; 33     while (nCount != 0)
  78  000a 1e01          	ldw	x,(OFST+1,sp)
  79  000c 26f5          	jrne	L72
  80                     ; 37 }
  83  000e 85            	popw	x
  84  000f 81            	ret
 121                     ; 44 void USART_SendStr(unsigned char *Str) 
 121                     ; 45 {
 122                     	switch	.text
 123  0010               _USART_SendStr:
 125  0010 89            	pushw	x
 126       00000000      OFST:	set	0
 129  0011 2020          	jra	L55
 130  0013               L35:
 131                     ; 48             USART_SendData8(USART1,*Str);     //发送数据 
 133  0013 1e01          	ldw	x,(OFST+1,sp)
 134  0015 f6            	ld	a,(x)
 135  0016 88            	push	a
 136  0017 ae5230        	ldw	x,#21040
 137  001a cd0000        	call	_USART_SendData8
 139  001d 84            	pop	a
 141  001e               L36:
 142                     ; 49             while(!USART_GetFlagStatus (USART1,USART_FLAG_TXE));//等待发送完毕
 144  001e ae0080        	ldw	x,#128
 145  0021 89            	pushw	x
 146  0022 ae5230        	ldw	x,#21040
 147  0025 cd0000        	call	_USART_GetFlagStatus
 149  0028 85            	popw	x
 150  0029 4d            	tnz	a
 151  002a 27f2          	jreq	L36
 152                     ; 50             Str++;//下一个数据
 154  002c 1e01          	ldw	x,(OFST+1,sp)
 155  002e 1c0001        	addw	x,#1
 156  0031 1f01          	ldw	(OFST+1,sp),x
 157  0033               L55:
 158                     ; 46         while(*Str!=0)//不为结束
 160  0033 1e01          	ldw	x,(OFST+1,sp)
 161  0035 7d            	tnz	(x)
 162  0036 26db          	jrne	L35
 163                     ; 52 }
 166  0038 85            	popw	x
 167  0039 81            	ret
 201                     ; 60 int main( void )
 201                     ; 61 {
 202                     	switch	.text
 203  003a               _main:
 207                     ; 62 	GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//初始化LED1接口
 209  003a 4bc0          	push	#192
 210  003c 4b10          	push	#16
 211  003e ae500a        	ldw	x,#20490
 212  0041 cd0000        	call	_GPIO_Init
 214  0044 85            	popw	x
 215                     ; 64 	GPIO_Init(GPIOC,GPIO_Pin_3,GPIO_Mode_Out_PP_High_Fast);//TXD
 217  0045 4bf0          	push	#240
 218  0047 4b08          	push	#8
 219  0049 ae500a        	ldw	x,#20490
 220  004c cd0000        	call	_GPIO_Init
 222  004f 85            	popw	x
 223                     ; 65 	GPIO_Init(GPIOC,GPIO_Pin_2,GPIO_Mode_In_PU_No_IT);//RXD
 225  0050 4b40          	push	#64
 226  0052 4b04          	push	#4
 227  0054 ae500a        	ldw	x,#20490
 228  0057 cd0000        	call	_GPIO_Init
 230  005a 85            	popw	x
 231                     ; 67 	CLK_PeripheralClockConfig (CLK_Peripheral_USART1,ENABLE);//开启USART1时钟
 233  005b ae0501        	ldw	x,#1281
 234  005e cd0000        	call	_CLK_PeripheralClockConfig
 236                     ; 68 	CLK_PeripheralClockConfig (CLK_Peripheral_I2C1,ENABLE);//开启IIC1时钟
 238  0061 ae0301        	ldw	x,#769
 239  0064 cd0000        	call	_CLK_PeripheralClockConfig
 241                     ; 70 	USART_Init(USART1,9600,USART_WordLength_8b,USART_StopBits_1,USART_Parity_No,USART_Mode_Rx|USART_Mode_Tx);//设置USART参数9600，8N1，接收/发送
 243  0067 4b0c          	push	#12
 244  0069 4b00          	push	#0
 245  006b 4b00          	push	#0
 246  006d 4b00          	push	#0
 247  006f ae2580        	ldw	x,#9600
 248  0072 89            	pushw	x
 249  0073 ae0000        	ldw	x,#0
 250  0076 89            	pushw	x
 251  0077 ae5230        	ldw	x,#21040
 252  007a cd0000        	call	_USART_Init
 254  007d 5b08          	addw	sp,#8
 255                     ; 73   USART_SendStr("STM8L IIC读写测试:\r\n");
 257  007f ae0000        	ldw	x,#L77
 258  0082 ad8c          	call	_USART_SendStr
 260                     ; 75   InitIIC();//初始化IIC接口
 262  0084 cd0000        	call	_InitIIC
 264                     ; 76   EEPROM_WriteData(WBuf,EEPROM_BASE_ADDRESS,BufferSize);//将字符串写入AT24C0X
 266  0087 4b1e          	push	#30
 267  0089 4b02          	push	#2
 268  008b ae0000        	ldw	x,#_WBuf
 269  008e cd0000        	call	_EEPROM_WriteData
 271  0091 85            	popw	x
 272                     ; 77   EEPROM_ReadData(RBuf,EEPROM_BASE_ADDRESS,BufferSize);//从AT24C0X读出数据
 274  0092 4b1e          	push	#30
 275  0094 4b02          	push	#2
 276  0096 ae0000        	ldw	x,#_RBuf
 277  0099 cd0000        	call	_EEPROM_ReadData
 279  009c 85            	popw	x
 280                     ; 79   USART_SendStr(RBuf);//将读出的数据通过USART发送出来
 282  009d ae0000        	ldw	x,#_RBuf
 283  00a0 cd0010        	call	_USART_SendStr
 285  00a3               L101:
 286                     ; 83 		GPIO_ToggleBits(LED1_PORT, LED1_PINS);//翻转LED1接口电平，实现LED1闪烁
 288  00a3 4b10          	push	#16
 289  00a5 ae500a        	ldw	x,#20490
 290  00a8 cd0000        	call	_GPIO_ToggleBits
 292  00ab 84            	pop	a
 293                     ; 84 		Delay(0xFFFF);//延时，便于观察实验现象
 295  00ac aeffff        	ldw	x,#65535
 296  00af cd0000        	call	_Delay
 299  00b2 20ef          	jra	L101
 334                     	xdef	_main
 335                     	xdef	_USART_SendStr
 336                     	xdef	_Delay
 337                     	switch	.ubsct
 338  0000               _RBuf:
 339  0000 000000000000  	ds.b	30
 340                     	xdef	_RBuf
 341                     	xdef	_WBuf
 342                     	xref	_EEPROM_ReadData
 343                     	xref	_EEPROM_WriteData
 344                     	xref	_InitIIC
 345                     	xref	_USART_GetFlagStatus
 346                     	xref	_USART_SendData8
 347                     	xref	_USART_Init
 348                     	xref	_GPIO_ToggleBits
 349                     	xref	_GPIO_Init
 350                     	xref	_CLK_PeripheralClockConfig
 351                     .const:	section	.text
 352  0000               L77:
 353  0000 53544d384c20  	dc.b	"STM8L IIC",182
 354  000a c1d0b4b2e2ca  	dc.b	193,208,180,178,226,202
 355  0010 d43a0d0a00    	dc.b	212,58,13,10,0
 375                     	end
