   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  53                     ; 31 void Delay(__IO uint16_t nCount)
  53                     ; 32 {
  55                     	switch	.text
  56  0000               _Delay:
  58  0000 89            	pushw	x
  59       00000000      OFST:	set	0
  62  0001 2007          	jra	L13
  63  0003               L72:
  64                     ; 36         nCount--;
  66  0003 1e01          	ldw	x,(OFST+1,sp)
  67  0005 1d0001        	subw	x,#1
  68  0008 1f01          	ldw	(OFST+1,sp),x
  69  000a               L13:
  70                     ; 34     while (nCount != 0)
  72  000a 1e01          	ldw	x,(OFST+1,sp)
  73  000c 26f5          	jrne	L72
  74                     ; 38 }
  77  000e 85            	popw	x
  78  000f 81            	ret
 114                     ; 46 void Calendar_Init(void)
 114                     ; 47 {
 115                     	switch	.text
 116  0010               _Calendar_Init:
 120                     ; 48   RTC_InitStr.RTC_HourFormat = RTC_HourFormat_24;
 122  0010 3f0f          	clr	_RTC_InitStr
 123                     ; 49   RTC_InitStr.RTC_AsynchPrediv = 0x7f;
 125  0012 357f0010      	mov	_RTC_InitStr+1,#127
 126                     ; 50   RTC_InitStr.RTC_SynchPrediv = 0x0139;//调大 时间变慢，调小 时间变快
 128  0016 ae0139        	ldw	x,#313
 129  0019 bf11          	ldw	_RTC_InitStr+2,x
 130                     ; 51   RTC_Init(&RTC_InitStr);
 132  001b ae000f        	ldw	x,#_RTC_InitStr
 133  001e cd0000        	call	_RTC_Init
 135                     ; 53   RTC_DateStructInit(&RTC_DateStr);
 137  0021 ae0007        	ldw	x,#_RTC_DateStr
 138  0024 cd0000        	call	_RTC_DateStructInit
 140                     ; 54   RTC_DateStr.RTC_WeekDay = RTC_Weekday_Friday;
 142  0027 35050007      	mov	_RTC_DateStr,#5
 143                     ; 55   RTC_DateStr.RTC_Date = 13;
 145  002b 350d0009      	mov	_RTC_DateStr+2,#13
 146                     ; 56   RTC_DateStr.RTC_Month = RTC_Month_May;
 148  002f 35050008      	mov	_RTC_DateStr+1,#5
 149                     ; 57   RTC_DateStr.RTC_Year = 11;
 151  0033 350b000a      	mov	_RTC_DateStr+3,#11
 152                     ; 58   RTC_SetDate(RTC_Format_BIN, &RTC_DateStr);
 154  0037 ae0007        	ldw	x,#_RTC_DateStr
 155  003a 89            	pushw	x
 156  003b 4f            	clr	a
 157  003c cd0000        	call	_RTC_SetDate
 159  003f 85            	popw	x
 160                     ; 60   RTC_TimeStructInit(&RTC_TimeStr);
 162  0040 ae000b        	ldw	x,#_RTC_TimeStr
 163  0043 cd0000        	call	_RTC_TimeStructInit
 165                     ; 61   RTC_TimeStr.RTC_Hours   = 01;
 167  0046 3501000b      	mov	_RTC_TimeStr,#1
 168                     ; 62   RTC_TimeStr.RTC_Minutes = 00;
 170  004a 3f0c          	clr	_RTC_TimeStr+1
 171                     ; 63   RTC_TimeStr.RTC_Seconds = 00;
 173  004c 3f0d          	clr	_RTC_TimeStr+2
 174                     ; 64   RTC_SetTime(RTC_Format_BIN, &RTC_TimeStr);
 176  004e ae000b        	ldw	x,#_RTC_TimeStr
 177  0051 89            	pushw	x
 178  0052 4f            	clr	a
 179  0053 cd0000        	call	_RTC_SetTime
 181  0056 85            	popw	x
 182                     ; 67   RTC_AlarmStructInit(&RTC_AlarmStr);
 184  0057 ae0000        	ldw	x,#_RTC_AlarmStr
 185  005a cd0000        	call	_RTC_AlarmStructInit
 187                     ; 68   RTC_AlarmStr.RTC_AlarmTime.RTC_Hours   = 01;
 189  005d 35010000      	mov	_RTC_AlarmStr,#1
 190                     ; 69   RTC_AlarmStr.RTC_AlarmTime.RTC_Minutes = 01;
 192  0061 35010001      	mov	_RTC_AlarmStr+1,#1
 193                     ; 70   RTC_AlarmStr.RTC_AlarmTime.RTC_Seconds = 00;
 195  0065 3f02          	clr	_RTC_AlarmStr+2
 196                     ; 71   RTC_AlarmStr.RTC_AlarmMask = RTC_AlarmMask_DateWeekDay;
 198  0067 35100004      	mov	_RTC_AlarmStr+4,#16
 199                     ; 72   RTC_SetAlarm(RTC_Format_BIN, &RTC_AlarmStr);
 201  006b ae0000        	ldw	x,#_RTC_AlarmStr
 202  006e 89            	pushw	x
 203  006f 4f            	clr	a
 204  0070 cd0000        	call	_RTC_SetAlarm
 206  0073 85            	popw	x
 207                     ; 74   RTC_ITConfig(RTC_IT_ALRA, ENABLE);
 209  0074 4b01          	push	#1
 210  0076 ae0010        	ldw	x,#16
 211  0079 cd0000        	call	_RTC_ITConfig
 213  007c 84            	pop	a
 214                     ; 75   RTC_AlarmCmd(ENABLE);
 216  007d a601          	ld	a,#1
 217  007f cd0000        	call	_RTC_AlarmCmd
 219                     ; 76 }
 222  0082 81            	ret
 276                     ; 83 int main( void )
 276                     ; 84 {
 277                     	switch	.text
 278  0083               _main:
 280  0083 5204          	subw	sp,#4
 281       00000004      OFST:	set	4
 284                     ; 86     CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);//RTC时钟使用LSE
 286  0085 ae0400        	ldw	x,#1024
 287  0088 cd0000        	call	_CLK_RTCClockConfig
 289                     ; 87     CLK_PeripheralClockConfig (CLK_Peripheral_RTC,ENABLE);//开启RTC时钟门控
 291  008b ae1201        	ldw	x,#4609
 292  008e cd0000        	call	_CLK_PeripheralClockConfig
 294                     ; 88     RTC_DeInit( ); //RTC初始化至初始状态
 296  0091 cd0000        	call	_RTC_DeInit
 298                     ; 90     Calendar_Init();
 300  0094 cd0010        	call	_Calendar_Init
 302                     ; 92     Delay(100);           //延时一段时间 
 304  0097 ae0064        	ldw	x,#100
 305  009a cd0000        	call	_Delay
 307                     ; 93     Ht1621_Init();        //上电初始化LCD
 309  009d cd0000        	call	_Ht1621_Init
 311                     ; 94     Delay(100);           //延时一段时间 
 313  00a0 ae0064        	ldw	x,#100
 314  00a3 cd0000        	call	_Delay
 316  00a6               L76:
 317                     ; 99         RTC_GetTime(RTC_Format_BIN, &RTC_TimeStr);//获取目前时间
 319  00a6 ae000b        	ldw	x,#_RTC_TimeStr
 320  00a9 89            	pushw	x
 321  00aa 4f            	clr	a
 322  00ab cd0000        	call	_RTC_GetTime
 324  00ae 85            	popw	x
 325                     ; 100         temp1 = RTC_TimeStr.RTC_Seconds;//秒
 327  00af b60d          	ld	a,_RTC_TimeStr+2
 328  00b1 5f            	clrw	x
 329  00b2 97            	ld	xl,a
 330  00b3 1f01          	ldw	(OFST-3,sp),x
 332                     ; 101         temp2=RTC_TimeStr.RTC_Minutes;  //分
 334  00b5 b60c          	ld	a,_RTC_TimeStr+1
 335  00b7 5f            	clrw	x
 336  00b8 97            	ld	xl,a
 337  00b9 1f03          	ldw	(OFST-1,sp),x
 339                     ; 103         data_convertor(temp2*100+temp1);
 341  00bb 1e03          	ldw	x,(OFST-1,sp)
 342  00bd 90ae0064      	ldw	y,#100
 343  00c1 cd0000        	call	c_imul
 345  00c4 72fb01        	addw	x,(OFST-3,sp)
 346  00c7 cd0000        	call	c_uitolx
 348  00ca be02          	ldw	x,c_lreg+2
 349  00cc 89            	pushw	x
 350  00cd be00          	ldw	x,c_lreg
 351  00cf 89            	pushw	x
 352  00d0 cd0000        	call	_data_convertor
 354  00d3 5b04          	addw	sp,#4
 355                     ; 104         Display();//显示时间
 357  00d5 cd0000        	call	_Display
 359                     ; 105         Display_lcd_dot();//显示符号
 361  00d8 cd0000        	call	_Display_lcd_dot
 363                     ; 106 				Delay(0xffff);
 365  00db aeffff        	ldw	x,#65535
 366  00de cd0000        	call	_Delay
 369  00e1 20c3          	jra	L76
 789                     	xdef	_main
 790                     	xdef	_Calendar_Init
 791                     	xdef	_Delay
 792                     	switch	.ubsct
 793  0000               _RTC_AlarmStr:
 794  0000 000000000000  	ds.b	7
 795                     	xdef	_RTC_AlarmStr
 796  0007               _RTC_DateStr:
 797  0007 00000000      	ds.b	4
 798                     	xdef	_RTC_DateStr
 799  000b               _RTC_TimeStr:
 800  000b 00000000      	ds.b	4
 801                     	xdef	_RTC_TimeStr
 802  000f               _RTC_InitStr:
 803  000f 00000000      	ds.b	4
 804                     	xdef	_RTC_InitStr
 805                     	xref	_data_convertor
 806                     	xref	_Display_lcd_dot
 807                     	xref	_Display
 808                     	xref	_Ht1621_Init
 809                     	xref	_RTC_ITConfig
 810                     	xref	_RTC_AlarmCmd
 811                     	xref	_RTC_AlarmStructInit
 812                     	xref	_RTC_SetAlarm
 813                     	xref	_RTC_DateStructInit
 814                     	xref	_RTC_SetDate
 815                     	xref	_RTC_GetTime
 816                     	xref	_RTC_TimeStructInit
 817                     	xref	_RTC_SetTime
 818                     	xref	_RTC_Init
 819                     	xref	_RTC_DeInit
 820                     	xref	_CLK_PeripheralClockConfig
 821                     	xref	_CLK_RTCClockConfig
 822                     	xref.b	c_lreg
 823                     	xref.b	c_x
 843                     	xref	c_uitolx
 844                     	xref	c_imul
 845                     	end
