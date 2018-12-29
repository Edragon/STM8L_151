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
 110                     ; 39 void RTC_Config(void)
 110                     ; 40 {
 111                     	switch	.text
 112  0010               _RTC_Config:
 116                     ; 43 			  CLK_LSICmd(ENABLE);
 118  0010 a601          	ld	a,#1
 119  0012 cd0000        	call	_CLK_LSICmd
 122  0015               L74:
 123                     ; 44         while (CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == RESET);//等待晶振准备就绪
 125  0015 a613          	ld	a,#19
 126  0017 cd0000        	call	_CLK_GetFlagStatus
 128  001a 4d            	tnz	a
 129  001b 27f8          	jreq	L74
 130                     ; 45         CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);//RTC时钟分频
 132  001d ae0400        	ldw	x,#1024
 133  0020 cd0000        	call	_CLK_RTCClockConfig
 135                     ; 47         RTC_WakeUpCmd(DISABLE);//需要先关闭RTC唤醒
 137  0023 4f            	clr	a
 138  0024 cd0000        	call	_RTC_WakeUpCmd
 140                     ; 48         CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);//RTC时钟门控使能，RTC功能才可以使用
 142  0027 ae1201        	ldw	x,#4609
 143  002a cd0000        	call	_CLK_PeripheralClockConfig
 145                     ; 49         RTC_WakeUpClockConfig(RTC_WakeUpClock_RTCCLK_Div16);//38K/16=2375HZ t=0.421ms
 147  002d 4f            	clr	a
 148  002e cd0000        	call	_RTC_WakeUpClockConfig
 150                     ; 51         Delay(0xffff);//延时等待配置生效，一定要加
 152  0031 aeffff        	ldw	x,#65535
 153  0034 adca          	call	_Delay
 155                     ; 53         RTC_ITConfig(RTC_IT_WUT, ENABLE);//唤醒定时器中断使能
 157  0036 4b01          	push	#1
 158  0038 ae0040        	ldw	x,#64
 159  003b cd0000        	call	_RTC_ITConfig
 161  003e 84            	pop	a
 162                     ; 54         RTC_SetWakeUpCounter(1000); //修改此值可改变唤醒的时间间隔
 164  003f ae03e8        	ldw	x,#1000
 165  0042 cd0000        	call	_RTC_SetWakeUpCounter
 167                     ; 55         RTC_WakeUpCmd(ENABLE);//RTC唤醒使能
 169  0045 a601          	ld	a,#1
 170  0047 cd0000        	call	_RTC_WakeUpCmd
 172                     ; 59 }
 175  004a 81            	ret
 204                     ; 76 void main(void)
 204                     ; 77 {
 205                     	switch	.text
 206  004b               _main:
 210                     ; 78 		PWR_FastWakeUpCmd(ENABLE);  //快速唤醒使能
 212  004b a601          	ld	a,#1
 213  004d cd0000        	call	_PWR_FastWakeUpCmd
 215                     ; 80 		RTC_Config();//配置RTC
 217  0050 adbe          	call	_RTC_Config
 219                     ; 83     GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 221  0052 4bc0          	push	#192
 222  0054 4bff          	push	#255
 223  0056 ae5000        	ldw	x,#20480
 224  0059 cd0000        	call	_GPIO_Init
 226  005c 85            	popw	x
 227                     ; 84     GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 229  005d 4bc0          	push	#192
 230  005f 4bff          	push	#255
 231  0061 ae5005        	ldw	x,#20485
 232  0064 cd0000        	call	_GPIO_Init
 234  0067 85            	popw	x
 235                     ; 85     GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 237  0068 4bc0          	push	#192
 238  006a 4bff          	push	#255
 239  006c ae500a        	ldw	x,#20490
 240  006f cd0000        	call	_GPIO_Init
 242  0072 85            	popw	x
 243                     ; 86     GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 245  0073 4bc0          	push	#192
 246  0075 4bff          	push	#255
 247  0077 ae500f        	ldw	x,#20495
 248  007a cd0000        	call	_GPIO_Init
 250  007d 85            	popw	x
 251                     ; 88     GPIO_Init(LED1_PORT, LED1_PINS, GPIO_Mode_Out_PP_Low_Slow);//GPIO初始化
 253  007e 4bc0          	push	#192
 254  0080 4b10          	push	#16
 255  0082 ae500a        	ldw	x,#20490
 256  0085 cd0000        	call	_GPIO_Init
 258  0088 85            	popw	x
 259                     ; 90     PWR_UltraLowPowerCmd(ENABLE);//超低功耗
 261  0089 a601          	ld	a,#1
 262  008b cd0000        	call	_PWR_UltraLowPowerCmd
 264                     ; 91 		enableInterrupts();//使能中断
 267  008e 9a            rim
 269  008f               L36:
 270                     ; 95         halt();//进入低功耗休眠模式
 273  008f 8e            halt
 277  0090 20fd          	jra	L36
 290                     	xdef	_main
 291                     	xdef	_RTC_Config
 292                     	xdef	_Delay
 293                     	xref	_RTC_ITConfig
 294                     	xref	_RTC_WakeUpCmd
 295                     	xref	_RTC_SetWakeUpCounter
 296                     	xref	_RTC_WakeUpClockConfig
 297                     	xref	_PWR_UltraLowPowerCmd
 298                     	xref	_PWR_FastWakeUpCmd
 299                     	xref	_GPIO_Init
 300                     	xref	_CLK_GetFlagStatus
 301                     	xref	_CLK_PeripheralClockConfig
 302                     	xref	_CLK_RTCClockConfig
 303                     	xref	_CLK_LSICmd
 322                     	end
