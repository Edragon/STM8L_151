   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     	bsct
  15  0000               _frq:
  16  0000 00000000      	dc.l	0
  56                     ; 27 void Delay(__IO uint16_t nCount)
  56                     ; 28 {
  58                     	switch	.text
  59  0000               _Delay:
  61  0000 89            	pushw	x
  62       00000000      OFST:	set	0
  65  0001 2007          	jra	L13
  66  0003               L72:
  67                     ; 32         nCount--;
  69  0003 1e01          	ldw	x,(OFST+1,sp)
  70  0005 1d0001        	subw	x,#1
  71  0008 1f01          	ldw	(OFST+1,sp),x
  72  000a               L13:
  73                     ; 30     while (nCount != 0)
  75  000a 1e01          	ldw	x,(OFST+1,sp)
  76  000c 26f5          	jrne	L72
  77                     ; 34 }
  80  000e 85            	popw	x
  81  000f 81            	ret
 149                     ; 43 uint32_t TIM2_ComputeLsiClockFreq(uint32_t TIM2_TimerClockFreq)
 149                     ; 44 {
 150                     	switch	.text
 151  0010               _TIM2_ComputeLsiClockFreq:
 153  0010 520c          	subw	sp,#12
 154       0000000c      OFST:	set	12
 157                     ; 49   TIM2_ICInit(TIM2_Channel_1, TIM2_ICPolarity_Rising, TIM2_ICSelection_DirectTI, TIM2_ICPSC_DIV8, 0x0);
 159  0012 4b00          	push	#0
 160  0014 4b0c          	push	#12
 161  0016 4b01          	push	#1
 162  0018 5f            	clrw	x
 163  0019 cd0000        	call	_TIM2_ICInit
 165  001c 5b03          	addw	sp,#3
 166                     ; 52   TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
 168  001e ae0201        	ldw	x,#513
 169  0021 cd0000        	call	_TIM2_ITConfig
 171                     ; 55   TIM2_Cmd(ENABLE);
 173  0024 a601          	ld	a,#1
 174  0026 cd0000        	call	_TIM2_Cmd
 176                     ; 57   TIM2->SR1 = 0x00;
 178  0029 725f5256      	clr	21078
 179                     ; 58   TIM2->SR2 = 0x00;
 181  002d 725f5257      	clr	21079
 182                     ; 61   TIM2_ClearFlag(TIM2_FLAG_CC1);
 184  0031 ae0002        	ldw	x,#2
 185  0034 cd0000        	call	_TIM2_ClearFlag
 188  0037               L17:
 189                     ; 64   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
 191  0037 c65256        	ld	a,21078
 192  003a a402          	and	a,#2
 193  003c a102          	cp	a,#2
 194  003e 26f7          	jrne	L17
 195                     ; 67   ICValue1 = TIM2_GetCapture1();
 197  0040 cd0000        	call	_TIM2_GetCapture1
 199  0043 1f09          	ldw	(OFST-3,sp),x
 201                     ; 68   TIM2_ClearFlag(TIM2_FLAG_CC1);
 203  0045 ae0002        	ldw	x,#2
 204  0048 cd0000        	call	_TIM2_ClearFlag
 207  004b               L77:
 208                     ; 71   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
 210  004b c65256        	ld	a,21078
 211  004e a402          	and	a,#2
 212  0050 a102          	cp	a,#2
 213  0052 26f7          	jrne	L77
 214                     ; 74   ICValue2 = TIM2_GetCapture1();
 216  0054 cd0000        	call	_TIM2_GetCapture1
 218  0057 1f0b          	ldw	(OFST-1,sp),x
 220                     ; 75   TIM2_ClearFlag(TIM2_FLAG_CC1);
 222  0059 ae0002        	ldw	x,#2
 223  005c cd0000        	call	_TIM2_ClearFlag
 225                     ; 78   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 227  005f 7211525b      	bres	21083,#0
 228                     ; 80   TIM2->CCMR1 = 0x00;
 230  0063 725f5259      	clr	21081
 231                     ; 82   TIM2_Cmd(DISABLE);
 233  0067 4f            	clr	a
 234  0068 cd0000        	call	_TIM2_Cmd
 236                     ; 85   LSIClockFreq = (8 * TIM2_TimerClockFreq) / (ICValue2 - ICValue1);
 238  006b 1e0b          	ldw	x,(OFST-1,sp)
 239  006d 72f009        	subw	x,(OFST-3,sp)
 240  0070 cd0000        	call	c_uitolx
 242  0073 96            	ldw	x,sp
 243  0074 1c0001        	addw	x,#OFST-11
 244  0077 cd0000        	call	c_rtol
 247  007a 96            	ldw	x,sp
 248  007b 1c000f        	addw	x,#OFST+3
 249  007e cd0000        	call	c_ltor
 251  0081 a603          	ld	a,#3
 252  0083 cd0000        	call	c_llsh
 254  0086 96            	ldw	x,sp
 255  0087 1c0001        	addw	x,#OFST-11
 256  008a cd0000        	call	c_ludv
 258  008d 96            	ldw	x,sp
 259  008e 1c0005        	addw	x,#OFST-7
 260  0091 cd0000        	call	c_rtol
 263                     ; 86   return LSIClockFreq;
 265  0094 96            	ldw	x,sp
 266  0095 1c0005        	addw	x,#OFST-7
 267  0098 cd0000        	call	c_ltor
 271  009b 5b0c          	addw	sp,#12
 272  009d 81            	ret
 304                     ; 96 int main( void )
 304                     ; 97 {
 305                     	switch	.text
 306  009e               _main:
 310                     ; 98     CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, ENABLE);//开启蜂鸣器时钟门控
 312  009e ae0601        	ldw	x,#1537
 313  00a1 cd0000        	call	_CLK_PeripheralClockConfig
 315                     ; 99     CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);//需要TIM2输入捕获测量LSI频率，所以TIM2时钟门控也开启
 317  00a4 ae0001        	ldw	x,#1
 318  00a7 cd0000        	call	_CLK_PeripheralClockConfig
 320                     ; 101     BEEP_DeInit();//初始化蜂鸣器相关寄存器
 322  00aa cd0000        	call	_BEEP_DeInit
 324                     ; 102     BEEP_Cmd(DISABLE); //蜂鸣器配置前需禁能
 326  00ad 4f            	clr	a
 327  00ae cd0000        	call	_BEEP_Cmd
 329                     ; 104     CLK_BEEPClockConfig(CLK_BEEPCLKSource_LSI);//选择时钟源
 331  00b1 a602          	ld	a,#2
 332  00b3 cd0000        	call	_CLK_BEEPClockConfig
 334                     ; 105     BEEP_LSClockToTIMConnectCmd(ENABLE);//LSI芯片内部连接至TIM2，以便测量LSI频率
 336  00b6 a601          	ld	a,#1
 337  00b8 cd0000        	call	_BEEP_LSClockToTIMConnectCmd
 339                     ; 106     frq=TIM2_ComputeLsiClockFreq(2000000);//TIM2输入捕获测量LSI频率 
 341  00bb ae8480        	ldw	x,#33920
 342  00be 89            	pushw	x
 343  00bf ae001e        	ldw	x,#30
 344  00c2 89            	pushw	x
 345  00c3 cd0010        	call	_TIM2_ComputeLsiClockFreq
 347  00c6 5b04          	addw	sp,#4
 348  00c8 ae0000        	ldw	x,#_frq
 349  00cb cd0000        	call	c_rtol
 351                     ; 107     BEEP_LSClockToTIMConnectCmd(DISABLE);//LSI芯片内部连接至TIM2，以便测量LSI频率  
 353  00ce 4f            	clr	a
 354  00cf cd0000        	call	_BEEP_LSClockToTIMConnectCmd
 356                     ; 109     BEEP_LSICalibrationConfig(frq);//校准LSI
 358  00d2 be02          	ldw	x,_frq+2
 359  00d4 89            	pushw	x
 360  00d5 be00          	ldw	x,_frq
 361  00d7 89            	pushw	x
 362  00d8 cd0000        	call	_BEEP_LSICalibrationConfig
 364  00db 5b04          	addw	sp,#4
 365                     ; 111     BEEP_Init(BEEP_Frequency_1KHz);//设置鸣叫频率
 367  00dd 4f            	clr	a
 368  00de cd0000        	call	_BEEP_Init
 370                     ; 112     BEEP_Cmd(ENABLE);
 372  00e1 a601          	ld	a,#1
 373  00e3 cd0000        	call	_BEEP_Cmd
 375  00e6               L311:
 377  00e6 20fe          	jra	L311
 401                     	xdef	_main
 402                     	xdef	_TIM2_ComputeLsiClockFreq
 403                     	xdef	_Delay
 404                     	xdef	_frq
 405                     	xref	_TIM2_ClearFlag
 406                     	xref	_TIM2_ITConfig
 407                     	xref	_TIM2_GetCapture1
 408                     	xref	_TIM2_ICInit
 409                     	xref	_TIM2_Cmd
 410                     	xref	_CLK_PeripheralClockConfig
 411                     	xref	_CLK_BEEPClockConfig
 412                     	xref	_BEEP_LSICalibrationConfig
 413                     	xref	_BEEP_LSClockToTIMConnectCmd
 414                     	xref	_BEEP_Cmd
 415                     	xref	_BEEP_Init
 416                     	xref	_BEEP_DeInit
 417                     	xref.b	c_x
 436                     	xref	c_ludv
 437                     	xref	c_rtol
 438                     	xref	c_uitolx
 439                     	xref	c_llsh
 440                     	xref	c_ltor
 441                     	end
