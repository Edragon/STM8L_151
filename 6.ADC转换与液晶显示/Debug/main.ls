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
 115                     ; 40 void USART_SendStr(unsigned char *Str) 
 115                     ; 41 {
 116                     	switch	.text
 117  0010               _USART_SendStr:
 119  0010 89            	pushw	x
 120       00000000      OFST:	set	0
 123  0011 2020          	jra	L55
 124  0013               L35:
 125                     ; 44             USART_SendData8(USART1,*Str);     //发送数据 
 127  0013 1e01          	ldw	x,(OFST+1,sp)
 128  0015 f6            	ld	a,(x)
 129  0016 88            	push	a
 130  0017 ae5230        	ldw	x,#21040
 131  001a cd0000        	call	_USART_SendData8
 133  001d 84            	pop	a
 135  001e               L36:
 136                     ; 45             while(!USART_GetFlagStatus (USART1,USART_FLAG_TXE));//等待发送完毕
 138  001e ae0080        	ldw	x,#128
 139  0021 89            	pushw	x
 140  0022 ae5230        	ldw	x,#21040
 141  0025 cd0000        	call	_USART_GetFlagStatus
 143  0028 85            	popw	x
 144  0029 4d            	tnz	a
 145  002a 27f2          	jreq	L36
 146                     ; 46             Str++;//下一个数据
 148  002c 1e01          	ldw	x,(OFST+1,sp)
 149  002e 1c0001        	addw	x,#1
 150  0031 1f01          	ldw	(OFST+1,sp),x
 151  0033               L55:
 152                     ; 42         while(*Str!=0)//不为结束
 154  0033 1e01          	ldw	x,(OFST+1,sp)
 155  0035 7d            	tnz	(x)
 156  0036 26db          	jrne	L35
 157                     ; 48 }
 160  0038 85            	popw	x
 161  0039 81            	ret
 218                     .const:	section	.text
 219  0000               L21:
 220  0000 00000fff      	dc.l	4095
 221                     ; 58 int main( void )
 221                     ; 59 {
 222                     	switch	.text
 223  003a               _main:
 225  003a 89            	pushw	x
 226       00000002      OFST:	set	2
 229                     ; 63 	  GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);
 231  003b 4bc0          	push	#192
 232  003d 4b10          	push	#16
 233  003f ae500a        	ldw	x,#20490
 234  0042 cd0000        	call	_GPIO_Init
 236  0045 85            	popw	x
 237                     ; 65 		Ht1621_Init();        //上电初始化LCD 
 239  0046 cd0000        	call	_Ht1621_Init
 241                     ; 66     Delay(100);           //延时一段时间 
 243  0049 ae0064        	ldw	x,#100
 244  004c adb2          	call	_Delay
 246                     ; 69     CLK_PeripheralClockConfig (CLK_Peripheral_ADC1,ENABLE);//开启ADC/USART时钟
 248  004e ae1001        	ldw	x,#4097
 249  0051 cd0000        	call	_CLK_PeripheralClockConfig
 251                     ; 70     ADC_Init (ADC1,ADC_ConversionMode_Single,ADC_Resolution_12Bit,ADC_Prescaler_1);//ADC1初始化，单次转换/12位/ADC时钟1分频
 253  0054 4b00          	push	#0
 254  0056 4b00          	push	#0
 255  0058 4b00          	push	#0
 256  005a ae5340        	ldw	x,#21312
 257  005d cd0000        	call	_ADC_Init
 259  0060 5b03          	addw	sp,#3
 260                     ; 71     ADC_Cmd(ADC1,ENABLE);//ADC1使能
 262  0062 4b01          	push	#1
 263  0064 ae5340        	ldw	x,#21312
 264  0067 cd0000        	call	_ADC_Cmd
 266  006a 84            	pop	a
 267                     ; 72     ADC_ChannelCmd (ADC1,ADC_Channel_8,ENABLE);//ADC通道8，PD6
 269  006b 4b01          	push	#1
 270  006d ae0201        	ldw	x,#513
 271  0070 89            	pushw	x
 272  0071 ae5340        	ldw	x,#21312
 273  0074 cd0000        	call	_ADC_ChannelCmd
 275  0077 5b03          	addw	sp,#3
 276                     ; 74     Delay(100);           //延时一段时间 
 278  0079 ae0064        	ldw	x,#100
 279  007c ad82          	call	_Delay
 281  007e               L111:
 282                     ; 77         Delay(5000);  
 284  007e ae1388        	ldw	x,#5000
 285  0081 cd0000        	call	_Delay
 287                     ; 78         Delay(5000); 
 289  0084 ae1388        	ldw	x,#5000
 290  0087 cd0000        	call	_Delay
 292                     ; 79         Delay(5000); 
 294  008a ae1388        	ldw	x,#5000
 295  008d cd0000        	call	_Delay
 297                     ; 80         Delay(5000); 
 299  0090 ae1388        	ldw	x,#5000
 300  0093 cd0000        	call	_Delay
 302                     ; 81         ADC_SoftwareStartConv (ADC1);//ADC1软件触发
 304  0096 ae5340        	ldw	x,#21312
 305  0099 cd0000        	call	_ADC_SoftwareStartConv
 308  009c               L711:
 309                     ; 82         while(!ADC_GetFlagStatus (ADC1,ADC_FLAG_EOC));//等待转换结束
 311  009c 4b01          	push	#1
 312  009e ae5340        	ldw	x,#21312
 313  00a1 cd0000        	call	_ADC_GetFlagStatus
 315  00a4 5b01          	addw	sp,#1
 316  00a6 4d            	tnz	a
 317  00a7 27f3          	jreq	L711
 318                     ; 83         ADC_ClearFlag (ADC1,ADC_FLAG_EOC);//清除标志
 320  00a9 4b01          	push	#1
 321  00ab ae5340        	ldw	x,#21312
 322  00ae cd0000        	call	_ADC_ClearFlag
 324  00b1 84            	pop	a
 325                     ; 84         Delay(5000);  
 327  00b2 ae1388        	ldw	x,#5000
 328  00b5 cd0000        	call	_Delay
 330                     ; 85         Delay(5000); 
 332  00b8 ae1388        	ldw	x,#5000
 333  00bb cd0000        	call	_Delay
 335                     ; 86         Delay(5000); 
 337  00be ae1388        	ldw	x,#5000
 338  00c1 cd0000        	call	_Delay
 340                     ; 87         Delay(5000); 
 342  00c4 ae1388        	ldw	x,#5000
 343  00c7 cd0000        	call	_Delay
 345                     ; 88         u16_adc1_value=ADC_GetConversionValue (ADC1);//获取转换值
 347  00ca ae5340        	ldw	x,#21312
 348  00cd cd0000        	call	_ADC_GetConversionValue
 350  00d0 1f01          	ldw	(OFST-1,sp),x
 352                     ; 89         VoltageValue=u16_adc1_value*3300UL/4095UL;//电压转换
 354  00d2 1e01          	ldw	x,(OFST-1,sp)
 355  00d4 90ae0ce4      	ldw	y,#3300
 356  00d8 cd0000        	call	c_umul
 358  00db ae0000        	ldw	x,#L21
 359  00de cd0000        	call	c_ludv
 361  00e1 be02          	ldw	x,c_lreg+2
 362  00e3 1f01          	ldw	(OFST-1,sp),x
 364                     ; 92         data_convertor(VoltageValue);//转换为能够显示的数值
 366  00e5 1e01          	ldw	x,(OFST-1,sp)
 367  00e7 cd0000        	call	c_uitolx
 369  00ea be02          	ldw	x,c_lreg+2
 370  00ec 89            	pushw	x
 371  00ed be00          	ldw	x,c_lreg
 372  00ef 89            	pushw	x
 373  00f0 cd0000        	call	_data_convertor
 375  00f3 5b04          	addw	sp,#4
 376                     ; 93         Display();//显示数值
 378  00f5 cd0000        	call	_Display
 380                     ; 94         Display_lcd_dot();//显示小数点
 382  00f8 cd0000        	call	_Display_lcd_dot
 384                     ; 95         Delay(5000);  
 386  00fb ae1388        	ldw	x,#5000
 387  00fe cd0000        	call	_Delay
 389                     ; 96         Delay(5000); 
 391  0101 ae1388        	ldw	x,#5000
 392  0104 cd0000        	call	_Delay
 394                     ; 97         Delay(5000); 
 396  0107 ae1388        	ldw	x,#5000
 397  010a cd0000        	call	_Delay
 399                     ; 98         Delay(5000); 
 401  010d ae1388        	ldw	x,#5000
 402  0110 cd0000        	call	_Delay
 404                     ; 99         Delay(5000);  
 406  0113 ae1388        	ldw	x,#5000
 407  0116 cd0000        	call	_Delay
 409                     ; 100         Delay(5000); 
 411  0119 ae1388        	ldw	x,#5000
 412  011c cd0000        	call	_Delay
 414                     ; 101         Delay(5000); 
 416  011f ae1388        	ldw	x,#5000
 417  0122 cd0000        	call	_Delay
 419                     ; 102         Delay(5000); 
 421  0125 ae1388        	ldw	x,#5000
 422  0128 cd0000        	call	_Delay
 425  012b ac7e007e      	jpf	L111
 438                     	xdef	_main
 439                     	xdef	_USART_SendStr
 440                     	xdef	_Delay
 441                     	xref	_data_convertor
 442                     	xref	_Display_lcd_dot
 443                     	xref	_Display
 444                     	xref	_Ht1621_Init
 445                     	xref	_USART_GetFlagStatus
 446                     	xref	_USART_SendData8
 447                     	xref	_GPIO_Init
 448                     	xref	_CLK_PeripheralClockConfig
 449                     	xref	_ADC_ClearFlag
 450                     	xref	_ADC_GetFlagStatus
 451                     	xref	_ADC_GetConversionValue
 452                     	xref	_ADC_ChannelCmd
 453                     	xref	_ADC_SoftwareStartConv
 454                     	xref	_ADC_Cmd
 455                     	xref	_ADC_Init
 456                     	xref.b	c_lreg
 457                     	xref.b	c_x
 458                     	xref.b	c_y
 477                     	xref	c_uitolx
 478                     	xref	c_ludv
 479                     	xref	c_umul
 480                     	end
