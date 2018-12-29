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
 219                     .const:	section	.text
 220  0000               L21:
 221  0000 00000fff      	dc.l	4095
 222                     ; 59 int main( void )
 222                     ; 60 {
 223                     	switch	.text
 224  003a               _main:
 226  003a 89            	pushw	x
 227       00000002      OFST:	set	2
 230                     ; 64 	Ht1621_Init();        //上电初始化LCD 
 232  003b cd0000        	call	_Ht1621_Init
 234                     ; 65 	Delay(100);           //延时一段时间 
 236  003e ae0064        	ldw	x,#100
 237  0041 adbd          	call	_Delay
 239                     ; 68   CLK_PeripheralClockConfig (CLK_Peripheral_ADC1,ENABLE);//开启ADC时钟
 241  0043 ae1001        	ldw	x,#4097
 242  0046 cd0000        	call	_CLK_PeripheralClockConfig
 244                     ; 69   ADC_Init (ADC1,ADC_ConversionMode_Single,ADC_Resolution_12Bit,ADC_Prescaler_1);//ADC1，单次采样，12位，1分频
 246  0049 4b00          	push	#0
 247  004b 4b00          	push	#0
 248  004d 4b00          	push	#0
 249  004f ae5340        	ldw	x,#21312
 250  0052 cd0000        	call	_ADC_Init
 252  0055 5b03          	addw	sp,#3
 253                     ; 71   ADC_SamplingTimeConfig(ADC1,ADC_Group_FastChannels,ADC_SamplingTime_384Cycles);//采样周期设置
 255  0057 4b07          	push	#7
 256  0059 4b01          	push	#1
 257  005b ae5340        	ldw	x,#21312
 258  005e cd0000        	call	_ADC_SamplingTimeConfig
 260  0061 85            	popw	x
 261                     ; 72   ADC_VrefintCmd(ENABLE);//内部基准电压使能
 263  0062 a601          	ld	a,#1
 264  0064 cd0000        	call	_ADC_VrefintCmd
 266                     ; 73   ADC_ChannelCmd (ADC1,ADC_Channel_Vrefint,ENABLE);//使能内部基准电压测量通道
 268  0067 4b01          	push	#1
 269  0069 ae0010        	ldw	x,#16
 270  006c 89            	pushw	x
 271  006d ae5340        	ldw	x,#21312
 272  0070 cd0000        	call	_ADC_ChannelCmd
 274  0073 5b03          	addw	sp,#3
 275                     ; 75   ADC_Cmd(ADC1,ENABLE);//ADC1使能
 277  0075 4b01          	push	#1
 278  0077 ae5340        	ldw	x,#21312
 279  007a cd0000        	call	_ADC_Cmd
 281  007d 84            	pop	a
 282  007e               L111:
 283                     ; 80        ADC_SoftwareStartConv (ADC1);//开启软件转换
 285  007e ae5340        	ldw	x,#21312
 286  0081 cd0000        	call	_ADC_SoftwareStartConv
 289  0084               L711:
 290                     ; 82        while(!ADC_GetFlagStatus (ADC1,ADC_FLAG_EOC));//等待转换结束
 292  0084 4b01          	push	#1
 293  0086 ae5340        	ldw	x,#21312
 294  0089 cd0000        	call	_ADC_GetFlagStatus
 296  008c 5b01          	addw	sp,#1
 297  008e 4d            	tnz	a
 298  008f 27f3          	jreq	L711
 299                     ; 83        ADC_ClearFlag (ADC1,ADC_FLAG_EOC);//清除相关标识
 301  0091 4b01          	push	#1
 302  0093 ae5340        	ldw	x,#21312
 303  0096 cd0000        	call	_ADC_ClearFlag
 305  0099 84            	pop	a
 306                     ; 85        u16_adc1_value=ADC_GetConversionValue (ADC1);//获取转换值
 308  009a ae5340        	ldw	x,#21312
 309  009d cd0000        	call	_ADC_GetConversionValue
 311  00a0 1f01          	ldw	(OFST-1,sp),x
 313                     ; 86        VoltageValue=u16_adc1_value*3300UL/4095UL;
 315  00a2 1e01          	ldw	x,(OFST-1,sp)
 316  00a4 90ae0ce4      	ldw	y,#3300
 317  00a8 cd0000        	call	c_umul
 319  00ab ae0000        	ldw	x,#L21
 320  00ae cd0000        	call	c_ludv
 322  00b1 be02          	ldw	x,c_lreg+2
 323  00b3 1f01          	ldw	(OFST-1,sp),x
 325                     ; 88         data_convertor(VoltageValue);
 327  00b5 1e01          	ldw	x,(OFST-1,sp)
 328  00b7 cd0000        	call	c_uitolx
 330  00ba be02          	ldw	x,c_lreg+2
 331  00bc 89            	pushw	x
 332  00bd be00          	ldw	x,c_lreg
 333  00bf 89            	pushw	x
 334  00c0 cd0000        	call	_data_convertor
 336  00c3 5b04          	addw	sp,#4
 337                     ; 89         Display();
 339  00c5 cd0000        	call	_Display
 341                     ; 90         Display_lcd_dot();
 343  00c8 cd0000        	call	_Display_lcd_dot
 345                     ; 91         Delay(5000);  
 347  00cb ae1388        	ldw	x,#5000
 348  00ce cd0000        	call	_Delay
 350                     ; 92         Delay(5000); 
 352  00d1 ae1388        	ldw	x,#5000
 353  00d4 cd0000        	call	_Delay
 355                     ; 93         Delay(5000); 
 357  00d7 ae1388        	ldw	x,#5000
 358  00da cd0000        	call	_Delay
 360                     ; 94         Delay(5000); 
 362  00dd ae1388        	ldw	x,#5000
 363  00e0 cd0000        	call	_Delay
 365                     ; 95         Delay(5000);  
 367  00e3 ae1388        	ldw	x,#5000
 368  00e6 cd0000        	call	_Delay
 370                     ; 96         Delay(5000); 
 372  00e9 ae1388        	ldw	x,#5000
 373  00ec cd0000        	call	_Delay
 375                     ; 97         Delay(5000); 
 377  00ef ae1388        	ldw	x,#5000
 378  00f2 cd0000        	call	_Delay
 380                     ; 98         Delay(5000);
 382  00f5 ae1388        	ldw	x,#5000
 383  00f8 cd0000        	call	_Delay
 386  00fb 2081          	jra	L111
 399                     	xdef	_main
 400                     	xdef	_USART_SendStr
 401                     	xdef	_Delay
 402                     	xref	_data_convertor
 403                     	xref	_Display_lcd_dot
 404                     	xref	_Display
 405                     	xref	_Ht1621_Init
 406                     	xref	_USART_GetFlagStatus
 407                     	xref	_USART_SendData8
 408                     	xref	_CLK_PeripheralClockConfig
 409                     	xref	_ADC_ClearFlag
 410                     	xref	_ADC_GetFlagStatus
 411                     	xref	_ADC_GetConversionValue
 412                     	xref	_ADC_SamplingTimeConfig
 413                     	xref	_ADC_ChannelCmd
 414                     	xref	_ADC_VrefintCmd
 415                     	xref	_ADC_SoftwareStartConv
 416                     	xref	_ADC_Cmd
 417                     	xref	_ADC_Init
 418                     	xref.b	c_lreg
 419                     	xref.b	c_x
 420                     	xref.b	c_y
 439                     	xref	c_uitolx
 440                     	xref	c_ludv
 441                     	xref	c_umul
 442                     	end
