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
 122                     ; 40 int main( void )
 122                     ; 41 {
 123                     	switch	.text
 124  0010               _main:
 126  0010 88            	push	a
 127       00000001      OFST:	set	1
 130                     ; 44     GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//初始化LED接口，带上拉推挽输出低
 132  0011 4bc0          	push	#192
 133  0013 4b10          	push	#16
 134  0015 ae500a        	ldw	x,#20490
 135  0018 cd0000        	call	_GPIO_Init
 137  001b 85            	popw	x
 138                     ; 49     CLK_HSICmd(ENABLE);//开始内部高频RC 16M
 140  001c a601          	ld	a,#1
 141  001e cd0000        	call	_CLK_HSICmd
 143                     ; 50     CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);//HSI为系统时钟
 145  0021 a601          	ld	a,#1
 146  0023 cd0000        	call	_CLK_SYSCLKSourceConfig
 148                     ; 51     CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//不分频，即1分频，16M
 150  0026 4f            	clr	a
 151  0027 cd0000        	call	_CLK_SYSCLKDivConfig
 153                     ; 53     for(i=0;i<10;i++)//翻转LED
 155  002a 0f01          	clr	(OFST+0,sp)
 157  002c               L35:
 158                     ; 55        GPIO_ToggleBits(LED1_PORT, (GPIO_Pin_TypeDef)LED1_PINS);
 160  002c 4b10          	push	#16
 161  002e ae500a        	ldw	x,#20490
 162  0031 cd0000        	call	_GPIO_ToggleBits
 164  0034 84            	pop	a
 165                     ; 56        Delay(0xFFFF);
 167  0035 aeffff        	ldw	x,#65535
 168  0038 adc6          	call	_Delay
 170                     ; 53     for(i=0;i<10;i++)//翻转LED
 172  003a 0c01          	inc	(OFST+0,sp)
 176  003c 7b01          	ld	a,(OFST+0,sp)
 177  003e a10a          	cp	a,#10
 178  0040 25ea          	jrult	L35
 179                     ; 59     CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_8);//8分频，2M
 181  0042 a603          	ld	a,#3
 182  0044 cd0000        	call	_CLK_SYSCLKDivConfig
 184                     ; 61     for(i=0;i<10;i++)//翻转LED
 186  0047 0f01          	clr	(OFST+0,sp)
 188  0049               L16:
 189                     ; 63        GPIO_ToggleBits(LED1_PORT, (GPIO_Pin_TypeDef)LED1_PINS);
 191  0049 4b10          	push	#16
 192  004b ae500a        	ldw	x,#20490
 193  004e cd0000        	call	_GPIO_ToggleBits
 195  0051 84            	pop	a
 196                     ; 64        Delay(0xFFFF);
 198  0052 aeffff        	ldw	x,#65535
 199  0055 ada9          	call	_Delay
 201                     ; 61     for(i=0;i<10;i++)//翻转LED
 203  0057 0c01          	inc	(OFST+0,sp)
 207  0059 7b01          	ld	a,(OFST+0,sp)
 208  005b a10a          	cp	a,#10
 209  005d 25ea          	jrult	L16
 210                     ; 68     CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSE);//系统主时钟为HSE
 212  005f a604          	ld	a,#4
 213  0061 cd0000        	call	_CLK_SYSCLKSourceConfig
 216  0064               L17:
 217                     ; 70     while(CLK_GetFlagStatus(CLK_FLAG_HSERDY)==RESET);//等待HSE准备就绪
 219  0064 a631          	ld	a,#49
 220  0066 cd0000        	call	_CLK_GetFlagStatus
 222  0069 4d            	tnz	a
 223  006a 27f8          	jreq	L17
 224                     ; 71     CLK_SYSCLKSourceSwitchCmd(ENABLE);//使能切换
 226  006c a601          	ld	a,#1
 227  006e cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 229                     ; 73     if(CLK_GetSYSCLKSource()==CLK_SYSCLKSource_HSE)//如果切换成功
 231  0071 cd0000        	call	_CLK_GetSYSCLKSource
 233  0074 a104          	cp	a,#4
 234  0076 261e          	jrne	L57
 235                     ; 75        CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_2);//2分频,8M
 237  0078 a601          	ld	a,#1
 238  007a cd0000        	call	_CLK_SYSCLKDivConfig
 240                     ; 76        for(i=0;i<10;i++)
 242  007d 0f01          	clr	(OFST+0,sp)
 244  007f               L77:
 245                     ; 78           GPIO_ToggleBits(LED1_PORT, LED1_PINS);
 247  007f 4b10          	push	#16
 248  0081 ae500a        	ldw	x,#20490
 249  0084 cd0000        	call	_GPIO_ToggleBits
 251  0087 84            	pop	a
 252                     ; 79           Delay(0xFFFF);
 254  0088 aeffff        	ldw	x,#65535
 255  008b cd0000        	call	_Delay
 257                     ; 76        for(i=0;i<10;i++)
 259  008e 0c01          	inc	(OFST+0,sp)
 263  0090 7b01          	ld	a,(OFST+0,sp)
 264  0092 a10a          	cp	a,#10
 265  0094 25e9          	jrult	L77
 266  0096               L57:
 267                     ; 84     CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSE);//系统主时钟为LSE
 269  0096 a608          	ld	a,#8
 270  0098 cd0000        	call	_CLK_SYSCLKSourceConfig
 273  009b               L701:
 274                     ; 86     while(CLK_GetFlagStatus(CLK_FLAG_LSERDY)==RESET);//等待LSE准备就绪
 276  009b a633          	ld	a,#51
 277  009d cd0000        	call	_CLK_GetFlagStatus
 279  00a0 4d            	tnz	a
 280  00a1 27f8          	jreq	L701
 281                     ; 87     CLK_SYSCLKSourceSwitchCmd(ENABLE);//使能切换
 283  00a3 a601          	ld	a,#1
 284  00a5 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 286                     ; 89     if(CLK_GetSYSCLKSource()==CLK_SYSCLKSource_LSE)//如果切换成功
 288  00a8 cd0000        	call	_CLK_GetSYSCLKSource
 290  00ab a108          	cp	a,#8
 291  00ad 261d          	jrne	L321
 292                     ; 91        CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//
 294  00af 4f            	clr	a
 295  00b0 cd0000        	call	_CLK_SYSCLKDivConfig
 297                     ; 92        for(i=0;i<2;i++)
 299  00b3 0f01          	clr	(OFST+0,sp)
 301  00b5               L511:
 302                     ; 94           GPIO_ToggleBits(LED1_PORT, LED1_PINS);
 304  00b5 4b10          	push	#16
 305  00b7 ae500a        	ldw	x,#20490
 306  00ba cd0000        	call	_GPIO_ToggleBits
 308  00bd 84            	pop	a
 309                     ; 95           Delay(0x0FFF);
 311  00be ae0fff        	ldw	x,#4095
 312  00c1 cd0000        	call	_Delay
 314                     ; 92        for(i=0;i<2;i++)
 316  00c4 0c01          	inc	(OFST+0,sp)
 320  00c6 7b01          	ld	a,(OFST+0,sp)
 321  00c8 a102          	cp	a,#2
 322  00ca 25e9          	jrult	L511
 323  00cc               L321:
 324                     ; 103         CLK_LSICmd (ENABLE);    //使能LSI
 326  00cc a601          	ld	a,#1
 327  00ce cd0000        	call	_CLK_LSICmd
 329                     ; 104         CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);//LSI为系统时钟
 331  00d1 a602          	ld	a,#2
 332  00d3 cd0000        	call	_CLK_SYSCLKSourceConfig
 335  00d6               L131:
 336                     ; 105         while(CLK_GetFlagStatus(CLK_FLAG_LSIRDY)==RESET);//等待LSI准备就绪
 338  00d6 a613          	ld	a,#19
 339  00d8 cd0000        	call	_CLK_GetFlagStatus
 341  00db 4d            	tnz	a
 342  00dc 27f8          	jreq	L131
 343                     ; 106         CLK_SYSCLKSourceSwitchCmd (ENABLE);//使能切换
 345  00de a601          	ld	a,#1
 346  00e0 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 348                     ; 107         if(CLK_GetSYSCLKSource()==CLK_SYSCLKSource_LSI)//如果切换成功
 350  00e3 cd0000        	call	_CLK_GetSYSCLKSource
 352  00e6 a102          	cp	a,#2
 353  00e8 26e2          	jrne	L321
 354                     ; 110           CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);//不分频  
 356  00ea 4f            	clr	a
 357  00eb cd0000        	call	_CLK_SYSCLKDivConfig
 359                     ; 111           for(i=0;i<2;i++)
 361  00ee 0f01          	clr	(OFST+0,sp)
 363  00f0               L731:
 364                     ; 113              GPIO_ToggleBits(LED1_PORT, (GPIO_Pin_TypeDef)LED1_PINS);
 366  00f0 4b10          	push	#16
 367  00f2 ae500a        	ldw	x,#20490
 368  00f5 cd0000        	call	_GPIO_ToggleBits
 370  00f8 84            	pop	a
 371                     ; 114              Delay(0x0FFF);
 373  00f9 ae0fff        	ldw	x,#4095
 374  00fc cd0000        	call	_Delay
 376                     ; 111           for(i=0;i<2;i++)
 378  00ff 0c01          	inc	(OFST+0,sp)
 382  0101 7b01          	ld	a,(OFST+0,sp)
 383  0103 a102          	cp	a,#2
 384  0105 25e9          	jrult	L731
 385  0107 20c3          	jra	L321
 398                     	xdef	_main
 399                     	xdef	_Delay
 400                     	xref	_GPIO_ToggleBits
 401                     	xref	_GPIO_Init
 402                     	xref	_CLK_GetFlagStatus
 403                     	xref	_CLK_SYSCLKSourceSwitchCmd
 404                     	xref	_CLK_SYSCLKDivConfig
 405                     	xref	_CLK_GetSYSCLKSource
 406                     	xref	_CLK_SYSCLKSourceConfig
 407                     	xref	_CLK_LSICmd
 408                     	xref	_CLK_HSICmd
 427                     	end
